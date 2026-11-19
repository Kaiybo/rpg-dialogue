-- Mor'zul Bloodbringer: the warlock at the Altar of Storms who teaches the binding of a dreadsteed of Xoroth, for blood and a very great deal of effort. Voice: bibles/morzul.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "morzul", id = TODO_NPC("Mor'zul Bloodbringer"), name = "Mor'zul Bloodbringer",
  bible = "bibles/morzul.md", role = "questgiver", tier = "quest",
  communities = { "altar_of_storms" }, temper = { "silky", "menacing" }, values = { "ambitious", "cruel" },
  notices = { "class", "arcane" },

  impression = {
    first = "He speaks softly and smiles at the word blood.",
    third = "{name} met Mor'zul Bloodbringer, a warlock at the Altar of Storms in the Burning Steppes who knows the ritual of the dreadsteed.",
  },

  greetings = {
    { id = "g_default", text = "The Altar of Storms receives few visitors, and fewer still who leave the way they came. Speak, and let us see which kind you are." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still whole, with your blood where it belongs. How encouraging." },
    { id = "g_away", when = { away = 14 }, text = "You have been gone {away}. The circle doesn't care, but I confess I noticed." },
    { id = "g_lock_back", when = { metBefore = true, class = "WARLOCK" }, text = "Ah, my student returns, and I do hope you've brought me something red." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your demon has grown fat on your power, and that pleases me. A dreadsteed needs a master who has fed many things." },
    { id = "n_paladin", cat = "arcane", when = { class = "PALADIN" },
      text = "A paladin at the Altar of Storms. I will not bow to you; this ground has seen your kind burn before." },
  },

  start = "hello",
  nodes = {
    op_demons = {
      lines = {
        { id = "opd_default", text = "Everyone, which is how I know it works. But you've been watching my circles with a particular look, so I'll ask: do you fear what I call up, or do you envy it?" },
      },
      choices = {
        { text = "I fear it, and so should you.", next = "op_dem_fear", fx = { align = { light = 1 }, opinion = { demons = "fear" } } },
        { text = "I envy it. Power is power, however it's fed.", next = "op_dem_envy", fx = { affinity = 1, align = { light = -1 }, opinion = { demons = "useful" } } },
        { text = "What I think of it is my own affair.", next = "BACK", reply = "So it is, and a guarded answer is the first sensible thing I've heard today. Keep your secrets, little one, and keep your distance from the circle." },
        { text = "Neither. I've an imp of my own, and it's better behaved.", next = "op_dem_envy", fx = { trait = { witty = 1 }, opinion = { demons = "useful" } }, when = { class = "WARLOCK" } },
        { text = "I'm only here for the altar, Mor'zul.", next = "BACK" },
      },
    },
    op_dem_fear = {
      lines = {
        { id = "opdf_default", text = "Fear is the beginning of wisdom and the end of most warlocks, so I'll take it as a compliment. Do watch the circle's edge on your way out." },
      },
      choices = { { text = "I'll mind the edge. Something else.", next = "BACK" } },
    },
    op_dem_envy = {
      lines = {
        { id = "opde_default", text = "Envy! How refreshing, after all the trembling. Come back when you've stopped pretending you'd never try it yourself, and we'll talk about the price." },
      },
      choices = { { text = "Perhaps I will. Let's talk of something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Mor'zul Bloodbringer, and I study what lies between this world and the burning ones beyond it, as the Shadow Council did on this very ground before the orcs learned to be ashamed of them. If you aren't a warlock, I'll thank you to keep your distance from the circle, for it bites." },
        { id = "h_lock_low", when = { class = "WARLOCK", maxLevel = 57 },
          text = "You've a little power about you, and you've heard of the dreadsteed, and you'd like it now. Come back when your trainers have nothing left to teach you, because Xoroth eats the half-finished." },
        { id = "h_stardust", tags = { "news" }, when = { questActive = TODO_QUEST("Xorothian Stardust") },
          text = "Lord Banehollow will sell you the stardust, and he'll be charming about it, and you'll want to wash afterwards. Don't let his manners fool you, because nothing in Jaedenar is what it wears." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "Your mastery over the denizens of other worlds has grown, I see, and you've come to me for the greatest of steeds. The dreadsteeds dwell on the Plains of Xoroth, and binding one is not a task for the impatient." },
        { id = "h_blood", tags = { "news" }, when = { questActive = TODO_QUEST("Rage of Blood") },
          text = "Bring me thirty bottles of raging beast's blood, from the maddened owlkin of Winterspring. The ink for your glyphs must be strong, and nothing is stronger than madness in the veins." },
        { id = "h_blood_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Rage of Blood"), days = 3 } },
          text = "The blood is distilling nicely. I may have kept a little aside for myself, for I hear its taste is quite euphoric, and I'll not apologise for it." },
        { id = "h_steed_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dreadsteed of Xoroth") },
          text = "Read my instructions closely, and perform every step exactly as written. A circle half-made is a door half-open, and things come through half-open doors." },
        { id = "h_steed_done", tags = { "news" }, when = { questDone = TODO_QUEST("Dreadsteed of Xoroth") },
          text = "You've bound a dreadsteed, and lived, and I'll admit some of my students have managed only one of those. Ride it well, and let it remind everyone who sees you what you are." },
        { id = "dd_imp", when = { questDone = TODO_QUEST("Imp Delivery") },
          text = "Gorzeeki tells me you carried that imp to him without letting it loose or burning yourself. Most fools manage one or the other, so I will count it as a small mark in your favour." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask, while my patience lasts." },
        { id = "h_again2", text = "Go on. The storm is quiet tonight, and I am feeling generous." },
      },
      choices = {
        { text = "What is the Altar of Storms?", next = "altar" },
        { text = "Why do you love blood so much?", next = "blood" },
        { text = "Who else keeps you company out here?", next = "gorzeeki" },
        { text = "Teach me to bind a dreadsteed.", next = "xsteed", when = { class = "WARLOCK" } },
        { text = "My felsteed serves me well enough.", next = "felsteed", when = { class = "WARLOCK", minLevel = 40 } },
        { text = "Bloodbringer. Did you choose that name yourself?", next = "name" },
        { text = "Your craft is an abomination.", next = "xpaladin", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I'll leave you to your circle.", next = "END" },
      },
    },

    altar = {
      lines = {
        { id = "al_default", text = "Where the old Horde's warlocks worked their darkest rites, in the days of the Shadow Council, and the stones still remember it. The air here is thin between worlds, which makes it the finest workroom in the Steppes, if you don't mind the dragons overhead." },
      },
      choices = {
        { text = "Does what you summon frighten anyone here?", next = "op_demons" },
        { text = "The Shadow Council worked here?", next = "altar_council" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    altar_council = {
      lines = {
        { id = "ac_default", text = "Among other places, and some of them still work, in Jaedenar in Felwood, under Lord Banehollow. I've no love for the Council, but I'll use their stardust and their roads, for knowledge owes nothing to the hands that hold it." },
      },
      choices = {
        { text = "Knowledge is knowledge. Use whatever works.", next = "BACK", reply = "You'd have made a fine student of the dark arts, I think. Half of what I know I took from the books of men who died trying to stop me, and the pages never once complained.", fx = { align = { light = -1 } } },
        { text = "Some knowledge stains whoever touches it.", next = "BACK", reply = "Every power stains, little one, and the only question is whether you get anything for the mark. I have always made very sure that I do.", fx = { align = { light = 1 } } },
        { text = "Let's leave the Council there.", next = "BACK" },
      },
    },

    blood = {
      lines = {
        { id = "bl_default", text = "Because it's honest, and nothing else in this world is. Blood tells you what a creature is, how strong, how mad, how afraid, and it never lies about it the way words do." },
      },
      choices = {
        { text = "You drink it, don't you?", next = "blood_drink" },
        { text = "I'd rather not hear more. Something else.", next = "BACK" },
      },
    },
    blood_drink = {
      lines = {
        { id = "bd_default", text = "A little, now and then, for science, and for pleasure, which is just science with a napkin. Gorzeeki, my goblin, prefers his warm and still moving, which I find rather vulgar, but we all have our tastes." },
      },
      choices = { { text = "Each to their own. Something else.", next = "BACK" } },
    },

    gorzeeki = {
      lines = {
        { id = "go_default", text = "My servant, a goblin alchemist of some skill and no manners. He brews my inks and makes my candles and keeps his imps in jars, and he's just to the west, if you can bear the smell of beetles." },
      },
      choices = {
        { text = "A goblin, serving a warlock?", next = "gorzeeki_why" },
        { text = "Back to the altar, then.", next = "BACK" },
      },
    },
    gorzeeki_why = {
      lines = {
        { id = "gw_default", text = "Goblins serve whoever pays, and I pay well, and I'm the only master he's ever had who doesn't mind his diet. It's the most stable arrangement I've ever made, and I've bound infernals." },
      },
      choices = { { text = "A stable arrangement indeed. What else?", next = "BACK" } },
    },

    xsteed = {
      big = true,
      lines = {
        { id = "xs_default", text = "It's long and costly, and it will send you to Winterspring, to the Scholomance and to Jaedenar, and finally into a circle in the ruins of Dire Maul with every demon of Xoroth trying to break it. When it's done you'll have a steed of fire and shadow, and you'll have earned it." },
        { id = "xs_low", when = { maxLevel = 57 },
          text = "Not yet, I think, because Xoroth would take one look at you and send back the saddle. Finish your training first, then come back to me with the patience of a warlock who has nothing left to prove." },
        { id = "xs_done", when = { questDone = TODO_QUEST("Dreadsteed of Xoroth") },
          text = "I've nothing more to teach you about steeds, for you've done the thing itself. Go and show the world what a warlock is, and don't let them forget it." },
      },
      choices = {
        { text = "Power like that is worth any price.", next = "xsteed_price", fx = { align = { light = -1 } } },
        { text = "I'll bind it, but I won't let it rule me.", next = "xsteed_price", fx = { align = { light = 1 } } },
        { text = "What sort of price?", next = "xsteed_price" },
        { text = "What happens in the circle at Dire Maul?", next = "xsteed_ritual", when = { minLevel = 58 } },
      },
    },
    xsteed_ritual = {
      narr = "He draws a small circle in the ash with one fingernail, and marks three points on it.",
      lines = {
        { id = "xr_default", text = "You'll set a bell, a candle and a wheel about the circle, and while you bind the steed in the middle, your friends must keep all three of them going, because the moment one falls silent the circle weakens. Every imp and dreadguard Xoroth can spare will come through to snuff them out." },
        { id = "xr_active", when = { questActive = TODO_QUEST("Dreadsteed of Xoroth") }, text = "Bell, candle and wheel, and keep all three alive while you break the steed in the middle. Choose friends who don't panic, because Xoroth's servants will go for whichever of them looks most afraid." },
      },
      choices = {
        { text = "And the steed itself?", next = "xsteed_ritual2" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xsteed_ritual2 = {
      lines = { { id = "xr2_default", text = "It will fight you as a beast fights, with hooves and fire, and then it will fight you as a demon fights, by offering terms. Refuse the terms and beat it down, and it is yours, and every warlock in Azeroth will know it the day you ride past." } },
      choices = { { text = "No terms, then. Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    felsteed = {
      lines = {
        { id = "fs_default", text = "Your felsteed is a cart horse that happens to be on fire, and it serves you because your trainer did the hard part for you. A dreadsteed is chosen and broken by your own hand, from the herds of a burning world, and it will never once forget who broke it." },
      },
      choices = {
        { text = "Then I'll break one myself.", next = "xsteed", fx = { trait = { proud = 1 } } },
        { text = "My cart horse does fine. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    name = {
      lines = { { id = "nm_default", text = "No, the Council gave it to me when I was young and useful, and I've kept it because it frightens the right people. The name I was born with I left behind, along with the rest of my family's expectations." } },
      choices = {
        { text = "You served the Shadow Council?", next = "name2" },
        { text = "It suits you. Something else.", next = "BACK" },
      },
    },
    name2 = {
      big = true,
      lines = { { id = "nm2_default", text = "I learned from it, which isn't the same thing, and I walked away before it could ask me to die for it. Most of its members did die for it, at Blackrock and at Hyjal, so tell me honestly, do you think less of me for surviving?" } },
      choices = {
        { text = "Surviving is the first duty of anyone with power.", next = "BACK", reply = "You and I would get along, I think, though I'd never turn my back on you. That's a compliment, from me.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A man who abandons his oath deserves no trust.", next = "BACK", reply = "Then trust me as little as you like, so long as your coin is good. Oaths to the Council were the only ones I ever broke, and I've never regretted it.", fx = { align = { honor = 1 } } },
        { text = "I'll keep my opinion to myself.", next = "BACK" },
      },
    },
    xsteed_price = {
      lines = {
        { id = "xp_default", text = "Gold, blood, weeks of your life, and one moment in the circle when you'll feel everything in Xoroth looking at you at once. Most remember that moment for the rest of their lives, and the wise ones are glad of it." },
      },
      choices = {
        { text = "I'm ready for it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xpaladin = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Abomination is a word for what frightens you, holy one. My students bind demons and ride them against the Legion's own servants, which is more than your sermons have managed lately." },
      },
      choices = {
        { text = "Demons can't be tamed. You'll learn that too late.", next = "BACK", reply = "Perhaps I will, and you may come and gloat over my bones if you live so long. Until then, my dreadsteeds will keep riding where your Light does not reach.", fx = { align = { order = 1 } } },
        { text = "If it works against the Legion, I'll hold my tongue.", next = "BACK", reply = "How unexpectedly sensible of you, holy one. Hold it a while longer and you may even learn something worth knowing.", fx = { align = { order = -1 } } },
        { text = "I've heard enough of this.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I am a scholar of the nether, a teacher of warlocks, and a connoisseur of blood, and I was all three when the Shadow Council still met. The rest is no concern of yours." } },
    advice = { { id = "tp_ad", text = "Never step into a circle you didn't draw yourself." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion is the source of all true power, and the warlocks who serve it wisely grow strong. The ones who serve it foolishly end up as a smell in my summoning circle." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons under the mountain have a fire lord, and the fire lord has power. I'd like to study it, very carefully." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages called what I do forbidden, and now their city is in ruins while I'm still teaching." } },
    _none = { { id = "tp_none", text = "I haven't troubled to learn that, and I doubt it would have been worth the trouble, any more than the shamans' prattle about spirits." } },
  },
}
