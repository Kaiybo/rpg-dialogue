-- Madame Eva, fortune-teller, Darkshire. Voice: bibles/eva.md
-- The old arts. Cards, stars, and a voice that makes the candles lean.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eva", id = TODO_NPC("Madame Eva"), name = "Madame Eva", gender = "female",
  bible = "bibles/eva.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "steady" }, values = { "curious", "cunning" },
  spiritSensitive = true,
  notices = { "fate", "fel" },

  impression = {
    first = "Madame Eva behaved as though she had been expecting me for some time. I've no idea how she could have known, and I've decided not to ask.",
    third = "{name} called on Madame Eva, the Darkshire fortune teller who reads the cards and seems to know her visitors before they arrive.",
  },

  greetings = {
    { id = "g_op_light_doubt", when = { opinion = { topic = "the_light", stance = "doubt" } }, text = "The sceptic returns. Sit, sit; the Blade has been turning up all week, and I suspected it was waiting for you." },
    { id = "g_op_necro_eva", when = { opinion = { topic = "necromancy", stance = "tempting" } }, text = "The cards turned up the Needle when you walked in, and the Lovers reversed beside it. Somewhere, you told someone you'd bring back the dead. Be careful who heard you." },
    { id = "g_expected", text = "Ah, there you are, {name}. The stars said you would come; they did not say you would be so late." },
    { id = "g_back", when = { metBefore = true }, text = "Sit, please. The cards have been restless since you left." },
    { id = "g_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "eva_flirt_no" } }, cooldown = "2d",
      text = "The cards turned up the Lovers this morning, and I laughed, because I'm far too old for them. Then you walked in, and I stopped laughing." },
    { id = "g_flirt_yes", when = { flirt = true, npcFlagBefore = "eva_flirt_yes" }, priority = 8, cooldown = "1d",
      text = "My charming one returns! The Lovers have turned up three mornings running, and I've had to hide the deck from Alyssa, who asks far too many questions." },
    { id = "g_flirt_no", when = { npcFlagBefore = "eva_flirt_no" }, priority = 8, once = true,
      text = "Sit, child, and we'll read only what the cards are paid to read. An old woman may be forgiven a little mischief, I hope." },
    { id = "g_comb", when = { questActive = TODO_QUEST("Return the Comb") }, text = "You have seen Blind Mary; it is written on your face. Give me the comb, child." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}, child, and the cards would not stop turning up the Wanderer. Now sit, and let us see what the road has written on you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "The stars spoke of a small thing grown great, and I see now they meant you. Your fate has thickened since we last met, child." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you bent someone's will in Darkshire with nothing but words. The cards admire a silver tongue, though they charge for the admiring." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Someone saw through one of your lies, I am told. The cards see through all of them, child, so speak truly at my table." },
  },

  notice = {
    { id = "n_deaths", cat = "fate", when = { deaths = { min = 10 } },
      text = "The cards keep turning up Death for you, and Death keeps sending you back. I think it finds you amusing, so do not test it." },
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "You carry something that does not belong to this world, and the cards will not lie flat while you stand there. Step back a little, please." },
    { id = "n_taint", cat = "fel", when = { taint = { min = 25 } },
      text = "There is a shadow at your shoulder that is not yours; I see it in the candle. Don't turn around, because it doesn't like to be looked at." },
  },

  start = "hello",
  nodes = {
    op_light = {
      lines = {
        { id = "op_light_a", text = "Ah, the question every visitor comes to ask and nobody asks plainly. The priests say the Light guards the faithful, and the graveyards of Duskwood are full of faithful people. So I put it back to you: what do you believe watches over you here?" },
      },
      choices = {
        { text = "The Light. Faith isn't a promise you won't die.", next = "op_light_1", fx = { opinion = { the_light = "faith" }, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Nothing watches over anyone. A sharp blade and good sense.", next = "op_light_2", fx = { opinion = { the_light = "doubt" }, align = { light = -1 }, trait = { skeptical = 1 } } },
        { text = "Fate, maybe. Your cards seem sure of it.", next = "op_light_3", fx = { opinion = { the_light = "fate" }, trait = { curious = 1 }, affinity = 2 } },
        { text = "Elune watches this wood still, whatever has happened here.", next = "op_light_4", when = { race = "NightElf" }, fx = { opinion = { the_light = "elune" }, affinity = 1 } },
        { text = "I'd rather not tempt fate, Madame.", next = "BACK" },
      },
    },
    op_light_1 = {
      lines = { { id = "op_light_r1", text = "A good answer, and an honest one, which the Church rarely manages. The cards like you better for it; they turned the Lamp just now, see?" } },
      choices = { { text = "Something else, Madame.", next = "BACK" } },
    },
    op_light_2 = {
      lines = { { id = "op_light_r2", text = "Then the cards will bore you, and you'll come back anyway, because the sceptics always do. The Blade turns up for people like you, and it cuts both ways." } },
      choices = { { text = "Something else, Madame.", next = "BACK" } },
    },
    op_light_3 = {
      lines = { { id = "op_light_r3", text = "My cards are sure of nothing, child; they only see further than you do. Still, I'm flattered, and you may sit a little longer for free." } },
      choices = { { text = "Something else, Madame.", next = "BACK" } },
    },
    op_light_4 = {
      lines = { { id = "op_light_r4", text = "Does she? Then she watches very quietly. The cards turn up the Moon for your people, and it's always half in shadow." } },
      choices = { { text = "Something else, Madame.", next = "BACK" } },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A blade raised against a thing with many faces, and a choice about whether to strike or to wait. The cards don't say which is right, only that you'll have to make it, and soon." } },
      choices = {
        { text = "I'll strike when the time comes. Hesitation kills.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll wait and watch. The cards don't decide for me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Madame.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Something with a hunger older than the forest, and with a man's face it no longer remembers. I'd tell you more, but the cards turned dark when I tried to look, and I don't press them when they do that." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Something with a hunger older than the forest, and with a man's face it no longer remembers, though the cards turned dark when I looked further. Your {pet} has a fate of its own, {class}, tangled with yours, and it will stand beside you longer than you might think." },
      },
      choices = {
        { text = "I'll face whatever the cards foretold. Fate won't scare me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Cards are cards. I make my own fate.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Madame.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "They saw a shadow with a purse that wasn't its own, dearie, and then they saw a choice. I don't tell people which choice they make, because that spoils the cards." } },
      choices = {
        { text = "Then I'll choose the honest road.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Purses don't choose; I do, and gladly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Read my cards, then.", next = "cards" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "And frost bolts are only cold air with ambition, by that reckoning. You could study in Stormwind for twenty years, child, and still not know what I know about the next soul to walk up my stairs." } },
      choices = {
        { text = "Real magic has rules. Yours doesn't.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fair. Some things books can't teach.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "What do the cards mean?", next = "mean" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "A name, sometimes, and a green place gone sour. There is a sleeping wood beneath this one, child, and something in its dreams has turned. I do not know more, and I am glad I do not." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That he walks into the dark carrying his own light, and that the light flickers whenever he is tempted to show mercy. The cards don't say whether he should, child, only that he will have to choose." } },
      choices = {
        { text = "Then I'll choose mercy, whenever I can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Justice comes first. Mercy is for those who earn it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, madame.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The cards turned up the Knight this morning, and I wondered which way he would be facing when he came in." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "The wood speaks to you too, then. It has been screaming for years, druid, and few enough have ears to hear it." },
        { id = "h_default", text = "I am Madame Eva, and I follow the old arts. I read what the cards say and what the stars refuse to, and while horrors wait in the night here, I simply know their names." },
        { id = "h_shadowy", tags = { "news" }, when = { questActive = TODO_QUEST("The Shadowy Figure") },
          text = "There was a figure in the fog, watching the farm where the Yorgens died. The cards show me a frightened man rather than a monster, so go and find him." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Supplies from Darkshire") },
          text = "Ghost hair thread, for the hermit? I have none spun, but I can make it if someone brings me the hair, and I rather think that someone is you." },
        { id = "h_mary", when = { questActive = TODO_QUEST("Ghost Hair Thread") },
          text = "Blind Mary will weep when you ask her to comb her hair, and you must let her weep. Then bring me the comb, and don't look back at the house." },
        { id = "h_totem", when = { questActive = TODO_QUEST("The Totem of Infliction") },
          text = "The totem is made of suffering, and I need it whole. Bring me what it asks for, and do not ask me what it does." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "The cards show me a manor, and a teacher with a gentle hand and something hidden behind his back. Follow the letters, for they lead uphill." },
        { id = "h_new", when = { maxLevel = 20 },
          text = "So young, to be walking in Duskwood! The stars are fond of you, though that isn't always a kindness." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "The cards don't know what to make of you, and they keep turning up the Wind, which has never come up twice in one night before." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest of the Light, at my table. Your Church calls my work superstition, but sit anyway; the cards don't mind being doubted." },
        { id = "h_cards", when = { metBefore = true }, text = "The cards turned up the Tower again this morning, as they always do in Duskwood, and I've stopped charging extra for it." },
        { id = "h_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "eva_flirt_no" } }, cooldown = "3d",
          text = "Come closer to the candle, so I can see your face properly. Ah, yes; the stars did say handsome, but the stars are known to understate." },
        { id = "h_flirt_yes", when = { flirt = true, npcFlagBefore = "eva_flirt_yes" }, priority = 6, cooldown = "1d",
          text = "There you are, and the candle leaned toward the door before you opened it. Even the flame has its favourites, child." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The cards showed me a sword drawn against the dark, and I wondered whose hand would be on the hilt, but now I suppose I know." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The cards spoke of a beast at your side and a beast in your path, and I'm glad to see it's the first that walked in with you." },
      },
      again = {
        { id = "h_again", text = "There is more, child; there is always more, so ask." },
        { id = "h_again2", text = "The candle hasn't gone out yet, so go on." },
      },
      choices = {
        { text = "What do you hear when the forest screams?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Read my cards.", next = "cards" },
        { text = "What waits in the night?", next = "night" },
        { text = "Is every spirit near Darkshire a monster?", next = "mary" },
        { text = "Stalvan's name seems to frighten you.", next = "granddaughter", when = { questActive = TODO_QUEST("The Legend of Stalvan") } },
        { text = "What is ghost hair thread really for?", next = "thread", when = { questDone = TODO_QUEST("Return the Comb") } },
        { text = "The Light doesn't need cards.", next = "priest", when = { class = "PRIEST" } },
        { text = "Deal for me. If you dare.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The spirits speak to me too, madame.", next = "dwarf_shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "You knew I'd come. Your cards must have seen my knives too.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Fortune telling isn't magic, Madame. It's guesswork.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What did the cards show about my sword, Madame?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What beast is in my path, Madame Eva?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What did your cards say about the Knight, madame?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I dug graves at Raven Hill, Madame. The dead talked back.", next = "xorig_gravedigger", when = { origin = "human_raven_hill_gravedigger" } },
        { text = "Did your cards say anything else about me, Madame?", next = "flirt", when = { flirt = true, ["not"] = { npcFlag = "eva_flirt_no" } } },
        { text = "I'll go.", next = "END" },
      },
    },
    flirt = {
      lines = {
        { id = "fl_default", text = "They turned up the Lovers, child, upright and bold as brass, beside a card I'd swear was smiling. Were I forty years younger I'd take it as an invitation, and at my age I'm tempted to take it anyway." },
        { id = "fl_again", when = { npcFlagBefore = "eva_flirt_yes" }, priority = 5,
          text = "The Lovers again, and the Fool beside them this time, which I suspect is me. Sit down; an old woman is allowed to enjoy the view while she shuffles." },
      },
      choices = {
        { text = "Age is no matter to me, Madame. Deal another card.", next = "flirt_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "eva_flirt_yes" }, clear = { "eva_flirt_no" } } } },
        { text = "Careful, Madame. I steal hearts as well as purses.", next = "flirt_yes", when = { class = "ROGUE" },
          reply = "Then mine is in the drawer with the cards, child, and the lock is older than you are.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "eva_flirt_yes" }, clear = { "eva_flirt_no" } } } },
        { text = "I think your cards are teasing us both, Madame.", next = "BACK",
          reply = "Oh, they are, the wicked things, and they'll spend the night in the drawer for it. Ask me something sensible, child.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "eva_flirt_no" }, clear = { "eva_flirt_yes" } } } },
        { text = "Read my fate, not my face, Madame.", next = "BACK",
          reply = "As you like, and no offence taken. The face was the pleasanter reading, but fate pays better.",
          fx = { trait = { stern = 1 }, npcFlag = { set = { "eva_flirt_no" }, clear = { "eva_flirt_yes" } } } },
      },
    },
    flirt_yes = {
      lines = { { id = "fy_default", text = "Then here is the Sun, which means joy and warm evenings, and I won't say what else. Off you go before Alyssa comes in and sees her grandmother blushing, because I'd never hear the end of it." } },
      choices = {
        { text = "Until next time, Madame.", next = "BACK",
          reply = "Until next time, child. The cards will be watching for you, and so shall I." },
      },
    },
    xorig_gravedigger = {
      lines = {
        { id = "xogravedigger_default", text = "Of course they did, and you answered, which is where the trouble always starts. The cards turned up the Gravedigger for you before you'd opened your mouth, and beside it the Bargain, upright. Tell me, child, have the voices kept their side of it?" },
      },
      choices = {
        { text = "So far they have, Madame.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "They're servants now, not voices, and they know it.", next = "BACK", fx = { trait = { cruel = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cards = {
      lines = {
        { id = "c_default", text = "The Traveller, the Tower reversed, and the Raven, which in Darkshire means only that you'll be here a while." },
        { id = "c_light", when = { alignment = { axis = "light", min = 40 } },
          text = "The Sun, burning in a dark room. It's a good card, but a lonely one." },
        { id = "c_hand", once = true, when = { heardLine = "pool:spirithealer.pr_default" }, fx = { hear = "spirithealer_other_hand" },
          text = "Death, upright, and across it someone has written 'not here, not yet' in a neat hand that isn't mine. I did not write that, so tell me who you have been talking to." },
        { id = "c_lantern", when = { heardLine = "pool:spirithealer.ln6" },
          text = "The Lantern. I have dealt that card for forty years and never once seen it lit, and tonight it burns, so someone, somewhere, has stopped waiting." },
        { id = "c_dark", when = { alignment = { axis = "light", max = -40 } },
          text = "The Knife, again, every time I deal for you. I've stopped shuffling, since it makes no difference." },
      },
      choices = {
        { text = "What does that mean?", next = "mean", fx = { trait = { curious = 1 } } },
        { text = "I don't believe in cards.", next = "cards_doubt", fx = { trait = { skeptical = 1 } } },
        { text = "Deal again.", next = "cards_again" },
      },
    },
    mean = {
      lines = { { id = "m_default", text = "It means you will pay me for the reading; everything else is up to you." } },
      choices = { { text = "Ha. Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    cards_doubt = {
      lines = {
        { id = "cd_default", text = "Good, because believers tip badly. The cards were right long before you arrived, and they've never once asked my permission." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = -1 } } },
    },
    cards_again = {
      lines = {
        { id = "ca_default", text = "No. A second deal is a second question, and you haven't asked one yet, so ask the real one and I'll turn a single card." },
      },
      choices = {
        { text = "Will I live through Duskwood?", next = "cards_live" },
        { text = "Never mind.", next = "BACK" },
      },
    },
    cards_live = {
      big = true,
      lines = {
        { id = "cl_default", text = "Death. In Darkshire that card means change, and it also means death, and you'll learn which in time, as everyone does." },
        { id = "cl_deaths", when = { deaths = { min = 10 } },
          text = "Death, again, and it keeps sending you back to me. I think it rather likes the conversation." },
      },
      choices = {
        { text = "Then I'll change.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "That's no answer.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    night = {
      big = true,
      lines = {
        { id = "n_door", when = { heardLine = "pool:spirithealer.dr_default" },
          text = "The dead and the wolves, and the men who choose to be monsters, and past them all a door. You've heard of it, I see; the cards call it the Threshold, and I beg you not to knock." },
        { id = "n_default", text = "The dead walking and the worgen howling, and men who choose to be monsters, who are worse than either, because they could have chosen otherwise." },
      },
      choices = {
        { text = "What guards a person in a wood like this, Madame?", next = "op_light" },
        { text = "I'll remember.", next = "BACK", fx = { learn = { "stalvan" } } },
        { text = "Which men?", next = "night_men" },
        { text = "The dead must be restless here.", next = "night_spirits" },
      },
    },
    night_men = {
      lines = {
        { id = "nm_default", text = "A tutor with something behind his back, and a wizard on the hill above Raven Hill who buys the dead. Duskwood grows them the way other places grow apples.",
          fx = { learn = { "morbent_fel" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    night_spirits = {
      lines = {
        { id = "ns_default", text = "Restless, and full of complaint; they whisper in my ear all night long. It is cold where they are, they tell me, and I believe them." },
      },
      choices = {
        { text = "Can you help them?", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mary = {
      lines = {
        { id = "ma_default", text = "Not every one. Blind Mary is a poor, sad spirit in the old farmhouse south of town. She was lovely once, and carried a looking glass wherever she went." },
      },
      choices = {
        { text = "What happened to her?", next = "mary_eyes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mary_eyes = {
      lines = {
        { id = "me_default", text = "The dead took her and left her something worse than dead, so she tore out her own eyes, never to see what she'd become. Speak softly when you're there." },
      },
      choices = {
        { text = "That's terrible.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    granddaughter = {
      big = true,
      lines = {
        { id = "gd_default", text = "It does, because of Alyssa, my granddaughter. Death lay on the table for her, and after a long trance I found one name beside it, Stalvan, so bring me proof he can harm no one." },
      },
      choices = {
        { text = "I'd guess she doesn't know.", next = "granddaughter_know" },
        { text = "I'll find him.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I won't hunt a man down on the word of a card.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    granddaughter_know = {
      lines = {
        { id = "gk_default", text = "Of course not. Would you tell someone you love that you'd seen her die in a card? I tell her to stay indoors, and she thinks I'm simply old." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },

    thread = {
      lines = {
        { id = "th_default", text = "It has a thousand uses, from binding spirits and mending to sewing life into things that never had any. I don't ask a customer which use he means." },
      },
      choices = {
        { text = "Maybe you should.", next = "thread_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thread_ask = {
      lines = {
        { id = "ta_default", text = "Perhaps. The hermit pays, he's kind, and the cards turn up the Needle whenever his name is spoken, so I have decided not to think about the Needle." },
        { id = "ta_after", when = { questDone = TODO_QUEST("Translation to Ello") },
          text = "I should have asked. I know what walked down that road and whose thread held it together, because the cards told me, and I didn't want to hear them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "embalmer" } } } },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "No, it doesn't, because your Light is a lamp and my cards are a window, and that's different work. But tell me, priest: when you pray over the dead here, do they answer?" },
      },
      choices = {
        { text = "Sometimes.", next = "priest_answer" },
        { text = "The dead should rest, not answer.", next = "BACK", fx = { affinity = -1, trait = { pious = 1 } } },
      },
    },
    priest_answer = {
      lines = {
        { id = "pa_default", text = "Then you know more than your Church admits. Come and tell me what they say some evening, and we'll compare notes." },
      },
      choices = { { text = "Some evening, then.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    warlock = {
      lines = {
        { id = "wl_default", text = "I would rather not. Your cards come up the same every time: a door left open, and something beyond it that knows your name." },
      },
      choices = {
        { text = "It does know my name.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Whatever's beyond that door, I keep it shut.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf_shaman = {
      lines = { { id = "ds_default", text = "Do they? Then you're the first dwarf who's ever sat at my table and not laughed at the cards. Tell me, child of stone, what do your spirits say about these woods, because mine have stopped answering." } },
      choices = {
        { text = "That the earth here is sick, and frightened.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Nothing. They won't speak here either.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The cards show me a great many things, child, and the people of Darkshire show me the rest. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I follow the old arts, the cards and the stars and the spirits who will not keep quiet. The rest of my story costs extra." } },
    advice = { { id = "tp_ad", text = "When the cards and the Night Watch disagree, believe the Watch, because they're wrong less often. I'll deny I ever said so." } },
    stalvan = { { id = "tp_stalvan", text = "His card is the Tutor, patient and gentle, holding an axe where you cannot see it." } },
    worgen = { { id = "tp_worgen", text = "Something was found in Roland's Doom that should have stayed lost, and the wolves came after." } },
    night_watch = { { id = "tp_watch", text = "They're brave, and Brave is a card too, though it comes up face-down in most of my spreads." } },
    morbent_fel = { { id = "tp_morbent", text = "He is the Spider, in my deck. He sits on his hill pulling threads, and the dead dance, and Sven Yorgen wants to cut each thread with his own axe." } },
    ladimore = { { id = "tp_ladimore", text = "The Knight, reversed: a good man turned upside down by grief. He walks Raven Hill because he cannot forgive himself." } },
    embalmer = { { id = "tp_embalmer", text = "That is the Needle, and I see it more often than I'd like. Don't ask me whose hand holds it." } },
    _none = { { id = "tp_none", text = "The cards are silent on that, and they are rarely silent, so make of it what you will." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's fortune teller offered me a tent once, child, and I told her the cards had already shown me how badly that would end. She didn't ask what they showed, which proved my point." } },
    raven_hill = { { id = "tp_raven_hill", text = "The spirits at Raven Hill are the loudest in Duskwood, child, and most of them only want to go home. Some of them are home, and that's the trouble." } },
    dark_riders = { { id = "tp_dark_riders", text = "The cards turn black when I ask about the riders, every card, every time. I've stopped asking, and I suggest you do the same." } },
    scourge = { { id = "tp_scourge", text = "The spirits that drift down from the north are the saddest I've ever heard, child, because they weren't allowed to leave their bodies even after death. I light a candle for them, and it gutters every time." } },
    elune = { { id = "tp_elune", text = "The night elves pray to Elune, and the moon answers them, or so they say. The moon has only ever told me one thing, and that was to stay indoors." } },
    green_dragons = { { id = "tp_green_dragons", text = "I dreamed once of a green dragon sleeping in Twilight Grove, and the next morning a hunter told me he'd seen one there. The cards had nothing to say about it, which is how I know it matters." } },
  },
}
