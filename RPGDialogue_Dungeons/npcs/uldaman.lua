-- Uldaman: the titan vault beneath the Badlands. Ironaya, the stone keeper who speaks before she
-- wakes to fight, and Archaedas, the ancient stone watcher of the Titans' disc chamber.
-- Voices: bibles/dg_ironaya.md, bibles/dg_archaedas.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Annora: a master enchanter hiding in a scorpid-infested chamber of Uldaman.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_annora", id = 11073, name = "Annora", title = "Master Enchanter", role = "trainer", tier = "service",
  temper = { "reclusive", "sharp" }, values = { "craft", "solitude" },
  notices = { "craft" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You found your way through the scorpids again. I'll admit I've started looking forward to your visits, which surprises me more than you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The scorpids have better manners than you, and I'd rather be talking to them." },
    { id = "g_default", text = "So you got past my scorpids. That's more than most manage, and I suppose it earns you a moment of my time." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = { "Enchanting" } },
      text = "An enchanter. I thought as much, since nobody else would bother coming this far to find me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I'm Annora, and I teach the higher arts of enchanting to those who are clever and brave enough to find me. These ruins are quiet, the scorpids keep the curious away, and the titans' stone hums with old magic." } },
      again = {
        { id = "h_again", text = "Anything else? I was in the middle of something." },
        { id = "xh_again2", text = "You're still here, which means you either want training or you've lost your way back to the gate." },
        { id = "xh_again3", when = { profession = { "Enchanting" } }, text = "Well, enchanter? Ask your question before the dust settles on it." },
      },
      choices = {
        { text = "I'd rather learn the art properly than buy shortcuts from charlatans.", next = "BACK", reply = "Good. The cheap enchanters in the cities cut corners, and their runes fade before the season's out.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "If a cheap rune sells, why bother with the hard ones?", next = "BACK", reply = "Because I can tell a cheap rune from across the room, and so can anyone worth enchanting for.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why hide in Uldaman?", next = "hide" },
        { text = "The titans' stone hums?", next = "stone" },
        { text = "Teach me.", next = "BUSINESS", when = { profession = { "Enchanting" } } },
        { text = "How did you get past the scorpids yourself?", next = "xscorp" },
        { text = "The Explorers' League must bother you.", next = "xleague" },
        { text = "What do you make of the troggs down here?", next = "xtrogg" },
        { text = "I'm a mage. Could I learn enchanting from you?", next = "xmage", when = { class = "MAGE" } },
        { text = "These are my people's halls. You're a guest.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    hide = {
      lines = { { id = "h2_default", text = "Because cities are noisy and full of people asking me to enchant their boots for free. Here the only interruptions are troggs and dwarves of the Explorers' League, and the scorpids handle both nicely." } },
      choices = {
        { text = "Knowledge should be shared, not hidden.", next = "BACK", reply = "I share it, with those who come looking. That's a test, not a wall.", fx = { align = { order = 1 } } },
        { text = "I'd hide too, if I were you.", next = "BACK", reply = "Then you understand me better than most.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone = {
      lines = { { id = "s_default", text = "The titans built this place to hold something, and their magic still runs through every carved wall. An enchanter can feel it in her fingers, like the air before a storm." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xscorp = {
      narr = "She flicks a fingernail against a scorpid husk on the shelf, and it rings like tin.",
      lines = { { id = "xsc_default", text = "I didn't get past them, I invited them in. A scorpid will leave you alone if you smell of arcane dust and nothing tastier, and I've smelt of nothing else for twenty years." } },
      choices = {
        { text = "Do you ever leave this place?", next = "xleave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xleave = {
      lines = { { id = "xle_default", text = "When I need reagents the ruins can't give me, I walk out to the Badlands and back again. I don't linger, because every time I do someone recognises me and asks for a discount." } },
      choices = {
        { text = "A teacher ought to live among her students.", next = "BACK", reply = "My students are the ones who make the journey, and that's the only kind I want.", fx = { align = { order = 1 } } },
        { text = "Solitude suits real craft. You chose well.", next = "BACK", reply = "Finally, someone who doesn't lecture me about loneliness.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xleague = {
      lines = { { id = "xlg_default", text = "They tramp through with their lanterns and their pickaxes, arguing about discs and platinum and whatever the titans left behind. I leave them to it, so long as nobody chips my workbench for a sample." } },
      choices = {
        { text = "They say the titans made the dwarves here.", next = "xtitans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtitans = {
      lines = { { id = "xti_default", text = "That's their theory, and they're welcome to it. I only know that the stone here takes an enchantment better than any I've ever worked, and that whoever carved it understood magic better than any of us do now." } },
      choices = {
        { text = "Then the League is right to dig.", next = "BACK", reply = "Perhaps, though I'd rather they dug quietly.", fx = { align = { light = 1 } } },
        { text = "Some doors are better left sealed.", next = "BACK", reply = "Now there's a sensible thought, and you won't hear many of those in Uldaman.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrogg = {
      lines = { { id = "xtr_default", text = "Ugly, stubborn and drawn to the deep places like moths to a lamp. The League thinks they're something the titans got wrong, and after watching them for a few years, I'm inclined to agree." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Plenty of magi try, and most of them treat it like spellcraft with extra steps. Enchanting is patience, a steady rod and a great deal of dust, so if you can bear to be slow, you might be good at it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdwarf = {
      lines = { { id = "xdw_default", text = "Your people's, or the titans'? The League can't agree on that, and I've heard them shout about it till the bats fled. I'll be a polite guest, dwarf, as long as you're a quiet host." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    uldaman = { { id = "xtp_uld", text = "A vault of the titans, or so the dwarves say, and the best workshop I've ever had, though the neighbours bite." } },
    explorers_league = { { id = "xtp_league", text = "Loud, dusty and convinced they're on the edge of a great discovery, every single one of them." } },
    _none = { { id = "tp_none", text = "I came here to be left alone, so I don't keep up with gossip." } } },
}
