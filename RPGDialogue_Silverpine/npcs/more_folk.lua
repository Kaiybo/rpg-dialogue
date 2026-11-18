-- Tiev Mordune: a Darkspear shaman at North Tide's Run, waiting by the water shrine to help other
-- shaman through Islen Waterseer's trial. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sp_tiev", id = TODO_NPC("Tiev Mordune"), name = "Tiev Mordune",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "north_tides_run" }, temper = { "warm", "cheerful" }, values = { "helpful", "spirits", "patience" },
  notices = { "class", "race" },

  impression = {
    first = "Tiev Mordune is a Darkspear shaman who finished his trial of water on the Silverpine coast and then stayed, in case anyone else needed help with theirs. He talks about himself in the third person and laughs easily.",
    third = "{name} met Tiev Mordune, a troll shaman who waits by the water shrine at North Tide's Run to help others through their trial.",
  },

  greetings = {
    { id = "g_default", text = "Greetin's, mon! Tiev be watchin' de water, and de water be watchin' back." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, brotha? De spirits remember you, and so does Tiev." },
    { id = "g_sapta", when = { questActive = TODO_QUEST("Call of Water") }, text = "Ya have de sapta? Bring it here and we go down to de shrine together." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "Another one walkin' de water path! Come, come, Tiev knows dis road." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Tiev feels de totems on you, brotha. Earth, fire, maybe soon water, if you be patient." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, so far from de Echo Isles! Vol'jin's people get everywhere, ya?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tiev Mordune, of de Darkspear. Tiev come here to purify de waters and prove his understandin' to Islen, and Tiev did it, but Tiev stay a while to help de ones who come after." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "Greetin's! Have you too come to purify de waters here and prove your understandin' to Islen? Tiev just defeated de corrupt water spirit himself, so Tiev can help you plenty if somethin' go wrong." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Call of Water") },
          text = "Ahh, you spoke wit' de water spirit! Tiev saw your face when you come back, and it was a good face, a clean one." },
      },
      again = {
        { id = "h_again", text = "What else, mon? De tide don't hurry, and neither does Tiev." },
        { id = "h_again2", text = "Ask away, brotha." },
      },
      choices = {
        { text = "What happened with the water spirit?", next = "spirit" },
        { text = "Why stay here, if you're finished?", next = "stay" },
        { text = "What's a water sapta?", next = "sapta", when = { class = "SHAMAN" } },
        { text = "A troll, alone among the Forsaken.", next = "forsaken" },
        { text = "Why do you talk about yourself like that?", next = "name" },
        { text = "Walk with the spirits, Tiev.", next = "END" },
      },
    },

    spirit = {
      lines = {
        { id = "sp_default", text = "De water here be sick, mon. A spirit of it went bad, all twisted and angry, and a shaman of water must put it down and carry what remain to de shrine before de pure spirit will talk to dem." },
      },
      choices = {
        { text = "Sick from what?", next = "spirit_sick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit_sick = {
      lines = {
        { id = "ss_default", text = "Tiev don't know for sure, but de whole forest be sick, ya? De dead walk it, de worgen howl in it, and de rot of Lordaeron run down into every stream. De water spirits feel all of it." },
      },
      choices = {
        { text = "Can it be healed?", next = "spirit_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit_heal = {
      big = true,
      lines = {
        { id = "sh_default", text = "One spirit at a time, maybe. Islen say a shaman don't fix de world, only listen to it and help where it ask. Tiev think dat be a slow way to fix anything." },
      },
      choices = {
        { text = "Islen's right. Patience heals more than force.", next = "BACK", reply = "Ya, ya, Tiev know it. Tiev just don't like it.", fx = { align = { order = 1 } } },
        { text = "Then don't wait. Heal what you can, now.", next = "BACK", reply = "Hah! You sound like Tiev when Tiev was young. Maybe Tiev still is.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stay = {
      lines = {
        { id = "st_default", text = "Tiev know another one who had trouble after de corrupt spirit. He waited too long and came out of de spirit world too quick for his taste, and Tiev hate to see dat happen again, so Tiev wait a bit." },
      },
      choices = {
        { text = "That's generous of you.", next = "stay_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay_why = {
      lines = {
        { id = "sw_default", text = "De loa teach dat what you give come back to you, one way or another. And besides, it be quiet here, and Wallace down de shore sell a fine spear, even if he can't see who he sell it to." },
      },
      choices = {
        { text = "Wallace seems a decent sort.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    sapta = {
      lines = {
        { id = "sa_default", text = "A water sapta, from Islen, to let you see into de spirit world. Bring Tiev one as proof you be ready, and Tiev will put his bracers and de last drops of water on de brazier so you can speak to de spirit too." },
        { id = "sa_active", when = { questActive = TODO_QUEST("Call of Water") },
          text = "Bring de sapta here, brotha, and don't worry none about seein' into de spirit world wit' it. Ol' Tiev know a trick or two about how de sapta magic works." },
      },
      choices = {
        { text = "What trick?", next = "sapta_trick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sapta_trick = {
      lines = {
        { id = "sk_default", text = "Ah, if Tiev tell you, it not be a trick no more, ya? Just trust Tiev, and come down to de shrine when you ready." },
      },
      choices = {
        { text = "I trust you, Tiev.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    forsaken = {
      big = true,
      lines = {
        { id = "fo_default", text = "Alone, but not so lonely, mon. De Forsaken at de Sepulcher be strange, and dey smell like old graves, but dey Horde, and Thrall say dey Horde, so Tiev say it too." },
        { id = "fo_forsaken", when = { race = "Scourge" },
          text = "Alone, but you here now, so not so alone! Tiev don't mind de Forsaken, though Tiev wonder sometimes what de loa think of folk who don't stay dead." },
      },
      choices = {
        { text = "The Horde is family. Trust them.", next = "BACK", reply = "Ya, family, even de strange cousins. Specially de strange cousins.", fx = { align = { light = 1 } } },
        { text = "Keep an eye on them. They're not like us.", next = "BACK", reply = "Tiev always keep an eye open, mon. Dat's just good sense, not mistrust.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    name = {
      lines = {
        { id = "nm_default", text = "Because Tiev like de sound of it! An old witch doctor on de Echo Isles told Tiev a name said aloud be a name de spirits remember, so Tiev say it plenty." },
      },
      choices = {
        { text = "Then I'll remember it too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Tiev don't know dat one, mon. Ask de water, maybe it know." } },
  },
}

---------------------------------------------------------------------------
-- Missed folk: the Sepulcher's blacksmithing trainer, the enchanting supplier in the hills
-- by the Greymane Wall, and the fisherman on the Lordamere dock.
---------------------------------------------------------------------------

-- Guillaume Sorouy: blacksmithing trainer at the Sepulcher.
P:NPC {
  key = "sp_guillaume", id = TODO_NPC("Guillaume Sorouy"), name = "Guillaume Sorouy", title = "Blacksmithing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "sepulcher" }, temper = { "exacting", "proud" }, values = { "craft", "orderly" },
  notices = { "profession", "kit", "class" },
  impression = {
    first = "Guillaume Sorouy teaches blacksmithing at the Sepulcher and holds every piece up to the light before he will say a word about it. He is proud and exacting, and he treats a badly set rivet as a moral failing.",
    third = "{name} met Guillaume Sorouy, the blacksmithing trainer at the Sepulcher in Silverpine Forest.",
  },

  greetings = {
    { id = "g_default", text = "Stand to the left of the anvil, if you please. The right is where the scale flies, and I have blinded one pupil already." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "You have a smith's hands, and you hold them away from your sides as a smith does. Show me your hammer, and I shall know the rest." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good, because the craft is not learned in one visit, whatever the Deathguard seem to believe." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor has been mended three times at the same seam, and badly each time. Take it to Meloche, who will at least do it badly in a new place." },
    { id = "n_miner", cat = "profession", when = { profession = "Mining" },
      text = "You dig your own ore, by the dust on you. Johan Focht will be pleased, since he says no smith in this crypt knows where iron comes from." },
    { id = "n_orc", cat = "class", when = { race = "Orc" },
      text = "I have studied orcish work since the alliance was made. It is heavier than it needs to be and stronger than it has any right to be, and I have not yet learned how you manage the second." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Guillaume Sorouy, and I teach the working of metal. I teach it slowly and I teach it correctly, and those who want it quick may go to the Undercity and learn it from someone with lower standards." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "Guillaume Sorouy. You have begun the craft elsewhere, so I must first find out what you were taught wrongly. Do not be offended, for everyone was taught something wrongly, myself included." },
        { id = "h_back", when = { metBefore = true }, text = "Guillaume Sorouy, as you know. Show me what you have made since we last spoke, or tell me honestly that you have made nothing, and we shall begin from there." },
      },
      again = {
        { id = "h_again", text = "Is there more? Speak while the iron heats, and stop when it is ready." },
        { id = "h_again2", text = "Go on. I can attend to a question and a forge at once, though I prefer the forge." },
        { id = "h_again3", text = "What else would you know? Ask precisely, and I shall answer the same way." },
      },
      choices = {
        { text = "Teach me your craft.", next = "BUSINESS" },
        { text = "You and Meloche work side by side, I see.", next = "meloche" },
        { text = "A crypt is a strange place for a forge.", next = "crypt" },
        { text = "Where does Silverpine's iron come from?", next = "iron" },
        { text = "What was I likely taught wrongly, Guillaume?", next = "wrong", when = { profession = "Blacksmithing" } },
        { text = "I'll leave you to the forge.", next = "END" },
      },
    },
    meloche = {
      lines = { { id = "me_default", text = "We share a wall, a chimney and nothing else. Sebastian Meloche mends armor for the garrison, quickly and in great quantity, and it holds, and I can say nothing better of it. He tells people that I polish while the Deathguard die, which is unjust, but not wholly untrue." } },
      choices = {
        { text = "Which of you has the right of it?", next = "meloche2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meloche2 = {
      big = true,
      lines = { { id = "me2_default", text = "That is the question, is it not? He would say that a rough plate on a soldier today is worth more than a perfect one next week. I would say that the perfect one is still on the soldier next year. Each of us has buried people who trusted the other's view." } },
      choices = {
        { text = "Meloche. A war is won with what's ready now.", next = "BACK", reply = "So the High Executor says, and so I am overruled. I shall go on doing it properly, and you may both be right in the short term.", fx = { align = { order = -1 } } },
        { text = "You. Work done properly doesn't need doing twice.", next = "BACK", reply = "Thank you. I shall not repeat it to Sebastian, since he has a hammer and a short temper, but it is pleasant to hear.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crypt = {
      lines = { { id = "cr_default", text = "It is dry, it is stone, and it does not burn, which is more than could be said of any smithy I kept in life. The dead who were laid here do not complain of the hammering, and the living dead upstairs have learned not to." } },
      choices = {
        { text = "The noise must carry through the whole Sepulcher.", next = "crypt2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crypt2 = {
      lines = { { id = "cr2_default", text = "It carries to Innkeeper Bates, who has asked me three times to work only by day, as though day and night meant anything to us. I told him that I would stop hammering when the worgen stopped biting, and he has not raised it since." } },
      choices = {
        { text = "That seems to have settled it.", next = "BACK", reply = "It settled nothing. He now sends his complaints through Apothecary Renferrel, who enjoys delivering them." },
        { text = "Something else, Guillaume.", next = "BACK" },
      },
    },
    iron = {
      lines = { { id = "ir_default", text = "Very little comes from Silverpine itself now. The Deep Elem Mine had good seams, and it is full of spiders, and the Undercity sends what it can spare by bat, which is to say by the saddlebag. Johan Focht finds the rest in outcrops along the hills." } },
      choices = {
        { text = "Could the mine be worked again?", next = "iron2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron2 = {
      lines = { { id = "ir2_default", text = "If someone cleared it and kept it clear, yes, and I have said so to the High Executor in writing. He replied that he has a keep full of worgen to deal with first. I do not dispute his order of business, but I have kept a copy of the letter." } },
      choices = {
        { text = "For the day he changes his mind.", next = "BACK", reply = "For the day he runs out of plate, which will come sooner. I intend to be courteous about it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = {
        { id = "wr_default", text = "That a harder strike makes a better weld, most likely. It does not. A weld wants heat and a light, quick hand, and every pupil who comes to me from the Undercity must be broken of pounding at it like a man driving a fence post." },
        { id = "wr_high", when = { profession = { name = "Blacksmithing", min = 150 } }, text = "Less than most, by the look of your hammer face. But I would wager you quench everything in water because it is to hand, and half of what you make would be the better for oil and a little patience." },
      },
      choices = {
        { text = "A light, quick hand. I'll unlearn the rest.", next = "BACK", reply = "Then you are already a better pupil than most. Come back with something you have made since, and I shall look at the seam.", fx = { affinity = 1 } },
        { text = "My work has held well enough so far.", next = "BACK", reply = "So far. I have those two words carved over the door of every smith I ever buried." },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_worgen", text = "They bite through anything riveted in a straight line, which I have measured. I teach my pupils to stagger the rivets, and it has saved at least one throat that I know of." } },
    shadowfang = { { id = "tp_shadowfang", text = "The keep had a fine armory under Baron Silverlaine, and I should dearly like to know what became of it. Nothing good, I expect, with what lives there now." } },
    forsaken = { { id = "tp_forsaken", text = "We do not tire and we do not sleep, and so a Forsaken smith may spend a whole night on one hinge. I consider it the single real advantage of our condition." } },
    advice = { { id = "tp_ad", text = "Heat it fully, strike it lightly, and look at it before you quench. There is nothing else, and it takes twenty years." } },
    _none = { { id = "tp_none", text = "I have no knowledge of that, and I do not guess. Ask someone who is less careful about being right." } },
  },
}

-- Leo Sarn: enchanting supplies, alone in the hills northeast of the Greymane Wall.
P:NPC {
  key = "sp_leo", id = TODO_NPC("Leo Sarn"), name = "Leo Sarn", title = "Enchanting Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "dry", "watchful" }, values = { "solitude", "knowledge" },
  notices = { "profession", "weary", "class" },
  impression = {
    first = "Leo Sarn sells enchanting supplies from a camp in the hills above the Greymane Wall, a long way from any customer. He is dry and watchful, and he seems to prefer the wall's silence to the Sepulcher's talk.",
    third = "{name} met Leo Sarn, who sells enchanting supplies in the hills northeast of the Greymane Wall.",
  },

  greetings = {
    { id = "g_default", text = "You have walked a long way to buy a rod. Sit, if you like, since I see few enough people to forget my manners." },
    { id = "g_ench", when = { profession = "Enchanting" }, text = "An enchanter, this far south. Then you have come on purpose, and I shall not waste your time pretending to be surprised." },
    { id = "g_back", when = { metBefore = true }, text = "You found the path a second time, which most do not. The dust has kept, and so have I." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You came through Pyrewood or past the keep, by the state of you. Either way you were lucky, and I would not count on being lucky going back." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Stand a moment with your back to the wall and tell me whether you feel it too, that faint pull, like a tide going out. I have never had a second opinion." },
    { id = "n_living", cat = "class", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Keep your voice down on this hill, if you would. The worgen hunt by scent, and you carry a good deal more of it than I do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Leo Sarn. I sell rods, dusts and a few formulae, and I sell them here, under the Greymane Wall, because this is where I choose to be. If that seems a poor place for a shop, you are not the first to say so." },
        { id = "h_ench", when = { profession = "Enchanting" }, text = "Leo Sarn. I have what a working enchanter runs short of in the field, and I shall not ask what you have been rendering down to need it. The south of Silverpine is full of things better taken apart." },
        { id = "h_back", when = { metBefore = true }, text = "Leo Sarn, still under the wall. Nothing has come over it since you were last here, and I find I am a little disappointed each time I say so." },
      },
      again = {
        { id = "h_again", text = "Was there something more? I have the time, and little else." },
        { id = "h_again2", text = "Go on. It is pleasant to hear a voice that is not the wind." },
        { id = "h_again3", text = "Ask what you like. The wall has taught me to be patient with questions that get no answer." },
      },
      choices = {
        { text = "Show me what you carry.", next = "BUSINESS" },
        { text = "Nobody keeps shop out here by accident.", next = "why" },
        { text = "What do you make of the wall itself?", next = "wall" },
        { text = "Who are your customers, this far from the Sepulcher?", next = "custom" },
        { text = "There's old magic in these hills. I can feel it.", next = "ley", when = { class = { "MAGE", "WARLOCK", "PRIEST", "SHAMAN", "DRUID" } } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "No. The Sepulcher has Lilly for its enchanting supplies, and one is enough for a crypt. I came south because the patrols that go to Pyrewood and the keep pass under this hill, and a patrol that can mend a ward on the road is a patrol that comes home." } },
      choices = {
        { text = "That's the reason you give. Is there another?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "wy2_default", text = "You are observant. There is the quiet, which I find I need, and there is the wall. I have spent a year looking at it, and I should like to be here on the day that something comes over it, or through, if only to be the one who saw." } },
      choices = {
        { text = "And if what comes over is unfriendly?", next = "BACK", reply = "Then I shall have been the first to know, and briefly. It still seems to me better than hearing of it third-hand in a crypt." },
        { text = "Something else.", next = "BACK" },
      },
    },
    wall = {
      lines = { { id = "wl_default", text = "It is the largest thing men ever built in the north, and they built it to keep their own neighbours out. Gilneas shut that gate before the plague came, and not a word has passed it since, not a trader, not a refugee, not so much as smoke." } },
      choices = {
        { text = "They abandoned Lordaeron to its fate.", next = "wall2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wall2 = {
      big = true,
      lines = { { id = "wl2_default", text = "They did, and I died of it, along with most of the people I knew. And yet I stand here some evenings and cannot decide whether Greymane was a coward or the only king in the north who saw what was coming and did the one thing that worked." } },
      choices = {
        { text = "A coward. He left his allies to die.", next = "BACK", reply = "That is the just answer, and on most days it is mine. A king who saves only his own has saved very little worth the name.", fx = { align = { honor = 1 } } },
        { text = "He saved his people. That is a king's first duty.", next = "BACK", reply = "If he did save them. Nobody knows what is behind that wall, and I notice that the silence could mean either thing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    custom = {
      lines = { { id = "cu_default", text = "Deathstalkers, chiefly, the ones High Executor Hadrec sends to watch Pyrewood and the keep. Now and then a volunteer who has lost the road, and once a troll who wanted to know if the wall was for sale. I see perhaps one face in three days." } },
      choices = {
        { text = "Do the worgen never find you up here?", next = "custom2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    custom2 = {
      lines = { { id = "cu2_default", text = "They pass below, at dusk and again before dawn, when the Pyrewood folk change their skins. I light no fire and I do not smell of meat, and so far they have looked up the hill and seen nothing worth the climb. I keep a ward ready all the same." } },
      choices = {
        { text = "You've nerve, to sit so close to them.", next = "BACK", reply = "I have very little to lose, which is often mistaken for nerve. But thank you.", fx = { affinity = 1 } },
        { text = "Something else, Leo.", next = "BACK" },
      },
    },
    ley = {
      lines = { { id = "ly_default", text = "Then I am not imagining it. There is a current under Silverpine that runs toward Ambermill and the old city beyond it, and since Dalaran's mages walled that village it has run faster. My dusts settle on one side of the jar now, the northern side." } },
      choices = {
        { text = "Shadow Priest Allister would want to hear that.", next = "BACK", reply = "He has heard it, from me, twice, and paid me for it once. Tell him it has grown stronger, if you see him, and that the second report is still owing.", fx = { affinity = 1 } },
        { text = "Then keep your jars away from Ambermill.", next = "BACK", reply = "I intend to keep all of myself away from Ambermill. The jars may do as they please." },
      },
    },
  },
  topics = {
    gilneas = { { id = "tp_gilneas", text = "A kingdom behind a gate, and nobody alive or dead who can tell you what it holds. I have listened at that wall for a year and heard only gulls." } },
    worgen = { { id = "tp_worgen", text = "They are men by day, down in Pyrewood, and they keep a village as though nothing were wrong. I find that harder to look at than the beasts." } },
    shadowfang = { { id = "tp_shadowfang", text = "I can see its towers from the top of this hill. There are lights in the upper windows at night, and I have stopped counting them, because the number changes." } },
    dalaran = { { id = "tp_dalaran", text = "Their people are at Ambermill, drawing on something under this forest. I sell dust to anyone, but I have not sold to them, and I shall not." } },
    advice = { { id = "tp_ad", text = "Light no fire south of the Sepulcher after dusk. Everything in this forest that means you harm can see it, and nothing that could help you can." } },
    _none = { { id = "tp_none", text = "I could not say. News reaches this hill late, and I have not gone looking for it." } },
  },
}

-- Killian Sanatha: Forsaken fisherman on the Lordamere Lake dock.
P:NPC {
  key = "sp_killian", id = TODO_NPC("Killian Sanatha"), name = "Killian Sanatha", title = "Fisherman",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "laconic", "wry" }, values = { "practical", "solitude" },
  notices = { "profession", "race", "class" },
  impression = {
    first = "Killian Sanatha sells his catch from an old dock on Lordamere Lake, with Fenris Isle sitting in the mist behind him. He says little and says it wryly, and he watches the water more than he watches his customers.",
    third = "{name} met Killian Sanatha, a Forsaken fisherman who sells his catch on the Lordamere Lake dock in Silverpine Forest.",
  },

  greetings = {
    { id = "g_default", text = "Fresh fish, if you want it, and nothing else, if you don't. Mind the third plank, it has opinions." },
    { id = "g_fisher", when = { profession = "Fishing" }, text = "You've a rod, and you're eyeing my end of the dock. There's room at the other end, and I'll thank you to cast away from my lines." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The lake hasn't changed, and I've not either, so you know what's for sale." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You'll actually eat this, won't you? Then take the ones from the top of the barrel, they came out this morning, and cook them through." },
    { id = "n_cook", cat = "profession", when = { profession = "Cooking" },
      text = "A cook. Good, then you'll not ask me what to do with a fish once you've bought it, the way the Deathguard do." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} has its nose in my barrel. I don't mind, but it's paying for whatever it takes, the same as anyone." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Killian Sanatha. I fish Lordamere off this dock and I sell what I catch, mostly to the Sepulcher's living guests and to hunters with beasts to feed. It's a small trade, and I keep it small deliberately." },
        { id = "h_fisher", when = { profession = "Fishing" }, text = "Killian Sanatha. You fish, so I'll spare you the patter, and you'll spare me the advice. The mud snappers run along the pilings, if you want to know, and that's all the help you'll get." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Killian Sanatha, and I've fish fit for a living stomach, which is rarer in this forest than you'd hope. Everything in the near barrel came off this dock today." },
      },
      again = {
        { id = "h_again", text = "Anything more? Keep it short, I've a line twitching." },
        { id = "h_again2", text = "Go on, then. The fish will wait, they've nowhere else to be." },
        { id = "h_again3", text = "What else? I'll answer, if it's about the lake." },
      },
      choices = {
        { text = "Let me see the catch.", next = "BUSINESS" },
        { text = "That's Fenris Isle out in the mist.", next = "fenris" },
        { text = "This dock has seen better days.", next = "dock" },
        { text = "Who buys fish in a forest of the dead?", next = "buyers" },
        { text = "Does the lake give up anything besides fish?", next = "haul", when = { profession = "Fishing" } },
        { text = "I'll leave you to your lines.", next = "END" },
      },
    },
    fenris = {
      lines = { { id = "fe_default", text = "It is. There's a keep on it, and the Rot Hide gnolls have had the run of it since the plague, digging up whatever was buried there. You can hear them on a still night, yipping across the water, and I'd not row out for all the fish in Lordamere." } },
      choices = {
        { text = "Do they ever cross to this shore?", next = "fenris2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fenris2 = {
      lines = { { id = "fe2_default", text = "Now and then, on rafts, at night. They work for someone out there, I'm told, a necromancer who pays them in bones, and the High Executor sends people over to thin them out. I watch the boats go, and I count them coming back, and I keep the count to myself." } },
      choices = {
        { text = "A grim sort of bookkeeping.", next = "BACK", reply = "Somebody ought to know the number. It may as well be the man who's sitting here anyway." },
        { text = "Something else, Killian.", next = "BACK" },
      },
    },
    dock = {
      lines = { { id = "dk_default", text = "It was a ferry landing, once. Boats ran from here across to Dalaran's shore and up to the Tirisfal side, with grain and wool and students in clean robes. The ferry's on the bottom now, a little way out, and I catch my best fish off its wheelhouse." } },
      choices = {
        { text = "You fish off a wreck.", next = "dock2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dock2 = {
      big = true,
      lines = { { id = "dk2_default", text = "I do. Fish like a wreck, and that one went down with a full hold. Some say I ought to leave it be, because there were passengers aboard when it sank and it's as good as a grave. I say the fish have been at it for years already." } },
      choices = {
        { text = "Leave it be. The drowned deserve their quiet.", next = "BACK", reply = "Maybe they do. I'll move my lines to the pilings for a while and see whether I sleep any easier, in a manner of speaking.", fx = { align = { light = 1 } } },
        { text = "A grave that feeds people is doing some good.", next = "BACK", reply = "That's how I've squared it. Nobody down there is using the wheelhouse, and my customers have to eat.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "by_default", text = "Innkeeper Bates, for the orcs and tauren who stop at the Sepulcher. Sarah Goode takes the scraps for her beasts, and Apothecary Renferrel sends a boy for the odd ones, the fish that come up wrong, with too many eyes or none." } },
      choices = {
        { text = "How many come up wrong?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "by2_default", text = "More each season, on the Fenris side. This side's clean enough, and I'd not sell it otherwise. But I keep the wrong ones in a separate barrel, and I tell Bates plainly which is which, because I'd sooner lose the trade than poison one of the Warchief's people." } },
      choices = {
        { text = "That's honest dealing.", next = "BACK", reply = "It's plain sense. A fisherman who poisons a customer doesn't get a second one.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    haul = {
      lines = { { id = "ha_default", text = "Boots, mostly, and once a lady's parasol, still furled. Closer to the wreck you'll snag crates, and some of them are sealed. I've opened three, and I'll tell you that waterlogged Dalaran textbooks are worth exactly nothing." } },
      choices = {
        { text = "And the fourth crate?", next = "BACK", reply = "Sharp of you. That one I left shut and dropped back in, because it hummed. I've learned which things in this forest to leave humming." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_worgen", text = "They don't like water, and that's the best thing about this dock. I've had one stand on the shore and stare at me for an hour, and then go away hungry." } },
    dalaran = { { id = "tp_dalaran", text = "You could see its spires from here on a clear morning, before. Now there's only a haze over that shore, and no ferry to take you into it." } },
    lordaeron = { { id = "tp_lord", text = "This lake fed the capital, the mage city and every village between. It feeds an inn and a stable now, and I suppose that's still something." } },
    advice = { { id = "tp_ad", text = "Don't eat anything that comes up on the Fenris side, and don't fish after dark. The first will make you ill, and the second will make you company." } },
    forsaken = { { id = "tp_forsaken", text = "We don't eat, and here I am catching supper for other people. I've decided it's funny, most days." } },
    _none = { { id = "tp_none", text = "Couldn't say. If it didn't happen on the water, I likely missed it." } },
  },
}
