-- Faldir's Cove: the Blackwater Raiders' stranded salvage crew. Shakes O'Breen, captain of the Harbinger,
-- and Captain Steelgut, who lost the Maiden's Folly. Voices: bibles/faldirs_cove.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Shakes O'Breen: captain of the Harbinger, leader of the salvage expedition.
P:NPC {
  key = "ar_obreen", id = TODO_NPC("Shakes O'Breen"), name = "Shakes O'Breen",
  bible = "bibles/faldirs_cove.md", role = "questgiver", tier = "quest",
  communities = { "faldirs_cove", "blackwater" }, temper = { "proud", "sharp" }, values = { "proud", "greedy", "loyal" },
  notices = { "race", "kit" },

  impression = {
    first = "Shakes O'Breen captains the Harbinger for the Blackwater Raiders and led two ships onto a reef that wasn't on any chart. He swaggers to hide how much he dreads telling Fleet Master Seahorn.",
    third = "{name} met Shakes O'Breen, the Blackwater Raider captain stranded at Faldir's Cove after losing two ships of his fleet.",
  },

  greetings = {
    { id = "g_default", text = "Ahoy, matey! Mind the rigging, and mind the water more, because the naga have been coming up out of it at low tide." },
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
          text = "Lolo, my lookout, sent you, did he? Then you'll have heard we lost the Spirit of Silverpine and the Maiden's Folly, and you'll have heard it in the third person, which is the only way Lolo tells anything." },
        { id = "h_treasure", when = { questActive = TODO_QUEST("Sunken Treasure") },
          text = "Professor Phizzlethorpe's contraption swears the treasure's down there, and the Professor swears by his contraption. I'd swear by neither, but I need that gold." },
        { id = "h_defended", tags = { "news" }, when = { questRecent = { TODO_QUEST("Death From Below"), days = 3 } },
          text = "We survived the attack, and we couldn't have done it without you! We'll be heading out as soon as the tide rises, and if you weren't bound for bigger things, I'd offer you a place on my crew." },
        { id = "h_seahorn", when = { questDone = TODO_QUEST("Death From Below") },
          text = "Seahorn's going to hear about all this eventually, and I'd like to be the one who tells him. A captain who brings home some gold gets forgiven for a lot." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue! You'd fit right in with the Raiders, matey, and nobody here asks where your last purse came from." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, eh? The Blackwater Raiders sail for Booty Bay and gold, not for kings or warchiefs, so you're as welcome here as anyone who pulls an oar." },
      },
      again = {
        { id = "h_again", text = "What else, matey? Make it quick; the naga come up with the tide, and the tide's turning." },
        { id = "h_again2", text = "Speak up. The waves are loud and my ears are older than they look." },
      },
      choices = {
        { text = "Your ships seem to have met with trouble.", next = "wreck" },
        { text = "Who's Seahorn?", next = "seahorn" },
        { text = "Tell me about your crew.", next = "crew" },
        { text = "What brought your ships this far north?", next = "treasure" },
        { text = "Tell me about the Blackwater Raiders.", next = "ob_raiders" },
        { text = "Any work for a rogue on your crew?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Fair winds, Captain.", next = "END" },
      },
    },

    wreck = {
      lines = {
        { id = "wr_default", text = "I brought the Harbinger in to dock and signalled the Spirit of Silverpine and the Maiden's Folly to follow suit. Then the sea rumbled, the tide dropped like a stone, and both ships crashed onto the reef." },
      },
      choices = {
        { text = "A reef can't just appear out of nowhere.", next = "wreck_reef" },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    wreck_reef = {
      lines = {
        { id = "wf_default", text = "That's no ordinary reef, matey; something's down there. Nilzlix, who keeps our logs, swears he saw carved stone under the hulls, like the roof of a temple, and the naga came boiling out of it before the masts had stopped falling." },
      },
      choices = {
        { text = "Naga must want something in this cove.", next = "wreck_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wreck_naga = {
      big = true,
      lines = {
        { id = "wn_default", text = "Whatever's in that temple, I'd guess, and they don't care to share it. They'll keep coming at this cove until we're gone or they are, so we'd best be ready for them." },
      },
      choices = {
        { text = "Then we hold the cove and hold it hard.", next = "BACK", reply = "Hard it is, matey, and I'll want every blade I can find on the beach. Dig in behind the wreck timbers and let the scaly devils come to us.", fx = { align = { honor = 1 } } },
        { text = "Grab what gold you can and slip out after dark.", next = "BACK", reply = "Ha! You've the soul of a buccaneer, and I like it. But the Baron would hang me from my own yardarm for leaving half a wreck behind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    seahorn = {
      lines = {
        { id = "se_default", text = "Fleet Master Seahorn, in Booty Bay, and the Blackwater Raiders answer to him. He sent three ships north for treasure, and if only one comes home, he'll want to know whose fault it was." },
      },
      choices = {
        { text = "And whose fault was it?", next = "seahorn_fault" },
        { text = "What will Seahorn do when he hears?", next = "ob_temper" },
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
        { text = "Own it, Captain. Seahorn will respect you for it.", next = "BACK", reply = "Own it, aye, and I've owned worse. Seahorn respects a captain who doesn't hide behind his crew.", fx = { align = { light = 1 } } },
        { text = "Blame the gnome's machine. That's half true, anyway.", next = "BACK", reply = "Half true and all convenient, which is the best kind of excuse. Don't tell the Professor I agreed with you.", fx = { affinity = 1, align = { light = -1 } } },
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
      choices = {
        { text = "Does he blame you?", next = "ob_steelgut_blame" },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },

    treasure = {
      lines = {
        { id = "tr_default", text = "Gold, matey, an old hoard sunk off this coast, or so the Professor's contraption tells us. Seahorn wanted it badly enough to send three ships, and I'd like to bring back at least a pocketful to show for the two I lost." },
      },
      choices = {
        { text = "Two ships seems a high price for a pocketful of gold.", next = "treasure_worth" },
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

    -- Deeper: the Raiders (sub-hub), the Harbinger, the code and the salvage shares, the letters to Seahorn.
    ob_raiders = {
      hub = true,
      lines = {
        { id = "or_default", text = "The Blackwater Raiders, matey, the finest fleet that ever flew a goblin's colours, and I've the honour of being its most lost captain this week. Ask what you like; it beats watching the tide not come in." },
      },
      again = {
        { id = "or_again", text = "More about the fleet? Gladly, it's the only thing I'm proud of right now." },
        { id = "or_again2", text = "Ask on, matey. The naga aren't due till dusk." },
      },
      choices = {
        { text = "Tell me about the Harbinger.", next = "ob_harbinger" },
        { text = "How do the Raiders split salvage like this?", next = "ob_code" },
        { text = "I'd not expect the Bloodsail this far north.", next = "ob_bloodsail" },
        { text = "Would the Raiders take Horde coin up here?", next = "ob_sides", when = { faction = "Horde" } },
        { text = "Do the Raiders work with Alliance ships?", next = "ob_sides", when = { faction = "Alliance" } },
        { text = "Steelgut says he won his ship on a bet.", next = "ob_dwarf", when = { race = "Dwarf", heardLine = "ar_steelgut.dw_default" } },
        { text = "Back to the matter at hand, Captain.", next = "hello" },
      },
    },
    ob_harbinger = {
      lines = {
        { id = "oh_default", text = "Fastest brig in the fleet, matey, and the only ship I've ever loved more than gold. I took her off the Bloodsail six years back with eleven men and a borrowed cannon, and I renamed her the Harbinger so they'd know what she meant every time they saw her coming." },
      },
      choices = {
        { text = "What did you do with her old crew?", next = "ob_prize" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ob_prize = {
      big = true,
      lines = {
        { id = "op_default", text = "Put them ashore at Jaguero Isle with a barrel of water and a rowboat with one oar. Seahorn said I was soft, and Baron Revilgaz of Booty Bay said I'd wasted good ransom, and I still say the sea had enough bodies that day." },
      },
      choices = {
        { text = "You showed mercy, Captain, and you did right.", next = "BACK", reply = "That's what I told myself, rowing back alone. Nice to hear it from someone who isn't me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Baron's right. Ransom them or sink them.", next = "BACK", reply = "The Baron's always right, if you ask the Baron. I'll stand by my one oar, thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ob_code = {
      lines = {
        { id = "oc_default", text = "By the code, matey: a tenth to the Baron, two shares to the captain, one to every hand, and a share and a half to the family of any sailor who doesn't come home. Steelgut's crew is owed a chest's worth of gold I haven't found yet." },
      },
      choices = {
        { text = "Will you pay the dead men's shares?", next = "ob_shares" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ob_shares = {
      big = true,
      lines = {
        { id = "os_default", text = "Every copper, if the Professor's machine finds anything worth finding. I'll pay them out of my own two shares if I have to, though you'll not tell my crew I said that, or they'll want theirs doubled." },
      },
      choices = {
        { text = "The code's the code. Pay them in full, Captain.", next = "BACK", reply = "That's the spirit! I'll count it out on the beach where the whole crew can watch, every copper of it.", fx = { align = { order = 1 } } },
        { text = "Codes are for fair weather. Look after your own first.", next = "BACK", reply = "My own crew is the code, matey, and they'd know if I bent it. I'll pay, and grumble while I do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ob_bloodsail = {
      lines = {
        { id = "ob_default", text = "Not often, but their scouts turn up wherever there's treasure, like gulls at a fish market. I'd half hoped the naga would get them before they got us, but the naga don't seem to care whose colours a sailor wears." },
        { id = "ob_done", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "Less, now Fleet Master Firallon's gone, and they say a stranger did that, which I'd believe of you, matey. His captains will be fighting over his chair all season, and that's a season they won't spend chasing my wreck." },
      },
      choices = {
        { text = "Then let's hope they stay busy elsewhere, Captain.", next = "BACK", fx = { learn = { "bloodsail" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ob_sides = {
      big = true,
      lines = {
        { id = "osd_default", text = "Coin's coin, matey, and a Raider doesn't ask what flag it was minted under. The Baron's toll keeps the peace between your lot and the other lot, and I'm happy to ferry either of you to anywhere that pays." },
        { id = "osd_horde", when = { faction = "Horde" }, text = "Up here? With Hammerfall over the hills, and the Alliance in Refuge Pointe? I'd sell to both and tell neither, matey, which is the Raider way, and it's kept me in boots for twenty years." },
        { id = "osd_alliance", when = { faction = "Alliance" }, text = "Menethil's merchants hire us more than they'd like to admit, matey, and Stromgarde's lot at Refuge Pointe would hire us if they had the coin. The Horde at Hammerfall pay too, so I keep my mouth shut in both camps." },
      },
      choices = {
        { text = "Selling to both sides? That's just good sense.", next = "BACK", reply = "Glad you see it, matey. Horde silver spends the same as Alliance silver in Booty Bay, and nobody there asks which pocket it came from.", fx = { align = { honor = -1 } } },
        { text = "A man who sells to both sides is trusted by neither.", next = "BACK", reply = "Trusted by neither, paid by both, and alive to complain about it. I'll take that bargain every time.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ob_dwarf = {
      lines = {
        { id = "odw_default", text = "He did, at Skindle's bar, and I was the fool who bet against him. I said no dwarf could keep his breakfast down on a deck for a month, and he kept it down for six out of pure stubbornness, so you could say his ship is half my fault as well." },
      },
      choices = {
        { text = "Then you owe him more than gold.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Ha! Let's talk about something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    ob_temper = {
      lines = {
        { id = "ote_default", text = "He'll laugh first, matey, because Seahorn laughs at everything, and then he'll stop laughing, which is worse. I've written him two letters already and burned both, because neither one sounded like a captain who deserves to keep his ship." },
      },
      choices = {
        { text = "Tell me what you wrote, O'Breen.", tag = "Intimidate", next = "ob_letters",
          check = { pass = { any = { { power = { "above", "far_above" } }, { class = { "WARRIOR", "ROGUE" } }, { trait = "stern" } } } },
          fail = { next = "ob_letters_no", fx = { affinity = -1 } } },
        { text = "Write a third one, Captain.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    ob_letters = {
      lines = {
        { id = "ol_default", text = "All right, all right, put that look away. The first said the reef came out of nowhere, which is true, and the second said I saw the water drop and signalled anyway, which is also true, and I can't send either without the other." },
      },
      choices = {
        { text = "Send the second one. Seahorn deserves the truth.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then tell him to his face.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    ob_letters_no = {
      lines = {
        { id = "oln_default", text = "Ha! I've stared down Bloodsail captains and a naga sea witch this week, matey, and you're nowhere near as frightening as either. My letters are my business until Seahorn reads one." },
      },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    ob_steelgut_blame = {
      big = true,
      lines = {
        { id = "osb_default", text = "He doesn't say it, which is worse than saying it, because dwarves can be silent at you for a whole season. I'd take it kindly if he'd shout at me once, so we could both get on with things." },
      },
      choices = {
        { text = "Go to him and own it, Captain. Don't wait.", next = "BACK", reply = "You're right, and I know it. I'll go tonight, after a drink or two for courage.", fx = { align = { order = 1 } } },
        { text = "Leave him be. Grief keeps its own hours.", next = "BACK", reply = "It does, and dwarves keep longer hours than most. I'll give him his season, then.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've sailed every coast between Booty Bay and Lordaeron, and I hear plenty in every port. Ask." } },
    background = { { id = "tp_bg", text = "Captain of the Harbinger, Blackwater Raiders, and I've never lost a ship before this week." } },
    advice = { { id = "tp_ad", text = "Never anchor where the tide behaves oddly, matey. Learn from my mistake." } },
    steamwheedle = { { id = "tp_sw", text = "Booty Bay's run by goblins and paid for by everyone. The Raiders sail for the Baron, and the Baron pays on time." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's home port for the Blackwater Raiders, and Fleet Master Seahorn runs the finest fleet on the south seas. I'm dreading going back there, if you must know, after what I did to his ships." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail are scum, pirates with no honour and no sense, and they'd kill their own mothers for a doubloon. The Blackwater Raiders are pirates too, but we have standards." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's a fine port, if you like goblins, and I don't, but the rum's good. Seahorn's got friends on those docks, so I'll do my drinking somewhere else." } },
    _none = { { id = "tp_none", text = "No idea, matey. Ask Lolo, he'll tell you, and he'll tell you in the third person." } },
  },
}

-- Captain Steelgut: dwarf captain of the sunken Maiden's Folly, sole survivor of his crew.
P:NPC {
  key = "ar_steelgut", id = TODO_NPC("Captain Steelgut"), name = "Captain Steelgut",
  bible = "bibles/faldirs_cove.md", role = "questgiver", tier = "quest",
  communities = { "faldirs_cove", "blackwater" }, temper = { "gruff", "fierce" }, values = { "loyal", "brave" },
  notices = { "drink", "kit" },

  impression = {
    first = "Captain Steelgut sits by the fire at Faldir's Cove, a dwarf who should have drowned with his ship and can't forgive the sea for sparing him. He wants the naga dead, and he wants it more than he wants to live.",
    third = "{name} met Captain Steelgut, the dwarf who lost the Maiden's Folly and all her crew at Faldir's Cove.",
  },

  greetings = {
    { id = "g_default", text = "Argh, sit if ye want, the fire's free. Just don't ask me how I'm keepin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The naga were singin' in the water last night, an' I didnae sleep." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' the sea's still out there laughin' at me. Sit down, then." },
    { id = "g_active", when = { questActive = TODO_QUEST("Drowned Sorrows") }, text = "The Daggerspine raiders an' sorceresses are out along the shore. Kill them for my boys." },
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
        { id = "h_again2", text = "Go on, then, ask. I've nowhere tae be." },
      },
      choices = {
        { text = "Tell me about the Maiden's Folly.", next = "ship" },
        { text = "How did you survive?", next = "survive" },
        { text = "What do you know of the naga?", next = "naga" },
        { text = "Tell me about the Blackwater Raiders, Captain.", next = "sg_raiders" },
        { text = "What will you do now, Captain?", next = "sg_after" },
        { text = "A dwarf captaining a ship is a rare sight.", next = "dwarf", when = { race = "Dwarf" } },
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
        { text = "They'll be avenged, Captain. I swear it.", next = "BACK", reply = "Avenged, ye say? Bless ye, but the sea took 'em, an' I cannae put a blade in the sea. I'll take the thought, though.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Mourn them, Captain. Vengeance won't bring them back.", next = "BACK", reply = "Aye, I'll mourn 'em, every one, an' I'll no' be done mournin' for a long while yet.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    survive = {
      lines = {
        { id = "su_default", text = "I went black in the water an' woke up on the shore, an' that's all I know. O'Breen made it in safe wi' the Harbinger, an' we weren't so lucky, so ye can guess how I feel about luck." },
      },
      choices = {
        { text = "I'd blame O'Breen, in your place.", next = "survive_blame" },
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

    -- Deeper: the Raiders (sub-hub), Seahorn, the code, life aboard the Folly, what's next, what he saw.
    sg_raiders = {
      hub = true,
      lines = {
        { id = "sr_default", text = "The Raiders, aye. Goblin coin, tauren laughter an' every sort o' fool on the ropes, an' I was proud tae be one o' them. Ask, if ye must." },
      },
      again = {
        { id = "sr_again", text = "More? The fire's still warm, so go on." },
        { id = "sr_again2", text = "Ask yer question. I'll answer it, if it's no' about the water." },
      },
      choices = {
        { text = "Seahorn must be quite a master to serve.", next = "sg_seahorn" },
        { text = "Do the Raiders really keep a code?", next = "sg_code" },
        { text = "What was life like aboard the Folly?", next = "sg_life" },
        { text = "You look like you've fought the Bloodsail, Captain.", next = "sg_bloodsail" },
        { text = "Does a dwarf captain mind Horde passengers?", next = "sg_horde", when = { faction = "Horde" } },
        { text = "Something else, Captain.", next = "hello" },
      },
    },
    sg_seahorn = {
      lines = {
        { id = "ssh_default", text = "A tauren who laughs like a cannon an' gave a dwarf a ship when every goblin in the Bay said it was a waste o' good timber. I owe him the Folly, an' now I've got tae tell him she's on the bottom wi' every soul aboard her but mine." },
      },
      choices = {
        { text = "He'll give you another ship.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sg_code = {
      lines = {
        { id = "scd_default", text = "Aye, an' the first line o' it is that ye follow yer captain's signal, no matter what ye see in the water. O'Breen signalled, an' I followed, an' that's the code doin' just what it's meant tae do." },
      },
      choices = {
        { text = "Even when it sinks you?", next = "sg_code_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sg_code_stance = {
      big = true,
      lines = {
        { id = "scs_default", text = "Even then. A fleet where every captain does as he likes is just a lot o' boats that happen tae be near each other, an' the Bloodsail would eat it alive. I'd follow that signal again, an' I hate that I would." },
      },
      choices = {
        { text = "The code's what makes a fleet. You were right to follow it.", next = "BACK", reply = "Aye, it is, an' I'd follow it again, even wi' the sea comin' over the rail. That's what a captain does.", fx = { align = { order = 1 } } },
        { text = "A code that drowns good sailors is a bad code.", next = "BACK", reply = "Maybe so, an' I've wondered it myself on the long nights. But I'll no' be the captain who broke it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sg_life = {
      lines = {
        { id = "slf_default", text = "Loud, mostly. My boys sang every watch, badly, an' the cook made a stew from whatever we hadnae sold, an' the cabin lad from Menethil kept a pet crab in my boot. I'd give my beard tae have that crab pinch me one more time." },
      },
      choices = {
        { text = "Tell me about the cabin lad.", next = "sg_lad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sg_lad = {
      lines = {
        { id = "sld_default", text = "Fourteen, an' lied tae me that he was sixteen, an' I let him, because he could tie a knot faster than any dwarf alive. His mother's in Menethil, an' I've no' found the words for her yet, so dinnae ask me what I'll say." },
      },
      choices = { { text = "Something else, Captain.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    sg_bloodsail = {
      lines = {
        { id = "sbs_default", text = "Off the Cape o' Stranglethorn, twice, an' once against Keelhaul himself. He tried tae board us at dawn an' we put a cannonball through his rail before he got the hooks across, so he'll remember the Folly, an' I'll remember him." },
        { id = "sbs_done", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "Twice off the Cape, an' once against Keelhaul himself, an' I hear somebody's sent him an' Firallon both tae the bottom since. If that was ye, then I'll drink tae it, an' I havnae drunk tae anythin' in weeks." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    sg_horde = {
      lines = {
        { id = "sho_default", text = "I did, the first year. Then an orc in my hold stood a whole storm bailin' wi' his own helmet while my Ironforge passengers prayed, an' I stopped mindin' much after that, so long as the fare's paid an' nobody draws in my cabin." },
      },
      choices = {
        { text = "That sounds like an orc.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sg_after = {
      big = true,
      lines = {
        { id = "saf_default", text = "That's the question, isn't it? Seahorn would give me another deck if I asked, an' my cousins in Dun Morogh would give me a forge an' a chair by the fire, an' I cannae make up my mind which would be the coward's choice." },
        { id = "saf_dwarf", when = { race = "Dwarf" }, text = "Ye'll know the pull o' the mountain as well as I do. Seahorn would give me another deck, an' Dun Morogh would give me a forge, an' I cannae tell which is the coward's choice, so tell me, as one dwarf tae another." },
      },
      choices = {
        { text = "Ask Seahorn for a new ship. The fleet still needs you.", next = "BACK", reply = "The fleet, aye, an' maybe ye're right. My boys would want me back at sea, I think.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Go home, Captain. You owe the sea nothing more.", next = "BACK", reply = "Home, is it? Ironforge would welcome me, an' the forge would keep me warm. I'll think on it, an' thank ye.", fx = { align = { honor = -1 } } },
        { text = "What did you see in the water, Captain?", next = "sg_saw_ask" },
      },
    },
    sg_saw_ask = {
      lines = {
        { id = "ssa_default", text = "In the water? Nothin' I'd tell a stranger by a fire, for they'd think the grief had taken my wits along wi' my ship." },
      },
      choices = {
        { text = "I've seen strange things too. You can tell me.", tag = "Persuade", next = "sg_saw",
          check = { pass = { any = { { disposition = { min = 60 } }, { race = "Dwarf" }, { questDone = TODO_QUEST("Drowned Sorrows") } } } },
          fail = { next = "sg_saw_no", fx = { affinity = -1 } } },
        { text = "Then keep it, Captain.", next = "BACK" },
      },
    },
    sg_saw = {
      lines = {
        { id = "ssw_default", text = "Lights, down under the reef, green as a Lordaeron bog, an' a voice singin' in a tongue I didnae know. The singin' stopped when I went black, an' when I woke on the sand I could still hear the end o' it, an' sometimes I still do." },
      },
      choices = {
        { text = "That sounds like the naga sorceresses. Tell O'Breen.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sg_saw_no = {
      lines = {
        { id = "ssn_default", text = "Have ye now. Everybody's seen strange things, {g:lad|lass}, but no' everybody's sat by this fire wonderin' if they're mad, so leave it be." },
      },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the sea an' I know ships, an' just now I know more about grief than I'd like. Ask." } },
    background = { { id = "tp_bg", text = "Captain o' the Maiden's Folly, Blackwater Raiders. Was, I mean." } },
    advice = { { id = "tp_ad", text = "Learn tae swim, an' learn it before ye need it." } },
    booty_bay = { { id = "tp_booty_bay", text = "I sailed out o' Booty Bay fer twenty years before the naga took my ship, an' I'd go back tomorrow if I had a deck under me. The sea's a cruel mistress, but she's the only one I've got." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer fly over the sea like it's nothin', an' I envy them. I'd give my last breath tae see the naga from a gryphon's back, wi' a hammer in my hand." } },
    magni = { { id = "tp_magni", text = "The King's a good dwarf, an' he'd want me home, I'm sure. I'll go home when the naga are dead, an' no' a day before." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, an' couldnae care just now. Ask O'Breen." } },
  },
}
