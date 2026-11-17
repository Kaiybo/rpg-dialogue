-- Faldir's Cove: the Blackwater Raiders' stranded salvage crew. Shakes O'Breen, captain of the Harbinger,
-- and Captain Steelgut, who lost the Maiden's Folly. Voices: bibles/faldirs_cove.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Shakes O'Breen: captain of the Harbinger, leader of the salvage expedition.
P:NPC {
  key = "ar_obreen", id = TODO_NPC("Shakes O'Breen"), name = "Shakes O'Breen",
  bible = "bibles/faldirs_cove.md", role = "questgiver", tier = "quest",
  communities = { "faldirs_cove" }, temper = { "proud", "sharp" }, values = { "proud", "greedy", "loyal" },
  notices = { "race", "kit" },

  impression = {
    first = "Shakes O'Breen captains the Harbinger for the Blackwater Raiders and led two ships onto a reef that wasn't on any chart. He swaggers to hide how much he dreads telling Fleet Master Seahorn.",
    third = "{name} met Shakes O'Breen, the Blackwater Raider captain stranded at Faldir's Cove after losing two ships of his fleet.",
  },

  greetings = {
    { id = "g_default", text = "Ahoy, matey. Mind the rigging, and mind the water even more." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the cove! The tide's still low and the naga are still angry, so welcome aboard." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and we're still stuck in this blasted cove. If you've come with a high tide in your pocket, I'll buy it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've the look of someone who could sail a ship through a naga war, and I'd hire you for it, too." },
    { id = "g_word_helped", when = { word = "helped" }, text = "My crew says you've been pulling your weight and then some. On a pirate ship, that's as good as a medal." },
    { id = "g_defend", when = { questActive = TODO_QUEST("Death From Below") }, text = "Man the cannon when they come, and don't stop firing till the water's clear." },
  },

  notice = {
    { id = "n_race_gnome", cat = "race", when = { race = { "Gnome", "Dwarf" } },
      text = "A puny one, but the puny ones are often the most trouble for the enemy. Glad to have you, shorty." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you've been keelhauled, matey. The naga do that to a body." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shakes O'Breen, captain of the Harbinger and the Blackwater Raiders' man in Faldir's Cove. 'Twas a horrible mess out there, and Seahorn will have my ship if he finds out what went down." },
        { id = "h_landho", tags = { "news" }, when = { questActive = TODO_QUEST("Land Ho!") },
          text = "Lolo sent you, did he? Then you'll have heard we lost the Spirit of Silverpine and the Maiden's Folly, and you'll have heard it in the third person, which is the only way Lolo tells anything." },
        { id = "h_treasure", when = { questActive = TODO_QUEST("Sunken Treasure") },
          text = "The Professor's contraption swears the treasure's down there, and the Professor swears by his contraption. I'd swear by neither, but I need that gold." },
        { id = "h_defended", tags = { "news" }, when = { questRecent = { TODO_QUEST("Death From Below"), days = 3 } },
          text = "We survived the attack, and we couldn't have done it without you! We'll be heading out as soon as the tide rises, and if you weren't bound for bigger things, I'd offer you a place on my crew." },
        { id = "h_seahorn", when = { questDone = TODO_QUEST("Death From Below") },
          text = "Seahorn's going to hear about all this eventually, and I'd like to be the one who tells him. A captain who brings home some gold gets forgiven for a lot." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue! You'd fit right in with the Raiders, matey, and the pay's better than you'd think." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, eh? The Blackwater Raiders sail for Booty Bay and gold, not for kings or warchiefs, so you're as welcome here as anyone who pulls an oar." },
      },
      again = {
        { id = "h_again", text = "What else, matey? Make it quick; the tide waits for no captain." },
        { id = "h_again2", text = "Speak up. The waves are loud and my ears are older than they look." },
      },
      choices = {
        { text = "What happened to your ships?", next = "wreck" },
        { text = "Who's Seahorn?", next = "seahorn" },
        { text = "Tell me about your crew.", next = "crew" },
        { text = "What's this treasure you're after?", next = "treasure" },
        { text = "Any work for a rogue on your crew?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Fair winds, Captain.", next = "END" },
      },
    },

    wreck = {
      lines = {
        { id = "wr_default", text = "I brought the Harbinger in to dock and signalled the Spirit of Silverpine and the Maiden's Folly to follow suit. Then the sea rumbled, the tide dropped like a stone, and both ships crashed onto the reef." },
      },
      choices = {
        { text = "A reef that wasn't there before?", next = "wreck_reef" },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    wreck_reef = {
      lines = {
        { id = "wf_default", text = "That's no ordinary reef, matey; something's down there. Nilzlix swears he saw carved stone under the hulls, like the roof of a temple, and the naga came boiling out of it before the masts had stopped falling." },
      },
      choices = {
        { text = "What would naga want with this cove?", next = "wreck_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wreck_naga = {
      big = true,
      lines = {
        { id = "wn_default", text = "Whatever's in that temple, I'd guess, and they don't care to share it. Naga are known for their ruthlessness, and they'll keep coming until I'm dead, because without my charts nobody gets this crew home." },
      },
      choices = {
        { text = "Then we hold the cove and hold it hard.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Grab what gold you can and slip out at night.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    seahorn = {
      lines = {
        { id = "se_default", text = "Fleet Master Seahorn, in Booty Bay, and the Blackwater Raiders answer to him. He sent three ships north for treasure, and if only one comes home, he'll want to know whose fault it was." },
      },
      choices = {
        { text = "And whose fault was it?", next = "seahorn_fault" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seahorn_fault = {
      big = true,
      lines = {
        { id = "sf_default", text = "Mine, if you ask Seahorn, and the sea's, if you ask me. A captain who leads ships into a cove takes the blame when the cove eats them, and I knew that when I signalled." },
        { id = "sf_warm", when = { disposition = { min = 65 } },
          text = "Mine, and I know it. I hurried the others in because the Professor's machine was whistling, and I wanted the gold before the tide turned, so now I'll carry Steelgut's crew on my conscience." },
      },
      choices = {
        { text = "Own it, Captain. Seahorn will respect that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Blame the gnome's machine. It's half true.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    crew = {
      lines = {
        { id = "cr_default", text = "Lolo keeps lookout and talks about himself like he's somebody else, Nilzlix keeps the logs, and Doctor Draxlegauge keeps the Professor's machines from blowing up, mostly. Captain Steelgut's here too, what's left of him." },
      },
      choices = {
        { text = "What happened to Steelgut?", next = "crew_steelgut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_steelgut = {
      lines = {
        { id = "cs_default", text = "He was captain of the Maiden's Folly, and he went down with her, or near enough. The naga killed the survivors in the water, and he washed up here alone, so go gently with him." },
      },
      choices = { { text = "Something else, Captain.", next = "BACK" } },
    },

    treasure = {
      lines = {
        { id = "tr_default", text = "Gold, matey, an old hoard sunk off this coast, or so the Professor's contraption tells us. Seahorn wanted it badly enough to send three ships, and I'd like to bring back at least a pocketful to show for the two I lost." },
      },
      choices = {
        { text = "Two ships for a pocketful of gold?", next = "treasure_worth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    treasure_worth = {
      lines = {
        { id = "tw_default", text = "Put like that, it sounds daft, doesn't it? But a pirate who comes home empty-handed is just a sailor who's lost his ship, and I'm not ready to be that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    rogue = {
      lines = {
        { id = "ro_default", text = "Always, matey, though the Raiders want quick hands on the rigging more than in pockets. Help us hold this cove, and I'll put in a word with Seahorn that'll open doors in Booty Bay." },
      },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've sailed every coast between Booty Bay and Lordaeron, and I hear plenty in every port. Ask." } },
    background = { { id = "tp_bg", text = "Captain of the Harbinger, Blackwater Raiders, and I've never lost a ship before this week." } },
    advice = { { id = "tp_ad", text = "Never anchor where the tide behaves oddly, matey. Learn from my mistake." } },
    steamwheedle = { { id = "tp_sw", text = "Booty Bay's run by goblins and paid for by everyone. The Raiders sail for the Baron, and the Baron pays on time." } },
    _none = { { id = "tp_none", text = "No idea, matey. Ask Lolo, he'll tell you, and he'll tell you in the third person." } },
  },
}

-- Captain Steelgut: dwarf captain of the sunken Maiden's Folly, sole survivor of his crew.
P:NPC {
  key = "ar_steelgut", id = TODO_NPC("Captain Steelgut"), name = "Captain Steelgut",
  bible = "bibles/faldirs_cove.md", role = "questgiver", tier = "quest",
  communities = { "faldirs_cove" }, temper = { "gruff", "fierce" }, values = { "loyal", "brave" },
  notices = { "drink", "kit" },

  impression = {
    first = "Captain Steelgut sits by the fire at Faldir's Cove, a dwarf who should have drowned with his ship and can't forgive the sea for sparing him. He wants the naga dead, and he wants it more than he wants to live.",
    third = "{name} met Captain Steelgut, the dwarf who lost the Maiden's Folly and all her crew at Faldir's Cove.",
  },

  greetings = {
    { id = "g_default", text = "Argh, sit if ye want, the fire's free. Just don't ask me how I'm keepin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The naga were singin' in the water last night, an' I didnae sleep." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' the sea's still out there laughin' at me. Sit down, then." },
    { id = "g_active", when = { questActive = TODO_QUEST("Drowned Sorrows") }, text = "Raiders an' sorceresses, along the shore. Kill them for my boys." },
  },

  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = true },
      text = "Ye've had a drink, I can smell it. Good. Somebody should, an' I've no stomach for it these days." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The naga had a go at ye, did they? They'll do worse if ye let them, so go an' mend that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Steelgut, o' the Maiden's Folly, for what that's worth now. I should be in a watery grave, no' sittin' here by the fire breathin' fresh air, an' I've no' made my peace wi' it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Drowned Sorrows") },
          text = "One second we're afloat, the next the water's rushin' in, an' then those beasts came for the survivors. Horrible naga scum, the lot o' them, an' I want them dead." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Drowned Sorrows"), days = 3 } },
          text = "Nice work out there. Nothin' will ever bring me the ship or my crew back, but the death o' those naga gives me some solace, an' I'll take what solace I can get." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Drowned Sorrows"), days = 5 } },
          text = "I slept through the night, first time since the wreck. Didnae dream o' the water at all, an' I think I've ye tae thank for that." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Ye'll be wonderin' how one o' us came tae captain a ship. Same as any dwarf comes tae anythin': stubbornness, an' a bet I shouldnae have won." },
        { id = "h_priest", when = { class = { "PRIEST", "PALADIN" } },
          text = "If ye've come tae pray over me, save it for my boys. They're the ones still down there." },
      },
      again = {
        { id = "h_again", text = "What else? The fire's dyin', an' so's my patience." },
        { id = "h_again2", text = "Go on, then. Ask." },
      },
      choices = {
        { text = "Tell me about the Maiden's Folly.", next = "ship" },
        { text = "How did you survive?", next = "survive" },
        { text = "What do you know of the naga?", next = "naga" },
        { text = "How does a dwarf end up captaining a ship?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Rest easy, Captain.", next = "END" },
      },
    },

    ship = {
      lines = {
        { id = "sh_default", text = "Best ship in the Raiders' fleet, an' I'll fight any goblin who says otherwise. Fast in a blow an' steady at anchor, an' my crew kept her cleaner than any tavern in Booty Bay." },
      },
      choices = {
        { text = "Tell me about your crew.", next = "ship_crew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ship_crew = {
      big = true,
      lines = {
        { id = "sc_default", text = "Good boys, bless their hearts, every one o' them. They tried so hard tae save her, an' they'd still be tryin' if the sea had let them." },
      },
      choices = {
        { text = "They'll be avenged, Captain. I swear it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Mourn them. Vengeance won't bring them back.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    survive = {
      lines = {
        { id = "su_default", text = "I went black in the water an' woke up on the shore, an' that's all I know. O'Breen made it in safe wi' the Harbinger, an' we weren't so lucky, so ye can guess how I feel about luck." },
      },
      choices = {
        { text = "Do you blame O'Breen?", next = "survive_blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    survive_blame = {
      lines = {
        { id = "sb_default", text = "Some days. He gave the signal an' I followed it, as I would again, for that's the code. But he's the one sleepin' in a dry hammock while my boys sleep in the reef." },
      },
      choices = { { text = "Something else, Captain.", next = "BACK" } },
    },

    naga = {
      lines = {
        { id = "na_default", text = "Daggerspines, they're called, raiders an' sorceresses both. They came up out o' the reef like they'd been waitin', an' they killed every survivor they could reach." },
      },
      choices = {
        { text = "Where do they come from?", next = "naga_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_where = {
      lines = {
        { id = "nw_default", text = "The deep, an' whatever's under that reef. O'Breen says it's a temple, an' I've no reason tae doubt him, for nothin' else could make the sea behave like that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    dwarf = {
      lines = {
        { id = "dw_default", text = "A bet in a Booty Bay tavern that no dwarf could keep a deck. I won it, an' then I had tae keep the deck, for the goblins never let ye off a bet." },
      },
      choices = {
        { text = "That's a fine story, Captain.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the sea an' I know ships, an' just now I know more about grief than I'd like. Ask." } },
    background = { { id = "tp_bg", text = "Captain o' the Maiden's Folly, Blackwater Raiders. Was, I mean." } },
    advice = { { id = "tp_ad", text = "Learn tae swim, an' learn it before ye need it." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, an' couldnae care just now. Ask O'Breen." } },
  },
}
