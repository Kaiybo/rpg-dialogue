-- Maraudon: the caverns beneath Desolace where Zaetar and Theradras' children are entombed.
-- Celebras the Redeemed, Zaetar's son, freed of his curse and waiting by the Scepter's making.
-- Voices: bibles/dg_celebras.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Celebras the Redeemed: son of Zaetar, freed from his curse, forges the Scepter of Celebras.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_celebras", id = TODO_NPC("Celebras the Redeemed"), name = "Celebras the Redeemed", title = "Son of Zaetar",
  bible = "bibles/dg_celebras.md", role = "questgiver", tier = "major",
  temper = { "gentle", "melancholy" }, values = { "faithful", "wise" },
  notices = { "class", "race" },
  impression = {
    first = "Gratitude, and a weariness older than the caverns themselves.",
    third = "{name} freed Celebras, son of Zaetar, from the curse that bound him in Maraudon.",
  },
  greetings = {
    { id = "g_default", text = "You broke the curse that held me. I thank you, though there is little I can offer in this dark place." },
    { id = "g_scepter", when = { questActive = TODO_QUEST("The Scepter of Celebras") }, text = "You bear the rod and the gem. Stand back, and I will join them, as my father would have." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" }, text = "You walk the path of Cenarius, my grandsire. Then you are kin of a sort, and welcome." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" }, text = "Your people knew my father in the days when the forests were young. Few of them remember him kindly, I think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Celebras, son of Zaetar, who was the son of Cenarius. When my father fell, the earth-mother's hate came down upon all his children, and I lost myself in it for longer than I can measure." },
      },
      again = { { id = "h_again", text = "Ask what you will. I have had a long silence." } },
      choices = {
        { text = "Who was Zaetar?", next = "zaetar" },
        { text = "Who is Princess Theradras?", next = "theradras" },
        { text = "What is the Scepter of Celebras?", next = "scepter" },
        { text = "What became of your kin here?", next = "kin" },
        { text = "Rest now. I'll go on.", next = "END" },
      },
    },
    zaetar = {
      lines = { { id = "z_default", text = "My father was the son of Cenarius, a keeper of the grove. He loved Theradras, the earth elemental princess, and from that love came the centaur. When the centaur grew strong and savage, they turned on him and slew him." } },
      choices = {
        { text = "A father killed by his own children.", next = "BACK", reply = "Yes. The centaur still roam Desolace with his blood in them and none of his peace. I do not know whether to pity them or fear them." },
        { text = "Something else.", next = "BACK" },
      },
    },
    theradras = {
      lines = { { id = "t_default", text = "She is the princess of the earth, and her grief became rage. She buried my father deep and keeps his spirit with her. Her corruption seeps into the land, and that is why Desolace withers above you." } },
      choices = {
        { text = "Then she must be destroyed.", next = "BACK", reply = "Perhaps it is the only way. But remember that she loved him once, and that even ending her is a sorrow.", fx = { align = { light = -1 } } },
        { text = "Can her grief be eased instead?", next = "BACK", reply = "You have a kind heart. I tried, in my own way, and it made me into something cursed. Be careful where kindness leads you here.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scepter = {
      lines = { { id = "s_default", text = "A staff made from the rod of Celebras and the Celebrian Diamond, given to those who would reach my father's resting place without crawling the long way through Theradras' halls. With it, you can open the portal at the cavern's mouth." } },
      choices = {
        { text = "Then I'll bring you the pieces.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "The Khans who carry my father's spirit-gems roam the caverns, and the keepers of the grove sleep in green rot. Noxxion and the others were born of the poison here. They are not kin, only scars." } },
      choices = {
        { text = "I'm sorry for all you've lost.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    maraudon = { { id = "tp_mar", text = "Maraudon is my father's tomb and Theradras' house. It was holy once." } },
    _none = { { id = "tp_none", text = "I have been lost a long while. I do not know that." } },
  },
}
