-- Deeper conversations: a hub to come back to, asked-and-answered branches hidden, explored
-- ones dimmed on later visits, up to six replies, short "again" lines on the way back.

local function boot(opts)
  opts = opts or {}
  local ns = Loader.Boot({
    packs = { "RPGDialogue_TestPack", "RPGDialogue_TestPack2" },
    setup = function(state)
      state.units.player.level = 12
      if opts.class then state.units.player.classFile = opts.class end
    end,
  })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  for _, n in ipairs({ "GossipFrame", "QuestFrame", "MerchantFrame" }) do if _G[n] then _G[n]:Hide() end end
  return ns
end

local function talk(ns)
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-9003-AB", name = "Warden Tess", level = 20, reaction = 5 }
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

local function replies(ns)
  local out = {}
  for _, b in ipairs(ns.UI.Dialogue.Frame().buttons) do
    if b:IsShown() and not b.isGetOn then out[#out + 1] = b.label:GetText() end
  end
  return out
end

local function has(list, needle)
  for _, t in ipairs(list) do if t:find(needle, 1, true) then return t end end
  return nil
end

local function pick(ns, needle)
  for i, b in ipairs(ns.UI.Dialogue.Frame().buttons) do
    if b:IsShown() and b.label:GetText():find(needle, 1, true) then ns.UI.Dialogue.Click(i); return end
  end
  error("no reply containing " .. needle)
end

local function text(ns) return plain(ns.UI.Dialogue.Frame().text:GetText()) end

local function mcbride()
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-197-AB", name = "Marshal McBride", level = 20, reaction = 5 }
  local f = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
  f:Show()
  Mock.Fire("GOSSIP_SHOW")
  Mock.RunTimers()
end

describe("Stances", function()
  it("alignment comes from statements only, and a stance taken shuts out the others for good", function()
    local ns = boot()
    ok(ns.Engine.IsQuestion("Are they all guilty?") and ns.Engine.IsQuestion("Why?\"") and not ns.Engine.IsQuestion("Hang them."))
    mcbride()
    pick(ns, "Defias")
    ok(has(replies(ns), "Hang the lot of them."))
    pick(ns, "all guilty")
    eq(ns.char.align.light, 0, "a question shifts nothing")
    leave(ns)
    mcbride()
    pick(ns, "Defias")
    pick(ns, "Give them")
    local light = ns.char.align.light
    ok(light > 0)
    leave(ns)
    mcbride()
    pick(ns, "Defias")
    ok(not has(replies(ns), "Hang the lot"), "the opposing stance is gone")
    pick(ns, "Give them")
    eq(ns.char.align.light, light, "the same stance doesn't count twice")
  end)
end)

describe("Deeper conversations", function()
  it("comes BACK to the hub with a short again line, and hides what was asked", function()
    local ns = boot()
    talk(ns)
    eq(ns.Conversation.session.info.key, "tess")
    contains(text(ns), "Ask, then go.")
    pick(ns, "Tell me about the wall.")
    contains(text(ns), "Old stone")
    pick(ns, "Who built it?")
    contains(text(ns), "Nobody remembers")
    pick(ns, "Something else.")
    contains(text(ns), "Anything else? Be quick.")
    local r = replies(ns)
    ok(not has(r, "Tell me about the wall."), "the wall was asked and answered")
    ok(has(r, "Who are you?"), "the other branch is still there")
    ok(has(r, "Goodbye."), "exits stay")
  end)

  it("a reply that leads to the start node counts as going back, and is never hidden", function()
    local ns = boot()
    talk(ns)
    pick(ns, "Who are you?")
    pick(ns, "Back to it.")
    contains(text(ns), "Anything else? Be quick.")
    pick(ns, "Tell me about the wall.")
    pick(ns, "Something else.")
    ok(not has(replies(ns), "Who are you?"))
    ok(not has(replies(ns), "Tell me about the wall."))
  end)

  it("offers replies that only some characters get", function()
    local ns = boot({ class = "PALADIN" })
    talk(ns)
    ok(has(replies(ns), "A paladin's question."))
    leave(ns)
    local ns2 = boot({ class = "MAGE" })
    talk(ns2)
    ok(not has(replies(ns2), "A paladin's question."))
  end)

  it("on a later visit, branches already explored come back dimmed", function()
    local ns = boot()
    talk(ns)
    pick(ns, "Tell me about the wall.")
    pick(ns, "Something else.")
    leave(ns)
    talk(ns)
    local wall = has(replies(ns), "Tell me about the wall.")
    ok(wall, "explored branches are still offered on a new visit")
    ok(wall:find("|c", 1, true), "and dimmed")
    ok(not has(replies(ns), "Who are you?"):find("|cff", 4, true), "fresh ones are not")
  end)

  it("shows up to six replies, dropping explored then unconditional ones first", function()
    local ns = boot()
    local node = { choices = {} }
    for i = 1, 6 do node.choices[i] = { text = "branch " .. i, next = "n" .. i } end
    node.choices[7] = { text = "only for you", next = "n7", when = { minLevel = 1 } }
    node.choices[8] = { text = "bye", next = "END" }
    local ctx = ns.Context.New({ unit = "player" })
    local env = ns.Engine.NewEnv({ name = "x" }, ctx, {})
    local out = ns.Engine.Choices(node, ctx, env, { explored = { n2 = true } })
    eq(#out, 6)
    local texts = {}
    for _, e in ipairs(out) do texts[#texts + 1] = e.choice.text end
    local joined = table.concat(texts, ",")
    ok(not joined:find("branch 2"), "explored dropped first: " .. joined)
    ok(joined:find("only for you"), "gated reply kept: " .. joined)
    ok(joined:find("bye"), "exit kept: " .. joined)
  end)
end)
