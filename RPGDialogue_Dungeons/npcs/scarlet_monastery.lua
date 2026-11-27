-- Scarlet Monastery: the Crusade's leaders who speak before steel is drawn: High Inquisitor
-- Whitemane, Scarlet Commander Mograine, and Arcanist Doan in the library.
-- Voices: bibles/dg_whitemane.md, bibles/dg_mograine.md, bibles/dg_doan.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local SM_QUEST = TODO_QUEST("In the Name of the Light")
local SM_HORDE = TODO_QUEST("Into The Scarlet Monastery")

---------------------------------------------------------------------------
-- Vorrel Sengutz: a Forsaken dying on Interrogator Vishas's table in the Graveyard.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_vorrel", id = 3981, name = "Vorrel Sengutz", role = "questgiver", tier = "quest",
  temper = { "bitter", "fading" }, values = { "love", "vengeance" },
  notices = { "faction", "race" },
  impression = {
    first = "A tortured Forsaken with one last message for his wife.",
    third = "{name} found Vorrel Sengutz dying on the Scarlet Crusade's interrogation table.",
  },
  greetings = {
    { id = "g_default", text = "Not... not the interrogator. Thank the Dark Lady, someone else at last." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Living, and Alliance besides. Have you come to finish what Vishas started, or merely to watch?" },
  },
  start = "hello",
  nodes = {

    vs_learn = {
      lines = { { id = "vsl_1", text = "That the Monastery is four houses under one roof. The dead mage Thalnos in the graveyard outside, the Houndmaster and Arcanist Doan among the books, Herod drilling his men in the armoury, and in the cathedral, Mograine and Whitemane, who are the heart of it all." } },
      choices = {
        { text = "Tell me about Mograine and Whitemane.", next = "vs_learn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vs_learn2 = {
      lines = { { id = "vsl2_1", text = "Mograine commands and Whitemane prays, and the brothers whisper that she can raise him from death itself if he falls. I heard it said in this very cell, and the men who said it were proud of it, which tells you how far the Light has gone from this place." } },
      choices = {
        { text = "Raising the dead. They're no better than the Scourge.", next = "vs_learn3" },
        { text = "Then they must fall together, or not at all.", next = "BACK", reply = "Yes. Strike him down and do not let her finish her prayer." },
        { text = "Something else.", next = "BACK" },
      },
    },
    vs_learn3 = {
      lines = { { id = "vsl3_1", text = "They would say it is the Light's gift and our raising the Lich King's curse. I was raised by neither, I think, only left behind by both, and the Dark Lady gathered up what was left." } },
      choices = {
        { text = "Left behind, and still you served.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vs_alive = {
      lines = { { id = "vsa_1", text = "No, it was not. Vishas wanted names, the names of every servant of the Dark Lady between Tarren Mill and the Monastery gates, and he believed a Forsaken's tongue would loosen if he cut slowly enough." } },
      choices = {
        { text = "And did you give him any?", next = "vs_alive2" },
        { text = "I'm Alliance. Why should I help a Forsaken spy?", next = "vs_alive2", when = { faction = "Alliance" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vs_alive2 = {
      lines = { { id = "vsa2_1", text = "Not one, and that is the only victory I have to take with me. As for helping, I ask nothing for the Dark Lady; I ask only that someone tell Monika, and that Vishas stop singing his hymns over the next one on this table." } },
      choices = {
        { text = "No one deserves that table. I'll see to Vishas.", next = "BACK", reply = "Then I will rest a little easier, if the Forsaken are permitted to rest." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "My name is Vorrel Sengutz, and I have been on this table for weeks while Interrogator Vishas asked me questions I could not answer. I will not leave it alive again, I think, so listen to me while I can still speak." },
        { id = "h_forsaken", when = { race = "Scourge" }, text = "One of us, come so deep into the Crusade's house. I am Vorrel Sengutz, and I am nearly finished, so hear me out before the Scarlets come back." },
      },
      again = { { id = "h_again", text = "There is little time. What else?" } },
      choices = {
        { text = "What do you need?", next = "wife" },
        { text = "Who did this to you?", next = "vishas" },
        { text = "Why did you come here?", next = "why" },
        { text = "I'll avenge you, brother.", next = "avenge", when = { race = "Scourge" } },
        { text = "What did you learn about the Crusade in here?", next = "vs_learn" },
        { text = "They kept you alive for weeks. That wasn't mercy.", next = "vs_alive" },
        { text = "Rest now.", next = "END" },
      },
    },
    wife = {
      lines = { { id = "w_default", text = "My wife, Monika, waits for me in Tarren Mill. Tell her what became of me, and tell her I held my tongue to the end, so she knows I was not broken." } },
      choices = {
        { text = "I'll find her.", next = "wife2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wife2 = {
      lines = { { id = "w2_default", text = "She will want more than words, I know her. Do what she asks of you, and you will be doing it for me as well." } },
      choices = {
        { text = "Vengeance is what you deserve.", next = "BACK", reply = "Vengeance, yes. It is all the Forsaken have ever been promised.", fx = { align = { light = -1 } } },
        { text = "She deserves peace, not more blood.", next = "BACK", reply = "Peace. I have forgotten what that word tastes like, but perhaps she has not.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vishas = {
      lines = { { id = "v_default", text = "Interrogator Vishas, who calls his work the Light's mercy. He sings hymns while he cuts, and he believes every word of them, which is the worst part." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "y_default", text = "The Dark Lady sends her servants to learn what the Crusade plans, and I was one of them. I learned a great deal, but I learned it from the inside of a cell." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    avenge = {
      lines = { { id = "a_default", text = "Then do it well, and do it for Monika as much as for me. Tell Vishas who sent you, if he lives long enough to hear it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I have no strength left for that. Tell Monika I am sorry." } } },
}
