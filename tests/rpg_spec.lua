-- 0.34.0: RPG elements. "What do you know?", what people had nothing to say about,
-- disposition, identity tags, approval and check results, and Ask about inside DialogueUI.

local function boot(opts)
  opts = opts or {}
  local ns = Loader.Boot({
    packs = opts.packs or { "RPGDialogue_World", "RPGDialogue_Riverglades", "RPGDialogue_Elwynn" },
    setup = function(state)
      state.units.player.level = 40
      state.zone, state.subzone = opts.zone or "Riverglades", opts.subzone or "Farholde Keep"
    end,
  })
  ns.db.settings.instantText = true
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

local function raw(ns) return ns.UI.Dialogue.Frame().text:GetText() or "" end

describe("What do you know?", function()
  it("lists what they can speak to as links, and teaches every one", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    local s = ns.Conversation.session
    local known = ns.Engine.TopicsKnownBy(s.info, s.ctx, s.env)
    ok(#known > 0, "Demar knows something")
    eq(known[1].own, true, "his own topics come first")
    ns.char.topics[known[1].id] = nil
    ns.Conversation.Ask("knows")
    ok(ns.char.topics[known[1].id], "learned the topic he named")
    ok(raw(ns):find("|Hrpgdtopic:" .. known[1].id .. "|h", 1, true), "the topic is a link: " .. raw(ns))
    contains(ns.UI.Dialogue.Frame().subtitle:GetText(), "What do you know?")
    local mem = ns.char.npc[s.memKey]
    ok(mem.knows and mem.knows[known[1].id], "remembered that he knows it")
  end)

  it("groups what they said they know right after Ask anyone", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    ns.Conversation.Ask("knows")
    local rows = ns.Topics.Rows(ns.Topics.Known(false, ns.Conversation.session.memKey), false)
    local headers = {}
    for _, r in ipairs(rows) do if r.header then headers[#headers + 1] = r.header end end
    eq(headers[1], "Ask anyone")
    eq(headers[2], "What they can tell you about")
  end)

  it("never counts brush-offs or the generic fallback as knowing", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    local s = ns.Conversation.session
    for _, e in ipairs(ns.Engine.TopicsKnownBy(s.info, s.ctx, s.env)) do
      ok(e.id ~= "_none" and not ns.Topics.IsStandard(e.id), "a real topic: " .. e.id)
    end
  end)

  it("marks a topic they had nothing to say about", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    local s = ns.Conversation.session
    local mine = {}
    for _, e in ipairs(ns.Engine.TopicsKnownBy(s.info, s.ctx, s.env)) do mine[e.id] = true end
    local none
    for id, def in pairs(ns.Data.topics) do
      if not def.standard and not mine[id] then none = id; break end
    end
    ok(none, "some topic Demar knows nothing about")
    ns.Topics.Teach(none)
    ns.Conversation.Ask(none)
    ok(ns.Topics.NothingFrom(none, s.memKey), "recorded as nothing to say")
    ns.UI.AskAbout.Toggle(ns.UI.Dialogue.Frame())
    local found
    for _, row in ipairs(ns.UI.AskAbout.Rows()) do
      if row:IsShown() and row.topic == none then found = row.label:GetText() end
    end
    if found then contains(found, "nothing to say") end
  end)

  it("the button says how many topics you know", function()
    local ns = boot()
    ns.Topics.Teach("hogger")
    talk("Demar Brant", 91001)
    contains(ns.UI.Dialogue.Frame().ask:GetText(), "Ask about... (")
  end)
end)

describe("Disposition", function()
  it("starts near neutral and moves with what passes between you", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    local s = ns.Conversation.session
    local before = ns.Disposition.For(s.env, s.ctx)
    ok(before >= 35 and before <= 65, "about neutral: " .. before)
    s.mem.affinity = (s.mem.affinity or 0) + 3
    eq(ns.Disposition.For(s.env, s.ctx), math.min(100, before + 12))
  end)

  it("shows in the box with its tier, and the condition reads it", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    local f = ns.UI.Dialogue.Frame()
    ok(f.disp:IsShown(), "disposition shown")
    contains(f.disp.label:GetText(), "Disposition: ")
    local s = ns.Conversation.session
    s.mem.affinity = 10
    ok(ns.Conditions.Eval({ disposition = { min = 75 } }, s.ctx, s.env))
    ok(not ns.Conditions.Eval({ disposition = { max = 34 } }, s.ctx, s.env))
    eq(ns.Disposition.TierName(ns.Disposition.For(s.env, s.ctx)), "Devoted")
  end)

  it("warm regard is enough to persuade", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    local s = ns.Conversation.session
    s.mem.affinity = 0
    s.ctx.spoofed = { disposition = 70 }
    ok(ns.Engine.CheckChoice({ tag = "Persuade" }, s.ctx, s.env))
    s.ctx.spoofed = { disposition = 40 }
    ns.char.traits = {}
    ok(not ns.Engine.CheckChoice({ tag = "Persuade" }, s.ctx, s.env))
  end)

  it("can be turned off", function()
    local ns = boot()
    ns.db.settings.showDisposition = false
    talk("Demar Brant", 91001)
    eq(ns.UI.Dialogue.Frame().disp:IsShown(), false)
  end)
end)

describe("Replies say where they come from", function()
  it("tags a reply that's there because of who you are", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    local ctx = ns.Conversation.session.ctx
    ctx.className, ctx.raceName = "Priest", "Human"
    eq(ns.Conversation.IdentityTag({ class = "PRIEST" }, ctx), "Priest")
    eq(ns.Conversation.IdentityTag({ race = "Human", class = "PRIEST" }, ctx), "Human Priest")
    eq(ns.Conversation.IdentityTag({ all = { { race = "Human" }, { minLevel = 10 } } }, ctx), "Human")
    eq(ns.Conversation.IdentityTag({ any = { { class = "PRIEST" }, { class = "PALADIN" } } }, ctx), nil, "not from any")
    eq(ns.Conversation.IdentityTag({ not_ = true }, ctx), nil)
    eq(ns.Conversation.IdentityTag({ profession = { name = "Alchemy", min = 150 } }, ctx), "Alchemy")
    eq(ns.Conversation.IdentityTag({ questDone = 1 }, ctx), nil)
  end)

  it("says when someone approves, and what a check did", function()
    local ns = boot()
    talk("Demar Brant", 91001)
    local note = ns.Conversation.ChoiceNote({}, nil, { affinity = 2 }, 50)
    contains(note, "Demar Brant approves greatly.")
    note = ns.Conversation.ChoiceNote({}, nil, { affinity = -1 }, 50)
    contains(note, "Demar Brant disapproves.")
    note = ns.Conversation.ChoiceNote({ tag = "Persuade" }, false, nil, 50)
    eq(note, "Persuade: failed.")
    ns.db.settings.approval = false
    eq(ns.Conversation.ChoiceNote({}, nil, { affinity = 2 }, 50), nil)
  end)
end)
