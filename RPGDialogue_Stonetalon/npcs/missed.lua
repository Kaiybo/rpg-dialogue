-- Stonetalon folk an earlier pass missed: Darn Talongrip at Malaka'jin and Gatekeeper Kordurus at the Talon Den
-- on Stonetalon Peak. Saern Priderunner (the scan's "Sunwalker Saern") is also here because the scan filed her
-- under this pack, though in Classic she stands on Hunter Rise in Thunder Bluff. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Darn Talongrip: orc at Malaka'jin.
P:NPC {
  key = "darn_talongrip", id = TODO_NPC("Darn Talongrip"), name = "Darn Talongrip", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "malakajin" }, temper = { "grim", "blunt" }, values = { "brave", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "Darn Talongrip is an orc who stands at the edge of Malaka'jin facing the spider canyon to the north, with an axe he sharpens more than he needs to. The trolls give him room, and he plainly has one thing on his mind.",
    third = "{name} met Darn Talongrip, an orc at Malaka'jin with a grudge against the spiders of Sishir Canyon.",
  },
  greetings = {
    { id = "g_default", text = "Throm-ka, {class}. If you are bound for the canyon north of here, tell me now, because I would know who else is hunting there." },
    { id = "g_done", when = { questDone = TODO_QUEST("Arachnophobia") }, text = "They say you killed Besseleth. I would have had it be my axe, but she is dead, and I will not be small about how." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Have you been to the canyon, or do you only talk of it as the others do?" },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then you can read the webs in Sishir Canyon better than I can, and you will know that the big one does not come out for small prey." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "It is good to hear an orc's step among all these trolls. They are worthy allies, but they laugh at everything, and I have not felt like laughing for some time." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Darn Talongrip. I came to these mountains with my mate to scout for the Warchief, and the spiders of Sishir Canyon took her from me, so now I stand here and wait for the day I am strong enough to go in after them." } },
      again = {
        { id = "h_again", text = "What else, {class}? Speak plainly." },
        { id = "h_again2", text = "Ask. I am not going anywhere until the canyon is clean." },
      },
      choices = {
        { text = "Tell me about the spiders.", next = "spiders" },
        { text = "Why wait? Go in and avenge her.", next = "wait" },
        { text = "How do you find life among the Darkspear?", next = "trolls" },
        { text = "What was your mate's name?", next = "yname" },
        { text = "Does anyone help you train?", next = "ytrain" },
        { text = "What will you do after?", next = "yafter" },
        { text = "An orc should not grieve alone. Let me help.", next = "yhelp", when = { race = "Orc" } },
        { text = "Strength and honor, Darn.", next = "END" },
      },
    },
    spiders = {
      lines = { { id = "s_default", text = "The Deepmoss, the trolls call them, and there are more of them in that canyon than there are stones. They are led by a great green brood mother named Besseleth, and it was her web my mate was found in." } },
      choices = {
        { text = "Is there a bounty on Besseleth?", next = "bounty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bounty = {
      lines = { { id = "b_default", text = "There is a notice posted at Sun Rock Retreat, and Maggran Earthbinder will reward whoever brings her fang. I do not care for the reward, only that the fang is brought." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wait = {
      lines = { { id = "w_default", text = "I went in once, alone and in a rage, and the trolls carried me out with poison in three wounds. Rage is a fine thing to carry into battle, but I learned that day that it is not a plan." } },
      choices = { { text = "A hard lesson. Something else.", next = "BACK" } },
    },
    trolls = {
      lines = { { id = "t_default", text = "Xen'Zilla hunts the same spiders for the camp's meat, and he does not ask me to talk about it, which I respect. The witch doctor offered me a charm for my grief, and I told him an orc keeps his grief until it has done its work." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yname = {
      lines = {
        { id = "yyname_d", text = "Kerga. She laughed louder than any orc in Orgrimmar and threw an axe better than me. The Warchief sent us here together. The spiders took her in the night, and I did not wake in time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytrain = {
      lines = {
        { id = "yytrain_d", text = "The Darkspear hunters let me spar with them, and their witch doctor gives me bitter tea for the poison. They say I fight angry. I say anger is all I have left of her." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yafter = {
      lines = {
        { id = "yyafter_d", text = "I do not know. I have thought only of the canyon, and of the great spider Besseleth. Some say vengeance leaves you empty. Some say it is the only way to let the dead rest." },
      },
      choices = {
        { text = "Avenge her. Her spirit demands it.", next = "BACK", reply = "Yes. That is what I tell myself every night.", fx = { align = { honor = -1 } } },
        { text = "Honour her by living, not only by killing.", next = "BACK", reply = "Perhaps. Kerga would say the same, and laugh at me for being slow.", fx = { align = { honor = 1 } } },
      },
    },
    yhelp = {
      lines = {
        { id = "yyhelp_v0", when = { race = "Orc" }, text = "Then come with me, brother, and we will cut through the webs together. Bring fire, for the spiders hate it, and a strong stomach." },
        { id = "yyhelp_d", text = "Then come with me when I go, and we will cut a path through the webs together. Bring fire, for the spiders hate it. And bring a strong stomach." },
      },
      choices = {
        { text = "I'll be ready.", next = "BACK", reply = "Good. I will wait for you.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    kerga = { { id = "ytp_kerga", text = "Kerga was my mate. Her laugh was louder than a war drum." } },
    malaka_jin = { { id = "ytp_malaka_jin", text = "Malaka'jin is a troll camp, but they have made me welcome. I owe them for it." } },
    background = { { id = "tp_bg", text = "A scout of the Horde, sent to Stonetalon. I had a mate, and the canyon has her bones." } },
    _none = { { id = "tp_none", text = "I know nothing of that. I know one canyon and what lives in it." } },
  },
}

-- Gatekeeper Kordurus: keeper of the grove guarding the entrance to the Talon Den, Stonetalon Peak.
P:NPC {
  key = "gatekeeper_kordurus", id = TODO_NPC("Gatekeeper Kordurus"), name = "Gatekeeper Kordurus", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "stonetalon_peak" }, temper = { "stern", "calm" }, values = { "dutiful", "nature" },
  notices = { "class", "craft" },
  impression = {
    first = "Gatekeeper Kordurus is a keeper of the grove who stands before the Talon Den on Stonetalon Peak, antlered and still as the trees around him. He looked me over the way a forest looks over a campfire.",
    third = "{name} met Gatekeeper Kordurus, the keeper of the grove who guards the Talon Den on Stonetalon Peak.",
  },
  greetings = {
    { id = "g_default", text = "Hold, {class}. You stand at the door of the Talon Den, and none pass it who mean harm to this mountain." },
    { id = "g_back", when = { metBefore = true }, text = "You come again to the Den. Walk in peace, as you did before." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A child of the Dream stands before me. Enter freely, for the Den was made for those who walk as you walk." },
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "You smell of oil and blasting powder, as the goblins in the vale below do. I shall let you pass, but leave your machines outside the grove." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Kordurus, a son of the forest lord's line, and the keeping of this gate was given to me. Behind me the druids of the peak take their counsel, and before me lies a mountain that is being cut and burned a little more with every moon." } },
      again = {
        { id = "h_again", text = "What else would you ask of the gate?" },
        { id = "h_again2", text = "Speak. I have stood here long enough to be patient." },
      },
      choices = {
        { text = "What is the Talon Den?", next = "den" },
        { text = "Who is cutting the mountain?", next = "cutting" },
        { text = "You don't seem to trust strangers.", next = "trust" },
        { text = "Do you ever leave the gate?", next = "yleave" },
        { text = "What do you remember of the mountain before?", next = "ybefore" },
        { text = "Should the keepers make war on the goblins?", next = "ywar" },
        { text = "A druid of the Circle greets you, Gatekeeper.", next = "ydruid", when = { class = "DRUID" } },
        { text = "I come in peace, Gatekeeper.", next = "END" },
      },
    },
    den = {
      lines = { { id = "d_default", text = "A hollow in the living rock where the druids of the talon have gathered since before your grandsires' grandsires. Keeper Albagorm speaks for us there, and he has more patience with the young races than I have yet learned." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    cutting = {
      lines = { { id = "c_default", text = "The goblins of the Venture Company, who have stripped the Windshear Crag to bare stone and now look hungrily northward. They fell a tree that stood five hundred years to make a plank that will rot in ten." } },
      choices = {
        { text = "What will the keepers do about it?", next = "do_" },
        { text = "Another question.", next = "BACK" },
      },
    },
    do_ = {
      lines = { { id = "do_default", text = "What we are able, which is less than I would wish. We are few, and so we ask those who climb to this peak to carry our answer down to the Crag, and many have gone willingly." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "t_default", text = "I trust what a traveller does, and I have not yet seen what you will do. Many who came smiling to this mountain went away with its timber, and so I have learned to watch hands and pay little heed to faces." } },
      choices = { { text = "Then watch mine. Another question.", next = "BACK" } },
    },
    yleave = {
      lines = {
        { id = "yyleave_d", text = "Not in a hundred years. My father, Cenarius, gave this gate to my keeping, and I will keep it until the mountain falls or I do. The druids bring me news, and the wind brings me the rest." },
      },
      choices = {
        { text = "Another question.", next = "BACK" },
      },
    },
    ybefore = {
      lines = {
        { id = "yybefore_d", text = "Green to the peaks, with waterfalls in every valley and eagles above. The Charred Vale was a forest of red pines. Now it is ash, and the eagles fly higher, and they do not come down." },
      },
      choices = {
        { text = "Another question.", next = "BACK" },
      },
    },
    ywar = {
      lines = {
        { id = "yywar_d", text = "Some of my kin say so, and they are loud. The druids counsel patience, for war burns forests too. I stand between them, and the mountain bleeds while we argue." },
      },
      choices = {
        { text = "Drive the goblins out by force.", next = "BACK", reply = "There is truth in that. I have felt it in my hooves.", fx = { align = { order = -1 } } },
        { text = "Patience. A war would burn what's left.", next = "BACK", reply = "That is the druids' counsel. I hope it is wise.", fx = { align = { order = 1 } } },
      },
    },
    ydruid = {
      lines = {
        { id = "yydruid_v0", when = { class = "DRUID" }, text = "Then you are welcome, druid. Tell the council the Gatekeeper greets them, and that the Venture camps have moved another league north." },
        { id = "yydruid_d", text = "Then you are welcome at the gate, and you may pass when the council allows. Tell them the Gatekeeper sends his greetings, and that the Venture camps have moved another league north." },
      },
      choices = {
        { text = "Another question.", next = "BACK" },
      },
    },
  },
  topics = {
    cenarius = { { id = "ytp_cenarius", text = "Cenarius is my father, and the father of all the keepers. His spirit walks in the forests still." } },
    charred_vale = { { id = "ytp_charred_vale", text = "The Charred Vale was a forest. The goblins burned it, and the wind still carries the ash." } },
    background = { { id = "tp_bg", text = "I am a keeper of the grove, and this gate is my charge. I have had no other since the forest was whole." } },
    venture_company = { { id = "tp_vc", text = "Goblins who cut and burn for coin. The Windshear Crag is their doing." } },
    _none = { { id = "tp_none", text = "That is not a matter for the gate. Ask Keeper Albagorm within." } },
  },
}

