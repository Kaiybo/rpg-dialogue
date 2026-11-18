-- Auberdine. Voice: bibles/auberdine.md
-- Classic Auberdine only: the port still stands, the Bravery sails to Menethil and the Moonspray
-- to Rut'theran. "Onward to Ashenvale" (added 2.0.3) is not used; Sentinel Selarin's Trek to
-- Ashenvale is the Classic road to Raene.
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thundris", id = TODO_NPC("Thundris Windweaver"), name = "Thundris Windweaver",
  bible = "bibles/auberdine.md", role = "noble", tier = "major",
  communities = { "auberdine" }, temper = { "steady" }, values = { "fair", "wise" },
  likesTone = "polite",
  spiritSensitive = true,
  notices = { "class", "race" },
  impression = {
    first = "His lamps burn late because he sleeps so little.",
    third = "{name} met Thundris Windweaver, the steady elder of Auberdine, who means to learn why Darkshore is sickening.",
  },

  greetings = {
    { id = "g_elder", text = "Auberdine is glad of you, traveller. Rest and eat first, and when you are ready I may ask something of you, for the village has troubles enough to share." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned! Sit with an old elf a moment, and tell me what the forest told you." },
    { id = "g_boat", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "Fresh off the Bravery from Menethil, by the look of you. Find your land legs, then come and see me; Auberdine always has work for willing hands." },
    { id = "g_away", when = { away = 14 }, text = "You have been gone {away}, traveller, and Auberdine has missed your willing hands. Sit with an old elf, and tell me what the coast has been saying." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "It has been {away} since you last stood in Auberdine, and you return far stronger than you left. The village has troubles still, and I think you are equal to them now." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The village speaks of the help you have given these past days, and I listen to everything the village says. Auberdine is grateful, and so am I." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I am told someone in Auberdine saw through a falsehood of yours. I listen more than I speak, traveller, so I would rather hear the truth from you." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin of the Silver Hand! I confess I trust your order more than some of my own kin, though I would thank you not to tell them I said so." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Humans come off the boats every week now, and some of my people frown at it. I judge each of you by your own deeds, not by your kings'." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Kin from Eldre'Thalas, after so long. You are welcome here; whatever your ancestors did or did not do, it was long ago, and you were not there to do it." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Auberdine has a paladin of the Silver Hand passing through, a dwarf digging in the hills and a gnome captain on the beach who calls himself a pirate. The Alliance has reached our shore whether we invited it or not, so tell me, is that a good thing?" },
      },
      choices = {
        { text = "It is. Darkshore needs every sword it can get.", next = "op_r1", fx = { affinity = 1, align = { honor = 1 }, opinion = { alliance = "trust" } } },
        { text = "They came for your ruins and your timber, not for you.", next = "op_r2", fx = { align = { honor = -1 }, trait = { skeptical = 1 }, opinion = { alliance = "distrust" } } },
        { text = "It's good, so long as they remember whose shore it is.", next = "op_r3", fx = { trait = { cautious = 1 }, opinion = { alliance = "useful" } } },
        { text = "The Light's servants are welcome wherever there's darkness.", next = "op_r4", fx = { affinity = 1, opinion = { silver_hand = "admire", the_light = "trust" } }, when = { class = "PALADIN" } },
        { text = "I'm not sure yet.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "That's the practical answer, and on a bad night I agree with it. I only wish the swords came with a little less noise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Some did. Remtravel the dwarf came for the ruins and would tell you so cheerfully, but Delgren the paladin came for the furbolgs, and I've seen him bleed for them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "And as long as we remember who came when we called. Both sides have short memories for that sort of thing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Delgren the Purifier, our paladin, says much the same, though he says it while doing the work, which I respect more than the saying." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The sea, which casts up the dead, and the forest, where the furbolgs have gone mad. I listen to every fear, and I have few answers. If your spirits have one, I will hear it." } },
      choices = {
        { text = "Then we must find answers carefully, Thundris, and keep the town steady.", next = "BACK", reply = "Carefully and steadily, yes, for a frightened town makes worse mistakes than any furbolg. I am glad to have you beside me in this.", fx = { align = { order = 1 } } },
        { text = "Fear is a poor counsellor. Act boldly and stop listening.", next = "BACK", reply = "Bold action has its place, shaman, but fear is also how the forest warns us. I would rather listen first and act second.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I feel it in the roots and in the rivers, though I cannot yet name its source, and that troubles me more than the sickness itself. Some of the Circle would wait and dream on it, but Auberdine cannot wait, so I send whoever will go." } },
      choices = {
        { text = "The Circle should act together, not each druid on their own.", next = "BACK", reply = "It should, and in a better age it would, but the Circle argues while the rivers sicken. I pray it finds its voice soon.", fx = { align = { order = 1 } } },
        { text = "I won't wait for the Circle. I'll act wherever I see harm.", next = "BACK", reply = "Then act wisely, druid, and send word to me of what you find. One druid acting alone can do much good, or much harm.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then you and I are both in the business of listening, though I hope for kinder reasons. If you hear anything of what is sickening the land, from the furbolgs or from the sailors at the dock, bring it to me first." },
      },
      choices = {
        { text = "You'll hear it first, Elder, and true.", next = "BACK", reply = "Then you will have my thanks, and the town's safety besides. Truth is all an old elder asks for.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll bring it once I've decided what it's worth.", next = "BACK", reply = "Then I hope you decide wisely, rogue, for the lives in Auberdine are worth more than any coin. Think on it.", fx = { align = { honor = -1 } } },
        { text = "What is sickening the land?", next = "sick" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Bound, by you, so that you might loose them again elsewhere? I have seen what comes of mortals who think they can leash the Legion's servants, and so has every kaldorei who lived through the Sundering. Fight them or leave Darkshore, warlock, for there is no third road here." },
      },
      choices = {
        { text = "Then I'll fight them, and bind nothing.", next = "BACK", reply = "That is wiser than you know, and I am glad to hear it. I watched the Highborne try to bind such things, and I watched what came through after.", fx = { align = { light = 1 } } },
        { text = "Your way only lets them come back, Elder.", next = "BACK", reply = "Perhaps it does, but your way lets them come back stronger. I have seen it, and I would not see it again.", fx = { align = { light = -1 } } },
        { text = "What remains in the ruins?", next = "ruins" },
      },
    },
    warrior_th = {
      lines = {
        { id = "wth_default", text = "Auberdine has no walls, only Sentinels and the sea, and the Sentinels are stretched thin enough that I'd take your blade gladly. Speak to Glynda Nal'Shea on the hill; she knows where the gaps are, because she stands in most of them." },
        { id = "wth_watch", when = { origin = "nightelf_auberdine_watch" },
          text = "You stood the watch here once, didn't you? I remember the young ones who did, and fewer of them come home to us than I'd like, so it gladdens me to see you back." },
      },
      choices = {
        { text = "Then I'll stand where Glynda can't.", next = "BACK", fx = { affinity = 2, standing = { auberdine = 1 } } },
        { text = "A village this exposed should be walled.", next = "warrior_th2" },
      },
    },
    warrior_th2 = {
      lines = {
        { id = "wth2_default", text = "Walls are a human answer, and not a bad one, but our people have always lived open to the forest and trusted it to warn us. Lately the forest has been too sick to warn anyone, and I confess I have thought about walls." },
      },
      choices = {
        { text = "Build them. Tradition won't stop a furbolg.", next = "BACK", reply = "Perhaps you are right, and an old elder is too slow to change. Still, I would hate to stand behind a wall and not hear the forest cry out.", fx = { align = { order = 1 } } },
        { text = "Heal the forest instead, and it will warn you again.", next = "BACK", reply = "That is the old answer, and I believe it still. Go and see Tharnariun at the edge of town; he can use your hands.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    mage_th = {
      big = true,
      lines = {
        { id = "mth_default", text = "You could, I'm sure, and that is exactly what frightens me. The demons in Bashal'Aran feed on what magic is left there, and I would rather it all went into the sea than into a stranger's satchel, however well meant." },
      },
      choices = {
        { text = "Knowledge left to rot helps no one.", next = "BACK", reply = "Perhaps not, but knowledge left in the wrong hands helps the Legion. I would rather it rotted.", fx = { align = { order = -1 } } },
        { text = "Then it should be destroyed. I'll help.", next = "BACK", reply = "Elune will thank you for that, mage, and so will every soul in Auberdine. Bring me what you find, and we will see it burned together.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "You don't trust mages at all, do you?", next = "mage_th2" },
      },
    },
    mage_th2 = {
      lines = {
        { id = "mth2_default", text = "I trust that you mean well, which is not the same thing. My people trusted Highborne who meant well, and we sleep in villages like this one now because the old cities are at the bottom of the sea." },
      },
      choices = { { text = "That's fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunter_th = {
      lines = {
        { id = "hth_default", text = "Then you've seen the thistle bears, and you've seen how they foam at the mouth. Tharnariun Treetender at the edge of the village is trying to learn what is doing it, and a hunter who can tell sickness from rage is exactly what he needs." },
      },
      choices = {
        { text = "I'll bring him what he needs.", next = "BACK", fx = { affinity = 1, standing = { auberdine = 1 } } },
        { text = "A sick beast is kindest put down quickly.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    xcl_bfd = {
      big = true,
      lines = {
        { id = "xcl_bfd_default", text = "Then you have seen more than any of my scouts, because the ones I sent down never came back to tell me. The naga in that water carry the same taint I have been chasing through Darkshore since the moonkin went mad, and I have long suspected that the sickness on our shore and the chanting in Blackfathom grow from one root." },
      },
      choices = {
        { text = "Seal the Deeps for good, before anything else crawls out.", next = "BACK", reply = "That would be the wisest course, I think. The Deeps were a temple to Elune once, and look what has crawled out of them since.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leave it open. Whatever's left down there is worth studying.", next = "BACK", reply = "Perhaps, but what is worth studying is often worth fearing too. I would rather it stayed buried.", fx = { align = { order = -1 } } },
        { text = "Do you know what they worshipped down there?", next = "xcl_bfd2" },
      },
    },
    xcl_bfd2 = {
      lines = { { id = "xcl_bfd2_default", text = "Only what the old texts say, which is that the temple was raised to Elune and sank when the Well of Eternity tore the world apart. Something else has moved into her house since then, and the cultists who serve it call it by names I would rather not repeat in my own village." } },
      choices = {
        { text = "Then I won't ask you to say them, Elder.", next = "BACK" },
      },
    },
    dd_plague = {
      lines = {
        { id = "ddp_default", text = "Unnatural, yes, and like the corruption in the Blackwood camps and the moonkin gone wild. I have begun to think these are not many sicknesses but one, coming up out of the land itself, and I have no proof of it but my old bones." },
      },
      choices = {
        { text = "Then find its source and burn it out.", next = "BACK", reply = "If we find it, perhaps. But fire is how the Highborne solved their problems, and look at the ruins they left along this shore.", fx = { align = { order = 1 } } },
        { text = "Some things heal on their own, given time.", next = "BACK", reply = "Spoken like a druid, and Tharnariun would agree. I am older and less patient than he is, I fear.", fx = { align = { order = -1 } } },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_plague", tags = { "news" }, when = { questDone = TODO_QUEST("Cleansing of the Infected") }, text = "Tharnariun tells me you helped him cleanse the sickened bears to the north, and that some of them now walk the forest whole again. It is the first good news about Darkshore's beasts I have heard in a long season." },
        { id = "o_peace_peace", tags = { "news" }, when = { gossip = { topic = "peace", stance = "peace" } },
          text = "Glynda tells me you still believe in peace with the Horde. I hope you're right, though I'd like to see it before I believe it." },
        { id = "h_cl_bfd", tags = { "news" }, when = { cleared = "Blackfathom Deeps", faction = "Alliance" }, text = "Sentinels came up the shore road with word that someone had been to the bottom of Blackfathom Deeps and come back. Auberdine sleeps a little easier for it, and so, I confess, do I." },
        { id = "h_default", key = true,
          text = "I am Thundris Windweaver, elder of Auberdine. I see to the village's daily needs, which lately means seeing to its fears, for the land is sickening and I mean to learn why." },
        { id = "h_bashal", tags = { "news" }, when = { questActive = TODO_QUEST("Bashal'Aran") },
          text = "The ruins of Bashal'Aran to the east are overrun with demonic creatures that feed on the old magic there, yet there is one shrine they will not approach. I would know why." },
        { id = "h_highborne", when = { questActive = TODO_QUEST("Tools of the Highborne") },
          text = "The Sentinels tell me the Highborne spirits of Ameth'Aran still wield their old implements. Bring me those relics, and I will see them destroyed before their magic does any more harm." },
        { id = "h_river", tags = { "news" }, when = { questActive = TODO_QUEST("The Cliffspring River") },
          text = "The Cliffspring River is turning foul, and I suspect its sickness begins in Felwood. Bring me water from the first falls north of here, and we shall know." },
        { id = "h_blackwood", when = { questActive = TODO_QUEST("The Blackwood Corrupted") },
          text = "A satyr is feeding corruption to the Blackwood furbolgs through a talisman. Cleanse their food with water from our moonwell, and the corruptor will have to show itself." },
        { id = "h_kor", tags = { "news" }, when = { questActive = TODO_QUEST("Seeking the Kor Gem") },
          text = "Stilwell the blacksmith? I remember him, though I have not heard his name in years. The naga of Blackfathom Deeps carry Kor gems; bring me one, tainted as it will be, and I will purify it." },
        { id = "h_ashenvale", key = true, when = { minLevel = 18 },
          text = "Raene Wolfrunner commands the scouts at Astranaar, south along the road into Ashenvale, and she never has enough help. When you are ready for harder work, go to her." },
        { id = "h_terenthis", tags = { "news" }, when = { questActive = TODO_QUEST("Thundris Windweaver") },
          text = "Terenthis sent you with word of the furbolg camps? Your scouting comes at a fortunate time, for we have been fighting the forest's corruption as well as its creatures." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, and welcome. Gwennyth of the Temple of the Moon would be glad of another healer's eye on what the sea keeps leaving on our shore." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle, and kaldorei besides. Then you will feel the sickness in this land as I do, and you will understand why my lamps burn so late." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Auberdine's lamps burn later than any in Darnassus, because the boats come in at all hours. I sleep little these days in any case." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who speaks with spirits. Auberdine has fears enough these days, so I will ask plainly, as one who has watched this coast for many centuries: do your spirits say what troubles it?" },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I have time, and Auberdine has troubles." },
        { id = "h_again2", text = "Go on. An elder's work is mostly listening, and my people have had ten thousand years to practise it." },
      },
      choices = {
        { text = "Tharnariun's bears were sick with something unnatural, Elder.", next = "dd_plague", when = { questDone = TODO_QUEST("Cleansing of the Infected") } },
        { text = "How does Auberdine feel about its new allies?", next = "op_ask" },
        { text = "The land here looks sick.", next = "sick" },
        { text = "Why trust the Silver Hand?", next = "silverhand", when = { class = "PALADIN" } },
        { text = "There are old ruins all along this coast, I've noticed.", next = "ruins" },
        { text = "I keep hearing travellers speak of the Master's Glaive.", next = "glaive" },
        { text = "I'm a paladin, and I'd like to help.", next = "paladin", when = { class = "PALADIN" } },
        { text = "Can a priest help against this corruption?", next = "priest_t", when = { class = "PRIEST" } },
        { text = "I came over on the Bravery from Menethil.", next = "boat", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Auberdine needs more blades. I have one.", next = "warrior_th", when = { class = "WARRIOR" } },
        { text = "I could read the magic in those Highborne ruins.", next = "mage_th", when = { class = "MAGE" } },
        { text = "The beasts here are sick. I've seen it in their eyes.", next = "hunter_th", when = { class = "HUNTER" } },
        { text = "An elder must hear a great many things. So do I.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Bashal'Aran's demons could be bound instead of fought.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You feel the sickness too, Elder? What do you make of it?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do the people of Auberdine fear most, Thundris?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Blackfathom Deeps is cleared, Elder. I've seen the bottom of it.", next = "xcl_bfd", when = { cleared = "Blackfathom Deeps", faction = "Alliance" } },
        { text = "I'll help Auberdine.", next = "END", fx = { affinity = 2, standing = { auberdine = 1 } } },
      },
    },
    sick = {
      big = true,
      lines = {
        { id = "s_default", text = "There is corruption from Felwood seeping down the rivers, a red crystal maddening the moonkin, and moss that turns the furbolgs savage. Whether it is one cause or many I cannot yet say, but it all comes from the north and east." },
      },
      choices = {
        { text = "I'll find the source.", next = "BACK", reply = "Then go with Elune's blessing, and come back to tell me what you find. Begin with the rivers that run down out of the hills.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Felwood's rot is the kaldorei's trouble, not mine.", next = "BACK", reply = "It is, but it will not stay ours for long. The rivers run to every shore.", fx = { align = { light = -1 } } },
        { text = "I've heard Felwood is a sick place.", next = "felwood" },
      },
    },
    felwood = {
      lines = { { id = "f_default", text = "Felwood is where the demons trod during the Third War, and the forest there never healed. Now its sickness runs down the rivers into its neighbours, and I have seen its like before, long ago." } },
      choices = {
        { text = "You speak as if you've seen it before.", next = "felwood2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood2 = {
      lines = { { id = "f2_default", text = "Long ago, yes, though I will not trouble you with an old elf's memories. It is enough that I know the smell of it, and that I smell it in the Cliffspring now." } },
      choices = {
        { text = "Then we'd better act quickly.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'd gladly hear an old elf's memories, Elder.", tag = "Persuade", next = "felwood_memory",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "curious" }, { questDone = TODO_QUEST("The Cliffspring River") } } } },
          fail = { next = "felwood_later", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    silverhand = {
      lines = { { id = "sh_default", text = "Because they came when they were needed and asked for nothing in return, which is rarer than it should be among elves or anyone. I will not judge a whole order by one fallen prince." } },
      choices = {
        { text = "That's generous of you.", next = "BACK", reply = "It is only the truth. I have known few humans, but the Silver Hand were the best of them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd judge an order by the men it lets fall.", next = "BACK", reply = "That is a fair way to judge, and a hard one. I wonder how the Sentinels would fare by it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins = {
      lines = { { id = "ru_default", text = "Bashal'Aran to the east and Ameth'Aran to the south were Highborne places before the Sundering. Now demons feed on what magic is left in them, and the Highborne dead still walk there." } },
      choices = {
        { text = "Why destroy the Highborne relics?", next = "relics" },
        { text = "I met the spirit at Bashal'Aran.", next = "asterion", when = { questDone = TODO_QUEST("Bashal'Aran") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    relics = {
      lines = { { id = "re_default", text = "Because magic like theirs nearly ended the world once. When I held those relics I fancied I could feel the taint upon my hands, and though it may have been my imagination, I will not take the chance." } },
      choices = {
        { text = "Better safe than sorry.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Couldn't they be studied instead?", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    asterion = {
      lines = { { id = "as_default", text = "Asterion, he calls himself, and he is very glad of civil company after so many years. Listen to him by all means, but remember what the Highborne were." } },
      choices = { { text = "I'll keep that in mind.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    glaive = {
      lines = { { id = "gl_default", text = "South, past the Grove of the Ancients, a great glaive stands in the bones of something very old. Onu, the Ancient at the grove, says it fell there in the war against the Legion, and now Twilight's Hammer cultists dig around it." } },
      choices = {
        { text = "What are they digging for?", next = "glaive2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glaive2 = {
      lines = { { id = "gl2_default", text = "I do not know, and that troubles me more than any furbolg. Cultists who worship old things buried in the earth should not be allowed to finish their digging." } },
      choices = {
        { text = "Then they won't.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, learn = { "twilights_hammer" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } },
      },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Then hear this: if Stilwell the blacksmith ever sends a paladin to me for a Kor gem, I will help them. The naga of Blackfathom Deeps carry such gems, though never clean ones." } },
      choices = {
        { text = "I'll remember.", next = "BACK", reply = "Good, and I hope you never need it. If you do, my door is open.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll find my own way to a gem, thank you.", next = "BACK", reply = "As you wish, paladin, and I hope you find one. The offer stands.", fx = { align = { honor = -1 } } },
      },
    },
    priest_t = {
      lines = { { id = "pr_default", text = "Prayer will not cleanse a river by itself, but healers are needed whenever the furbolgs come out of the trees. And Gwennyth by the inn would welcome a priest's eye on her poor sea creatures." } },
      choices = {
        { text = "I'll go and see her.", next = "BACK", reply = "Thank you, priest, and she will be glad of you. She has been very lonely with her prayers.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Her sea creatures are past saving, and I won't waste prayers on them.", next = "BACK", reply = "Perhaps they are, but she is not, and she would be glad of the company. Go and see her anyway.", fx = { align = { light = -1 } } },
      },
    },
    boat = {
      lines = { { id = "bo_default", text = "Then you have seen Menethil Harbor. Tell me, is it as damp as our Sentinels complain, when they come back from guarding the Bravery's crossings?" } },
      choices = {
        { text = "Damper, if anything.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "The Wetlands are dangerous. The orcs, the raptors...", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I didn't notice. I was seasick.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    felwood_memory = {
      lines = {
        { id = "fm_default", text = "Then you shall have one. I was young when the Legion first came through the Well, and afterwards I walked the burned groves along the old shore, and they smelled just as the Cliffspring does now, sweet and rotten at once. I have never told the village, because frightened people do not sleep, and Auberdine needs its sleep." },
        { id = "fm_priest", when = { class = "PRIEST" },
          text = "You have a priest's patience, so I will tell you. I walked the groves the Legion burned when I was young, ten thousand years ago, and they smelled as the Cliffspring smells now; I have not told the village, because frightened people pray badly and sleep worse." },
      },
      choices = {
        { text = "It stays with me, Elder.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood_later = {
      lines = {
        { id = "fl_default", text = "Another evening, perhaps, when there is less to do and more wine to do it with. For now the river matters more than my memories." },
        { id = "fl_kin", when = { race = "NightElf" },
          text = "You of all people should know that some of what the old ones remember is better left with them. Another evening, perhaps." },
      },
      choices = {
        { text = "Another evening, then.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You are gracious to an old elf, and I thank you for it. Auberdine hears so little kindness from the road these days that I had almost forgotten the sound." },
        { id = "s2", text = "That was well spoken, traveller. I can tell honest regard when I hear it, and it gladdens me that the village has made a friend." },
      },
      fail = {
        { id = "f1", text = "You are generous with your words, but an elder hears many fair speeches from those who want a favor. I would sooner you spoke to me plainly." },
        { id = "f2", text = "Kind words do not mend the troubles on this coast, I fear. Set them aside, and tell me what you actually came for." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha, you have a sharp wit under that road dust! It does an old elf good to be prodded, for the villagers are much too respectful to try it." },
        { id = "s2", text = "You are bolder than the tide, and I cannot say I mind. Very well, you have had your sport with me, and I am smiling in spite of myself." },
      },
      fail = {
        { id = "f1", text = "I have given you welcome and a place to rest, and that is how you answer it. Auberdine deserves better manners from its guests." },
        { id = "f2", text = "I am too old to be stung by that, though I am not too old to remember who said it. Mind how you speak to the folk here, for they have lost a great deal." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "There is no call for that, traveller. I am an elder and not a Sentinel, and I will not quarrel with you over it, so let it be as you say." },
        { id = "s2", text = "You have unsettled me, and I admit it freely. I see you are not one to be put off, so speak your need and I will do what I fairly can." },
      },
      fail = {
        { id = "f1", text = "I have stood on this shore through storms that tore the docks from their pilings. A raised voice will not move me, and it will not win you a single friend in Auberdine." },
        { id = "f2", text = "Threats are for the naga and the Twilight's Hammer, and we have quite enough of those already. If you mean to behave as they do, the Sentinels will treat you as they do." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That is a matter I keep for those who have earned Auberdine's trust, and you are still new to us. Help the village a while, and ask me again." },
      { id = "gt2", text = "I know something of it, but I am not ready to share it with you. An elder must be careful about whom he confides in." },
    },
    knows = {
      { id = "tp_knows", text = "An elder hears a little of everything, and Auberdine has plenty to say these days. Ask me of any of these, and I will tell you what I can." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "Sit, friend, and ask what you like. You have done enough for this village that I would keep very little from you." },
    },
    background = { { id = "tp_bg", text = "I am an elder of this village, and a druid in my small way. Auberdine asked me to look after its days, and I have not yet found a way to stop." } },
    advice = { { id = "tp_ad", text = "Keep to the road between Auberdine and Ashenvale, and do not drink from any river that runs down from the east." } },
    twilights_hammer = { { id = "tp_hammer", text = "They dig at the Master's Glaive for something better left buried, and I would very much like to know what." } },
    fel_moss = { { id = "tp_moss", text = "Terenthis knows more of it than I do, so ask him. I know only that it turns gentle creatures savage." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Blackwood were our friends once. What we learned cleansing their food may yet free them from their torment for good." } },
    cenarion_circle = { { id = "tp_circle", text = "I am of the Circle, in my small way. Darnassus argues and Moonglade dreams, while Auberdine simply tries to keep its rivers clean." } },
    blackfathom = {
      { id = "tp_blackfathom", text = "Blackfathom Deeps lies south, where Ashenvale meets the sea, and the Twilight's Hammer have made a nest of the old temple. Their poison runs up this coast, and I fear for every creature on it." },
      { id = "tp_blackfathom2", when = { disposition = { min = 65 } }, text = "If you mean to go into Blackfathom, go with friends and come back to tell me what you saw. I have been asking that of young people for a long while, and too few come back." },
    },
    highborne = { { id = "tp_highborne", text = "Darkshore is littered with the bones of Highborne towns, and the Highborne were never easy in death. Ameth'Aran is the worst of them, and I wish it would simply fall down." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil still stands on Hyjal, wounded, and I think of it when I look at this poor shore. Some wounds go on hurting long after the war is done." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Circle's druids walk the Dream for answers, and lately they come back with fewer than they went in with. That worries me more than any naga." } },
    theramore = { { id = "tp_theramore", text = "The Theramore ships call at our docks more often these days, and the humans are courteous guests. I'm glad of allies who come by sea and not with axes." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's children watch over the Dream, and something has unsettled them lately, if the druids are to be believed. I am an old elf, and I would prefer the dragons settled." } },
    _none = { { id = "tp_none", text = "I don't know, but I will find someone who does. Auberdine is small, but its memory is long." } },
  },
}

P:NPC {
  key = "terenthis", id = TODO_NPC("Terenthis"), name = "Terenthis",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "auberdine" }, temper = { "intent" }, values = { "determined", "curious" },
  notices = { "form", "class" },
  impression = {
    first = "He insists the furbolgs are sick rather than evil.",
    third = "{name} met Terenthis, a druid come to Darkshore to learn how far the Fel Moss has spread and how to end it.",
  },

  greetings = {
    { id = "g_moss", text = "Careful where you step, friend; that moss on your boots is exactly what I came here to stop." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the moss has grown back twice over in that time. I'm still burning it, mind, so watch your boots." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown much stronger since you first helped me with the furbolgs. Strong enough to remember they're sick, I hope, and not simply wicked." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear you've upset someone in the village. We've enough sickness on this coast without bad blood between neighbours, so do try to mend it." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, thank Elune! I need someone who can feel what is wrong with this place, rather than just poke at it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I must believe it, or I am only killing old friends. The fel moss poisons them, and the earth itself suffers for it. Your spirits of the earth must feel that." } },
      choices = {
        { text = "Then I believe you, Terenthis. The sick deserve healing first.", next = "BACK", reply = "Then you are kinder than most. If the Blackwood ever wake from this, I will tell them who spoke for them.", fx = { align = { light = 1 } } },
        { text = "Mercy for the mad gets Sentinels killed. Defend Auberdine first.", next = "BACK", reply = "It does, sometimes, and I have buried Sentinels for it. Defend Auberdine, then, and I will keep trying.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Hard, because they won't stop once they've started, and without hatred, because none of this is their fault. The Fel Moss is in their food and their water, and if you bring me what I need, I may yet find a way to burn it out of them." } },
      choices = {
        { text = "I'll fight them without hatred. They're victims.", next = "BACK", reply = "That is all I ask, warrior, and more than most offer. I sat with their elders once, before the moss came.", fx = { align = { honor = 1 } } },
        { text = "Sick or not, they'll fall to my blade.", next = "BACK", reply = "They will, and I cannot stop you. Only remember that they were friends once.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Green on their muzzles and a stagger in their walk, which means the Fel Moss has reached their blood. Follow their trail back to where they eat and you'll find the moss growing thickest there, and that is where I need you to look." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Green on their muzzles and a stagger in their walk, which means the Fel Moss has reached their blood. Keep your {pet} from eating anything near the Blackwood camps, I beg you. If the moss can do that to a furbolg, I don't want to know what it would do to a beast." },
      },
      choices = {
        { text = "I'll track it back to its source.", next = "BACK", reply = "The source is somewhere in the Blackwood, hunter, where the furbolgs sleep on the moss. Elune guide your tracking, and come back to me first.", fx = { align = { order = 1 } } },
        { text = "Find the source yourself. I'll thin the furbolgs.", next = "BACK", reply = "Then thin them, and I will go looking for the source myself. My knees will curse you all the way to the Blackwood.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Perhaps not, and I would rather have a mage's word on that than nothing. The moss is fel, and fel is the Legion's, and your craft and theirs once drank from the same Well, which is a thing my people have not forgotten." },
      },
      choices = {
        { text = "Then I'll help you burn it out.", next = "BACK", reply = "Fel burns hotter than any moss should, and I am glad of a mage who knows the difference. Bring a torch, and we will start tonight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel or arcane, power is power.", next = "BACK", reply = "It is not, mage, and you will learn that the hard way if you are careless. Fel is the Legion's.", fx = { align = { light = -1 } } },
        { text = "What is the moss, exactly?", next = "moss" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then learn it, and quickly, for every day the Blackwood eat from those tainted stores, more of them turn. Watch what they eat and where it comes from, and tell me before you do anything else." },
      },
      choices = {
        { text = "I'll watch only, and tell you true.", next = "BACK", reply = "The truth is all I need, rogue, and a quiet pair of eyes is worth a dozen loud blades in the Blackwood. Watch closely and come back safe.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If their chieftain's behind it, he dies in his sleep.", next = "BACK", reply = "Then be very sure, rogue, for if he is not, you will have killed an innocent. Bring me proof first.", fx = { align = { honor = -1 } } },
        { text = "Can the furbolgs be turned back?", next = "turn" },
      },
    },
    warlock_te = {
      big = true,
      lines = {
        { id = "wte_default", text = "I don't doubt that you know it, and I wish you didn't. If you can tell me where the taint is strongest without feeding it, then for once I will be glad of what you are, and I won't ask how you learned to smell it." },
      },
      choices = {
        { text = "I'll trace it to its source and burn it out.", next = "BACK", reply = "Burn it well, warlock, and Auberdine will be grateful, whatever it thinks of your craft. I never thought I would say that to one of your kind.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "The power in it could be put to use.", next = "BACK", reply = "It could, and that is exactly why it must burn. I will not have the Legion's moss put to use.", fx = { align = { light = -1 }, affinity = -2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Pray for them, if you would, and pray as you would for any sick creature rather than for an enemy. I burn the Fel Moss, but burning does nothing for the furbolg who has already eaten it." } },
      choices = {
        { text = "I'll pray for them. Sick is not the same as wicked.", next = "BACK", reply = "I wish more travellers understood that. Elune will hear you, priest, and perhaps somewhere under the madness, so will they.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer is wasted on beasts that kill travellers.", next = "BACK", reply = "Perhaps, but they did not choose to kill. Pray for them anyway, if you can.", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Mercifully, where you can, and swiftly where you cannot, for a furbolg too far gone will not thank you for hesitating. But remember that every one you kill is a creature something else ruined first." } },
      choices = {
        { text = "I'll spare any I can, and grieve the ones I can't.", next = "BACK", reply = "Grieve them well, paladin, for they would thank you if they could. Most who come through Auberdine only count them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A mad beast is a mad beast. I won't hesitate.", next = "BACK", reply = "Then do not hesitate, but do not hate them either, paladin. They are sick, not wicked.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Terenthis, and I came to Darkshore to learn how far the Fel Moss has spread. It is farther than I feared, and now even Volcor, who walks these hills with a great bear, has fallen foul of the furbolgs it maddens." },
        { id = "h_threat", tags = { "news" }, when = { questActive = TODO_QUEST("How Big a Threat?") },
          text = "Find one of the furbolg camps and tell me what you see there. Some of my brethren had to be rescued from a corrupted furbolg on Teldrassil, and I will not wait for more of our kind to be hurt." },
        { id = "h_grimclaw", tags = { "news" }, when = { questActive = TODO_QUEST("A Lost Master") },
          text = "Grimclaw the bear came to me himself, because his master Volcor fell foul of the furbolgs. Bring me fine moonstalker pelts, and I will make you a cloak to walk unseen past Darkshore's creatures while you search." },
        { id = "h_escape", when = { questActive = TODO_QUEST("Escape Through Stealth") },
          text = "You found Volcor! Bring him out quietly if you can, for the furbolgs are sick rather than evil, and I would not have more of them killed than we must." },
        { id = "h_moss", when = { metBefore = true }, text = "I burned another patch of the moss this morning, and it will be back, but so will I." },
        { id = "h_volcor", when = { questDone = TODO_QUEST("Escape Through Stealth") },
          text = "Volcor is safe, and Grimclaw has hardly left his side. What you did for them has given me faith that we can mend what is wrong here, and beyond." },
        { id = "h_athridas", when = { heardLine = "athridas.h_default" },
          text = "You've spoken with Athridas in Dolanaar, then. If the Gnarlpine have turned on Teldrassil as well, the Fel Moss is on both sides of the water, and that frightens me more than anything here." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The furbolgs here are sick rather than wicked, so I'd ask you to keep that in mind when you draw your blade." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You've tracked the furbolgs, haven't you, and seen how they've changed." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Then you know that sickness can live in the spirit as well as the body, and I would swear that is what ails the furbolgs." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I hope you will hear me out before you raise that hammer, because the furbolgs you meet were once our friends." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Then perhaps you will believe me when I say the furbolgs are sick, not evil, for the fel moss grows back no matter how much of it I burn." },
      },
      again = {
        { id = "h_again", text = "What else? The moss won't wait, but I can spare you a moment." },
        { id = "h_again2", text = "Ask, and quickly, if you would; I'm due back in the hills." },
      },
      choices = {
        { text = "What is Fel Moss?", next = "moss" },
        { text = "Who is Volcor?", next = "volcor" },
        { text = "The furbolgs here seem to have turned savage.", next = "turn" },
        { text = "I can feel the sickness in the land.", next = "druid_t", when = { class = "DRUID" } },
        { text = "I know fel when I see it. This moss is fel.", next = "warlock_te", when = { class = "WARLOCK" } },
        { text = "This moss isn't arcane. I'd know if it were.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The furbolgs won't see me. I could learn what drives them.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How should a warrior fight the Blackwood furbolgs?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What signs of the corruption should a hunter look for?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is there anything a priest can do for the furbolgs?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How should a paladin deal with the corrupted furbolgs?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you really believe the furbolgs can be saved, Terenthis?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2 } },
      },
    },
    moss = {
      big = true,
      lines = {
        { id = "m_default", text = "It is moss that grew where demons walked, and it kept something of them in it. The furbolgs eat it or sleep on it, and it changes them, slowly at first and then all at once." },
      },
      choices = {
        { text = "Then we cut it out.", next = "BACK", reply = "We do, and I burn it wherever I find it. There's a patch by the Blackwood path I could use help with tonight.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Then the furbolgs who've turned savage have to be put down.", next = "BACK", reply = "Some of them will have to be, and I grieve it. Bring me the ones who can still be reached.", fx = { align = { light = -1 } } },
        { text = "I'd guess it can't simply be cured.", next = "moss2" },
      },
    },
    moss2 = {
      lines = { { id = "m2_default", text = "It can be burned, at least, though it grows back. What I want is its root, because something is feeding it, and until I find that I am only weeding." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    volcor = {
      lines = { { id = "v_default", text = "He is Grimclaw's master, a night elf who walks the hills with that great bear. The Blackwood furbolgs wounded him, and he is hiding in their den to the south." } },
      choices = {
        { text = "And the bear came to you?", next = "volcor2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    volcor2 = {
      lines = { { id = "v2_default", text = "He did, and stood in the road until I understood him. When a bear walks into Auberdine asking for help, you do not refuse it." } },
      choices = { { text = "No, you don't.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    turn = {
      lines = { { id = "t_default", text = "The moss changes them, and they are sick rather than evil, though that does not make their claws any duller. Their camp south of Auberdine is the nearest danger to our people." } },
      choices = {
        { text = "Then why fight them at all?", next = "turn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    turn2 = {
      lines = { { id = "t2_default", text = "Because Auberdine is close, and the sick still bite. If you must fight them, wash the blood from your hands afterwards and do not mourn it; give thanks instead that fewer of our people were hurt." } },
      choices = {
        { text = "I'll try.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "I'd rather find another way.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    druid_t = {
      lines = { { id = "dt_default", text = "Then you understand why I cannot sleep. Walk the hills to the south and tell me where it feels worst, because my own senses have grown dull from standing in it too long." } },
      choices = { { text = "I'll tell you what I find.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I have been studying this shore for weeks, so ask quickly, before I start on the Fel Moss without being asked." },
    },
    background = { { id = "tp_bg", text = "The Circle sent me, more or less, and I would have come anyway. That is all you need to know about me." } },
    advice = { { id = "tp_ad", text = "Don't sleep on the moss, however soft it looks." } },
    fel_moss = {
      { id = "tp_mossnext", text = "Ah, the moss. I'll tell you more than you want to know, if you'll listen.", next = "moss" },
      { id = "tp_moss", text = "It grows where the demons walked, and it is my whole reason for being in Darkshore." },
    },
    furbolgs = { { id = "tp_furbolgs", text = "They are sick, not evil, and I'll keep saying so until someone believes me." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle sent me, more or less, though I would have come regardless. Someone had to look at this up close." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The bears and moonkin here are sick in a way that feels wrong at the root, the way the Dream feels wrong when it's disturbed. I don't like the comparison, and I can't stop making it." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's flight guards the Dream, and the Circle hears less from them than it used to. I hope that's because they're busy, and only that." } },
    blackfathom = { { id = "tp_blackfathom", text = "The Twilight's Hammer in Blackfathom are poisoning more than the water, and I'd swear the sickness in the bears runs back to them. Prove me wrong, and I'll thank you for it." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw of Felwood are the only furbolgs left with clear minds. I go to them for news when I can, and they tell me the corruption is spreading." } },
    _none = { { id = "tp_none", text = "Not now, I'm afraid. The moss comes first, and everything else after, for the fel has had its way with this land once already." } },
  },
}

P:NPC {
  key = "gwennyth", id = TODO_NPC("Gwennyth Bly'Leggonde"), name = "Gwennyth Bly'Leggonde",
  bible = "bibles/auberdine.md", role = "priest", tier = "quest",
  communities = { "auberdine" }, temper = { "gentle" }, values = { "devout", "curious" },
  notices = { "class" },
  impression = {
    first = "She keeps one eye on the tide, expecting more dead things.",
    third = "{name} met Gwennyth Bly'Leggonde of the Sisterhood, who wants to know why the sea keeps giving up its dead on Darkshore's shore.",
  },

  greetings = {
    { id = "g_temple", text = "The Temple of the Moon sent me to help Auberdine, though the sea, it turns out, has its own ideas about what help means." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the tide has brought in all sorts while you were away. Elune keep you, it's good to see a familiar face." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in the village has spoken warmly of you, and in a place this troubled, a kind word goes further than a poultice. Elune bless you for it." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear harsh words passed between you and someone in Auberdine. The sea makes everyone uneasy, but do try to mend things gently." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I do not know, and it frightens me, because Elune has not answered my prayers on it. Perhaps your water spirits know what she keeps silent." } },
      choices = {
        { text = "Keep praying, Gwennyth. Elune and the spirits may both answer.", next = "BACK", reply = "I will, and I hope you are right. I'll take an answer from anyone, at this point.", fx = { align = { light = 1 } } },
        { text = "Elune is silent. Trust the spirits instead.", next = "BACK", reply = "Elune is silent sometimes, but she is not absent. Trust the spirits, if you must, but do not lose faith.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I pray not, because whatever killed something that size would make short work of Auberdine. The bodies lie along the beach to the north, so if you go to look, take your shield and keep one eye on the water." } },
      choices = {
        { text = "If it comes ashore, I'll stand between it and Auberdine.", next = "BACK", reply = "Then Auberdine will be grateful, and so will I. Elune keep you on that shore.", fx = { align = { honor = 1 } } },
        { text = "Whatever it is, it isn't my fight.", next = "BACK", reply = "Perhaps not. But if it comes ashore, it will not ask whose fight it is.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That's my hope, because I can tell you they died but not how. Look for wounds a beast would make, or the lack of them, because if nothing bit them, then something worse than teeth is at work in the sea." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That's my hope, because I can tell you they died but not how. Your {pet} keeps sniffing toward the shore, and I don't think it likes what it smells. Animals know when the sea is wrong." },
      },
      choices = {
        { text = "I'll study the bodies and tell you what I find.", next = "BACK", reply = "The not knowing is the worst of it, hunter, so anything you find would be a mercy to me. Look for wounds a beast would make.", fx = { align = { order = 1 } } },
        { text = "Dead is dead. It doesn't matter how.", next = "BACK", reply = "It matters to me, and to everyone who lives on this shore. Look anyway, if you can.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "There is grief on that shore, and nothing else that you should touch. Elune keeps the dead, warlock, and if I find you have meddled with them, I will not be as gentle as I am now." },
      },
      choices = {
        { text = "I'll leave the dead in peace.", next = "BACK", reply = "The dead have suffered enough, warlock, and Elune will see that you left them be. So will I.", fx = { align = { light = 1 } } },
        { text = "The dead don't need what they leave behind.", next = "BACK", reply = "They need their rest, and I will see that they have it. Stay away from that shore.", fx = { align = { light = -1 } } },
        { text = "What killed them?", next = "killing" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "The Sisterhood objects to arrogance, and too many mages have carried it. Elune's light asks only that you remember you are small beneath the moon, which is a lesson Azshara never learned." },
      },
      choices = {
        { text = "Then I'll walk humbly here, Sister.", next = "BACK", reply = "Humility is the first step toward Elune's light, mage, and you have taken it more gracefully than most. You are welcome on this shore.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some arrogance is earned, Sister.", next = "BACK", reply = "Perhaps, but it is rarely earned for long. Be careful, mage.", fx = { align = { order = -1 } } },
        { text = "Do you miss the temple?", next = "temple" },
      },
    },
    druid_gw = {
      lines = {
        { id = "dgw_default", text = "Then you've seen more of them than I have, for I can only kneel at the tideline. Did the water feel wrong out there, sister of the Circle, or brother? I have wondered whether it is the sea that's sick, or only what dies in it." },
      },
      choices = {
        { text = "The water felt wrong, like the moss inland.", next = "BACK", fx = { affinity = 2, learn = { "fel_moss" } } },
        { text = "Just cold. Whatever killed them came from elsewhere.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I have asked myself the same each morning, and I pray that they did not suffer, and that whatever killed them does not come ashore next. The Mother Moon has not yet answered, but she has never answered quickly." } },
      choices = {
        { text = "Then I'll pray with you here, as long as it takes.", next = "BACK", reply = "Thank you, priest, and Elune will hear us both. I have been praying alone for too long.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're dead fish. Prayer won't bring the answer.", next = "BACK", reply = "Perhaps not, but it brings me peace, and I have had little enough of that since the first one washed up.", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It may, and that is why I watch the tide, for creatures this large do not die without a reason. If something in the deep is killing them, I would rather a paladin knew of it than not." } },
      choices = {
        { text = "Then I'll stand watch with you until we know.", next = "BACK", reply = "The watch will be easier with company, paladin, and the tide will tell us eventually. Bring a cloak, for the nights are cold here.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The sea is the Sentinels' problem, not mine.", next = "BACK", reply = "It is, and they are stretched so thin you can see the gaps from here. I would be grateful for any help at all.", fx = { align = { order = -1 } } },
        { text = "Something else, sister.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Elune's light falls on every shore, and it doesn't ask what a soul does after dark. I'd only ask you to remember that the people here are frightened by those carcasses on the beach, so whatever your work is, don't add to their fears." },
      },
      choices = {
        { text = "I'll keep my work far from Auberdine's people.", next = "BACK", reply = "Auberdine will sleep easier for it, rogue. Elune sees all who walk at night, but she is kinder than most people give her credit for.", fx = { align = { light = 1 } } },
        { text = "Their fears aren't my concern, priestess.", next = "BACK", reply = "Perhaps not, but they are mine. Be gentle with them, please.", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Gwennyth, of the Sisterhood. I came to tend Auberdine's troubled people and found the shore strewn with great dead creatures, with murlocs picking at them, as if the sea were giving up its dead, and I would like to know why." },
        { id = "h_washed", tags = { "news" }, when = { questActive = TODO_QUEST("Washed Ashore") },
          text = "A great creature has come ashore just south of the village, and the Greymist murlocs have ringed it. Bring me its bones, so that I can send them to Darnassus for study." },
        { id = "h_creature", when = { questActive = TODO_QUEST("Beached Sea Creature") },
          text = "Another one? That is too many to be chance. Bring me a piece of it, and it will go to Darnassus on the next hippogryph." },
        { id = "h_turtle", when = { questActive = TODO_QUEST("Beached Sea Turtle") },
          text = "Even the old sea turtles are washing up now, and they have swum these waters since before Teldrassil was a seed. Something is very wrong out there." },
        { id = "h_fleeing", when = { questDone = TODO_QUEST("Washed Ashore") },
          text = "Thanks to you, we have a real chance of learning why they beach themselves. Some think they are fleeing the waters around Teldrassil, and I find that idea very disturbing." },
        { id = "h_priest", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
          text = "A priest of the Light, here among the dead fish and the murlocs! You are welcome; the Temple gave me a little coin for helpers, but another healer's eye is worth more." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The tide brought up something dead again this morning, and I'd be glad of someone who isn't afraid to look at it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll have seen the creatures washed up on the shore, and I would like your eye on them." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Whether you pray to the Light or to Elune, you are welcome to stand beside me on this sad beach." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the Silver Hand, here on our shore! The Temple speaks of your order with respect, though few of us have met one." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You move like someone who's used to not being seen, and I'll not ask why. The Sisterhood tends everyone who comes to Auberdine, the ones who come in by the back door included." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The Temple sent me to tend Auberdine's people, and instead I tend the dead creatures the sea casts up, so I am slow to trust any voice but Elune's." },
      },
      again = {
        { id = "h_again", text = "What else? I'm listening, though I keep one eye on the tide." },
        { id = "h_again2", text = "Ask what you like; the poor creatures aren't going anywhere." },
      },
      choices = {
        { text = "You must miss the Temple.", next = "temple" },
        { text = "What's killing them?", next = "killing" },
        { text = "The murlocs seem to gather on the carcasses.", next = "murlocs" },
        { text = "A priest of the Light might be of help to you.", next = "priest_g", when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "I've swum out to the great bodies in seal form.", next = "druid_gw", when = { class = "DRUID" } },
        { text = "Death on that shore. There's power in it.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Sisterhood object to mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Whatever killed those creatures could come ashore next.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can a hunter tell what killed the sea creatures?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What should a priest pray for over these dead creatures?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could something on this coast threaten Auberdine itself?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Sisterhood really tend to rogues as well?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why is the sea casting up dead creatures, Gwennyth?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Elune keep you.", next = "END" },
      },
    },
    killing = {
      lines = { { id = "k_default", text = "No one knows yet, for the sea does not speak plainly. But I listen, and I write everything down, and one day the pattern will show itself." } },
      choices = {
        { text = "Could it be something near Teldrassil?", next = "teldrassil_g" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    teldrassil_g = {
      lines = { { id = "tg_default", text = "Perhaps they are fleeing something in the waters around the tree. I don't want to believe it, so I write everything down instead, because belief is no use to anyone without evidence." } },
      choices = {
        { text = "I'll bring you evidence.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    murlocs = {
      lines = { { id = "mu_default", text = "They feed on the carcasses, but a thresher that size could never have been brought down by murlocs, not even a great many of them. Something else killed it, or drove it ashore." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    temple = {
      lines = {
        { id = "t_quiet", text = "I miss its quiet, yes, but the Sisterhood did not train me to stay where it is quiet. Here, people need me, and that is better than quiet." },
      },
      choices = { { text = "Elune keep you.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest_g = {
      lines = { { id = "pg_default", text = "You might, at that. Walk the shore with me some evening and tell me what you sense in those remains; your Light and our Mother Moon may notice different things." } },
      choices = {
        { text = "I'd be glad to.", next = "BACK", reply = "Then come at dusk, and we will walk it together. Your Light may see what I cannot.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll leave the dead creatures to your Mother Moon.", next = "BACK", reply = "As you wish, and Elune will keep them. But the offer stands.", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Sisterhood teaches us to listen before we speak, and this shore has given me much to listen to. Ask what you need to." },
    },
    background = { { id = "tp_bg", text = "The Temple of the Moon sent me to see to Auberdine's troubles. I expected sick villagers, not dead threshers." } },
    advice = { { id = "tp_ad", text = "Stay out of the water near the carcasses, because something larger than murlocs may come for what's left." } },
    sisterhood_of_elune = { { id = "tp_sister", text = "We go where we are needed, and the Temple decided I was needed here, among the bones." } },
    elune = { { id = "tp_elune", text = "Elune sends her priestesses where the hurt is, and she sent me to Auberdine. I'm still not sure if it was an honour or a joke." } },
    blackfathom = { { id = "tp_blackfathom", text = "Blackfathom was Elune's temple once, and the Twilight's Hammer pray in it now. I'm told the moonlight doesn't reach the inner halls anymore, and I believe it." } },
    holy_light = { { id = "tp_holy_light", text = "The human priests call it the Light, and I've worked beside them and found their healing true. They pray louder than we do, I'll say that." } },
    scourge = { { id = "tp_scourge", text = "The human ships bring word of the plague in their north, and some of the sailors still have the cough. I've treated three, and none of them would tell me where they'd been." } },
    _none = { { id = "tp_none", text = "I'm sorry. I only know the shore, and lately not even that; the sea has grown stranger than it was in all my years here." } },
  },
}

P:NPC {
  key = "glynda", id = TODO_NPC("Sentinel Glynda Nal'Shea"), name = "Sentinel Glynda Nal'Shea",
  bible = "bibles/auberdine.md", role = "soldier", tier = "quest",
  prejudice = { race = "Dwarf", amount = 10, why = "Remtravel's diggers carry off carvings from Ameth'Aran and Mist's Edge; she sees every dwarf with a pick as a grave-robber" },
  communities = { "auberdine" }, temper = { "urgent" }, values = { "protective", "dutiful" },
  notices = { "kit" },
  impression = {
    first = "The Sentinels watch everyone, she says, and I try not to mind.",
    third = "{name} met Sentinel Glynda Nal'Shea, who holds back murlocs on Auberdine's beaches and corruption in its groves.",
  },

  greetings = {
    { id = "g_pj_dwarf", when = { prejudiced = true }, text = "Another dwarf off the boat. If you're bound for Remtravel's dig, remember that those ruins were our people's houses, and they are not a quarry for your Explorers' League." },
    { id = "g_pj_dwarf2", when = { prejudiced = true, metBefore = true }, text = "You again, dwarf. I've counted the shovels going north this week and I'm in no mood to count yours, so tell me plainly what you want." },
    { id = "g_pj_over", when = { prejudiced = "overcome" }, text = "I owe you an apology, and Sentinels don't hand those out often. I took you for one of Remtravel's grave-diggers, and you've done more for this shore than half my own patrols." },
    { id = "g_watch", text = "If you're staying in Auberdine, then you're under the Sentinels' eye; don't take it personally, for we watch everyone." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the murlocs haven't stopped coming ashore in that time. Report anything you've seen along the coast." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown much stronger since you first walked these sands. The Sentinels could use a blade like yours on the beach." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "I hear you've been frightening folk in Auberdine. The Sentinels watch everyone, so be careful what we see." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word is someone in the village caught you lying. The Sentinels' eye is on you, as it always was, only more closely now." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The murlocs got their claws into you, by the look of it. Get yourself mended, then go and pay them back." },
  },

  start = "hello",
  nodes = {
    pj_glynda = {
      lines = { { id = "pj_glynda_default", text = "Your countrymen dig in Ameth'Aran and at Mist's Edge, and they carry off whatever they find in sacks, carvings and urns and bones alike. Those were our homes before the Sundering, so every dwarf with a pick looks like a thief to me until I see otherwise." } },
      choices = {
        { text = "Remtravel isn't every dwarf. Who did they take from?", next = "pj_glynda2" },
        { text = "Those ruins should be left in peace. I'll tell Remtravel so myself.", next = "BACK", reply = "Thank you, and I hope he listens to you better than he listens to me. He calls our ancestors' homes 'a promising site'.", fx = { align = { light = 1 } } },
        { text = "Old ruins serve the living better than the dead, Sentinel.", next = "BACK", reply = "Perhaps, but the dead were living once, and they would not want their homes carried off in sacks. Remember that.", fx = { align = { light = -1 } } },
        { text = "I understand. I'll tread carefully up the coast.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pj_glynda2 = {
      lines = { { id = "pj_glynda2_default", text = "From my mother, if you want it plainly. I found the lintel of her house propped under a dwarf's cookpot at the dig, with her name still carved in it, and perhaps that makes me unfair, but it doesn't make me wrong." } },
      choices = {
        { text = "That's a hard thing to find. I'm sorry, Sentinel.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "My sisters in Ashenvale write that the Horde talks of peace in Orgrimmar and cuts our trees at the same time. You've seen more of the world than I have lately, so tell me, is there any peace to be had with them?" },
      },
      choices = {
        { text = "Yes. Thrall is honest; it's the Warsong doing the cutting.", next = "op_r1", fx = { align = { honor = 1 }, opinion = { peace = "peace", warchief = "trust" } } },
        { text = "No. Orcs understand strength and nothing else.", next = "op_r2", fx = { affinity = 1, align = { honor = -1 }, trait = { stern = 1 }, opinion = { peace = "war" } } },
        { text = "Not while they need wood and you need forest.", next = "op_r3", fx = { trait = { practical = 1 }, opinion = { peace = "doubt" } } },
        { text = "I'm Horde, Sentinel, and I'm not cutting your trees.", next = "op_r4", fx = { affinity = 1, opinion = { peace = "peace" } }, when = { faction = "Horde" } },
        { text = "I'd rather not guess.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Then I hope Thrall leashes his wolves soon, because my sisters cannot tell an honest orc from the other kind at fifty paces." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "You'd find friends in Astranaar with that view. Here we have murlocs and maddened moonkin to deal with first, so the war will have to wait its turn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "That is the whole war in one sentence, and I've heard druids talk all night and say less." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Then you may walk Auberdine's docks, slowly, and with your hands where my archers can see them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I count murloc sign, mostly, and it grows. Your water spirits might tell me where they come from before my Sentinels find out by stepping on one." } },
      choices = {
        { text = "Then I will help you watch the beach, Glynda.", next = "BACK", reply = "My Sentinels will be glad of you, shaman, because the beach grows more dangerous every night. Watch the waterline after moonrise.", fx = { align = { order = 1 } } },
        { text = "Murlocs are murlocs. Kill them and be done.", next = "BACK", reply = "They are, and I have killed more than I can count. Yet more come every night, and I would like to know why.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Well enough, though we see the trouble differently, because a druid wants to heal the sick bear and a Sentinel wants it away from the road before it kills someone. Most days I let the druids try first, and I keep my bow strung while they do." } },
      choices = {
        { text = "Heal it first. A sick beast is not an enemy.", next = "BACK", reply = "That is the druid's answer, and I respect it. Heal it quickly, then, because the caravans won't wait.", fx = { align = { honor = 1 } } },
        { text = "If it threatens the road, put it down quickly.", next = "BACK", reply = "That is the Sentinel's answer, and mine too, most days. Make it quick and clean.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then thin them, and quickly, for they have been creeping further up the beach every night. Murkdeep leads them now, and if you can get near enough to see him, you will have done more than my Sentinels." },
        { id = "xro_nightelf", when = { race = "NightElf" }, text = "Then thin them, sister's child, for they creep further up the beach every night and you move as quietly as any Sentinel. Murkdeep leads them now, and if you can get near enough to see him, you will have gone where my scouts could not." },
      },
      choices = {
        { text = "I'll bring Murkdeep down face to face.", next = "BACK", reply = "Then go with Elune, and come back with his head. I'd like to hang it where the fishermen can see it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Murkdeep won't see the blade that kills him.", next = "BACK", reply = "Good. He has dragged off enough of my sisters without warning; let him learn how it feels.", fx = { align = { honor = -1 } } },
        { text = "Who is Murkdeep?", next = "murkdeep" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "The Sentinels do not usually fight beside mages, and some of my sisters would sooner you didn't. But I am short of hands, so stay where I put you and do not set the groves alight." },
      },
      choices = {
        { text = "Where you put me, Sentinel.", next = "BACK", reply = "Then I will put you on the southern beach, and my sisters will grumble about it all night. Fight well.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight where I'm of most use.", next = "BACK", reply = "Then fight where you see the need. Just tell my sisters where you are, so they don't put an arrow in you.", fx = { align = { order = -1 } } },
        { text = "Where are the Sentinels needed most?", next = "thin" },
      },
    },
    warrior_gl = {
      lines = {
        { id = "wgl_default", text = "I'll put you anywhere I can, but the watch here has to cover the shore and the road with the same tired Sentinels, and the murlocs come from the water while the furbolgs come from the trees. Can you stand facing two ways at once?" },
        { id = "wgl_watch", when = { origin = "nightelf_auberdine_watch" },
          text = "You've stood this watch before; I remember you, I think, or someone with your stance. The murlocs have grown bolder since you left, and I don't have anyone left to tell it to who'd understand." },
      },
      choices = {
        { text = "Facing two ways is a warrior's whole job.", next = "BACK", reply = "It is, and you have learned it faster than most. Take the shore, and I will take the road.", fx = { align = { honor = 1 }, affinity = 2, standing = { auberdine = 1 } } },
        { text = "I'll take the murlocs. Leave the trees to someone else.", next = "BACK", reply = "Then take the murlocs, and I will be grateful. I've no one else to send to the beach tonight.", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They need more than I can give them, and most would rather bleed than ask. If you are walking toward Cliffspring or the Blackwood, look in on any Sentinel you pass, whatever she tells you." } },
      choices = {
        { text = "I'll tend any Sentinel I meet, whether she asks or not.", next = "BACK", reply = "They will be grateful, priest, even if not one of them ever says so. Cliffspring is where they need you most.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they won't ask, that's their own choice.", next = "BACK", reply = "It is, and it will kill some of them. I wish it were otherwise.", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Against Murkdeep and his murlocs on the southern beach, for they drag off anyone who walks alone. The corruption in the groves is worse, but a hammer cannot fix that, and a hammer can certainly fix Murkdeep." } },
      choices = {
        { text = "Then I'll break Murkdeep's hold on that beach.", next = "BACK", reply = "Then go with Elune, paladin. Murkdeep is cunning, so do not let him draw you into the water.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Murlocs aren't worth a paladin's time.", next = "BACK", reply = "Then you have never seen what they do to the ones they drag off. Come with me some night, and I will show you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I count what I see: the furbolgs maddened, the moonkin gone wild and the bears with a sourness in their blood. Something fouls this land, and your craft draws from the same well the Legion did, so I will keep my eyes on your hands." },
      },
      choices = {
        { text = "Watch, then. I'll prove you wrong at the murloc camps.", next = "BACK", reply = "Then I will watch, and I would be glad to be wrong. It would make a change.", fx = { align = { honor = 1 } } },
        { text = "My hands are my own business, Sentinel.", next = "BACK", reply = "They are, until they reach for something they should not. Then they become mine.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xcl_bfd = {
      big = true,
      lines = {
        { id = "xcl_bfd_default", text = "Then you've done what the Sentinels couldn't, because Ashenvale takes every bow we have and the Deeps would have swallowed a whole company. I lost two sisters to that water, and I'd have gone in after them myself if anyone had let me, so you'll understand why I'm grateful." },
      },
      choices = {
        { text = "Your sisters are avenged, Glynda. I'd do it again.", next = "BACK", reply = "They are, and I will tell them so at the shrine tonight. Thank you, {name}, truly.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I went down for what lay below, not for anyone's vengeance.", next = "BACK", reply = "Then you did it for your own reasons, and I will thank you anyway. The Deeps are quieter now.", fx = { align = { honor = -1 } } },
        { text = "What sort of foe are the naga, to a Sentinel?", next = "xcl_bfd2" },
      },
    },
    xcl_bfd2 = {
      lines = { { id = "xcl_bfd2_default", text = "Cold and patient ones, and they fight like the Highborne they used to be, with spells first and blades second. Their grandmothers drowned with Queen Azshara, and they've come back up the coast as if ten thousand years were nothing, which to them it may well be." } },
      choices = {
        { text = "Then the Sentinels have the longest memory on this shore.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_gyromast", when = { questDone = TODO_QUEST("Gyromast's Revenge") }, text = "My Sentinels tell me a gnome's clanking machine went mad on the beach and had to be put down, and that you were standing beside it when it did. I would rather not know the rest, so long as the beach is quiet again." },
        { id = "h_dd_althalaxx", tags = { "news" }, when = { questDone = TODO_QUEST("The Tower of Althalaxx") }, text = "Balthule says you have been at work against the Dark Strand at the Tower of Althalaxx, and that the cultists there are fewer and frightened. I have long wanted them gone from our shore, so you have my thanks." },
        { id = "h_cl_bfd", tags = { "news" }, when = { cleared = "Blackfathom Deeps", faction = "Alliance" }, text = "They say in Auberdine that you went down into Blackfathom Deeps and cut your way to the very bottom. The murlocs on my beach haven't noticed yet, but the naga have, and they've been keeping to deeper water since." },
        { id = "h_default", key = true, text = "I am Sentinel Glynda Nal'Shea. Corruption creeps into the groves and has turned even the moonkin wild, and murlocs under a brute called Murkdeep creep up the beaches. I am only one Sentinel, so I could use another pair of hands." },
        { id = "h_crystal", tags = { "news" }, when = { questActive = TODO_QUEST("The Red Crystal") },
          text = "The reports say hostile moonkin are gathering around a large red crystal along the eastern mountains. Find out whether it really exists, and whatever you do, don't touch it." },
        { id = "h_cascade", when = { questActive = TODO_QUEST("As Water Cascades") },
          text = "Fill this tube at our moonwell and pour it over the crystal, for water that potent should tell us what it's made of. Be careful; if it came from Felwood, as I suspect, it could be dangerous." },
        { id = "h_murkdeep", tags = { "news" }, when = { questActive = TODO_QUEST("WANTED: Murkdeep!") },
          text = "Murkdeep is the murlocs' great brute, and his kind have been sinking the boats that leave our harbour. The council has put a price on his head, so go and collect it." },
        { id = "h_beach", when = { metBefore = true }, text = "I walk the beach every morning and find more murloc sign each time, and every evening there is a little less of it, thanks to people like you." },
        { id = "h_fragments", tags = { "news" }, when = { questActive = TODO_QUEST("The Fragments Within") },
          text = "Bone, inside the crystal, and half a jaw that may have belonged to someone who walked on two legs? That answers one question and raises a dozen more, so I'll take it to the council." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Good, because the Sentinels I send up the coast come back with wounds that do not close cleanly, and I have too few hands to mend them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your kind at Maestra's Post in Ashenvale fight hard, I am told, so I will not waste your strength on small things." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid, and kaldorei by the look of you. The groves along this shore are sickening faster than the Circle can tend them, so I am glad to see another of you on the beach." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I watch the beach for murlocs and the groves for corruption, and I'll be watching you as well until I know which of the two you are." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Greymist", min = 30 } },
          text = "The beach has been quieter since you started on the Greymist, and I count fewer tracks each morning. I am still only one Sentinel, but this week I have felt like two." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The Sentinels watch everyone, and I will watch you too, so do not take it personally; we watched the Highborne as well." },
      },
      again = {
        { id = "h_again", text = "What else? I'm due on the beach soon, and the murlocs keep no hours but their own." },
        { id = "h_again2", text = "Speak, but keep it short; the tide is turning." },
      },
      choices = {
        { text = "Is there any peace to be had with the Horde?", next = "op_ask" },
        { text = "What happened to the moonkin?", next = "moonkin" },
        { text = "Who is Murkdeep?", next = "murkdeep" },
        { text = "Your Sentinels look stretched thin.", next = "thin" },
        { text = "Whatever was in that crystal, someone wanted it hidden.", next = "crystal", when = { questDone = TODO_QUEST("The Fragments Within") } },
        { text = "Put me on the watch. I can hold a line.", next = "warrior_gl", when = { class = "WARRIOR" } },
        { text = "Where do you need a bow most?", next = "thin", when = { class = "HUNTER" } },
        { text = "I can thin the murlocs without a sound.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'll lend my fire to the Sentinels.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do your Sentinels need a healer's hands?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Where would a paladin do the most good on this shore?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the Sentinels and the druids work well together here?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you count warlocks among the corruption, Sentinel?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do you count on the beach each morning, Glynda?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been to the bottom of Blackfathom, Sentinel.", next = "xcl_bfd", when = { cleared = "Blackfathom Deeps", faction = "Alliance" } },
        { text = "You glare at me like I've robbed a tomb, Sentinel.", next = "pj_glynda", when = { prejudiced = true } },
        { text = "You Sentinels always looked the other way at my cargo. Why?", next = "xorig_smug", when = { origin = "nightelf_auberdine_smuggler" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2, standing = { auberdine = 1 } } },
      },
    },
    xorig_smug = {
      big = true,
      lines = {
        { id = "xsm_default", text = "Because I had one Sentinel on this beach and a hundred murlocs, and a smuggler who knew every cove made a better pair of eyes than a sailor who knew none. You told me where the Greymist came ashore, and I let your crates pass. Did you think nobody was keeping the account?" },
      },
      choices = {
        { text = "It was a fair bargain, and I'd make it again.", next = "BACK", reply = "It was, and I would make it again, though my sisters still grumble. The beach is safer for it.", fx = { align = { order = -1 } } },
        { text = "I should have been caught. You did Auberdine no favors.", next = "BACK", reply = "Perhaps I should have been, and perhaps I will be yet. But Auberdine is still standing.", fx = { align = { order = 1 } } },
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },
    moonkin = {
      big = true,
      lines = {
        { id = "m_default", text = "They were thought to be gentle, almost mystical creatures, and some still revere them. Then a strange red crystal in the eastern hills drew them in, and now they turn on anyone who comes near; it isn't their fault, but that doesn't blunt their claws." },
      },
      choices = {
        { text = "I'll be careful.", next = "BACK", fx = { affinity = 1 } },
        { text = "I can't help pitying them.", next = "moonkin2" },
      },
    },
    moonkin2 = {
      lines = { { id = "m2_default", text = "Pity them if you like, but keep your distance while you do. Auberdine's safety means I have to take a more realistic view than the people who write poems about them." } },
      choices = {
        { text = "I'll mind that.", next = "BACK", reply = "Good. I have seen a moonkin tear through a Sentinel's shield like it was bark.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll pity them anyway.", next = "BACK", reply = "Then pity them, but keep your distance. Pity will not stop a talon.", fx = { align = { order = -1 }, trait = { kind = 1 } } },
      },
    },
    crystal = {
      lines = { { id = "c_default", text = "Fragments of bone, and half a jawbone that looks to have come from someone who walked upright. Even the strongest magic couldn't break the thing open, so the council can argue about it for now." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    murkdeep = {
      lines = { { id = "mk_default", text = "He's the biggest and meanest of the Greymist murlocs along our coast. The fishing boats have stayed in harbour for weeks because of him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thin = {
      lines = { { id = "th_default", text = "Everywhere outside the lamplight. We guard the village, the road south and even the Bravery on her crossings to Menethil, and there are never enough of us." } },
      choices = {
        { text = "I'll do what I can.", next = "BACK", fx = { affinity = 1, standing = { auberdine = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I'll answer while I sharpen these blades, since there is never time to do only one thing in Auberdine." },
    },
    background = { { id = "tp_bg", text = "I am a Sentinel, and I report to Auberdine's council. That's all the story a Sentinel needs." } },
    advice = { { id = "tp_ad", text = "Never turn your back on the water along this coast, because the murlocs are counting on you doing it." } },
    blackfathom = { { id = "tp_blackfathom", text = "Blackfathom is the cult's nest, and the nagas guard it for them. A Sentinel doesn't go in alone, and neither should you." } },
    thrall = { { id = "tp_thrall", text = "The Horde's warchief is a long way from Auberdine, but his Warsong aren't far from Ashenvale. I watch the south road for any of them." } },
    theramore = { { id = "tp_theramore", text = "Theramore's ships carry Alliance soldiers, and they're welcome at our docks. I count them on and off, all the same." } },
    forsaken = { { id = "tp_forsaken", text = "Undead from the human lands, claiming to be free. If one comes to Auberdine, it'll find a Sentinel with an arrow nocked before it finds the inn." } },
    _none = { { id = "tp_none", text = "Ask the elder, for I only watch the roads, as the Sentinels have done since before this village was raised." } },
  },
}

P:NPC {
  key = "cerellean", id = TODO_NPC("Cerellean Whiteclaw"), name = "Cerellean Whiteclaw",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "auberdine" }, temper = { "melancholy" }, values = { "devoted", "loyal" },
  notices = { "class" },
  impression = {
    first = "He slept thousands of years dreaming of Anaya and grieves her still.",
    third = "{name} met Cerellean Whiteclaw, who has mourned his beloved Anaya of Ameth'Aran since the Sundering.",
  },

  greetings = {
    { id = "g_dock", text = "Hm? Pardon me; I was watching the water. Since the Sundering, it has never quite stopped surprising me." },
    { id = "g_after", when = { questDone = TODO_QUEST("For Love Eternal") }, text = "You freed her. I will never be able to thank you properly, but I will try, every time I see you." },
    { id = "g_away", when = { away = 14 }, text = "Oh, you've been away {away}, have you? I'm afraid I've lost track of days; I've been watching the water." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since last we spoke, and the change is plain even to eyes that only watch the sea. Anaya would have admired you, I think." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I've heard kind words about you in the village, though I hear little these days. It's good to know kindness still travels along this shore." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Have you slept the long sleep yet? Don't, if you can help it, for the dreams find out what you love and keep it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "She was my beloved, lost when Ameth'Aran fell, and I dreamed of her through thousands of years of sleep. Your spirits may know whether she rests." } },
      choices = {
        { text = "Then I hope you find peace, Cerellean.", next = "BACK", reply = "Thank you, and I hope I find it too. It has been a very long sleep.", fx = { align = { light = 1 } } },
        { text = "The past is gone. Let her go.", next = "BACK", reply = "I cannot, not yet. Perhaps when I know what became of her.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "She loved to walk the woods of Ameth'Aran at night and watch the moonstalkers on the cliffs, and she said that watching was the first duty of anyone who loved the wild. I think of her every time I see one, and I envy the hunters who still walk there." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "She loved to walk the woods of Ameth'Aran at night and watch the moonstalkers on the cliffs, and she said that watching was the first duty of anyone who loved the wild. Your {pet} has the same quiet eyes as the beasts she loved. Be good to it, for we do not keep what we love as long as we think." },
      },
      choices = {
        { text = "I'll honor her memory when I walk those woods.", next = "BACK", reply = "She would have liked that, I think. The moonstalkers still walk those cliffs, and she used to watch them for hours.", fx = { align = { light = 1 } } },
        { text = "The past is gone. Walk the woods for yourself.", next = "BACK", reply = "Then walk them, and perhaps you will see what she saw. That would be enough.", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "It was, and Anaya was of the Highborne, though she was gentler than the rest of them. Her people's magic doomed her city, and I have never known whether to hate it or to wish I understood it." },
      },
      choices = {
        { text = "Some power is better left unlearned.", next = "BACK", reply = "It is, and I wish she had never learned it. But she was gentle with it.", fx = { align = { order = 1 } } },
        { text = "Magic didn't doom her. The ones who misused it did.", next = "BACK", reply = "They did, and she was not one of them. But it doomed her all the same.", fx = { align = { order = -1 } } },
        { text = "Who was Anaya?", next = "anaya" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "What I am looking for is her, or what is left of her, and the ruins are full of the restless dead. Go quietly, then, for they do not rest well, and they do not welcome the living." },
      },
      choices = {
        { text = "I'll go, and bring back only the truth.", next = "BACK", reply = "That is all I ask of you, and it is more than I have had in ten thousand years. The truth is better than not knowing.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll go, and take what the dead won't miss.", next = "BACK", reply = "Then take it, but leave her in peace. That is all I ask of you.", fx = { align = { honor = -1 } } },
        { text = "What's in Ameth'Aran now?", next = "ameth" },
      },
    },
    warrior_ce = {
      lines = {
        { id = "wce_default", text = "I did fight, warrior, at the end, with a druid's claws and a heart that was already breaking. Fighting did not save Ameth'Aran; it only meant I was alive to grieve it, and some nights that feels like the worse fate." },
      },
      choices = {
        { text = "Fighting was still right, even if it failed.", next = "BACK", reply = "It was, and I would fight again. But I would rather have saved her.", fx = { align = { honor = 1 } } },
        { text = "Then maybe you should have fled with her.", next = "BACK", reply = "Perhaps I should have, and I think of it every night. But I could not leave Ameth'Aran.", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "I'm sorry.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Her spirit troubles me less than the not knowing, for I cannot tell whether any part of her is at peace. If your prayers reach the dead at all, I would ask you to say one for her, by name." } },
      choices = {
        { text = "I'll pray for Anaya by name. She deserves peace.", next = "BACK", reply = "Her name was Anaya, and it has been a long time since anyone said it but me. Elune bless you for it, priest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead should be let go, Cerellean, not prayed over.", next = "BACK", reply = "Perhaps they should, but I cannot let her go until I know. Pray for me, then.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Restless spirits and worse, for the place was cursed long before I slept, and the curse did not end when I did. If you go there, I would ask only that you strike nothing that still looks like one of my people without cause." } },
      choices = {
        { text = "I'll show the dead there what mercy I can.", next = "BACK", reply = "They have suffered long, paladin, and some of them were kind once. If mercy can reach them, I will be grateful.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they attack me, I'll put them all down.", next = "BACK", reply = "Then put them down, but gently, and remember they were my people once. Some of them were kind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The Highborne who called the Legion down, and the restless dead of my people, and somewhere among them, my Anaya. I've heard that warlocks bind spirits to their will, so I'll ask you plainly to leave hers alone." },
      },
      choices = {
        { text = "I swear I'll not touch her spirit.", next = "BACK", reply = "I will hold you to that oath, warlock, for she has suffered enough. Go, then, and walk carefully among my people.", fx = { align = { honor = 1 } } },
        { text = "The dead can be useful. I'll promise nothing.", next = "BACK", reply = "Then I cannot let you go, and I will not help you. Leave her in peace.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Cerellean Whiteclaw. Before the Sundering I loved a woman named Anaya, of Ameth'Aran, and the war took her and her city; then I slept for thousands of years, and she was in every dream. When I woke, I found her spirit still haunting the ruins." },
        { id = "h_love", tags = { "news" }, when = { questActive = TODO_QUEST("For Love Eternal") },
          text = "Her spirit still walks the ruins of Ameth'Aran, and it must be freed, but I cannot raise my hand against her even now. Please do what I cannot, and bring me her pendant." },
        { id = "h_after", when = { questDone = TODO_QUEST("For Love Eternal") },
          text = "She came to me afterwards, just for a moment, and told me we will find each other again. I believe her; I have waited ten thousand years, and I can wait a little longer." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Anaya loved the moonstalkers of these shores, and she would have liked to see you walk among them." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Do you know anything of spirits that will not rest? I have asked everyone else, and they look at me as though I were a ghost myself." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I have heard your order buries its dead with honour, which is more than the ruins of Ameth'Aran ever gave mine." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "There's a cold about you that reminds me of Ameth'Aran, warlock. I hope you've come to Darkshore for some reason other than to stir what sleeps there." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Do your spirits walk the water? I watch it day after day, as if Anaya might step out of it after ten thousand years." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. I have nothing but time, and the water." },
        { id = "h_again2", text = "Go on, please; I'm listening, I promise." },
      },
      choices = {
        { text = "Tell me about Anaya.", next = "anaya" },
        { text = "Finding her spirit can't have been easy.", next = "found" },
        { text = "Ameth'Aran must have been grand once.", next = "ameth" },
        { text = "I'm not sure I'd fear the long sleep.", next = "sleep_d", when = { class = "DRUID" } },
        { text = "I'd have fought for her, in your place.", next = "warrior_ce", when = { class = "WARRIOR" } },
        { text = "Ameth'Aran was a Highborne city, wasn't it?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I could slip into Ameth'Aran and find what you're looking for.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Did Anaya love the wild, before the Sundering?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does Anaya's spirit still trouble you, Cerellean?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does anything still walk the ruins of Ameth'Aran?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What sleeps in Ameth'Aran, Cerellean?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Who is Anaya, Cerellean?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    anaya = {
      big = true,
      lines = {
        { id = "a_default", text = "She laughed at my bad poetry and kept every page of it. She was braver than me and kinder than me, and after ten thousand years I still turn around expecting her to be there." },
      },
      choices = {
        { text = "She sounds wonderful.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You have to let her go.", next = "go" },
      },
    },
    go = {
      lines = { { id = "g_default", text = "Yes, I know, and knowing has never once made it easier. Perhaps you'll find that out for yourself one day, though I hope you don't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    found = {
      lines = { { id = "fo_default", text = "I woke from the long sleep and wandered these woods in a daze, and my feet took me to the ruins of Ameth'Aran. She was there, haunting the place where she died." } },
      choices = {
        { text = "Why not free her yourself?", next = "found2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    found2 = {
      lines = { { id = "fo2_default", text = "Because even after all these thousands of years, I could not bear to raise my hand against my beloved. Perhaps it would have been better if I had." } },
      choices = {
        { text = "No one could ask that of you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ameth = {
      lines = { { id = "am_default", text = "It was a city of the Highborne's age, beautiful in the way of those days. Now it is ruins and ghosts, and Thundris, our elder, sends young people there to carry off what is left of the old magic." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sleep_d = {
      lines = { { id = "sd_default", text = "Fear it a little. The Dream keeps what you love close to you, which sounds like a mercy until you wake and find it was only a dream." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I have had a long time to think and little to do but remember. Ask me what you will, and I will try to answer as I once might have." },
    },
    background = { { id = "tp_bg", text = "I loved someone in Ameth'Aran ten thousand years ago. The rest of my story is the waiting." } },
    advice = { { id = "tp_ad", text = "Tell the people you love that you love them today, because tomorrow has a way of taking ten thousand years." } },
    elune = { { id = "tp_elune", text = "I prayed to Elune every night for ten thousand years that Anaya would come back to me. She came back, though not as I'd prayed, and I've learned that Elune answers in her own way." } },
    highborne = { { id = "tp_highborne", text = "Ameth'Aran was a Highborne town, and Anaya lived there when it was beautiful. The Highborne were wrong about everything that mattered, but they did build lovely places to fall in love in." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids say the Dream remembers the world as it was. I'd like to see Ameth'Aran there, whole, and her in it." } },
    _none = { { id = "tp_none", text = "I'm sorry; my mind is on the water, and on older things." } },
  },
}

P:NPC {
  key = "shaussiy", id = TODO_NPC("Innkeeper Shaussiy"), name = "Innkeeper Shaussiy", gender = "female",
  bible = "bibles/auberdine.md", role = "innkeeper", tier = "service",
  communities = { "auberdine" }, temper = { "warm" }, values = { "kind", "devout" },
  notices = { "weary" },
  impression = {
    first = "She listens for storms in the floorboards.",
    third = "{name} found a bed at Innkeeper Shaussiy's inn by the Auberdine docks, where nearly every guest arrives seasick.",
  },

  greetings = {
    { id = "g_rest", text = "Ishnu-alah. Your spirit is tired, I can tell, so rest here; the waves are loud, but they'll sing you to sleep after a night or two." },
    { id = "g_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "shaussiy_flirt_no" } }, cooldown = "2d",
      text = "Ishnu-alah. I've brought tea, as I always do, though I'll admit I made this pot a little more carefully than the others." },
    { id = "g_flirt_yes", when = { flirt = true, npcFlagBefore = "shaussiy_flirt_yes" }, priority = 8, cooldown = "1d",
      text = "Elune-adore, you've come back. I kept the window seat for you, and I've been telling myself all week that it was only for the view of the water." },
    { id = "g_flirt_no", when = { npcFlagBefore = "shaussiy_flirt_no" }, priority = 8, once = true,
      text = "Ishnu-alah, friend. Your tea is here, and only the tea, I promise, for I've reminded myself that I'm an innkeeper, and that is no small thing." },
    { id = "g_home", when = { homeInn = { "Auberdine" } }, text = "Auberdine again! The sea air is good for you, mostly, when the wind isn't coming off that dead thresher on the beach." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and your spirit looks more tired than ever. Sit, and I'll bring you tea, and this time do try to drink it." },
    { id = "g_away_long", when = { away = 60 }, text = "It's been {away} since you slept to the sound of these waves, and I wondered if they'd ever sing you to sleep again. Welcome back, friend." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I've heard such kind words about you from my guests. Elune smiles on those who leave others smiling, and so do I." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone in the village is troubled with you, I hear. Rest here a while, and then go and make your peace with them." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Furbolgs, murlocs or moonkin? It's always one of the three. Sit down, and Elune guard your dreams tonight." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They do, if you listen, and I'd wager your water spirits hear them better than I do. Rest here tonight and listen for yourself." } },
      choices = {
        { text = "I will listen gladly, Shaussiy. Thank you.", next = "BACK", reply = "Then rest, and listen, and the waves will tell you what they told me. Sleep well.", fx = { align = { light = 1 } } },
        { text = "Waves are noise. I prefer silence.", next = "BACK", reply = "Then you will not sleep well in Auberdine, I am afraid. The waves never stop.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Greener, often, because they wear their armor on the crossing and it rolls with the ship. I tell them to take it off at Rut'theran and none of them ever listen, so I keep the tea warm." } },
      choices = {
        { text = "Next time I'll take the advice and leave it off.", next = "BACK", reply = "Good, and you will be glad of it next crossing. Sleep well, warrior.", fx = { align = { order = 1 } } },
        { text = "My armor stays on. You never know what's coming.", next = "BACK", reply = "Then you will be seasick again, and I will not say I told you so. Sleep well.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "There's always room, though I keep animals away from the docks, because the fishermen have opinions about their catch. The waves will sing you both to sleep after a night or two, I promise." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "There's always room, though I keep animals away from the docks, because the fishermen have opinions about their catch. Your {pet} can sleep by the fire, where it's warm and out of the draughts. Animals always know a storm's coming before I do." },
      },
      choices = {
        { text = "We'll keep clear of the docks, I promise.", next = "BACK", reply = "Thank you, and the fishermen will thank you too. They have very strong opinions.", fx = { align = { order = 1 } } },
        { text = "My companion goes where it pleases.", next = "BACK", reply = "Then the fishermen will have words with you, I am afraid. Keep it close, please.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "They're seasick, not foolish, or so I like to think, and the Sentinels walk the dock all night. If a bag goes missing in my inn, I'll know who was watching them, won't I?" },
      },
      choices = {
        { text = "I'd only warn them, Shaussiy.", next = "BACK", reply = "Then you are a kinder soul than most who ask that question, and I'll remember it.", fx = { align = { honor = 1 } } },
        { text = "Seasick folk make careless friends.", next = "BACK", reply = "They do, and the Sentinels make careful enemies. Be careful, please.", fx = { align = { honor = -1 } } },
        { text = "Who stays here, mostly?", next = "guests" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "You'll have a room, because I don't turn travelers away, but you'll have the one nearest the dock. My other guests are kaldorei, and they can smell what you carry even if they're too polite to say so." },
      },
      choices = {
        { text = "Fair. I'll keep to myself.", next = "BACK", reply = "My other guests will be grateful, and the room by the dock has a lovely view of the boats. You may find it suits you.", fx = { align = { light = 1 } } },
        { text = "Let them smell it. I'm not ashamed.", next = "BACK", reply = "Then you will sleep alone, and very well, I am sure. The room by the dock is yours.", fx = { align = { light = -1 } } },
        { text = "Any news from the boats?", next = "news" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Something in the land, I think, the same thing that is souring the moonkin and the furbolgs. The guests say they dream of the water, and I keep the tea strong and the lamps lit, but a prayer from you would help more than either." } },
      choices = {
        { text = "I'll bless the rooms before I leave tonight.", next = "BACK", reply = "The guests will be grateful, priest, for they have had too many bad nights lately. Bless the hearth room too, if you would.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bad dreams are only dreams. Let them be.", next = "BACK", reply = "Perhaps, but they are troubling my guests, and I would rather they did not. Bless the rooms anyway, if you can.", fx = { align = { light = -1 } } },
        { text = "Something else, Shaussiy.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than I would like, for the road north to Cliffspring is thick with bears gone mad, and the beach is no better. Half of them come back to me needing a bed and a bandage, and only the bed is my trade." } },
      choices = {
        { text = "I'll walk the north road and see it safer.", next = "BACK", reply = "The travellers will be grateful, paladin, because the north road has been terrible this season. Come back and tell me how you find it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Travellers should know the risks and look after themselves.", next = "BACK", reply = "They should, but they do not, and I am the one who tends them when they come back. Help if you can.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A few, mostly humans off the Menethil boat, and they always want to know why there's no portal to Darnassus from here. I tell them it's the kaldorei way to keep the arcane at arm's length, and then I give them tea, because a cup is gentler than an argument." },
      },
      choices = {
        { text = "Your people are wise to keep their distance.", next = "BACK", reply = "They are, and I am glad you understand. Some of them remember Zin-Azshari, and they still dream of what came through.", fx = { align = { order = 1 } } },
        { text = "Your people's fear of magic is long out of date.", next = "BACK", reply = "Perhaps, but they remember it as though it were yesterday. Please be patient with them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_murk = {
      lines = {
        { id = "ddm_default", text = "Happier and louder, both. For a season they were afraid to row past the point, and the boats came in half empty, so my kitchen went short too. Now there's grouper on the fire again, and the fishermen sing badly, and I wouldn't change a note." },
      },
      choices = {
        { text = "The murlocs will be back sooner or later.", next = "dd_murk2" },
        { text = "Something else, Shaussiy.", next = "BACK" },
      },
    },
    dd_murk2 = {
      lines = {
        { id = "ddm2_default", text = "Oh, I know it, and so does Sentinel Glynda. The Greymist have lived on that coast longer than Auberdine has stood, and they'll find a new brute to follow. But not this week, and in Darkshore one good week is worth celebrating." },
      },
      choices = {
        { text = "Then the Sentinels should drive them off the coast for good.", next = "BACK", reply = "Glynda would agree with you, though she hasn't the spears for it. I'll pass your words along when she comes in for her supper.", fx = { align = { light = -1 } } },
        { text = "It's their coast too. Just keep them from the boats.", next = "BACK", reply = "Spoken gently, and you may be right. I'd still not tell the fishermen that while they're drinking.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_murk", tags = { "news" }, when = { questDone = TODO_QUEST("WANTED: Murkdeep!") }, text = "The fishermen have been drinking to Murkdeep's death all week, and every one of them tells me it was you who took his head. Sit down, and let them buy you a cup before they run out of stories." },
        { id = "h_dd_remtravel", when = { questDone = TODO_QUEST("The Absent Minded Prospector") }, text = "That dwarf prospector you walked back from the southern dig still sits in my corner telling anyone who'll listen how you saved him. He forgets the middle of the story each time, but never the part with you in it." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } }, text = "You have the pale look of someone who has come back from the spirit healer more than once, friend. Darkshore is cruel to travellers who walk it alone, so rest here a while before you go out again." },
        { id = "o_peace_war", tags = { "news" }, when = { gossip = { topic = "peace", stance = "war" } },
          text = "Glynda says you've no patience for talk of peace with the orcs. I've no patience for brawls in my inn, so let's both keep our tempers." },
        { id = "h_default", text = "I am Shaussiy, and I keep the inn by the docks of Auberdine. My guests come off the boats from Teldrassil and Menethil, mostly, and nearly all arrive green with seasickness, though my people have sailed these waters since before the Sundering." },
        { id = "h_cerellean", when = { heardLine = "cerellean.h_default" },
          text = "So you've spoken with Cerellean. He stands on that dock every day, and I bring him tea, and he forgets to drink it, and I bring him more." },
        { id = "h_boards", when = { metBefore = true }, text = "The sailors swear the floorboards creak in a different key before a storm. I've started listening, and they're right." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Look at the moon on the water out there. On nights like this, I forgive the sea for everything." },
        { id = "h_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "shaussiy_flirt_no" } }, cooldown = "3d",
          text = "Oh, I've spilled the tea. You came in so quietly, with the moon behind you, and I quite forgot where the cup was." },
        { id = "h_flirt_yes", when = { flirt = true, npcFlagBefore = "shaussiy_flirt_yes" }, priority = 6, cooldown = "1d",
          text = "You're here, and I've counted the cups twice and still poured one too many. I think the extra one was always meant for you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and seasick, I'd guess, from the look of you. Sit down and I'll bring tea before you fall over." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your companion took the crossing better than you did, I see; they usually do." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, under my roof! Then you will understand why I say a prayer in every room before a guest sleeps in it, because nobody sleeps well on Darkshore just now." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin off the boat from Menethil! Sit down before you fall down, because that armour is no friend on a rolling deck." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I've a pot of tea that's gone cold while my guests forgot it, if you'd care to warm it, and I won't tell a soul you did." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Here, take some tea, and let the waves sing you to sleep after a night or two. I wonder, do your spirits sing as well?" },
      },
      again = {
        { id = "h_again", text = "Is there anything else, traveller? There's always tea on, and Elune's light on the water to drink it by." },
      },
      choices = {
        { text = "The fishermen seem happier since Murkdeep fell.", next = "dd_murk", when = { questDone = TODO_QUEST("WANTED: Murkdeep!") } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Who comes through the inn?", next = "guests" },
        { text = "I'd guess you hear the boats' news before anyone.", next = "news" },
        { text = "The crossing from Menethil nearly finished me.", next = "seasick", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "You pray over your guests' dreams?", next = "dreams_s", when = { class = { "PRIEST", "DRUID" } } },
        { text = "Your guests leave their bags lying about, I noticed.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do warriors come off the boats as green as everyone else?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is there room for my companion at the inn?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll need a room for the night, and some quiet.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why do your guests sleep so badly here?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do your guests come to any harm on these roads?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do many mages pass through your inn, Shaussiy?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the waves really sing, Shaussiy?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Do you ever leave the inn, Shaussiy?", next = "flirt", when = { flirt = true, ["not"] = { npcFlag = "shaussiy_flirt_no" } } },
        { text = "Just resting.", next = "END" },
      },
    },
    flirt = {
      lines = {
        { id = "fl_default", text = "Seldom, though when the moon is full I walk the shore as far as the old ruins and back. It's a quiet walk, and I've always thought it would be a pleasanter one with company, if the company were someone like you." },
        { id = "fl_again", when = { npcFlagBefore = "shaussiy_flirt_yes" }, priority = 5,
          text = "On the full moon, along the shore, as we spoke of, and I've been counting the nights to the next one. I've seen more moons than I could number, and I've never counted down to one before." },
      },
      choices = {
        { text = "Then walk the shore with me at the next full moon.", next = "flirt_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "shaussiy_flirt_yes" }, clear = { "shaussiy_flirt_no" } } } },
        { text = "I'll be grey before you've aged a day, Shaussiy.", next = "flirt_yes", when = { race = "Human" },
          reply = "Then I'll learn to love grey, and we'll make the most of the moons we have.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "shaussiy_flirt_yes" }, clear = { "shaussiy_flirt_no" } } } },
        { text = "I'd walk your shore, lass, if the damp kept out of my beard.", next = "flirt_yes", when = { race = "Dwarf" },
          reply = "Then I'll bring a towel for your beard, and the damp may do its worst.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "shaussiy_flirt_yes" }, clear = { "shaussiy_flirt_no" } } } },
        { text = "That's kind, Shaussiy, but I'll just take the tea.", next = "BACK",
          reply = "Then take it hot, for once, and forgive an innkeeper her daydreams. The sea puts strange ideas in all of us.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "shaussiy_flirt_no" }, clear = { "shaussiy_flirt_yes" } } } },
        { text = "I'm not looking for company, Shaussiy.", next = "BACK",
          reply = "Of course. I spoke out of turn, and Elune will laugh at me tonight, though gently. Rest well all the same.",
          fx = { trait = { stern = 1 }, npcFlag = { set = { "shaussiy_flirt_no" }, clear = { "shaussiy_flirt_yes" } } } },
      },
    },
    flirt_yes = {
      lines = { { id = "fy_default", text = "Then I'll bring the lantern, and you'll bring nothing but yourself, and we'll see whether the moonkin keep out of our way. Elune guard your dreams until then; I suspect mine will be pleasant." } },
      choices = {
        { text = "Until the full moon, Shaussiy.", next = "BACK",
          reply = "Until the full moon. I'll keep the tea warm, and I'll try very hard not to spill it." },
      },
    },
    guests = {
      lines = { { id = "gu_default", text = "Sailors from the Bravery, dwarves from the smithy, Sentinels off watch and young elves bound for Ashenvale. They all want the same thing, which is a dry bed." } },
      choices = {
        { text = "I didn't expect to find dwarves this far from home.", next = "dwarves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves = {
      lines = { { id = "dw_default", text = "Oh, they're about; they keep a little forge in town, and the Explorers' League digs to the south at Remtravel's Excavation. They complain about the damp and never leave." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    news = {
      lines = { { id = "nw_default", text = "The murlocs have been at the fishing boats again, and the Moonspray ran late twice this week. When the boats are late, the whole village holds its breath." } },
      choices = {
        { text = "Who looks after the village when the boats are late?", next = "news2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news2 = {
      lines = { { id = "nw2_default", text = "Elissa Starbreeze counts the crates, Glynda walks the beach, and Thundris sits up with his lamps. I put the kettle on, which is my share of the worrying." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    seasick = {
      lines = {
        { id = "ss_default", text = "You're not the first, love, and you won't be the last today. Sit by the fire with your back to the window, and don't look at the water until your stomach has forgiven you." },
        { id = "ss_dwarf", when = { race = "Dwarf" },
          text = "A dwarf who doesn't care for boats? I've had half of Ironforge at that table, green as moss and swearing it was the ale. Sit down, and I'll bring something plain." },
      },
      choices = {
        { text = "Thank you. I'll sit a while.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll be fine. Just point me to the elder.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    dreams_s = {
      lines = {
        { id = "ds_default", text = "Only a little, and only the way my mother did, a word to Elune as I bank the fire. Guests who come in from the Blackwood sleep badly, and it seems to help them, or at least it helps me." },
        { id = "ds_light", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
          text = "Only to Elune, and quietly, but I'd not mind if you added a word to your Light. The guests who come in from the Blackwood sleep badly, and two prayers can't hurt." },
      },
      choices = {
        { text = "I'll add mine tonight.", next = "BACK", reply = "Thank you, and Elune will hear us both. It helps, I think.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Prayers won't keep the furbolgs out. Good locks will.", next = "BACK", reply = "They will not, but locks will not keep out bad dreams either. I do both.", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Sailors talk once their stomachs settle, and I've heard a fair bit across this bar. Ask, and I'll tell you what I know." },
    },
    background = { { id = "tp_bg", text = "I keep the inn by the docks, and I've heard every traveller's story twice. Mine is mostly about leaky barrels." } },
    advice = { { id = "tp_ad", text = "Sleep on the landward side of the inn if you want quiet, and on the water side if you want to dream." } },
    booty_bay = { { id = "tp_booty_bay", text = "Every sailor who's been to Booty Bay drinks to it and curses it in the same breath. I'm told the beer's better there, so I never mention the place within earshot of my barrels." } },
    theramore = { { id = "tp_theramore", text = "Theramore folk come through on the boats, and they tip in silver and talk about Lady Proudmoore like she's their mother. Nice people, though they'd rather eat stew than moonberries." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's the goblin port across the water on the Barrens coast. Their ships are faster than ours and their sailors are louder, and both pay their bills, eventually." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Somebody always comes in talking about the Darkmoon Faire and how they won a prize. They never have the prize with them, I notice." } },
    _none = { { id = "tp_none", text = "Ask the elder, friend; Thundris knows everything worth knowing in Auberdine, and he has had a long while to learn it." } },
  },
}
