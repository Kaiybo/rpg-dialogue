-- "Ask about..." in depth (Morrowind-style): topics heard in what people say are learned and
-- linked, clicking one asks about it; "ask anyone" topics everybody answers; rumors from
-- anyone; answers that open a branch; the list grouped by category with asked marks.

local function boot(opts)
  opts = opts or {}
  local ns = Loader.Boot({
    packs = opts.packs or { "RPGDialogue_World", "RPGDialogue_Riverglades", "RPGDialogue_Elwynn" },
    setup = function(state)
      state.units.player.level = 40
      state.zone, state.subzone = opts.zone or "Riverglades", opts.subzone or "Farholde Keep"
    end,
  })
  ns.db.settings.instantText = opts.typewriter ~= true
  ns.db.settings.sounds = false
  Mock.Fire("ZONE_CHANGED_NEW_AREA")
  Mock.RunTimers()
  for _, n in ipairs({ "GossipFrame", "QuestFrame", "MerchantFrame" }) do if _G[n] then _G[n]:Hide() end end
  return ns
end

local function talk(name, id)
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-" .. (id or 91000) .. "-AB", name = name, level = 50, reaction = 5 }
  local f = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
  f:Show()
  Mock.Fire("GOSSIP_SHOW")
  Mock.RunTimers()
end

local function leave(ns)
  if _G.GossipFrame then _G.GossipFrame:Hide() end
  if ns.Conversation.session then ns.Conversation.Finish() end
  Mock.Fire("GOSSIP_CLOSED", false)
  Mock.RunTimers()
end

local function raw(ns) return ns.UI.Dialogue.Frame().text:GetText() or "" end

describe("Ask about: hearing topics", function()
  it("learns a topic named in what someone says, and links the word", function()
    local ns = boot()
    ok(not ns.char.topics.brotherhood_horse)
    talk("Demar Brant", 91001)
    eq(ns.Conversation.session.info.key, "demar")
    ok(ns.char.topics.brotherhood_horse, "heard 'Brotherhood of the Horse' and learned it")
    ok(raw(ns):find("|Hrpgdtopic:brotherhood_horse|h", 1, true), "the word is a link: " .. raw(ns))
    contains(raw(ns), "Brotherhood of the Horse")
  end)

  it("types plain text, then shows the links when typing finishes", function()
    local ns = boot({ typewriter = true })
    talk("Demar Brant", 91001)
    ok(not raw(ns):find("|H", 1, true), "no half-typed link codes while typing")
    ok(ns.UI.Dialogue.Frame().textClick:IsShown(), "click-to-finish cover while typing")
    ns.UI.Dialogue.FinishText()
    ok(raw(ns):find("|Hrpgdtopic:", 1, true), "links once typing is done")
    ok(not ns.UI.Dialogue.Frame().textClick:IsShown(), "cover gone, so links can be clicked")
  end)

  it("clicking a topic word asks about it", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    local f = ns.UI.Dialogue.Frame()
    local click = f:GetScript("OnHyperlinkClick")
    ok(click, "the box handles link clicks")
    click(f, "rpgdtopic:brotherhood_horse", "Brotherhood of the Horse", "LeftButton")
    contains(raw(ns), "Older than the First War")
    contains(f.subtitle:GetText(), "Brotherhood of the Horse")
    ok(ns.Topics.AskedOf("brotherhood_horse", "demar"))
  end)

  it("with the setting off, topics are still learned but not linked", function()
    local ns = boot()
    ns.db.settings.topicLinks = false
    talk("Demar Brant", 91001)
    ok(ns.char.topics.brotherhood_horse)
    ok(not raw(ns):find("|H", 1, true))
  end)

  it("matches whole words, plurals and possessives, and not ordinary phrases", function()
    local ns = boot()
    local function ids(text)
      local out = {}
      for _, f in ipairs(ns.Topics.Find(text)) do out[#out + 1] = f.id end
      return table.concat(out, ",")
    end
    eq(ids("Hogger's den"), "hogger")
    eq(ids("Kobolds in the mine"), "kobolds")
    eq(ids("a kobold"), "kobolds")
    eq(ids("a debt collector"), "", "'The Collector' never links from ordinary words")
    eq(ids("hoggers"), "hogger")
    eq(ids("thoggerx"), "", "not inside other words")
    eq(ids("The Siege of Farholde"), "siege_of_farholde", "the longer name wins")
  end)
end)

describe("Ask about: anyone can be asked", function()
  it("lists the ask-anyone topics first, under their own header", function()
    local ns = boot()
    local rows = ns.Topics.Rows(ns.Topics.Known(false), false)
    eq(rows[1].header, "Ask anyone")
    eq(rows[2].topic.id, "knows")
    eq(rows[3].topic.id, "background")
    eq(rows[6].topic.id, "rumors")
  end)

  it("a named NPC tells their own story; an unnamed one answers from their role", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    ns.Conversation.Ask("background")
    contains(raw(ns), "The Brotherhood is my story")
    leave(ns)
    talk("Sentry Kalis", 91002)
    eq(ns.Conversation.session.info.role, "guard")
    local w = ns.Engine.PickTopic(ns.Conversation.session.info, "trade", ns.Conversation.session.ctx, ns.Conversation.session.env)
    ok(w and w.gid:find("ask_guard", 1, true), "the guard's trade, from the guard ask pool: " .. tostring(w and w.gid))
  end)

  it("a named NPC with no story of their own deflects, and never borrows a role's", function()
    local ns = boot({ zone = "Elwynn Forest", subzone = "Goldshire" })
    talk("Smith Argus", 91003)
    eq(ns.Conversation.session.info.key, "argus")
    local s = ns.Conversation.session
    local w = ns.Engine.PickTopic(s.info, "background", s.ctx, s.env)
    ok(w and w.gid:find("^generic"), "a generic deflection: " .. tostring(w and w.gid))
    local t = ns.Engine.PickTopic(s.info, "trade", s.ctx, s.env)
    ok(t and t.gid:find("ask_blacksmith", 1, true), "their work comes from the role: " .. tostring(t and t.gid))
  end)

  it("anyone passes on the latest rumors going round their zone", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    local s = ns.Conversation.session
    local w = ns.Engine.PickTopic(s.info, "rumors", s.ctx, s.env)
    ok(w and w.gid:find("^rumor:riverglades"), "a Riverglades rumor from a soldier: " .. tostring(w and w.gid))
  end)

  it("question-only pools never make an unnamed NPC talk", function()
    local ns = boot()
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-91004-AB", name = "Some Laborer", level = 30 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = { pooled = true, role = "worker", communities = {}, name = "Some Laborer" }
    eq(#ns.Data.PoolsFor(info, ctx), 0)
    ok(#ns.Data.PoolsFor(info, ctx, true) > 0)
  end)
end)

describe("Ask about: answers lead somewhere", function()
  it("an answer can open a branch of the conversation", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    local s = ns.Conversation.session
    for _ = 1, 4 do
      ns.Conversation.Ask("fern_crimsonleaf")
      if s.node == "fern" then break end
    end
    eq(s.node, "fern", "one of Demar's answers about Fern opens that subject")
    local labels = {}
    for _, b in ipairs(ns.UI.Dialogue.Frame().buttons) do
      if b:IsShown() then labels[#labels + 1] = b.label:GetText() end
    end
    contains(table.concat(labels, "|"), "Could she have lived?")
  end)

  it("the list marks what you've already asked this person, and keys skip headers", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    ns.Conversation.Ask("background")
    local Ask = ns.UI.AskAbout
    Ask.Toggle(ns.UI.Dialogue.Frame())
    local found
    for _, row in ipairs(Ask.Rows()) do
      local t = row:IsShown() and row.label:GetText() or ""
      if t:find("Their story", 1, true) then found = t end
    end
    ok(found, "Their story is listed")
    contains(found, "(asked)")
    Ask.Move(1)
    eq(Ask.Selected(), "knows", "the first key press lands on a topic, not the header")
    Ask.Move(-1)
    ok(Ask.Selected() ~= nil, "moving back wraps to a topic")
  end)
end)

describe("The lost of Farholde (throughline)", function()
  local function bootPort()
    local ns = boot({ subzone = "Powderfuse Port" })
    return ns
  end
  local function click(ns, needle)
    for i, b in ipairs(ns.UI.Dialogue.Frame().buttons) do
      if b:IsShown() and (plain(b.label:GetText()) or ""):find(needle, 1, true) then ns.UI.Dialogue.Click(i); return true end
    end
    return false
  end

  it("Gray carries the first beat, and teaches who Fern was", function()
    local ns = bootPort()
    talk("Gray Dawnbright", 91010)
    contains(raw(ns), "Presumed")
    ok(ns.char.threads.farholde_lost and ns.char.threads.farholde_lost.beats.b1_gray, "beat heard")
    ok(ns.char.topics.fern_crimsonleaf, "topic learned")
  end)

  it("after Demar's beat, the player decides what to carry back to Gray", function()
    local ns = bootPort()
    local t = ns.Threads.State("farholde_lost")
    t.state = "unfolding"
    t.beats = { b1_gray = 1, b2_ashe = 2, b4_demar = 3 }
    ns.char.topics.fern_crimsonleaf = { t = 1 }
    talk("Gray Dawnbright", 91010)
    ok(click(ns, "I spoke to Demar about Fern."), "the reply is offered")
    ok(click(ns, "That's not a grave."), "the hopeful answer is offered")
    eq(t.state, "resolved")
    leave(ns)
    Mock.state.subzone = "Farholde Keep"
    talk("Demar Brant", 91001)
    contains(raw(ns), "Gray came up to the keep")
  end)

  it("telling Gray to let her rest sours it, and he stops talking about her", function()
    local ns = bootPort()
    local t = ns.Threads.State("farholde_lost")
    t.state = "unfolding"
    t.beats = { b1_gray = 1, b2_ashe = 2, b4_demar = 3 }
    ns.char.topics.fern_crimsonleaf = { t = 1 }
    talk("Gray Dawnbright", 91010)
    click(ns, "I spoke to Demar about Fern.")
    ok(click(ns, "Let her rest, Gray."))
    eq(t.state, "soured")
    leave(ns)
    talk("Gray Dawnbright", 91010)
    contains(raw(ns), "I've heard it.")
  end)
end)
