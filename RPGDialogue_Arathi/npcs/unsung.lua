-- Refuge Pointe's macecrafter, with nothing to say until now. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "jannos", id = TODO_NPC("Jannos Ironwill"), name = "Jannos Ironwill",
  title = "Superior Macecrafter",
  bible = "bibles/unsung.md", role = "blacksmith", tier = "service",
  communities = { "refuge_pointe" }, temper = { "stubborn", "steady" }, values = { "loyal", "practical" },
  notices = { "class", "kit" },

  impression = {
    first = "Jannos Ironwill forges maces for the soldiers of Refuge Pointe and has the patience of a dwarf who has watched too many wars. He believes the Highlands can be won back one cracked skull at a time.",
    third = "{name} met Jannos Ironwill, the macecrafter of Refuge Pointe.",
  },

  greetings = {
    { id = "g_forge", text = "Maces, hammers and flails, all of them made to crack an ogre's head. Have a look, friend." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the Pointe, eh? Still swingin', I hope." },
  },

  notice = {
    { id = "n_holy", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "One of the Light's own, eh? I've made maces for the Silver Hand in my day, friend, and I'll make one for ye just as gladly, blessed or not." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Yer kit's had a beating, and from the look of the dents, it was the Boulderfist. They hit like a rockslide, so ye'll want something heavy to hit back with." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jannos Ironwill, macecrafter. I came to Refuge Pointe to help the League of Arathor take the Highlands back, and since I'm too old to march with them, I make the maces they carry instead." },
      },
      again = {
        { id = "h_again", text = "What else d'ye want to know about the Pointe?" },
        { id = "h_again2", text = "Go on, friend; I'll keep the forge hot while ye talk." },
      },
      choices = {
        { text = "Show me your maces.", next = "BUSINESS" },
        { text = "What's the League of Arathor?", next = "league" },
        { text = "Who are the soldiers fighting out there?", next = "enemies" },
        { text = "Why does a dwarf care about Arathi?", next = "dwarf" },
        { text = "Not today.", next = "END" },
      },
    },
    league = {
      lines = {
        { id = "l_default", text = "What's left of Stromgarde, friend, and the folk who still want it back. The keep fell to ogres and trolls and worse, and the survivors gathered here on the Pointe and swore they'd retake every stone of it." },
      },
      choices = {
        { text = "Can they do it?", next = "league_can" },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_can = {
      lines = {
        { id = "lc_default", text = "Not alone, they can't, and the Alliance has other wars on its mind. But folk like ye come through every week, and every ogre ye put down is one fewer at Stromgarde's walls, so who's to say?" },
      },
      choices = {
        { text = "I'll do what I can.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "It's a lost cause, I think.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies = {
      lines = {
        { id = "e_default", text = "Boulderfist ogres in the hills, Witherbark trolls in the east, and the Syndicate skulking around the old manors. Then there's the Horde at Hammerfall, if ye count them, and I do, because those orcs watch this road as closely as we watch theirs." },
      },
      choices = {
        { text = "The Syndicate are in Arathi too?", next = "enemies_syndicate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies_syndicate = {
      lines = {
        { id = "es_default", text = "Aye, thieves from Alterac in fine coats, and they've taken over the old farms north of here. They'd sell the whole Highlands to the ogres if they thought it'd bring back their old titles, the scoundrels." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = {
        { id = "d_default", text = "Because Stromgarde's soldiers fought beside Ironforge in the Second War, and a dwarf doesn't forget a debt like that. When the keep fell, there were some of us who thought we owed them more than a letter of sympathy." },
        { id = "d_dwarf", when = { race = "Dwarf" },
          text = "Ye'll know already, kinsman: Stromgarde's men stood with Ironforge when the Horde came over the mountains. When the keep fell, some of us thought we owed them more than a letter of sympathy." },
      },
      choices = {
        { text = "That's real loyalty.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I worked a forge in Ironforge for longer than ye've been alive, friend, and came here when the League called for smiths." } },
    advice = { { id = "tp_ad", text = "Swing from the shoulder, not the wrist. Yer wrist will thank ye." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye, friend. Ask Captain Nials; he hears everything first." } },
  },
}
