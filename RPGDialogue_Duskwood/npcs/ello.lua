-- Lord Ello Ebonlocke, mayor of Darkshire, Town Hall. Voice: bibles/ello.md
-- Every conversation comes back to one question: where is the Stormwind Army?
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ello", id = TODO_NPC("Lord Ello Ebonlocke"), name = "Lord Ello Ebonlocke",
  bible = "bibles/ello.md", role = "noble", tier = "major",
  communities = { "darkshire" }, temper = { "proud" }, values = { "lawful", "ambitious" },
  notices = { "status", "stormwind" },

  greetings = {
    { id = "g_mayor", text = "The mayor's time is precious. Darkshire's more so." },
    { id = "g_army", when = { minLevel = 25 }, text = "Has Stormwind sent you? Tell me Stormwind has sent you." },
    { id = "g_hero", when = { townStanding = { town = "darkshire", min = 55 } }, text = "Ah. Darkshire's favourite. Come in, come in. Mind the council's chairs; they're older than they look." },
    { id = "g_distrust", when = { townStanding = { town = "darkshire", max = -20 } }, text = "The Night Watch has a file on you. A thick one." },
  },

  notice = {
    { id = "n_tabard", cat = "stormwind", when = { class = { "PALADIN", "WARRIOR" }, minLevel = 25 },
      text = "You've a soldier's bearing. Are you the vanguard, then? Is the Army behind you? No? No. Of course not." },
    { id = "n_shabby", cat = "status", when = { durability = { max = 0.25 } },
      text = "You'll forgive me if I don't offer you a seat. The council's upholstery has suffered enough this year." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lord Ello Ebonlocke, mayor of Darkshire, head of its council. I have petitioned Stormwind for soldiers more times than I can count. The Night Watch cannot do this alone." },
        { id = "h_messenger", tags = { "news" }, when = { questActive = TODO_QUEST("Messenger to Darkshire") },
          text = "A letter from Lakeshire? Solomon wants my help? I wrote to Stormwind for help. Perhaps Stormwind writes to Solomon. We could all save on ink." },
        { id = "h_embalmer", tags = { "news" }, when = { questActive = TODO_QUEST("Note to the Mayor") },
          text = "A note from the hermit up at Raven Hill? Let me see that. Read it again. Slowly. Night Watch! Someone fetch the Night Watch!" },
        { id = "h_revenge", tags = { "news" }, when = { questActive = TODO_QUEST("The Embalmer's Revenge") },
          text = "Whatever that hermit made is coming for Darkshire. Stop it before it reaches the square. I'll be in the Town Hall. Directing." },
        { id = "h_revenge_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Embalmer's Revenge"), days = 5 } },
          text = "The council has voted you its thanks. Unanimously. That has never happened. Please don't make a habit of being necessary." },
        { id = "h_westfall", when = { thread = { id = "westfall_left", beat = "b3_danuvin" } },
          text = "Westfall feels forgotten? Stormwind pulled its soldiers out of Duskwood when the king vanished. We've been forgotten so long we've started to rot." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "One of the sky folk. I don't suppose your people can do anything about the dark? No. A pity. You'd be very popular here." },
        { id = "h_letter", when = { metBefore = true }, text = "I have written to Stormwind again. Eloquently. At length. I expect the King's court is using my letters to start fires. It's cold in the capital, I hear." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night in Darkshire. Listen to the howling and tell me again that Stormwind has no cause to send soldiers." },
      },
      choices = {
        { text = "What does Darkshire need?", next = "need" },
        { text = "Why won't Stormwind send soldiers?", next = "army" },
        { text = "Good day, my lord.", next = "END" },
      },
    },
    need = {
      lines = {
        { id = "n_default", text = "Soldiers. Walls. Light that lasts past noon. Failing those, the Night Watch and whatever adventurers wander in out of the fog." },
      },
      choices = {
        { text = "Then I'll help the Night Watch.", next = "END", fx = { affinity = 2, standing = { darkshire = 1 }, align = { order = 1 } } },
        { text = "Sounds grim.", next = "END" },
      },
    },
    army = {
      big = true,
      lines = {
        { id = "a_default", text = "Because Duskwood is far from the Keep and close to everything that frightens it. So they leave the fog to us and send letters of support. I could paper the Town Hall with them." },
      },
      choices = {
        { text = "Darkshire deserves better.", next = "END", fx = { affinity = 2, opinion = { westfall = "abandoned" } } },
        { text = "Maybe the Night Watch is enough.", next = "enough", fx = { opinion = { westfall = "patience" } } },
      },
    },
    enough = {
      lines = { { id = "e_default", text = "Tell that to the families at Raven Hill. Tell it loudly. They're hard of hearing, being dead." } },
      choices = { { text = "...", next = "END", fx = { affinity = -1 } } },
    },
  },

  topics = {
    night_watch = { { id = "tp_watch", text = "Brave, underpaid, and outnumbered. My kinswoman runs it. Better than I would, I admit." } },
    worgen = { { id = "tp_worgen", text = "In the woods, every night. Closer every season. The council does not discuss them after dark." } },
    stalvan = { { id = "tp_stalvan", text = "Old business. Unpleasant business. Ask Smitts; he never let it go." } },
    blackrock = { { id = "tp_blackrock", text = "Lakeshire's problem. We have our own. Many of them." } },
    _none = { { id = "tp_none", text = "The council has no position on that. The council has too many positions on everything else." } },
  },
}
