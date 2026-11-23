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
