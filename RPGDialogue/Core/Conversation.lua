-- The conversation controller: game events in, engine picks, UI out.
--
-- Rules it keeps (DESIGN.md §3.1, R4–R6):
--   * Blizzard's window is never hidden, closed or re-opened by us. It opens as usual,
--     ours appears in front of it (optionally fading it), and "Get on with it" just
--     closes ours.
--   * Never a full window in combat; the full window closes if combat starts.
--   * Repeat visits stay short (compact bar) unless the NPC has something new.
local _, ns = ...

local C = ns.Compat
local U = ns.Util
local L = ns.L
local W = ns.World
local Engine = ns.Engine
local Memory = ns.Memory
local Effects = ns.Effects
local Tokens = ns.Tokens
local Cond = ns.Conditions

local Conv = {}
ns.Conversation = Conv
Conv.session = nil

local STORY_TIERS = { major = true, quest = true }
Conv.LIVE_KEYS = { "form", "pet", "mounted", "stealthed", "auras" }

local FRAME_FOR_INTERACTION = {
  Merchant = "merchant", Trainer = "trainer", TaxiNode = "taxi", Banker = "bank",
  StableMaster = "stable", Auctioneer = "auction",
}

---------------------------------------------------------------------------
-- Who is this?
---------------------------------------------------------------------------
local function roleFromPatterns(text, patterns)
  if not text then return nil end
  local lower = text:lower()
  for _, pair in ipairs(patterns) do
    if lower:find(pair[1]) then return pair[2] end
  end
  return nil
end

function Conv.DetectRole(ctx, interactionName)
  local cap = ns.db and ctx.npcID and ns.db.capture.npcs[ctx.npcID]
  local role = roleFromPatterns(cap and cap.subtitle, W.SUBTITLE_ROLES)
  role = role or roleFromPatterns(ctx.npcSubtitle or nil, W.SUBTITLE_ROLES)
  role = role or (interactionName and W.INTERACTION_ROLES[interactionName])
  role = role or roleFromPatterns(ctx.npcName or nil, W.NAME_ROLES)
  -- Anyone else friendly who walks and talks is a citizen: townsfolk pools answer them, so
  -- the people in the streets can be spoken to too (0.35.0). Beasts and critters aren't.
  if not role and Conv.IsCitizen(ctx) then role = "citizen" end
  return role
end

local NOT_PEOPLE = { Beast = true, Critter = true, Mechanical = true, Elemental = true, ["Non-combat Pet"] = true, Totem = true, ["Not specified"] = true }
function Conv.IsCitizen(ctx)
  local unit = ctx and ctx.unit
  if not unit then return false end
  local reaction = ctx.npcReaction
  if type(reaction) == "number" and reaction < 4 then return false end
  local ctype = C.CreatureType(unit)
  if ctype and NOT_PEOPLE[ctype] then return false end
  return true
end

function Conv.Identify(unit, ctx, interactionName)
  if not C.Exists(unit) or C.IsPlayer(unit) then return nil end
  -- Make sure this zone's pack is in before deciding who this is (a missed zone event
  -- would otherwise leave named NPCs speaking from the role pools).
  if ns.Packs.zoneIndex and not C.InCombat() then ns.Packs.LoadForZone() end
  local npcID = ctx.npcID or nil
  local name = ctx.npcName or nil
  if not npcID and not name then return nil end
  local info = { npcID = npcID, unitName = name, subtitle = ctx.npcSubtitle or nil }
  local def = ns.Data.FindNPC(npcID, name)
  if def then
    info.def = def
    info.key = def.key
    info.name = def.name or name
    info.role = def.role
    info.tier = def.tier or "quest"
    info.communities = def.communities or {}
    info.subtitle = def.title or info.subtitle
  else
    info.pooled = true
    info.name = name
    info.role = Conv.DetectRole(ctx, interactionName)
    info.tier = "pooled"
    local comm = ns.Data.CommunityForPlace(ctx.zone, ctx.subzone)
    info.communities = comm and { comm } or {}
    -- A role pool with its own conversation tree speaks as one shared character:
    -- every spirit healer seems to know your file.
    local tree = ns.Data.TreePoolFor(info, ctx)
    if tree then
      info.def = tree
      info.key = "pool:" .. tree.id
      info.tier = tree.tier or "major"
    end
  end
  return info
end

-- The node to show: the NPC's own, or (for pooled NPCs) one assembled from pools.
function Conv.Node(info, nodeId, ctx)
  if info.def and info.def.nodes and info.def.nodes[nodeId] then return info.def.nodes[nodeId] end
  local node = { lines = {} }
  for _, p in ipairs(ns.Data.PoolsFor(info, ctx)) do
    if p.pool.choices then node.choices = p.pool.choices; break end
  end
  if not node.choices then
    for _, g in ipairs(ns.Data.GenericFor(ctx)) do
      if g.choices then node.choices = g.choices; break end
    end
  end
  node.choices = node.choices or { { text = L.FAREWELL, next = "END" } }
  return node
end

---------------------------------------------------------------------------
-- Session lifecycle
---------------------------------------------------------------------------
local function otherAddonMode()
  return ns.Integrations and ns.Integrations.Mode() or "normal"
end

-- Where a conversation is drawn: our box, or (with DialogueUI, by default) inside
-- DialogueUI's own window (Integrations/DialogueUIView.lua). Both take the same calls.
function Conv.View(s)
  s = s or Conv.session
  if s and s.view == "dui" and ns.UI.DUIView then return ns.UI.DUIView end
  return ns.UI.Dialogue
end
local View = Conv.View

-- DialogueUI couldn't show the conversation after all: move it to the box, over its window.
function Conv.FallbackToBox(v)
  local s = Conv.session
  if not s or s.ended or s.view ~= "dui" or s.mode ~= "full" then return end
  s.view = nil
  ns.UI.DUIView.Release()
  local frame = Conv.BlizzardFrame(s)
  s.blizz = frame
  if frame and ns.db.settings.fadeDefault then
    C.SetFaded(frame, true)
    s.faded = true
    ns.UI.Blocker.Cover(frame)
  end
  if v then ns.UI.Dialogue.Show(v) end
end

-- Show a page in the session's view; if DialogueUI can't take it after all, use the box.
local function present(s, v)
  if s.view == "dui" and ns.UI.DUIView.Show(v) == false then
    s.view = nil
    local frame = Conv.BlizzardFrame(s)
    s.blizz = frame
    if frame and ns.db.settings.fadeDefault then
      C.SetFaded(frame, true)
      s.faded = true
      ns.UI.Blocker.Cover(frame)
    end
  end
  if s.view ~= "dui" then ns.UI.Dialogue.Show(v) end
end

function Conv.BlizzardFrame(session)
  session = session or Conv.session
  if not session then return nil end
  local kind = session.kind == "gossip" and "gossip" or (session.kind == "quest" and "quest")
    or FRAME_FOR_INTERACTION[session.interaction or ""]
  if not kind then
    local shown, k = C.AnyInteractionFrameShown()
    if shown then kind = k end
  end
  if not kind then return nil end
  local f = C.BlizzardFrame(kind)
  if f and f:IsShown() then return f, kind end
  return nil
end

-- Marks a picked line as shown: memory, pacing budgets, its own effects.
function Conv.Shown(winner)
  local s = Conv.session
  if not winner or not s then return end
  Memory.MarkSeen(winner.gid, winner.line)
  for sys in pairs(winner.systems or {}) do ns.Pacing.Use(sys, s.env) end
  if winner.line.fx then Effects.Apply(winner.line.fx, s.env) end
  if winner.line.journal and not winner.line._thread then Effects.Journal(winner.line.journal, s.ctx, s.env) end
  if winner.line._thread and ns.Threads then ns.Threads.Heard(winner.line, s.env) end
end

function Conv.Start(kind, unit, interactionName)
  if not ns.db or not ns.char or not ns.db.settings.enabled then return end
  local mode = otherAddonMode()
  if mode == "off" then return end
  local guid = C.GUID(unit)
  if not guid then return end
  local s = Conv.session
  if s and s.guid == guid and not s.ended then
    -- Same NPC, interaction continuing (gossip -> vendor, gossip -> quest details).
    if kind == "talk" then
      if s.mode ~= "full" then Conv.OpenFull("talk") end
      return
    end
    local wasTalk = s.kind == "talk"
    s.kind = kind
    s.interaction = interactionName or s.interaction
    if s.mode == "compact" then ns.UI.Compact.Reanchor(Conv.BlizzardFrame(s)) end
    if wasTalk and s.mode == "full" then
      -- A right-click opened the box, then the game's own window arrived (slow server, or
      -- an NPC we didn't know had a menu): keep the conversation and add their options.
      if s.ticker then s.ticker:Cancel(); s.ticker = nil end
      local frame = Conv.BlizzardFrame(s)
      s.blizz = frame
      if frame and ns.db.settings.fadeDefault then
        C.SetFaded(frame, true)
        s.faded = true
        ns.UI.Blocker.Cover(frame)
      end
      if s.nodeDef then View(s).SetChoices(Conv.BuildChoices(s.nodeDef, s.node == ((s.info.def and s.info.def.start) or "hello"))) end
    end
    -- An option picked in the box led to the game's next page: show it in the box too.
    -- A vendor, trainer, flight map or bank opens its own window as usual.
    if s.mode == "full" and s.following then
      if kind == "service" then Conv.HandOver()
      elseif kind == "gossip" or kind == "quest" then Conv.ShowGamePage(kind) end
    end
    return
  end
  if s then Conv.Finish() end

  local ctx = ns.Context.New({ unit = unit })
  local info = Conv.Identify(unit, ctx, interactionName)
  if not info or (info.pooled and kind ~= "talk" and #ns.Data.PoolsFor(info, ctx) == 0) then
    -- Nobody we have lines for: still show their menu in the box, not the game's.
    return Conv.StartMenuOnly(kind, unit, ctx, guid, mode)
  end
  -- As a ghost, only the spirit-sensitive answer.
  if C.IsGhost() and info.role ~= "spirithealer" and not (info.def and info.def.spiritSensitive) then return end

  ns.char.conversations = (ns.char.conversations or 0) + 1
  local memKey = Memory.Key(info)
  local mem = Memory.Begin(memKey, info)
  local env = Engine.NewEnv(info, ctx, mem)
  Effects.Drift(env.now)
  if kind == "gossip" then
    for _, q in ipairs(C.GossipQuests()) do
      if q.title and q.questID then env.titleToID[U.Norm(q.title)] = q.questID end
    end
  end

  local prevNodes = {}
  for id in pairs(mem.nodes or {}) do prevNodes[id] = true end
  s = {
    guid = guid, unit = unit, kind = kind, interaction = interactionName, info = info, ctx = ctx,
    mem = mem, memKey = memKey, env = env, started = env.now, prevNodes = prevNodes, visited = {},
  }
  Conv.session = s

  local full, reason = Conv.DecideFull(s, mode)
  s.reason = reason
  if full == nil then s.mode = "none"; return end

  -- A story NPC with a noticing moment due gets the full window.
  if not full and mode == "normal" and not C.InCombat() then
    local notice = Engine.PickNotice(info, ctx, env)
    s.pendingNotice = notice or false
    if notice and STORY_TIERS[info.tier] then full, s.reason = true, "noticing moment" end
  end

  if full then Conv.OpenFull(s.reason) else Conv.OpenCompact() end
end

-- An NPC (or a quest board) we have no lines for: their quests and options in the box, so
-- the game's menu doesn't flash up between our conversations. Nothing is remembered.
function Conv.StartMenuOnly(kind, unit, ctx, guid, mode)
  local settings = ns.db.settings
  if kind ~= "gossip" and kind ~= "quest" then return end
  if mode ~= "normal" or settings.pagesInBox == false or settings.openMode == "skip" then return end
  if C.InCombat() or ns.Integrations.InsideDialogueUI() then return end
  local s = {
    guid = guid, unit = unit, kind = kind, ctx = ctx, menuOnly = true, following = true, mode = "full", env = {},
    reason = "no lines for this NPC: their menu in the box",
    info = { name = ctx.npcName or "", subtitle = ctx.npcSubtitle },
    started = C.Now(),
  }
  Conv.session = s
  ns.UI.Compact.Hide()
  if kind == "gossip" and #C.GossipQuests() == 0 and #C.GossipOptions() == 0 and (C.GossipText() or "") == "" then
    Conv.session = nil
    return
  end
  Conv.ShowGamePage(kind)
end

-- true = full, false = compact, nil = show nothing. Second value: reason (for /why).
function Conv.DecideFull(s, mode)
  local settings = ns.db.settings
  if s.kind == "talk" then return true, "talk" end
  if C.InCombat() then return false, "combat" end
  if mode == "stepback" then return false, "another dialogue addon is in charge" end
  if settings.openMode == "full" then return true, "setting: always full" end
  local first = (s.mem.times or 0) == 0
  if first and s.info.def then return true, "first meeting" end
  local news, gid = Engine.HasNews(s.info, s.ctx, s.env)
  if news then return true, "something new: " .. tostring(gid) end
  if settings.openMode == "skip" then return nil, "setting: skip to business" end
  return false, "nothing new"
end

-- Optional tooltip marker (off by default, it spoils discovery): does this NPC have
-- something new to say? Read-only: no memory, pacing or seen-state changes.
-- Cached per NPC for 15 seconds, since tooltips refresh constantly.
local markCache = {}
function Conv.HasSomethingNew(unit)
  if not ns.db or not ns.db.settings.newMarker or C.InCombat() then return false end
  if Conv.session and not Conv.session.ended then return false end
  local guid = C.GUID(unit)
  if not guid then return false end
  local now = C.Now()
  local hit = markCache[guid]
  if hit and now - hit.t < 15 then return hit.v end
  local v = false
  local ctx = ns.Context.New({ unit = unit })
  local info = Conv.Identify(unit, ctx)
  if info and info.def then
    local mem = Memory.Get(Memory.Key(info))
    if mem and (mem.times or 0) > 0 then
      v = Engine.HasNews(info, ctx, Engine.NewEnv(info, ctx, mem)) and true or false
    end
  end
  markCache[guid] = { t = now, v = v }
  return v
end

function Conv.ClearMarkCache() markCache = {} end

ns.OnLogin(function()
  C.OnUnitTooltip(function(tooltip, unit)
    if Conv.HasSomethingNew(unit) then
      local p = ns.UI.Theme.Palette()
      local c = p.name or { 1, 0.82, 0 }
      C.TooltipAddLine(tooltip, L.TOOLTIP_NEW, c[1], c[2], c[3])
    end
  end)
end)
ns.Listen("CONVERSATION_OPENED", function() Conv.ClearMarkCache() end)

function Conv.OpenFull(reason)
  local s = Conv.session
  if not s or s.menuOnly then return end
  if C.InCombat() then ns.Print(L.COMBAT_LATER); return end
  s.mode = "full"
  s.reason = reason or s.reason
  ns.UI.Compact.Hide()
  local frame = Conv.BlizzardFrame(s)
  s.blizz = frame
  -- With DialogueUI (default), the conversation is drawn inside its window instead.
  if s.kind ~= "talk" and ns.Integrations.InsideDialogueUI() and ns.UI.DUIView.Available() then
    s.view = "dui"
  elseif frame and ns.db.settings.fadeDefault then
    C.SetFaded(frame, true)
    s.faded = true
    ns.UI.Blocker.Cover(frame)
  end
  -- Snapshot the states live reactions watch, so a change after this moment is seen.
  for _, k in ipairs(Conv.LIVE_KEYS) do local _ = s.ctx[k] end
  local start = (s.info.def and s.info.def.start) or "hello"
  Conv.ShowNode(start)
  ns.Fire("CONVERSATION_OPENED", s)
end

-- DialogueUI shows its window a moment after the game's event, so usually after our box
-- opened: take it under the box then, the way we fade the game's own window.
function Conv.OnOtherWindowShown(frame)
  local s = Conv.session
  if not s or s.ended or s.mode ~= "full" then return end
  if s.view == "dui" then ns.UI.DUIView.Refresh(); return end
  if not ns.UI.Dialogue.IsShown() then return end
  if s.faded and s.blizz == frame then return end
  s.blizz = frame
  if ns.db.settings.fadeDefault then
    C.SetFaded(frame, true)
    s.faded = true
    ns.UI.Blocker.Cover(frame)
  end
end
ns.OnLogin(function()
  C.OnDialogueUIShow(function(frame) Conv.OnOtherWindowShown(frame) end)
end)

-- Is the box up over DialogueUI's waiting window?
function Conv.OverOtherWindow()
  local s = Conv.session
  return s ~= nil and s.faded == true and s.blizz ~= nil and s.blizz == C.DialogueUIFrame()
end

local function restoreBlizzard(s)
  if s and s.faded then
    C.SetFaded(s.blizz, false)
    s.faded = false
  end
  ns.UI.Blocker.Uncover()
end

-- Hand the visit to the game's own window (already open underneath): a vendor, trainer,
-- flight map or bank, DialogueUI, combat, or a page the box can't answer.
function Conv.HandOver()
  local s = Conv.session
  if not s then return end
  s.following = nil
  View(s).Hide()
  if ns.UI.AskAbout then ns.UI.AskAbout.Hide() end
  restoreBlizzard(s)
  if s.kind == "talk" or not Conv.BlizzardFrame(s) then
    Conv.Finish()
  else
    s.mode = "business"
  end
end

-- What a gossip option is for: a service (vendor, trainer, flight, inn, bank, stable,
-- auction) or talk. The icon decides when the game says which it is; the words otherwise.
local SERVICE_WORDS = {
  { "binder", { "inn your home", "make this", "home" } },
  { "trainer", { "train", "teach" } },
  { "taxi", { "fly", "flight", "ride" } },
  { "banker", { "deposit", "bank" } },
  { "stable", { "stable" } },
  { "auction", { "auction" } },
  { "vendor", { "browse", "goods", "buy", "wares", "sell", "trade" } },
}
-- What a reply the NPC's writer marked BUSINESS asks for, from its words.
local WANT_WORDS = {
  { "binder", { "room", "home", "bed", "stay" } },
  { "trainer", { "train", "teach", "learn", "lesson" } },
  { "taxi", { "fly", "flight", "ride" } },
  { "stable", { "stable" } },
  { "banker", { "bank", "deposit", "vault" } },
  { "vendor", { "see", "show", "buy", "browse", "wares", "look", "pour", "drink", "meal", "food", "cuts", "sell", "stock", "goods" } },
}
local ROLE_SERVICE = {
  vendor = "vendor", blacksmith = "vendor", innkeeper = "vendor", trainer = "trainer",
  flightmaster = "taxi", stablemaster = "stable", banker = "banker", auctioneer = "auction",
}

local function wordsKind(text, table_)
  local lower = (text or ""):lower()
  for _, pair in ipairs(table_) do
    for _, w in ipairs(pair[2]) do
      if lower:find(w, 1, true) then return pair[1] end
    end
  end
  return nil
end

function Conv.OptionKind(o)
  if type(o.kind) == "string" and o.kind ~= "gossip" then return o.kind end
  local byIcon = C.GossipServiceIcons()[o.icon or false]
  if byIcon then return byIcon end
  if o.kind == "gossip" then return nil end
  return wordsKind(o.name, SERVICE_WORDS)
end

-- The one gossip option a "get on with it" (or a reply like "Show me your wares.") should
-- pick straight away, so the game opens the vendor or trainer without its menu first.
function Conv.ServiceOption(s, hint)
  if C.InCombat() then return nil end
  local options = C.GossipOptions()
  local services = {}
  for _, o in ipairs(options) do
    local kind = Conv.OptionKind(o)
    if kind then services[#services + 1] = { id = o.id, kind = kind } end
  end
  if #services == 0 then return nil end
  local want = (hint and wordsKind(hint, WANT_WORDS)) or ROLE_SERVICE[s.info.role or ""]
  if want then
    for _, o in ipairs(services) do if o.kind == want then return o end end
  end
  if #services == 1 and #options == 1 and #C.GossipQuests() == 0 then return services[1] end
  return nil
end

-- "Get on with it" (and replies that lead to business): stay in the box where we can.
-- A service window (vendor, trainer, flights) opens straight away; otherwise the NPC's
-- menu (quests, options) is shown in the box; with nothing left to show, the visit ends.
-- The game's own menu only comes back with pages in the box turned off, inside DialogueUI,
-- or in combat.
function Conv.Business(hint)
  local s = Conv.session
  if not s then return end
  if s.view == "dui" or Conv.OverOtherWindow() or not Conv.KeepPages(s) or s.mode ~= "full" then
    return Conv.HandOver()
  end
  local _, kind = Conv.BlizzardFrame(s)
  if kind ~= "gossip" and kind ~= "quest" then return Conv.HandOver() end
  if s.page then return Conv.End() end   -- already on the menu: this row says goodbye
  if kind == "gossip" then
    local opt = Conv.ServiceOption(s, hint)
    if opt then
      s.following = true
      C.SelectGossip(opt.id)
      return
    end
    if #Conv.GameOptions(s, true) == 0 then return Conv.End() end
  end
  Conv.ShowGamePage(kind)
end

-- The box's close button, Escape and the gamepad's B: the visit ends, as in the game.
function Conv.Close()
  local s = Conv.session
  if not s then return end
  if s.view == "dui" or Conv.OverOtherWindow() then return Conv.HandOver() end
  Conv.End()
end

-- End the conversation and the interaction.
function Conv.End()
  local s = Conv.session
  if not s then return end
  local _, kind = Conv.BlizzardFrame(s)
  Conv.Finish()
  if kind then C.CloseInteraction(kind) end
end

function Conv.Finish()
  local s = Conv.session
  if not s or s.ended then Conv.session = nil; return end
  s.ended = true
  if s.ticker then s.ticker:Cancel() end
  if s.mem then Memory.End(s.mem, s.lastLine) end
  if s.memKey and ns.Kin then ns.Kin.Met(s.memKey); ns.Kin.Stamp() end
  restoreBlizzard(s)
  View(s).Hide()
  if s.view == "dui" then ns.UI.Dialogue.Hide() end
  ns.UI.Compact.Hide()
  if ns.UI.AskAbout then ns.UI.AskAbout.Hide() end
  if ns.db.settings.tts then C.StopSpeaking() end
  Conv.session = nil
  ns.Fire("CONVERSATION_ENDED", s)
end

---------------------------------------------------------------------------
-- Showing things
---------------------------------------------------------------------------
local HINTS = {
  light = { "Light", "Shadow" }, order = { "Order", "Wild" }, honor = { "Honor", "Cunning" },
}

-- Optional alignment hint, from the choice's strongest alignment shift ("[Light]").
local function alignHint(choice)
  local align = choice.fx and choice.fx.align
  if not align then return nil end
  local best, bestMag
  for axis, d in pairs(align) do
    if HINTS[axis] and d ~= 0 and (not bestMag or math.abs(d) > bestMag) then best, bestMag = axis, math.abs(d) end
  end
  if not best then return nil end
  return align[best] > 0 and HINTS[best][1] or HINTS[best][2]
end
Conv.AlignHint = alignHint

-- Slurred replies when drunk (cosmetic).
function Conv.Slur(text, level, seed)
  if (level or 0) < 2 then return text end
  local rng = U.NewRNG(U.Hash(text, seed or 0))
  text = text:gsub("s", "sh"):gsub("S", "Sh")
  if level >= 3 or rng.next() < 0.5 then
    text = text:gsub("(%a+)", function(w) if rng.next() < 0.12 then return w .. " *hic*" end end, 2)
  end
  return text
end

-- Identity tags (0.34.0), Baldur's Gate style: a reply that's there because of who the
-- player is says so: [Priest], [Human Priest], [Dwarf], [Alchemy], [Kind], or the origin.
-- Read from the reply's own conditions (top level or inside `all`), never from `any` or
-- `not`, and only what the player actually is (so a list of classes shows the player's).
local function traitName(t)
  return L["TRAIT_" .. tostring(t):upper()] or (tostring(t):gsub("^%l", string.upper))
end

function Conv.IdentityTag(when, ctx)
  if type(when) ~= "table" then return nil end
  local found = {}
  local function scan(w)
    for k, v in pairs(w) do
      if k == "all" and type(v) == "table" then
        for _, sub in ipairs(v) do if type(sub) == "table" then scan(sub) end end
      elseif k == "class" or k == "race" or k == "origin" or k == "profession" or k == "trait" then
        found[k] = found[k] or v
      end
    end
  end
  scan(when)
  local race = found.race and ctx.raceName
  local class = found.class and ctx.className
  if race and class then return race .. " " .. class end
  if class then return class end
  if race then return race end
  if found.origin then
    local o = ns.Origins and ns.char.origin and ns.Origins.Find(ns.char.origin.id)
    if o then return o.tag or o.name end
  end
  if found.profession then
    local v = found.profession
    return type(v) == "string" and v or (v.name or v[1])
  end
  if found.trait then
    local v = found.trait
    if type(v) == "table" then
      for _, t in ipairs(ns.Effects.DominantTraits()) do
        for _, want in ipairs(v) do if want == t then return traitName(t) end end
      end
      return nil
    end
    return traitName(v)
  end
  return nil
end

local function choiceLabel(entry)
  local choice = entry.choice
  local text = choice.text or "..."
  local tags = ns.db.settings.tags
  if choice.tag and tags ~= "never" and (tags == "always" or not entry.locked) and not text:find("^%[") then
    text = "[" .. choice.tag .. "] " .. text
  elseif not choice.tag and tags ~= "never" and ns.db.settings.identityTags ~= false and not entry.locked
    and not text:find("^%[") then
    local s = Conv.session
    local tag = s and Conv.IdentityTag(choice.when, s.ctx)
    if tag then text = "[" .. tag .. "] " .. text end
  end
  if ns.db.settings.alignHints then
    local hint = alignHint(choice)
    if hint then text = text .. " [" .. hint .. "]" end
  end
  return text
end

-- A reply's own answer from the NPC (choice.reply, 0.82.0): a string, or a list of
-- { text, when } where the first whose conditions pass is said.
function Conv.ReplyText(choice, ctx, env)
  local r = choice and choice.reply
  if type(r) == "string" then return Tokens.Render(r, ctx, env) end
  if type(r) == "table" then
    for _, line in ipairs(r) do
      if type(line) == "table" and line.text and (not line.when or Cond.Eval(line.when, ctx, env)) then
        return Tokens.Render(line.text, ctx, env, line.when)
      end
    end
  end
  return nil
end

-- The NPC answers a reply that ends the visit: their answer, then a single farewell.
function Conv.ShowReplyEnd(text)
  local s = Conv.session
  if not s then return end
  local info = s.info
  local linked = Conv.Hear(text)
  Conv.Log("npc", text)
  local said = s.said
  s.said = nil
  s.choiceEntries = { { choice = { text = L.FAREWELL, next = "END" } } }
  present(s, {
    name = info.name, subtitle = info.subtitle, unit = s.unit,
    text = text, linkedText = linked, choices = { { text = L.FAREWELL } },
    said = (ns.db.settings.echoReply ~= false) and said or nil,
    canAsk = ns.Topics and ns.Topics.Any(), askCount = ns.Topics and ns.Topics.Count(),
    disposition = Conv.DispositionView(s),
  })
  if ns.db.settings.tts then Conv.Speak(s, text) end
end

function Conv.ShowNode(nodeId, reply)
  local s = Conv.session
  if not s then return end
  local info, ctx, env = s.info, s.ctx, s.env
  local node = Conv.Node(info, nodeId, ctx)
  s.node = nodeId
  s.nodeDef = node
  s.visited = s.visited or {}
  local returning = s.visited[nodeId]
  s.visited[nodeId] = true
  if s.mem then
    s.mem.nodes = s.mem.nodes or {}
    s.mem.nodes[nodeId] = true
  end
  local startId = (info.def and info.def.start) or "hello"
  -- "BACK" returns to the last hub: the start node, or a node marked hub = true.
  if nodeId == startId or node.hub then s.hub = nodeId end

  local winner
  -- A rotating node (a story told, a question asked) draws a fresh line every visit.
  if reply and returning then
    winner = nil   -- their answer to your reply stands in for the "anything else?" line
  elseif returning and not node.rotating then
    winner = Engine.PickAgain(info, nodeId, ctx, env)
  else
    winner = Engine.PickLine(info, nodeId, ctx, env, node.big)
  end
  local main = winner and Tokens.Render(winner.line.text, ctx, env, winner.line.when) or L.FALLBACK_LINE
  if reply then main = winner and (reply .. "\n\n" .. main) or reply end
  Conv.Shown(winner)
  s.lastLine = winner and winner.gid or s.lastLine

  -- Noticing moment: only on the first node, at most once per conversation.
  local before, after
  local isStart = nodeId == startId
  if isStart and not s.noticeDone then
    s.noticeDone = true
    local notice = s.pendingNotice
    if notice == nil then notice = Engine.PickNotice(info, ctx, env) end
    s.pendingNotice = nil
    if notice then
      Engine.UseNotice(notice, info, env)
      Conv.Shown(notice)
      local text = Tokens.Render(notice.line.text, ctx, env, notice.line.when)
      local place = notice.line.place or "before"
      if place == "replace" then main = text
      elseif place == "after" then after = text
      else before = text end
    end
  end

  -- Innkeepers (and other listed roles) may pass on a rumor on the first node.
  if isStart and not s.rumorDone and ns.Rumors and ns.Rumors.Due(info, env) then
    s.rumorDone = true
    local rumor = Engine.PickRumor(info, ctx, env)
    if rumor then
      Conv.Shown(rumor)
      ns.Rumors.Used(info, env)
      local text = Tokens.Render(rumor.line.text, ctx, env, rumor.line.when)
      after = after and (after .. "\n\n" .. text) or text
    end
  end

  local body = main
  if before then body = before .. "\n\n" .. body end
  if after then body = body .. "\n\n" .. after end

  -- Topics named in what they said are learned, and linked in the box (Morrowind-style).
  local linked = Conv.Hear(body)

  local Ins = ns.Insanity
  if Ins then
    local scrambled = Ins.Scramble(body, nil, env.seed)
    if scrambled ~= body then body, linked = scrambled, nil end
  end

  s.page = nil
  Conv.Log("npc", body)
  local said = s.said
  s.said = nil
  present(s, {
    name = Ins and Ins.Name(info.name, env.seed) or info.name, subtitle = info.subtitle, unit = s.unit,
    text = body, linkedText = linked, choices = Conv.BuildChoices(node, isStart),
    said = (ns.db.settings.echoReply ~= false) and said or nil,
    lineGid = winner and winner.gid, canAsk = ns.Topics and ns.Topics.Any(),
    askCount = ns.Topics and ns.Topics.Count(), disposition = Conv.DispositionView(s),
  })
  if ns.db.settings.tts then Conv.Speak(s, body) end
end

-- Read a page aloud in a voice that fits the speaker (see Compat's text to speech).
function Conv.Speak(s, text)
  if not ns.db.settings.tts then return end
  local gender = s.unit and C.Exists(s.unit) and C.Sex(s.unit) or (s.info and s.info.gender)
  C.Speak(text, gender)
end
C.TTSEvents(ns.On)

-- Choices for a node: errands (first node only), the node's own, and (when insanity is
-- strong) an intrusive extra. At most Engine.MAX_CHOICES.
function Conv.BuildChoices(node, isStart)
  local s = Conv.session
  local ctx, env = s.ctx, s.env
  local entries = {}
  if isStart and ns.Errands then
    for _, e in ipairs(ns.Errands.ChoicesFor(s.info, ctx, env)) do
      entries[#entries + 1] = { choice = { text = e.text }, errand = e.errand, action = e.action }
    end
  end
  -- Explored in an earlier conversation: what was shown then, not counting this one.
  local explored = {}
  for id in pairs(s.prevNodes or {}) do explored[id] = true end
  local hubs, rotating = { [(s.info.def and s.info.def.start) or "hello"] = true }, {}
  for id, n in pairs((s.info.def and s.info.def.nodes) or {}) do
    if n.hub then hubs[id] = true end
    if n.rotating then rotating[id] = true end
  end
  local stances = s.mem and s.mem.stances
  local opts = { visited = s.visited, explored = explored, hubs = hubs, rotating = rotating, stance = stances and stances[s.node] }
  for _, e in ipairs(Engine.Choices(node, ctx, env, opts)) do
    if #entries < Engine.MAX_CHOICES then entries[#entries + 1] = e end
  end
  local intrusive = ns.Insanity and ns.Insanity.IntrusiveChoice(env.seed + #entries)
  if intrusive and #entries < Engine.MAX_CHOICES then
    entries[#entries + 1] = { choice = { text = intrusive }, intrusive = true }
  end
  local firstGame = true
  for _, e in ipairs(Conv.GameOptions(s)) do
    e.firstGame = firstGame
    firstGame = false
    entries[#entries + 1] = e
  end
  s.choiceEntries = entries
  local choices = {}
  for i, entry in ipairs(entries) do
    if entry.game then
      choices[i] = { text = entry.choice.text, game = true, gap = entry.firstGame and i > 1, icon = entry.choice.icon }
    else
      choices[i] = {
        text = Conv.Slur(choiceLabel(entry), ctx.drunk, env.seed + i),
        locked = entry.locked, special = entry.choice and Engine.IsSpecial(entry.choice),
        explored = entry.explored,
      }
    end
  end
  return choices
end

-- This visit's exchange, oldest first (the box's history button, 0.61.0).
function Conv.Log(who, text)
  local s = Conv.session
  if not s or not text or text == "" then return end
  s.log = s.log or {}
  s.log[#s.log + 1] = { who = who, text = text }
  if #s.log > 40 then table.remove(s.log, 1) end
end

function Conv.Choose(index)
  local s = Conv.session
  if not s or s.mode ~= "full" then return end
  local entry = s.choiceEntries and s.choiceEntries[index]
  if not entry or entry.locked then return end
  if entry.errand then
    local text = Tokens.Render(ns.Errands.Act(entry.errand, entry.action, s.env) or "", s.ctx, s.env)
    Conv.Log("you", entry.choice.text)
    Conv.Log("npc", text)
    View(s).ShowAnswer(text)
    View(s).SetChoices(Conv.BuildChoices(s.nodeDef, false))
    return
  end
  if entry.intrusive then
    View(s).ShowAnswer(L.INSANITY_RESPONSE)
    return
  end
  if entry.action then
    -- An answer on one of the game's pages shown in the box (accept, hand in, reward...).
    if entry.action == "handover" then Conv.HandOver(); return end
    if entry.action == "pick" then Conv.PickReward(entry.arg); return end
    if entry.action == "reward" and ns.db.settings.sounds then C.PlaySound("IG_QUEST_LIST_COMPLETE") end
    s.following = true
    C.QuestAnswer(entry.action, entry.arg)
    return
  end
  if entry.game then
    local g = entry.game
    if Conv.KeepPages(s) then
      -- Stay in the box: the game's next page (gossip, quest) is shown here when it comes.
      s.following = true
      if g.kind == "reveal" then Conv.ShowGamePage("quest"); return end
    elseif s.view == "dui" then
      -- Inside DialogueUI: its own pages take over from here.
      ns.UI.DUIView.Release()
      s.mode = "business"
    else
      -- Hand over to the game's window first, then pick the option there.
      Conv.HandOver()
    end
    if g.kind == "gossipQuest" then
      C.SelectGossipQuest(g.questID, g.active)
    elseif g.kind == "greetingQuest" then
      C.SelectGreetingQuest(g.index, g.active)
    elseif g.kind == "gossipOption" then
      C.SelectGossip(g.id)
    end
    return
  end
  local choice = entry.choice
  local env, ctx = s.env, s.ctx
  local fx, nextId, journal = choice.fx, choice.next, choice.journal

  local checkResult
  if Engine.IsSpecial(choice) then
    local success = Engine.CheckChoice(choice, ctx, env)
    checkResult = success
    local checks = s.mem.checks or {}
    s.mem.checks = checks
    checks[s.node .. ":" .. index] = { t = env.now, ok = success, tag = choice.tag }
    if not success and choice.fail then
      fx, nextId = choice.fail.fx, choice.fail.next or nextId
      journal = choice.fail.journal or journal
    end
  end

  -- Alignment comes only from a stance (a statement, not a question), once per node.
  if type(fx) == "table" and fx.align then
    local stances = s.mem.stances or {}
    s.mem.stances = stances
    if not Engine.IsStance(choice) or stances[s.node] then
      local copy = {}
      for k, v in pairs(fx) do if k ~= "align" then copy[k] = v end end
      fx = copy
    end
    if Engine.IsStance(choice) then stances[s.node] = stances[s.node] or choice.text end
  end
  local dispBefore = ns.Disposition and ns.Disposition.For(env, ctx)
  env.said = ((choice.text or ""):gsub("^%[[^%]]*%]%s*", ""))   -- kept with an opinion for the journal (0.80.0)
  Effects.Apply(fx, env)
  env.said = nil
  Effects.Journal(journal, ctx, env)
  s.pendingNote = Conv.ChoiceNote(choice, checkResult, fx, dispBefore)
  -- Word gets around (0.67.0): the rest of their town hears what you did.
  local town = s.info and s.info.communities and s.info.communities[1]
  local kind = ns.Towns and town and ns.Towns.WordKind(choice, checkResult, fx)
  if kind then
    ns.Towns.Word(town, kind, s.info, env.now or C.Now())
    s.wordTold = s.wordTold or {}
    if ns.Towns.WORD_NOTE[kind] and not s.wordTold[town] and ns.db.settings.approval ~= false then
      s.wordTold[town] = true
      local t = ns.Data.towns[town]
      local line = L.WORD_SPREADS:format(t and t.name or town)
      s.pendingNote = s.pendingNote and (s.pendingNote .. "  " .. line) or line
    end
  end
  -- What you said, shown quietly above their answer (authored [tags] left off).
  s.said = (choice.text or ""):gsub("^%[[^%]]*%]%s*", "")
  Conv.Log("you", s.said)

  if nextId == "BUSINESS" then
    s.pendingNote = nil
    Conv.Business(choice.text)
  elseif nextId == "BACK" then
    Conv.ShowNode(s.hub or (s.info.def and s.info.def.start) or "hello", Conv.ReplyText(choice, ctx, env))
    Conv.ShowPendingNote()
  elseif nextId == nil or nextId == "END" then
    local answer = Conv.ReplyText(choice, ctx, env)
    if answer then
      Conv.ShowReplyEnd(answer)
      Conv.ShowPendingNote()
    else
      s.pendingNote = nil
      Conv.End()
    end
  else
    Conv.ShowNode(nextId, Conv.ReplyText(choice, ctx, env))
    Conv.ShowPendingNote()
  end
end

-- What a reply did, said quietly under the answer (0.34.0): a check's result, and how the
-- NPC took it (approval, Dragon Age style), with their new disposition when it changes tier.
function Conv.ChoiceNote(choice, checkResult, fx, dispBefore)
  local s = Conv.session
  local settings = ns.db.settings
  local notes = {}
  if checkResult ~= nil and settings.checkResults ~= false then
    notes[#notes + 1] = (checkResult and L.CHECK_PASSED or L.CHECK_FAILED):format(L["TAG_" .. choice.tag:upper()] or choice.tag)
  end
  local d = type(fx) == "table" and fx.affinity
  if d and d ~= 0 and settings.approval ~= false and s then
    local name = s.info.name or ""
    local key = d >= 2 and "APPROVE_MUCH" or (d > 0 and "APPROVE" or (d <= -2 and "DISAPPROVE_MUCH" or "DISAPPROVE"))
    notes[#notes + 1] = L[key]:format(name)
    if dispBefore and ns.Disposition then
      local after = ns.Disposition.For(s.env, s.ctx)
      if ns.Disposition.Tier(after) ~= ns.Disposition.Tier(dispBefore) then
        notes[#notes + 1] = L.DISP_NOW:format(ns.Disposition.TierName(after))
      end
    end
    -- A rival you've met will hear of it (0.55.0).
    if d > 0 and ns.Disposition and s.info then
      for _, r in ipairs(ns.Disposition.Rivals(s.info.def)) do
        if ns.char.npc and ns.char.npc[r] then
          notes[#notes + 1] = L.RIVAL_HEARS:format(ns.Disposition.RivalName(r))
          break
        end
      end
    end
  end
  if #notes == 0 then return nil end
  return table.concat(notes, "  ")
end

-- The note from the last reply, under the new page's text.
function Conv.ShowPendingNote()
  local s = Conv.session
  if not s or not s.pendingNote then return end
  local note = s.pendingNote
  s.pendingNote = nil
  if s.mode ~= "full" then return end
  local hex = ns.UI and ns.UI.Theme and ns.UI.Theme.Hex("dim") or "|cff888888"
  View(s).ShowReaction(hex .. note .. "|r")
  if View(s).SetDisposition then View(s).SetDisposition(Conv.DispositionView(s)) end
end

-- Disposition for the box: { value, name, why } (nil when the setting is off).
function Conv.DispositionView(s)
  if not s or not ns.Disposition or ns.db.settings.showDisposition == false then return nil end
  local value, why = ns.Disposition.Compute(s.info, s.mem, s.ctx)
  return { value = value, name = ns.Disposition.TierName(value), why = why }
end

-- "Ask about...": the NPC's own take, then their community's, their role's, then a brush-off.
-- Learn the topics named in some text the NPC said, and return it with them linked (or
-- nil when nothing was linked). exclude: a topic that shouldn't link to itself.
function Conv.Hear(text, exclude)
  local s = Conv.session
  if not ns.Topics or type(text) ~= "string" then return nil end
  local hex = ns.UI and ns.UI.Theme and ns.UI.Theme.Hex("topic") or nil
  local linked, found = ns.Topics.Hear(text, s and s.env, exclude, hex)
  return (#found > 0 and linked ~= text) and linked or nil
end

-- "Ask about...": the NPC's own take, then their community's, their role's, then a brush-off.
-- An answer can open a branch of the conversation (its line says next = "<node>"): the
-- answer is shown, and that node's replies follow it.
Conv.KNOWS_MAX = 10

-- "What do you know?": a lead-in in their voice, then the topics they can speak to as a
-- list of links. The player learns every one of them; the Ask list keeps them under "What
-- they can tell you about". Nothing to say: their usual brush-off.
function Conv.AskKnows()
  local s = Conv.session
  local known = Engine.TopicsKnownBy(s.info, s.ctx, s.env)
  -- Not asked yet first, so asking again brings up what's left.
  local fresh, asked = {}, {}
  for _, e in ipairs(known) do
    if ns.Topics.AskedOf(e.id, s.memKey) then asked[#asked + 1] = e.id else fresh[#fresh + 1] = e.id end
  end
  local ids = {}
  for _, id in ipairs(fresh) do if #ids < Conv.KNOWS_MAX then ids[#ids + 1] = id end end
  for _, id in ipairs(asked) do if #ids < Conv.KNOWS_MAX then ids[#ids + 1] = id end end
  ns.Topics.Asked("knows", s.memKey)
  local w = Engine.PickTopic(s.info, #ids > 0 and "knows" or "_nothing", s.ctx, s.env)
  local text = L.KNOWS_FALLBACK
  if w then
    Conv.Shown(w)
    s.lastLine = w.gid
    text = Tokens.Render(w.line.text, s.ctx, s.env, w.line.when)
  elseif #ids == 0 then
    text = L.FALLBACK_LINE
  end
  local linked
  if #ids > 0 then
    ns.Effects.Apply({ learn = ids }, s.env)
    ns.Topics.MarkKnows(ids, s.memKey)
    local hex = ns.UI and ns.UI.Theme and ns.UI.Theme.Hex("topic") or nil
    local on = not ns.db or ns.db.settings.topicLinks ~= false
    local plain = text .. "\n\n" .. ns.Topics.LinkList(ids, false)
    linked = on and (text .. "\n\n" .. ns.Topics.LinkList(ids, hex)) or nil
    text = plain
  end
  View(s).ShowAnswer(text, L.KNOWS_TITLE, linked)
  if ns.UI.AskAbout and ns.UI.AskAbout.Refresh then ns.UI.AskAbout.Refresh() end
end

function Conv.Ask(topic)
  local s = Conv.session
  if not s or s.mode ~= "full" then return end
  if topic == "knows" then Conv.AskKnows(); return end
  local w = Engine.PickTopic(s.info, topic, s.ctx, s.env)
  local brushoff = w == nil or (type(w.src) == "string" and w.src:find("brushoff") ~= nil)
  ns.Topics.Asked(topic, s.memKey, not brushoff)
  local text = L.FALLBACK_LINE
  if w then
    Conv.Shown(w)
    s.lastLine = w.gid
    text = Tokens.Render(w.line.text, s.ctx, s.env, w.line.when)
  end
  if w and not brushoff then ns.Topics.RecordAnswer(topic, s.memKey, s.info and s.info.name, w.gid) end
  local linked = Conv.Hear(text, topic)
  local tdef = ns.Data.topics[topic]
  Conv.Log("ask", tdef and tdef.name or topic)
  Conv.Log("npc", text)
  View(s).ShowAnswer(text, tdef and tdef.name or topic, linked)
  local nextId = w and w.line.next
  local node = nextId and s.info.def and s.info.def.nodes and s.info.def.nodes[nextId]
  if node then
    s.node, s.nodeDef = nextId, node
    s.visited = s.visited or {}
    s.visited[nextId] = true
    if s.mem then s.mem.nodes = s.mem.nodes or {}; s.mem.nodes[nextId] = true end
    if node.hub then s.hub = nextId end
    View(s).SetChoices(Conv.BuildChoices(node, false))
  end
  if ns.UI.AskAbout and ns.UI.AskAbout.Refresh then ns.UI.AskAbout.Refresh() end
end

function Conv.OpenCompact()
  local s = Conv.session
  if not s then return end
  s.mode = "compact"
  local info, ctx, env = s.info, s.ctx, s.env
  local notice = s.pendingNotice
  if notice == nil and otherAddonMode() == "normal" and not C.InCombat() then
    notice = Engine.PickNotice(info, ctx, env)
  end
  s.pendingNotice = nil
  local rumor
  if not notice and ns.Rumors and ns.Rumors.Due(info, env) then
    rumor = Engine.PickRumor(info, ctx, env)
    if rumor then ns.Rumors.Used(info, env) end
  end
  local winner = notice or rumor or Engine.PickGreeting(info, ctx, env)
  if not winner then s.mode = "none"; return end
  if notice then Engine.UseNotice(notice, info, env) end
  Conv.Shown(winner)
  s.lastLine = winner.gid
  local anchor = otherAddonMode() == "normal" and Conv.BlizzardFrame(s) or nil
  ns.UI.Compact.Show({
    name = info.name, text = Tokens.Render(winner.line.text, ctx, env, winner.line.when), anchor = anchor,
    autoHide = anchor == nil and 12 or nil,
  })
end

---------------------------------------------------------------------------
-- Talk to Target (keybinding, slash command, compact bar button)
---------------------------------------------------------------------------
function Conv.TalkNow()
  local s = Conv.session
  if s and not s.ended then
    Conv.OpenFull("talk")
    return
  end
  Conv.TalkToTarget()
end

function Conv.TalkToTarget(silent)
  local say = silent and function() end or ns.Print
  if C.InCombat() then say(L.COMBAT_LATER); return end
  local s = Conv.session
  if s and not s.ended and s.unit == "npc" then Conv.OpenFull("talk"); return end
  if not C.Exists("target") or C.IsPlayer("target") then say(L.TALK_NO_TARGET); return end
  if not C.IsFriendly("target") then say(L.TALK_HOSTILE); return end
  if C.InRange("target") == false then say(L.TALK_TOO_FAR); return end
  Conv.Start("talk", "target")
  s = Conv.session
  if s and s.kind == "talk" then
    s.ticker = C.NewTicker(0.5, function()
      local cur = Conv.session
      if cur ~= s or s.ended then return end
      if not C.Exists("target") or C.GUID("target") ~= s.guid or C.InRange("target") == false then
        Conv.Finish()
      end
    end)
  end
end

---------------------------------------------------------------------------
-- Right-clicking someone who has no menu of their own (Melika Isenstrider, a townsperson)
-- opens the box, the way right-clicking a quest giver opens theirs. People with a gossip
-- menu, quests or a shop keep the game's path: their window opens, and the box comes with
-- it (Conv.Start). A long right-button press is the camera turning, not a click.
---------------------------------------------------------------------------
Conv.CLICK_MAX = 0.4     -- seconds the button may be held for it to count as a click
Conv.CLICK_WAIT = 0.5    -- give the game this long to open its own window first
local pressed

function Conv.OnWorldMouseDown(button)
  pressed = nil
  if button ~= "RightButton" or not ns.db or not ns.db.settings.rightClickTalk or C.InCombat() then return end
  if not C.Exists("mouseover") or C.IsPlayer("mouseover") or not C.IsFriendly("mouseover") then return end
  local guid = C.GUID("mouseover")
  if guid then pressed = { guid = guid, t = C.Clock() } end
end

function Conv.OnWorldMouseUp(button)
  local p = pressed
  pressed = nil
  if button ~= "RightButton" or not p or C.Clock() - p.t > Conv.CLICK_MAX then return end
  C.After(Conv.CLICK_WAIT, function() Conv.RightClicked(p.guid) end)
end

-- Someone we have something to say for (their own file, or a role pool).
local function hasContent(unit)
  local ctx = ns.Context.New({ unit = unit })
  local info = Conv.Identify(unit, ctx)
  if not info then return false end
  if info.def then return true end
  return #ns.Data.PoolsFor(info, ctx) > 0
end

function Conv.RightClicked(guid)
  if C.InCombat() or not ns.db.settings.enabled then return end
  local s = Conv.session
  if s and not s.ended then return end              -- the game opened their window: that path has it
  if C.AnyInteractionFrameShown() then return end
  if not C.Exists("target") or C.GUID("target") ~= guid then return end
  local cap = ns.db.capture.npcs[C.NPCID(guid) or -1]
  if cap and (cap.gossip or cap.interacts) then return end   -- known to have a menu; it's on its way
  if C.InRange("target") == false or not hasContent("target") then return end
  Conv.TalkToTarget(true)
end

ns.OnLogin(function()
  C.HookWorldClicks(function(b) Conv.OnWorldMouseDown(b) end, function(b) Conv.OnWorldMouseUp(b) end)
end)

---------------------------------------------------------------------------
-- "This line is wrong"
---------------------------------------------------------------------------
function Conv.Flag(note)
  local s = Conv.session
  if not s or not ns.Flag then return end
  ns.Flag.Save(s, note)
end

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------
-- Which page the quest window is on: "greeting" | "detail" | "progress" | "complete".
local questStage

local function deferStart(kind, unit, interactionName)
  -- Let Blizzard's window open first, so ours lands in front of it.
  C.After(0, function() Conv.Start(kind, unit, interactionName) end)
end

ns.On("GOSSIP_SHOW", function() deferStart("gossip", "npc") end)
ns.On("QUEST_GREETING", function() questStage = "greeting"; deferStart("quest", "npc") end)
ns.On("QUEST_DETAIL", function() questStage = "detail"; deferStart("quest", "npc") end)
ns.On("QUEST_PROGRESS", function() questStage = "progress"; deferStart("quest", "npc") end)
ns.On("QUEST_COMPLETE", function() questStage = "complete"; deferStart("quest", "npc") end)

---------------------------------------------------------------------------
-- The game's own options in the box: the NPC's quests (hand-ins first), then their gossip
-- options (vendor, training, flights, "make this inn your home"...). Picking one hands
-- over to the game's window, exactly as if it had been clicked there.
---------------------------------------------------------------------------
Conv.MAX_GAME_OPTIONS = 5

local function questRank(q) return q.active and (q.complete and 1 or 3) or 2 end
-- The words say what kind of entry it is; the icon (the game's own quest marks, the
-- gossip window's option icons) is drawn by the window.
local function questLabel(q)
  local fmt = q.active and (q.complete and L.GAME_TURN_IN or L.GAME_QUEST_ACTIVE) or L.GAME_QUEST
  return fmt:format(q.title or "?")
end

function Conv.GameOptions(s, all)
  local out = {}
  if not s or s.kind == "talk" then return out end
  local function add(text, game, icon) out[#out + 1] = { choice = { text = text, icon = icon }, game = game } end
  local gossip, quest = C.BlizzardFrame("gossip"), C.BlizzardFrame("quest")
  -- The event that started the visit says which page is open, even before a window shows
  -- (DialogueUI shows its window a moment later).
  local onGossip = (gossip and gossip:IsShown()) or s.kind == "gossip"
  local onQuest = (quest and quest:IsShown()) or s.kind == "quest"
  -- The page the visit is on decides (both windows can't really be open at once).
  if s.kind == "quest" and onQuest then onGossip = false end
  if s.kind == "service" then onGossip, onQuest = false, false end
  if onGossip then
    local quests = C.GossipQuests()
    table.sort(quests, function(a, b)
      if questRank(a) ~= questRank(b) then return questRank(a) < questRank(b) end
      return (a.title or "") < (b.title or "")
    end)
    for _, q in ipairs(quests) do
      add(questLabel(q), { kind = "gossipQuest", questID = q.questID, active = q.active }, C.QuestIcon(q))
    end
    for _, o in ipairs(C.GossipOptions()) do
      if type(o.name) == "string" and o.name ~= "" then
        local icon = (type(o.icon) == "number" and o.icon > 0 or type(o.icon) == "string" and o.icon ~= "")
          and { file = o.icon } or nil
        add(o.name, { kind = "gossipOption", id = o.id }, icon)
      end
    end
  elseif onQuest then
    if questStage == "greeting" then
      local quests = C.GreetingQuests()
      table.sort(quests, function(a, b)
        if questRank(a) ~= questRank(b) then return questRank(a) < questRank(b) end
        return a.index < b.index
      end)
      for _, q in ipairs(quests) do
        add(questLabel(q), { kind = "greetingQuest", index = q.index, active = q.active }, C.QuestIcon(q))
      end
    else
      local title = C.QuestFrameText().title
      if type(title) == "string" and title ~= "" then
        local handIn = questStage == "progress" or questStage == "complete"
        add((handIn and L.GAME_TURN_IN or L.GAME_QUEST):format(title), { kind = "reveal" },
          C.QuestIcon({ questID = C.QuestFrameText().questID, active = handIn, complete = handIn }))
      end
    end
  end
  while not all and #out > Conv.MAX_GAME_OPTIONS do table.remove(out) end
  return out
end

---------------------------------------------------------------------------
-- The game's own pages, kept in the box: after a gossip option or quest is picked in the
-- box, the next gossip page and the quest pages (offer, progress, reward) show here too,
-- answered with the same calls the game's quest window makes. Anything that needs the
-- game's own confirmation (a PvP quest, a hand-in that costs money) is handed over.
-- On these pages the last row says goodbye instead of "Get on with it".
---------------------------------------------------------------------------
function Conv.KeepPages(s)
  return s.view ~= "dui" and ns.db.settings.pagesInBox ~= false
end

-- An item as a line of text: its icon, its name in its quality's color, the count, and a
-- warning in words when the player can't use it.
local function itemName(it)
  local hex = ns.UI.Theme.QualityHex(it.quality)
  local name = hex and (hex .. it.name .. "|r") or it.name
  return name .. ((it.count or 1) > 1 and (" x" .. it.count) or "")
end

-- Item icons on the quest pages: about twice the text's height, so they read as items (the
-- game's own quest window shows them larger still, on buttons).
local function itemIconSize() return math.floor(ns.UI.Theme.BodySize() * 2 + 2) end
Conv.ItemIconSize = itemIconSize

-- An item's icon and name as a link: hovering it in the text shows the game's tooltip.
-- The plain text (typed out) has the links stripped; they come back when typing ends.
local function itemLink(it, label)
  return ("|Hrpgdq:%s:%d:%s|h%s|h"):format(it.kind or "reward", it.index or 0, it.itemID or "", label)
end
local function stripLinks(text) return (text:gsub("|H.-|h(.-)|h", "%1")) end

local function itemLine(it)
  local line = itemLink(it, C.IconMarkup(it.texture, itemIconSize()) .. itemName(it))
  if it.usable == false then line = line .. " " .. ns.UI.Theme.StatusHex(false) .. L.QUEST_UNUSABLE .. "|r" end
  return line
end

-- A required item: how many the player carries against how many the quest wants.
local function requiredLine(it)
  local line = itemLink(it, C.IconMarkup(it.texture, itemIconSize()) .. it.name)
  if not it.have then return line .. ((it.count or 1) > 1 and (" x" .. it.count) or "") end
  local enough = it.have >= (it.count or 1)
  return line .. "  " .. ns.UI.Theme.StatusHex(enough) .. L.QUEST_HAVE:format(math.min(it.have, it.count or 1), it.count or 1) .. "|r"
end

local function section(lines, title, list)
  if #list == 0 then return end
  if #lines > 0 then lines[#lines + 1] = "" end
  lines[#lines + 1] = ns.UI.Theme.Hex("name") .. title .. "|r"
  for _, line in ipairs(list) do lines[#lines + 1] = line end
end

-- Rewards as text: choices (when asked), items, money, experience.
local function rewardLines(info, withChoices)
  local lines = {}
  if withChoices then
    local choices = {}
    for _, it in ipairs(C.QuestItems("choice")) do choices[#choices + 1] = itemLine(it) end
    section(lines, #choices > 1 and L.QUEST_CHOOSE_ONE or L.QUEST_RECEIVE, choices)
  end
  local get = {}
  for _, it in ipairs(C.QuestItems("reward")) do get[#get + 1] = itemLine(it) end
  if info.rewardMoney > 0 then get[#get + 1] = C.MoneyText(info.rewardMoney) end
  if info.rewardXP > 0 then get[#get + 1] = L.QUEST_XP:format(info.rewardXP) end
  section(lines, #lines > 0 and L.QUEST_ALSO or L.QUEST_RECEIVE, get)
  return lines
end

-- The rows of the reward page. With several rewards to choose from, each is a row: picking
-- one marks it (in words and with a check), and "Complete quest" stays locked until then,
-- so a stray click or key never takes the wrong reward.
local CHECK = "|TInterface\\RaidFrame\\ReadyCheck-Ready:14:14|t"
local function rewardEntries(s, info)
  local entries = {}
  local function add(label, extra)
    local e = { choice = { text = label, icon = extra and extra.icon } }
    for k, v in pairs(extra or {}) do e[k] = v end
    entries[#entries + 1] = e
  end
  local choices = C.QuestItems("choice")
  if info.cost > 0 then
    add(L.QUEST_IN_WINDOW:format(L.QUEST_COMPLETE), { action = "handover" })
  elseif #choices > 1 then
    local chosen
    for _, it in ipairs(choices) do
      local picked = s.rewardChoice == it.index
      if picked then chosen = it end
      local label = itemName(it)
      if it.usable == false then label = label .. " " .. L.QUEST_UNUSABLE end
      if picked then label = label .. " " .. CHECK .. " " .. L.QUEST_CHOSEN end
      add(label, { action = "pick", arg = it.index, icon = { file = it.texture, desaturate = it.usable == false, size = itemIconSize() },
                   tooltip = { kind = "choice", index = it.index, itemID = it.itemID } })
    end
    if chosen then
      add(L.QUEST_COMPLETE_WITH:format(itemName(chosen)), { action = "reward", arg = chosen.index, gap = true })
    else
      add(L.QUEST_COMPLETE_CHOOSE, { action = "reward", locked = true, gap = true })
    end
  else
    add(L.QUEST_COMPLETE, { action = "reward", arg = #choices == 1 and 1 or 0 })
  end
  return entries
end

-- The box's rows for these entries.
local function toChoices(entries)
  local choices = {}
  for i, e in ipairs(entries) do
    choices[i] = { text = e.choice.text, icon = e.choice.icon, game = true, locked = e.locked, tooltip = e.tooltip, gap = e.gap }
  end
  return choices
end

-- A reward picked on the reward page: mark it and unlock "Complete quest", in place.
function Conv.PickReward(index)
  local s = Conv.session
  if not s or s.page ~= "complete" then return end
  s.rewardChoice = index
  s.choiceEntries = rewardEntries(s, C.QuestPageInfo())
  ns.UI.Dialogue.SetChoices(toChoices(s.choiceEntries), #s.choiceEntries)
end

local function joinText(parts)
  local out = {}
  for _, p in ipairs(parts) do
    if type(p) == "string" and p ~= "" then out[#out + 1] = p end
  end
  return table.concat(out, "\n\n")
end

-- The window the game is showing now, faded under the box (and the previous one restored,
-- so it isn't left invisible the next time the game opens it).
local function adoptWindow(s)
  local frame = Conv.BlizzardFrame(s)
  if frame == s.blizz then return end
  if s.faded and s.blizz then C.SetFaded(s.blizz, false); s.faded = false end
  s.blizz = frame
  if frame and ns.db.settings.fadeDefault then
    C.SetFaded(frame, true)
    s.faded = true
    ns.UI.Blocker.Cover(frame)
  end
end

-- Any item on the current quest page still waiting for its name from the game?
local function itemsLoading()
  for _, kind in ipairs({ "choice", "reward", "required" }) do
    for _, it in ipairs(C.QuestItems(kind)) do if it.loading then return true end end
  end
  return false
end

-- The page's text, rows and subtitle for what the game is showing now.
local function buildPage(s, kind)
  local entries, subtitle = {}, s.info.subtitle
  local text
  local function add(label, extra)
    local e = { choice = { text = label, icon = extra and extra.icon } }
    for k, v in pairs(extra or {}) do e[k] = v end
    entries[#entries + 1] = e
  end
  if kind == "gossip" or questStage == "greeting" then
    text = kind == "gossip" and (C.GossipText() or "") or (C.QuestFrameText().greeting or "")
    for _, e in ipairs(Conv.GameOptions(s, true)) do entries[#entries + 1] = e end
    return text, entries, subtitle, text
  end
  local q, info = C.QuestFrameText(), C.QuestPageInfo()
  subtitle = q.title or subtitle
  -- Read aloud: only what they say, not the objective, reward or item lists.
  local spoken
  if questStage == "detail" then
    spoken = q.text
    local objectives = (q.objectives and q.objectives ~= "") and (ns.UI.Theme.Hex("name") .. L.QUEST_OBJECTIVES .. "|r\n" .. q.objectives) or nil
    text = joinText({ q.text, objectives, table.concat(rewardLines(info, true), "\n") })
    if info.pvp then add(L.QUEST_IN_WINDOW:format(L.QUEST_ACCEPT), { action = "handover" })
    else add(L.QUEST_ACCEPT, { action = "accept" }) end
    if not info.auto then add(L.QUEST_DECLINE, { action = "decline" }) end
  elseif questStage == "progress" then
    local needed = {}
    for _, it in ipairs(C.QuestItems("required")) do needed[#needed + 1] = requiredLine(it) end
    local lines = {}
    section(lines, L.QUEST_REQUIRED, needed)
    if info.cost > 0 then lines[#lines + 1] = L.QUEST_COSTS:format(C.MoneyText(info.cost)) end
    text = joinText({ q.progress, table.concat(lines, "\n") })
    spoken = q.progress
    add(info.completable and L.QUEST_CONTINUE or L.QUEST_NOT_READY, { action = "continue", locked = not info.completable })
    add(L.QUEST_DECLINE, { action = "decline" })
  else -- complete
    local choices = C.QuestItems("choice")
    local lines = rewardLines(info, #choices == 1)
    if #choices > 1 and info.cost == 0 then
      if #lines > 0 then lines[#lines + 1] = "" end
      lines[#lines + 1] = ns.UI.Theme.Hex("name") .. L.QUEST_PICK_REWARD .. "|r"
    end
    text = joinText({ q.reward, table.concat(lines, "\n") })
    spoken = q.reward
    for _, e in ipairs(rewardEntries(s, info)) do entries[#entries + 1] = e end
  end
  return text, entries, subtitle, spoken
end

function Conv.ShowGamePage(kind)
  local s = Conv.session
  if not s or s.mode ~= "full" then return end
  adoptWindow(s)
  s.rewardChoice = nil
  s.page = kind == "gossip" and "gossip" or questStage
  local text, entries, subtitle, spoken = buildPage(s, kind)
  s.choiceEntries = entries
  -- Item names the game hasn't sent yet show as "..." and are filled in when they come.
  s.itemsPending = s.page ~= "gossip" and itemsLoading()
  ns.UI.Dialogue.Show({
    name = s.info.name, subtitle = subtitle, unit = s.unit, text = stripLinks(text), linkedText = text,
    choices = toChoices(entries), canAsk = false,
    lastLabel = L.GOODBYE,
  })
  if ns.db.settings.ttsQuests ~= false then Conv.Speak(s, stripLinks(spoken or text)) end
end

-- The game sent an item's details: draw the quest page again in place (the text keeps
-- typing where it was, the chosen reward stays chosen).
function Conv.RefreshItems()
  local s = Conv.session
  if not s or s.mode ~= "full" or not s.itemsPending or s.page == "gossip" or not ns.UI.Dialogue.IsShown() then return end
  local kind = "quest"
  local text, entries = buildPage(s, kind)
  s.choiceEntries = entries
  s.itemsPending = itemsLoading()
  ns.UI.Dialogue.UpdateText(stripLinks(text), text)
  ns.UI.Dialogue.SetChoices(toChoices(entries))
end

local refreshQueued = false
local function queueRefresh()
  local s = Conv.session
  if refreshQueued or not (s and s.itemsPending) then return end
  refreshQueued = true
  -- Several items often arrive together: one redraw for all of them.
  C.After(0.05, function() refreshQueued = false; Conv.RefreshItems() end)
end
ns.On("GET_ITEM_INFO_RECEIVED", queueRefresh)
ns.On("QUEST_ITEM_UPDATE", queueRefresh)

ns.On("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", function(_, kind)
  local name = C.InteractionName(kind)
  if FRAME_FOR_INTERACTION[name or ""] then deferStart("service", "npc", name) end
end)

function Conv.CheckClosed()
  local s = Conv.session
  if not s or s.kind == "talk" then return end
  if not C.AnyInteractionFrameShown() then Conv.Finish() end
end

local function onClose() C.After(0.2, Conv.CheckClosed) end
ns.On("GOSSIP_CLOSED", onClose)
ns.On("QUEST_FINISHED", onClose)
ns.On("PLAYER_INTERACTION_MANAGER_FRAME_HIDE", onClose)

ns.On("PLAYER_REGEN_DISABLED", function()
  local s = Conv.session
  if s and s.mode == "full" then Conv.HandOver() end
end)

---------------------------------------------------------------------------
-- Live reactions while the full window is open
---------------------------------------------------------------------------
local function live(event, keys, changed)
  return function()
    local s = Conv.session
    if not s or s.mode ~= "full" or s.menuOnly or not View(s).IsShown() or C.InCombat() then return end
    local ctx = s.ctx
    local before = {}
    for _, k in ipairs(keys) do before[k] = ctx[k] end
    ns.Context.Refresh(ctx, keys)
    if not changed(before, ctx) then return end
    local w = Engine.PickReaction(s.info, event, ctx, s.env)
    if w then
      Conv.Shown(w)
      View(s).ShowReaction(Tokens.Render(w.line.text, ctx, s.env, w.line.when))
    end
  end
end

local function petKey(p) return p and ((p.family or "") .. ":" .. (p.name or "")) or "" end

-- Only on taking a shape: leaving one, or a stance change, says nothing.
Conv.OnForm = live("form", { "form" }, function(b, ctx) return ctx.form ~= nil and b.form ~= ctx.form end)
Conv.OnPet = live("pet", { "pet" }, function(b, ctx) return ctx.pet and petKey(b.pet) ~= petKey(ctx.pet) end)
Conv.OnMount = live("mount", { "mounted" }, function(b, ctx) return ctx.mounted and not b.mounted end)
Conv.OnStealth = live("stealth", { "stealthed" }, function(b, ctx) return ctx.stealthed and not b.stealthed end)
Conv.OnAura = live("aura", { "auras", "debuffTypes" }, function(b, ctx)
  for id in pairs(ctx.auras or {}) do if not (b.auras or {})[id] then return true end end
  return false
end)

ns.On("UPDATE_SHAPESHIFT_FORM", Conv.OnForm)
ns.OnUnit("UNIT_PET", "player", Conv.OnPet)
ns.On("PLAYER_MOUNT_DISPLAY_CHANGED", Conv.OnMount)
ns.On("UPDATE_STEALTH", Conv.OnStealth)
ns.OnUnit("UNIT_AURA", "player", Conv.OnAura)

-- Make Cond available to other modules that only load the controller.
Conv.Cond = Cond

---------------------------------------------------------------------------
-- Safety net: if anything in a conversation errors, say so in chat and give the game's
-- own window back, so a bug never blocks gossip, quests or vendors.
---------------------------------------------------------------------------
function Conv.Recover()
  local s = Conv.session
  if s then
    if s.faded then C.SetFaded(s.blizz, false); s.faded = false end
    s.mode = "business"
  end
  for _, f in ipairs({ "gossip", "quest", "merchant", "trainer", "taxi" }) do
    local frame = C.BlizzardFrame(f)
    if frame then C.SetFaded(frame, false) end
  end
  ns.UI.Blocker.Uncover()
  if ns.UI.Dialogue.Frame() then ns.UI.Dialogue.Frame():Hide() end
  if ns.UI.DUIView then ns.UI.DUIView.Release() end
  ns.UI.Compact.Hide()
  if ns.UI.AskAbout then ns.UI.AskAbout.Hide() end
end

for _, name in ipairs({ "Start", "OpenFull", "OpenCompact", "ShowNode", "Choose", "Business", "End",
                        "Finish", "Ask", "TalkNow", "TalkToTarget", "CheckClosed", "RightClicked",
                        "OnWorldMouseDown", "OnWorldMouseUp", "OnOtherWindowShown", "ShowGamePage",
                        "RefreshItems", "PickReward", "FallbackToBox", "HandOver", "Close" }) do
  local fn = Conv[name]
  Conv[name] = function(...) return ns.Guard("conversation:" .. name, fn, Conv.Recover, ...) end
end
