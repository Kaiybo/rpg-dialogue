-- The Temple of Atal'Hakkar (Sunken Temple), Swamp of Sorrows: the Shade of Eranikus, the green
-- dragon set to guard the Atal'ai and slowly driven mad by the Nightmare, who speaks before fighting.
-- Voices: bibles/dg_eranikus.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Shade of Eranikus: consort of Ysera, set by the Green Flight to guard the drowned temple.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_eranikus", id = TODO_NPC("Shade of Eranikus"), name = "Shade of Eranikus", title = "Consort of Ysera",
  bible = "bibles/dg_eranikus.md", role = "boss", tier = "major",
  temper = { "tormented", "proud" }, values = { "dutiful", "wrathful" },
  notices = { "class", "race" },
  impression = {
    first = "Something vast and sorrowful, half-drowned in a dream it cannot wake from.",
    third = "{name} faced the Shade of Eranikus in the depths of the Sunken Temple.",
  },
  greetings = {
    { id = "g_default", text = "This temple is under my watch, mortal. The Atal'ai will not raise their god while I endure, and neither will you disturb this place." },
    { id = "g_essence", when = { questActive = TODO_QUEST("The Essence of Eranikus") }, text = "You seek my essence? Many have come to bleed me, little one. Come closer, then, and learn why they failed." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" }, text = "You smell of the Dream, druid. Do you hear it too, the whispering beneath the green? Do not listen." },
    { id = "n_troll", cat = "race", when = { race = "Troll" }, text = "A troll. The blood of those who drowned this place runs in you. Hakkar would gladly have you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Eranikus, chosen of Ysera, set here by my flight to keep the Atal'ai from calling Hakkar back into this world. I have stood guard so long the Dream itself has begun to rot around me, and I am no longer certain which voices are mine." },
      },
      again = { { id = "h_again", text = "Speak, before the whispers decide for me." } },
      choices = {
        { text = "Who are the Atal'ai?", next = "atalai" },
        { text = "What happened to you down here?", next = "nightmare" },
        { text = "Tell me of Ysera.", next = "ysera" },
        { text = "We're here to end you, dragon.", next = "defy" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    atalai = {
      lines = { { id = "a_default", text = "Priests of the Gurubashi who worshipped Hakkar the Soulflayer. Their own people cast them out, and Ysera drowned their temple in the swamp. Still they whisper, still they bleed, still they try to call their god." } },
      choices = {
        { text = "Then your watch protects us all.", next = "BACK", reply = "So my queen told me. It is a cold comfort in the dark, but I hold it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nightmare = {
      lines = { { id = "n_default", text = "There is a shadow in the Emerald Dream, a creeping wrongness. I slept here and dreamed, and it found me. My brothers of the Green Flight who guard this hall now hear it too, and they have stopped telling friend from foe." } },
      choices = {
        { text = "You must fight it, Eranikus.", next = "BACK", reply = "Every hour, little one. Every hour I lose a little more, and still I fight.", fx = { align = { order = 1 } } },
        { text = "Some burdens should be laid down.", next = "BACK", reply = "Dangerous words to a dragon tired beyond your knowing. Do not tempt me with rest I cannot have.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysera = {
      lines = { { id = "y_default", text = "The Dreamer, Aspect of the Green, my queen and my love. She charged me with this duty, and I have not seen her face since. Perhaps she does not know what I have become. Perhaps she does." } },
      choices = {
        { text = "She'd not abandon you.", next = "BACK", fx = { affinity = 1 }, reply = "You speak of her as though you knew her. I wish I shared your faith." },
        { text = "Something else.", next = "BACK" },
      },
    },
    defy = {
      lines = { { id = "d_default", text = "Then the madness wins after all. Come, mortals. Let us see whether you can do what Hakkar's priests never could." } },
      choices = {
        { text = "So be it.", next = "END" },
        { text = "No. Wait.", next = "BACK" },
      },
    },
  },
  topics = {
    hakkar = { { id = "tp_hak", text = "The Soulflayer, the blood god. Should he return, the world will drown in red." } },
    _none = { { id = "tp_none", text = "I know only the temple, the Dream, and the whispers." } },
  },
}
