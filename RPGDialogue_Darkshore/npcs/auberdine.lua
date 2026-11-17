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
  spiritSensitive = true,
  notices = { "class", "race" },
  impression = {
    first = "Thundris Windweaver sees to Auberdine's daily needs, which lately means seeing to its fears. He listens far more than he speaks, and his lamps burn late because he sleeps so little.",
    third = "{name} met Thundris Windweaver, the steady elder of Auberdine, who means to learn why Darkshore is sickening.",
  },

  greetings = {
    { id = "g_elder", text = "Auberdine is glad of you, traveller. Rest and eat first, and when you are ready I may ask something of you, for the village has troubles enough to share." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned! Sit with an old elf a moment, and tell me what the forest told you." },
    { id = "g_boat", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "Fresh off the Bravery from Menethil, by the look of you. Find your land legs, then come and see me; Auberdine always has work for willing hands." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The sea, which casts up the dead, and the forest, where the furbolgs have gone mad. I listen to every fear, and I have few answers. If your spirits have one, I will hear it." } },
      choices = {
        { text = "Then we must find answers carefully, Thundris, and keep the town steady.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fear is a poor counsellor. Act boldly and stop listening.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I feel it in the roots and in the rivers, though I cannot yet name its source, and that troubles me more than the sickness itself. Some of the Circle would wait and dream on it, but Auberdine cannot wait, so I send whoever will go." } },
      choices = {
        { text = "The Circle should act together, not each druid on their own.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I won't wait for the Circle. I'll act wherever I see harm.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then you and I are both in the business of listening, though I hope for kinder reasons. If you hear anything of what is sickening the land, from the furbolgs or from the sailors at the dock, bring it to me first." },
      },
      choices = {
        { text = "You'll hear it first, Elder, and true.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll bring it once I've decided what it's worth.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What is sickening the land?", next = "sick" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Bound, by you, so that you might loose them again elsewhere? I have seen what comes of mortals who think they can leash the Legion's servants, and so has every kaldorei who lived through the Sundering. Fight them or leave Darkshore, warlock, for there is no third road here." },
      },
      choices = {
        { text = "Then I'll fight them, and bind nothing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your way only lets them come back, Elder.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Build them. Tradition won't stop a furbolg.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Heal the forest instead, and it will warn you again.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    mage_th = {
      big = true,
      lines = {
        { id = "mth_default", text = "You could, I'm sure, and that is exactly what frightens me. The demons in Bashal'Aran feed on what magic is left there, and I would rather it all went into the sea than into a stranger's satchel, however well meant." },
      },
      choices = {
        { text = "Knowledge left to rot helps no one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Then it should be destroyed. I'll help.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "You don't trust mages at all, do you?", next = "mage_th2" },
      },
    },
    mage_th2 = {
      lines = {
        { id = "mth2_default", text = "I trust that you mean well, which is not the same thing. My people trusted Highborne who meant well, and we sleep in villages like this one now because the old cities are at the bottom of the sea." },
      },
      choices = { { text = "That's fair. Something else.", next = "BACK", fx = { affinity = 1 } } },
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
        { text = "Seal the Deeps for good, before anything else crawls out.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leave it open. Whatever's left down there is worth studying.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Do you know what they worshipped down there?", next = "xcl_bfd2" },
      },
    },
    xcl_bfd2 = {
      lines = { { id = "xcl_bfd2_default", text = "Only what the old texts say, which is that the temple was raised to Elune and sank when the Well of Eternity tore the world apart. Something else has moved into her house since then, and the cultists who serve it call it by names I would rather not repeat in my own village." } },
      choices = {
        { text = "Then I won't ask you to say them, Elder.", next = "BACK" },
      },
    },
    hello = {
      lines = {
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
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle, and kaldorei besides. Then you will feel the sickness in this land as I do, and you will understand why my lamps burn so late." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Auberdine's lamps burn later than any in Darnassus, because the boats come in at all hours. I sleep little these days in any case." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who speaks with spirits. Auberdine has fears enough these days, so I will ask plainly: do your spirits say what troubles this coast?" },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I have time, and Auberdine has troubles." },
        { id = "h_again2", text = "Go on. An elder's work is mostly listening." },
      },
      choices = {
        { text = "What's sickening the land?", next = "sick" },
        { text = "Why trust the Silver Hand?", next = "silverhand" },
        { text = "What lies in the old ruins nearby?", next = "ruins" },
        { text = "What is at the Master's Glaive?", next = "glaive" },
        { text = "I'm a paladin. What can I do?", next = "paladin", when = { class = "PALADIN" } },
        { text = "Can a priest help against this corruption?", next = "priest_t", when = { class = "PRIEST" } },
        { text = "I came over on the Bravery from Menethil.", next = "boat", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Auberdine needs blades on its walls. I have one.", next = "warrior_th", when = { class = "WARRIOR" } },
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
        { text = "I'll find the source.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Felwood's rot is the kaldorei's trouble, not mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Felwood?", next = "felwood" },
      },
    },
    felwood = {
      lines = { { id = "f_default", text = "Felwood is where the demons trod during the Third War, and the forest there never healed. Now its sickness runs down the rivers into its neighbours, and I have seen its like before, long ago." } },
      choices = {
        { text = "You've seen it before?", next = "felwood2" },
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
        { text = "That's generous of you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd judge an order by the men it lets fall.", next = "BACK", fx = { align = { honor = -1 } } },
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
      lines = { { id = "gl_default", text = "South, past the Grove of the Ancients, a great glaive stands in the bones of something very old. Onu says an old lord of the earth fell there, and now Twilight's Hammer cultists dig around it." } },
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
        { text = "I'll remember.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll find my own way to a gem, thank you.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    priest_t = {
      lines = { { id = "pr_default", text = "Prayer will not cleanse a river by itself, but healers are needed whenever the furbolgs come out of the trees. And Gwennyth by the inn would welcome a priest's eye on her poor sea creatures." } },
      choices = {
        { text = "I'll go and see her.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Her sea creatures are past saving, and I won't waste prayers on them.", next = "BACK", fx = { align = { light = -1 } } },
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

  topics = {
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
    _none = { { id = "tp_none", text = "I don't know, but I will find someone who does." } },
  },
}

P:NPC {
  key = "terenthis", id = TODO_NPC("Terenthis"), name = "Terenthis",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "auberdine" }, temper = { "intent" }, values = { "determined", "curious" },
  notices = { "form", "class" },
  impression = {
    first = "Whatever Fel Moss Terenthis burns grows back, and he means to keep burning it all the same. He insists the furbolgs are sick rather than evil, and he seems to need someone to believe it with him.",
    third = "{name} met Terenthis, a druid come to Darkshore to learn how far the Fel Moss has spread and how to end it.",
  },

  greetings = {
    { id = "g_moss", text = "Careful where you step, friend; that moss on your boots is exactly what I came here to stop." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, thank Elune! I need someone who can feel what is wrong with this place, not merely see it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I must believe it, or I am only killing old friends. The fel moss poisons them, and the earth itself suffers for it. Your spirits of the earth must feel that." } },
      choices = {
        { text = "Then I believe you, Terenthis. The sick deserve healing first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Mercy for the mad gets Sentinels killed. Defend Auberdine first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Hard, because they won't stop once they've started, and without hatred, because none of this is their fault. The Fel Moss is in their food and their water, and if you bring me what I need, I may yet find a way to burn it out of them." } },
      choices = {
        { text = "I'll fight them without hatred. They're victims.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sick or not, they'll fall to my blade.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Green on their muzzles and a stagger in their walk, which means the Fel Moss has reached their blood. Follow their trail back to where they eat and you'll find the moss growing thickest there, and that is where I need you to look." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} from eating anything near the Blackwood camps, I beg you. If the moss can do that to a furbolg, I don't want to know what it would do to a beast." },
      },
      choices = {
        { text = "I'll track it back to its source.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Find the source yourself. I'll thin the furbolgs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Perhaps not, and I would rather have a mage's word on that than nothing. The moss is fel, and fel is the Legion's, and your craft and theirs once drank from the same Well, which is a thing my people have not forgotten." },
      },
      choices = {
        { text = "Then I'll help you burn it out.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel or arcane, power is power.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What is the moss, exactly?", next = "moss" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then learn it, and quickly, for every day the Blackwood eat from those tainted stores, more of them turn. Watch what they eat and where it comes from, and tell me before you do anything else." },
      },
      choices = {
        { text = "I'll watch only, and tell you true.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If their chieftain's behind it, he dies in his sleep.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Can the furbolgs be turned back?", next = "turn" },
      },
    },
    warlock_te = {
      big = true,
      lines = {
        { id = "wte_default", text = "I don't doubt that you know it, and I wish you didn't. If you can tell me where the taint is strongest without feeding it, then for once I will be glad of what you are, and I won't ask how you learned to smell it." },
      },
      choices = {
        { text = "I'll trace it to its source and burn it out.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "The power in it could be put to use.", next = "BACK", fx = { align = { light = -1 }, affinity = -2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Pray for them, if you would, and pray as you would for any sick creature rather than for an enemy. I burn the Fel Moss, but burning does nothing for the furbolg who has already eaten it." } },
      choices = {
        { text = "I'll pray for them. Sick is not the same as wicked.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer is wasted on beasts that kill travellers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Mercifully, where you can, and swiftly where you cannot, for a furbolg too far gone will not thank you for hesitating. But remember that every one you kill is a creature something else ruined first." } },
      choices = {
        { text = "I'll spare any I can, and grieve the ones I can't.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A mad beast is a mad beast. I won't hesitate.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Terenthis. I came to Darkshore to learn how far the Fel Moss has spread, and it is farther than I feared, so I mean to find out why and put an end to it." },
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
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Then perhaps you will believe me when I say the furbolgs are sick, not evil. The fel moss grows back no matter how much I burn." },
      },
      again = {
        { id = "h_again", text = "What else? The moss won't wait, but I can spare you a moment." },
        { id = "h_again2", text = "Ask, and quickly, if you would; I'm due back in the hills." },
      },
      choices = {
        { text = "What is Fel Moss?", next = "moss" },
        { text = "Who is Volcor?", next = "volcor" },
        { text = "Why do the furbolgs turn?", next = "turn" },
        { text = "I can feel the sickness in the land.", next = "druid_t", when = { class = "DRUID" } },
        { text = "I know fel when I see it. This moss is fel.", next = "warlock_te", when = { class = "WARLOCK" } },
        { text = "This moss isn't arcane. I'd know if it were.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The furbolgs won't see me. I could learn what drives them.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How should a warrior fight the Blackwood furbolgs?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What signs of the corruption should a hunter look for?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is there anything a priest can do for the furbolgs?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How should a paladin deal with the corrupted furbolgs?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you truly believe the furbolgs can be saved, Terenthis?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2 } },
      },
    },
    moss = {
      big = true,
      lines = {
        { id = "m_default", text = "It is moss that grew where demons walked, and it kept something of them in it. The furbolgs eat it or sleep on it, and it changes them, slowly at first and then all at once." },
      },
      choices = {
        { text = "Then we cut it out.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Then the furbolgs who've turned savage have to be put down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Can it be cured?", next = "moss2" },
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
    _none = { { id = "tp_none", text = "Not now, I'm afraid. The moss comes first, and everything else after." } },
  },
}

P:NPC {
  key = "gwennyth", id = TODO_NPC("Gwennyth Bly'Leggonde"), name = "Gwennyth Bly'Leggonde",
  bible = "bibles/auberdine.md", role = "priest", tier = "quest",
  communities = { "auberdine" }, temper = { "gentle" }, values = { "devout", "curious" },
  notices = { "class" },
  impression = {
    first = "The Temple of the Moon sent Gwennyth to tend Auberdine's people, and she found the beach strewn with dead sea creatures instead. She keeps one eye on the tide, as if expecting another.",
    third = "{name} met Gwennyth Bly'Leggonde of the Sisterhood, who wants to know why the sea keeps giving up its dead on Darkshore's shore.",
  },

  greetings = {
    { id = "g_temple", text = "The Temple of the Moon sent me to help Auberdine, though the sea, it turns out, has its own ideas about what help means." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I do not know, and it frightens me. Elune has not answered my prayers on it. Perhaps your water spirits know what Elune keeps silent." } },
      choices = {
        { text = "Keep praying, Gwennyth. Elune and the spirits may both answer.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Elune is silent. Trust the spirits instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I pray not, because whatever killed something that size would make short work of Auberdine's walls. The bodies lie along the beach to the north, so if you go to look, take your shield and keep one eye on the water." } },
      choices = {
        { text = "If it comes ashore, I'll stand between it and Auberdine.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Whatever it is, it isn't my fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That's my hope, because I can tell you they died but not how. Look for wounds a beast would make, or the lack of them, because if nothing bit them, then something worse than teeth is at work in the sea." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps sniffing toward the shore, and I don't think it likes what it smells. Animals know when the sea is wrong." },
      },
      choices = {
        { text = "I'll study the bodies and tell you what I find.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dead is dead. It doesn't matter how.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "There is grief on that shore, and nothing else that you should touch. Elune keeps the dead, warlock, and if I find you have meddled with them, I will not be as gentle as I am now." },
      },
      choices = {
        { text = "I'll leave the dead in peace.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The dead don't need what they leave behind.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What killed them?", next = "killing" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "The Sisterhood objects to arrogance, and too many mages have carried it. Elune's light asks only that you remember you are small beneath the moon, which is a lesson Azshara never learned." },
      },
      choices = {
        { text = "Then I'll walk humbly here, Sister.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some arrogance is earned, Sister.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Then I'll pray with you here, as long as it takes.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're dead fish. Prayer won't bring the answer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It may, and that is why I watch the tide, for creatures this large do not die without a reason. If something in the deep is killing them, I would rather a paladin knew of it than not." } },
      choices = {
        { text = "Then I'll stand watch with you until we know.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The sea is the Sentinels' problem, not mine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, sister.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Elune's light falls on every shore, and it doesn't ask what a soul does after dark. I'd only ask you to remember that the people here are frightened by those carcasses on the beach, so whatever your work is, don't add to their fears." },
      },
      choices = {
        { text = "I'll keep my work far from Auberdine's people.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Their fears aren't my concern, priestess.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Gwennyth, of the Sisterhood. I came to tend Auberdine's troubled people and found the shore strewn with great dead creatures, as if the sea were giving up its dead, and I would like to know why." },
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
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You move like someone who's used to not being seen, and I'll not ask why. The Sisterhood tends everyone who comes to Auberdine, the quiet ones included." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The Temple sent me to tend Auberdine's people, and instead I tend the dead creatures the sea casts up. Forgive me if I am wary of spirit-talk." },
      },
      again = {
        { id = "h_again", text = "What else? I'm listening, though I keep one eye on the tide." },
        { id = "h_again2", text = "Ask what you like; the poor creatures aren't going anywhere." },
      },
      choices = {
        { text = "Do you miss the Temple?", next = "temple" },
        { text = "What's killing them?", next = "killing" },
        { text = "Why do the murlocs gather on them?", next = "murlocs" },
        { text = "Could a priest of the Light help you?", next = "priest_g", when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "I've swum out to the great bodies in seal form.", next = "druid_gw", when = { class = "DRUID" } },
        { text = "Death on that shore. There's power in it.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Sisterhood object to mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could whatever killed the sea creatures come ashore?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
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
      lines = { { id = "pg_default", text = "You could. Walk the shore with me some evening and tell me what you sense in those remains; your Light and our Mother Moon may notice different things." } },
      choices = {
        { text = "I'd be glad to.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll leave the dead creatures to your Mother Moon.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Sisterhood teaches us to listen before we speak, and I have listened to a great deal on this shore. Ask what you need to." },
    },
    background = { { id = "tp_bg", text = "The Temple of the Moon sent me to see to Auberdine's troubles. I expected sick villagers, not dead threshers." } },
    advice = { { id = "tp_ad", text = "Stay out of the water near the carcasses, because whatever the murlocs leave behind, something larger may come for." } },
    sisterhood_of_elune = { { id = "tp_sister", text = "We go where we are needed, and the Temple decided I was needed here, among the bones." } },
    _none = { { id = "tp_none", text = "I'm sorry. I only know the shore, and lately not even that." } },
  },
}

P:NPC {
  key = "glynda", id = TODO_NPC("Sentinel Glynda Nal'Shea"), name = "Sentinel Glynda Nal'Shea",
  bible = "bibles/auberdine.md", role = "soldier", tier = "quest",
  communities = { "auberdine" }, temper = { "urgent" }, values = { "protective", "dutiful" },
  notices = { "kit" },
  impression = {
    first = "Sentinel Glynda Nal'Shea walks the beach every morning counting murloc sign. She told me plainly that the Sentinels watch everyone, and I decided not to take it personally.",
    third = "{name} met Sentinel Glynda Nal'Shea, who holds back murlocs on Auberdine's beaches and corruption in its groves.",
  },

  greetings = {
    { id = "g_watch", text = "If you're staying in Auberdine, then you're under the Sentinels' eye; don't take it personally, for we watch everyone." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The murlocs got their claws into you, by the look of it. Get yourself mended, then go and pay them back." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I count murloc sign, mostly, and it grows. Your water spirits might tell me where they come from before my Sentinels must find out the hard way." } },
      choices = {
        { text = "Then I will help you watch the beach, Glynda.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Murlocs are murlocs. Kill them and be done.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Well enough, though we see the trouble differently, because a druid wants to heal the sick bear and a Sentinel wants it away from the road before it kills someone. Most days I let the druids try first, and I keep my bow strung while they do." } },
      choices = {
        { text = "Heal it first. A sick beast is not an enemy.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it threatens the road, put it down quickly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then thin them, and quickly, for they have been creeping further up the beach every night. Murkdeep leads them now, and if you can get near enough to see him, you will have done more than my Sentinels." },
        { id = "xro_nightelf", when = { race = "NightElf" }, text = "Then thin them, sister's child, for they creep further up the beach every night and you move as quietly as any Sentinel. Murkdeep leads them now, and if you can get near enough to see him, you will have done more than most." },
      },
      choices = {
        { text = "I'll bring Murkdeep down face to face.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Murkdeep won't see the blade that kills him.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who is Murkdeep?", next = "murkdeep" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "The Sentinels do not usually fight beside mages, and some of my sisters would sooner you didn't. But I am short of hands, so stay where I put you and do not set the groves alight." },
      },
      choices = {
        { text = "Where you put me, Sentinel.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight where I'm of most use.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where are the Sentinels needed most?", next = "thin" },
      },
    },
    warrior_gl = {
      lines = {
        { id = "wgl_default", text = "I'll put you anywhere I can, but the watch here isn't a line; it's a shore, a road and a boat, and the murlocs come from the water while the furbolgs come from the trees. Can you stand facing two ways at once?" },
        { id = "wgl_watch", when = { origin = "nightelf_auberdine_watch" },
          text = "You've stood this watch before; I remember you, I think, or someone with your stance. The murlocs have grown bolder since you left, and I don't have anyone left to tell it to who'd understand." },
      },
      choices = {
        { text = "Facing two ways is a warrior's whole job.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2, standing = { auberdine = 1 } } },
        { text = "I'll take the murlocs. Leave the trees to someone else.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They need more than I can give them, and most would rather bleed than ask. If you are walking toward Cliffspring or the Blackwood, look in on any Sentinel you pass, whatever she tells you." } },
      choices = {
        { text = "I'll tend any Sentinel I meet, whether she asks or not.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they won't ask, that's their own choice.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Against Murkdeep and his murlocs on the southern beach, for they drag off anyone who walks alone. The corruption in the groves is worse, but a hammer cannot fix that, and a hammer can certainly fix Murkdeep." } },
      choices = {
        { text = "Then I'll break Murkdeep's hold on that beach.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Murlocs aren't worth a paladin's time.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I count what I see: the furbolgs maddened, the moonkin gone wild and the bears with a sourness in their blood. Something fouls this land, and your craft draws from the same well the Legion did, so forgive me if I watch your hands." },
      },
      choices = {
        { text = "Watch, then. I'll prove you wrong at the murloc camps.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My hands are my own business, Sentinel.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xcl_bfd = {
      big = true,
      lines = {
        { id = "xcl_bfd_default", text = "Then you've done what the Sentinels couldn't, because Ashenvale takes every bow we have and the Deeps would have swallowed a whole company. I lost two sisters to that water, and I'd have gone in after them myself if anyone had let me, so you'll understand why I'm grateful." },
      },
      choices = {
        { text = "Your sisters are avenged, Glynda. I'd do it again.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I went down for what lay below, not for anyone's vengeance.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { id = "h_cl_bfd", tags = { "news" }, when = { cleared = "Blackfathom Deeps", faction = "Alliance" }, text = "They say in Auberdine that you went down into Blackfathom Deeps and cut your way to the very bottom. The murlocs on my beach haven't noticed yet, but the naga have, and they've been keeping to deeper water since." },
        { id = "h_default", key = true, text = "I am Sentinel Glynda Nal'Shea. Corruption creeps into the groves and murlocs creep up the beaches, and I am only one Sentinel, so I could use another pair of hands." },
        { id = "h_crystal", tags = { "news" }, when = { questActive = TODO_QUEST("The Red Crystal") },
          text = "The reports say hostile moonkin are gathering around a large red crystal along the eastern mountains. Find out whether it truly exists, and whatever you do, don't touch it." },
        { id = "h_cascade", when = { questActive = TODO_QUEST("As Water Cascades") },
          text = "Fill this tube at our moonwell and pour it over the crystal, for water that potent should tell us what it's made of. Be careful; if it came from Felwood, as I suspect, it could be dangerous." },
        { id = "h_murkdeep", tags = { "news" }, when = { questActive = TODO_QUEST("WANTED: Murkdeep!") },
          text = "Murkdeep is the murlocs' great brute, and his kind have been sinking the boats that leave our harbour. The council has put a price on his head, so go and collect it." },
        { id = "h_beach", when = { metBefore = true }, text = "I walk the beach every morning and find more murloc sign each time, and every evening there is a little less of it, thanks to people like you." },
        { id = "h_fragments", tags = { "news" }, when = { questActive = TODO_QUEST("The Fragments Within") },
          text = "Bone, inside the crystal, and half a jaw that may have belonged to someone who walked on two legs? That answers one question and raises a dozen more, so I'll take it to the council." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Good, because the Sentinels I send up the coast come back with wounds that do not close cleanly, and I have too few hands to mend them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your kind at Maestra's Post fight hard, I am told, so I will not waste your strength on small things." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and kaldorei by the look of you. The groves along this shore are sickening faster than the Circle can tend them, so I am glad to see another of you on the beach." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I watch the beach for murlocs and the groves for corruption, and I'll be watching you as well until I know which of the two you are." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Greymist", min = 30 } },
          text = "The beach has been quieter since you started on the Greymist, and I count fewer tracks each morning. I am still only one Sentinel, but this week I have felt like two." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The Sentinels watch everyone, and I will watch you too. Do not take it personally." },
      },
      again = {
        { id = "h_again", text = "What else? I'm due on the beach soon." },
        { id = "h_again2", text = "Speak, but keep it short; the tide is turning." },
      },
      choices = {
        { text = "What happened to the moonkin?", next = "moonkin" },
        { text = "Who is Murkdeep?", next = "murkdeep" },
        { text = "Where are the Sentinels stretched thinnest?", next = "thin" },
        { text = "What did the crystal hide?", next = "crystal", when = { questDone = TODO_QUEST("The Fragments Within") } },
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
        { text = "I'll help.", next = "END", fx = { affinity = 2, standing = { auberdine = 1 } } },
      },
    },
    moonkin = {
      big = true,
      lines = {
        { id = "m_default", text = "They were thought to be gentle, almost mystical creatures, and some still revere them. Then that crystal drew them in, and now they turn on anyone who comes near; it isn't their fault, but that doesn't blunt their claws." },
      },
      choices = {
        { text = "I'll be careful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Shouldn't we pity them?", next = "moonkin2" },
      },
    },
    moonkin2 = {
      lines = { { id = "m2_default", text = "Pity them if you like, but keep your distance while you do. Auberdine's safety means I have to take a more realistic view than the people who write poems about them." } },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll pity them anyway.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
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
    _none = { { id = "tp_none", text = "Ask the elder, for I only watch the roads." } },
  },
}

P:NPC {
  key = "cerellean", id = TODO_NPC("Cerellean Whiteclaw"), name = "Cerellean Whiteclaw",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "auberdine" }, temper = { "melancholy" }, values = { "devoted", "loyal" },
  notices = { "class" },
  impression = {
    first = "On the Auberdine dock, Cerellean Whiteclaw watches the water as though someone might walk out of it. He slept for thousands of years dreaming of Anaya, and he has never stopped grieving her.",
    third = "{name} met Cerellean Whiteclaw, who has mourned his beloved Anaya of Ameth'Aran since the Sundering.",
  },

  greetings = {
    { id = "g_dock", text = "Hm? Forgive me; I was watching the water. I do a great deal of that." },
    { id = "g_after", when = { questDone = TODO_QUEST("For Love Eternal") }, text = "You freed her. I will never be able to thank you properly, but I will try, every time I see you." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Have you slept the long sleep yet? Don't, if you can help it, for the dreams find out what you love and keep it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "She was my beloved, lost while I slept for thousands of years. I dreamed of her the whole time. Your spirits may know whether she rests." } },
      choices = {
        { text = "Then I hope you find peace, Cerellean.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The past is gone. Let her go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "She loved to walk the woods of Ameth'Aran at night and watch the moonstalkers on the cliffs, and she said that watching was the first duty of anyone who loved the wild. I think of her every time I see one, and I envy the hunters who still walk there." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has the same quiet eyes as the beasts she loved. Be good to it, for we do not keep what we love as long as we think." },
      },
      choices = {
        { text = "I'll honor her memory when I walk those woods.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The past is gone. Walk the woods for yourself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "It was, and Anaya was of the Highborne, though she was gentler than the rest of them. Her people's magic doomed her city, and I have never known whether to hate it or to wish I understood it." },
      },
      choices = {
        { text = "Some power is better left unlearned.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic didn't doom her. The ones who misused it did.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who was Anaya?", next = "anaya" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "What I am looking for is her, or what is left of her, and the ruins are full of the restless dead. Go quietly, then, for they do not rest well, and they do not welcome the living." },
      },
      choices = {
        { text = "I'll go, and bring back only the truth.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll go, and take what the dead won't miss.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's in Ameth'Aran now?", next = "ameth" },
      },
    },
    warrior_ce = {
      lines = {
        { id = "wce_default", text = "I did fight, warrior, at the end, with a druid's claws and a heart that was already breaking. Fighting did not save Ameth'Aran; it only meant I was alive to grieve it, and some nights that feels like the worse fate." },
      },
      choices = {
        { text = "Fighting was still right, even if it failed.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then maybe you should have fled with her.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "I'm sorry. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "She troubles me less than the not knowing does, for I never learned if she found peace after I left Ameth'Aran. If your prayers reach the dead at all, I would ask you to say one for her, by name." } },
      choices = {
        { text = "I'll pray for Anaya by name. She deserves peace.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead should be let go, Cerellean, not prayed over.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Restless spirits and worse, for the place was cursed long before I slept, and the curse did not end when I did. If you go there, I would ask only that you strike nothing that still looks like one of my people without cause." } },
      choices = {
        { text = "I'll show the dead there what mercy I can.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they attack me, I'll put them all down.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The Highborne who called the Legion down, and the restless dead of my people, and somewhere among them, my Anaya. I've heard that warlocks bind spirits to their will, so I'll ask you plainly to leave hers alone." },
      },
      choices = {
        { text = "I swear I'll not touch her spirit.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The dead can be useful. I'll promise nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Cerellean Whiteclaw. Before the Sundering I loved a woman named Anaya, of Ameth'Aran, and the war took her and her city; then I slept for thousands of years, and she was in every dream." },
        { id = "h_love", tags = { "news" }, when = { questActive = TODO_QUEST("For Love Eternal") },
          text = "Her spirit still walks the ruins of Ameth'Aran, and it must be freed, but I cannot raise my hand against her even now. Please do what I cannot, and bring me her pendant." },
        { id = "h_after", when = { questDone = TODO_QUEST("For Love Eternal") },
          text = "She came to me afterwards, just for a moment, and told me we will find each other again. I believe her; I have waited ten thousand years, and I can wait a little longer." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Anaya loved the moonstalkers of these shores, and she would have liked to see you walk among them." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Do you know anything of spirits that will not rest? I have asked everyone else, and they look at me as though I were a ghost myself." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I have heard your order buries its dead with honour, which is more than the ruins of Ameth'Aran ever gave mine." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "There's a cold about you that reminds me of Ameth'Aran, warlock. I hope you've come to Darkshore for some reason other than to stir what sleeps there." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Do your spirits walk the water? I watch it, as if Anaya might step out of it." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. I have nothing but time, and the water." },
        { id = "h_again2", text = "Go on, please; I'm listening, truly." },
      },
      choices = {
        { text = "Tell me about Anaya.", next = "anaya" },
        { text = "How did you find her spirit?", next = "found" },
        { text = "What was Ameth'Aran?", next = "ameth" },
        { text = "Should I fear the long sleep?", next = "sleep_d", when = { class = "DRUID" } },
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
      lines = { { id = "am_default", text = "It was a city of the Highborne's age, beautiful in the way of those days. Now it is ruins and ghosts, and Thundris sends young people there to carry off what is left of the old magic." } },
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
    _none = { { id = "tp_none", text = "I'm sorry; my mind is on the water, and on older things." } },
  },
}

P:NPC {
  key = "shaussiy", id = TODO_NPC("Innkeeper Shaussiy"), name = "Innkeeper Shaussiy",
  bible = "bibles/auberdine.md", role = "innkeeper", tier = "service",
  communities = { "auberdine" }, temper = { "warm" }, values = { "kind", "devout" },
  notices = { "weary" },
  impression = {
    first = "Innkeeper Shaussiy brings tea to everyone, even to those who forget to drink it. She claims the waves will sing me to sleep after a night or two, and she listens for storms in the floorboards.",
    third = "{name} found a bed at Innkeeper Shaussiy's inn by the Auberdine docks, where nearly every guest arrives seasick.",
  },

  greetings = {
    { id = "g_rest", text = "Your spirit is tired, I can tell. Rest here; the waves are loud, but they'll sing you to sleep after a night or two." },
    { id = "g_home", when = { homeInn = { "Auberdine" } }, text = "Auberdine again! The sea air is good for you, mostly." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Furbolgs, murlocs or moonkin? It's always one of the three. Sit down, and Elune guard your dreams tonight." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They do, if you listen. Your water spirits must hear them better than I do. Rest, and listen." } },
      choices = {
        { text = "I will listen gladly, Shaussiy. Thank you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Waves are noise. I prefer silence.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Greener, often, because they wear their armor on the crossing and it rolls with the ship. I tell them to take it off at Rut'theran and none of them ever listen, so I keep the tea warm." } },
      choices = {
        { text = "Next time I'll take the advice and leave it off.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My armor stays on. You never know what's coming.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "There's always room, though I keep the cats away from the docks, because the fishermen have opinions about their catch. The waves will sing you both to sleep after a night or two, I promise." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can sleep by the fire, where it's warmer and it won't hear the storms in the floorboards. Animals always know a storm's coming before I do." },
      },
      choices = {
        { text = "We'll keep clear of the docks, I promise.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My companion goes where it pleases.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "They're seasick, not foolish, or so I like to think, and the Sentinels walk the dock all night. If a bag goes missing in my inn, I'll know who was watching them, won't I?" },
      },
      choices = {
        { text = "I'd only warn them, Shaussiy.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Seasick folk make careless friends.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who stays here, mostly?", next = "guests" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "You'll have a room, because I don't turn travelers away, but you'll have the one nearest the dock. My other guests are kaldorei, and they can smell what you carry even if they're too polite to say so." },
      },
      choices = {
        { text = "Fair. I'll keep to myself.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them smell it. I'm not ashamed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Any news from the boats?", next = "news" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Something in the land, I think, the same thing that is souring the moonkin and the furbolgs. The guests say they dream of the water, and I keep the tea strong and the lamps lit, but a prayer from you would help more than either." } },
      choices = {
        { text = "I'll bless the rooms before I leave tonight.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bad dreams are only dreams. Let them be.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Shaussiy.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than I would like, for the road north to Cliffspring is thick with bears gone mad, and the beach is no better. Half of them come back to me needing a bed and a bandage, and only the bed is my trade." } },
      choices = {
        { text = "I'll walk the north road and see it safer.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Travellers should know the risks and look after themselves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A few, mostly humans off the Menethil boat, and they always want to know why there's no portal to Darnassus from here. I tell them it's the kaldorei way to keep the arcane at arm's length, and then I give them tea, because a cup is gentler than an argument." },
      },
      choices = {
        { text = "Your people are wise to keep their distance.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your people's fear of magic is long out of date.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Shaussiy, and I keep the inn by the docks. My guests come off the boats from Teldrassil and Menethil, mostly, and they all arrive seasick." },
        { id = "h_cerellean", when = { heardLine = "cerellean.h_default" },
          text = "So you've spoken with Cerellean. He stands on that dock every day, and I bring him tea, and he forgets to drink it, and I bring him more." },
        { id = "h_boards", when = { metBefore = true }, text = "The sailors swear the floorboards creak in a different key before a storm. I've started listening, and they're right." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Look at the moon on the water out there. On nights like this, I forgive the sea for everything." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and seasick, I'd guess, from the look of you. Sit down and I'll bring tea before you fall over." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your companion took the crossing better than you did, I see; they usually do." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, under my roof! Then you will understand why I say a prayer in every room before a guest sleeps in it, because nobody sleeps well on Darkshore just now." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin off the boat from Menethil! Sit down before you fall down, because that armour is no friend on a rolling deck." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I've a pot of tea that's gone cold while my guests forgot it, if you'd care to warm it, and I won't tell a soul you did." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Here, tea. The waves will sing you to sleep after a night or two. Do your spirits sing too?" },
      },
      again = {
        { id = "h_again", text = "Is there anything else, love? There's always tea on." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Who comes through the inn?", next = "guests" },
        { text = "Any news from the boats?", next = "news" },
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
        { text = "Just resting.", next = "END" },
      },
    },
    guests = {
      lines = { { id = "gu_default", text = "Sailors from the Bravery, dwarves from the smithy, Sentinels off watch and young elves bound for Ashenvale. They all want the same thing, which is a dry bed." } },
      choices = {
        { text = "Dwarves, here?", next = "dwarves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves = {
      lines = { { id = "dw_default", text = "Oh yes, they keep a little forge in town, and the Explorers' League digs to the south at Remtravel's Excavation. They complain about the damp and never leave." } },
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
        { text = "I'll add mine tonight.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Prayers won't keep the furbolgs out. Good locks will.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Sailors talk once their stomachs settle, and I've heard a fair bit across this bar. Ask, and I'll tell you what I know." },
    },
    background = { { id = "tp_bg", text = "I keep the inn by the docks, and I've heard every traveller's story twice. Mine isn't nearly as interesting." } },
    advice = { { id = "tp_ad", text = "Sleep on the landward side of the inn if you want quiet, and on the water side if you want to dream." } },
    _none = { { id = "tp_none", text = "Ask the elder, love; he knows everything worth knowing in Auberdine." } },
  },
}
