-- The Scarlet Path (throughline): Brother Crowley in the Cathedral, Brother Anton in Desolace,
-- Raleigh the Devout in Southshore, Tyrosus at Light's Hope. The player decides whether
-- Anton hears what Raleigh saw.

local function boot(zone, subzone, packs)
  local ns = Loader.Boot({
    packs = packs,
    setup = function(state)
      local p = state.units.player
      p.class, p.classFile, p.level = "Priest", "PRIEST", 40
      state.zone, state.subzone = zone, subzone
    end,
  })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  Mock.Fire("ZONE_CHANGED_NEW_AREA")
  Mock.RunTimers()
  return ns
end

local function talk(name, id)
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-" .. id .. "-AB", name = name, level = 40, reaction = 5 }
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

local function text(ns) return plain(ns.UI.Dialogue.Frame().text:GetText()) or "" end
local function click(ns, needle)
  for i, b in ipairs(ns.UI.Dialogue.Frame().buttons) do
    if b:IsShown() and (plain(b.label:GetText()) or ""):find(needle, 1, true) then ns.UI.Dialogue.Click(i); return true end
  end
  return false
end

local function unfold(ns)
  local t = ns.Threads.State("scarlet_path")
  t.state = "unfolding"
  t.beats = { b1_crowley = 1, b2_anton = 2, b3_raleigh = 3 }
  return t
end

describe("The Scarlet Path", function()
  it("is a thread with four beats, and Raleigh is in Southshore", function()
    local ns = boot("Hillsbrad Foothills", "Southshore", { "RPGDialogue_World", "RPGDialogue_Hillsbrad" })
    local t = ns.Data.threads.scarlet_path
    ok(t and #t.beats == 4)
    eq(ns.Data.FindNPC(nil, "Raleigh the Devout").key, "raleigh")
  end)

  it("Crowley's warning starts it, in the Cathedral", function()
    local ns = boot("Stormwind City", "Cathedral Square", { "RPGDialogue_World", "RPGDialogue_Stormwind" })
    talk("Brother Crowley", 12336)
    eq(ns.Conversation.session.info.key, "crowley")
    local t = ns.char.threads.scarlet_path
    ok(t and t.beats.b1_crowley, "Crowley's beat heard")
    eq(t.state, "stirring")
  end)

  it("Raleigh reads Anton's letter, and the Monastery becomes something to ask about", function()
    local ns = boot("Hillsbrad Foothills", "Southshore", { "RPGDialogue_World", "RPGDialogue_Hillsbrad" })
    Mock.state.questLog[1052] = { title = "Down the Scarlet Path" }
    talk("Raleigh the Devout", 3980)
    eq(ns.Conversation.session.info.key, "raleigh")
    contains(text(ns), "send them home with the truth", "the beat speaks first")
    ok(ns.char.threads.scarlet_path and ns.char.threads.scarlet_path.beats.b3_raleigh, "Raleigh's beat heard")
    ok(ns.char.topics.scarlet_monastery, "learned about the Monastery")
    ok(click(ns, "Why did you leave the Crusade?"))
    contains(text(ns), "anyone without the tabard")
    leave(ns)
    talk("Raleigh the Devout", 3980)
    contains(text(ns), "Anton's letter", "then the letter itself")
  end)

  it("telling Anton the truth resolves it, and he remembers", function()
    local ns = boot("Desolace", "Nijel's Point", { "RPGDialogue_World", "RPGDialogue_Desolace" })
    local t = unfold(ns)
    talk("Brother Anton", 4880)
    ok(click(ns, "Raleigh read your letter, Brother."))
    ok(click(ns, "He left the Crusade. He told me why."))
    ok(click(ns, "They torture innocents and call them plagued."))
    eq(t.state, "resolved")
    contains(text(ns), "only rumors")
    leave(ns)
    talk("Brother Anton", 4880)
    contains(text(ns), "praying on what you told me")
  end)

  it("sparing him sours it", function()
    local ns = boot("Desolace", "Nijel's Point", { "RPGDialogue_World", "RPGDialogue_Desolace" })
    local t = unfold(ns)
    talk("Brother Anton", 4880)
    ok(click(ns, "Raleigh read your letter, Brother."))
    ok(click(ns, "He's well. He sends his blessing."))
    eq(t.state, "soured")
    leave(ns)
    talk("Brother Anton", 4880)
    contains(text(ns), "sends his blessing, you said")
    ok(not click(ns, "Raleigh read your letter, Brother."), "the question is settled")
  end)

  it("Benedictus hears where Crowley's road ends", function()
    local ns = boot("Stormwind City", "Cathedral Square", { "RPGDialogue_World", "RPGDialogue_Stormwind" })
    unfold(ns)
    talk("Archbishop Benedictus", 1284)
    ok(click(ns, "I followed Crowley's road to its end"))
    ok(click(ns, "Innocents tortured as plagued."))
    contains(text(ns), "without praying with me first")
  end)
end)
