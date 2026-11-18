-- The journal: the character's own book, in their point of view (not the truth). Six
-- pages: Diary (what happened, day by day, place by place), Stories (the throughlines they've
-- stumbled into, and where each stands), People (who they've met, where, and how it stands),
-- Heard of (topics, and what people said when asked), Myself (where they stand, what they've
-- done), Notes.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local UI = ns.UI
local Theme = UI.Theme

local J = {}
ns.Journal = J
UI.Journal = J

local W, H = 660, 500
local TAB_W, TAB_STEP = 86, 90
local frame
local current = "chronicle"
local TABS = { "chronicle", "stories", "people", "heard", "sheet", "transcript", "notes" }
-- Old page names (saved bindings, macros) land on the page that holds them now.
local ALIASES = { topics = "heard", deeds = "sheet", threads = "stories" }
-- Pages with a search box.
local SEARCHABLE = { chronicle = true, people = true, heard = true }
local picking, pickList, pickIndex   -- the origin picker (Myself page)
local switching   -- true while J.Show clears the search box on a page change

---------------------------------------------------------------------------
-- Text builders (pure: also used by tests)
---------------------------------------------------------------------------
local function when(t)
  if not t or t == 0 then return "" end
  local days = math.floor((C.Now() - t) / 86400)
  if days <= 0 then return L.J_TODAY elseif days == 1 then return L.J_YESTERDAY end
  return L.J_DAYS_AGO:format(days)
end

local function affinityWord(a)
  a = a or 0
  if a <= -5 then return L.AFF_HOSTILE elseif a <= -2 then return L.AFF_WARY elseif a < 2 then return L.AFF_NEUTRAL
  elseif a < 5 then return L.AFF_WARM end
  return L.AFF_FOND
end

local function axisWords(v, pos, neg)
  local mag = math.abs(v)
  local side = v >= 0 and pos or neg
  if mag < 10 then return L.ALIGN_BALANCED:format(pos, neg) end
  local strength = mag < 30 and L.ALIGN_LEANING or (mag < 60 and L.ALIGN_FIRMLY or L.ALIGN_DEEPLY)
  return strength:format(side)
end

local DEED_NAMES = {
  first_death = function() return L.DEED_FIRST_DEATH end,
}

local function deedName(id, d)
  if DEED_NAMES[id] then return DEED_NAMES[id]() end
  local kind, arg = id:match("^(%a+):(.+)$")
  if kind == "level" then return L.DEED_LEVEL:format(arg) end
  if kind == "zone" then return L.DEED_ZONE:format(arg) end
  if kind == "dungeon" then return L.DEED_DUNGEON:format(arg) end
  if kind == "cleared" then return L.DEED_CLEARED:format(arg) end
  if kind == "kill" then
    local cap = ns.db.capture.npcs[tonumber(arg)]
    local name = (d and d.name) or (cap and cap.name)
    return name and L.DEED_KILL:format(name) or nil
  end
  return id
end

-- Inline ink for text inside a line (a person's title, who told a story beat). Taken from
-- the current palette when the window draws; these are the fallbacks for tests.
local HEAD, DIM, NOTE, PLACE = "|cff6b2f0f", "|cff5e4a32", "|cff4a3a2a", "|cff7a4a1a"
local function refreshInk()
  local ok, dim = pcall(Theme.Hex, "dim")
  if ok and dim then DIM = dim end
  local okN, note = pcall(Theme.Hex, "reaction")
  if okN and note then NOTE = note end
end
-- "What I've done" (0.72.0): a summary line, then milestones, the lands walked grouped by
-- day, dungeons (trips in and clears on one line each) and the foes met most often.
local FOES_SHOWN = 8

local function looksLikeLand(name, c)
  local Wd = ns.World or {}
  if (Wd.ZONE_LEVELS and Wd.ZONE_LEVELS[name]) or (Wd.CAPITALS and Wd.CAPITALS[name]) then return true end
  -- Before 0.72.0 indoor rooms ("Southshore Town Hall") could be logged as a first visit.
  return not (c.places and c.places[name])
end

local function joinList(list)
  if #list <= 1 then return list[1] or "" end
  return table.concat(list, ", ", 1, #list - 1) .. L.J_AND .. list[#list]
end

local function deedsPage(add, c)
  local deeds = c.deeds or {}
  local milestones, lands, dungeons, foes = {}, {}, {}, {}
  local dungeonSeen, unnamed, foeKills = {}, 0, 0
  for id, d in pairs(deeds) do
    local kind, arg = id:match("^(%a+):(.+)$")
    local t, n = d.t or 0, d.n or 1
    if id == "first_death" or kind == "level" then
      milestones[#milestones + 1] = { text = deedName(id, d), t = t }
    elseif kind == "dungeon" or kind == "cleared" then
      local e = dungeonSeen[arg]
      if not e then e = { name = arg, t = t, n = 0 }; dungeonSeen[arg] = e; dungeons[#dungeons + 1] = e end
      if kind == "dungeon" then e.n = n; e.t = math.min(e.t, t) else e.cleared = t end
    elseif kind == "zone" then
      if not deeds["dungeon:" .. arg] and looksLikeLand(arg, c) then lands[#lands + 1] = { name = arg, t = t } end
    elseif kind == "kill" then
      local cap = ns.db and ns.db.capture and ns.db.capture.npcs[tonumber(arg)]
      local foe = d.name or (cap and cap.name)
      if foe then
        local e = foes[foe]
        if not e then e = { name = foe, n = 0, t = t }; foes[foe] = e end
        e.n = e.n + n
        foeKills = foeKills + n
      else
        unnamed = unnamed + 1
      end
    end
  end
  local foeList = {}
  for _, e in pairs(foes) do foeList[#foeList + 1] = e end
  if #milestones + #lands + #dungeons + #foeList + unnamed == 0 and (c.deathCount or 0) == 0 then return end
  add(L.J_DEEDS, "section")

  -- At a glance.
  local bits = {}
  if #lands > 0 then bits[#bits + 1] = L.J_DEEDS_LANDS:format(#lands) end
  if #dungeons > 0 then bits[#bits + 1] = L.J_DEEDS_DUNGEONS:format(#dungeons) end
  local total = (c.kills and c.kills.total) or foeKills
  if total > 0 then bits[#bits + 1] = L.J_DEEDS_FOES:format(total) end
  if (c.deathCount or 0) > 0 then bits[#bits + 1] = L.J_DEEDS_DIED:format(c.deathCount) end
  if #bits > 0 then add(table.concat(bits, "  ·  "), "dim") end

  if #milestones > 0 or (c.deathCount or 0) > 0 then
    add(L.J_DEEDS_MILESTONES, "place")
    table.sort(milestones, function(x, y) return x.t > y.t end)
    for _, m in ipairs(milestones) do add(m.text .. "  " .. DIM .. when(m.t) .. "|r") end
    if (c.deathCount or 0) > 1 then add(L.J_DEATHS:format(c.deathCount)) end
  end

  if #lands > 0 then
    add(L.J_DEEDS_LANDS_HEAD, "place")
    table.sort(lands, function(x, y) return x.t > y.t end)
    local day, list = nil, {}
    local function flush()
      if day and #list > 0 then
        add(DIM .. day:sub(1, 1):upper() .. day:sub(2) .. ":|r  " .. joinList(list))
      end
    end
    for _, l in ipairs(lands) do
      local w = when(l.t)
      if w ~= day then flush(); day, list = w, {} end
      list[#list + 1] = l.name
    end
    flush()
  end

  if #dungeons > 0 then
    add(L.J_DEEDS_DUNGEONS_HEAD, "place")
    table.sort(dungeons, function(x, y) return (x.cleared or x.t) > (y.cleared or y.t) end)
    for _, e in ipairs(dungeons) do
      local trips = e.n > 1 and L.J_DEEDS_TRIPS:format(e.n) or L.J_DEEDS_TRIP
      local line = e.cleared and L.J_DEEDS_CLEARED:format(e.name, trips) or L.J_DEEDS_ENTERED:format(e.name, trips)
      add(line .. "  " .. DIM .. when(e.cleared or e.t) .. "|r")
    end
  end

  if #foeList > 0 or unnamed > 0 then
    add(L.J_DEEDS_FOES_HEAD, "place")
    table.sort(foeList, function(x, y) if x.n ~= y.n then return x.n > y.n end return x.name < y.name end)
    for i = 1, math.min(FOES_SHOWN, #foeList) do
      local e = foeList[i]
      add(e.name .. (e.n > 1 and ("  " .. DIM .. "×" .. e.n .. "|r") or ""))
    end
    if #foeList > FOES_SHOWN then add(L.J_DEEDS_MORE_FOES:format(#foeList - FOES_SHOWN), "dim") end
    if unnamed > 0 then add(L.J_UNNAMED_KILLS:format(unnamed), "dim") end
  end
end

local MONTHS = { "January", "February", "March", "April", "May", "June", "July", "August",
                 "September", "October", "November", "December" }
local DAYS = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }

-- "Tuesday, 15 November" for a timestamp (or "" when the client has no calendar).
local function dayName(t)
  local okDate, d = pcall(_G.date, "*t", t)
  if not okDate or type(d) ~= "table" then return "" end
  return ("%s, %d %s"):format(DAYS[d.wday] or "", d.day, MONTHS[d.month] or "")
end

local function heading(add, text)
  add(text, "head")
end

-- The diary: entries grouped under the day they were written, oldest first within a day
-- (newest day at the top), with the place written once each time it changes.
local function diary(add, c, search)
  local needle = search and search ~= "" and search:lower()
  local days, order = {}, {}
  for _, e in ipairs(c.journal) do
    local text = e.kind == "summary" and L.J_FOLDED:format(e.folded or 0) or (e.text or "")
    local place = (e.subzone and e.subzone ~= "") and e.subzone or e.zone or ""
    if text ~= "" and (not needle or text:lower():find(needle, 1, true) or place:lower():find(needle, 1, true)) then
      local key = dayName(e.t or 0)
      if not days[key] then days[key] = {}; order[#order + 1] = key end
      local list = days[key]
      list[#list + 1] = { text = e.otherHand and ("|cff7a5a8a" .. text .. "  " .. L.J_OTHER_HAND .. "|r") or text, place = place }
    end
  end
  for i = #order, 1, -1 do
    local key = order[i]
    add(key ~= "" and key or L.J_UNDATED, "section")
    local lastPlace
    for _, e in ipairs(days[key]) do
      if e.place ~= "" and e.place ~= lastPlace then add(e.place, "place") end
      lastPlace = e.place
      add(e.text)
    end
  end
end

local function matches(needle, ...)
  if not needle then return true end
  for i = 1, select("#", ...) do
    local v = select(i, ...)
    if type(v) == "string" and v:lower():find(needle, 1, true) then return true end
  end
  return false
end

local function voiceText(tpl, ctx)
  if type(tpl) ~= "table" then return nil end
  local voice = (ns.db and ns.db.settings.journalVoice) or "first"
  local text = tpl[voice] or tpl.first or tpl.third
  return text and ns.Tokens.Render(text, ctx or ns.Context.New({ spoof = {} }), {}) or nil
end

local function topicNames(ids)
  local out = {}
  for id in pairs(ids or {}) do
    local def = ns.Data.topics[id]
    if def and not def.standard then out[#out + 1] = def.name end
  end
  table.sort(out)
  return out
end

-- People, grouped by the zone where you last spoke with them (most recent zone first).
local function people(add, c, search)
  local needle = search and search ~= "" and search:lower()
  local groups, order = {}, {}
  for key, m in pairs(c.npc) do
    if (m.times or 0) > 0 then
      local def = ns.Data.npcs[key]
      local name = m.name or (def and def.name) or key
      local title = def and def.title
      local place = m.zone or L.J_ELSEWHERE
      if matches(needle, name, title, place) then
        if not groups[place] then groups[place] = { last = 0, list = {} }; order[#order + 1] = place end
        local g = groups[place]
        g.list[#g.list + 1] = { key = key, m = m, def = def, name = name, title = title }
        g.last = math.max(g.last, m.last or 0)
      end
    end
  end
  table.sort(order, function(a, b) return groups[a].last > groups[b].last end)
  local ctx = ns.Context.New({ spoof = {} })
  for _, place in ipairs(order) do
    local g = groups[place]
    table.sort(g.list, function(a, b) return (a.m.last or 0) > (b.m.last or 0) end)
    add(place, "section")
    for _, p in ipairs(g.list) do
      heading(add, p.name .. (p.title and (DIM .. "  <" .. p.title .. ">|r") or ""))
      local word = affinityWord(p.m.affinity)
      local d = ns.Disposition and ns.Disposition.ForMemory(p.key)
      if d then word = ns.Disposition.TierName(d):lower() end
      add(L.J_PERSON:format(word, L.J_TALKED:format(p.m.times or 0), when(p.m.last)))
      if p.m.impressed and p.def and p.def.impression then
        local imp = voiceText(p.def.impression, ctx)
        if imp then add(imp, "note") end
      end
      -- Rivals (0.57.0): only the ones you've met, with where you stand with each.
      local rivals = {}
      for _, r in ipairs(ns.Disposition and ns.Disposition.Rivals(p.def) or {}) do
        local rm = c.npc[r]
        if rm and (rm.times or 0) > 0 then
          local rn = ns.Disposition.RivalName(r)
          local a = rm.affinity or 0
          rivals[#rivals + 1] = a > 0 and L.J_RIVAL_SIDED:format(rn) or a < 0 and L.J_RIVAL_CROSSED:format(rn) or rn
        end
      end
      if #rivals > 0 then add(L.J_RIVALS:format(table.concat(rivals, ", ")), "dim") end
      local told = topicNames(p.m.topics)
      if #told > 0 then add(L.J_ASKED_ABOUT:format(table.concat(told, ", "))) end
      local line = p.m.lastLine and ns.Data.Line(p.m.lastLine)
      if line and line.text then add(L.J_LAST_SAID:format(ns.Tokens.Render(line.text, ctx, { info = { name = p.name } })), "note") end
    end
  end
end

-- Stories: the throughlines heard so far, the live ones first.
local STATE_ORDER = { unfolding = 1, stirring = 2, resolved = 3, soured = 4, faded = 5 }
local function stories(add, c)
  local list = {}
  for id, t in pairs(c.threads or {}) do
    local def = ns.Data.threads[id]
    if def and t.state and t.state ~= "dormant" and next(t.beats or {}) then
      list[#list + 1] = { id = id, t = t, def = def }
    end
  end
  table.sort(list, function(a, b)
    local oa, ob = STATE_ORDER[a.t.state] or 9, STATE_ORDER[b.t.state] or 9
    if oa ~= ob then return oa < ob end
    return (a.t.lastT or 0) > (b.t.lastT or 0)
  end)
  local ctx = ns.Context.New({ spoof = {} })
  for _, s in ipairs(list) do
    local state = s.t.state
    add(s.def.title or s.def.id, "section")
    add(L["J_STORY_" .. state:upper()] or state, "place")
    local story = s.def.story or {}
    -- A faded story reads as it stood when it was dropped.
    local text = voiceText(story[state] or (state == "faded" and (story.unfolding or story.stirring)), ctx)
    add(text or s.def.theme or "")
    -- Who told me what, in the order I heard it.
    local beats = {}
    for _, b in ipairs(s.def.beats or {}) do
      local at = s.t.beats[b.id]
      if at then beats[#beats + 1] = { b = b, at = at } end
    end
    table.sort(beats, function(x, y) return x.at < y.at end)
    for _, e in ipairs(beats) do
      local npc = ns.Data.npcs[e.b.npc]
      local who = (c.npc[e.b.npc] and c.npc[e.b.npc].name) or (npc and npc.name) or e.b.npc
      add(DIM .. L.J_STORY_BEAT:format(who, when(e.at)) .. "|r " .. NOTE .. "\"" .. ns.Tokens.Render(e.b.text or "", ctx, { info = { name = who } }) .. "\"|r", "note")
    end
  end
end

-- Heard of: every topic picked up, by category, with who first spoke of it and what
-- people said when asked.
local function heard(add, c, search)
  local needle = search and search ~= "" and search:lower()
  local cats, order = {}, {}
  for _, t in ipairs(ns.Topics.Known(true)) do
    if not t.standard then
      local rec = c.topics[t.id] or {}
      local def = ns.Data.topics[t.id]
      local blob = {}
      for _, a in ipairs(rec.said or {}) do
        local line = ns.Data.Line(a.gid)
        if line and line.text then blob[#blob + 1] = line.text end
      end
      if matches(needle, t.name, table.concat(blob, " "), def and def.learned) then
        local cat = t.category or "other"
        if not cats[cat] then cats[cat] = {}; order[#order + 1] = cat end
        table.insert(cats[cat], t)
      end
    end
  end
  table.sort(order, function(a, b) return ns.Topics.CategoryName(a) < ns.Topics.CategoryName(b) end)
  local ctx = ns.Context.New({ spoof = {} })
  for _, cat in ipairs(order) do
    add(ns.Topics.CategoryName(cat), "section")
    table.sort(cats[cat], function(a, b) return a.name < b.name end)
    for _, t in ipairs(cats[cat]) do
      local src = ns.Topics.Source(t.id)
      heading(add, t.name .. (src and (DIM .. "  " .. L.J_HEARD_FROM:format(src) .. "|r") or ""))
      local rec = c.topics[t.id] or {}
      local said = rec.said or {}
      if #said == 0 then
        add(L.J_NOT_ASKED, "dim")
      else
        for i = #said, 1, -1 do
          local a = said[i]
          local line = ns.Data.Line(a.gid)
          if line and line.text then
            local who = a.name or (c.npc[a.who] and c.npc[a.who].name) or a.who
            local doubt = c.claims.doubted and c.claims.doubted[a.gid] and (" " .. L.J_DOUBTED) or ""
            add(L.J_SAID:format(who, ns.Tokens.Render(line.text, ctx, { info = { name = who } })) .. doubt, "note")
          end
        end
      end
    end
  end
end

-- Myself (0.80.0): who I am at a glance, where I stand (gauges), how I come across, the
-- people closest to me and most against me, what I've said I believe (in my own words),
-- the towns from warmest to coldest, then the rest of the record.
local PEOPLE_SHOWN = 5
local STANCE_WORDS = { ["for"] = "for it", against = "against it", yes = "yes", no = "no" }

local function stanceWords(stance)
  stance = tostring(stance or "")
  return STANCE_WORDS[stance] or (stance:gsub("_", " "))
end

local function countKeys(t, test)
  local n = 0
  for _, v in pairs(t or {}) do if not test or test(v) then n = n + 1 end end
  return n
end

local function selfHeader(add, c)
  local name = C.Name("player")
  local level = C.Level("player")
  local race = C.Race("player")
  local class = C.Class("player")
  local who = {}
  if level then who[#who + 1] = L.J_SELF_LEVEL:format(level) end
  if race then who[#who + 1] = race end
  if class then who[#who + 1] = class end
  add((name or L.J_TAB_SHEET) .. (#who > 0 and (DIM .. "  " .. table.concat(who, " ") .. "|r") or ""), "section")
  if c.origin then
    add(L.J_SELF_ORIGIN:format(c.origin.name), "place")
    if c.origin.blurb and c.origin.blurb ~= "" then add(c.origin.blurb, "note") end
  else
    add(L.J_NO_ORIGIN_LINE, "dim")
  end
  local met = countKeys(c.npc, function(m) return (m.times or 0) > 0 end)
  local bits = {}
  if met > 0 then bits[#bits + 1] = L.J_SELF_MET:format(met) end
  if (c.conversations or 0) > 0 then bits[#bits + 1] = L.J_SELF_TALKS:format(c.conversations) end
  local quests = countKeys(c.quests and c.quests.turnedIn)
  if quests > 0 then bits[#bits + 1] = L.J_SELF_QUESTS:format(quests) end
  local books = countKeys(c.books)
  if books > 0 then bits[#bits + 1] = L.J_SELF_BOOKS:format(books) end
  if #bits > 0 then add(table.concat(bits, "  ·  "), "dim") end
end

-- One axis as a gauge block; J.Text shows it as words.
local function gauge(add, v, pos, neg)
  v = math.max(-100, math.min(100, v or 0))
  local words = axisWords(v, pos, neg)
  local b = { text = neg .. " / " .. pos .. ": " .. words, kind = "bar", value = v, left = neg, right = pos, words = words }
  add(b)
end

local TRAIT_MILD = 1
local function traitsLine(c)
  local list = {}
  for name, n in pairs(c.traits or {}) do
    if type(n) == "number" and n >= TRAIT_MILD then list[#list + 1] = { name = name, n = n } end
  end
  table.sort(list, function(a, b) if a.n ~= b.n then return a.n > b.n end return a.name < b.name end)
  local strong, mild = {}, {}
  for i = 1, math.min(5, #list) do
    local e = list[i]
    if e.n >= 3 then strong[#strong + 1] = e.name else mild[#mild + 1] = e.name end
  end
  return strong, mild
end

-- The people who think best and worst of me, from what's stored.
local function closest(c)
  local good, bad = {}, {}
  for key, m in pairs(c.npc or {}) do
    if (m.times or 0) > 0 then
      local d = ns.Disposition and ns.Disposition.ForMemory(key)
      local a = m.affinity or 0
      local def = ns.Data.npcs[key]
      local e = { key = key, m = m, name = m.name or (def and def.name) or key, d = d, a = a }
      if (d and d >= 75) or (not d and a >= 2) then good[#good + 1] = e
      elseif (d and d <= 34) or (not d and a <= -2) then bad[#bad + 1] = e end
    end
  end
  table.sort(good, function(x, y) return (x.d or x.a * 10) > (y.d or y.a * 10) end)
  table.sort(bad, function(x, y) return (x.d or x.a * 10) < (y.d or y.a * 10) end)
  return good, bad
end

local function personLine(e)
  local word = e.d and ns.Disposition.TierName(e.d) or affinityWord(e.a)
  local place = e.m.zone and (DIM .. "  " .. e.m.zone .. "|r") or ""
  return e.name .. "  " .. NOTE .. word:lower() .. "|r" .. place
end

local function myself(add, c)
  selfHeader(add, c)

  local a = c.align
  local alignTitle = ns.Effects.TitleName()
  add(L.J_ALIGNMENT .. (alignTitle and ("  (" .. alignTitle .. ")") or ""), "section")
  gauge(add, a.light, L.AX_LIGHT, L.AX_SHADOW)
  gauge(add, a.order, L.AX_ORDER, L.AX_WILD)
  gauge(add, a.honor, L.AX_HONOR, L.AX_CUNNING)
  if (a.taint or 0) > 0 then add(a.taint >= 40 and L.TAINT_STRONG or L.TAINT_FAINT, "note") end
  local strong, mild = traitsLine(c)
  if #strong > 0 then add(L.J_TRAITS .. " " .. joinList(strong) .. ".") end
  if #mild > 0 then add(L.J_TRAITS_MILD:format(joinList(mild)), "dim") end

  local good, bad = closest(c)
  if #good + #bad > 0 then
    add(L.J_SELF_PEOPLE, "section")
    if #good > 0 then
      add(L.J_SELF_FRIENDS, "place")
      for i = 1, math.min(PEOPLE_SHOWN, #good) do add(personLine(good[i])) end
    end
    if #bad > 0 then
      add(L.J_SELF_FOES, "place")
      for i = 1, math.min(PEOPLE_SHOWN, #bad) do add(personLine(bad[i])) end
    end
  end

  -- Beliefs: the topic, what I said (my words when they were kept), to whom and when.
  local beliefs = {}
  for topic, o in pairs(c.opinions or {}) do
    local def = ns.Data.topics[topic]
    beliefs[#beliefs + 1] = { name = def and def.name or (L.OPINION_TOPICS or {})[topic] or (topic:gsub("_", " "):gsub("^%l", string.upper)), o = o }
  end
  if #beliefs > 0 then
    add(L.J_OPINIONS, "section")
    table.sort(beliefs, function(x, y) return x.name < y.name end)
    for _, b in ipairs(beliefs) do
      local o = b.o
      heading(add, b.name .. ": " .. stanceWords(o.stance))
      if o.said and o.said ~= "" then add("\"" .. o.said .. "\"", "note") end
      local npc = o.npc and ((c.npc[o.npc] and c.npc[o.npc].name) or (ns.Data.npcs[o.npc] and ns.Data.npcs[o.npc].name) or o.npc)
      local told = npc and L.J_SAID_TO:format(npc, when(o.t)) or when(o.t)
      if told ~= "" then add(told, "dim") end
      if o.contradicts then
        add(L.J_CONTRADICTED_WAS:format(stanceWords(o.contradicts.stance)), "dim")
      end
    end
  end

  local towns = {}
  for id, rec in pairs(c.towns or {}) do
    local town = ns.Data.towns[id]
    towns[#towns + 1] = { text = (town and town.name or id) .. ": " .. ns.Towns.TierName(id), v = rec.value or 0 }
  end
  if #towns > 0 then
    add(L.J_TOWNS, "section")
    table.sort(towns, function(x, y) if x.v ~= y.v then return x.v > y.v end return x.text < y.text end)
    for _, t in ipairs(towns) do add(t.text) end
  end

  local lines = {}
  for id, rec in pairs(c.claims.heard) do
    local def = ns.Data.claims[id]
    local who = def and def.by and ns.Data.npcs[def.by] and ns.Data.npcs[def.by].name or tostring(rec.npc or "?")
    lines[#lines + 1] = L.J_INSISTS:format(who, def and def.text or id) .. (c.claims.exposed[id] and (" " .. L.J_SETTLED) or "")
      .. (c.claims.doubted and c.claims.doubted[id] and (" " .. L.J_DOUBTED) or "")
  end
  table.sort(lines)
  if #lines > 0 then
    add(L.J_CLAIMS, "section")
    for _, l in ipairs(lines) do add(l) end
  end

  deedsPage(add, c)

  local nTopics = 0
  for _, t in ipairs(ns.Topics.Known(true)) do if not t.standard then nTopics = nTopics + 1 end end
  lines = {}
  for title in pairs(c.books) do lines[#lines + 1] = title end
  table.sort(lines)
  if nTopics > 0 or #lines > 0 then
    add(L.J_SELF_LEARNED, "section")
    if nTopics > 0 then add(L.J_TOPICS_COUNT:format(nTopics), "dim") end
    if #lines > 0 then
      add(L.J_BOOKS, "place")
      for _, l in ipairs(lines) do add(l) end
    end
  end
end

-- Transcript: the conversation you're in (or the last one), every word as it was shown.
-- Nothing is shortened or reworded; only color codes are dropped.
local function transcript(add, c)
  local s = ns.Conversation and ns.Conversation.session
  local name, log, at = s and s.info and s.info.name, s and s.log, nil
  if not log or #log == 0 then
    local t = c and c.transcript
    if not t or not t.log or #t.log == 0 then return end
    name, log, at = t.name, t.log, t.t
  end
  name = (name and name ~= "") and name or L.J_TRANSCRIPT_THEM
  add(name, "section")
  if at then add(when(at), "dim") end
  for _, e in ipairs(log) do
    local text = e.text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
    if e.who == "you" then
      add(HEAD .. L.J_TRANSCRIPT_YOU .. "|r  " .. text)
    elseif e.who == "ask" then
      add(HEAD .. L.J_TRANSCRIPT_YOU .. "|r  " .. L.HISTORY_ASKED:format(text))
    elseif e.who == "narr" then
      add(text, "dim")
    else
      add(HEAD .. name .. ":|r  " .. text)
    end
  end
end

-- A page as blocks: { text, kind } where kind is "section" (a day, a place, a category:
-- set large with a rule under it), "head" (a person, a topic), "place" (a small heading
-- inside a section), "note" (quoted or remembered words), "dim", or nil for plain text.
function J.Blocks(tab, search)
  tab = ALIASES[tab] or tab
  local c = ns.char
  local out = {}
  local function add(s, kind)
    out[#out + 1] = type(s) == "table" and s or { text = s, kind = kind }
  end
  if tab == "chronicle" then
    diary(add, c, search)
    if #out == 0 then add(L.J_EMPTY, "empty") end
  elseif tab == "people" then
    people(add, c, search)
    if #out == 0 then add((search and search ~= "") and L.J_NO_MATCH or L.J_NOBODY, "empty") end
  elseif tab == "stories" then
    stories(add, c)
    if #out == 0 then add(L.J_NO_STORIES, "empty") end
  elseif tab == "heard" then
    heard(add, c, search)
    if #out == 0 then add((search and search ~= "") and L.J_NO_MATCH or L.J_NOTHING_HEARD, "empty") end
  elseif tab == "sheet" then
    myself(add, c)
  elseif tab == "transcript" then
    transcript(add, c)
    if #out == 0 then add(L.J_NO_TRANSCRIPT, "empty") end
  end
  return out
end

-- The page as one string with inline colors (tests, export).
local TEXT_INK = { section = function() return PLACE end, head = function() return HEAD end,
                   place = function() return DIM end, note = function() return NOTE end, dim = function() return DIM end }
function J.Text(tab, search)
  local out = {}
  for i, b in ipairs(J.Blocks(tab, search)) do
    if b.kind == "section" and i > 1 then out[#out + 1] = " " end
    local ink = TEXT_INK[b.kind]
    out[#out + 1] = ink and (ink() .. b.text .. "|r") or b.text
  end
  return table.concat(out, "\n")
end

---------------------------------------------------------------------------
-- Window
---------------------------------------------------------------------------
local function create()
  frame = CreateFrame("Frame", nil, UIParent)
  frame:SetSize(W, H)
  frame:SetPoint("CENTER")
  frame:SetFrameStrata("HIGH")
  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:SetClampedToScreen(true)
  frame:RegisterForDrag("LeftButton")
  frame:SetScript("OnDragStart", frame.StartMoving)
  frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
  frame:Hide()
  Theme.Decorate(frame, 7, { chrome = "frame" })

  -- Keyboard: Escape closes, Left/Right switch tabs. Gamepad: D-pad left/right, B closes.
  frame:EnableKeyboard(true)
  frame:SetPropagateKeyboardInput(true)
  frame:SetScript("OnKeyDown", function(self, key) J.OnKey(self, key) end)
  C.SetGamePadHandler(frame, function(self, button)
    if button == "PADDLEFT" then J.OnKey(self, "LEFT")
    elseif button == "PADDRIGHT" then J.OnKey(self, "RIGHT")
    elseif button == "PADDUP" then J.OnKey(self, "UP")
    elseif button == "PADDDOWN" then J.OnKey(self, "DOWN")
    elseif button == "PAD1" and picking then J.OnKey(self, "ENTER")
    elseif button == "PAD2" then J.OnKey(self, "ESCAPE")
    end
  end)
  frame:SetScript("OnHide", function() C.GamePadButtons(frame, false) end)

  frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.title:SetDrawLayer("OVERLAY", 7)
  frame.close = Theme.CloseButton(frame)
  frame.close:SetScript("OnClick", function() frame:Hide() end)

  frame.tabs = {}
  for _, id in ipairs(TABS) do
    local b = Theme.Button(frame, "", TAB_W, 22)
    b:SetText(L["J_TAB_" .. id:upper()])
    b:SetScript("OnClick", function() J.Show(id) end)
    frame.tabs[id] = b
  end

  -- Under the selected tab, a short bar (the tab itself also stays lit).
  frame.tabMark = frame:CreateTexture(nil, "OVERLAY")
  frame.tabMark:SetHeight(2)

  -- The page's name and a count, on the left of the search row.
  frame.pageTitle = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.pageCount = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")

  frame.search = CreateFrame("EditBox", nil, frame, C.Template("editbox"))
  frame.search:SetSize(200, 20)
  frame.search:SetAutoFocus(false)
  frame.search.hint = frame.search:CreateFontString(nil, "OVERLAY", "GameFontDisable")
  frame.search.hint:SetPoint("LEFT", 2, 0)
  frame.search.hint:SetText(L.J_SEARCH_HINT)
  local function hint(self) self.hint:SetShown(self:GetText() == "" and not self:HasFocus()) end
  frame.search:SetScript("OnTextChanged", function(self)
    hint(self)
    if SEARCHABLE[current] and not switching then J.Show(current) end
  end)
  frame.search:SetScript("OnEditFocusGained", hint)
  frame.search:SetScript("OnEditFocusLost", hint)
  frame.search:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)

  frame.scroll = CreateFrame("ScrollFrame", nil, frame, C.Template("scroll"))
  frame.scroll:SetPoint("TOPLEFT", 24, -112)
  frame.scroll:SetPoint("BOTTOMRIGHT", -36, 14)
  frame.content = CreateFrame("Frame", nil, frame.scroll)
  frame.content:SetSize(W - 70, 10)
  frame.scroll:SetScrollChild(frame.content)
  frame.text = frame.content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.text:SetPoint("TOPLEFT")
  frame.text:SetWidth(W - 74)
  frame.text:SetJustifyH("LEFT")
  frame.text:SetJustifyV("TOP")
  frame.text:Hide()
  frame.lines, frame.rules = {}, {}

  -- Notes: the player's own writing.
  frame.notes = CreateFrame("EditBox", nil, frame.content)
  frame.notes:SetFontObject("ChatFontNormal")  -- an EditBox needs a font before any text
  frame.notes:SetMultiLine(true)
  frame.notes:SetAutoFocus(false)
  frame.notes:SetWidth(W - 74)
  frame.notes:SetHeight(300)
  frame.notes:SetPoint("TOPLEFT")
  frame.notes:SetMaxLetters(0)
  frame.notes:SetTextInsets(4, 4, 4, 4)
  frame.notes:EnableMouse(true)
  frame.notes.hint = frame.notes:CreateFontString(nil, "OVERLAY", "GameFontDisable")
  frame.notes.hint:SetPoint("TOPLEFT", 6, -6)
  frame.notes.hint:SetPoint("RIGHT", -6, 0)
  frame.notes.hint:SetJustifyH("LEFT")
  frame.notes.hint:SetText(L.J_NOTES_HINT)
  local function notesHint(self) self.hint:SetShown(self:GetText() == "" and not self:HasFocus()) end
  frame.notes:SetScript("OnTextChanged", function(self, user)
    if ns.char then ns.char.notes = self:GetText() end
    notesHint(self)
    J.FitNotes()
  end)
  frame.notes:SetScript("OnEditFocusGained", notesHint)
  frame.notes:SetScript("OnEditFocusLost", function(self)
    if ns.char then ns.char.notes = self:GetText() end
    notesHint(self)
  end)
  frame.notes:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
  -- Keep the cursor in view while writing past the bottom of the page.
  frame.notes:SetScript("OnCursorChanged", function(self, _, y, _, h)
    local top, view = frame.scroll:GetVerticalScroll(), frame.scroll:GetHeight()
    y = -(y or 0)
    if y < top then frame.scroll:SetVerticalScroll(y)
    elseif y + (h or 0) > top + view then frame.scroll:SetVerticalScroll(y + (h or 0) - view) end
  end)
  frame.notes:Hide()
  -- A click anywhere on the page starts writing (an empty multi-line box is only one line tall
  -- to the mouse on some clients).
  frame.content:SetScript("OnMouseDown", function()
    if current == "notes" then frame.notes:SetFocus(); frame.notes:SetCursorPosition(#(frame.notes:GetText() or "")) end
  end)

  -- Origin (Myself page): a line saying where you stand and a button that opens the picker.
  frame.originLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.originLabel:SetPoint("BOTTOMLEFT", 24, 15)
  frame.originLabel:SetPoint("RIGHT", frame, "RIGHT", -300, 0)
  frame.originLabel:SetJustifyH("LEFT")
  frame.originLabel:SetWordWrap(false)
  frame.originBtn = Theme.Button(frame, "", 140, 22)
  frame.originBtn:SetPoint("BOTTOMRIGHT", -14, 10)
  frame.originBtn:SetScript("OnClick", function() J.OpenOrigins() end)
  -- Export the whole character as readable text (0.82.0).
  frame.sheetBtn = Theme.Button(frame, "", 120, 22)
  frame.sheetBtn:SetPoint("RIGHT", frame.originBtn, "LEFT", -6, 0)
  frame.sheetBtn:SetScript("OnClick", function() ns.UI.ExportFrame.Show("sheet") end)
  J.BuildPicker()
end

---------------------------------------------------------------------------
-- Origin picker: every background open to this race and class in a list on the left,
-- the selected one on the right (where it puts you, what it leans you toward, and its
-- words, which you can rewrite before you take it).
---------------------------------------------------------------------------
local LIST_W, ROW_H = 220, 24

function J.BuildPicker()
  local pk = CreateFrame("Frame", nil, frame)
  pk:SetPoint("TOPLEFT", 20, -108)
  pk:SetPoint("BOTTOMRIGHT", -20, 44)
  pk:Hide()
  frame.picker = pk

  pk.listTitle = pk:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  pk.listTitle:SetPoint("TOPLEFT", 4, 0)
  pk.listTitle:SetWidth(LIST_W - 8)
  pk.listTitle:SetJustifyH("LEFT")
  pk.listRule = Theme.Divider(pk)
  pk.listRule:SetPoint("TOPLEFT", 0, -22)
  pk.listRule:SetWidth(LIST_W)
  pk.split = pk:CreateTexture(nil, "ARTWORK")
  pk.split:SetWidth(1)
  pk.split:SetPoint("TOPLEFT", LIST_W + 12, 0)
  pk.split:SetPoint("BOTTOMLEFT", LIST_W + 12, 0)
  pk.rows = {}

  local x = LIST_W + 28
  pk.name = pk:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  pk.name:SetPoint("TOPLEFT", x, 0)
  pk.name:SetPoint("RIGHT", pk, "RIGHT", -4, 0)
  pk.name:SetJustifyH("LEFT")
  pk.rule = Theme.Divider(pk)
  pk.rule:SetPoint("TOPLEFT", pk.name, "BOTTOMLEFT", 0, -5)
  pk.rule:SetPoint("RIGHT", pk, "RIGHT", -4, 0)
  pk.facts = pk:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  pk.facts:SetPoint("TOPLEFT", pk.rule, "BOTTOMLEFT", 0, -8)
  pk.facts:SetPoint("RIGHT", pk, "RIGHT", -4, 0)
  pk.facts:SetJustifyH("LEFT")
  pk.wordsLabel = pk:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  pk.wordsLabel:SetPoint("TOPLEFT", pk.facts, "BOTTOMLEFT", 0, -14)
  pk.wordsLabel:SetText(L.J_ORIGIN_WORDS)
  -- The words, on a faint panel so it reads as something you can write in.
  pk.box = CreateFrame("Frame", nil, pk)
  pk.box:SetPoint("TOPLEFT", pk.wordsLabel, "BOTTOMLEFT", 0, -6)
  pk.box:SetPoint("RIGHT", pk, "RIGHT", -4, 0)
  pk.box:SetHeight(120)
  pk.box:EnableMouse(true)
  pk.boxBg = pk.box:CreateTexture(nil, "BACKGROUND")
  pk.boxBg:SetAllPoints()
  pk.boxEdge = {}
  for i, side in ipairs({ "TOP", "BOTTOM", "LEFT", "RIGHT" }) do
    local t = pk.box:CreateTexture(nil, "BORDER")
    if i <= 2 then t:SetHeight(1); t:SetPoint(side .. "LEFT"); t:SetPoint(side .. "RIGHT")
    else t:SetWidth(1); t:SetPoint("TOP" .. side); t:SetPoint("BOTTOM" .. side) end
    pk.boxEdge[i] = t
  end
  pk.words = CreateFrame("EditBox", nil, pk.box)
  pk.words:SetFontObject("ChatFontNormal")
  pk.words:SetMultiLine(true)
  pk.words:SetAutoFocus(false)
  pk.words:SetMaxLetters(400)
  pk.words:SetPoint("TOPLEFT", 8, -8)
  pk.words:SetPoint("BOTTOMRIGHT", -8, 8)
  pk.words:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
  pk.box:SetScript("OnMouseDown", function() pk.words:SetFocus() end)
  pk.hint = pk:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  pk.hint:SetPoint("TOPLEFT", pk.box, "BOTTOMLEFT", 0, -6)
  pk.hint:SetPoint("RIGHT", pk, "RIGHT", -4, 0)
  pk.hint:SetJustifyH("LEFT")
  pk.hint:SetText(L.J_ORIGIN_HINT)

  pk.take = Theme.Button(frame, "", 170, 22)
  pk.take:SetPoint("BOTTOMRIGHT", -14, 10)
  pk.take:SetScript("OnClick", function() J.TakeOrigin() end)
  pk.back = Theme.Button(frame, L.J_ORIGIN_BACK, 90, 22)
  pk.back:SetPoint("RIGHT", pk.take, "LEFT", -8, 0)
  pk.back:SetScript("OnClick", function() J.CloseOrigins() end)
  pk.take:Hide(); pk.back:Hide()
end

local function leanings(o)
  local out = {}
  local n = o.nudge or {}
  local AX = { light = { L.AX_LIGHT, L.AX_SHADOW }, order = { L.AX_ORDER, L.AX_WILD }, honor = { L.AX_HONOR, L.AX_CUNNING } }
  for _, axis in ipairs({ "light", "order", "honor" }) do
    local v = n.align and n.align[axis]
    if v and v ~= 0 then out[#out + 1] = AX[axis][v > 0 and 1 or 2] end
  end
  local traits = {}
  for t in pairs(n.trait or {}) do traits[#traits + 1] = t end
  table.sort(traits)
  for _, t in ipairs(traits) do out[#out + 1] = t end
  return out
end

local function styleRow(row, sel, cur)
  local p = Theme.Palette()
  local hl = p.highlight
  row.sel:SetColorTexture(hl[1], hl[2], hl[3], sel and math.max(0.25, hl[4] * 2) or 0)
  local a = p.accent
  row.bar:SetColorTexture(a[1], a[2], a[3], 1)
  row.bar:SetShown(sel)
  Theme.SetFont(row.label, "body", Theme.TextSize() - 1)
  Theme.TextColor(row.label, sel and "name" or "text")
  row.label:SetText(row.o.name .. (cur and ("  " .. DIM .. L.J_ORIGIN_YOURS .. "|r") or ""))
end

function J.SelectOrigin(i)
  local pk = frame.picker
  if not pickList or not pickList[i] then return end
  pickIndex = i
  local o = pickList[i]
  local cur = ns.char.origin
  for j, row in ipairs(pk.rows) do
    if row:IsShown() then styleRow(row, j == i, cur and cur.id == row.o.id) end
  end
  pk.name:SetText(o.name)
  local facts = {}
  local town = o.home and ns.Data.towns[o.home]
  if town then facts[#facts + 1] = L.J_ORIGIN_HOME:format(town.name or o.home) end
  local lean = leanings(o)
  if #lean > 0 then facts[#facts + 1] = L.J_ORIGIN_LEANS:format(table.concat(lean, ", ")) end
  if o.id == "other" then facts[#facts + 1] = L.J_ORIGIN_OTHER_NOTE end
  pk.facts:SetText(table.concat(facts, "\n"))
  -- Your own words stay if you're looking at the origin you already have.
  local words = (cur and cur.id == o.id and cur.blurb) or o.blurb or ""
  pk.words:SetText(words)
  pk.words:SetCursorPosition(0)
  pk.words:ClearFocus()
  local same = cur and cur.id == o.id
  pk.take:SetText(same and L.J_ORIGIN_SAVE or (cur and L.J_ORIGIN_SWITCH or L.J_ORIGIN_TAKE))
end

function J.StylePicker()
  local pk = frame.picker
  if not pk then return end
  local size = Theme.TextSize()
  local p = Theme.Palette()
  Theme.SetFont(pk.listTitle, "body", size - 1)
  Theme.TextColor(pk.listTitle, "dim")
  Theme.SetFont(pk.name, "name", size + 5)
  Theme.TextColor(pk.name, "name")
  Theme.SetFont(pk.facts, "body", size - 1)
  Theme.TextColor(pk.facts, "subtitle")
  pk.facts:SetSpacing(3)
  Theme.SetFont(pk.wordsLabel, "name", size)
  Theme.TextColor(pk.wordsLabel, "name")
  Theme.SetFont(pk.hint, "body", math.max(10, size - 2))
  Theme.TextColor(pk.hint, "dim")
  Theme.ColorDivider(pk.listRule)
  Theme.ColorDivider(pk.rule)
  Theme.ColorDivider(pk.split)
  local hl = p.highlight
  pk.boxBg:SetColorTexture(hl[1], hl[2], hl[3], math.max(0.10, hl[4]))
  for _, t in ipairs(pk.boxEdge) do Theme.ColorDivider(t) end
  pk.words:SetFont(Theme.BodyFont(), size, "")
  pk.words:SetShadowOffset(0, 0)
  pk.words:SetTextColor(p.text[1], p.text[2], p.text[3])
  Theme.StyleButton(pk.take)
  Theme.StyleButton(pk.back)
end

-- welcome: opened by itself for a new character (a greeting above the list, "Later" to go).
function J.OpenOrigins(welcome)
  if not frame then create() end
  local pk = frame.picker
  local _, race = C.Race("player")
  local _, class = C.Class("player")
  local raceName = C.Race("player")
  local className = C.Class("player")
  pickList = ns.Origins.ListFor(race, class)
  picking = true
  frame.scroll:Hide()
  frame.originLabel:Hide()
  frame.originBtn:Hide()
  frame.sheetBtn:Hide()
  frame.pageTitle:SetText(welcome and L.J_ORIGIN_WELCOME or L.J_ORIGIN_PICK_TITLE)
  pk.back:SetText(welcome and L.J_ORIGIN_LATER or L.J_ORIGIN_BACK)
  frame.pageCount:SetText("")
  pk.listTitle:SetText(L.J_ORIGIN_FOR:format(raceName or race or "", className or class or ""))
  if welcome then ns.Print(L.ORIGIN_PROMPTED) end
  J.StylePicker()
  local cur = ns.char.origin
  local start = 1
  for i, o in ipairs(pickList) do
    local row = pk.rows[i]
    if not row then
      row = CreateFrame("Button", nil, pk)
      row:SetHeight(ROW_H)
      row.sel = row:CreateTexture(nil, "BACKGROUND")
      row.sel:SetAllPoints()
      row.bar = row:CreateTexture(nil, "ARTWORK")
      row.bar:SetWidth(3)
      row.bar:SetPoint("TOPLEFT"); row.bar:SetPoint("BOTTOMLEFT")
      row.hl = row:CreateTexture(nil, "HIGHLIGHT")
      row.hl:SetAllPoints()
      row.label = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
      row.label:SetPoint("LEFT", 10, 0)
      row.label:SetPoint("RIGHT", -4, 0)
      row.label:SetJustifyH("LEFT")
      row.label:SetWordWrap(false)
      row:SetScript("OnClick", function(self) J.SelectOrigin(self.index) end)
      pk.rows[i] = row
    end
    row.index, row.o = i, o
    row:ClearAllPoints()
    row:SetPoint("TOPLEFT", 0, -28 - (i - 1) * ROW_H)
    row:SetWidth(LIST_W)
    local hl = Theme.Palette().highlight
    row.hl:SetColorTexture(hl[1], hl[2], hl[3], hl[4])
    row:Show()
    if cur and cur.id == o.id then start = i end
  end
  for i = #pickList + 1, #pk.rows do pk.rows[i]:Hide() end
  pk:Show()
  pk.take:Show(); pk.back:Show()
  J.SelectOrigin(start)
end

function J.CloseOrigins()
  if not frame or not frame.picker then return end
  picking = false
  frame.picker:Hide()
  frame.picker.take:Hide(); frame.picker.back:Hide()
  frame.picker.words:ClearFocus()
  frame.scroll:Show()
  if current == "sheet" then J.Show("sheet") end
end

function J.TakeOrigin()
  local o = pickList and pickList[pickIndex]
  if not o then return end
  local words = frame.picker.words:GetText()
  local cur = ns.char.origin
  if cur and cur.id == o.id then
    ns.Origins.SetBlurb(words)
  else
    ns.Origins.Choose(o.id, words ~= "" and words or o.blurb)
  end
  J.CloseOrigins()
end

function J.IsPicking() return picking == true end

-- Game look: title in the title bar, tabs and search on the rock header, the pages on
-- parchment below. Wood look: everything on the wood-framed parchment.
local GAME_INSET_TOP = 90
local function placeParts(game)
  frame.title:ClearAllPoints()
  frame.close:ClearAllPoints()
  frame.search:ClearAllPoints()
  if game then
    frame.title:SetPoint("TOPLEFT", 12, -5)
    frame.title:SetPoint("TOPRIGHT", -24, -5)
    frame.title:SetJustifyH("CENTER")
    frame.close:SetPoint("TOPRIGHT", 1, 0)
    frame.search:SetPoint("TOPRIGHT", -24, -64)
    local inset = Theme.GamePart(frame, "inset")
    if inset then
      inset:ClearAllPoints()
      inset:SetPoint("TOPLEFT", 4, -GAME_INSET_TOP)
      inset:SetPoint("BOTTOMRIGHT", -6, 4)
    end
    Theme.FitPaper(frame, W - 10, H - GAME_INSET_TOP - 4)
  else
    frame.title:SetPoint("TOPLEFT", 18, -14)
    frame.title:SetJustifyH("LEFT")
    frame.close:SetPoint("TOPRIGHT", -12, -12)
    frame.search:SetPoint("TOPRIGHT", -24, -70)
  end
  for i, id in ipairs(TABS) do
    local b = frame.tabs[id]
    b:ClearAllPoints()
    b:SetPoint("TOPLEFT", 14 + (i - 1) * TAB_STEP, game and -32 or -40)
  end
  frame.pageTitle:ClearAllPoints()
  frame.pageTitle:SetPoint("LEFT", frame.search, "LEFT", -(W - 250), 0)
  frame.pageCount:ClearAllPoints()
  frame.pageCount:SetPoint("BOTTOMLEFT", frame.pageTitle, "BOTTOMRIGHT", 8, 1)
end

function J.Style()
  local size = Theme.TextSize()
  local game = Theme.IsGame()
  Theme.Recolor(frame)
  placeParts(game)
  Theme.StyleButton(frame.close, 12)
  Theme.StyleButton(frame.originBtn)
  Theme.StyleButton(frame.sheetBtn)
  for _, b in pairs(frame.tabs) do Theme.StyleButton(b) end
  Theme.SetFont(frame.title, "name", game and 13 or size + 6)
  Theme.Shadow(frame.title, game)
  Theme.TextColor(frame.title, game and "title" or "name")
  Theme.SetFont(frame.text, "body", size)
  Theme.TextColor(frame.text, "text")
  frame.text:SetSpacing(ns.db.settings.lineSpacing or 3)
  frame.notes:SetFont(Theme.BodyFont(), size, "")
  frame.notes:SetShadowOffset(0, 0)
  frame.notes:SetTextColor(Theme.Palette().text[1], Theme.Palette().text[2], Theme.Palette().text[3])
  Theme.SetFont(frame.pageTitle, "name", game and 15 or size + 4)
  Theme.Shadow(frame.pageTitle, game)
  Theme.TextColor(frame.pageTitle, game and "header" or "name")
  Theme.SetFont(frame.pageCount, "body", math.max(10, size - 2))
  Theme.Shadow(frame.pageCount, game)
  if game then frame.pageCount:SetTextColor(0.8, 0.8, 0.8) else Theme.TextColor(frame.pageCount, "dim") end
  local m = Theme.Palette()[game and "title" or "accent"]
  frame.tabMark:SetColorTexture(m[1], m[2], m[3], 1)
  Theme.SetFont(frame.originLabel, "body", size - 1)
  Theme.TextColor(frame.originLabel, "subtitle")
  frame:SetScale(ns.db.settings.scale or 1)
end

-- Lay the blocks out down the page: each kind has its font, ink, indent and space above.
local STYLE = {
  section = { font = "name", size = 4, ink = "name", indent = 0, above = 16, rule = true },
  head    = { font = "name", size = 1, ink = "name", indent = 0, above = 10 },
  place   = { size = -1, ink = "number", indent = 4, above = 8 },
  note    = { size = -1, ink = "reaction", indent = 24, above = 2 },
  dim     = { size = -1, ink = "dim", indent = 24, above = 2 },
  text    = { ink = "text", indent = 14, above = 4 },
  empty   = { ink = "dim", indent = 0, above = 0 },
  bar     = { size = -1, ink = "dim", indent = 14, above = 6 },
}

-- A gauge row (Myself): "Shadow [----|==    ] Light   leaning toward Light". The track runs
-- from one end of the axis to the other; the fill grows from the middle to the marker.
local BAR_LABEL, BAR_TRACK, BAR_GAP = 64, 200, 8
local function gaugeRow(i)
  frame.bars = frame.bars or {}
  local r = frame.bars[i]
  if r then return r end
  r = CreateFrame("Frame", nil, frame.content)
  r.left = r:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  r.left:SetJustifyH("RIGHT")
  r.right = r:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  r.right:SetJustifyH("LEFT")
  r.words = r:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  r.words:SetJustifyH("LEFT")
  r.words:SetWordWrap(false)
  r.track = r:CreateTexture(nil, "ARTWORK")
  r.mid = r:CreateTexture(nil, "ARTWORK", nil, 1)
  r.fill = r:CreateTexture(nil, "ARTWORK", nil, 2)
  r.mark = r:CreateTexture(nil, "ARTWORK", nil, 3)
  frame.bars[i] = r
  return r
end

local function layoutGauge(r, b, size, width)
  local h = size + 6
  r:SetSize(width, h)
  local function ink(tex, key, alpha)
    local col = Theme.Palette()[key] or { 0.5, 0.5, 0.5 }
    tex:SetColorTexture(col[1], col[2], col[3], alpha or col[4] or 1)
  end
  for _, fs in ipairs({ r.left, r.right, r.words }) do Theme.SetFont(fs, "body", size - 1) end
  Theme.TextColor(r.left, "text"); Theme.TextColor(r.right, "text"); Theme.TextColor(r.words, "dim")
  r.left:SetText(b.left); r.right:SetText(b.right); r.words:SetText(b.words)
  r.left:ClearAllPoints(); r.left:SetPoint("LEFT", 0, 0); r.left:SetWidth(BAR_LABEL)
  local x0 = BAR_LABEL + BAR_GAP
  r.track:ClearAllPoints(); r.track:SetPoint("LEFT", x0, 0); r.track:SetSize(BAR_TRACK, 6); ink(r.track, "divider")
  r.mid:ClearAllPoints(); r.mid:SetPoint("LEFT", x0 + BAR_TRACK / 2, 0); r.mid:SetSize(1, 10); ink(r.mid, "dim", 0.6)
  local v = b.value or 0
  local pos = x0 + (v + 100) / 200 * BAR_TRACK
  local half = x0 + BAR_TRACK / 2
  r.fill:ClearAllPoints()
  r.fill:SetPoint("LEFT", math.min(pos, half), 0)
  r.fill:SetSize(math.max(1, math.abs(pos - half)), 6)
  ink(r.fill, "accent", 0.75)
  r.fill:SetShown(math.abs(v) >= 1)
  r.mark:ClearAllPoints(); r.mark:SetPoint("CENTER", r, "LEFT", pos, 0); r.mark:SetSize(3, 12); ink(r.mark, "name")
  r.right:ClearAllPoints(); r.right:SetPoint("LEFT", x0 + BAR_TRACK + BAR_GAP, 0); r.right:SetWidth(BAR_LABEL)
  r.words:ClearAllPoints(); r.words:SetPoint("LEFT", r.right, "RIGHT", BAR_GAP, 0); r.words:SetPoint("RIGHT", r, "RIGHT", 0, 0)
  return h
end
local COUNTED = { chronicle = "text", people = "head", heard = "head", stories = "section" }

function J.Render(blocks)
  refreshInk()
  local size, width = Theme.TextSize(), W - 74
  local spacing = ns.db.settings.lineSpacing or 3
  local y, prev, nRule, count, nBar = 4, nil, 0, 0, 0
  for i, b in ipairs(blocks) do
    local st = STYLE[b.kind or "text"] or STYLE.text
    local fs = frame.lines[i]
    if not fs then
      fs = frame.content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
      fs:SetJustifyH("LEFT")
      fs:SetJustifyV("TOP")
      frame.lines[i] = fs
    end
    local above = st.above
    if not prev then above = 0
    elseif prev == "section" then above = math.min(above, 6)
    elseif prev == "head" and st.indent > 0 then above = 2 end
    y = y + above
    if b.kind == "bar" then
      fs:Hide()
      nBar = nBar + 1
      local r = gaugeRow(nBar)
      local h = layoutGauge(r, b, size, width - st.indent)
      r:ClearAllPoints()
      r:SetPoint("TOPLEFT", st.indent, -y)
      r:Show()
      y = y + h
    else
      Theme.SetFont(fs, st.font or "body", size + (st.size or 0))
      Theme.TextColor(fs, st.ink)
      fs:SetSpacing(spacing)
      fs:SetWidth(width - st.indent)
      fs:SetText(b.text or "")
      fs:ClearAllPoints()
      fs:SetPoint("TOPLEFT", st.indent, -y)
      fs:Show()
      y = y + (fs:GetStringHeight() or size)
    end
    if st.rule then
      nRule = nRule + 1
      local rule = frame.rules[nRule]
      if not rule then rule = Theme.Divider(frame.content); frame.rules[nRule] = rule end
      Theme.ColorDivider(rule)
      rule:ClearAllPoints()
      rule:SetPoint("TOPLEFT", 0, -(y + 3))
      rule:SetPoint("TOPRIGHT", -4, -(y + 3))
      rule:Show()
      y = y + 6
    end
    if (b.kind or "text") == COUNTED[current] then count = count + 1 end
    prev = b.kind or "text"
  end
  for i = #blocks + 1, #frame.lines do frame.lines[i]:Hide() end
  for i = nRule + 1, #frame.rules do frame.rules[i]:Hide() end
  for i = nBar + 1, #(frame.bars or {}) do frame.bars[i]:Hide() end
  frame.content:SetHeight(y + 16)
  if count > 0 and L["J_COUNT_" .. current:upper()] then
    frame.pageCount:SetText(L["J_COUNT_" .. current:upper()]:format(count))
  end
end

-- The notes box fills the page and grows with its text; the scroll child follows it.
function J.FitNotes()
  if not frame or current ~= "notes" then return end
  local view = math.max(100, (frame.scroll:GetHeight() or 0) - 4)
  local textH = 0
  if (frame.notes:GetText() or "") ~= "" then
    -- Rough height: lines x line height; the box grows on its own too, this sets the floor.
    local _, size = frame.notes:GetFont()
    local _, n = (frame.notes:GetText() or ""):gsub("\n", "")
    textH = (n + 2) * ((size or 13) + 4)
  end
  local h = math.max(view, textH)
  frame.notes:SetHeight(h)
  frame.content:SetHeight(h)
end

function J.Show(tab, keepScroll)
  if not frame then create() end
  local scrollWas = keepScroll and frame.scroll:GetVerticalScroll() or 0
  local target = ALIASES[tab] or tab or current
  if target ~= current and not switching then
    switching = true
    frame.search:SetText("")
    switching = false
  end
  current = target
  frame.title:SetText(L.J_TITLE)
  J.Style()
  local isNotes = current == "notes"
  local isSheet = current == "sheet"
  frame.notes:SetShown(isNotes)
  frame.text:SetShown(not isNotes)
  frame.search:SetShown(SEARCHABLE[current] == true)
  if picking then
    picking = false
    frame.picker:Hide(); frame.picker.take:Hide(); frame.picker.back:Hide()
    frame.scroll:Show()
  end
  frame.originLabel:SetShown(isSheet)
  frame.originBtn:SetShown(isSheet)
  frame.sheetBtn:SetShown(isSheet)
  frame.scroll:SetPoint("BOTTOMRIGHT", -36, isSheet and 44 or 14)
  frame.pageTitle:SetText(L["J_TAB_" .. current:upper()])
  frame.pageCount:SetText("")
  frame.content:EnableMouse(isNotes)
  if isNotes then
    J.Render({})
    frame.notes:SetText(ns.char.notes or "")
    frame.notes.hint:SetShown(frame.notes:GetText() == "" and not frame.notes:HasFocus())
    J.FitNotes()
  else
    frame.notes:ClearFocus()
    J.Render(J.Blocks(current, frame.search:GetText()))
  end
  frame.scroll:SetVerticalScroll(scrollWas)
  for id, b in pairs(frame.tabs) do
    b:SetText(L["J_TAB_" .. id:upper()])
    b.selected = id == current
    if b.selected then
      b:LockHighlight()
      b.label:SetTextColor(1, 1, 1)
      frame.tabMark:ClearAllPoints()
      frame.tabMark:SetPoint("TOPLEFT", b, "BOTTOMLEFT", 10, -1)
      frame.tabMark:SetPoint("TOPRIGHT", b, "BOTTOMRIGHT", -10, -1)
    else
      b:UnlockHighlight()
      local c = Theme.Palette().buttonText
      b.label:SetTextColor(c[1], c[2], c[3])
    end
  end
  C.GamePadButtons(frame, ns.db.settings.gamepad ~= false and C.GamePadEnabled())
  J.MarkRead()
  if isSheet then
    local o = ns.char.origin
    frame.originLabel:SetText(o and L.J_ORIGIN_CURRENT:format(o.name) or L.J_ORIGIN_NONE)
    frame.originBtn:SetText(o and L.J_ORIGIN_CHANGE or L.J_ORIGIN_NEXT)
    frame.sheetBtn:SetText(L.J_EXPORT_SHEET)
  end
  frame:Show()
end

function J.OnKey(self, key)
  local handled = false
  if C.InCombat() then
    handled = false
  elseif picking and key == "ESCAPE" then
    handled = true
    J.CloseOrigins()
  elseif picking and (key == "UP" or key == "DOWN") then
    handled = true
    local n = #pickList
    J.SelectOrigin(((pickIndex or 1) - 1 + (key == "DOWN" and 1 or -1)) % n + 1)
  elseif picking and key == "ENTER" then
    handled = true
    J.TakeOrigin()
  elseif key == "ESCAPE" then
    handled = true
    frame:Hide()
  elseif key == "LEFT" or key == "RIGHT" then
    handled = true
    local idx = 1
    for i, id in ipairs(TABS) do if id == current then idx = i end end
    idx = (idx - 1 + (key == "RIGHT" and 1 or -1)) % #TABS + 1
    J.Show(TABS[idx])
  end
  self:SetPropagateKeyboardInput(not handled)
end

-- Unread diary entries (the journal button shows a count).
function J.Unread()
  local c = ns.char
  if not c or not c.journal then return 0 end
  return math.max(0, #c.journal - (c.journalRead or 0))
end

function J.MarkRead()
  local c = ns.char
  if not c or not c.journal then return end
  c.journalRead = #c.journal
  if ns.UI.Launcher and ns.UI.Launcher.UpdateBadge then ns.UI.Launcher.UpdateBadge() end
end

function J.Current() return current end
function J.Frame() return frame end

function J.Toggle()
  if frame and frame:IsShown() then frame:Hide() else J.Show() end
end

function J.IsShown() return frame ~= nil and frame:IsShown() end
