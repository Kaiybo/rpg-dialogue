-- Feralas, the missed folk (Alliance side): the quiet trades of Feathermoon Stronghold (Bethan Bluewater,
-- Brannock, Savanne, Dulciea Frostmoon, Faralorn, Kylanna Windwhisper, Logannas, Mardrack Greenwell) and the
-- two watchers at the Twin Colossals (Marli Wishrunner, Kalin Windflight). Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bethan Bluewater: in the druids' tree-house at Feathermoon Stronghold.
P:NPC {
  key = "bethan_bluewater", id = TODO_NPC("Bethan Bluewater"), name = "Bethan Bluewater", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "feathermoon" }, temper = { "quiet" }, values = { "patient", "rooted" },
  notices = { "class", "race" },
  impression = {
    first = "Bethan Bluewater keeps to the druids' tree-house at Feathermoon and watches the sea through its windows as though it owed her an answer. She speaks softly and takes her time, and I had the feeling the island would have to sink before she left it.",
    third = "{name} met Bethan Bluewater, a night elf who keeps to the druids' tree-house at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. The house is quiet, and you are welcome in it. Sit by the water a while." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. This is a quiet house. I ask you to keep it so, and not stay long." },
    { id = "g_default", text = "Ishnu-alah, {class}. You have come a long way over the water to stand in so quiet a room." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and the tide has turned twice since you were last here. Sit a while, if you wish." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune is bright on the water tonight. It is the best hour to be on this island, and the hour the naga like best as well." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You walk as the druids do, with one foot in the Dream. Quintis will want to speak with you, though he will pretend he is too busy." },
    { id = "n_young", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "Your people measure a journey in days, I am told. I have been watching this one shore for longer than your kingdoms have had names, and I have not finished." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Bethan Bluewater. I keep this house in order for the druids and I watch the water, and between the two I am rarely idle, though it may not look so to one in a hurry." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. The tide is in no haste, and neither am I." },
        { id = "h_again2", text = "There was something more, I think. Say it; the water will carry my thoughts away again if you wait too long." },
      },
      choices = {
        { text = "A quiet house is worth tending.", next = "BACK", reply = "It is. The druids need peace for their work.", fx = { align = { order = 1 } } },
        { text = "Quiet's overrated. A house needs some life in it.", next = "BACK", reply = "Not this one. Please, go softly.", fx = { align = { order = -1 } } },
        { text = "How long have you kept this house?", next = "ybet_long" },
        { text = "Do the naga remember Zin-Azshari?", next = "ybet_naga", when = { race = "NightElf" } },
        { text = "What do you watch the water for?", next = "water" },
        { text = "This is the druids' house, then.", next = "house" },
        { text = "You don't seem troubled by the naga.", next = "naga" },
        { text = "What's the strangest thing the tide has brought in?", next = "w7_tide" },
        { text = "Elune light your path.", next = "END" },
      },
    },
    w7_tide = {
      lines = {
        { id = "w7_tide_l1", text = "A sealed bottle from the Isle of Dread, with a letter inside in a hand I did not know. It was written by a sailor to a woman named Elsa, and it promised that he would come home before the next full moon." },
      },
      choices = {
        { text = "Did you find Elsa?", next = "w7_tide2" },
        { text = "It's just a bottle.", next = "w7_tide3" },
        { text = "Something else, Bethan.", next = "BACK" },
      },
    },
    w7_tide2 = {
      lines = {
        { id = "w7_tide2_l1", text = "I sent it with the next boat to Auberdine, and the next to Stormwind, and I do not know what became of it. I like to think she read it, and that he came home, though the Isle of Dread does not let many go." },
        { id = "w7_tide2_l2", when = { race = "Human" }, text = "It was a human hand, so I sent it on to Stormwind. If you hear of a woman named Elsa whose sailor came home late, tell her a night elf on Feathermoon kept his letter dry for her." },
      },
      choices = {
        { text = "That was kind of you.", next = "BACK", reply = "It was the least the tide asked of me." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_tide3 = {
      lines = {
        { id = "w7_tide3_l1", text = "Everything the sea brings is just something, until you ask whose it was." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    water = {
      lines = { { id = "w_default", text = "For whatever it brings, which is the only honest answer. Wreckage from the Isle of Dread, sea giants wading where they did not wade last season, and now and then a ship that has no business being so far south." } },
      choices = {
        { text = "And what has it brought lately?", next = "lately" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lately = {
      lines = { { id = "l_default", text = "More naga than I have seen since the Sentinels first raised these walls. They gather in the ruins at the island's northern end, and they are too patient about it for my liking." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    house = {
      lines = { { id = "ho_default", text = "It is Quintis Jonespyre's more than anyone's, and he fills it with seeds and stones and questions. I see that he eats, and that nothing he is studying is left where a visitor may sit on it." } },
      choices = {
        { text = "What is he studying now?", next = "studying" },
        { text = "Something else.", next = "BACK" },
      },
    },
    studying = {
      lines = { { id = "s_default", text = "A grain from the crater far to the south, which Darnassus wants in great quantity and will not say why. He frowns at it for hours, and I have learned not to ask him before he has had his tea." } },
      choices = { { text = "A wise rule. Something else.", next = "BACK" } },
    },
    naga = {
      lines = { { id = "n_default", text = "I am troubled by them, but I will not be moved by them. This island has belonged to them once already, when it had another name, and General Feathermoon did not win it back so that I might flinch at a fin in the surf." } },
      choices = {
        { text = "Then I'm glad you are staying.", next = "BACK", reply = "As am I. Someone should know this shore well enough to notice when it changes.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybet_long = {
      lines = {
        { id = "yybet_long_d", text = "Since the first timbers were raised, when Shandris brought the Sentinels across the water and claimed this island for the Kaldorei. I asked to come because I had lost my home in Ashenvale to the orcs' axes, and the sea felt cleaner than the forest did then." },
      },
      choices = {
        { text = "What happened to your home?", next = "ybet_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybet_home = {
      narr = "Bethan turns from the window for a moment, and her hands go still on the sill.",
      lines = {
        { id = "yybet_home_d", text = "A grove near Splintertree, where my family had lived since the Sundering. The Warsong cut it for their lumber camp, and I watched from the hills as the oldest tree came down. I have not been back, and I do not think I ever will." },
      },
      choices = {
        { text = "Do you hate the orcs for it?", next = "ybet_hate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybet_hate = {
      lines = {
        { id = "yybet_hate_d", text = "I tried to, for many years, and found it only made me tired. The Sentinels say we must drive them out of Ashenvale, and the druids say the forest heals in its own time, and I stand between them watching the sea." },
      },
      choices = {
        { text = "Let it go. Hatred heals nothing.", next = "BACK", reply = "Yes. That is what the sea has been teaching me, slowly.", fx = { align = { light = 1 } } },
        { text = "The orcs must answer for it. Remember that.", next = "BACK", reply = "Perhaps they must. But I am not the one to make them answer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybet_naga = {
      lines = {
        { id = "yybet_naga_v0", when = { class = "DRUID" }, text = "You feel it too, then, the old wrongness in them. They were Highborne once, and the Dream remembers what they did. They remember too, I think, and it has made them bitter beyond any healing." },
        { id = "yybet_naga_d", text = "They must, though they will not speak of it. They were Highborne once, the queen's own court, and they went down with her city when the Well was destroyed. Whatever they are now, the sea has not been kind." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    feathermoon_stronghold = { { id = "tp_yfeathermoon_stronghold", text = "Our home on Sardor Isle. Shandris built it, and the Sentinels keep it." } },
    quintis_jonespyre = { { id = "tp_yquintis_jonespyre", text = "He studies seeds and stones and forgets to eat. I remind him." } },
    background = { { id = "tp_bg", text = "I came to Feralas with the Sentinels when the stronghold was raised, and I have seen no reason to live anywhere else since." } },
    _none = { { id = "tp_none", text = "That has not washed up on my shore. Ask Quintis, or one of the General's officers." } },
  },
}

-- Savanne: fishing supplies, beside Brannock.
P:NPC {
  key = "savanne", id = TODO_NPC("Savanne"), name = "Savanne", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "wry" }, values = { "honest", "practical" },
  notices = { "craft" },
  impression = {
    first = "Savanne sells lines, hooks and bait at Feathermoon, and she will tell you plainly which of them you do not need. She and the fishing master Brannock argue about bait like an old married pair, though neither would thank me for writing it down.",
    third = "{name} met Savanne, who sells fishing supplies at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Elune-adore, friend! Tell me what you mean to catch, and I'll find you the very best hooks." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Tackle. Tell me what you mean to catch, and I'll sell you what you need. No more." },
    { id = "g_default", text = "Elune-adore, {class}. If you have come for tackle, tell me first what you mean to catch, and I will save you the price of three things you do not need." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and I hope with a tale of the one that did not get away." },
  },
  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You hold yourself like someone who has lost a good fish and not forgiven it. I can help with the line, if not with the grudge." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Savanne, and I keep the stronghold in hooks, line and bait. Brannock teaches the art and I supply the means, and between us nobody on this island need go hungry." },
      },
      again = {
        { id = "h_again", text = "Was there something more you needed? Ask, and I will tell you which three hooks you can do without." },
        { id = "h_again2", text = "Ask, then. The fish will wait, as they always do." },
      },
      choices = {
        { text = "A good fisherman respects the water.", next = "BACK", reply = "Yes, and the water gives back to those who do.", fx = { align = { light = 1 } } },
        { text = "The water is just a place to pull fish from.", next = "BACK", reply = "Then you will pull very few. Tackle is there, on the shelf.", fx = { align = { light = -1 } } },
        { text = "Did you fish before Feathermoon?", next = "ysav_before" },
        { text = "I'm a fisher too. Settle the bait argument.", next = "ysav_fish", when = { profession = "Fishing" } },
        { text = "What does a fisher need for these waters?", next = "need" },
        { text = "You and Brannock work side by side.", next = "brannock" },
        { text = "Do the naga trouble your trade?", next = "naga" },
        { text = "Which of your lures is your own design?", next = "w7_lure" },
        { text = "Fair winds, Savanne.", next = "END" },
      },
    },
    w7_lure = {
      lines = {
        { id = "w7_lure_l1", text = "The silver one with the blue bead, there, which I carved from a broken Sentinel's buckle. The yellowtail cannot resist it, and Brannock refuses to use it on principle, because he did not think of it first." },
      },
      choices = {
        { text = "Does it really work?", next = "w7_lure2" },
        { text = "A buckle makes a strange lure.", next = "w7_lure3" },
        { text = "Something else, Savanne.", next = "BACK" },
      },
    },
    w7_lure2 = {
      lines = {
        { id = "w7_lure2_l1", text = "Better than any worm on this island, and I have the tally to prove it. I keep it on the wall behind me, and Brannock keeps one on his side, and his numbers have been falling behind since spring." },
        { id = "w7_lure2_l2", when = { profession = "Fishing" }, text = "See for yourself: cast it off the north side at dusk and count. You will catch more yellowtail than Brannock has all week, and then you may tell him so, because I am too polite." },
      },
      choices = {
        { text = "I'll tell him.", next = "BACK", reply = "Do, and watch his face. It is the best part." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_lure3 = {
      lines = {
        { id = "w7_lure3_l1", text = "The Sentinel did not need it any more, and the fish do. Everything on this island finds a second use." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "A strong line before anything else, because the redgill here fight harder than they look. After that a little patience, which I cannot sell you, and which Brannock claims he can teach." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brannock = {
      lines = { { id = "b_default", text = "For longer than either of us cares to count. He is the finest fisher I know, and he is entirely wrong about nightcrawlers, and I tell him both things whenever he will listen." } },
      choices = {
        { text = "Who is right about the bait?", next = "bait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bait = {
      lines = { { id = "ba_default", text = "I am, naturally. A bright lure brings the yellowtail up from the reef faster than any worm, and I have a century of full baskets to prove it. He will tell you otherwise, and you may smile and nod." } },
      choices = { { text = "I'll smile and nod. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    naga = {
      lines = { { id = "na_default", text = "They cut the nets we used to set off the northern point, and so we set no nets there now. It is a small loss beside what the Sentinels risk each night, and I do not complain of it where they can hear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ysav_before = {
      lines = {
        { id = "yysav_before_d", text = "In Auberdine, on the Darkshore coast, where the water is cold and grey and the fish are slow. I came to Feralas because I had heard the fish here fought back, and I wanted to see if my old lines could hold." },
      },
      choices = {
        { text = "Could they?", next = "ysav_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysav_hold = {
      narr = "Savanne holds up a coil of line, frayed in three places, and smiles thinly.",
      lines = {
        { id = "yysav_hold_d", text = "Not one of them lasted a week. The redgill here are vicious, and the naga's pets in the deep water are worse. I spent my first season learning to make new line from silk, and I have never been prouder of anything I have made." },
      },
      choices = {
        { text = "What do the naga keep in the deep water?", next = "ysav_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysav_naga = {
      lines = {
        { id = "yysav_naga_d", text = "Things with too many teeth and no eyes, by the look of what they leave on my hooks. The Sentinels want to drive the naga off the island entirely, but the naga were here before us, and I am not sure the sea is ours to claim." },
      },
      choices = {
        { text = "Drive them off. The island is ours now.", next = "BACK", reply = "That is the General's answer, and I will not argue it. I only wonder.", fx = { align = { order = 1 } } },
        { text = "Leave them be. The sea is theirs too.", next = "BACK", reply = "Yes, I think so. Brannock thinks so too, though he will not say it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysav_fish = {
      lines = {
        { id = "yysav_fish_d", text = "Then you know I am right. A bright lure for the yellowtail, and nightcrawlers only for the slow fish in the shallows. Brannock will tell you otherwise, but he is old and stubborn, and so am I." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    auberdine = { { id = "tp_yauberdine", text = "My old home on the Darkshore coast. The water is cold and the fish are slow." } },
    fishing = { { id = "tp_yfishing", text = "Brannock is the finest fisher I know, and wrong about bait. Do not tell him I said so." } },
    background = { { id = "tp_bg", text = "I have kept fishers supplied since the stronghold was a row of tents. The trade is quiet, and I like it so." } },
    _none = { { id = "tp_none", text = "That is beyond my baskets, I fear. Ask at the inn; Shyria hears everything." } },
  },
}

-- Dulciea Frostmoon: cloth armor merchant.
P:NPC {
  key = "dulciea_frostmoon", id = TODO_NPC("Dulciea Frostmoon"), name = "Dulciea Frostmoon", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "gracious" }, values = { "careful", "proud" },
  notices = { "class", "kit" },
  impression = {
    first = "Dulciea Frostmoon sells robes and cloth at Feathermoon Stronghold, and she folds each one as though it were going to a temple. She looked at my travelling clothes with real sorrow.",
    third = "{name} met Dulciea Frostmoon, the cloth armor merchant of Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. The salt has spared you this time, I see. Come, let me show you the newest silk." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "The salt air has ruined your clothes. Buy something, or go and let it ruin them further." },
    { id = "g_default", text = "Ishnu-alah, {class}. The salt air has not been kind to what you are wearing, and I say so only because I can mend the matter." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I see the forest has added a few new tears since we last spoke." },
  },
  notice = {
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You wear cloth by calling and not by poverty, which I am glad to see. Too few who come through this garrison understand that a robe is armor of another kind." },
    { id = "n_tailor", cat = "kit", when = { profession = "Tailoring" },
      text = "A tailor's eye went to my seams before it went to my face. Look as closely as you like, for I am not ashamed of them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Dulciea Frostmoon. In a stronghold full of mail and glaives I sell silk and woven cloth, and you would be surprised how many Sentinels come to me when their watch is over." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? Ask, and stand still while you do; I am measuring your sleeve by eye." },
        { id = "h_again2", text = "Speak freely. Folding can wait." },
      },
      choices = {
        { text = "Fine cloth has its place, even among soldiers.", next = "BACK", reply = "It does. The Sentinels need it more than they admit.", fx = { align = { order = 1 } } },
        { text = "Silk is useless in a war.", next = "BACK", reply = "Then go and buy mail. You will be hot, and miserable.", fx = { align = { order = -1 } } },
        { text = "What did you weave in Ashenvale?", next = "ydul_ash" },
        { text = "My cloth needs your oils. Tell me how.", next = "ydul_tailor", when = { profession = "Tailoring" } },
        { text = "Who buys robes in a garrison?", next = "who" },
        { text = "How does cloth fare in this wet forest?", next = "wet" },
        { text = "Cloth won't turn an ogre's club.", next = "club" },
        { text = "What colours are hardest to keep in this damp?", next = "w7_dye" },
        { text = "Good day, Dulciea.", next = "END" },
      },
    },
    w7_dye = {
      lines = {
        { id = "w7_dye_l1", text = "The blues, always. Moonlight blue fades to grey in a single season here, and the Sentinels' tabards come back to me looking like the sky over Desolace. Greens hold better, as though the forest approves of them." },
      },
      choices = {
        { text = "Why do the blues fade?", next = "w7_dye2" },
        { text = "Dye them green, then.", next = "w7_dye3" },
        { text = "Something else, Dulciea.", next = "BACK" },
      },
    },
    w7_dye2 = {
      lines = {
        { id = "w7_dye2_l1", text = "Because the blue is made from a flower that grows only in Ashenvale, and it does not care for the salt. I have been trying a dye from the Feralas sea-shells, but so far it comes out the colour of a bruise." },
        { id = "w7_dye2_l2", when = { profession = "Tailoring" }, text = "The blue is from an Ashenvale flower, and the salt eats it. If you try a sea-shell dye, set it with alum and seawater, not fresh; mine came out bruise-purple, but it held a full season." },
      },
      choices = {
        { text = "Keep trying.", next = "BACK", reply = "I will. A Sentinel deserves to look like the moon, not a bruise." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_dye3 = {
      lines = {
        { id = "w7_dye3_l1", text = "The Sentinels wear the moon's colours, not the forest's. That is not my choice to change, however much easier it would make my work." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "The priestesses, the druids in the tree-house, and every soldier who wishes to be something other than a soldier for an evening. Even General Feathermoon does not sleep in her armor, whatever the recruits believe." } },
      choices = { { text = "I'll keep that between us. Something else.", next = "BACK" } },
    },
    wet = {
      lines = { { id = "we_default", text = "Poorly, unless it is treated, and so I treat every bolt with oils before it is cut. Feralas rots what it cannot grow over, and it has been trying to grow over this island since we arrived." } },
      choices = {
        { text = "Where does your cloth come from?", next = "from" },
        { text = "Something else.", next = "BACK" },
      },
    },
    from = {
      lines = { { id = "f_default", text = "By ship from Auberdine and Darnassus when the sea allows, which is less often than I would like. When it does not, I make do, and I have learned to make do rather well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    club = {
      lines = { { id = "c_default", text = "No, it will not, and I would never tell you that it would. Those who wear my robes mean to end the argument before the club arrives, and the Gordunni have learned to their cost that some of them can." } },
      choices = { { text = "A fair answer. Something else.", next = "BACK" } },
    },
    ydul_ash = {
      lines = {
        { id = "yydul_ash_d", text = "Robes for the priestesses at the Temple of the Moon, and banners for the Sentinels at Astranaar. My mother taught me the old patterns, the ones woven before the Sundering, and I carried them south in my head when I came." },
      },
      choices = {
        { text = "What are the old patterns like?", next = "ydul_patterns" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydul_patterns = {
      narr = "Dulciea draws a robe from the shelf and runs her thumb along a silver border, tracing a crescent woven into the hem.",
      lines = {
        { id = "yydul_patterns_d", text = "Crescents and stars and the shapes of leaves, each one with a meaning. The Highborne wove their own patterns too, grander and colder, and some of the young tailors want to bring those back because they are beautiful. I will not teach them." },
      },
      choices = {
        { text = "Why won't you teach the Highborne patterns?", next = "ydul_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydul_why = {
      lines = {
        { id = "yydul_why_d", text = "Because beauty was the first step they took toward ruin, and we should not forget it. The young ones call me old-fashioned, and they are right, but I have seen what pride in beautiful things can do to a people." },
      },
      choices = {
        { text = "You're right. Some beauty is dangerous.", next = "BACK", reply = "Thank you. I feel very old when I say it, and very sure.", fx = { align = { light = 1 } } },
        { text = "A pattern is only a pattern. Teach them.", next = "BACK", reply = "Perhaps you are right, and I am frightened of thread. I will think on it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydul_tailor = {
      lines = {
        { id = "yydul_tailor_d", text = "A little moonleaf oil, cut with seawater and boiled down, then brushed into the weave before cutting. It keeps out the rot and the damp, and it gives the cloth a faint sheen that the priestesses like. Practise on linen first." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    temple_of_the_moon = { { id = "tp_ytemple_of_the_moon", text = "I wove robes for the priestesses there. They still wear my mother's patterns." } },
    sentinels = { { id = "tp_ysentinels", text = "They wear mail, but they come to me for something soft to sleep in." } },
    background = { { id = "tp_bg", text = "I have worked cloth for a very long time, in Ashenvale first and then here. A garrison needs softness more than it knows." } },
    _none = { { id = "tp_none", text = "I cannot speak to that. My knowledge is in thread, and it ends where the thread does." } },
  },
}

-- Faralorn: general supplies.
P:NPC {
  key = "faralorn", id = TODO_NPC("Faralorn"), name = "Faralorn", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "orderly" }, values = { "prepared" },
  notices = { "weary", "race" },
  impression = {
    first = "Faralorn keeps Feathermoon's general stores, and he counts every water skin twice before a patrol goes out. He asked where I was bound before he would sell me anything, and then told me what I had forgotten.",
    third = "{name} met Faralorn, who sells general supplies at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Well met, friend. Tell me where you're bound, and I'll make sure you leave with everything." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Tell me where you're bound, and I'll tell you what you lack. That is all." },
    { id = "g_default", text = "Well met, {class}. Tell me where in Feralas you are bound, and I will tell you what you have forgotten to pack." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back whole, so you must have packed well. What have you run short of?" },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Your gear has taken a beating that I can see from here. The mainland does that, and I would see the smith before you cross again." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf on Sardor! Pratt McGrubben will be pleased, for he has been complaining that nobody here understands a proper breakfast." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Faralorn, and anything a traveller needs that is not a weapon passes across my counter. The Sentinels provision here before every crossing to the mainland, and I have yet to send one out short." },
      },
      again = {
        { id = "h_again", text = "What else do you need to know before you go? Ask now; once you are on the boat, I can't hand you what you forgot." },
        { id = "h_again2", text = "Go on. I am listening while I count." },
      },
      choices = {
        { text = "Good order keeps travelers alive.", next = "BACK", reply = "It does. Feralas forgives no carelessness.", fx = { align = { order = 1 } } },
        { text = "I'll go where the road takes me. Plans change.", next = "BACK", reply = "Then the road will take you to an early grave.", fx = { align = { order = -1 } } },
        { text = "What happens if the stores run out?", next = "yfar_out" },
        { text = "Pratt McGrubben, you say?", next = "yfar_dwarf", when = { race = "Dwarf" } },
        { text = "What do travellers forget most?", next = "forget" },
        { text = "How do supplies reach an island?", next = "ships" },
        { text = "The Sentinels seem stretched thin.", next = "thin" },
        { text = "What do you never let a patrol leave without?", next = "w7_never" },
        { text = "I'm well packed. Farewell.", next = "END" },
      },
    },
    w7_never = {
      lines = {
        { id = "w7_never_l1", text = "Dry tinder, wrapped in oilcloth, and a spare bowstring for every archer. A Sentinel can fight wet and fight hungry, but a Sentinel without fire or a string is only a very brave elf with a stick." },
      },
      choices = {
        { text = "Has a patrol ever gone without?", next = "w7_never2" },
        { text = "That's a short list.", next = "w7_never3" },
        { text = "Something else, Faralorn.", next = "BACK" },
      },
    },
    w7_never2 = {
      lines = {
        { id = "w7_never2_l1", text = "Once, early, when the boat was late and the stores were bare. They came back two days early with half their bows unstrung, and one of them had a fever from sleeping wet. I have kept a hidden store of tinder and string ever since." },
        { id = "w7_never2_l2", when = { class = "HUNTER" }, text = "Once, and you will understand what that means to an archer. They came back with half their bows unstrung. Take two spare strings from me before you cross, hunter, and keep one somewhere you will not think to look." },
      },
      choices = {
        { text = "Good thinking.", next = "BACK", reply = "It is only memory, written down as rules." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_never3 = {
      lines = {
        { id = "w7_never3_l1", text = "Short, but those two things have saved more lives than any blade I could sell." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    forget = {
      lines = { { id = "f_default", text = "Water, though they are surrounded by it, because none of it on the western shore is fit to drink. After that it is rope, and after that it is the sense to turn back before dusk when the Woodpaw are about." } },
      choices = { { text = "I'll carry all three. Something else.", next = "BACK" } },
    },
    ships = {
      lines = { { id = "s_default", text = "The boat from the Forgotten Coast brings what the mainland can spare, and the hippogryphs bring what cannot wait. Fyldren Moonfeather grumbles each time I ask her riders to carry a crate, and each time she lets them." } },
      choices = {
        { text = "And when the boat is late?", next = "late" },
        { text = "Something else.", next = "BACK" },
      },
    },
    late = {
      lines = { { id = "l_default", text = "Then Mardrack and I sit down with our ledgers and decide what the garrison will go without. It has never yet been arrows or bread, and I intend that it never shall be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thin = {
      lines = { { id = "t_default", text = "They are, and you are observant to see it. There are naga on our own island, ogres in the highlands and gnolls on the road, and only so many glaives to send against all three." } },
      choices = { { text = "Then they can use my help. Something else.", next = "BACK", reply = "They can, and they will say so less gracefully than I do. Speak with the General's officers.", fx = { affinity = 1 } } },
    },
    yfar_out = {
      lines = {
        { id = "yyfar_out_d", text = "Then the patrols go short, and a short patrol is a careless one. I have seen it happen in Ashenvale when the roads were cut, and I lost a cousin because her water ran dry on the road to Astranaar. I count every skin twice because of her." },
      },
      choices = {
        { text = "I'm sorry. What was her name?", next = "yfar_cousin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfar_cousin = {
      narr = "Faralorn's hands pause over the ledger, and he does not look up.",
      lines = {
        { id = "yyfar_cousin_d", text = "Nyreth, a Sentinel of thirty years' service. She went out with a patrol to hunt orc scouts, and they were three days late returning because the stores had been miscounted. I was the one who miscounted them." },
      },
      choices = {
        { text = "That must weigh on you.", next = "yfar_weigh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfar_weigh = {
      lines = {
        { id = "yyfar_weigh_d", text = "It does, every day, though the General has never once mentioned it. Some of the younger Sentinels want me to send them out light, so they can move faster, and every time they ask I see Nyreth's face." },
      },
      choices = {
        { text = "Send them full. Better slow than dead.", next = "BACK", reply = "Yes. That is what I will do, whatever they say.", fx = { align = { order = 1 } } },
        { text = "Trust them. They know their own needs.", next = "BACK", reply = "Perhaps. But they are young, and the young always think they need less.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfar_dwarf = {
      lines = {
        { id = "yyfar_dwarf_d", text = "A dwarf who sells his wares here on the island, and the only one who argues prices with me as hard as I argue them back. He says the elves are too polite to haggle properly, and I have begun to agree with him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    feathermoon_stronghold = { { id = "tp_yfeathermoon_stronghold", text = "Every arrow and water skin on this island passes my counter first." } },
    forgotten_coast = { { id = "tp_yforgotten_coast", text = "Where the boat comes from. It is late more often than I would like." } },
    background = { { id = "tp_bg", text = "I kept the stores for the Sentinels in Ashenvale before this, and I came south with General Feathermoon's expedition." } },
    _none = { { id = "tp_none", text = "That is not in my stores or my ledgers. Ask Ginro Hearthkindle, who reads every dispatch." } },
  },
}

-- Logannas: alchemy supplies, beside Kylanna.
P:NPC {
  key = "logannas", id = TODO_NPC("Logannas"), name = "Logannas", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "mild" }, values = { "careful" },
  notices = { "craft" },
  impression = {
    first = "Logannas sells vials and alchemical stock beside Kylanna Windwhisper's table, and he wraps each piece of glass in moss before he hands it over. He seems content to stand in her shadow, and to keep it well supplied.",
    third = "{name} met Logannas, who sells alchemy supplies at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Well met, friend. Mind the crates, but I know you will. I've a new set of vials for Kylanna's students." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Well met. Mind the crates. Please, do not break anything." },
    { id = "g_default", text = "Well met, {class}. Mind the crates by your feet, for every one of them is glass and it came a very long way." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. I have set a few vials aside against breakage, as I always do." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, by the look of your satchel. Then you will know how quickly a day's work runs through a case of vials." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Logannas. Mistress Kylanna teaches the art, and I see that her students have glass to practise in and something to put in it. It is humble work, though nothing here would be brewed without it." },
      },
      again = {
        { id = "h_again", text = "Is there anything else I can tell you?" },
        { id = "h_again2", text = "Please, go on, and mind your elbow; that crate beside you holds forty vials and every one of them is spoken for." },
      },
      choices = {
        { text = "Supplying the students is important work.", next = "BACK", reply = "It is humble work, but they need it. Thank you.", fx = { align = { order = 1 } } },
        { text = "Glass is cheap. Let them break it.", next = "BACK", reply = "Not when it comes across the sea. Please mind the crates.", fx = { align = { order = -1 } } },
        { text = "How did you come to follow Kylanna?", next = "ylog_follow" },
        { text = "What vials does an alchemist need here?", next = "ylog_alch", when = { profession = "Alchemy" } },
        { text = "How do you keep glass whole out here?", next = "glass" },
        { text = "What is it like working beside Kylanna?", next = "kylanna" },
        { text = "Her students must break a great deal.", next = "students" },
        { text = "How do you pack glass for a hippogryph flight?", next = "w7_pack" },
        { text = "I'll mind the crates. Farewell.", next = "END" },
      },
    },
    w7_pack = {
      lines = {
        { id = "w7_pack_l1", text = "In moss, in a crate, in a basket, wrapped in a blanket, with a note on top in three languages saying 'gently'. The hippogryphs ignore the note, of course, but the riders read it, and that is the point." },
      },
      choices = {
        { text = "Do you lose many vials?", next = "w7_pack2" },
        { text = "Seems excessive.", next = "w7_pack3" },
        { text = "Something else, Logannas.", next = "BACK" },
      },
    },
    w7_pack2 = {
      lines = {
        { id = "w7_pack2_l1", text = "One in twenty, on average, though once a whole crate arrived as powder because the rider took a shortcut over the Twin Colossals. Kylanna did not speak to him for a month, and he still flies the long way round." },
        { id = "w7_pack2_l2", when = { profession = "Alchemy" }, text = "One in twenty, which you'll know is a fine rate for Feralas. If you ever order from me, ask for the cedar crate, not the pine; it costs more, but the pine splits in the damp." },
      },
      choices = {
        { text = "Good to know.", next = "BACK", reply = "I keep a list of such things. It is the only book I have written." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_pack3 = {
      lines = {
        { id = "w7_pack3_l1", text = "It is, until the vials arrive whole. Then it is simply enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    glass = {
      lines = { { id = "glass_default", text = "With moss, patience, and a strict word to every hippogryph rider who carries a crate for me. The sea crossing breaks one vial in ten whatever I do, and I have made my peace with the other nine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kylanna = {
      lines = { { id = "k_default", text = "She is the finest alchemist I have known, and she does not suffer carelessness in anyone, least of all herself. I have learned more by listening from this side of the table than I did in years of study." } },
      choices = {
        { text = "Do you brew as well?", next = "brew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew = {
      lines = { { id = "b_default", text = "A little, in the evenings, when the table is free and nobody is watching. I am better with ledgers than with cauldrons, and I think the stronghold is safer for my knowing it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    students = {
      lines = { { id = "s_default", text = "They do, and they are always so sorry about it. I tell them that every master began by dropping things, which is true, and it sends them back to the cauldron with a steadier hand." } },
      choices = { { text = "That's kindly done. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ylog_follow = {
      lines = {
        { id = "yylog_follow_d", text = "I sold her glass in Darnassus for many years, and when she said she was going to Feralas for the herbs that grow nowhere else, I asked if she would need glass there too. She said yes, and that was the end of my life in the city." },
      },
      choices = {
        { text = "Do you regret it?", next = "ylog_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylog_regret = {
      narr = "Logannas lifts a vial to the light, turning it so that the dim sun shows a hairline crack you would never have seen.",
      lines = {
        { id = "yylog_regret_d", text = "Not at all, though the glass breaks twice as often and the ogres make the roads dangerous. I have grown fond of the island and the work, and I have begun to wonder whether I came for the herbs or for the alchemist." },
      },
      choices = {
        { text = "For the alchemist, you mean?", next = "ylog_mean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylog_mean = {
      lines = {
        { id = "yylog_mean_d", text = "I mean I admire her a great deal, and I have never said so. She would be embarrassed, and I would be embarrassed, and it would make the work awkward. I have decided it is better to say nothing and keep supplying the glass." },
      },
      choices = {
        { text = "Tell her. You may never get another chance.", next = "BACK", reply = "Perhaps you are right. I will think about it, over a great deal of tea.", fx = { align = { honor = 1 } } },
        { text = "Say nothing. The work matters more.", next = "BACK", reply = "Yes, the work. That is what I keep telling myself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylog_alch = {
      lines = {
        { id = "yylog_alch_d", text = "Thin vials for the light work and heavy ones for anything with fire in it, and always more than you think. I keep a case of each behind the counter, and a third case for the students who have not yet learned to hold their hands still." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    kylanna_windwhisper = { { id = "tp_ykylanna_windwhisper", text = "The finest alchemist I know. I supply her glass, and say nothing more." } },
    darnassus = { { id = "tp_ydarnassus", text = "Where I sold glass for years before I came south." } },
    background = { { id = "tp_bg", text = "I have supplied alchemists since I was young, and I followed Mistress Kylanna to Feralas when she came for the herbs." } },
    _none = { { id = "tp_none", text = "I would not know, I am sorry. My world is rather the size of this table." } },
  },
}

-- Mardrack Greenwell: food and drink.
P:NPC {
  key = "mardrack_greenwell", id = TODO_NPC("Mardrack Greenwell"), name = "Mardrack Greenwell", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "warm" }, values = { "hospitable" },
  notices = { "hunger", "craft" },
  impression = {
    first = "Mardrack Greenwell feeds Feathermoon Stronghold, and he is the nearest thing to a cheerful night elf I have met on the island. He put bread in my hand before he asked my name.",
    third = "{name} met Mardrack Greenwell, who sells food and drink at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Elune-adore, friend! Sit, you must be hungry. I saved you the warmest loaf." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You've crossed the water, so you're hungry. Pay first, please." },
    { id = "g_default", text = "Elune-adore, {class}! You have crossed the water, so you are hungry, and I will hear no argument on the matter." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and thinner than when you left. The mainland feeds nobody well, I have always said so." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You looked at my fire before you looked at my food, as only a cook does. Tell me honestly what you think of the bread." },
    { id = "n_hungry", cat = "hunger", when = { timeOfDay = "dusk" },
      text = "The evening watch is changing, and that means supper. Sit down with the rest of them, friend, before the stew is gone." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Mardrack Greenwell, and I keep the Sentinels fed, which is harder than keeping them armed. A soldier will forgive a dull blade sooner than a cold supper, and I have ten thousand years of experience to say so." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Eat while you ask, and don't let that bread go cold on my account." },
        { id = "h_again2", text = "Go on, I am only watching the kettle." },
      },
      choices = {
        { text = "A well-fed soldier fights well.", next = "BACK", reply = "Exactly! You understand what keeps the Sentinels on their feet.", fx = { align = { order = 1 } } },
        { text = "Soldiers should toughen up and eat dried fruit.", next = "BACK", reply = "They do, far too often. That is why I bake.", fx = { align = { order = -1 } } },
        { text = "How many wars have you cooked through?", next = "ymar_wars" },
        { text = "A cook to a cook: what's the secret?", next = "ymar_cook", when = { profession = "Cooking" } },
        { text = "What does the island put on your table?", next = "table" },
        { text = "You're merrier than most of your kin.", next = "merry" },
        { text = "Does the garrison ever run short?", next = "short" },
        { text = "What's your favourite thing to cook?", next = "w7_fav" },
        { text = "Thank you, Mardrack.", next = "END" },
      },
    },
    w7_fav = {
      lines = {
        { id = "w7_fav_l1", text = "Moonberry tart, the way my mother made it before the Sundering, with the crust pressed by hand and the berries picked at dusk when they are sweetest. I make it once a year, on the night the Sentinels remember the fallen." },
      },
      choices = {
        { text = "Why that night?", next = "w7_fav2" },
        { text = "A tart seems a small thing for the fallen.", next = "w7_fav3" },
        { text = "Something else, Mardrack.", next = "BACK" },
      },
    },
    w7_fav2 = {
      lines = {
        { id = "w7_fav2_l1", text = "Because every soldier who ate my tart before a battle and did not come home deserves to have it baked once more. I set out a slice for each of them at the head of the table, and the young ones think it a strange custom, and the old ones weep." },
        { id = "w7_fav2_l2", when = { race = "NightElf" }, text = "You will know the night I mean, {g:brother|sister}. I bake a slice for each of the fallen and set them out at the head of the table; if you are on Feathermoon that night, come and share one with me." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", reply = "Then there will be one more at the table to remember them." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_fav3 = {
      lines = {
        { id = "w7_fav3_l1", text = "Small things are what the fallen miss most. A banner is for the living. A tart is for them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    table = {
      lines = { { id = "t_default", text = "Fish from Brannock's students, fruit from the mainland groves, and bread from grain that comes by sea. I would give a great deal for a proper garden, but the soil here is half sand and the naga have the rest." } },
      choices = {
        { text = "Brannock's students keep you supplied?", next = "students" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students = {
      lines = { { id = "s_default", text = "They do, though the early catches are small and sorry things. I cook them all the same and tell each student it was delicious, and Brannock pretends he does not know that I do it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    merry = {
      lines = { { id = "m_default", text = "So I am told, usually by someone frowning. I have seen enough wars to know that a full bowl and a kind word are worth guarding too, and I leave the solemnity to those who carry glaives." } },
      choices = { { text = "Never change. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    short = {
      lines = { { id = "sh_default", text = "Now and then, when storms keep the boat from the Forgotten Coast. Faralorn and I ration between us, and I thin the stew and thicken the conversation until the sails appear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ymar_wars = {
      lines = {
        { id = "yymar_wars_d", text = "Three, if you count the Third War, and I do. I fed the Sentinels at Mount Hyjal when the Legion came, and I have never seen hunger like it, or courage like it. The soldiers who ate my stew that week did not all come back, and I remember their bowls." },
      },
      choices = {
        { text = "Their bowls?", next = "ymar_bowls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymar_bowls = {
      narr = "Mardrack's ladle stops halfway to the pot, and for a moment he does not speak.",
      lines = {
        { id = "yymar_bowls_d", text = "Each soldier had her own, carved with her name, and when one did not come back the bowl went into a pile by the fire. By the end of the battle the pile was taller than me. I keep one of them still, though I have never told anyone whose." },
      },
      choices = {
        { text = "Why do you keep it?", next = "ymar_keep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymar_keep = {
      lines = {
        { id = "yymar_keep_d", text = "To remember that a full bowl is a small thing and a necessary one. Some of the younger Sentinels think a cook has no place in a war, and that I should hand my ladle to someone less merry, for laughter is unseemly in a garrison." },
      },
      choices = {
        { text = "Keep laughing. A garrison needs warmth.", next = "BACK", reply = "Yes, I think so too. I will keep my ladle and my laugh both.", fx = { align = { light = 1 } } },
        { text = "War is grim. Perhaps they have a point.", next = "BACK", reply = "Perhaps they do. But I have seen grim soldiers, and they did not last.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymar_cook = {
      lines = {
        { id = "yymar_cook_d", text = "A little salt and a great deal of patience, and never cook for a soldier the way you would cook for a feast. A feast is to be admired and a soldier's bowl is to be finished, and the two need different hands." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    mount_hyjal = { { id = "tp_ymount_hyjal", text = "I cooked there, in the war. I remember every bowl." } },
    brannock = { { id = "tp_ybrannock", text = "He teaches fishing, and his students bring me the catch, small as it is." } },
    background = { { id = "tp_bg", text = "I have cooked for Sentinels since long before this stronghold. They march better for it, though none of them will say so." } },
    _none = { { id = "tp_none", text = "That I cannot tell you, friend. Ask me about supper instead, for there I am never wrong." } },
  },
}

-- Marli Wishrunner: small camp in a nook of the north-western Colossal, by the road.
P:NPC {
  key = "marli_wishrunner", id = TODO_NPC("Marli Wishrunner"), name = "Marli Wishrunner", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "feathermoon" }, temper = { "cheerful", "absent" }, values = { "curious" },
  notices = { "class", "travel" },
  impression = {
    first = "Marli Wishrunner keeps a small camp in a hollow at the foot of one of the Twin Colossals, right beside the road. She talks brightly and loses her thread halfway through, and she kept glancing up at the top of the other stone.",
    third = "{name} met Marli Wishrunner, who camps by the road between the Twin Colossals in Feralas.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Oh, it's you! Ishnu-alah, friend. Come, sit; the wind is gentle today, and you are welcome." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. Mind the wind. And please mind your own business, too." },
    { id = "g_default", text = "Oh, a traveller! Ishnu-alah, {class}, and mind the wind between the stones, for it took my good cloak last week." },
    { id = "g_back", when = { metBefore = true }, text = "You came by again! I was sure I had something to tell you, and it will come back to me in a moment." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You are a long way from Camp Mojache. I keep no quarrel with travellers on this road, so long as they keep none with me." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You have the look of one who has stepped between places without walking. Then you know how easy it is to forget where you left someone." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Marli Wishrunner, and this hollow is my half of the watch. My partner Kalin keeps the other half, up on top of the far Colossal, where he can see half of Feralas and I can scarcely see him." },
      },
      again = {
        { id = "h_again", text = "Now, what were we speaking of? Ask me again." },
        { id = "h_again2", text = "Yes? I am listening, mostly, though the wind keeps trying to tell me something too." },
      },
      choices = {
        { text = "Watching over Feralas is a worthy duty.", next = "BACK", reply = "It is, though Kalin does the harder half. Thank you.", fx = { align = { order = 1 } } },
        { text = "Watching from a rock does nothing for anyone.", next = "BACK", reply = "We see what you cannot. Mind the wind.", fx = { align = { order = -1 } } },
        { text = "How old are you, Marli?", next = "ymarl_old" },
        { text = "My people remember the old days too.", next = "ymarl_elf", when = { race = "NightElf" } },
        { text = "What are the two of you watching?", next = "watch" },
        { text = "How does Kalin get up there?", next = "kalin" },
        { text = "Tell me about the Colossals themselves.", next = "stones" },
        { text = "What do you do when the watch is quiet?", next = "w7_quiet" },
        { text = "Keep hold of your cloak. Farewell.", next = "END" },
      },
    },
    w7_quiet = {
      lines = {
        { id = "w7_quiet_l1", text = "I write letters to Kalin and tie them to stones and throw them up the Colossal. Most of them come back down, and I find them again in a week and cannot remember what I wanted to tell him." },
      },
      choices = {
        { text = "Do any reach him?", next = "w7_quiet2" },
        { text = "Why not just climb up and tell him?", next = "w7_quiet3" },
        { text = "Something else, Marli.", next = "BACK" },
      },
    },
    w7_quiet2 = {
      lines = {
        { id = "w7_quiet2_l1", text = "One did, once, and he answered by dropping an acorn on my head. I still have the acorn, though I have forgotten what my letter said; I like to think it was something kind." },
        { id = "w7_quiet2_l2", when = { race = "NightElf" }, text = "One did, and he answered with an acorn. You will understand, {g:brother|sister}, how the long years blur; I have forgotten the letter, but the acorn I keep in my pouch, and it reminds me of something I cannot name." },
      },
      choices = {
        { text = "I'm sure it was kind.", next = "BACK", reply = "It must have been. He kept the stone, after all." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_quiet3 = {
      lines = {
        { id = "w7_quiet3_l1", text = "Because I would have to remember the way up, and the way is very old and very winding. Stones are quicker, even when they do not arrive." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "The road, chiefly, since everything that crosses Feralas must pass between these two stones. Kalin counts the ogres and the Horde's riders from above, and I count whoever is friendly enough to stop." } },
      choices = {
        { text = "And what have you counted lately?", next = "counted" },
        { text = "Something else.", next = "BACK" },
      },
    },
    counted = {
      lines = { { id = "c_default", text = "More Gordunni on the highland paths than last season, and yetis coming down from the Feral Scar when the nights are cold. I wrote it all down for Feathermoon, and I believe I still have the letter somewhere." } },
      choices = { { text = "You should send that. Something else.", next = "BACK", reply = "I should, should I not? I will see to it today, or certainly tomorrow." } },
    },
    kalin = {
      lines = { { id = "k_default", text = "There is an old way, which I know and he does not, and so he goes up and comes down when I remember him. He is very patient about it, though he was a little short with me the evening I forgot." } },
      choices = { { text = "Try not to forget him. Something else.", next = "BACK" } },
    },
    stones = {
      lines = { { id = "s_default", text = "They were standing here before the Sundering, and nobody now living can say who raised them or whether anyone did. On a clear dawn the tops catch the light before the forest wakes, and I never tire of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ymarl_old = {
      lines = {
        { id = "yymarl_old_d", text = "Old enough to remember when these stones had a name, though I have forgotten what it was. I was a girl in Eldre'Thalas before the Sundering, and I remember the white towers and the scholars, but not much else, I am afraid." },
      },
      choices = {
        { text = "You lived in Eldre'Thalas?", next = "ymarl_lived" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymarl_lived = {
      narr = "Marli's eyes go far away, and she smiles at something you cannot see.",
      lines = {
        { id = "yymarl_lived_d", text = "My father kept a library there, a small one, of books about the stars. I remember the smell of the pages and the sound of his voice reading to me, and I remember that he did not come with us when we left. I have never known why." },
      },
      choices = {
        { text = "Do you want to know why?", next = "ymarl_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymarl_why = {
      lines = {
        { id = "yymarl_why_d", text = "Sometimes I think I do, and sometimes I am glad I have forgotten. Kalin says the ogres hold the city now, and the old libraries are in ruins, but perhaps there is something left there with my father's name on it." },
      },
      choices = {
        { text = "Some things are better left forgotten.", next = "BACK", reply = "Yes, perhaps. I will keep my memories as they are, faded and kind.", fx = { align = { light = 1 } } },
        { text = "Seek the truth. Your father deserves remembering.", next = "BACK", reply = "You are brave to say so. If I find a way, I will look for his name.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymarl_elf = {
      lines = {
        { id = "yymarl_elf_d", text = "Then you will understand, I think, how the years blur together after a while. Ten thousand years is a long time to remember things, and I am afraid I have been letting some of them go." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    eldre_thalas = { { id = "tp_yeldre_thalas", text = "The city I was born in. The ogres call it Dire Maul now." } },
    kalin_windflight = { { id = "tp_ykalin_windflight", text = "My partner on the watch. I always remember him in the end." } },
    background = { { id = "tp_bg", text = "Kalin and I have kept this watch a good while. He does the seeing and I do the remembering, which he says is the wrong way round." } },
    _none = { { id = "tp_none", text = "I am sure I knew that once. Ask me another day, when it has come back to me." } },
  },
}

-- Kalin Windflight: atop the south-eastern Colossal.
P:NPC {
  key = "kalin_windflight", id = TODO_NPC("Kalin Windflight"), name = "Kalin Windflight", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "feathermoon" }, temper = { "dry", "patient" }, values = { "watchful" },
  notices = { "travel", "class" },
  impression = {
    first = "Kalin Windflight keeps watch from the very top of one of the Twin Colossals, with all of Feralas laid out under him. He was plainly surprised to have company, and he asked at once whether Marli had sent me or simply forgotten me.",
    third = "{name} met Kalin Windflight, who keeps watch from the top of one of the Twin Colossals.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Well met again, friend. Stand by me; the view is clear today, and the company is good." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Stay back from the edge. Then say what you need, and go back down." },
    { id = "g_default", text = "A visitor, at this height? Well met, {class}, and stay back from the edge, because the wind does not give warnings." },
    { id = "g_back", when = { metBefore = true }, text = "You have climbed the sky twice now. Either you like the view, or Marli has mislaid you again." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Then you, at least, have a way down that does not depend on anyone's memory. I envy you more than I can say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kalin Windflight. From this stone I can see the highlands, the road and the sea, and I send word of what moves on them to Feathermoon. My partner Marli keeps the camp below, and decides when I come down." },
      },
      again = {
        { id = "h_again", text = "What else? Ask; I have time, wind and a very long view, and only the first is running short." },
        { id = "h_again2", text = "Speak up, the wind takes half of every word." },
      },
      choices = {
        { text = "Keeping watch from on high saves lives.", next = "BACK", reply = "It does. Feathermoon knows what comes long before it arrives.", fx = { align = { order = 1 } } },
        { text = "You could see more by walking the forest floor.", next = "BACK", reply = "And you could die more quickly, too. Stay back from the edge.", fx = { align = { order = -1 } } },
        { text = "How long since you last came down?", next = "ykal_down" },
        { text = "A druid could fly you down, Kalin.", next = "ykal_druid", when = { class = "DRUID" } },
        { text = "What can you see from here?", next = "see" },
        { text = "Marli decides when you come down?", next = "marli" },
        { text = "It's a lonely post.", next = "lonely" },
        { text = "What do you eat up here?", next = "w7_food" },
        { text = "I'll watch my step. Farewell.", next = "END" },
      },
    },
    w7_food = {
      lines = {
        { id = "w7_food_l1", text = "Whatever Marli remembers to send up the rope, which is usually bread, sometimes fruit, and once, for reasons she cannot explain, a single boot. I also keep a few hippogryph eggs that the birds abandon, but I try not to think too hard about that." },
      },
      choices = {
        { text = "A boot?", next = "w7_food2" },
        { text = "You should keep more stores.", next = "w7_food3" },
        { text = "Something else, Kalin.", next = "BACK" },
      },
    },
    w7_food2 = {
      lines = {
        { id = "w7_food2_l1", text = "A left boot, very good leather, not mine and not hers. We have argued for a season about where it came from, and I have decided it is a sign that one day she will send the right one." },
        { id = "w7_food2_l2", when = { class = "DRUID" }, text = "A boot. You might fly up with something more useful next time, if you're passing in bird form; I would trade you the boot for a loaf, and I would think it a bargain." },
      },
      choices = {
        { text = "Good luck with the second boot.", next = "BACK", reply = "Thank you. I live in hope, and in one boot." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_food3 = {
      lines = {
        { id = "w7_food3_l1", text = "I tried, and the hippogryphs ate them. Up here, you learn to depend on the people below you, whether you like it or not." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    see = {
      lines = { { id = "s_default", text = "Smoke from the Gordunni fires to the east, the hippogryphs wheeling over the Frayfeather Highlands, and on a clear day the walls of Eldre'Thalas above the trees. I like that last sight least, for nothing good has come out of those walls in my lifetime." } },
      choices = {
        { text = "What troubles you about Eldre'Thalas?", next = "eldre" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eldre = {
      lines = { { id = "e_default", text = "It was a city of the Highborne, and now ogres hold court in it and call it Dire Maul. I do not know which of those two facts I trust less, and from up here I am glad to keep my distance from both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    marli = {
      lines = { { id = "m_default", text = "She knows the old way up and down these stones, and I do not. She is the kindest soul in Feralas and has the worst memory in it, and I once spent a full night up here thinking about both of those things." } },
      choices = { { text = "I'll remind her on my way past. Something else.", next = "BACK", reply = "I would be grateful. Say it twice, and watch her face to be sure it has landed.", fx = { affinity = 1 } } },
    },
    lonely = {
      lines = { { id = "l_default", text = "It is quiet, which is not the same thing. I have the wind, the hippogryphs and a view no king could buy, and I have learned to bring a second cloak and a third meal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ykal_down = {
      lines = {
        { id = "yykal_down_d", text = "Nineteen days, by the notches on my staff, though Marli swears it was only twelve and she has forgotten seven of them. I do not mind as much as you would think, for the hippogryphs bring my bread and the wind brings everything else." },
      },
      choices = {
        { text = "Doesn't it frighten you, being forgotten?", next = "ykal_forgot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykal_forgot = {
      narr = "Kalin looks down over the edge, at the small figure of Marli in her hollow far below.",
      lines = {
        { id = "yykal_forgot_d", text = "Not by Marli, no, for she always remembers in the end. What frightens me is the day she does not, because she will have gone somewhere I cannot follow, and I will still be up here counting ogres." },
      },
      choices = {
        { text = "Have you told her this?", next = "ykal_told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykal_told = {
      lines = {
        { id = "yykal_told_d", text = "I have tried, but she laughs and says she will outlive the stones themselves. She may be right, for she is older than me by a long way, but I have seen her forget her own name some mornings, and I do not think she knows." },
      },
      choices = {
        { text = "Tell her plainly. She deserves to know.", next = "BACK", reply = "You are right. When she next brings me down, I will tell her.", fx = { align = { honor = 1 } } },
        { text = "Let her be. Her peace is worth more.", next = "BACK", reply = "Perhaps that is the kinder way. I will keep watching, and keep quiet.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykal_druid = {
      lines = {
        { id = "yykal_druid_d", text = "I could, and I have been offered before, but I would only have to come back up again in the morning. The Sentinels need someone on this stone, and I have grown used to the climb, or rather, to waiting for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    twin_colossals = { { id = "tp_ytwin_colossals", text = "The great stones where Marli and I keep watch. Nobody knows who raised them." } },
    gordunni = { { id = "tp_ygordunni", text = "The ogres of the highlands. I count their fires every night." } },
    background = { { id = "tp_bg", text = "I have kept watches for the Sentinels in many places. This is the highest of them, and the hardest to leave." } },
    _none = { { id = "tp_none", text = "I see a great deal from here, but not that. Ask on the ground, where the gossip lives." } },
  },
}
