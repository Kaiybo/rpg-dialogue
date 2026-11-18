-- Thunder Bluff, the middle rise: the three armor merchants, the leather and tailoring lodge
-- (Tepa, Vhan, Tarn, Mak, Mahu), Kray at Bena's Alchemy, the Dawnstrider enchanters, Nan's fruit
-- and Tand's baskets. Voices: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Fela: heavy armor merchant on the middle rise.
---------------------------------------------------------------------------
P:NPC {
  key = "fela", id = TODO_NPC("Fela"), name = "Fela", gender = "female", title = "Heavy Armor Merchant",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "blunt", "steady" }, values = { "strength", "practical" },
  notices = { "class" },
  impression = {
    first = "Fela sells the heaviest armor in Thunder Bluff and lifts it off the racks one-handed while she talks. She sizes up every customer's shoulders before she looks at their face.",
    third = "{name} met Fela, the heavy armor merchant on Thunder Bluff's middle rise.",
  },
  greetings = {
    { id = "g_hi", text = "Well met, {class}. Turn around and let me see your back, because the armor has to sit on something." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back in one piece, so the armor did its work." },
  },
  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "Good shoulders, {class}. You could carry my best mail and still have the breath to swing something." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Fela. Grod has the leather and Tagain has the cloth, and I have what you wear when you mean to stand in front of the other two." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Ask, and I will answer while I oil this." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Did tauren always wear heavy armor?", next = "always" },
        { text = "It looks too heavy to fight in.", next = "heavy" },
        { text = "Stand strong, Fela.", next = "END" },
      },
    },
    always = {
      lines = { { id = "a_default", text = "No, and my grandmother would laugh to see it. We fought the centaur in hide and bone, because you cannot outrun a centaur and you surely cannot do it in iron, so we learned to hit first." } },
      choices = {
        { text = "What changed?", next = "changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = { { id = "c_default", text = "We stopped running, friend. Once Thrall's orcs helped us hold Mulgore, we had ground worth standing on, and a warrior who stands needs more between him and the spear than a warrior who moves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    heavy = {
      lines = {
        { id = "he_default", text = "It is heavy on the rack and lighter on the body, once the straps share it out. Wear it a week on the plains and you will forget it, and wear it one day in the Barrens and you will be glad of every ring." },
        { id = "he_small", when = { race = { "Troll", "Scourge" } }, text = "For you, perhaps, and I say it without unkindness. I keep a few lighter pieces cut for narrow frames, since your people keep coming up the lifts and asking." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a shield for my tribe before I sold them, and I know what I am selling." } },
    _none = { { id = "tp_none", text = "I could not tell you, {class}. I know what stops a spear, and little else worth hearing." } },
  },
}

---------------------------------------------------------------------------
-- Grod: leather armor merchant on the middle rise.
---------------------------------------------------------------------------
P:NPC {
  key = "grod_tb", id = TODO_NPC("Grod"), name = "Grod", gender = "male", title = "Leather Armor Merchant",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "quiet", "patient" }, values = { "craft", "devout" },
  notices = { "class" },
  impression = {
    first = "Grod sells leather armor on the middle rise, and he can name the beast and the valley that every piece on his racks came from. He is a soft-spoken tauren who runs his hand along the grain while he thinks.",
    third = "{name} met Grod, the leather armor merchant on Thunder Bluff's middle rise.",
  },
  greetings = {
    { id = "g_hi", text = "Be welcome, {class}. Everything here walked the plains once, so I ask that you handle it kindly." },
    { id = "g_back", when = { metBefore = true }, text = "You return, friend. I hope the leather has grown to your shape by now." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid knows the hide from the inside, I am told. I would dearly like to hear what you think of my stitching, {class}." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You will want it soft and silent. I have pieces oiled so well they will not creak if you fall down the lift shaft in them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Grod, and I sell leather for wearing. Una and her students make most of it a few steps from here, and I only see that each piece goes to somebody who will be worthy of the animal." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Ask, friend, for there is no hurry here." },
      },
      choices = {
        { text = "Show me your leather.", next = "BUSINESS" },
        { text = "Worthy of the animal?", next = "worthy" },
        { text = "You know where each piece came from?", next = "came" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    worthy = {
      lines = { { id = "w_default", text = "A beast that is hunted with respect gives its meat to the pot, its bones to the tools and its hide to the hunter's back. If the hide then rots in a pack because someone bought it on a whim, the gift was wasted, and I have helped to waste it." } },
      choices = {
        { text = "Do you refuse customers, then?", next = "refuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuse = {
      lines = { { id = "r_default", text = "I have never yet refused one, because Fela tells me a merchant who will not sell is only a tauren standing beside a rack. But I ask each of them what it is for, and some go away to think about it, which is nearly as good." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    came = {
      lines = { { id = "c_default", text = "This vest was a prairie stalker from below Red Cloud Mesa, and those bracers were a kodo that died old near Stonebull Lake. The hunters tell Una, and Una tells me, and I tell whoever buys it, so that the story goes on walking." } },
      choices = { { text = "I'll remember the story. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I tanned hides for my camp when I was young, and my hands grew too slow for it, so now I sell what faster hands make." } },
    _none = { { id = "tp_none", text = "That is outside what I know, friend. The plains have not told me of it." } },
  },
}

---------------------------------------------------------------------------
-- Tagain: cloth armor merchant on the middle rise.
---------------------------------------------------------------------------
P:NPC {
  key = "tagain", id = TODO_NPC("Tagain"), name = "Tagain", gender = "female", title = "Cloth Armor Merchant",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm", "talkative" }, values = { "craft", "community" },
  notices = { "class", "race" },
  impression = {
    first = "Tagain sells cloth armor on the middle rise beside Fela and Grod, and she is forever straightening a sleeve or a sash on somebody who did not ask. She talks as she works and seems to know who on the bluff is courting whom.",
    third = "{name} met Tagain, the cloth armor merchant on Thunder Bluff's middle rise.",
  },
  greetings = {
    { id = "g_hi", text = "Come closer, {class}, and let me see what you are wearing. Oh dear, well, we can do better than that." },
    { id = "g_back", when = { metBefore = true }, text = "There you are, friend! Turn around and let me see how it hangs on you now." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "MAGE", "WARLOCK" } },
      text = "Someone who lives in a robe, good. Then you will know a strong seam when you see one, and I have nothing but strong seams." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "I have learned to cut for your people, friend. You like the sleeves long and the colours sad, and I do my best with what the dyes allow." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tagain. Fela dresses those who stand in front and Grod those who creep around the side, and I dress the ones who stand at the back and do the thinking." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? I have all day and a great deal of thread." },
        { id = "h_again2", text = "Yes, friend, go on." },
      },
      choices = {
        { text = "Show me your cloth.", next = "BUSINESS" },
        { text = "Hewa sells cloth on the lower rise too.", next = "hewa" },
        { text = "What do shaman wear for ceremony?", next = "ceremony" },
        { text = "Thank you, Tagain.", next = "END" },
      },
    },
    hewa = {
      lines = { { id = "hw_default", text = "He does, and he gets every traveller first because they land on his doorstep. But the ones who climb up to me are the ones who mean to stay a while, and they buy better." } },
      choices = {
        { text = "Is there bad blood between you?", next = "blood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blood = {
      lines = { { id = "b_default", text = "With Hewa? No, the poor soul could not hold a grudge if you tied it to his horns. We both buy from Tepa's tailors, and when one of us runs short the other sends a bundle across, and that is all the rivalry there is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ceremony = {
      lines = {
        { id = "c_default", text = "Woven wraps in the colours of their tribe, with feathers for those who speak to the wind and beads for those who speak to the earth. I make a few each season, and I am always told afterward which spirit liked it." },
        { id = "c_shaman", when = { class = "SHAMAN" }, text = "You should know that better than I, {class}! Feathers for the wind and beads for the earth, and when you are ready for a proper wrap, come to me before you go to anyone else." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have sewn since I could hold a bone needle, and talked for longer than that." } },
    _none = { { id = "tp_none", text = "Now that I have not heard, {class}, and I hear most things. Give me a few days." } },
  },
}

---------------------------------------------------------------------------
-- Tepa: tailoring trainer at Thunder Bluff Armorers.
---------------------------------------------------------------------------
P:NPC {
  key = "tepa", id = TODO_NPC("Tepa"), name = "Tepa", gender = "female", title = "Tailoring Trainer",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "patient", "exacting" }, values = { "craft", "devout" },
  notices = { "profession" },
  impression = {
    first = "Tepa teaches tailoring at Thunder Bluff Armorers, across the lodge from Una's hides. Her big hands make stitches so small that her students have to squint to count them.",
    third = "{name} met Tepa, the tailoring trainer of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Come and sit, {class}. A needle cannot be hurried, so you may as well be comfortable." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back. Show me your last seam before you tell me how well it went." },
  },
  notice = {
    { id = "n_tailor", cat = "profession", when = { profession = "Tailoring" },
      text = "I see thread ends on your sleeve, friend, so you have been practising. Good, then we need not begin with how to hold the needle." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tepa, and I teach the working of cloth. Una, beside me, teaches leather, and we have argued pleasantly for years over which of us dresses the bluff." },
        { id = "h_tailor", when = { profession = "Tailoring" }, text = "I am Tepa. You already know a little of the needle, so sit down and let us find out what you know badly." },
      },
      again = {
        { id = "h_again", text = "What else would you ask, {class}?" },
        { id = "h_again2", text = "Speak, friend, while I thread this." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Who is winning the argument with Una?", next = "una" },
        { text = "Where did the tauren learn to weave?", next = "weave" },
        { text = "May your thread hold, Tepa.", next = "END" },
      },
    },
    una = {
      lines = { { id = "u_default", text = "Una says a hide is the Earth Mother's own gift and cloth is only grass that somebody fussed over. I tell her the grass is also the Earth Mother's, and that nobody had to die for a linen shirt, and then we share our tea." } },
      choices = {
        { text = "Your apprentice must hear a lot of this.", next = "vhan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vhan = {
      lines = { { id = "v_default", text = "Vhan hears all of it and keeps his head down over his work, which is wise of him. He has a good eye and a heavy hand, and I have him unpicking more than he sews this season, as I did at his age." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    weave = {
      lines = { { id = "w_default", text = "We always wove, {class}: blankets for the tents, and the wraps we lay over our dead. What is new is the cutting and fitting, which we took from watching orcs and trolls, because a wandering people has no use for a garment that only fits one person." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I wove blankets on the long walk, and I learned the fitted seam here on the bluff, late, as everyone did." } },
    _none = { { id = "tp_none", text = "I have no thread that reaches so far, friend. Ask one of the elders." } },
  },
}

---------------------------------------------------------------------------
-- Vhan: apprentice tailor under Tepa. Forever: Camping 101: Tailoring.
---------------------------------------------------------------------------
P:NPC {
  key = "vhan", id = TODO_NPC("Vhan"), name = "Vhan", gender = "male", title = "Apprentice Tailor",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "shy", "earnest" }, values = { "craft", "humble" },
  notices = { "profession", "race" },
  impression = {
    first = "Vhan is Tepa's apprentice, a large young tauren bent very low over a very small needle. He speaks quietly, apologises for his stitching before anyone has looked at it, and brightens when asked about tents.",
    third = "{name} met Vhan, an apprentice tailor on Thunder Bluff's middle rise.",
  },
  greetings = {
    { id = "g_hi", text = "Oh, hello, {class}. Forgive me, I was counting stitches, and now I shall have to begin the row again." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, friend. I have finished a whole sleeve since then, and Tepa only made me unpick half of it." },
  },
  notice = {
    { id = "n_tailor", cat = "profession", when = { profession = "Tailoring" },
      text = "You sew as well? Then you know how it is, when the thread knots just as you reach the end of the seam." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "I have never fitted anything for a troll yet. Tepa says your people are all elbows, and I would like very much to try." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Vhan, and I am learning the needle from Tepa. I am not very good yet, but I am better than I was at midsummer, and she says that is the only measure that matters." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Tailoring") },
          text = "You are here for the camping lesson, I think? Tepa said I might teach that one myself, because canvas is the one thing I have never had to unpick." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Tailoring") },
          text = "Has your camp kept the rain off, {class}? I have been wondering about it every time the clouds come over the rise." },
      },
      again = {
        { id = "h_again", text = "Was there something else, {class}? I do not mind stopping." },
        { id = "h_again2", text = "Yes? I am listening, I am only holding my place with my thumb." },
      },
      choices = {
        { text = "What does a tailor bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Tailoring") } },
        { text = "Why tailoring, for one your size?", next = "why" },
        { text = "Is Tepa a hard teacher?", next = "tepa" },
        { text = "Your stitching looks fine to me.", next = "fine" },
        { text = "Keep at it, Vhan.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "The roof over it, friend, which is the most important part, though the cooks will argue. Our people lived under hide and cloth for all the generations we wandered, and a tent that is stitched properly will stand through a Mulgore storm." } },
      choices = {
        { text = "Then teach me what you know.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Everyone asks that. My brothers are braves, and I was meant to be one, but I was the calf who mended the tent while the others were out wrestling." } },
      choices = {
        { text = "What did your family say?", next = "family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "My father said nothing for a season. Then the rains came early, and ours was the only tent in the camp that did not leak, and he walked me up to Tepa himself." } },
      choices = {
        { text = "So the tent spoke for you.", next = "spoke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spoke = {
      lines = { { id = "s_default", text = "I had not thought of it that way, but I suppose it did. I am not good with words, {class}, so it is as well that a seam can say a thing for me." } },
      choices = { { text = "It says it clearly. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tepa = {
      lines = { { id = "t_default", text = "She is patient, which is harder to bear than shouting would be. She looks at a seam for a long time, and then she hands me the little knife for unpicking, and she never once says why, because I am supposed to see it." } },
      choices = {
        { text = "And do you see it?", next = "see" },
        { text = "Something else.", next = "BACK" },
      },
    },
    see = {
      lines = { { id = "se_default", text = "More often than I did. Mostly I pull too tight, and the cloth puckers like the ground in a dry season, and Tarn across the lodge laughs because leather forgives that and linen does not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fine = {
      lines = {
        { id = "fi_default", text = "That is kind of you, but you are looking at the outside. Tepa turns everything over, and she says the inside of a garment is where the tailor tells the truth." },
        { id = "fi_tailor", when = { profession = "Tailoring" }, text = "You are a tailor, so you are either being kind or you have not turned it over yet. The inside is where it goes wrong, and Tepa always looks there first." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Tepa's apprentice, and before that I was the one who mended my family's tent." } },
    _none = { { id = "tp_none", text = "I am sorry, {class}, I do not know. Tepa might, if you ask her between seams." } },
  },
}

---------------------------------------------------------------------------
-- Tarn: apprentice leatherworker under Una.
---------------------------------------------------------------------------
P:NPC {
  key = "tarn_tb", id = TODO_NPC("Tarn"), name = "Tarn", gender = "male", title = "Apprentice Leatherworker",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful", "cocky" }, values = { "craft", "community" },
  notices = { "profession" },
  impression = {
    first = "Tarn is Una's apprentice at Thunder Bluff Armorers, a good-humoured young tauren with tanning stains to the elbows. He talks while he scrapes and is a little too pleased with how quickly he works.",
    third = "{name} met Tarn, an apprentice leatherworker on Thunder Bluff's middle rise.",
  },
  greetings = {
    { id = "g_hi", text = "Well met, {class}! Do not shake my hand, for it has been in the tanning tub since dawn." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend! I still smell of the tub, so nothing has changed." },
  },
  notice = {
    { id = "n_skin", cat = "profession", when = { profession = "Skinning" },
      text = "You carry a skinning knife, I see. Bring your hides to Una, and with luck she will let me be the one to ruin them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tarn, and I am learning leather from Una. I scrape, soak, stretch and scrape again, and when she is pleased with me she lets me cut something." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? The hide will not scrape itself, but it can wait." },
        { id = "h_again2", text = "Go on, I like to talk while I work." },
      },
      choices = {
        { text = "What has Una let you make?", next = "make" },
        { text = "You and Vhan share a lodge.", next = "vhan" },
        { text = "That tub has a powerful smell.", next = "smell" },
        { text = "Good scraping, Tarn.", next = "END" },
      },
    },
    make = {
      lines = { { id = "m_default", text = "Straps, mostly, and one pair of boots that Una called a good first attempt at a boot. She wears them herself when it rains, though, so I do not think she meant it unkindly." } },
      choices = {
        { text = "She wears them? That's praise.", next = "praise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise = {
      lines = { { id = "p_default", text = "I thought so too, and I said as much, and she gave me three more hides to scrape for it. Una says every hide is a gift from the beast, and a gift ought not to be boasted over." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    vhan = {
      lines = { { id = "v_default", text = "We do, and I tease him more than I should, because he takes a whole morning over one seam. But when the wind tore my sleeping roll he mended it without my asking, and I have not found the place since." } },
      choices = { { text = "A good friend to have. Something else.", next = "BACK" } },
    },
    smell = {
      lines = {
        { id = "s_default", text = "You stop noticing it after the first moon, or so I tell everyone. Mak sells us the salts and oils for it, and he stands a little further off every season." },
        { id = "s_scourge", when = { race = "Scourge" }, text = "And yet your people from the pools are the only ones who never wrinkle their noses at it. I do not know whether to feel flattered or sorry for you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Una's apprentice, and I am going to be the best leatherworker on the bluff, after her." } },
    _none = { { id = "tp_none", text = "I could not say, {class}. Ask Una, though mind you ask her politely." } },
  },
}

---------------------------------------------------------------------------
-- Mak: leatherworking supplies at Thunder Bluff Armorers.
---------------------------------------------------------------------------
P:NPC {
  key = "mak_tb", id = TODO_NPC("Mak"), name = "Mak", gender = "male", title = "Leatherworking Supplies",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "dry", "steady" }, values = { "practical", "craft" },
  notices = { "profession" },
  impression = {
    first = "Mak sells salts, dyes, thread and tanning oils at Thunder Bluff Armorers, from a spot chosen for being upwind of the tub. He has a dry way of talking and misses nothing that goes on in the lodge.",
    third = "{name} met Mak, who sells leatherworking supplies in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Well met, {class}. Stand on this side of me, where the wind is kinder." },
    { id = "g_back", when = { metBefore = true }, text = "You are back for more salt, I would guess. A leatherworker always is." },
  },
  notice = {
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" },
      text = "You have cured hides before, by the look of your hands. Then you know cheap salt is the dearest mistake in the craft." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Mak. Una teaches leather, her students use up everything she owns, and I sell it back to them, which is as steady a living as a tauren could ask for." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Ask, friend, for I am not going anywhere downwind." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What goes into curing a hide?", next = "cure" },
        { text = "Mahu sells leather supplies as well.", next = "mahu" },
        { text = "Fair winds, Mak.", next = "END" },
      },
    },
    cure = {
      lines = { { id = "c_default", text = "Salt to stop the rot, bark water to tan it, and oil worked in by hand until your shoulders ache. The old way used the beast's own brains for the softening, and Una still teaches it, though the young ones go green." } },
      choices = {
        { text = "Does the old way work better?", next = "old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old = {
      lines = { { id = "o_default", text = "It makes the softest leather you will ever wear, and it wastes nothing, which is why our grandmothers used it. I sell the oils to those with weaker stomachs, and I do not think less of them, or not much." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mahu = {
      lines = { { id = "m_default", text = "He does, and thread and bolts for the tailors besides. Mahu stocks a little for everyone and I stock a great deal for one craft, so the students go to him first and come to me when they have learned what they are doing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have sold salt and oil to Una's students since she first set up her poles here." } },
    _none = { { id = "tp_none", text = "Not a thing I know, {class}. I know what a hide needs, and it has never needed that." } },
  },
}

---------------------------------------------------------------------------
-- Mahu: leatherworking & tailoring supplies on the middle rise.
---------------------------------------------------------------------------
P:NPC {
  key = "mahu", id = TODO_NPC("Mahu"), name = "Mahu", gender = "male", title = "Leatherworking & Tailoring Supplies",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "easy", "helpful" }, values = { "community", "trade" },
  notices = { "profession" },
  impression = {
    first = "Mahu sells supplies for both the leatherworkers and the tailors on the middle rise, and so he hears each craft's complaints about the other. He agrees pleasantly with everybody.",
    third = "{name} met Mahu, who sells leatherworking and tailoring supplies in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, {class}. Needle or awl, thread or thong, I have a little of each." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again, friend. What did you run out of this time?" },
  },
  notice = {
    { id = "n_craft", cat = "profession", when = { profession = { "Tailoring", "Leatherworking" } },
      text = "A crafter, good. Tell me which lodge you favour, and I promise not to repeat it to the other one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Mahu. I stand between Una's leatherworkers and Tepa's tailors, and I sell to both, so I have learned to nod a great deal." },
      },
      again = {
        { id = "h_again", text = "What else can I find for you, friend?" },
        { id = "h_again2", text = "Ask, {class}, and I will agree with you if I can." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What do the two lodges quarrel about?", next = "quarrel" },
        { text = "Which craft should a beginner choose?", next = "choose" },
        { text = "Thank you, Mahu.", next = "END" },
      },
    },
    quarrel = {
      lines = { { id = "q_default", text = "Nothing that matters, which is why it never ends. The tailors say leather smells, the leatherworkers say cloth tears, and both are right, so I sell scented oil to one and stronger thread to the other." } },
      choices = {
        { text = "And whose side are you on?", next = "side" },
        { text = "Something else.", next = "BACK" },
      },
    },
    side = {
      lines = { { id = "s_default", text = "I wear a leather kilt and a linen shirt, friend, and I mean to go on wearing both. A herd needs its bulls and its cows, and the bluff needs its hides and its weaving." } },
      choices = { { text = "A careful answer. Something else.", next = "BACK" } },
    },
    choose = {
      lines = {
        { id = "c_default", text = "If you hunt, take up leather, because you will have the hides anyway and it is a shame to waste them. If you would rather not skin what you kill, take up the needle, for linen can be bought or found on nearly anyone who attacks you." },
        { id = "c_hunter", when = { class = "HUNTER" }, text = "For a hunter it is no question at all, {class}. You will be knee deep in hides before you leave Mulgore, so go and see Una." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I traded between camps that did not always like each other, so this rise feels like home." } },
    _none = { { id = "tp_none", text = "I could not say, friend, though I am sure you are right about it." } },
  },
}

---------------------------------------------------------------------------
-- Kray: apprentice alchemist at Bena's Alchemy. Forever: Camping 101: Alchemy.
---------------------------------------------------------------------------
P:NPC {
  key = "kray", id = TODO_NPC("Kray"), name = "Kray", gender = "male", title = "Apprentice Alchemist",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "curious", "careful" }, values = { "knowledge", "devout" },
  notices = { "profession", "race" },
  impression = {
    first = "Kray is apprenticed to Bena Winterhoof at Bena's Alchemy, and he measures everything twice because the vials are small and his fingers are not. He is full of questions about what other peoples put in their potions.",
    third = "{name} met Kray, an apprentice alchemist at Bena's Alchemy in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "One moment, {class}, I am pouring. There, and nothing spilled, which Bena will want to hear about." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, friend. I have broken only two vials since we spoke, which for me is a fine week." },
  },
  notice = {
    { id = "n_alch", cat = "profession", when = { profession = "Alchemy" },
      text = "Your fingers are stained the same colours as mine, so you must be an alchemist. Tell me, how do you hold a vial that small without crushing it?" },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Your apothecaries in the pools know things about brewing that Bena will not let me ask. I ask anyway, when she is out gathering." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kray, and I am learning alchemy from Bena Winterhoof. She says an alchemist is a herbalist who has learned patience, and I am still working at the second part." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Alchemy") },
          text = "You have come about the camping lesson, have you? Bena left that one to me, so sit down and I will show you what an alchemist is good for when the nearest healer is three days' walk away." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Alchemy") },
          text = "How did the brewing go at your camp, {class}? If anything turned an odd colour, I would be grateful to know which colour." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? This must steep a while, so I have time." },
        { id = "h_again2", text = "Ask, friend, and mind your elbow near the shelf." },
      },
      choices = {
        { text = "What does an alchemist bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Alchemy") } },
        { text = "What is Bena teaching you now?", next = "bena" },
        { text = "You ask the Forsaken about their brewing?", next = "forsaken" },
        { text = "Tauren hands look large for this work.", next = "hands" },
        { text = "Pour steadily, Kray.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "A pot, a fire and a few plants that grow within sight of it, and with those you can ease a fever or close a wound before it sours. The Winterhoof brewed that way on the long walk, with no lodge and no shelves, and they lost fewer calves than any other tribe." } },
      choices = {
        { text = "Then show me how it's done.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bena = {
      lines = { { id = "b_default", text = "How to wait, mostly. A healing draught wants to simmer until the peacebloom gives up its colour, and if you stir it early out of worry, you have made a bitter tea and nothing more." } },
      choices = {
        { text = "How do you know when it's ready?", next = "ready" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ready = {
      lines = { { id = "r_default", text = "Bena smells it, and she is never wrong. I cannot do that yet, so I count my own breaths, and at three hundred I look, and one time in two it is right." } },
      choices = {
        { text = "And the other time?", next = "other" },
        { text = "Something else.", next = "BACK" },
      },
    },
    other = {
      lines = { { id = "o_default", text = "The other time I pour it on the herb beds outside, where it does the silverleaf no harm at all. Komin Winterhoof next door has begun asking why her plants on that side grow so tall." } },
      choices = { { text = "I won't tell her. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    forsaken = {
      lines = {
        { id = "f_default", text = "Apothecary Zamah's people, yes, in the Pools of Vision. They brew with things I would not touch, but they measure more finely than anyone on the bluff, and I do not see why a good habit should be refused because of who keeps it." },
        { id = "f_scourge", when = { race = "Scourge" }, text = "Your Apothecary Zamah's people, yes. I will not ask you what goes into their vats, but I would give a great deal to know how they keep their measures so exact." },
      },
      choices = {
        { text = "What does Bena think of that?", next = "thinks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thinks = {
      lines = { { id = "t_default", text = "She says that alchemy is a gift for mending, and that the Forsaken have turned it to other uses, and that I am to learn their care and leave the rest in the cave. I think that is fair, and I try to keep to it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hands = {
      lines = { { id = "ha_default", text = "They are, and the vials come from goblins, who have hands like a prairie dog's. I hold the vial in a cleft stick and pour with the other hand, which Bena says is cheating and I say is alchemy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I gathered herbs for Bena as a calf, and one day I asked what she did with them, and I have been here since." } },
    _none = { { id = "tp_none", text = "I do not know, {class}, and I have learned not to guess near an open flame. Ask Bena." } },
  },
}

---------------------------------------------------------------------------
-- Teg Dawnstrider: enchanting trainer on the middle rise; Mot's father.
---------------------------------------------------------------------------
P:NPC {
  key = "teg_dawnstrider", id = TODO_NPC("Teg Dawnstrider"), name = "Teg Dawnstrider", gender = "male", title = "Enchanting Trainer",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "thoughtful", "calm" }, values = { "knowledge", "devout" },
  notices = { "profession" },
  impression = {
    first = "Teg Dawnstrider teaches enchanting on the middle rise with his son Mot at his elbow. He speaks of magic the way a herdsman speaks of weather, as something to be read and respected, and never ordered about.",
    third = "{name} met Teg Dawnstrider, the enchanting trainer of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "The dawn's light on you, {class}. Come in, and touch nothing that hums." },
    { id = "g_back", when = { metBefore = true }, text = "You return with the light, friend. What have you unmade since we last spoke, and what did it teach you?" },
  },
  notice = {
    { id = "n_ench", cat = "profession", when = { profession = "Enchanting" },
      text = "There is dust on your fingers that is not road dust, {class}. You have been taking things apart, and I am glad of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Teg, of the Dawnstriders. We teach the art of drawing out what sleeps inside a made thing and setting it to rest in another, and my son Mot is learning it faster than I did." },
        { id = "h_ench", when = { profession = "Enchanting" }, text = "I am Teg, of the Dawnstriders. You already know the first truth of the art, that nothing is given a gift until something else has given one up." },
      },
      again = {
        { id = "h_again", text = "What else would you know, {class}?" },
        { id = "h_again2", text = "Speak, friend, while the light is good." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "How does a tauren come to enchanting?", next = "tauren" },
        { text = "Tell me about your son.", next = "mot" },
        { text = "May the sun shine upon you.", next = "END" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "By a longer road than a mage does. Our shaman always knew that a carved totem could hold a spirit's favour, and enchanting is a cousin to that, only it borrows from the thing itself and not from the elements." } },
      choices = {
        { text = "Do the shaman approve of it?", next = "approve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    approve = {
      lines = {
        { id = "a_default", text = "Some do, and some say I meddle. I tell them I destroy nothing that was not made by hands in the first place, and that the dust goes back into something useful, and the wiser ones are content with that." },
        { id = "a_shaman", when = { class = "SHAMAN" }, text = "You may tell me, {class}, for you are one. I take nothing from the living earth, only from things that hands have made, and I have never yet felt the elements turn their faces from this lodge." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mot = {
      lines = { { id = "m_default", text = "Mot has better hands for the rod than I have, and a worse temper for the waiting. He would enchant every spear on the bluff by nightfall if I let him, so I have him grinding dust until he learns that the art is mostly preparation." } },
      choices = { { text = "He sounds like a fine apprentice. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carved totems for the shaman before I learned to enchant, and I think of the two as one craft." } },
    _none = { { id = "tp_none", text = "That lies outside my light, friend. An elder on the Elder Rise may see further." } },
  },
}

---------------------------------------------------------------------------
-- Mot Dawnstrider: apprentice enchanter, Teg's son. Forever: Camping 101: Enchanting.
---------------------------------------------------------------------------
P:NPC {
  key = "mot_dawnstrider", id = TODO_NPC("Mot Dawnstrider"), name = "Mot Dawnstrider", gender = "male", title = "Apprentice Enchanter",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "eager", "impatient" }, values = { "knowledge", "family" },
  notices = { "profession", "class" },
  impression = {
    first = "Mot Dawnstrider grinds enchanting dust at his father's lodge on the middle rise and looks up hopefully at every customer, in case this one has brought something interesting to take apart. He is quick, bright and visibly tired of grinding.",
    third = "{name} met Mot Dawnstrider, the apprentice enchanter at his father's lodge in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Well met, {class}! Have you brought anything that glows, by any chance, because I have been grinding since sunrise?" },
    { id = "g_back", when = { metBefore = true }, text = "You are back! Tell me you found something enchanted out there and thought of me." },
  },
  notice = {
    { id = "n_ench", cat = "profession", when = { profession = "Enchanting" },
      text = "You are an enchanter too! Does your teacher make you grind for a whole season before you may touch a rod, or is that only fathers?" },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, here, at our lodge! We have none among the tauren, so you must tell me whether the arcane feels the way my father says it does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Mot Dawnstrider, and my father Teg is teaching me to enchant, by which he means he is teaching me to grind. He says I will thank him one day, and I am waiting for the day." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Enchanting") },
          text = "The camping lesson! Yes, that one is mine, my father said so in front of Nata and everything. Come round to this side of the bench and I will show you what an enchanter can do for a camp." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Enchanting") },
          text = "Does the enchantment at your camp still hold, {class}? If it does, please say so where my father can hear it." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? Anything is better than the mortar." },
        { id = "h_again2", text = "Ask me something, please." },
      },
      choices = {
        { text = "What does an enchanter bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Enchanting") } },
        { text = "Why does your father keep you grinding?", next = "grind" },
        { text = "What would you enchant, if he let you?", next = "would" },
        { text = "Who is Nata?", next = "nata" },
        { text = "Patience, Mot. Farewell.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "Light without smoke and warmth without a blaze, for a start, which matters when you would rather the centaur did not see your fire from across the plain. A little dust and the right mark will do work that a whole bundle of wood cannot." } },
      choices = {
        { text = "Then show me the mark.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grind = {
      lines = { { id = "g_default", text = "He says an enchanter who has not ground the dust does not know what it cost, and will spend it like water. I understand him, truly I do, but I understood him two moons ago as well." } },
      choices = {
        { text = "Has he let you use the rod at all?", next = "rod" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rod = {
      lines = { { id = "r_default", text = "Once, on a pair of his own bracers, so that nobody else would suffer if it went badly. It did not go badly, and he wore them for a week and kept turning his wrists over to look at them." } },
      choices = {
        { text = "That sounds like a proud father.", next = "proud" },
        { text = "Something else.", next = "BACK" },
      },
    },
    proud = {
      lines = { { id = "p_default", text = "Do you think so? He said only that the lines were clean, and then he handed me the mortar again. But he still wears the bracers, now that you make me think of it." } },
      choices = { { text = "He does. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    would = {
      lines = {
        { id = "w_default", text = "Everything, friend! The bridge ropes so they never fray, the lift so it never sticks, and Cairne's own totem so that it lights the whole rise at night. My father says that is exactly why I am not yet allowed." },
        { id = "w_war", when = { class = { "WARRIOR", "HUNTER" } }, text = "That weapon of yours, to begin with, {class}. I can see where the mark would sit, just there, and I would do it this moment if my father were not standing behind me." },
      },
      choices = { { text = "One day, perhaps. Something else.", next = "BACK" } },
    },
    nata = {
      lines = { { id = "n_default", text = "Nata Dawnstrider, who keeps the rods and vials for sale at our lodge. She is kin, and she sees that I do not waste the good dust, and she slips me the cracked rods to practise holding when my father is teaching." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Dawnstrider, so I was always going to enchant. I only wish I might begin." } },
    _none = { { id = "tp_none", text = "I do not know, {class}. My father might, though he will make you wait for the answer." } },
  },
}

---------------------------------------------------------------------------
-- Nata Dawnstrider: enchanting supplies at the Dawnstrider lodge.
---------------------------------------------------------------------------
P:NPC {
  key = "nata_dawnstrider", id = TODO_NPC("Nata Dawnstrider"), name = "Nata Dawnstrider", gender = "female", title = "Enchanting Supplies",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "practical", "wry" }, values = { "family", "trade" },
  notices = { "profession" },
  impression = {
    first = "Nata Dawnstrider sells rods, vials and dusts at the Dawnstrider enchanting lodge, and she keeps the lodge running while Teg thinks and Mot fidgets. She has a wry, fond way of talking about both of them.",
    third = "{name} met Nata Dawnstrider, who sells enchanting supplies in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Dawn's light on you, {class}. If you want teaching, Teg is the one, and if you want something you can carry away, that is me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend. Did the rod serve, or did it crack, as the cheap ones do?" },
  },
  notice = {
    { id = "n_ench", cat = "profession", when = { profession = "Enchanting" },
      text = "An enchanter, then. You will want vials, because everyone always wants vials, and nobody ever buys enough of them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Nata Dawnstrider. Teg teaches the art and Mot grinds for it, and I am the Dawnstrider who makes certain there is something left to sell at the end of the day." },
      },
      again = {
        { id = "h_again", text = "What else do you need, {class}?" },
        { id = "h_again2", text = "Ask, friend, for the dust is weighed and I have a moment." },
      },
      choices = {
        { text = "Show me your enchanting supplies.", next = "BUSINESS" },
        { text = "How do you manage those two?", next = "two" },
        { text = "Where do the rods come from?", next = "rods" },
        { text = "Good trade, Nata.", next = "END" },
      },
    },
    two = {
      lines = { { id = "t_default", text = "With patience for the old one and a firm hand on the dust jar for the young one. Teg would give lessons for nothing and forget to eat, and Mot would enchant the tent poles, so someone in this family has to count." } },
      choices = {
        { text = "Mot says you slip him cracked rods.", next = "cracked", when = { heardLine = "mot_dawnstrider.n_default" } },
        { text = "Is the boy any good?", next = "good" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cracked = {
      lines = { { id = "c_default", text = "Does he say so? Then he ought to learn to keep a secret before he learns to keep an enchantment. Teg knows, of course, and has known since the first one, and he pretends not to because it suits us all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    good = {
      lines = { { id = "g_default", text = "He is better than his father was at that age, and Teg knows it, which is the reason for all the grinding. A gift that comes too easily is spent too easily, and that is as true of talent as it is of dust." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rods = {
      lines = { { id = "r_default", text = "The copper ones are drawn at Karn Stonehoof's smithy on the lower rise, and Teg wakes them himself. The finer metals come up the lifts from Orgrimmar, and I look every one over for flaws before I pay the goblin who brings them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Dawnstrider with no gift for the art and a good head for the stock, and the lodge needs one of each." } },
    _none = { { id = "tp_none", text = "I do not sell that, {class}, and I do not know it. Teg may, if you have an afternoon to spare." } },
  },
}

---------------------------------------------------------------------------
-- Nan Mistrunner: fruit vendor on the middle rise.
---------------------------------------------------------------------------
P:NPC {
  key = "nan_mistrunner", id = TODO_NPC("Nan Mistrunner"), name = "Nan Mistrunner", gender = "female", title = "Fruit Vendor",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful", "motherly" }, values = { "community", "devout" },
  notices = { "race" },
  impression = {
    first = "Nan Mistrunner sells fruit on the middle rise, near her kinsman Fyr's bread, and she presses an opinion about eating properly on every customer. Her stall smells of melon and warm apples.",
    third = "{name} met Nan Mistrunner, the fruit vendor on Thunder Bluff's middle rise.",
  },
  greetings = {
    { id = "g_hi", text = "Earth Mother's bounty, {class}! Come and look, for the melons came up from the plains this morning." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more, friend? Good, you looked hungry the last time, and you look hungry now." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc! You will tell me you only eat meat, as your people always do, and then you will finish a whole melon standing where you are." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "I never know what to offer your people, friend. Do you still taste anything, or shall I simply pick you a pretty one?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Nan, of the Mistrunners. Fyr bakes the bread, Aska cooks the meat on the High Rise, and I see that somebody on this bluff eats something that grew on a vine." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? Have an apple while you think." },
        { id = "h_again2", text = "Ask away, friend." },
      },
      choices = {
        { text = "Show me your fruit.", next = "BUSINESS" },
        { text = "Where does fruit grow in Mulgore?", next = "grow" },
        { text = "How does anything reach the top fresh?", next = "fresh" },
        { text = "Thank you, Nan.", next = "END" },
      },
    },
    grow = {
      lines = { { id = "g_default", text = "Along the streams below the bluff, and around Stonebull Lake, where the families have planted since we settled. Our people gathered what they found for all the years we wandered, and it is a new and lovely thing to plant a seed and know you will still be there when it fruits." } },
      choices = {
        { text = "Do the Venture Company's wells trouble the growers?", next = "wells" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wells = {
      lines = { { id = "w_default", text = "They did, and one whole season of melons near the fouled wells came up bitter and had to be left for the birds. The druids have been cleansing them, and this year's are sweet again, so somebody is doing good work down there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fresh = {
      lines = { { id = "f_default", text = "My nephews carry it up the lifts before sunrise, while the air is still cold, and I sell what I have by evening. Anything left goes to Aska's pot or to the kodo at the stable, so nothing the Earth Mother gave is thrown away." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Mistrunners feed the bluff, and my part of it is the sweet part." } },
    _none = { { id = "tp_none", text = "I would not know, dear. Have you eaten today? You will think better afterward." } },
  },
}

---------------------------------------------------------------------------
-- Tand: basket weaver at Cloudweaver's Baskets.
---------------------------------------------------------------------------
P:NPC {
  key = "tand_tb", id = TODO_NPC("Tand"), name = "Tand", gender = "male", title = "Basket Weaver",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "slow", "content" }, values = { "craft", "patient" },
  notices = { "profession" },
  impression = {
    first = "Tand weaves baskets at Cloudweaver's Baskets on the middle rise, and his fingers go on plaiting reeds while the rest of him sits perfectly still. He is in no hurry about anything and seems very happy that way.",
    third = "{name} met Tand, the basket weaver at Cloudweaver's Baskets in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Sit if you like, {class}. I shall be at this row a while, and it goes no faster for standing." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you are back, friend. It is the same basket, I am afraid, but a good deal more of it." },
  },
  notice = {
    { id = "n_herb", cat = "profession", when = { profession = "Herbalism" },
      text = "You gather herbs, by the green on your fingers. Carry them in a basket and not a sack, {class}, because a leaf that cannot breathe is half rotten by nightfall." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tand, and I weave. Baskets and carrying packs both come off this bench, and every one of them began as reeds standing in the shallows of Stonebull Lake." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? The reeds do not mind waiting." },
        { id = "h_again2", text = "Ask, friend, and I will answer at the end of the row." },
      },
      choices = {
        { text = "Show me what you've made.", next = "BUSINESS" },
        { text = "How long does one basket take?", next = "long" },
        { text = "Pakwa says baskets are for staying put.", next = "pakwa", when = { heardLine = "pakwa.t_default" } },
        { text = "Why is it called Cloudweaver's?", next = "cloud" },
        { text = "Weave well, Tand.", next = "END" },
      },
    },
    long = {
      lines = { { id = "l_default", text = "The weaving takes a day or two, and the reeds take a season, because they must be cut after the first frost and dried until spring. People only count the part they can watch, but the basket was begun long before I sat down." } },
      choices = {
        { text = "Do you cut the reeds yourself?", next = "reeds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reeds = {
      lines = { { id = "r_default", text = "Every autumn, with my hooves in the lake and the fishers complaining that I frighten their catch. I take one reed in three and leave the rest, so that the bed is thicker the year after, and the lake has never grudged me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pakwa = {
      lines = { { id = "p_default", text = "Does she? Pakwa is a fine maker and a little too sure of herself. Our people carried their whole lives across Kalimdor in baskets slung on kodo, and those baskets went a good deal further than her satchels have." } },
      choices = { { text = "I'll let you two settle it. Something else.", next = "BACK" } },
    },
    cloud = {
      lines = { { id = "c_default", text = "The one who taught me had that name, and she set up these poles when the rise was new. She wove so finely that her baskets held water, and I have been trying to match her ever since without quite managing it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have woven reeds since my fingers were long enough, and I have never wanted any other work." } },
    _none = { { id = "tp_none", text = "I have not woven that into anything, friend, so I cannot tell you how it holds." } },
  },
}
