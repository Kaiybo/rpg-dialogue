-- Booty Bay visitors and newcomers: the Zandalarian Emissary (Zandalar Tribe, patch 1.7),
-- Dudd Fizzlescroll (scrolls, maps and "treasure maps") and Rix Xizzix (Lost and Found, Pix's brother).
-- Voice: bibles/booty_bay_visitors.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

------------------------------------------------------------------------
-- Zandalarian Emissary: an elder tribe's voice in a goblin port
------------------------------------------------------------------------
P:NPC {
  key = "zandalari_emissary", id = 15076, name = "Zandalarian Emissary",
  bible = "bibles/booty_bay_visitors.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "proud", "calm" }, values = { "proud", "devout" },
  notices = { "race", "class" },

  impression = {
    first = "He speaks of Hakkar the way others speak of a coming storm.",
    third = "{name} met the Zandalarian Emissary in Booty Bay, an envoy of the Zandalar Tribe calling for heroes to march on Zul'Gurub.",
  },

  greetings = {
    { id = "g_default", text = "Come closer, stranger. De Zandalar do not shout across a crowded dock." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and de loa have not taken you yet. Dat is a good sign, though I would not lean on it." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and Zul'Gurub has not slept one night of it. Tell me you have been sharpening your blade, at least." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You march with de Warchief, I see. Good, for his people have learned dat a blood god is no friend to anyone." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "A child of de northern kingdoms comes to speak with a troll, and freely. De world has changed more than my elders believed." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" }, place = "before",
      text = "Ah, a troll, and one who wears de Horde's colours. Stand straight, young one, for you speak with your eldest kin." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "You carry de smell of prayer about you. Whatever god you kneel to, you know dat gods listen, and few in dis port of coin-counters understand dat." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "De spirits walk close beside you, shaman. They are restless near dis coast, because they can feel what stirs in de jungle." },
  },

  start = "hello",
  nodes = {
    op_trolls = {
      lines = {
        { id = "opt_default", text = "Fools, and our own blood, which is de worse thing to say of anyone. But I have a question for you, stranger, since your peoples have opinions about mine: when you look at a troll, what do you see?" },
      },
      choices = {
        { text = "An old people with a proud history.", next = "op_trolls_respect", fx = { affinity = 1, align = { honor = 1 }, opinion = { trolls = "respect" } } },
        { text = "Savages who fed their own to a blood god.", next = "op_trolls_hate", fx = { affinity = -2, align = { honor = -1 }, opinion = { trolls = "hate" } } },
        { text = "I see my grandfathers, and I'm proud of them.", next = "op_trolls_proud", fx = { affinity = 2, opinion = { trolls = "respect", darkspear = "proud" } }, when = { race = "Troll" } },
        { text = "Trolls have fought my kingdoms since Arathor. Forgive my doubts.", next = "op_trolls_distrust", fx = { opinion = { trolls = "distrust" } }, when = { faction = "Alliance" } },
        { text = "I'll judge each troll as I find them.", next = "BACK" },
      },
    },
    op_trolls_respect = {
      lines = {
        { id = "optr_default", text = "Proud, yes, and old beyond your kingdoms' counting. Remember dat when you walk into Zul'Gurub, because what you will see there is what pride becomes when it forgets de gods it serves." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_trolls_hate = {
      lines = {
        { id = "opth_default", text = "Some did, and dat is why I am here asking for your blades. But speak carefully, little one; de Zandalar remember every word, and we have very long lives to remember dem in." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_trolls_proud = {
      lines = {
        { id = "optp_default", text = "Good. De Darkspear are a small tribe, but dey have kept dere pride without keeping a blood god, and dat is more than de Gurubashi managed." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_trolls_distrust = {
      lines = {
        { id = "optd_default", text = "Forgiven, for now. Doubt is cheaper than war, and Molthor would rather have your doubts and your sword than neither." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "We, de Zandalarian trolls, sailed here from our distant islands, because we cannot ignore de danger dat now faces your world. Our leader Molthor has made camp on Yojamba Isle, and he gathers brave heroes to go into de old city of Zul'Gurub." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A troll stands before me in a goblin harbour, wearing orcish leather and speaking orcish words. Still, de blood remembers what de tongue forgets, so listen well, cousin, for Zul'Gurub calls to you most of all." },
        { id = "h_rep", when = { reputation = { faction = "Zandalar Tribe", min = "honored" } },
          text = "Molthor speaks your name on Yojamba Isle, and my people do not speak a stranger's name lightly. Sit with me a while, friend of de Zandalar." },
        { id = "h_heart", when = { questDone = TODO_QUEST("The Heart of Hakkar") },
          text = "You are one of those who brought down de Soulflayer and carried his heart to Molthor. When his cry went up, every Zandalari on dis coast raised de Spirit of Zandalar over de land, and I raised it with dem." },
        { id = "h_low", when = { maxLevel = 50 },
          text = "You are young yet for Zul'Gurub, stranger, and de priests there would make a small meal of you. Still, listen, for one day you will be ready, and Molthor will still be waiting." },
      },
      again = {
        { id = "h_again", text = "Ask, then. My people have kept de histories since before your kingdoms had names." },
        { id = "h_again2", text = "What more? De tide is slow tonight, and so am I." },
        { id = "h_again3", text = "Speak. I have crossed an ocean to be listened to, so I will listen in return." },
      },
      choices = {
        { text = "Who are the Zandalar, exactly?", next = "zandalar" },
        { text = "Some great threat must have brought you all this way.", next = "hakkar" },
        { text = "Tell me about Molthor and Yojamba Isle.", next = "molthor" },
        { text = "What waits inside Zul'Gurub?", next = "zg" },
        { text = "Why stand here, among goblins and pirates?", next = "bay" },
        { text = "You call me cousin. The Darkspear owe you nothing.", next = "k_dark", when = { race = "Troll" } },
        { text = "Why would a troll ask the Alliance for help?", next = "k_alliance", when = { faction = "Alliance" } },
        { text = "Is this danger a loa, like the others?", next = "x_loa", when = { class = { "PRIEST", "SHAMAN" } } },
        { text = "May your elders guide you well.", next = "END" },
      },
    },

    zandalar = {
      lines = {
        { id = "zd_default", text = "We are de first tribe, de one all de others came from, long before Zul'Aman or Zul'Gurub raised a single stone. Our islands lie far to de south and west, and there our priests have kept de oldest histories of de troll race since de world was young." },
        { id = "zd_horde", when = { faction = "Horde" }, text = "We are de first tribe, from which every other troll is sprung, Darkspear and Gurubashi and Amani alike. Our priests have kept de histories of our race on our islands far to de south, and we rarely leave them." },
      },
      choices = {
        { text = "Why leave your islands now, after so long?", next = "zandalar_leave" },
        { text = "First tribe? The other trolls must resent that.", next = "zandalar_rank" },
        { text = "Let us speak of something else.", next = "BACK" },
      },
    },
    zandalar_leave = {
      lines = { { id = "zl_default", text = "Because a priest of de old ways reads de signs, and de signs have turned red. When de Gurubashi priests called Hakkar back into de world, every loa who still loves de trolls cried out, and de Zandalar heard them across de whole sea." } },
      choices = {
        { text = "Then tell me about this Hakkar.", next = "hakkar" },
        { text = "Something else, Emissary.", next = "BACK" },
      },
    },
    zandalar_rank = {
      big = true,
      lines = { { id = "zr_default", text = "Some do, and dat is dere foolishness to carry. A child may resent his grandfather, but it is still de grandfather who remembers where de family buried its dead, and which gods it must never wake." } },
      choices = {
        { text = "Then the elders should lead, and the younger tribes should listen.", next = "BACK", reply = "You speak with more sense than many trolls I could name. De young tribes will listen, I think, once Hakkar has finished teaching dem why dey should.", fx = { align = { order = 1 } } },
        { text = "No tribe owes another obedience, however old it is.", next = "BACK", reply = "Dat is a young tribe's answer, and I have heard it from every one of dem. Obedience, no, but a wise child still asks his grandfather where de snakes sleep.", fx = { align = { order = -1 } } },
        { text = "I doubt the younger tribes ever listen.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    hakkar = {
      lines = {
        { id = "hk_default", text = "Hakkar de Soulflayer, de blood god, who once ruled de Gurubashi empire through his Atal'ai priests and fed on its people. De tribes rose against him and drove de Atal'ai into de swamps to de north, and for a long time we believed he was gone from dis world." },
      },
      choices = {
        { text = "What happened to the Atal'ai?", next = "atalai" },
        { text = "He must have found a way to return.", next = "hakkar_return" },
        { text = "Enough of blood gods for now.", next = "BACK" },
      },
    },
    atalai = {
      lines = { { id = "at_default", text = "De Atal'ai built a temple to him in de Swamp of Sorrows, and they tried to call him back, until de green dragons sank it beneath de mire. They are still down there, praying in de dark, and they are not de only ones who never stopped." } },
      choices = {
        { text = "Who else kept praying?", next = "hakkar_return" },
        { text = "A temple under a swamp. Let us talk of other things.", next = "BACK" },
      },
    },
    hakkar_return = {
      big = true,
      lines = { { id = "hr_default", text = "De high priests of Zul'Gurub, de last proud Gurubashi, who thought they could make de Soulflayer serve dem. Now he walks in their city and they are his hands, and if he is not stopped there, he will cross into de rest of de world and drink it dry." } },
      choices = {
        { text = "And what do you think of the Gurubashi now?", next = "op_trolls" },
        { text = "The Gurubashi called him. Let them burn with him.", next = "BACK", reply = "Many of dem will burn, outsider, whether we wish it or not. But do not be so eager, for de fire you light in Zul'Gurub will not ask whose hut it is.", fx = { align = { light = -1 } } },
        { text = "Their common folk didn't choose this. Spare who can be spared.", next = "BACK", reply = "Dat is a kinder road than most would walk, and de loa will see it. Spare who you can, but do not let pity slow your blade when de priests come.", fx = { align = { light = 1 } } },
        { text = "Then he must be stopped. Where do I begin?", next = "molthor" },
      },
    },

    molthor = {
      lines = {
        { id = "ml_default", text = "Molthor leads our expedition, and he has made his camp on Yojamba Isle, off de northern coast of dis jungle, not far from de orc port at Grom'gol. Go to him, and he will teach you what my people know of de city and its priests." },
      },
      choices = {
        { text = "Why Yojamba Isle?", next = "yojamba" },
        { text = "Molthor must ask something of those who come.", next = "molthor_ask" },
        { text = "Let us speak of something else.", next = "BACK" },
      },
    },
    yojamba = {
      lines = { { id = "yj_default", text = "Because it is close enough to see de smoke of Zul'Gurub's fires and far enough dat de priests' servants must swim to reach us. Water has always been kind to de Zandalar, stranger, and it keeps de jungle honest." } },
      choices = { { text = "Something else, Emissary.", next = "BACK" } },
    },
    molthor_ask = {
      lines = { { id = "ma_default", text = "Proof, first, in de coins and bijous of de Gurubashi you cut down, so he knows you have been inside. Then courage, because when you are ready, he will ask you to bring him de heart of de Soulflayer himself." } },
      choices = {
        { text = "And what happens when Hakkar falls?", next = "spirit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit = {
      lines = { { id = "sp_default", text = "Then Molthor lifts his voice from Yojamba, and every Zandalari across dis land answers him, and we call down de Spirit of Zandalar on all who stand near. Even here on dis dock, de goblins will feel it, and they will not know why they are suddenly brave." } },
      choices = { { text = "I'd like to see that.", next = "BACK", fx = { affinity = 1 } } },
    },

    zg = {
      lines = {
        { id = "zg_default", text = "De greatest city de Gurubashi ever built, and now de Soulflayer's own house. His high priests have taken on de aspects of de old beasts, de bat and de snake and de spider and de panther and de tiger, and they guard de way to him." },
      },
      choices = {
        { text = "Who stands closest to Hakkar?", next = "jindo" },
        { text = "How many does it take to break in?", next = "zg_many" },
        { text = "Something else, Emissary.", next = "BACK" },
      },
    },
    jindo = {
      lines = { { id = "jd_default", text = "Jin'do de Hexxer, a witch doctor whose ambition was bigger than his wisdom. He did more than any other to bring Hakkar into Zul'Gurub, and he will curse you, twist your mind and set your own friends against you if you let him." } },
      choices = {
        { text = "Then I'll make sure he dies first.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zg_many = {
      lines = { { id = "zgm_default", text = "Not one hero, and not five, but many together, all of dem seasoned in battle. Molthor will tell you dat a war band of twenty is a small thing to send against a god, but it is what dis world can spare." } },
      choices = { { text = "Something else, Emissary.", next = "BACK" } },
    },

    bay = {
      lines = {
        { id = "by_default", text = "Because every ship in de South Seas puts in at dis harbour, and every ship carries heroes, or fools who will become heroes if dey live. De goblins charge me a docking fee to stand still, which my people find very strange, but we pay it." },
      },
      choices = {
        { text = "What do you make of the goblins?", next = "bay_goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bay_goblins = {
      lines = { { id = "bg_default", text = "They worship coin de way de Gurubashi worship blood, but coin at least does not eat your soul. De Baron has been courteous, and his cannons point at de sea and not at us, which is all a guest can ask." } },
      choices = { { text = "Something else, Emissary.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },

    k_dark = {
      big = true,
      lines = { { id = "kd_default", text = "Owe us? No, little cousin, but you came from de Gurubashi once, before de jungle tribes drove you to de Echo Isles, and you ran with de orcs because no troll offered you a better home. De Zandalar do not forget dat, and we do not blame you for it, though we wonder sometimes what you have traded away." } },
      choices = {
        { text = "The Darkspear traded nothing. We chose our own path.", next = "k_dark2", fx = { affinity = -1 } },
        { text = "You speak as if we trolls have lost something.", next = "k_dark2" },
      },
    },
    k_dark2 = {
      lines = { { id = "kd2_default", text = "De old words, de proper rites, de long memory of who your grandfathers' grandfathers were. Still, when Hakkar falls, I would be glad to see a Darkspear blade among those dat brought him down, for dat would teach de Gurubashi something about family." } },
      choices = { { text = "Then you'll see one, cousin.", next = "BACK", fx = { affinity = 1, learn = { "echo_isles" } } } },
    },
    k_alliance = {
      lines = { { id = "ka_default", text = "Your kingdoms and de trolls have fought since de days of Arathor, and I have no love for your banners. But Hakkar does not care whose blood he drinks, and a wise people takes allies where de gods send them." } },
      choices = {
        { text = "Old wars should stay buried when a god is waking.", next = "BACK", reply = "Dis is wisdom, and I did not expect it from one wearing your colours. When de Soulflayer is dead, we may remember de old wars at our leisure.", fx = { align = { honor = 1 } } },
        { text = "We'll help, but the Alliance won't forget the Troll Wars.", next = "BACK", reply = "Neither will de trolls, outsider, so we are even in dat. Help us all de same, and let de historians argue over it when Hakkar is dust.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_loa = {
      lines = {
        { id = "xl_default", text = "A loa, yes, but a fallen one, a god who learned to love blood more than he loved de trolls who fed him. De true loa give and take in balance, and my people serve them as priests have always served, with respect and with care." },
        { id = "xl_sham", when = { class = "SHAMAN" }, text = "You speak to de spirits of earth and wind, shaman, so you know dat a spirit can be honoured or it can be bound. Hakkar is a loa who chose to be fed rather than honoured, and now he cannot stop feeding." },
      },
      choices = {
        { text = "My faith is the Light. Your loa are not gods to me.", next = "BACK", fx = { affinity = -1 }, when = { faction = "Alliance" } },
        { text = "Then the true loa must want him gone as much as you do.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "My people have kept de histories of de trolls since before your oldest city was a village, so ask, and I will tell you what is fit for an outsider to hear." } },
    background = { { id = "tp_bg", text = "I am de voice of de Zandalar in dis harbour, sent by Molthor to find heroes for Zul'Gurub. My name is for my own people.", next = "zandalar" } },
    advice = { { id = "tp_ad", text = "When you face Jin'do, kill his shades before dey whisper in your friends' ears. A hex is only a hex until it turns your own blade on you." } },
    echo_isles = { { id = "tp_echo", text = "De Darkspear's islands, off de coast of Durotar. A small home for a small tribe, but dey hold it bravely." } },
    _none = { { id = "tp_none", text = "Dat is not in de histories of my people, stranger, and so it does not concern me." } },
  },
}

------------------------------------------------------------------------
-- Dudd Fizzlescroll: scrolls, maps, and maps of a more speculative nature
------------------------------------------------------------------------
P:NPC {
  key = "dudd", id = TODO_NPC("Dudd Fizzlescroll"), name = "Dudd Fizzlescroll",
  bible = "bibles/booty_bay_visitors.md", role = "vendor", tier = "quest",
  communities = { "booty_bay" }, temper = { "smooth", "chatty" }, values = { "trade", "clever" },
  notices = { "class", "purse" },

  impression = {
    first = "His treasure maps are partly forgeries, and he's proud of the penmanship.",
    third = "{name} met Dudd Fizzlescroll, a goblin scroll-seller in Booty Bay who used to copy bills of lading for the Steamwheedle Cartel.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a scholar! I can always tell, it's in the eyes, so step over and browse, and mind the ink, because it's still wet." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite scholar returns! I've restocked since you were here, and I've drawn three new maps, one of which is very nearly accurate." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, scholar, and I was startin' to think you'd followed one of my treasure maps, which I'd advise against, legally speaking." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde scholars are still scholars, and your gold reads the same as anybody's. Come in, come in, I've got scrolls in Orcish too, mostly." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, oh, a real reader! Don't look too close at the lettering on my Intellect scrolls, scholar, just enjoy how they make you feel." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Your purse is a little light, scholar, but don't you worry, because a single scroll of Stamina costs less than the bandages you'll need without it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Dudd Fizzlescroll, purveyor of scrolls, maps and documents of every kind, scholar. Agility, Strength, Protection, Spirit, a good map of the Cape for a fair price, and treasure maps for an even fairer one, which you'll understand is a different thing entirely." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "One of Ian Strom's rogues, if I'm any judge, and you'll want a Scroll of Agility for those fingers, scholar. Don't try lifting one, though, because I count my stock twice an hour and I count it in ink." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "Now here's a scholar with arms like ship's cable! A Scroll of Strength on top of all that would be gilding the cannon, but I sell gilt too, so let's talk." },
        { id = "h_cortello", when = { questDone = TODO_QUEST("Cortello's Riddle") },
          text = "Word is you followed old Captain Cortello's riddle all the way to the end, scholar, and there was a real chest at the bottom. Do you know what that does to my business, having a real one out there making mine look bad?" },
      },
      again = {
        { id = "h_again", text = "What else, scholar? Ask away, because questions are free and answers are priced to sell." },
        { id = "h_again2", text = "Go on, scholar, I've got a whole drawer of answers and most of 'em are in alphabetical order." },
        { id = "h_again3", text = "Still browsing? A scholar after my own heart, and my own stock, I hope." },
      },
      choices = {
        { text = "Do your scrolls actually work?", next = "scrolls" },
        { text = "Tell me about these treasure maps.", next = "maps" },
        { text = "A goblin scroll seller must have a story behind him.", next = "past" },
        { text = "Who are your customers around here?", next = "customers" },
        { text = "Do you sell anything for magic users?", next = "x_caster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "Can you read Gnomish, Dudd?", next = "x_gnome", when = { race = "Gnome" } },
        { text = "I'll come back when my purse is heavier.", next = "END" },
      },
    },

    scrolls = {
      lines = {
        { id = "sc_default", text = "Every one of 'em, scholar, by my last quill, and they're scribed by proper hands in Gadgetzan, not by me, which is the best guarantee I can offer. You read it, it crumbles, and for a little while you're quicker, stronger or tougher, and then it wears off and you buy another, which is the beautiful part." },
      },
      choices = {
        { text = "You don't write them yourself?", next = "scrolls_who" },
        { text = "Something here must sell better than the rest.", next = "scrolls_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scrolls_who = {
      lines = { { id = "sw_default", text = "Not the magic ones, no, because the last time I tried, the ink caught fire and so did my desk, my sleeve and a very nice ledger. I've got a cousin who buys his blasting powder from Crazk Sparks, the fireworks man, and even he said I should stick to copying." } },
      choices = { { text = "Something else, Dudd.", next = "BACK" } },
    },
    scrolls_best = {
      lines = { { id = "sb_default", text = "Protection, scholar, by a long way, because anybody going up the jungle road wants a little extra between them and a raptor. Spirit sells to the priests and Intellect sells to the mages, and Agility sells to the rogues, though they always want to pay in favours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    maps = {
      lines = {
        { id = "mp_default", text = "Ah, now, my treasure maps are what I'd call aspirational documents, scholar. Every one is drawn from a real rumour told to me by a real sailor in the Salty Sailor, and if the rumour was wrong, well, I just wrote it down." },
      },
      choices = {
        { text = "So you're selling forgeries.", next = "maps_forgery" },
        { text = "Has anyone ever found treasure with one?", next = "maps_found" },
        { text = "Something else.", next = "BACK" },
      },
    },
    maps_forgery = {
      big = true,
      lines = { { id = "mf_default", text = "Forgeries? A forgery pretends to be somethin' it ain't, and mine say treasure map right on the top, in very nice letters. Whether there's treasure at the X is between the customer and the jungle, and it's all in the small print, which I write extra small so it fits." } },
      choices = {
        { text = "That's cheating desperate people. You should stop.", next = "BACK", reply = "Stop? Pal, the walk alone is worth the price, fresh air, scenery, the thrill of discovery! I'm practically sellin' a holiday with a free map thrown in.", fx = { align = { honor = 1 } } },
        { text = "Anyone fool enough to buy one deserves the walk.", next = "BACK", reply = "Now there's a customer who gets the business! Every map's a lesson, friend, and a lesson's worth payin' for, so tell your gullible friends where I am.", fx = { align = { honor = -1 } } },
        { text = "How small is the small print?", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    maps_found = {
      lines = { { id = "mfd_default", text = "Once, scholar, and it nearly ruined me, because a dwarf dug at one of my Xs and hit a Bloodsail chest that nobody'd buried on purpose. Now every sailor in the Bay thinks my maps are real, and I have to draw 'em even more carefully wrong." } },
      choices = { { text = "Something else, Dudd.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },

    past = {
      lines = {
        { id = "ps_default", text = "I was a clerk for the Steamwheedle Cartel, scholar, copying bills of lading in the Baron's counting house, twelve hours a day with a quill in each hand. Then one day I misfiled a ship, and that's a long story with a short ending, which is me out on the dock with a crate of ink." },
      },
      choices = {
        { text = "How do you misfile a whole ship?", next = "past_ship" },
        { text = "Do you miss the counting house?", next = "past_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_ship = {
      lines = { { id = "psh_default", text = "Wrote it down as arriving when it was departing, and the Bruisers spent a whole night waiting to unload a ship that was halfway to Ratchet. The Baron said I'd cost him forty gold in overtime, so I paid it off by copying contracts for free, and then I took my handwriting somewhere it'd be appreciated." } },
      choices = { { text = "Something else, Dudd.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    past_miss = {
      lines = { { id = "pm_default", text = "I miss the paper, scholar, real Cartel paper, thick as a hide and stamped with the seal. What I don't miss is a supervisor countin' my blots and chargin' me a copper apiece, and on my mother's ledger, there were a lot of blots." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    customers = {
      lines = {
        { id = "cu_default", text = "Everybody needs paper sooner or later, scholar. Krazek buys my maps of the jungle trails for his errand-runners, Sly Garrett buys blank vellum and won't say why, and Markel Smythe reads every contract I sell over my shoulder, which is very bad for business." },
      },
      choices = {
        { text = "What's wrong with Smythe reading them?", next = "cust_smythe" },
        { text = "Sly Garrett wanting blank vellum seems strange to me.", next = "cust_garrett" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cust_smythe = {
      lines = { { id = "cs_default", text = "He's honest, scholar, which is a terrible thing to stand next to while you're selling. He once read my small print aloud to a dwarf, and the dwarf bought the map anyway, so I can't tell if Smythe's my enemy or my best salesman." } },
      choices = { { text = "Something else, Dudd.", next = "BACK" } },
    },
    cust_garrett = {
      lines = { { id = "cg_default", text = "I don't ask, scholar, because a goblin who asks questions about Garrett's business ends up a footnote. My guess is letters of passage, the kind with a seal that looks very much like a Stormwind one if you don't hold it near a lamp." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    x_caster = {
      lines = { { id = "xc_default", text = "Intellect for the mages, Spirit for the priests, and for the warlocks I've got paper that doesn't scream when you write on it, which you'd be surprised how hard that is to find. All Cartel-certified, scholar, and none of it has whispered to me yet." } },
      choices = { { text = "Something else, Dudd.", next = "BACK" } },
    },
    x_gnome = {
      lines = { { id = "xg_default", text = "I can read the numbers, scholar, and in Gnomish that's most of it, but the rest looks like somebody spilled a box of gears on the page. If you ever want to sell me a gnomish map, I'll pay well for one that I can sell upside down." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know paper, scholar, and everything that's ever been written on it in this port, including some things that shouldn't have been." } },
    background = { { id = "tp_bg", text = "Ex-clerk of the Steamwheedle Cartel, now an independent man of letters, with a stall and a very good pen.", next = "past" } },
    advice = { { id = "tp_ad", text = "Read the scroll before the fight, scholar, not during it, because a raptor won't wait for you to find the right page." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel's paper is the best in the world, and they'll charge you for every sheet you ruin, which I know from experience." } },
    _none = { { id = "tp_none", text = "Never had it in writing, scholar, and if it's not in writing, it might as well not exist." } },
  },
}

------------------------------------------------------------------------
-- Rix Xizzix: Lost and Found, Pix's brother, eyebrows still pending
------------------------------------------------------------------------
P:NPC {
  key = "rix", id = TODO_NPC("Rix Xizzix"), name = "Rix Xizzix", title = "Lost and Found",
  bible = "bibles/booty_bay_visitors.md", role = "vendor", tier = "quest",
  communities = { "booty_bay" }, temper = { "eager", "cheerful" }, values = { "trade", "inventive" },
  notices = { "purse", "race" },

  impression = {
    first = "He sells adventurers their own lost treasures back at a handsome price.",
    third = "{name} met Rix Xizzix, Pix's brother, who worked off a stolen fortune hauling crates and now runs Booty Bay's Lost and Found.",
  },

  greetings = {
    { id = "g_default", text = "Hey, sport, lose somethin'? Everybody loses somethin', and sooner or later it all washes up here." },
    { id = "g_back", when = { metBefore = true }, text = "Sport! Back again, and I bet you've lost somethin' else since I saw you, because everybody does." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, sport, which means you've dropped, sold or misplaced somethin' important by now, so let's check the shelves." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde or Alliance, sport, everybody leaves their rings on a vendor's counter eventually, and I don't care whose they were." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "That's a heavy purse, sport, and I've got a shelf full of things you probably regret selling, so let's see if they're still yours at heart." },
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Another goblin! Then you know the rule, sport: nothing's ever lost, it's just in somebody else's inventory for a while." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rix Xizzix, Lost and Found, and if an adventurer ever earned it and then lost it, sold it or left it in a tavern, I've probably got it, sport. Rings, trinkets, fancy cloaks from grateful mayors, all here, all reasonably priced for what they are." },
        { id = "h_money_done", when = { questDone = TODO_QUEST("Show Me The Money!") },
          text = "Hey, you're the one who got our chest back from those pirates! Pix won't shut up about you, sport, and Frix has been tryin' to sell you a policy ever since." },
        { id = "h_money", tags = { "news" }, when = { questActive = TODO_QUEST("Show Me The Money!") },
          text = "Pix sent you after the pirates who took our chest? Bring it back, sport, and I'll stop havin' nightmares where I'm still haulin' crates." },
        { id = "h_engineer", when = { profession = { name = "Engineering", min = 1 } },
          text = "You're an engineer, sport, I can smell the powder on you from here! Tell me about rockets, any rockets, and I'll stand here and listen all day." },
      },
      again = {
        { id = "h_again", text = "What else, sport? The shelves ain't goin' anywhere, but my patience has a price." },
        { id = "h_again2", text = "Go on, sport, I've got time, and nobody's come in to lose anything in an hour." },
        { id = "h_again3", text = "Ask me anything, sport, except where my eyebrows went, because I'm still sore about it." },
      },
      choices = {
        { text = "How does a Lost and Found work, exactly?", next = "shop" },
        { text = "You're Pix's brother?", next = "family" },
        { text = "What happened to your eyebrows?", next = "rocket" },
        { text = "Where does all this stuff come from?", next = "sources" },
        { text = "Any dreams beyond Lost and Found, Rix?", next = "dream" },
        { text = "Fellow goblin here. How's business, really?", next = "x_goblin", when = { race = "Goblin" } },
        { text = "I'll keep a better eye on my things.", next = "END" },
      },
    },

    shop = {
      lines = {
        { id = "sp_default", text = "Simple, sport: you finish some big job for some important person, they hand you a ring, and two weeks later you sell it to a vendor for three silver because it don't match your boots. Then you come cryin' to me, and I sell it back to you, with a modest retrieval fee." },
      },
      choices = {
        { text = "How modest is the retrieval fee?", next = "shop_fee" },
        { text = "Has anyone ever come back for something special?", next = "shop_story" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop_fee = {
      big = true,
      lines = { { id = "sf_default", text = "Modest for a hero, sport, which is a lot for anybody else. I paid for it, I stored it, I kept the damp off it, and the vendors charge me plenty, so if I ask a bit more than you sold it for, well, that's what regret costs." } },
      choices = {
        { text = "Charging people for their own rewards is just wrong.", next = "BACK", reply = "Wrong? Pal, storage costs money, damp costs money, and my brother's eyebrows cost a fortune in salve. You want it free, you should've carried it out yourself.", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "They sold it. It's yours now, so charge what you like.", next = "BACK", reply = "Finally, a hero with a head for business! Possession's nine-tenths of the law in this port, sport, and the Baron collects on the other tenth.", fx = { align = { honor = -1 } } },
        { text = "Regret costs a lot in Booty Bay.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    shop_story = {
      lines = { { id = "ss_default", text = "A dwarf came in last month, sport, and bought back a ring his captain gave him, and he cried right there on my counter. I charged him full price, because business is business, but I gave him a cloth for his face, and that cloth was free." } },
      choices = { { text = "That was kind of you, in a way.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },

    family = {
      lines = {
        { id = "fm_default", text = "Pix is my sister, and Frix is my twin, though I'm the handsome one, at least when I've got eyebrows. We came over from Undermine with a chest full of start-up money and a lot of big plans, and pirates rowed off with the chest before we'd even unpacked." },
        { id = "fm_done", when = { questDone = TODO_QUEST("Show Me The Money!") }, text = "Pix is my sister, and Frix is my twin, and you know the rest, sport, since you're the one who got our chest back from the pirates. On my mother's ledger, I owe you a rocket, if I ever build one that lands where I aim it." },
      },
      choices = {
        { text = "How did you pay the money back?", next = "family_debt" },
        { text = "I'd guess Frix is up to something these days.", next = "family_frix" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_debt = {
      lines = { { id = "fd_default", text = "Pix said the chest went missing on my watch, sport, which is technically true, so I hauled crates on the docks for the Bruisers until my arms were longer than my legs. I paid off every copper, and with what was left, I opened this place, because I'd spent so long picking up other people's stuff that I figured I'd start charging for it." } },
      choices = {
        { text = "You worked it off. That's honest.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Rix.", next = "BACK" },
      },
    },
    family_frix = {
      lines = { { id = "ff_default", text = "Still sellin' insurance, sport, mostly against my rockets, and he's got every captain on the docks signed up. He says my Lost and Found is bad for his business, because people don't claim on a ring they can just buy back from me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    rocket = {
      lines = {
        { id = "rk_default", text = "My first rocket, sport, on the ship down from Undermine, and it went up beautifully, right through the roof of our cabin. Nobody got hurt except my eyebrows, and they're growin' back slow, so I'm thinking of charging them rent." },
      },
      choices = {
        { text = "Did you ever try again?", next = "dream" },
        { text = "What did Pix say?", next = "rocket_pix" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rocket_pix = {
      lines = { { id = "rp_default", text = "She said the cabin roof was comin' out of my share, sport, and she's been sayin' it ever since. Then Frix tried to sell the ship's captain a policy against roofs, and that's when they put us ashore with our luggage." } },
      choices = { { text = "Something else, Rix.", next = "BACK" } },
    },

    dream = {
      lines = { { id = "dr_default", text = "Rockets, sport, every day! I've got a corner of the shelf set aside for parts, and one day I'll have enough for a proper shop on the pier, rockets for weddings and battles and the Baron's birthday. Crazk Sparks, who sells fireworks on the wharf, says it ain't big enough for two of us, which I take as a compliment." } },
      choices = {
        { text = "Crazk sounds worried.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sources = {
      lines = {
        { id = "so_default", text = "Vendors, mostly, sport, because adventurers sell 'em anything shiny for pocket money. Some comes from the Salty Sailor, left under tables, and some comes up the beach after a ship goes down, and that I don't ask about." },
      },
      choices = {
        { text = "Do you ever buy from pirates?", next = "sources_pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sources_pirates = {
      lines = { { id = "sop_default", text = "Not after what they did to our chest, sport, not ever, and I check every seller's coat for a red sash. Graves at the auction house sends me the odd lot nobody claims, and he's the most honest supplier I've got." } },
      choices = { { text = "Something else, Rix.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },

    x_goblin = {
      lines = { { id = "xgb_default", text = "Between you and me, sport, it's the best business in the Bay, because heroes are the worst at keepin' track of stuff. Every time somebody saves a village, I know they'll be back in a month, cryin' about a ring." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know where things go when nobody's watchin' 'em, sport, and who comes back to cry about it." } },
    background = { { id = "tp_bg", text = "Came from Undermine with my sister and my twin, lost our money to pirates, hauled crates till it was paid, and now I run Lost and Found.", next = "family" } },
    advice = { { id = "tp_ad", text = "Don't sell anything a mayor gave you, sport, because you'll want it back, and it'll cost you." } },
    bloodsail = { { id = "tp_blood", text = "Those red-sash thieves took everything we had, sport, so if you see one, kick him off a pier for me." } },
    _none = { { id = "tp_none", text = "Never seen it, sport, and nobody's ever lost one, so I can't sell it to you." } },
  },
}

------------------------------------------------------------------------
-- Privateer Bloads: a Booty Bay letter of marque, a fast sloop and a hunger for reeds
------------------------------------------------------------------------
P:NPC {
  key = "bloads", id = 2494, name = "Privateer Bloads",
  bible = "bibles/booty_bay_visitors.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "jovial", "brisk" }, values = { "free", "practical" },
  notices = { "class", "race" },

  impression = {
    first = "He laughs at his own name before anyone else can.",
    third = "{name} met Privateer Bloads, a human privateer in Booty Bay who hunts the Bloodsail under the Baron's commission and buys Akiris reed by the bundle.",
  },

  greetings = {
    { id = "g_default", text = "Ahoy, shipmate! Come stand in the shade before the sun cooks you like it cooked me." },
    { id = "g_back", when = { metBefore = true }, text = "There's my shipmate again! You've still got all your fingers, so the reeds haven't bitten you yet." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, shipmate, and I'd half written you off as fish food, so you've cheered me up just by walking in." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, is it? My letter's against the Bloodsail, not the Warchief, so come aboard and talk, shipmate." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A Stormwind accent! I left Westfall when I was fourteen, shipmate, and I've not been back, but I'd know that sound in any port." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk like a boarder, shipmate, light on the deck and ready to go over the rail. I could use a few like you on the next run." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Privateer Bloads, master of the sloop Saltpenny, sailing under the Baron's letter of marque against anything that flies a red sash. And yes, shipmate, I've heard every joke about my name, so you'll have to find a new one." },
        { id = "h_akiris", tags = { "news" }, when = { questActive = TODO_QUEST("Akiris by the Bundle") },
          text = "You're after the Akiris reed for me, shipmate? Mind the murlocs in the shallows, because they guard those beds like they're full of gold, and to a sailor they very nearly are." },
        { id = "h_akiris_done", when = { questDone = TODO_QUEST("Akiris by the Bundle") },
          text = "My favourite reed-cutter! Every bundle you've brought me is in the Saltpenny's seams right now, keeping the sea out where it belongs." },
        { id = "h_sailor", when = { class = "WARRIOR" },
          text = "You've a good pair of shoulders for hauling line, shipmate, and a better pair for swinging a cutlass. If the reeds don't keep you busy, the Bloodsail will." },
      },
      again = {
        { id = "h_again", text = "What else, shipmate? The tide's not turning for an hour yet." },
        { id = "h_again2", text = "Go on, ask, shipmate. I've stories enough to fill a hold." },
        { id = "h_again3", text = "Still here? Good, I like company that doesn't need paying." },
      },
      choices = {
        { text = "What do you want with Akiris reed?", next = "reed" },
        { text = "A letter of marque? What does that mean here?", next = "marque" },
        { text = "Tell me about the Saltpenny.", next = "ship" },
        { text = "Bloads. Is that really your name?", next = "name" },
        { text = "You must have an opinion of the Blackwater Raiders.", next = "raiders" },
        { text = "Do you ever miss Westfall?", next = "x_human", when = { race = "Human" } },
        { text = "Fair winds, Bloads.", next = "END" },
      },
    },

    reed = {
      lines = {
        { id = "rd_default", text = "Akiris reed grows in the warm shallows along this coast, shipmate, and once it's dried and twisted, there's no better stuff for caulking a hull. Pitch cracks in this heat and oakum rots, but a seam packed with Akiris stays tight through a whole season." },
        { id = "rd_done", when = { questDone = TODO_QUEST("Akiris by the Bundle") }, text = "You know it better than I do now, shipmate! It grows in the warm shallows, the murlocs hate sharing it, and the Saltpenny's seams drink it up faster than I can buy it." },
      },
      choices = {
        { text = "Why don't you cut it yourself?", next = "reed_why" },
        { text = "You seem to need an awful lot of it.", next = "reed_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reed_why = {
      lines = { { id = "rw_default", text = "Because the beds are crawling with murlocs, shipmate, and worse things further out, and a captain who loses a hand cutting reeds is a captain who can't hold a wheel. Besides, my crew are sailors, and you couldn't pay a sailor to wade where he can't see the bottom." } },
      choices = { { text = "Something else, Bloads.", next = "BACK" } },
    },
    reed_more = {
      lines = { { id = "rm_default", text = "Every time the Saltpenny trades shots with a Bloodsail brig, she comes home with a dozen new leaks, shipmate. I've caulked her so often that she's more reed than oak by now, and I'll keep buying bundles as long as you keep bringing them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    marque = {
      lines = {
        { id = "mq_default", text = "It's a paper with the Baron's seal on it, shipmate, saying that what I take from the Bloodsail is lawful prize and not piracy. The Baron gets his cut, the Bruisers don't hang me, and every red sash on the sea is fair game." },
      },
      choices = {
        { text = "So you're a pirate with permission.", next = "marque_pirate" },
        { text = "How did you earn the Baron's seal?", next = "marque_earn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marque_pirate = {
      big = true,
      lines = { { id = "mp_default", text = "That's what the Bloodsail call me, and I'll own it on a dark night. But I don't burn villages or sell prisoners, shipmate, and the paper says so, and I keep to every line of it." } },
      choices = {
        { text = "The paper's what makes it right. Keep to it.", next = "BACK", reply = "Aye, and it's the paper that'll keep me off a gibbet when I'm old, shipmate. A pirate with rules lives a good deal longer than one without.", fx = { align = { order = 1 } } },
        { text = "Paper or no paper, you're still a pirate.", next = "BACK", reply = "Maybe so, shipmate, and I'll not lose sleep over the word. But ask the Bloodsail what kind of pirate sinks their reeds, and you'll get a different answer.", fx = { align = { order = -1 } } },
        { text = "How did you earn that paper, anyway?", next = "marque_earn" },
      },
    },
    marque_earn = {
      lines = { { id = "me_default", text = "I brought in a Bloodsail cutter with her hold full of the Baron's own stolen rum, shipmate, and I didn't drink a drop on the way home. He said a man that honest was either a fool or useful, and he's still deciding which." } },
      choices = { { text = "Something else, Bloads.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },

    ship = {
      lines = {
        { id = "sh_default", text = "The Saltpenny, shipmate, a sloop small enough to slip through the reefs where the big Bloodsail brigs can't follow, and fast enough to run when there's three of them. I named her for the first coin I ever earned at sea, which I still keep sewn in my hat." },
      },
      choices = {
        { text = "Why keep the coin?", next = "ship_coin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ship_coin = {
      lines = { { id = "sc_default", text = "To remind me I started with one penny and a bad name, shipmate. Anything I've got beyond that is the sea's to take back, and knowing that makes a man braver than he's got any right to be." } },
      choices = { { text = "Something else, Bloads.", next = "BACK", fx = { affinity = 1 } } },
    },

    name = {
      lines = { { id = "nm_default", text = "It's my father's name, shipmate, though the crew swear it's because I bring home boat loads of prize. I let them believe it, because a crew that thinks its captain is lucky works twice as hard." } },
      choices = {
        { text = "Then let's hope your luck holds.", next = "BACK", fx = { affinity = 1 } },
        { text = "Boat loads? That's terrible.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    raiders = {
      lines = { { id = "rr_default", text = "Good sailors and hard drinkers, shipmate, and we're on the same side, mostly. Fleet Master Seahorn runs a tighter ship than I do, though, and he'd sooner I sailed under his flag than under my own paper." } },
      choices = {
        { text = "Why not join them?", next = "raiders_join" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raiders_join = {
      lines = { { id = "rj_default", text = "Because a Blackwater crew answers to Seahorn, and the Saltpenny answers to me, shipmate. I've had masters before, and I left Westfall to be done with them." } },
      choices = { { text = "Something else, Bloads.", next = "BACK" } },
    },

    x_human = {
      lines = { { id = "xh_default", text = "I miss the harvests, shipmate, and the smell of the fields after rain, but I don't miss being hungry. From what I hear, Westfall's worse now than when I left, with the Defias in every farmhouse, so I'll stay where the sea feeds me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the coast from the Cape to the Wild Shore, shipmate, and every Bloodsail sail I've seen on it." } },
    background = { { id = "tp_bg", text = "Westfall farm boy turned sailor, now master of the Saltpenny under the Baron's letter of marque.", next = "marque" } },
    advice = { { id = "tp_ad", text = "Never wade where you can't see your feet, shipmate, not on this coast." } },
    bloodsail = { { id = "tp_blood", text = "Red sashes, black hearts and leaky brigs, shipmate, and all of it's lawful prize to me." } },
    _none = { { id = "tp_none", text = "Never heard of it, shipmate, and I've heard most things said in a port tavern." } },
  },
}

------------------------------------------------------------------------
-- Caravaneer Ruzzgot: Steamwheedle caravan boss, the jungle road's oldest survivor
------------------------------------------------------------------------
P:NPC {
  key = "ruzzgot", id = 3945, name = "Caravaneer Ruzzgot",
  bible = "bibles/booty_bay_visitors.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "gruff", "brisk" }, values = { "trade", "practical" },
  notices = { "class", "race" },

  impression = {
    first = "He prices every danger on the jungle road to the copper.",
    third = "{name} met Caravaneer Ruzzgot, a goblin caravan boss in Booty Bay who has driven the Steamwheedle's wagons through Stranglethorn for longer than most of its bandits have been alive.",
  },

  greetings = {
    { id = "g_default", text = "Make it quick, partner, because I've got wagons to load and every hour they sit here is an hour of feed I'm payin' for." },
    { id = "g_back", when = { metBefore = true }, text = "You again, partner, and still breathin'! That puts you ahead of six drivers I hired this year, rest their ledgers." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, partner, and I'd already written you into the ledger under losses, so you've done my accounts a favour by walkin' in." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, eh? The Cartel's wagons carry for anybody who pays, partner, and the raptors don't check colours either." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter with a beast at heel, partner! I could use you ridin' point, because a raptor smells another animal long before it smells a wagon." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, and no blue paint of the Bloodscalp on you, I'm glad to see. Out on the road, partner, my drivers shoot first and check the tusks after." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ruzzgot, caravaneer for the Steamwheedle Cartel, and if it rolls between Booty Bay and the Cartel's other ports, it rolled behind my mules, partner. Raptors, trolls, rebels and bandits, I've had 'em all at my wagons, and I've billed for every one of 'em." },
        { id = "h_passage", when = { questDone = TODO_QUEST("Passage to Booty Bay") },
          text = "So you made the passage down to Booty Bay in one piece, partner, which tells me you can follow directions and keep your head. That's two more qualities than most of my drivers have." },
        { id = "h_road", tags = { "news" }, when = { questActive = TODO_QUEST("The Caravan Road") },
          text = "You're on the caravan road for me, partner, so keep your eyes on the treeline and your hand on your purse. The Cartel pays on delivery, and the jungle collects on anything that's late." },
        { id = "h_road_done", when = { questDone = TODO_QUEST("The Caravan Road") },
          text = "There's the one who ran the caravan road and came back, partner! I've put your name in my good ledger, which is a short book with a lot of empty pages." },
      },
      again = {
        { id = "h_again", text = "What else, partner? Talk while I count crates." },
        { id = "h_again2", text = "Go on, partner, but keep it short, because mules eat whether I'm listenin' or not." },
        { id = "h_again3", text = "Still here? Then pick up a crate while you ask, partner, and we'll call it even." },
      },
      choices = {
        { text = "What's the caravan road like?", next = "road" },
        { text = "Which trolls trouble your wagons?", next = "trolls" },
        { text = "What about the rebels and bandits?", next = "kurzen" },
        { text = "How did you get into caravans?", next = "past" },
        { text = "Your wagons must carry all sorts.", next = "cargo" },
        { text = "Do you hire guards, Ruzzgot?", next = "x_guard", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "Safe roads, Ruzzgot.", next = "END" },
      },
    },

    road = {
      lines = {
        { id = "rd_default", text = "Long, wet and hungry, partner, from the Bay up through the jungle to Grom'gol and the Rebel Camp, then on to wherever the Cartel's got somethin' to sell. Every mile of it's got a price, and the price goes up every time somebody new moves into the trees." },
      },
      choices = {
        { text = "What's the worst stretch?", next = "road_worst" },
        { text = "I can't believe raptors really attack wagons.", next = "raptors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_worst = {
      lines = { { id = "rw_default", text = "The bend below Mizjah Ruins, partner, where the road runs close to the old stones and the trees come right down to the ruts. I've lost three wagons there, and I charge triple on any cargo that has to pass it after dark." } },
      choices = { { text = "Something else, Ruzzgot.", next = "BACK" } },
    },
    raptors = {
      lines = { { id = "rp_default", text = "Do they ever, partner! A raptor pack will chase a mule for a mile, and the mule knows it, so it bolts, and then I've got a crate of Gadgetzan whiskey rollin' off into the brush. That's why my wagons carry fireworks from Crazk Sparks, because nothin' scatters a pack like a rocket up the backside." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    trolls = {
      lines = {
        { id = "tr_default", text = "The Bloodscalp in the north and the Skullsplitter in the middle of the jungle, partner, and both of 'em think the road runs through their land, which it does, technically. The Bloodscalp take scalps and the Skullsplitter take skulls, and the names tell you everything you need to know about their negotiating style." },
      },
      choices = {
        { text = "Have you ever tried paying them off?", next = "trolls_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls_pay = {
      big = true,
      lines = { { id = "tp_default", text = "Once, partner, a crate of rum to a Skullsplitter chief for a month of clear road, and he drank it and raided us the next morning anyway. Now I pay adventurers to thin 'em out instead, which costs more but at least it stays paid." } },
      choices = {
        { text = "A bargain broken is no bargain. You were right to stop.", next = "BACK", reply = "Right as rain, partner, and it cost me a whole crate of rum to learn it. A deal's only as good as the fella who keeps it, and that chief kept nothin' but my rum.", fx = { align = { order = 1 } } },
        { text = "It's their land. Pay them better and keep paying.", next = "BACK", reply = "Pay 'em better? Partner, I paid in rum and got raided in steel, so the exchange rate's terrible. Their land or not, I'll put my coin on adventurers with sharp swords.", fx = { align = { order = -1 } } },
        { text = "I hope he at least gave you the crate back.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    kurzen = {
      lines = {
        { id = "kz_default", text = "Colonel Kurzen's soldiers, you mean, who've gone bad up in the north of the jungle, partner, and they'll take a wagon of food without blinkin' because they've gone hungry out there. The bandits are worse, because a bandit doesn't even want the food, he wants the mules and the driver's boots." },
      },
      choices = {
        { text = "Who are Kurzen's men, exactly?", next = "kurzen_who" },
        { text = "You haven't said a word about the Venture Company.", next = "venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kurzen_who = {
      lines = { { id = "kw_default", text = "Soldiers from up north who came to fight the trolls and decided they liked runnin' the jungle themselves, partner. The men at the Rebel Camp say Kurzen went bad, and I say anybody who steals my flour is bad by definition." } },
      choices = { { text = "Something else, Ruzzgot.", next = "BACK", fx = { learn = { "kurzen" } } } },
    },
    venture = {
      lines = { { id = "vn_default", text = "Don't get me started, partner, because those Venture Company lumber crews tear up the road with their shredders and then send me an invoice for the ruts. Goblins, sure, but goblins who'd sell their own mothers for timber, and charge her for the saw." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } } },
    },

    past = {
      lines = {
        { id = "ps_default", text = "Started as a mule boy for the Cartel at nine, partner, shovelin' what mules leave behind, and worked my way up to the front of the wagon. Twenty-two years on this road now, and I've got the scars, the debts and a very loyal mule to show for it." },
      },
      choices = {
        { text = "Tell me about the mule.", next = "past_mule" },
        { text = "Where did the scars come from?", next = "past_scars" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_mule = {
      lines = { { id = "pmu_default", text = "Her name's Collateral, partner, because I borrowed against her once and nearly lost her to the bank. She's kicked two raptors to death and bit a Kurzen sergeant, and if you go near her feed bag, she'll make it three." } },
      choices = { { text = "Something else, Ruzzgot.", next = "BACK", fx = { affinity = 1 } } },
    },
    past_scars = {
      lines = { { id = "psc_default", text = "This one's a Bloodscalp axe, this one's a raptor, and this one's a crate of Crazk's fireworks that went off early, partner. Guess which one hurt worst, and then don't ever tell Crazk." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cargo = {
      lines = { { id = "cg_default", text = "Whatever pays, partner: rum and cloth up the road, hides and ore and jungle herbs back down, and the odd crate I don't open, because the Cartel pays extra for a goblin who doesn't open crates. The Baron gets his cut at the gate either way, so I keep my ledger very tidy." } },
      choices = { { text = "Something else, Ruzzgot.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },

    x_guard = {
      lines = { { id = "xg_default", text = "Always, partner, and I pay by the mile with a bonus for every wagon that reaches the end with its wheels on. You look like you'd earn the bonus, but the last guard who looked that good got carried off by a tiger, so don't get cocky." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know every rut in the jungle road, partner, and who's waitin' in the trees beside it." } },
    background = { { id = "tp_bg", text = "Mule boy at nine, caravan boss at thirty, and still on the Steamwheedle's road twenty-two years on.", next = "past" } },
    advice = { { id = "tp_ad", text = "Stay on the road, partner, and if you hear a raptor call, don't call back." } },
    kurzen = { { id = "tp_kurzen", text = "Soldiers gone bad, with rifles and empty stomachs, partner, and they eat my flour." } },
    _none = { { id = "tp_none", text = "Never carried it, partner, so I couldn't tell you what it's worth." } },
  },
}

------------------------------------------------------------------------
-- Grizzlowe: shipmaster for the Maiden's Fancy, connoisseur of clam chowder
------------------------------------------------------------------------
P:NPC {
  key = "grizzlowe", id = 9559, name = "Grizzlowe", title = "Shipmaster",
  bible = "bibles/booty_bay_visitors.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "jovial", "chatty" }, values = { "trade", "practical" },
  notices = { "class", "race" },

  impression = {
    first = "He calls everyone passenger, as if the ticket were already sold.",
    third = "{name} met Grizzlowe, the goblin shipmaster who keeps the Maiden's Fancy's berth in Booty Bay and swears by the port's clam chowder.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to the berth of the Maiden's Fancy, passenger! Have you tried the chowder yet? You should try the chowder." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, passenger! Either you missed the boat or you came back for the chowder, and I hope it's the chowder." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, passenger, and the Fancy's made the crossing four times while you were away. Kelsey Yance at the inn has changed his clams twice, too, so you've got some catching up to do." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde passengers ride the Fancy same as anybody, at the same fare, and they're sick over the same rail, passenger." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf on my dock! Your people are the worst sailors I've ever carried, passenger, so sit near the middle of the deck and keep your eyes on the horizon." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, eh? You could probably just blink yourself across the sea, passenger, but you'd miss the chowder in Ratchet, which isn't as good as ours, but it's close." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I must tell you, passenger, Booty Bay has the best clam chowder anywhere in the South Seas. Oh, not hungry? Then welcome to the berth of the Maiden's Fancy, the finest passenger ship between the Eastern Kingdoms and Kalimdor, and she'll be back for the run to Ratchet soon, so get comfortable." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Late crossing, passenger? The Fancy runs at night same as day, and the sea's calmer, mostly, though you'll want a bowl of something warm in you first, and I know just the place." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "That beast of yours is welcome aboard, passenger, as long as it doesn't eat the other passengers or my lunch. The last cat that crossed with us ate a whole pot of chowder, and frankly I respected it." },
      },
      again = {
        { id = "h_again", text = "What else, passenger? The Fancy's not in yet, so we've got time." },
        { id = "h_again2", text = "Go on, passenger, ask away, but if it's about chowder, I'll need a while." },
        { id = "h_again3", text = "Still waiting on the ship? Good, so am I, passenger." },
      },
      choices = {
        { text = "What's so special about the chowder?", next = "chowder" },
        { text = "Tell me about the Maiden's Fancy.", next = "ship" },
        { text = "What's the crossing to Ratchet like?", next = "crossing" },
        { text = "Do the Bloodsail ever go after the Fancy?", next = "pirates" },
        { text = "Someone must run things on the Ratchet end.", next = "ratchet" },
        { text = "I get seasick. Any advice?", next = "x_sick", when = { race = { "Dwarf", "Gnome", "Tauren" } } },
        { text = "I'll wait for the ship.", next = "END" },
      },
    },

    chowder = {
      lines = {
        { id = "ch_default", text = "Fresh clams from the cove, passenger, cream that only spent one day on a boat, and Kelsey Yance's secret, which he won't tell me no matter what I offer. I've eaten chowder in every port the Cartel trades in, and nothing comes close, and I've done the accounting." },
      },
      choices = {
        { text = "Did you really offer to buy the recipe?", next = "chowder_offer" },
        { text = "You must have had some terrible chowder in your time.", next = "chowder_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chowder_offer = {
      big = true,
      lines = { { id = "co_default", text = "Forty gold, passenger, and a free crossing every month for life, and she laughed me off the kitchen step. I've half a mind to hire somebody to sneak in and watch her at the stove, but she's got a ladle and a long memory." } },
      choices = {
        { text = "Her recipe is hers. Leave it be.", next = "BACK", reply = "Leave it be? Passenger, that chowder's the finest thing on this coast, and recipes are a commodity like any other. Still, she'd brain me with a ladle, so maybe you've got a point.", fx = { align = { honor = 1 } } },
        { text = "A good recipe is fair game. Watch her and learn.", next = "BACK", reply = "My thinking exactly, passenger, and I'll pay a spy in clams if I have to. One day that chowder will be served on the Maiden's Fancy, and she'll never know how.", fx = { align = { honor = -1 } } },
        { text = "A free crossing every month? I'll take that deal.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    chowder_worst = {
      lines = { { id = "cw_default", text = "Menethil Harbor, passenger, where the dwarves put mushrooms in it and called it improvement. I sent it back, and they sent back a bill, and I paid it out of respect for the nerve." } },
      choices = { { text = "Something else, Grizzlowe.", next = "BACK" } },
    },

    ship = {
      lines = {
        { id = "sh_default", text = "The Maiden's Fancy, passenger, the finest passenger ship on the South Seas, and you can quote me, because I paid for the sign that says so. She's broad in the beam, steady in a swell, and she's never lost a passenger who stayed on the deck." },
      },
      choices = {
        { text = "Who's lost a passenger who didn't stay on deck?", next = "ship_lost" },
        { text = "The Maiden's Fancy is an odd name for a ship.", next = "ship_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ship_lost = {
      lines = { { id = "sl_default", text = "A gnome who wanted to measure the wake, passenger, and leaned out with a measuring stick. We fished him out with a net, and he was fine, and he had the measurement, too, so everybody was happy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ship_name = {
      lines = { { id = "sn_default", text = "The Cartel bought her secondhand off a human merchant, passenger, and the name came with the hull, and repainting costs money. Some say there was a maiden, and some say there was a fancy, and the crew says it doesn't matter as long as she floats." } },
      choices = { { text = "Something else, Grizzlowe.", next = "BACK" } },
    },

    crossing = {
      lines = {
        { id = "cr_default", text = "A few days of open water, passenger, south of the Cape and across to the coast of the Barrens, with sea birds, the odd shark and a whole lot of people throwing up over the rail. Most folks get their sea legs by the second day, and the rest get to know the rail very well." },
      },
      choices = {
        { text = "What do people do on the crossing?", next = "crossing_pass" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crossing_pass = {
      lines = { { id = "cp_default", text = "Cards, mostly, passenger, and every game ends with an orc and a dwarf glaring at each other over a pile of copper. The Cartel's rule is no fighting aboard, and the crew enforce it with buckets of seawater, and a soggy orc sulks instead of swinging." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    pirates = {
      lines = {
        { id = "pr_default", text = "They've tried, passenger, but the Fancy flies the Steamwheedle flag, and the Bloodsail know the Cartel sends the Blackwater after anybody who touches a passenger ship. Still, I watch for red sails past the Cape, and the crew keep a cannon or two under the tarps." },
      },
      choices = {
        { text = "Have they ever actually attacked?", next = "pirates_attack" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates_attack = {
      lines = { { id = "pa_default", text = "Once, passenger, three years back, a Bloodsail sloop came alongside at dawn. The passengers that morning were mostly orcs and dwarves on their way to fight somebody, and the pirates left in a hurry, missin' a mast." } },
      choices = { { text = "Something else, Grizzlowe.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },

    ratchet = {
      lines = {
        { id = "rt_default", text = "Gazlowe runs Ratchet, passenger, and he's a builder, so the docks over there are sturdier than ours, which he mentions every time I see him. He and the Baron keep the route going between 'em, and they pretend not to like each other, which is good business." },
      },
      choices = {
        { text = "What's Ratchet's chowder like?", next = "ratchet_chowder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ratchet_chowder = {
      lines = { { id = "rc_default", text = "Not bad, passenger, not bad at all, but a cook in Ratchet uses river clams and won't admit it. Gazlowe says it's better than ours, and that's how I know he's never had Kelsey's." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },

    x_sick = {
      lines = { { id = "xs_default", text = "Eat light before you sail, passenger, keep your eyes on the horizon and stay near the middle of the deck. And whatever you do, don't have the chowder right before boarding, which pains me to say." } },
      choices = { { text = "Something else, Grizzlowe.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the route from here to Ratchet, passenger, and every bowl of chowder on either end of it." } },
    background = { { id = "tp_bg", text = "Shipmaster for the Maiden's Fancy, Steamwheedle Cartel, and Booty Bay's most devoted chowder eater.", next = "ship" } },
    advice = { { id = "tp_ad", text = "Stay on deck and keep your eyes on the horizon, passenger, and you'll be fine." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel owns the Fancy, passenger, and the Cartel's flag keeps the pirates honest, mostly." } },
    _none = { { id = "tp_none", text = "Can't say, passenger, but I can tell you where to get a good bowl of chowder." } },
  },
}
