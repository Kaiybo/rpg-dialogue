-- Undercity quest givers, trainers and visitors added in World of Warcraft: Forever (1.60.1), from warcraft.wiki.gg.
-- Garen Largo (Paladin Trainer, War Quarter), Glix Xizzix (goblin barber, Trade Quarter; Leonid's Letter),
-- Tanis Alderwood (beggar, Trade Quarter; A Lesson in Divinity 1-3), Morbin Lightbane (paladin, Royal Quarter;
-- Light's Justice), Rugbul Boomfirst (Darkspear Islands Battlemaster, Royal Quarter).
-- Voice: bibles/uc_forever_quests.md (see "Authored, not canon").
-- The three "A Lesson in Divinity" quests share one title, so they use the wiki's quest IDs
-- (94427, 94434, 94435) instead of TODO_QUEST, which matches by title.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Garen Largo: the Forsaken paladin trainer. Breaks students of what they learned so he can teach them anew.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_garen_largo", id = TODO_NPC("Garen Largo"), name = "Garen Largo", title = "Paladin Trainer",
  bible = "bibles/uc_forever_quests.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "stern", "patient" }, values = { "pious", "loyal" },
  notices = { "class", "origin" },
  impression = {
    first = "He offers the Light's solace like something handed across a table.",
    third = "{name} met Garen Largo, who trains the Forsaken's paladins in the War Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Do you require training in the ways of the Light? It still answers here, whatever the Scarlets in their Monastery say." },
    { id = "g_notpal", when = { ["not"] = { class = "PALADIN" } }, text = "You may not be a paladin, but you may yet find solace in the Light, should you ever go looking for it." },
    { id = "g_back", when = { metBefore = true, class = "PALADIN" }, text = "Back again. Show me your stance, and then tell me what the Light has cost you since we last spoke." },
  },

  notice = {
    { id = "n_knight", cat = "origin", when = { origin = "forsaken_risen_knight" },
      text = "You held a Silver Hand oath once, I can see it in how you carry the hammer. Most of what the Order taught you, I'll have to teach you again, because the Light sits differently in dead hands." },
    { id = "n_squire", cat = "origin", when = { origin = "forsaken_unsworn_squire" },
      text = "A squire who never took the oath. That makes my work easier, because there's less to unlearn, and I've no old Order habits to fight." },
    { id = "n_living", cat = "class", when = { class = "PALADIN", ["not"] = { race = "Scourge" } },
      text = "A living paladin, down here with us. The Light doesn't burn you when you call it, does it? Remember that, when you watch my students wince." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Garen Largo, and I teach the Forsaken who still hear the Light to answer it. It burns us when we call, and it comes anyway, and I've stopped asking why and started asking what we owe it." },
        { id = "h_notpal", when = { ["not"] = { class = "PALADIN" } }, text = "You're no paladin, and I've no training to give you, but sit a moment if you like. The Light isn't only for those of us who carry a hammer." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly; I've no patience for flattery." },
        { id = "h_again2", text = "Go on. My next student is late, so the time's yours." },
      },
      choices = {
        { text = "Why does the Light answer the dead?", next = "light" },
        { text = "What does it mean, to break a student?", next = "retrain" },
        { text = "Who leads the Forsaken paladins?", next = "keep" },
        { text = "I'd like to train in the ways of the Light.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "I served the Scarlet Crusade, once.", next = "xscarlet", when = { origin = "forsaken_scarlet_turned" } },
        { text = "Light keep you, Garen.", next = "END" },
      },
    },

    light = {
      lines = { { id = "li_default", text = "Perhaps because faith was never a thing of the flesh, and the plague only took the flesh. The Scarlets say we stole it, and the Argent Dawn aren't sure, and we go on calling it, and it goes on coming." } },
      choices = {
        { text = "Does it hurt, when you call it?", next = "light_hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_hurt = {
      big = true,
      lines = { { id = "lh_default", text = "Every time, like holding a hand over a candle and refusing to pull it back. Some of my students think the pain is penance, and some think it's only the price, and I've stopped settling the matter for them." } },
      choices = {
        { text = "It's penance, and it means we can be forgiven.", next = "light_after", fx = { align = { light = 1 } } },
        { text = "It's a price. Pay it, and use the weapon.", next = "light_after", fx = { align = { light = -1 } } },
      },
    },
    light_after = {
      lines = { { id = "la_default", text = "Hold to that, then, and see whether it holds you up when the hammer's heavy. That's the only test I know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    retrain = {
      lines = { { id = "br_default", text = "Most who come to me learned the Light in life, under the Order, and it sits wrong in them now, so I break them of what they knew and teach them anew. It grows harder each time I do it, for them and for me, so I charge more each time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    keep = {
      lines = { { id = "ke_default", text = "Danitha Morr, at Bandarion Keep in the west of the Glades. She was a knight of the Silver Hand, and she finds our lost paladins and teaches them to serve again, and she sends the promising ones to me when they've got their footing." } },
      choices = {
        { text = "Who was Bandarion?", next = "garek" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garek = {
      lines = { { id = "ga_default", text = "Garek Bandarion, captain of the Deathguard, and the first of us the Light answered. He gave his life a second time to save this kingdom from the Scourge, and every Forsaken who lifts a hammer now walks the road he cut." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xscarlet = {
      lines = { { id = "xs_default", text = "So did a good many of my students. The Crusade taught you to hate what you've become, and I'll have to teach you that the Light didn't agree with them, and that's the hardest lesson I give." } },
      choices = {
        { text = "I still hear their prayers in my head.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I carried the Light in life and lost it in the plague, and found it waiting when I woke. I've not let go of it since." } },
    advice = { { id = "tp_ad", text = "Call the Light when it hurts most. That's when you'll learn whether you mean it." } },
    _none = { { id = "tp_none", text = "I can't tell you that. Ask at the keep, or ask the Light, which answers questions more often than people do." } },
  },
}

---------------------------------------------------------------------------
-- Glix Xizzix: goblin visionary, entrepreneur and barber; claims he armed the resistance that founded the Forsaken.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_glix", id = TODO_NPC("Glix Xizzix"), name = "Glix Xizzix", title = "Visionary, Entrepeneur, Barber",
  bible = "bibles/uc_forever_quests.md", role = "vendor", tier = "quest",
  communities = { "undercity" }, temper = { "brash", "greedy" }, values = { "ambitious", "practical" },
  notices = { "race", "class" },
  impression = {
    first = "His boasting is mostly sales talk, though not all of it.",
    third = "{name} met Glix Xizzix, a goblin merchant turned barber who claims a large part in the Forsaken's founding.",
  },

  greetings = {
    { id = "g_default", text = "Step right up, pal, step right up! Haircuts, shaves, trims and a little light conversation, all priced to move." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, a repeat customer! That's what I like to see, buddy, loyalty, and loyalty's worth a discount I'm not gonna give you." },
    { id = "g_letter", when = { questActive = TODO_QUEST("Leonid's Letter") }, text = "What's that you've got? Leonid sent you? Well, sparks and sprockets, I haven't seen that crusty old soldier since the war was raining down on our heads." },
  },

  notice = {
    { id = "n_bald", cat = "race", when = { race = "Scourge" },
      text = "Whoa, whoa, hold still, pal, you've got a patch of scalp showing there that's bad for business. Mine, I mean, because folks see you walk out of here like that and they think I did it." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll! Now that's what I call hair, buddy, a whole mane of it and growing, and you know how rare that is down here? I'd style it for half price, if half price was a thing I did." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Hands where I can see 'em, chum, because the lost and found's my inventory, not your opportunity." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "That's right, pal, you're lookin' at Glix Xizzix, the famous trader who kept this city supplied through the whole Scourge war, and the genius who put weapons in the Dark Lady's hands when she needed 'em most. I sign autographs too, for a modest fee." },
        { id = "h_letter_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Leonid's Letter"), days = 3 } },
          text = "Leonid's letter, huh? He wants a favour, of course, because nobody writes to a goblin to say hello, and he told you I'd tip you, which I never agreed to. Still, you did the walking, so I'll call it even, kid." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren in my chair would break the chair, buddy, so let's talk business standing up. You want a horn polish? I could do a horn polish." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time's money, and you're using mine." },
        { id = "h_again2", text = "Keep talking, chum, I'm billing by the minute." },
        { id = "h_again3", text = "Another question? Sure, sure, the first one was free, and so's this one, I'm generous like that." },
      },
      choices = {
        { text = "You armed the resistance? Really?", next = "war" },
        { text = "Why is a merchant cutting hair?", next = "barber" },
        { text = "Who are your customers down here?", next = "customers" },
        { text = "Any relation to Pix Xizzix in Booty Bay?", next = "family" },
        { text = "How do you know Leonid?", next = "leonid", when = { questDone = TODO_QUEST("Leonid's Letter") } },
        { text = "Let's see what you've got.", next = "BUSINESS" },
        { text = "Keep the change, Glix.", next = "END" },
      },
    },

    war = {
      lines = { { id = "wa_default", text = "Armed it, fed it, outfitted it, you name it, buddy! Well, all right, the gnolls of the Rot Hide pack jumped my caravan out in Tirisfal and took every last crate, and the Dark Lady's people got 'em back for me, and then I sold 'em the crates." } },
      choices = {
        { text = "Who got your crates back?", next = "war_who" },
        { text = "So you sold them their own rescue?", next = "war_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_who = {
      lines = { { id = "ww_default", text = "Garek Bandarion and Dark Ranger Anya, a paladin and a ranger, both dead and both very unfriendly to gnolls. They tore through that camp and put down Warlord Torgo, and I had my crates back by supper, minus a few I'm still invoicing the gnolls for." } },
      choices = {
        { text = "Garek Bandarion's dead now, isn't he?", next = "garek" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garek = {
      lines = { { id = "ga_default", text = "Yeah, pal, he went down fighting the Scourge for this city, and they named a whole keep after him for it. Good customer, honest dealer, never haggled, and I'd have given him a discount, probably, if he'd asked, which he didn't, so." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    war_stance = {
      big = true,
      lines = { { id = "ws_default", text = "I sold 'em supplies at a fair market price in a time of crisis, buddy, which is called a service. Without my crates the Dark Lady's got a lot of angry corpses and nothing to hit anybody with, so you tell me who's the hero." } },
      choices = {
        { text = "Profit's profit, and the Forsaken got their weapons. Well played.", next = "war_after", fx = { align = { honor = -1 } } },
        { text = "You turned a rescue into a sale. That's shabby, Glix.", next = "war_after", fx = { align = { honor = 1 } } },
      },
    },
    war_after = {
      lines = { { id = "wf_default", text = "Hey, everybody's a critic, and everybody's a customer, too, so it all comes out in the ledger. Anyway, that's history, and history doesn't pay rent." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    barber = {
      lines = { { id = "ba_default", text = "One word for you, bub: diversification! You've got to keep your revenue streams diversified, because the caravan business dries up and the barber business never does, since hair keeps growing even after you're dead, mostly, on some of you, anyway." } },
      choices = {
        { text = "Does hair really keep growing on the dead?", next = "hair" },
        { text = "What's in the lost and found?", next = "lostfound" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hair = {
      lines = { { id = "ha_default", text = "On some of 'em, sure, in patches, and that's where I come in, pal, with a comb and a little tonic and a lot of confidence. The rest I sell hats to, so either way it's a sale." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lostfound = {
      lines = { { id = "lf_default", text = "You'd be surprised how many of these Forsaken leave their stuff lying around after a haircut, buddy, rings and pipes and once a whole arm. There's a joke in there about 'em being brainless, but in a lot of cases I suspect it's just true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    customers = {
      lines = { { id = "cu_default", text = "Deathguard, apothecaries, the odd Deathstalker who wants to look sharp for a knifing, and the living Horde folk off the zeppelin who want a trim before they meet the Dark Lady. Everybody's got hair, or used to, and everybody's got money, or used to." } },
      choices = {
        { text = "Do the apothecaries tip?", next = "apoth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apoth = {
      lines = { { id = "ap_default", text = "In vials, pal, and I don't drink 'em, I don't sell 'em and I don't ask what's in 'em. They're stacked in the back in a nice safe crate, and if anything in there starts glowing, I'm closing early." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    family = {
      lines = { { id = "fa_default", text = "Pix? Little Pix, with the shop in Booty Bay? That's my brother's girl, and her brothers Rix and Frix too, and I told my brother when they sailed out of Undermine that those kids would either make a fortune or set fire to one. Jury's still out, buddy." } },
      choices = {
        { text = "She's doing well, from what I saw.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    leonid = {
      lines = { { id = "le_default", text = "Leonid Barthalomew, Argent Dawn, crusty as an old pie and twice as hard to chew. We were stuck together with the Dark Lady's lot back in the war, him swinging a hammer and me selling him whetstones, and he's never once paid full price." } },
      choices = {
        { text = "What was in his letter?", next = "letter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letter = {
      lines = { { id = "lt_default", text = "Personal correspondence, pal, and confidential, which in goblin means it'll cost you. Let's just say he's checking I haven't gone soft, and that he still owes me for a crate of bandages from the war." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Caravan boss, war hero, logistical genius, barber. It's all on the sign, pal, I paid extra for the letters." } },
    advice = { { id = "tp_ad", text = "Diversify, buddy. If one business blows up, and believe me they do, you've got another one standing." } },
    trade = { { id = "tp_tr", text = "Cuts, shaves, a little tonic and the lost and found. Plus whatever else turns a profit this week." } },
    steamwheedle = { { id = "tp_sw", text = "Good people, great margins, and they keep the zeppelins flying, which keeps my customers coming. I'm independent, though, pal, because I like to keep the whole cut." } },
    _none = { { id = "tp_none", text = "Never heard of it, buddy, and if I haven't heard of it, it's not making anybody any money." } },
  },
}

---------------------------------------------------------------------------
-- Tanis Alderwood: a beggar in the Trade Quarter whose wife is coming apart and who fears paladins.
-- A Lesson in Divinity (1) ends with him; (2) he gives and takes; (3) he gives, back to Danitha Morr.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_tanis", id = TODO_NPC("Tanis Alderwood"), name = "Tanis Alderwood",
  bible = "bibles/uc_forever_quests.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "nervous", "gentle" }, values = { "loyal", "humble" },
  notices = { "paladin", "race", "kindness" },
  impression = {
    first = "He begs for his wife's sake and would do anything for her.",
    third = "{name} met Tanis Alderwood, a Forsaken beggar in the Trade Quarter whose wife is falling apart.",
  },

  greetings = {
    { id = "g_default", text = "Spare a copper, friend? Not for me, I've no use for it, but for my wife, if you'd be so kind." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Folk don't, mostly, once they've given a copper and gone." },
    { id = "g_paladin", when = { class = "PALADIN", ["not"] = { questDone = 94434 } }, text = "Oh, Light, a paladin. I'll move along, I'll move along, there's no need for any trouble." },
    { id = "g_cloth", when = { questActive = 94434 }, text = "Have you the cloth? Please, take your time, I didn't mean that the way it sounded, only she's no better tonight." },
    { id = "g_friend", when = { questDone = 94434 }, text = "There's my friend! Merra's holding together, thanks to you, and she asks after the kind paladin, as best she can." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "The living don't usually stop for me. I think I make them think about what's waiting, and I don't blame them for walking faster." },
    { id = "n_priest", cat = "kindness", when = { class = "PRIEST" },
      text = "A priest. Do you know any prayers for holding a body together? I don't mean that cleverly; I'd say one every night if it helped." },
    { id = "n_knight", cat = "paladin", when = { origin = "forsaken_risen_knight" },
      text = "You were a knight, weren't you, one of the Silver Hand? They came through our village once, before, and my wife baked for them, and they thanked her like she was a lady." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Tanis Alderwood, and I'm sorry to be under your feet. I'm not supposed to be begging here, I know, but my wife needs mending and the apothecaries haven't the time, so I ask for what I can and I make do." },
        { id = "h_ready1", tags = { "news" }, when = { questReady = 94427 },
          text = "You... you're a paladin? Please, don't hurt me. I know I'm not meant to be panhandling, and I've no quarrel with your order, none at all, so I'll go, if you'll only let me." },
        { id = "h_before2", when = { questDone = 94427, questBefore = 94434 },
          text = "You came to help? A paladin, helping a beggar like me? I don't understand it, but I'm not fool enough to turn it away, not with Merra the way she is." },
        { id = "h_active2", tags = { "news" }, when = { questActive = 94434 },
          text = "Ten lengths of linen, that's all, fresh and clean. I'd wrap her myself, I've a steady enough hand for it, and it'd hold her till the apothecaries come." },
        { id = "h_recent2", tags = { "news" }, when = { questRecent = { 94434, days = 3 } },
          text = "I wrapped her last night, every bit of her that needed it, and she sat up for the first time in a week. This is very kind of you, paladin, very kind indeed." },
        { id = "h_done", when = { questDone = 94435 },
          text = "You'll always have a friend in Tanis Alderwood, and that's not much, I know, a beggar's friendship. But it's the only thing I've got that's all my own." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I don't mind talking. Nobody else does, with me." },
        { id = "h_again2", text = "Go on, if you like. Merra's resting, and I've nowhere to be." },
      },
      choices = {
        { text = "What's wrong with your wife?", next = "wife" },
        { text = "Why won't the apothecaries help her?", next = "apoth" },
        { text = "Why are you afraid of paladins?", next = "fear" },
        { text = "Who was she, before?", next = "merra" },
        { text = "Danitha Morr sent me. I'm here to help.", next = "help", when = { questReady = 94427 } },
        { text = "Here's your cloth, Tanis.", next = "BUSINESS", when = { questActive = 94434 } },
        { text = "What happens now?", next = "after", when = { questDone = 94434 } },
        { text = "I can't stay. Good luck, Tanis.", next = "END" },
      },
    },

    wife = {
      lines = { { id = "wi_default", text = "She's falling apart, and I don't mean her spirits, I mean her arm came loose at the shoulder three nights ago and I had to tie it with string. The plague left her softer than me, somehow, and the stitches the Society gave her when she woke are giving out." } },
      choices = {
        { text = "How long has she been like this?", next = "wife_long" },
        { text = "Is there nothing you can do?", next = "wife_do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wife_long = {
      lines = { { id = "wl_default", text = "Since the winter, a little at a time. First her fingers, then her jaw, which was the worst, because she couldn't talk for three days and she'd always been the talker of the two of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wife_do = {
      lines = { { id = "wd_default", text = "Wrap her, if I had the cloth, so the pieces stay where they ought to while we wait. Linen's dear down here, though, and a beggar's coppers don't stretch far." } },
      choices = {
        { text = "I could find you cloth.", next = "cloth", when = { questDone = 94427, questBefore = 94434 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "cl_default", text = "You'd do that? Ten lengths of linen, then, fresh if you can, and I'll make her a wrapping that'll hold till the apothecaries come. I hope it's no imposition upon you, goodly paladin." } },
      choices = {
        { text = "No trouble at all. I'll be back with it.", next = "BUSINESS", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    apoth = {
      lines = { { id = "ap_default", text = "They can stitch her right as rain, everyone says so, but they're about the Dark Lady's business, all of them, and none are free for a beggar's wife. I asked at the Apothecarium four times, and the fourth time they set a guard on the door." } },
      choices = {
        { text = "Should the Society tend to its own people first?", next = "apoth_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apoth_stance = {
      big = true,
      lines = { { id = "as_default", text = "I don't know. I'm only a beggar, and the Dark Lady's work must be terrible important, to keep them all so busy. But I'd trade every bit of it for one apothecary and an afternoon." } },
      choices = {
        { text = "The war comes first. That's hard, but it's right.", next = "apoth_after", fx = { align = { order = 1 } } },
        { text = "A kingdom that can't mend one wife isn't worth much.", next = "apoth_after", fx = { align = { order = -1 } } },
      },
    },
    apoth_after = {
      lines = { { id = "aa_default", text = "Please don't say that too loud, not here, not on my account. I've enough trouble with the guards already." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fear = {
      lines = {
        { id = "fe_default", text = "Because the last paladins I saw wore red, and they burned the Hendricks farm with the family still inside, saying it was to stop the plague. It wasn't you, I know that, but the armour looks the same in the dark." },
        { id = "fe_paladin", when = { class = "PALADIN", race = "Scourge" }, text = "Forgive me, but you'll know the Scarlets, and what they did in the Light's name. When I see the hammer and the tabard, my legs decide for me before my head can catch up." },
      },
      choices = {
        { text = "Not every paladin is a Scarlet, Tanis.", next = "fear_more", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear_more = {
      lines = { { id = "fm_default", text = "No, I suppose not. There's that keep out west, isn't there, with dead paladins in it, and they say the woman in charge used to be a proper knight. I don't know what to make of that, but I'm trying." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    merra = {
      lines = { { id = "me_default", text = "Merra, and she baked for the whole village outside the capital, sweet buns on feast days that you'd smell from the crossroads. She laughed at everything, me most of all, and she still does, when her jaw's holding." } },
      choices = {
        { text = "She sounds wonderful.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    help = {
      lines = { { id = "he_default", text = "Help? A paladin wants to help a beggar like me? Well, I suppose you could be of some assistance, if you mean it, because it's my wife, you see, and she's coming apart at the seams." } },
      choices = {
        { text = "Tell me about her.", next = "wife" },
        { text = "I mean it. What do you need?", next = "BUSINESS" },
      },
    },

    after = {
      lines = { { id = "af_default", text = "Go back to Danitha Morr and tell her I'm grateful, to her and to you both. I don't know why you'd go out of your way for me, but I'll not forget it." } },
      choices = {
        { text = "It was the right thing to do.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A hedger and ditcher outside the capital, with a wife who baked. Then the plague, and now this." } },
    advice = { { id = "tp_ad", text = "Keep hold of the people you love, whatever shape they're in. That's all I know." } },
    _none = { { id = "tp_none", text = "I'm sorry, I wouldn't know about things like that. I only know the Trade Quarter floor, and it's cold." } },
  },
}

---------------------------------------------------------------------------
-- Morbin Lightbane: Forsaken paladin of the Royal Quarter. Light's Justice: limbs from the Ruins of Lordaeron.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_morbin", id = TODO_NPC("Morbin Lightbane"), name = "Morbin Lightbane",
  bible = "bibles/uc_forever_quests.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "fervent", "proud" }, values = { "loyal", "pious" },
  notices = { "paladin", "origin", "race" },
  impression = {
    first = "He knows the Dark Lady watches his kind, and wants her to.",
    third = "{name} met Morbin Lightbane, a fervent Forsaken paladin in the Royal Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Stand straight in the Royal Quarter, {class}. The Dark Lady's eyes are on all of us here, and on my kind most of all." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good; the work above us isn't done, and won't be for some time." },
    { id = "g_active", when = { questActive = TODO_QUEST("Light's Justice") }, text = "Have you taken those limbs from the Scourge in the ruins above? Our kin need replacement parts." },
    { id = "g_done", when = { questDone = TODO_QUEST("Light's Justice") }, text = "Captain Bandarion would be proud of what you did, and I'll tell anyone at the keep who asks." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", race = "Scourge" },
      text = "A brother in the Light, or a sister, it hardly matters which under all this. Danitha's teaching sits well on you; I can see it in how you hold your shoulders when the Light comes." },
    { id = "n_knight", cat = "origin", when = { origin = "forsaken_risen_knight" },
      text = "You wore the Silver Hand once. So did I, and I'll tell you what I tell all of us: the Order is gone, and what we serve now is better and harder." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "Our living allies are welcome in this hall, but watch the Royal Guard, because they're quicker to the blade than they are to the greeting." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Morbin Lightbane, and every night I must earn my place among my own people, or be counted with the Scarlet fanatics. The Light in my hands belongs to the Forsaken now, and it burns for our fury, not for the men who'd see us ash." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Light's Justice"), minLevel = 15 },
          text = "You've the look of someone who has walked the ruins above us. The Scourge still roam there unchecked, and our kin are coming apart faster than the apothecaries can stitch them, and I have a task that answers both." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Light's Justice") },
          text = "Twenty-five intact limbs, from the Scourge in the Ruins of Lordaeron. Decaying flesh cannot be reknit, not without replacements, and the creatures up there have plenty they no longer deserve." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Light's Justice"), days = 3 } },
          text = "Let those who fall from the Banshee Queen's grace meet our justice! The parts you brought are already in the Apothecarium, and there are soldiers on their feet tonight who'd not have stood without them." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Light's Justice"), days = 7 } },
          text = "I saw a Deathguard on the stair yesterday with an arm that wasn't his, and he saluted me with it. I thought of you." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Ask, and I'll answer plainly." },
        { id = "h_again2", text = "Speak. The Dark Lady's work waits for no one, but it can wait for a question." },
        { id = "h_again3", when = { class = "PALADIN" }, text = "Go on, {class}. We have to stand together, our kind, or not at all." },
      },
      choices = {
        { text = "Why must paladins earn their place?", next = "earn" },
        { text = "A conduit for fury? Isn't the Light mercy?", next = "fury" },
        { text = "Who was Captain Bandarion?", next = "garek" },
        { text = "What's this task you spoke of?", next = "task", when = { questBefore = TODO_QUEST("Light's Justice"), minLevel = 15 } },
        { text = "Tell me about the Ruins of Lordaeron.", next = "ruins" },
        { text = "I have the limbs.", next = "BUSINESS", when = { questReady = TODO_QUEST("Light's Justice") } },
        { text = "For Lordaeron, Morbin.", next = "END" },
      },
    },

    earn = {
      lines = { { id = "ea_default", text = "Because the last paladins Lordaeron knew wore red and burned villages, and the Forsaken remember. The Banshee Queen keeps a close eye on us, and some in her service would sooner see us gone, so we prove ourselves with every Scourge we put down." } },
      choices = {
        { text = "Does it trouble you, being watched?", next = "watched" },
        { text = "Who in her service would see you gone?", next = "enemies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watched = {
      big = true,
      lines = { { id = "wa_default", text = "Let her watch. She will see that our resolve shall never waver, and that the Light in our hands serves her and no other. We are Forsaken, and I would sooner be watched and true than trusted and idle." } },
      choices = {
        { text = "Her suspicion is fair. Earn her trust, every night.", next = "watched_after", fx = { align = { order = 1 } } },
        { text = "You died for this land twice. You owe nobody proof.", next = "watched_after", fx = { align = { order = -1 } } },
      },
    },
    watched_after = {
      lines = { { id = "wf_default", text = "Perhaps. I have chosen my road, and I walk it gladly, and I'd advise anyone who wears our colours to do the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    enemies = {
      lines = { { id = "en_default", text = "I name no names in the Royal Quarter, and you'd be wise to follow that example. There are apothecaries who think the Light a contamination, and Deathstalkers who think every paladin a Scarlet in waiting, and they're not quiet about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fury = {
      lines = { { id = "fu_default", text = "Mercy was the Church's word, and the Church opened its doors to the plague and let it in. The Light I know is the one that answered me when I woke in the dark with my own flesh rotting, and what it gave me was strength to strike back." } },
      choices = {
        { text = "So the Light is a weapon to you?", next = "fury_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fury_stance = {
      big = true,
      lines = { { id = "fs_default", text = "It is justice, and justice needs a strong arm. It is in our devotion to the Dark Lady and the love of our home that we channel the Light, and it is upon our enemies that we let it fall." } },
      choices = {
        { text = "Justice without mercy is only vengeance, Morbin.", next = "fury_after", fx = { align = { light = 1 } } },
        { text = "Good. Let it fall on them until nothing's left.", next = "fury_after", fx = { align = { light = -1 } } },
      },
    },
    fury_after = {
      lines = { { id = "fa_default", text = "Danitha would say something like that, or the opposite, depending on the night. We argue, at the keep, and the Light lets us, which is more than the Church ever did." } },
      choices = {
        { text = "Who is Danitha?", next = "danitha" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danitha = {
      lines = { { id = "da_default", text = "Danitha Morr, who leads the paladins at Bandarion Keep, in the west of the Glades. She was a knight of the Silver Hand, and she turned down the Argent Dawn's offer to fold us into their order, because the people we're sworn to are here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    garek = {
      lines = { { id = "ga_default", text = "Garek Bandarion, our glorious captain, first captain of the Deathguard and the first of us the Light chose. He died holding back the Scourge so that this kingdom could stand, and I know what he would wish of us now: to finish what he started, and heal our kin." } },
      choices = {
        { text = "Did you serve with him?", next = "garek_serve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garek_serve = {
      lines = { { id = "gs_default", text = "Under him, in the Deathguard, in the days when we'd only just broken free and didn't know yet that the Light would come to us. I saw him call it the first time, and I wept, which I'd not thought I could still do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    task = {
      lines = { { id = "ta_default", text = "As a paladin of the Forsaken, it is my duty to exact the will of our Dark Lady while tending to our people's needs. Above us, the Scourge still roam the Ruins of Lordaeron in great numbers, and our forces dwindle trying to reclaim our land." } },
      choices = {
        { text = "And what do you need from me?", next = "task_limbs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    task_limbs = {
      lines = { { id = "tl_default", text = "Limbs, twenty-five of them, intact, taken from the Scourge that infest the ruins. Our soldiers' flesh cannot be reknit once it decays, but the apothecaries can stitch on what's sound, and the Scourge have no more claim to those arms than they do to our city." } },
      choices = {
        { text = "Stitching on the Scourge's dead. Is that right?", next = "limbs_stance" },
        { text = "I'll bring them.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    limbs_stance = {
      big = true,
      lines = { { id = "ls_default", text = "Every one of those arms belonged to a Lordaeron farmer or soldier before the Lich King stole it. I'd rather it held a Forsaken shield than a Scourge cleaver, and I think its first owner would agree." } },
      choices = {
        { text = "The dead deserve rest, not the needle.", next = "limbs_after", fx = { align = { light = 1 } } },
        { text = "Flesh is flesh. Stitch our kin whole again.", next = "limbs_after", fx = { align = { light = -1 } } },
      },
    },
    limbs_after = {
      lines = { { id = "la_default", text = "Think on it as you like, but think on it up there, among them. For Lordaeron!" } },
      choices = {
        { text = "I'll go.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },

    ruins = {
      lines = { { id = "ru_default", text = "The capital that was, above our heads, the throne room and the courtyards and the graveyard behind them. The Scourge never fully left, and there are worse things in it now, an abomination and a skeletal sorcerer among the graves, and the apothecaries say a great spider in the cellars." } },
      choices = {
        { text = "Who else fights up there?", next = "ruins_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins_who = {
      lines = { { id = "rw_default", text = "Our Deathguard, and adventurers, and I'm told the Alliance send their own through the old roads, for reasons of their own. There are lost souls in the ruins who still think the old kingdom stands, and I pity those most of all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A knight of Lordaeron, then Scourge, then free, then a paladin again. I serve the Dark Lady now, and the Light through her." } },
    advice = { { id = "tp_ad", text = "Let your deeds speak where your word isn't trusted. Ours rarely is, and so we work." } },
    silver_hand = { { id = "tp_sh", text = "The Order is gone, and good riddance to what it became at the end. What we carry now is older and harder than any oath they swore." } },
    scarlet_crusade = { { id = "tp_sc", text = "Fanatics who wear the Light like a butcher's apron. Every night I work to be nothing like them, and every night someone in this city suspects I am." } },
    _none = { { id = "tp_none", text = "I know the Light, the Dark Lady and the Scourge. For anything else, ask someone with more time." } },
  },
}

---------------------------------------------------------------------------
-- Rugbul Boomfirst: Darkspear Islands battlemaster in the Royal Quarter, wearing a Warsong tabard.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_rugbul", id = TODO_NPC("Rugbul Boomfirst"), name = "Rugbul Boomfirst", title = "Darkspear Islands Battlemaster",
  bible = "bibles/uc_forever_quests.md", role = "soldier", tier = "quest",
  communities = { "undercity" }, temper = { "boisterous", "proud" }, values = { "loyal", "brave" },
  notices = { "pvp", "race" },
  impression = {
    first = "He laughs off every question about his Warsong tabard.",
    third = "{name} met Rugbul Boomfirst, a Darkspear troll who recruits for the fight over the Darkspear Islands.",
  },

  greetings = {
    { id = "g_default", text = "Well, well, you be ready to fight for the Horde on the Darkspear Islands, mon?" },
    { id = "g_low", when = { maxLevel = 29 }, text = "I be sorry, {class}, but you not be experienced enough yet to go to the Darkspear Islands. Come back when you got more scars, mon." },
    { id = "g_back", when = { metBefore = true }, text = "You back! The islands still need you, and the Theramore boys still be landing on our beaches." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, so far from the sea! You know what them islands mean to us, so you don't need my speech, but you be getting it anyway." },
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "You wear an officer's rank, mon. The young ones on the beaches need someone to follow, so go and be followed." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Rugbul Boomfirst, of the Darkspear Raiders, and I send good fighters to the Darkspear Islands where the Theramore soldiers come to take what be ours. It be fifteen of us and fifteen of them, and the islands go to whoever wants them more, mon." },
        { id = "h_forsaken", when = { race = "Scourge" }, text = "The dead come to fight for troll islands, eh? I like that, mon, because you don't get tired and you don't get seasick, and you scare the Theramore boys something awful." },
      },
      again = {
        { id = "h_again", text = "What else you want to know, mon?" },
        { id = "h_again2", text = "Ask quick, the next boat be leaving soon." },
      },
      choices = {
        { text = "What happens on the Darkspear Islands?", next = "islands" },
        { text = "Why is Theramore fighting you?", next = "theramore" },
        { text = "Why wear a Warsong tabard?", next = "tabard" },
        { text = "Why recruit in the Undercity?", next = "undercity" },
        { text = "Send me to the islands.", next = "BUSINESS", when = { minLevel = 30 } },
        { text = "Not today, Rugbul.", next = "END" },
      },
    },

    islands = {
      lines = { { id = "is_default", text = "There be an old tower, a camp, the ruins and a cove with a wreck in it, and both sides want all four. Hold them, and the islands be yours for the day, and then we do it all again tomorrow, because Theramore don't learn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    theramore = {
      lines = { { id = "th_default", text = "Their Expeditionary Force came over with torches and banners, saying they be keeping the coast safe. Lady Proudmoore talks peace from her tower, and maybe she means it, but her soldiers on our beaches don't be talking peace, mon." } },
      choices = {
        { text = "Should the Horde answer with war?", next = "war_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_stance = {
      big = true,
      lines = { { id = "ws_default", text = "Thrall says hold the peace with the humans, and I respect Thrall, mon. But a troll who don't defend his own beach don't have a beach for long, so the Raiders hold the line and wait to see who blinks." } },
      choices = {
        { text = "Hold the line, but keep the peace Thrall made.", next = "war_after", fx = { align = { order = 1 } } },
        { text = "They came to your home. Drive them into the sea.", next = "war_after", fx = { align = { order = -1 } } },
      },
    },
    war_after = {
      lines = { { id = "wa_default", text = "Ha! Say that on the beach, mon, and the Raiders will cheer for you, whichever way you said it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tabard = {
      lines = { { id = "ta_default", text = "This? A Warsong orc gave it to me after I pulled him out of the surf, and it be warm, and it be lucky, and nobody tell Vol'jin. He thinks I'm wearing a Raiders' tabard under it, mon, and I'd like him to keep thinking that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    undercity = {
      lines = { { id = "un_default", text = "Because the Horde be the Horde, everywhere, and a dead fighter be as good as a living one on the beach, maybe better. Also, the Dark Lady's people never get seasick, and that be worth a long walk through these tunnels." } },
      choices = {
        { text = "How do you find the Undercity?", next = "undercity_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    undercity_more = {
      lines = { { id = "um_default", text = "Dark, mon, and quiet, and it smell like a swamp that died. But the dead be polite, and they always laugh at my name, so I can't complain much." } },
      choices = {
        { text = "Where does the name come from?", next = "name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "Boom first, ask questions after. That be my grandfather's way, and his grandfather's, and that be why we got so few grandfathers, mon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darkspear, born on the islands, Raider by trade. Boom first, mon, always." } },
    advice = { { id = "tp_ad", text = "Take the tower early, and don't let the cove go. Everything else you can win back." } },
    echo_isles = { { id = "tp_ei", text = "Our home, mon, but Zalazane and his hexed trolls sit on them now, and our people wait at Sen'jin Village. One day we go back, and Zalazane don't." } },
    _none = { { id = "tp_none", text = "Never heard of it, mon. Ask me about the islands, I know the islands." } },
  },
}
