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
  notices = { "class" },
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
    { id = "n_orc", cat = "class", when = { race = "Orc" },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "A scout of the Horde, sent to Stonetalon. I had a mate, and the canyon has her bones." } },
    _none = { { id = "tp_none", text = "I know nothing of that. I know one canyon and what lives in it." } },
  },
}

-- Gatekeeper Kordurus: keeper of the grove guarding the entrance to the Talon Den, Stonetalon Peak.
P:NPC {
  key = "gatekeeper_kordurus", id = TODO_NPC("Gatekeeper Kordurus"), name = "Gatekeeper Kordurus", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "stonetalon_peak" }, temper = { "stern", "calm" }, values = { "dutiful", "nature" },
  notices = { "class" },
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
    { id = "n_engineer", cat = "class", when = { profession = "Engineering" },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a keeper of the grove, and this gate is my charge. I have had no other since the forest was whole." } },
    venture_company = { { id = "tp_vc", text = "Goblins who cut and burn for coin. The Windshear Crag is their doing." } },
    _none = { { id = "tp_none", text = "That is not a matter for the gate. Ask Keeper Albagorm within." } },
  },
}

-- Saern Priderunner: tauren on Hunter Rise, Thunder Bluff (the scan's "Sunwalker Saern" is her later name).
P:NPC {
  key = "saern_priderunner", id = TODO_NPC("Saern Priderunner"), name = "Saern Priderunner", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "proud", "steady" }, values = { "brave", "loyal" },
  notices = { "class" },
  impression = {
    first = "Saern Priderunner is a tauren brave who stands on Hunter Rise in Thunder Bluff with the bearing of someone who has run a long way to be there. She watches the plains below as if she could still see every mile of them.",
    third = "{name} met Saern Priderunner, a tauren brave on Hunter Rise in Thunder Bluff.",
  },
  greetings = {
    { id = "g_default", text = "The winds greet you on Hunter Rise, {class}. Stand a while and look out, for there is no finer view of Mulgore." },
    { id = "g_back", when = { metBefore = true }, text = "You have climbed the Rise again. The plains have not changed, and I am glad of that." },
  },
  notice = {
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = { "WARRIOR", "HUNTER" } },
      text = "You carry yourself as one who has run the plains with a spear in hand. The Rise is the right place for you, and the elders here will be glad to see it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Saern Priderunner. My family carried word between the tribes on foot in the days before we had a city, and though the Bluff has made that work lighter, I have not forgotten how to run." } },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak, and I will hear you." },
      },
      choices = {
        { text = "Your people ran between the tribes?", next = "ran" },
        { text = "What do you watch for from up here?", next = "watch" },
        { text = "Who should a young hunter seek on the Rise?", next = "seek" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    ran = {
      lines = { { id = "r_default", text = "When the centaur drove us from one grazing ground to the next, the tribes were often many days apart. A runner who knew the plains could cross them faster than a kodo, and bring warning before the dust of the war bands was in sight." } },
      choices = {
        { text = "And now that the tribes are one?", next = "now" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    now = {
      lines = { { id = "n_default", text = "Now Cairne has given us a home that does not move, and I thank the Earth Mother for it each morning. But I still run the plains at dawn, because a people who forget how they survived will not survive the next hardship." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "w_default", text = "Old habit, mostly. I look for dust where there should be none, and though the centaur do not come into Mulgore now, the quilboar and the goblins' diggers have given my eyes new work." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    seek = {
      lines = { { id = "s_default", text = "The Thunderhorns teach the hunter's path here, and the Ragetotems the warrior's. Go to them humbly, for they have forgotten more of the hunt than most will ever learn." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am of the Priderunners, who carried word between the tribes on foot. I keep the old running alive." } },
    _none = { { id = "tp_none", text = "The winds have not told me. Ask among the elders on Elder Rise." } },
  },
}
