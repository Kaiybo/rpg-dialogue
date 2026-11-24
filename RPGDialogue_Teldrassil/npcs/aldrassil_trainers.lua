-- Aldrassil's class trainers in Shadowglen: Mardant Strongoak (druid), Alyissia (warrior), Frahun
-- Shadewhisper (rogue), Ayanna Everstride (hunter) and Shanda (priest). Each receives a new student's
-- sigil from Conservator Ilthalaine (Classic sigil quests). Voice: bibles/aldrassil_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Mardant Strongoak (druid trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "mardant", id = TODO_NPC("Mardant Strongoak"), name = "Mardant Strongoak", title = "Druid Trainer",
  bible = "bibles/aldrassil_trainers.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "calm", "patient" }, values = { "nature", "wise" },
  notices = { "class", "form" },

  impression = {
    first = "He wants the spirits listened to before anyone tries to command them.",
    third = "{name} met Mardant Strongoak, the druid trainer in Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "Be still a moment. Can you hear the tree breathing? Most can't, at first." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, young one. The tree remembers you, and so do I." },
    { id = "g_sigil", when = { questActive = TODO_QUEST("Verdant Sigil") },
      text = "Ah, you carry the Verdant Sigil. Then Ilthalaine has sent you to me, and your training begins." },
    { id = "dr_g_ten", when = { class = "DRUID", minLevel = 10 }, text = "You've outgrown Shadowglen, young one, and the bear is close behind your eyes now. Kal will tell you where to go, but come back and tell me when you've met it." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = { "bear", "cat", "travel" } },
      text = "You wear the shape well, though you hold it as if it might slip. Breathe into it, and it will sit easier." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I am Mardant Strongoak, and I teach the druids who wake in Shadowglen. My duty is to help you understand what the spirits of the forest are telling you, and they speak slowly, in roots and seasons, so you must learn to be slow with them." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, newly woken. Good; sit with me, and we'll begin with listening, because a druid who can't listen is only a person with a stick." },
        { id = "h_other", when = { class = { "WARRIOR", "ROGUE", "HUNTER", "PRIEST", "MAGE", "WARLOCK", "PALADIN" } },
          text = "You don't walk the druid's path, I can see it, but you're welcome to sit here anyway. The tree doesn't mind who listens." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask. We have time; trees always have time." },
        { id = "h_again3", text = "Breathe, and ask the next thing. There's no hurry in here." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What do the spirits tell you?", next = "spirits" },
        { text = "What's wrong with the creatures of Shadowglen?", next = "wrong" },
        { text = "What comes after Shadowglen, for a druid?", next = "after", when = { class = "DRUID" } },
        { text = "Wrath or Healing Touch. Which should I learn first?", next = "d_wrath", when = { class = "DRUID", maxLevel = 10 } },
        { text = "Will I sleep in the Dream one day, as your teacher did?", next = "d_dream", when = { class = "DRUID", race = "NightElf" } },
        { text = "Who taught you?", next = "taught" },
        { text = "You speak as slowly as a tree grows.", next = "slow" },
        { text = "Could someone like me ever become a druid?", next = "outsiders", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Thank you, Mardant.", next = "END" },
      },
    },
    d_wrath = {
      big = true,
      lines = { { id = "dr_wrath", text = "Healing Touch, because Wrath you'll learn whether I teach it or not, the first time a grell steals your supper. The forest is angry often enough without our help, and a druid who reaches for anger first will reach for it last as well." } },
      choices = {
        { text = "Healing first, then. I'll keep my anger for need.", next = "BACK", reply = "Then you'll be a druid people are glad to see coming up the path.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Wrath first. The grells won't wait on my patience.", next = "BACK", reply = "No, they won't, and I'll not pretend otherwise. Only learn the healing before the grells learn your name.", fx = { align = { light = -1 } } },
        { text = "Where does Moonfire come from, then?", next = "d_wrath2" },
      },
    },
    d_wrath2 = {
      lines = { { id = "dr_wrath2", text = "From Elune, through us, a little of the moon's light called down onto whatever needs it most, though it burns when it lands. You'll learn it soon, and Rejuvenation beside it, and you'll find they're two halves of one lesson." } },
      choices = { { text = "Two halves of one lesson. Something else.", next = "BACK" } },
    },
    d_dream = {
      big = true,
      lines = { { id = "dr_dream", text = "Perhaps, if the Circle calls you, though it calls fewer now than it did. My teacher slept through ten thousand years and woke to a world he didn't know, and he told me the hardest part was not the sleeping, but learning to be needed again." } },
      choices = {
        { text = "I'd sleep, if the forest asked it of me.", next = "BACK", reply = "Then you'll make a good druid, and perhaps a lonely one. The forest asks slowly, so you've time to be sure.", fx = { align = { order = 1 } } },
        { text = "I'd rather stay awake and be useful.", next = "BACK", reply = "The Sentinels would cheer you for that, and I'll not argue. Teldrassil needs waking druids just now.", fx = { align = { order = -1 } } },
        { text = "Something else, Mardant.", next = "BACK" },
      },
    },
    spirits = {
      lines = { { id = "sp_default", text = "Small things, mostly: that the rain is coming, that a wolf has been here, that the ground is tired. When they shout, something is very wrong, and lately in Teldrassil they shout more than I'd like." } },
      choices = {
        { text = "Should a druid obey the spirits, or guide them?", next = "obey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    obey = {
      lines = { { id = "ob_default", text = "Neither, I'd say, though the Arch Druid might say otherwise. We are the forest's friends, not its masters and not its servants." } },
      choices = {
        { text = "Then a druid must act for the forest, even unasked.", next = "BACK", reply = "Then you will be bold and often wrong, and the forest will forgive you most of it. Act with care, at least.", fx = { align = { order = -1 } } },
        { text = "Then a druid waits until the forest asks.", next = "BACK", reply = "Then you may wait a very long time, for the forest speaks slowly. Listen hard, and do not wait too long.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "wr_default", text = "The grells and the furbolgs, and the spiders in the Shadowthread Cave, all grown wilder than they should be. Teldrassil is young and was not blessed as Nordrassil was, and I worry that what grows wrong at the roots shows first in the creatures." } },
      choices = {
        { text = "Why wasn't Teldrassil blessed?", next = "wrong_bless" },
        { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } },
      },
    },
    wrong_bless = {
      lines = { { id = "wb_default", text = "Nordrassil was blessed by the great dragons themselves, long ago, and Teldrassil was planted after Hyjal, without them. Arch Druid Staghelm believed we couldn't wait for a blessing that might never come, and so we didn't." } },
      choices = {
        { text = "Was he wrong not to wait?", next = "wrong_fandral" },
        { text = "Something else.", next = "BACK", fx = { learn = { "nordrassil" } } },
      },
    },
    wrong_fandral = {
      lines = { { id = "wf_default", text = "That isn't mine to say, and I'd thank you not to repeat it as if I had. He leads the Circle while Malfurion sleeps, and he's given our people a home; I only listen to the roots and tell what I hear." } },
      choices = {
        { text = "He gave us a home. That was the right choice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Someone should ask him hard questions about it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "af_default", text = "Dolanaar, and Kal, who teaches there, and then Darnassus and the Cenarion Enclave, when you're ready for the deeper shapes. Don't hurry it, because the bear will wait for you, and so will the shapes beyond it." } },
      choices = {
        { text = "The bear? The sea?", next = "after_shapes" },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    after_shapes = {
      lines = { { id = "as_default", text = "Each shape is a lesson the Circle gives you when you're ready: the bear's strength first, then the seal's ease in the water, then the swift cat and the travelling stag. You'll earn them by trials, not by asking, and the trials are kinder than they look." } },
      choices = { { text = "I'll be patient. Something else.", next = "BACK" } },
    },
    taught = {
      lines = { { id = "ta_default", text = "A druid of Malfurion's own circle, long before the Sundering, who slept in the Dream for most of what came after. He woke for Hyjal and went back to sleep, and I've been teaching in his place ever since." } },
      choices = {
        { text = "What is the Dream like?", next = "taught_dream" },
        { text = "Something else.", next = "BACK", fx = { learn = { "malfurion" } } },
      },
    },
    taught_dream = {
      lines = { { id = "td_default", text = "Like the world as it was meant to be, before anyone cut it, green and endless and very quiet. Some of us find it hard to come back, and some don't, and the Circle doesn't speak about those much." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "emerald_dream" } } } },
    },
    slow = {
      lines = { { id = "sl_default", text = "Do I? Good, because the young ones all talk as if they were being chased, and half of what they say is only noise to fill the space where listening should be." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    outsiders = {
      lines = { { id = "ou_default", text = "Not as we are, I think; the shapes come from Cenarius, and he taught only our people. But a friend of the forest doesn't need claws to be one, and I'd rather have a careful human here than a careless druid." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Listen first, act second, and speak last. Most trouble comes from doing it the other way round." } },
    teldrassil = { { id = "tp_teldrassil", text = "Our young World Tree, planted without the dragons' blessing. I listen to its roots every night, and they are restless." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The world as it was meant to be, where the druids sleep. It's beautiful, and it does not always let you go." } },
    _none = { { id = "tp_none", text = "The spirits haven't told me of that, and I won't guess in their place." } },
  },
}

---------------------------------------------------------------------------
-- Alyissia (warrior trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "alyissia", id = TODO_NPC("Alyissia"), name = "Alyissia", title = "Warrior Trainer",
  bible = "bibles/aldrassil_trainers.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "stern", "brisk" }, values = { "dutiful", "brave" },
  notices = { "class", "kit" },

  impression = {
    first = "She has seen real war and isn't shy about saying so.",
    third = "{name} met Alyissia, the warrior trainer in Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "Stand up straight, because if you slouch like that against a grell, it'll take your ear off." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still standing, which is a good start. Show me what you've learned since." },
    { id = "g_sigil", when = { questActive = TODO_QUEST("Simple Sigil") },
      text = "The Simple Sigil, good. I sent it because Ilthalaine says you've a strong arm, and now we'll find out if he's right." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour's held together by hope and a few loose stitches, so get it mended before the next fight, or the next fight will be your last." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I am Alyissia, and I train the warriors of Shadowglen. The Sentinels guard our people with bow and glaive, but someone must stand in front of them when the enemy closes, and that's you." },
        { id = "h_war", when = { class = "WARRIOR" },
          text = "A warrior, new to the blade. Good; I'd rather teach you from nothing than untrain your bad habits, so let's begin with your feet." },
        { id = "h_sigil", when = { questActive = TODO_QUEST("Simple Sigil") },
          text = "Ilthalaine gave you the sigil, so you're mine for now. Learn what I teach you here, and then go and use it on the grells before they get any bolder." },
        { id = "h_ten", tags = { "news" }, when = { class = "WARRIOR", minLevel = 10, maxLevel = 19 },
          text = "You've outgrown Shadowglen, and I'm glad of it, though I'll not say so twice. Elanaria in Darnassus will want to see you now, so ask me about her before you go." },
        { id = "h_return", when = { class = "WARRIOR", minLevel = 20 },
          text = "You came back to Aldrassil, with scars I didn't give you. Stand where the young ones can see you, because they need to know that some of my students live." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? Speak quickly, and then go back to your drills." },
        { id = "h_again2", text = "Ask what you need to, and then return to the practice ground before your arms forget." },
        { id = "h_again3", text = "Well? I haven't all night, and neither have you." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What makes a good warrior?", next = "good" },
        { text = "Have you fought in a real war?", next = "war" },
        { text = "What will I be fighting around here?", next = "foes" },
        { text = "Where do I go when you're done with me?", next = "after", when = { class = "WARRIOR" } },
        { text = "I fight with an axe. Is that a problem?", next = "axe", when = { race = { "Dwarf", "Human" } } },
        { text = "The rage frightens me, Alyissia. It feels unbalanced.", next = "rage", when = { class = "WARRIOR", race = "NightElf" } },
        { text = "Charge, Rend, Thunder Clap. What should I master first?", next = "kit", when = { class = "WARRIOR", maxLevel = 12 } },
        { text = "Who is Elanaria?", next = "elanaria", when = { class = "WARRIOR", minLevel = 8, maxLevel = 19 } },
        { text = "Thank you.", next = "END" },
      },
    },
    good = {
      lines = { { id = "go_default", text = "Discipline first, strength second, and courage only when the other two are in place. A brave fool with no discipline dies in the first rush, and takes the archers behind him down too." } },
      choices = {
        { text = "Discipline wins battles. I'll hold the line.", next = "BACK", reply = "Then you will be a warrior the Sentinels can count on. Come back and drill with me tomorrow.", fx = { align = { order = 1 } } },
        { text = "Battles are won by whoever strikes hardest first.", next = "BACK", reply = "Then you will strike first and hardest and die first and fastest. I have buried many who believed it.", fx = { align = { order = -1 } } },
        { text = "How do I learn discipline?", next = "good_learn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_learn = {
      lines = { { id = "gl_default", text = "The same way you learn anything worth having: you do the dull thing every day until it isn't dull anymore. Footwork at dawn, shield drills at dusk, and you don't skip either because you're tired." } },
      choices = { { text = "Understood. Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    war = {
      lines = { { id = "wa_default", text = "At Hyjal, when the Legion came, and I don't talk about it much. I'll only tell you that the line held because nobody ran, and that I've trained warriors ever since so they never have to learn that the way I did." } },
      choices = {
        { text = "What was it like, holding the line?", next = "war_line" },
        { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    war_line = {
      lines = { { id = "wl_default", text = "Loud, and then very quiet, and then loud again, for longer than you'd think a body could stand. The demons didn't tire, so we had to stand in shifts, and the ones who weren't standing were digging graves." } },
      choices = {
        { text = "Did the kaldorei fight alone?", next = "war_allies" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_legion" } } },
      },
    },
    war_allies = {
      lines = {
        { id = "wal_default", text = "No, and it still sits strangely with some of us. Humans held the first line on the mountain, and orcs the second, and the orcs fought like they had something to prove, which I suppose they did." },
        { id = "wal_horde", when = { faction = "Horde" }, text = "No, and you'd know that if you've heard your own elders. Your people held the second line on the mountain, and whatever's happened in Ashenvale since, I saw them hold it." },
      },
      choices = {
        { text = "The orcs earned some trust that day.", next = "BACK", reply = "Some, perhaps, and Ashenvale is spending it quickly. I hold to what I saw.", fx = { align = { light = 1 } } },
        { text = "They fought to save their own skins, nothing more.", next = "BACK", reply = "Perhaps, but they stood, and that is more than some did. I'll not argue further.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    foes = {
      lines = { { id = "fo_default", text = "Grells and grellkin around the Fel Rock, spiders in the Shadowthread Cave, and young nightsabers that have gone mangy and mean. None of it is war, but all of it will teach you to keep your guard up." } },
      choices = {
        { text = "What are grells, exactly?", next = "foes_grell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    foes_grell = {
      lines = { { id = "fg_default", text = "Little imp-things that crawled up out of the Fel Rock, and they don't belong here any more than a satyr does. They chew the fel moss down there and it makes them vicious, so don't let them gang up on you." } },
      choices = {
        { text = "Where did they come from?", next = "foes_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    foes_where = {
      lines = { { id = "fw_default", text = "Nobody can tell me, and I've asked the druids twice. Something fell or crept or was carried to that cave, and the corruption came with it, and I'd sleep easier if somebody found out what." } },
      choices = { { text = "Maybe I will. Something else.", next = "BACK", fx = { learn = { "fel_moss" } } } },
    },
    after = {
      lines = { { id = "af_default", text = "Kyra Windblade in Dolanaar, and after her the Warrior's Terrace in Darnassus, where Arias'ta and the Bladesingers will knock what's left of your pride out of you. Thank them when they do, because it's cheaper there than on a battlefield." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rage = {
      big = true,
      lines = {
        { id = "rg_default", text = "It should frighten you a little, because our people have seen what passion without restraint did to the Highborne. But a warrior's rage is not their hunger, it is the body's answer to being struck, and you can hold it as a Sentinel holds a drawn bow, ready and still." },
      },
      choices = {
        { text = "Then I'll hold it still, like a drawn bow.", next = "BACK", reply = "Good. Elune does not ask us to feel nothing, only to master what we feel.", fx = { align = { order = 1 } } },
        { text = "Perhaps our people fear passion too much.", next = "BACK", reply = "Perhaps, and you are not the first young kaldorei to say it. Say it carefully in Darnassus.", fx = { align = { order = -1 } } },
        { text = "How did you learn to hold it?", next = "rage_how" },
      },
    },
    rage_how = {
      lines = { { id = "rh_default", text = "At Hyjal, where I had more rage than I could carry and nowhere to put it but the demons. I learned to let it out one blow at a time, never all at once, and I've taught it that way ever since." } },
      choices = { { text = "One blow at a time. Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    kit = {
      lines = {
        { id = "kt_default", text = "Charge, because it closes the distance before a grell can call its friends, and then Rend, because a bleeding enemy fights badly. Thunder Clap comes later, for when they come at you three at a time, which in the Fel Rock they will." },
      },
      choices = {
        { text = "Charge first, then. Something else.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Rend feels cruel, letting it bleed.", next = "BACK", reply = "Cruel is the grell chewing fel moss and the spirit of this glade. Rend it.", fx = { trait = { kind = 1 } } },
      },
    },
    elanaria = {
      lines = {
        { id = "el_default", text = "The warrior who keeps the old tests on the Warrior's Terrace in Darnassus, and the one who will decide whether you earn your second stance. She'll send you after something foul in Teldrassil's forests first, so go to her when Kyra in Dolanaar says you're ready." },
        { id = "el_other", when = { race = { "Human", "Dwarf", "Gnome" } }, text = "The warrior who keeps the old tests on the Warrior's Terrace in Darnassus. Your own people have their own tests, I'm told, but if you're here among us when you're ready, she may take you, if you show her proper respect." },
      },
      choices = {
        { text = "What sort of test does she set?", next = "elanaria_test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elanaria_test = {
      lines = { { id = "et_default", text = "There's a satyr in the forest, Vorlus Vilehoof, who has been defiling something sacred to our people, and she'll want proof you've ended him. I'll say no more, except that satyrs fight dirty and you shouldn't." } },
      choices = { { text = "Fight clean against a satyr. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    axe = {
      lines = { { id = "ax_default", text = "On a battlefield, no. Under Aldrassil, carry it carefully and don't swing it at anything that's growing, because the druids will hear about it before you've wiped the blade." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Keep your shield up and your feet under you, because everything else a warrior learns is decoration on those two." } },
    burning_legion = { { id = "tp_burning_legion", text = "I fought them at Hyjal, and I don't speak of it lightly, and I'd rather you never had to learn why." } },
    fel_moss = { { id = "tp_fel_moss", text = "The grells eat it and grow vicious, so burn it where you find it, if the druids will let you." } },
    _none = { { id = "tp_none", text = "That's not my concern, so ask a Sentinel about it, and then come back and drill." } },
  },
}

---------------------------------------------------------------------------
-- Frahun Shadewhisper (rogue trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "frahun", id = TODO_NPC("Frahun Shadewhisper"), name = "Frahun Shadewhisper", title = "Rogue Trainer",
  bible = "bibles/aldrassil_trainers.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "wry", "smooth" }, values = { "cunning", "careful" },
  notices = { "class", "stealth" },

  impression = {
    first = "He seemed faintly amused that anyone found him at all.",
    third = "{name} met Frahun Shadewhisper, the rogue trainer in Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "You found me. That's either talent or luck, and I'll want to know which." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. You walked louder this time, so practise." },
    { id = "g_sigil", when = { questActive = TODO_QUEST("Encrypted Sigil") },
      text = "You've read the Encrypted Sigil, which means you can read, at least. That's a start." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Very nice. I almost didn't see you, and I'll pretend I didn't, so you can feel proud a moment longer." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Frahun Shadewhisper. I teach the young ones of Shadowglen to move without being heard and strike without being seen, which the Sentinels find useful, though they don't like to say so out loud." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue, newly woken in the glade. Come closer, quietly, and we'll see whether you have the hands for it." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep it low." },
        { id = "h_again2", text = "Ask, but softly." },
        { id = "h_again3", text = "Still here? Good, you're learning patience, at least." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Do the kaldorei really need rogues?", next = "need" },
        { text = "Where do rogues go after Shadowglen?", next = "after", when = { class = "ROGUE" } },
        { text = "How did you learn to be so quiet?", next = "quiet" },
        { text = "I nearly walked straight past you.", next = "past" },
        { text = "What's out in the Shadowthread Cave?", next = "cave" },
        { text = "In Stormwind, rogues keep to guilds. Here?", next = "guilds", when = { race = "Human" } },
        { text = "I'll go quietly.", next = "END" },
      },
    },
    need = {
      lines = { { id = "ne_default", text = "We've been fighting in the dark for ten thousand years, so yes, and the Sentinels know it better than anyone. A blade in the right shadow saves a hundred arrows, and nobody needs to sing about it afterwards." } },
      choices = {
        { text = "A clean fight is still better than a knife in the dark.", next = "need_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need_stance = {
      lines = { { id = "ns_default", text = "Tell that to the satyrs, who never once fought cleanly. I'll teach you both ways, and you can decide which one keeps you alive." } },
      choices = {
        { text = "I'll fight with honor, whatever the satyrs do.", next = "BACK", reply = "Then you are better than the satyr, and I will respect you for it. Only do not let your honour get you killed.", fx = { align = { honor = 1 } } },
        { text = "Whatever works. The dead don't complain.", next = "BACK", reply = "They do not, and neither do the ones who left them. I will teach you whatever keeps you breathing, rogue.", fx = { align = { honor = -1 } } },
      },
    },
    after = {
      lines = { { id = "af_default", text = "Jannok in Dolanaar, when you've outgrown me, and later Syurna in Darnassus. Jannok's a fine teacher when he isn't writing poems about Syurna, so catch him early in the day." } },
      choices = {
        { text = "Who is Syurna, that he writes poems about her?", next = "after_syurna" },
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    after_syurna = {
      lines = { { id = "as_default", text = "The finest rogue in Darnassus, and the coldest, and she doesn't know Jannok exists, or pretends very well that she doesn't. Don't carry any messages between them unless you enjoy being stared at." } },
      choices = { { text = "Noted. Something else.", next = "BACK" } },
    },
    quiet = {
      lines = { { id = "qu_default", text = "Hunting satyr in the old forests after the Sundering, when a footstep in the wrong place got you killed. You learn to listen to your own feet as if they belonged to an enemy." } },
      choices = {
        { text = "Are there satyr still out there?", next = "quiet_satyr" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet_satyr = {
      lines = { { id = "qs_default", text = "In Ashenvale and Felwood, more than anyone likes to admit, still twisted and still ours, in a way, since they were kaldorei once. That's the part I don't teach the young ones until they ask." } },
      choices = {
        { text = "They were kaldorei?", next = "quiet_were" },
        { text = "Something else.", next = "BACK", fx = { learn = { "satyrs" } } },
      },
    },
    quiet_were = {
      lines = { { id = "qw_default", text = "Highborne who gave themselves to the Legion and were made into goats for their trouble. When you put a blade in one, remember it chose that shape, and don't let it talk you out of finishing." } },
      choices = {
        { text = "They chose it. They deserve no mercy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some might still be saved, if they wanted it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "highborne" } } },
      },
    },
    past = {
      lines = { { id = "pa_default", text = "You did walk past me, twice, and then you came back because something felt wrong. Trust that feeling, because it's the beginning of everything I teach." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    cave = {
      lines = { { id = "ca_default", text = "Webwood spiders, grown fat and bold, and the young ones go in to fetch their venom for Gilshalan. It's a good first lesson in moving quietly, since a spider feels your step long before it sees you." } },
      choices = {
        { text = "How do you sneak past something that feels you coming?", next = "cave_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave_how = {
      lines = { { id = "ch_default", text = "You step when the web is already shaking, when the wind moves it or another spider does. Wait for the forest's noise and hide inside it; that's the whole trick, and it works on more than spiders." } },
      choices = { { text = "Clever. Something else.", next = "BACK" } },
    },
    guilds = {
      lines = { { id = "gu_default", text = "We've no guilds and no secret handshakes, I'm afraid, only Syurna in the Cenarion Enclave and whoever she judges worth her time. Your people's way sounds louder, but I suppose it suits a louder city." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Walk where the noise already is. Silence draws the eye more than a rustle does." } },
    satyrs = { { id = "tp_satyrs", text = "Highborne once, goats now, and still dangerous. I've hunted them longer than this tree has stood." } },
    _none = { { id = "tp_none", text = "I don't know, and I'm not in the habit of guessing out loud." } },
  },
}

---------------------------------------------------------------------------
-- Ayanna Everstride (hunter trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "ayanna", id = TODO_NPC("Ayanna Everstride"), name = "Ayanna Everstride", title = "Hunter Trainer",
  bible = "bibles/aldrassil_trainers.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "warm", "steady" }, values = { "nature", "patient" },
  notices = { "class", "pet" },

  impression = {
    first = "She speaks of animals with affection and the hunt with careful respect.",
    third = "{name} met Ayanna Everstride, the hunter trainer at the top of Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "You climbed all the way up! Good legs. A hunter needs them." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. What did the glade teach you today?" },
    { id = "g_sigil", when = { questActive = TODO_QUEST("Etched Sigil") },
      text = "The Etched Sigil. I carved it myself, you know, and I'm glad it found a steady hand." },
    { id = "g_ready", when = { class = "HUNTER", minLevel = 8, maxLevel = 12 }, text = "Look at you, standing like a hunter at last. You're nearly ready for Dazalar, and I find I'm a little sorry about it." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Your companion's watching me. Good; it means it's watching for you, which is what a companion should do." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_old", when = { class = "HUNTER", minLevel = 20 },
          text = "You came back up the tree! I trained you when you couldn't string a bow without swearing, and now look at you, with the whole of Kalimdor in your boots." },
        { id = "h_default", key = true,
          text = "I'm Ayanna Everstride, and I teach the hunters of Shadowglen. Up here I can see every trail in the glade, and I like to know where my students are going wrong before they do." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! You'll have your own companion one day, when you're ready, and until then you'll learn to track and shoot and keep very still." },
      },
      again = {
        { id = "h_again", text = "What else? I've time; the glade is quiet." },
        { id = "h_again2", text = "Ask away." },
        { id = "h_again3", text = "Something else on your mind? Look down there while you think; you can see the whole glade." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How does a hunter respect the hunt?", next = "respect" },
        { text = "When do I get a companion?", next = "companion", when = { class = "HUNTER" } },
        { text = "What do you see from up here?", next = "view" },
        { text = "You carved the sigil yourself?", next = "sigil" },
        { text = "Do your people hunt with guns at all?", next = "guns", when = { race = "Dwarf" } },
        { text = "What lies ahead on the hunter's road, Ayanna?", next = "hr_road", when = { class = "HUNTER" } },
        { text = "Why do our people hunt beside beasts at all?", next = "ne_beasts", when = { race = "NightElf" } },
        { text = "Thank you.", next = "END" },
      },
    },
    respect = {
      lines = { { id = "re_default", text = "Take what you need, and take it quickly, and never take for the pleasure of it. The nightsabers hunt that way, and so did our people, once, before some forgot." } },
      choices = {
        { text = "Take only what you need. I'll hold to that.", next = "BACK", reply = "Then the forest will feed you for as long as you hunt in it. That is the oldest promise the kaldorei know.", fx = { align = { light = 1 } } },
        { text = "The strong take what they want. That's nature too.", next = "BACK", reply = "It is nature too, and so is starving when you have taken everything. The nightsabers know better than that.", fx = { align = { light = -1 } } },
        { text = "Who forgot?", next = "respect_forgot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    respect_forgot = {
      lines = { { id = "rf_default", text = "The Highborne, long ago, who hunted for sport in Azshara's gardens and kept rare beasts in cages for show. Their city is under the sea now, and I don't think the beasts mourn it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "highborne" } } } },
    },
    companion = {
      lines = { { id = "co_default", text = "When you're stronger, Dazalar in Dolanaar will teach you to tame a beast, and then the beast decides if you're worth following. Be patient, because the ones worth having don't come quickly." } },
      choices = {
        { text = "What beast would you choose?", next = "companion_choose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    companion_choose = {
      lines = { { id = "cc_default", text = "A nightsaber, of course, but I'm a kaldorei and we're not very imaginative about cats. Choose the beast whose temper suits yours, not the one that looks finest, because you'll be living with its moods a long time." } },
      choices = {
        { text = "How do I know which temper suits me?", next = "companion_temper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    companion_temper = {
      lines = { { id = "ct_default", text = "Watch what you're patient with and what you aren't. A hunter who hates waiting wants a boar, who charges first, and one who loves the stalk wants a cat, who'll wait in the grass with you all night." } },
      choices = { { text = "I'll think on it. Something else.", next = "BACK" } },
    },
    view = {
      lines = { { id = "vi_default", text = "The trails, the moonwell, the Sentinels changing their watch, and the young ones getting lost in the same three places every night. Lately I see the grells coming out of the Fel Rock earlier than they used to." } },
      choices = {
        { text = "That sounds like trouble.", next = "view_grell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    view_grell = {
      lines = { { id = "vg_default", text = "It is, and I've told Ilthalaine, and he's sending students to thin them, which is how you'll come to know the Fel Rock. Go in with your bow ready and come out the same way you went in, not deeper." } },
      choices = {
        { text = "Why not send the Sentinels in instead?", next = "view_sentinels" },
        { text = "Something else.", next = "BACK" },
      },
    },
    view_sentinels = {
      lines = { { id = "vs_default", text = "Because the Sentinels are in Ashenvale holding back the orcs, and there are too few of them as it is. So the glade's defended by students, and by those of us too old or too stubborn to leave it." } },
      choices = {
        { text = "Students should earn their place by fighting.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The Sentinels should be here, not in Ashenvale.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
    sigil = {
      lines = { { id = "si_default", text = "Every one, with a knife I've had longer than this tree. Ilthalaine gives them out, but each trainer makes their own, so a student carries a little of their teacher before they've even met." } },
      choices = { { text = "That's a kind tradition. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    guns = {
      lines = { { id = "gu_default", text = "Never, and the sabers would never forgive us the noise. But I've seen a dwarf drop a bear at a hundred paces, so I'll teach you what I know and you can keep your thunder-stick." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hr_road = {
      hub = true,
      lines = {
        { id = "hr_default", text = "A long road, and a good one, and I'll tell you the first part of it, since the first part is mine to teach. Ask, and I'll answer as plainly as I can." },
        { id = "hr_old", when = { minLevel = 20 }, text = "You're well along it already, so I'll tell you what I tell the young ones, and you can laugh at how simple it sounds from where you stand now." },
      },
      again = {
        { id = "hr_again", text = "What else about the road? I like this part of teaching best." },
        { id = "hr_again2", text = "Go on, ask. I'll tell you if you're getting ahead of yourself." },
      },
      choices = {
        { text = "Tell me about my first bow.", next = "hr_bow" },
        { text = "What's this Aspect of the Monkey you teach?", next = "hr_aspect" },
        { text = "What happens when I'm ready for a companion?", next = "hr_ten" },
        { text = "What do the druids think of hunters?", next = "hr_druids" },
        { text = "That's enough of the road for now.", next = "hello" },
      },
    },
    hr_bow = {
      lines = {
        { id = "hrb_default", text = "It will be a poor thing, bent from a branch someone else chose, and you'll love it more than any bow you ever own after. Keep it when you trade it in, and hang it over wherever you sleep, because every hunter I know still has her first." },
      },
      choices = {
        { text = "Do you still have yours?", next = "hr_bow2" },
        { text = "Something else about the road.", next = "hr_road" },
      },
    },
    hr_bow2 = {
      lines = {
        { id = "hrb2_default", text = "I do, and it's older than Teldrassil, cut from a sapling on the slopes of Hyjal before the Legion came. The string's rotted three times over, and Jeena Featherbow in Dolanaar restrings it for me every spring without being asked." },
      },
      choices = { { text = "Then I'll keep mine too.", next = "hr_road", fx = { affinity = 1 } } },
    },
    hr_aspect = {
      lines = {
        { id = "hra_default", text = "An aspect is a way of standing in the world that you borrow from a beast, and the monkey's is the first, for it teaches you to slip an unseen blow. Later there'll be the hawk for your aim and the cheetah for the road, and each one asks you to be a little less yourself for a while." },
      },
      choices = {
        { text = "Is that the same as a druid's shapes?", next = "hr_aspect2" },
        { text = "Something else about the road.", next = "hr_road" },
      },
    },
    hr_aspect2 = {
      lines = {
        { id = "hra2_default", text = "No, and don't say so in Dolanaar, or Athridas will explain the difference at length. A druid becomes the bear; a hunter only borrows the way the bear stands, and gives it back when the fight is done." },
      },
      choices = { { text = "Borrow it and give it back. I understand.", next = "hr_road" } },
    },
    hr_ten = {
      lines = {
        { id = "hrt_default", text = "When you're strong enough, I'll send you down the road to Dazalar in Dolanaar, and he'll hand you a taming rod and three beasts to try it on. You'll tame each one and let each one go, and then he'll let you choose your own, and that one will stay with you longer than most friends do." },
      },
      choices = {
        { text = "Why let the first ones go?", next = "hr_ten2" },
        { text = "Something else about the road.", next = "hr_road" },
      },
    },
    hr_ten2 = {
      lines = {
        { id = "hrt2_default", text = "Because a companion you keep because you can is not the same as one you keep because you chose it. Dazalar wants you to learn that a beast can be won and released and won again, so you never think of one as a thing you own." },
      },
      choices = { { text = "Then I'll choose carefully.", next = "hr_road", fx = { affinity = 1 } } },
    },
    hr_druids = {
      big = true,
      lines = {
        { id = "hrd_default", text = "Some of them think we take too much from the forest, and some of them think we're the only ones who still remember how to live in it. The Archdruid's people mostly think we should all have been druids, and the Sentinels mostly think we should all have been Sentinels." },
      },
      choices = {
        { text = "A hunter keeps the balance as well as any druid.", next = "hr_road", reply = "We do, and better than some, because we live off what we keep. Say it to Athridas and watch him frown.", fx = { align = { order = -1 } } },
        { text = "The druids are wiser. I'll learn from them.", next = "hr_road", reply = "Learn from them, by all means, and then come and tell me what they got wrong.", fx = { align = { order = 1 } } },
      },
    },
    ne_beasts = {
      big = true,
      lines = {
        { id = "neb_default", text = "Because we always have, since before the Sundering, when the forest's demigods still walked among us and the nightsabers came to our hunters of their own accord. Cenarius's children taught us that the beasts were our kin and not our servants, and a kaldorei hunter who forgets that is no hunter of mine." },
      },
      choices = {
        { text = "Then my companion will be my kin, not my tool.", next = "BACK", reply = "Good. Say that to your companion as well, someday, and mean it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Kin or not, a beast still fights where it's sent.", next = "BACK", reply = "So do Sentinels, and they'd not thank you for calling them tools either. Mind how you think of it.", fx = { align = { light = -1 } } },
        { text = "Did the Highborne hunt this way too?", next = "respect_forgot" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Be still longer than you think you should. The prey moves first, and then it's yours." } },
    highborne = { { id = "tp_highborne", text = "They hunted for sport and caged what they couldn't kill. We've been unlearning them for ten thousand years." } },
    _none = { { id = "tp_none", text = "I can't see that from up here, I'm afraid. Ask someone on the ground." } },
  },
}

---------------------------------------------------------------------------
-- Shanda (priest trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "shanda", id = TODO_NPC("Shanda"), name = "Shanda", title = "Priest Trainer",
  bible = "bibles/aldrassil_trainers.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "gentle", "calm" }, values = { "devout", "kind" },
  notices = { "class" },

  impression = {
    first = "She is softly spoken and very sure of the Mother Moon.",
    third = "{name} met Shanda, who trains the priests of Elune in Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "Elune's light on you, child. Come in out of the dark." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. The Mother Moon notices those who return." },
    { id = "g_sigil", when = { questActive = TODO_QUEST("Hallowed Sigil") },
      text = "The Hallowed Sigil, carried carefully, I see. Then you're one of Elune's, and I'll teach you as she taught me." },
  },

  notice = {
    { id = "n_pri", cat = "class", when = { class = "PRIEST" },
      text = "There's a stillness about you that I recognize. Elune has already noticed you, whether you know it yet or not." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_dd_deaths", when = { deaths = { min = 4 }, maxLevel = 12 }, text = "You have been to the spirit healer more than once already, and you are scarcely out of the glade. Learn your healing before you learn your courage, child, for Elune is patient and your body is not." },
        { id = "h_default", key = true,
          text = "I am Shanda, and I teach the priests of Elune who wake in Shadowglen. The Mother Moon gives us her light to heal and to guard, and I'll show you the first of it here." },
        { id = "h_pri", when = { class = "PRIEST" },
          text = "A priestess of Elune, or a priest, newly come to her. Sit with me, and we'll begin with the simplest prayer, which is also the hardest to mean." },
        { id = "h_favor", tags = { "news" }, when = { questActive = TODO_QUEST("In Favor of Elune") },
          text = "Go to Laurna Morninglight in Dolanaar when your work here is done. She'll give you your first garments of the Moon, and she'll test you a little first." },
      },
      again = {
        { id = "h_again", text = "What else, child?" },
        { id = "h_again2", text = "Ask; Elune is patient, and I try to be." },
        { id = "h_again3", text = "There's more on your mind, I can see it. Go on." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Who is Elune, to you?", next = "elune" },
        { text = "Why must a priest also fight?", next = "fight" },
        { text = "What is the moonwell for?", next = "well" },
        { text = "You seem very certain of her.", next = "sure" },
        { text = "Who teaches me after you?", next = "laurna", when = { class = "PRIEST" } },
        { text = "My people pray to the Light. Is that so different?", next = "light", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Thank you, Shanda.", next = "END" },
      },
    },
    elune = {
      lines = { { id = "el_default", text = "The light that finds you when you're lost, and the mother who doesn't forget her children. She kept us through the Sundering and through ten thousand years of vigil, and she'll keep you too, if you let her." } },
      choices = {
        { text = "How does one hear her?", next = "elune_hear" },
        { text = "Something else.", next = "BACK", fx = { learn = { "sisterhood_of_elune" } } },
      },
    },
    elune_hear = {
      lines = { { id = "eh_default", text = "Not with your ears, at first. Go out when the moon is full and stand in its light with nothing in your hands, and wait until you stop wanting something from her, and then you'll feel her there." } },
      choices = {
        { text = "Does she ever answer?", next = "elune_answer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elune_answer = {
      lines = { { id = "ea_default", text = "To the High Priestess, they say, in words, and to the rest of us in other ways: a wound that closes, an arrow that flies true, a road that's suddenly clear. I've never needed more than that, though I won't pretend I haven't wished for it." } },
      choices = {
        { text = "Faith shouldn't need proof.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd want to hear her words for myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "elune" } } },
      },
    },
    fight = {
      lines = { { id = "fi_default", text = "Because the Mother Moon is also the huntress, and the Sisterhood has always carried bows as well as prayers. Healing comes first, but a priestess who won't defend the wounded isn't much use to them." } },
      choices = {
        { text = "Healing first. A priest shouldn't seek the fight.", next = "BACK", reply = "Then you have learned the first lesson of the Sisterhood, and I am glad. The fight will come to you soon enough.", fx = { align = { light = 1 } } },
        { text = "Strike first, and there's less to heal.", next = "BACK", reply = "There is sense in that, and the Sentinels would agree with you. Only be sure you do not forget how to heal.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    well = {
      lines = { { id = "we_default", text = "Its water is blessed by Elune, and the Sentinels fill their flasks there before they ride out. A sip won't make you immortal, but it will steady a shaking hand." } },
      choices = {
        { text = "Where does its water come from?", next = "well_from" },
        { text = "Something else.", next = "BACK" },
      },
    },
    well_from = {
      lines = { { id = "wf_default", text = "From under the roots of Aldrassil, the druids say, drawn up through the tree and blessed by the priestesses at every full moon. We keep it clean as a matter of faith, and anyone who fouls it answers to the Sentinels." } },
      choices = {
        { text = "Has anyone ever fouled it?", next = "well_foul" },
        { text = "Something else.", next = "BACK" },
      },
    },
    well_foul = {
      lines = { { id = "wfo_default", text = "Not here, Elune be thanked, but I've heard the moonwells in Ashenvale have been fouled by satyrs and worse. Remember that, when you go out into the world and someone tells you it doesn't matter what water you drink." } },
      choices = { { text = "I'll remember. Something else.", next = "BACK", fx = { learn = { "ashenvale" } } } },
    },
    sure = {
      lines = { { id = "su_default", text = "I am, child, because I've seen what her light does. I watched the Sisterhood carry the wounded off Hyjal while demons burned the forest behind them, and none of them faltered." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    laurna = {
      lines = { { id = "la_default", text = "Laurna Morninglight in Dolanaar, who'd rather be healing on the roads than teaching in a hall. Be patient with her, and she'll give you more than lessons." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "li_default", text = "Less than either of our priests would like to admit, I think. Your Light and our Mother Moon both ask you to heal, to hope and to stand between the weak and the dark, and I've never seen one of your priests do worse at it than one of mine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "holy_light" } } } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Pray when you don't need anything. Then, when you do, you'll know the way." } },
    elune = { { id = "tp_elune", text = "The Mother Moon, who kept us through the Sundering. She is gentle, and she is also a huntress, and you'd do well to remember both." } },
    sisterhood_of_elune = { { id = "tp_sisterhood", text = "The priestesses of the Moon, led by Tyrande Whisperwind. I'm one of the least of them, and proud of it." } },
    _none = { { id = "tp_none", text = "I don't know, child. Elune might, and you're welcome to ask her." } },
  },
}
