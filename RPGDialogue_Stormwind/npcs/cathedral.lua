-- The Cathedral of Light and the Trade District: the people a young paladin meets on the
-- way to Redemption, and the man who leads the Church.
-- Voices: bibles/benedictus.md, bibles/gazin.md, bibles/stephanie.md, bibles/timmy.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Archbishop Benedictus: kind, soft-spoken, Faol's student. (Nothing later is hinted at.)
P:NPC {
  key = "benedictus", id = TODO_NPC("Archbishop Benedictus"), name = "Archbishop Benedictus",
  bible = "bibles/benedictus.md", role = "priest", tier = "major",
  communities = { "stormwind" }, temper = { "steady" }, values = { "pious", "kind" },
  spiritSensitive = true,
  notices = { "light", "affliction", "form" },
  impression = {
    first = "Archbishop Benedictus has a gentle voice and a way of making a vast cathedral feel like a small chapel. He says the doors are open to everyone, and he plainly wants it to be true.",
    third = "{name} met Archbishop Benedictus, who tends the Church of the Holy Light and keeps its doors open to all.",
  },

  greetings = {
    { id = "g_peace", text = "Peace, child. The Cathedral is open to everyone. Even the tired." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "One of ours. Sit, if you've a moment, because you rarely will, later." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "Duthorian's latest, I suspect, and he speaks well of very few. Welcome." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, child, and I wondered now and then where the road had taken you. Come in and rest a while." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since last we spoke, child, and I can see the road has asked a great deal of you. I hope it left you some kindness to bring home." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear harsh words passed between you and one of our neighbors. I won't ask what was said, child, but the Light is patient with those who mend things." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in the city has been speaking warmly of you, child, and it did an old man good to hear it." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Step out of the shadow while you're under this roof, child. Not because the Light minds. Because I'd like to see your face while we talk." },
    { id = "n_light", cat = "light", when = { alignment = { axis = "light", min = 50 } },
      text = "You keep the Light close and say little about it, which is the rarest way. Most people wear it like a badge, and badges come off." },
    { id = "n_sick", cat = "affliction", place = "before", when = { debuffType = { "Disease", "Curse" } },
      text = "Something sits on you that shouldn't. Come closer to the altar a moment, there, and tell me: does that ease it?" },
  },

  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Ah. I wondered whether you'd studied that. Mind the novices; it frightens them." },
  },

  start = "hello",
  nodes = {
    xpt_benedictus = {
      big = true,
      lines = { { id = "xpt_benedictus_default", text = "By remembering that you are not the one who mends them, for the Light does that, and you are only the hand it passes through. The healers who break are the ones who come to believe that every death in their company was theirs to prevent." } },
      choices = {
        { text = "Then I'll trust the Light to carry what I can't.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll trust my own hands before any sermon, Archbishop.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_strat = {
      big = true,
      lines = { { id = "xcl_strat_default", text = "I pray that's so. Rivendare was a lord of Lordaeron before he gave himself to the Scourge, and a man who chooses that has made a darker bargain than any poor soul the plague took unawares. Archbishop Faol taught that the Light is offered even to such men, though I confess I find it hard to say over this one." } },
      choices = {
        { text = "The Light is offered to all, Archbishop, even to him.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some men are past saving. Rivendare chose his side.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Did you know anyone in Stratholme, Archbishop?", next = "xcl_strat2" },
      },
    },
    xcl_strat2 = {
      lines = { { id = "xcl_strat2_default", text = "Every priest of my years knew someone there, child, because Stratholme was the jewel of the north and the Church sent good people to serve in its chapels. I've stopped counting the names, though I haven't stopped saying them." } },
      choices = {
        { text = "Then I'll say them with you tonight, Archbishop.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I don't know, and I would be a poor Archbishop if I pretended to. High Priestess Laurena and I have talked of it many evenings, and we agree only that both teach mercy, which may be all that matters." } },
      choices = {
        { text = "Mercy is enough. I'd gladly kneel beside your faithful, Your Grace.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My faith is Elune's, Your Grace, and I won't blur it with yours.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not fear, child, but we remember that the more magic men wielded, the more the darkness noticed them, which is why there was ever a Guardian at all. Power that serves only the curious tends to forget the people standing near it." } },
      choices = {
        { text = "My power will serve the people standing near it, Your Grace.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Curiosity built Dalaran, Your Grace, and I won't apologise for mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only what it asks of anyone: that you remember the people behind you are the reason you carry the sword. Archbishop Faol used to say a soldier's mercy is harder won than a priest's, because the soldier has the means to refuse it." } },
      choices = {
        { text = "My sword is for protecting people, not for punishing them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Mercy is a priest's business. Mine is winning.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I believe it does, though the Church has been slow to say so. Our priests in Northshire bless the harvest every autumn, and I've never understood why we don't bless the woods that feed half of Elwynn." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has been very patient with the incense, I notice. Bring it to the steps whenever you like; the children would be glad of it." },
      },
      choices = {
        { text = "The wild has its own holiness, Archbishop.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The forest is just meat and timber. The Light is for people.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_any", when = { alt = true, metBefore = false },
          text = "Welcome, child. A {altclass} named {alt} knelt in this nave not long ago, and something in your face reminds me of that one, as though the Light had sketched you both with the same hand." },
        { id = "h_alt_back", when = { alt = true, metBefore = true }, cooldown = "5d",
          text = "I lit a candle for {alt} last week, at that one's own asking, and I find myself wondering whether you'd like one lit as well. The Light keeps no tally of how many we ask it to watch over." },
        { id = "h_pt_benedictus", tags = { "news" }, when = { party = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" }, ["not"] = true, size = { min = 2 } }, class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" } },
          text = "You've brought a company to the Cathedral, and not one of them carries a healer's training, unless I misjudge them, which I seldom do. You'll be the one they turn to when the blood runs, my child, so be sure the Light has you before they need it to." },
        { id = "h_cl_strat", tags = { "news" }, when = { cleared = "Stratholme" },
          text = "You've been inside Stratholme, I'm told, and come out again, which is more than the city's own people managed when the plague came. I'll say a prayer tonight for the ones who still walk its streets." },
        { id = "h_default", text = "Benedictus. I tend the Church as Archbishop Faol tended it before me. He built it to hold people. I try to keep the doors open." },
        { id = "h_priest", when = { class = "PRIEST", minLevel = 20 },
          text = "You've grown since you first knelt here, child. The Light hasn't changed, but you have, and that is how it's meant to work." },
        { id = "h_eye", when = { questActive = TODO_QUEST("Cleansing the Eye") },
          text = "The Eye of Paleth is a cursed thing. Bring it here, to the altar, and we'll see what the Light makes of it." },
        { id = "h_dark", when = { alignment = { axis = "light", max = -40 } },
          text = "There's a heaviness about you, and I'm not going to ask. If you ever want to set it down, this is a good place to do it." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Winds be with you, I'm told your people say. And the Light with you, say mine. I don't see why anyone can't have both." },
        { id = "h_gnome_priest", when = { race = "Gnome", class = "PRIEST" },
          text = "A gnome in the vestments of the Light. Gnomeregan's loss brought you to us, perhaps, or something else did. Either way, the Light has never asked anyone's height." },
        { id = "h_novice", when = { origin = "human_abbey_novice" },
          text = "Northshire's novices always kneel a little straighter than the rest. The brothers there are strict about posture. And about everything else, I'm told." },
        { id = "h_bell", when = { timeOfDay = "dusk" },
          text = "Listen. The sunset bell. We ring it for the kaldorei in the city, who never grew used to walls. I've grown to need it myself." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, there you are, child. I was hoping you'd come by, because the Cathedral feels a little emptier on the days you don't." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "You're welcome under this roof, as everyone is, though I'll confess you've given some of my brothers cause to worry. Sit, and let's see if we can change that." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage under the Cathedral's roof. The Kirin Tor and the Church have not always agreed, child, though I've always thought the arcane and the Light could share a city." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The Church owes more to soldiers than it likes to admit, and I try to admit it as often as I can." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, in the Cathedral. Welcome, friend; the Light shines on the forest as well as on the nave, though the forest rarely thanks it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid beneath the Cathedral's roof, and welcome. Your people pray to Elune under the open sky, child, and I hope the vaulting here doesn't feel too much like a cage." },
      },
      again = {
        { id = "h_again", text = "What else is on your heart, child?" },
        { id = "h_again2", text = "Go on. The Cathedral is in no hurry, and neither am I." },
      },
      choices = {
        { text = "Archbishop Faol must have taught you a great deal.", next = "faol" },
        { text = "Does the Light ever abandon anyone?", next = "abandon" },
        { text = "Tell me about the Cathedral.", next = "cathedral" },
        { text = "Why let the Scarlet Crusade recruit downstairs?", next = "crusade" },
        { text = "I followed Crowley's road to its end, Your Grace.", next = "crusade_road", when = { thread = { id = "scarlet_path", beat = "b3_raleigh" } } },
        { text = "Your Grace, I want to become a better priest.", next = "priest", when = { class = "PRIEST" } },
        { text = "I'd guess the Church frowns on shadow in a priest.", next = "shadow", when = { class = "PRIEST", minLevel = 20 } },
        { text = "I came out of Lordaeron, Your Grace.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "I've been praying in Lordaeron, Your Grace.", next = "plague_prayer",
          when = { class = { "PRIEST", "PALADIN" }, thread = { id = "plague_light", beat = "b4_benedictus", state = "unfolding" } } },
        { text = "Your Grace, should a paladin ever doubt?", next = "paladin_doubt", when = { class = "PALADIN" } },
        { text = "Would the Light turn a warlock away, Your Grace?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "My people pray to Elune, Your Grace.", next = "elune", when = { race = "NightElf" } },
        { text = "I've done things in the dark for the crown, Your Grace.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I hear the spirits of the earth, Your Grace. Is that wrong?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Does the Church fear the arcane, Your Grace?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does the Church ask of a warrior, Archbishop?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the Light care about the wild places, Archbishop?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is Elune so very different from your Light, Your Grace?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Baron Rivendare is dead, Archbishop. Stratholme's dead can rest a little easier.", next = "xcl_strat", when = { cleared = "Stratholme" } },
        { text = "I'm my company's only healer. How do I bear it?", next = "xpt_benedictus", when = { party = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" }, ["not"] = true, size = { min = 2 } }, class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" } } },
        { text = "Thank you, Your Grace.", next = "END" },
      },
    },
    plague_prayer = {
      big = true,
      lines = {
        { id = "pp_default", key = true,
          text = "Then tell me plainly, because I have only letters from up there and letters are kind. When you called on the Light among the dead, what did it say back to you?" },
      },
      again = { { id = "pp_again", text = "You've told me already, and I keep turning it over. Go on, child." } },
      choices = {
        { text = "It still answers, Your Grace, even there, even for the dead.", next = "plague_answers",
          fx = { thread = { id = "plague_light", state = "resolved" }, align = { light = 1 }, affinity = 1 } },
        { text = "Up there the Light is a weapon, nothing more.", next = "plague_weapon",
          fx = { thread = { id = "plague_light", state = "soured" }, align = { light = -1 } } },
        { text = "I'd rather not speak of it yet.", next = "BACK" },
      },
    },
    plague_answers = {
      lines = { { id = "pa_default",
        text = "Then I was wrong to stop asking, and I'm glad you didn't. Sit with me a while before you go back; I want to pray for the ones you prayed for." } },
      choices = { { text = "I'll sit with you.", next = "BACK" }, { text = "Thank you, Your Grace.", next = "END" } },
    },
    plague_weapon = {
      lines = { { id = "pw_default",
        text = "I've heard Tirion's people say the same, and I understand why. But a weapon is held by someone, child, and I'd ask you to remember who's holding it." } },
      choices = { { text = "I'll remember.", next = "BACK" }, { text = "Thank you, Your Grace.", next = "END" } },
    },
    faol = {
      lines = {
        { id = "f_default", text = "He taught that the Light isn't owned by the strong, and a farmer at his plough can carry as much of it as a king on his throne. I believed him, and since I look like a farmer, it helped." },
      },
      choices = {
        { text = "That's a kind teaching.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The Light favors the strong, whatever Faol taught.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What was he like?", next = "faol_man" },
      },
    },
    faol_man = {
      lines = { { id = "fm_default", text = "Patient with fools, impatient with cruelty, and never once too grand to kneel beside someone. I've never managed to be half of him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    abandon = {
      big = true,
      lines = {
        { id = "a_default", key = true,
          text = "I asked that when Lordaeron fell, and the prince, the king and the Silver Hand with it, and I asked it every night for a year. I won't tell you I found the answer, only that I found I could keep working without it." },
      },
      choices = {
        { text = "That takes faith.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "I'd have stopped asking and turned my back on it.", next = "BACK", fx = { align = { light = -2 } } },
        { text = "Maybe there's no answer.", next = "none", fx = { trait = { skeptical = 1 } } },
      },
    },
    none = {
      lines = { { id = "n_default", text = "Maybe. Then the work is still worth doing. That was always the point." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cathedral = {
      lines = { { id = "c_default", text = "Rebuilt after the second war, brighter than before. I carried stones for it when I was younger and had a back. The stonemasons did the rest, and I still pray for every one of them." } },
      choices = {
        { text = "The stonemasons, you mean, the ones who were never paid.", next = "cathedral_masons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral_masons = {
      big = true,
      lines = { { id = "cm_default", text = "The same. Their hands built this house of the Light, and the city's purse forgot them. I've said so in the Keep and I'll say it again; it's not much, but it's what an old priest has." } },
      choices = {
        { text = "It's more than most said.", next = "BACK", fx = { affinity = 2, learn = { "defias" }, opinion = { defias = "masons_wronged" } } },
        { text = "Saying isn't doing.", next = "BACK", fx = { trait = { stern = 1 }, learn = { "defias" } } },
        { text = "Did the Church ever ask the crown to pay them?", tag = "Persuade", next = "masons_ledger",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { opinion = { topic = "defias", stance = "masons_wronged" } } } } },
          fail = { next = "masons_gentle", fx = { affinity = -1 } } },
      },
    },
    crusade = {
      lines = { { id = "cr_default", text = "Because the doors stay open, even to people I worry about. Brother Crowley believes he fights the plague. Perhaps he does. I pray for the ones he sends west, and for him." } },
      choices = {
        { text = "And if they're doing harm?", next = "crusade_harm" },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    crusade_road = {
      big = true,
      lines = { { id = "cro_default", text = "To Southshore, I think, and a man who left them. I know what's said about the Monastery. I let Crowley keep his corner because some of the Crusade's people are good, and they come through these doors too. What did you find?" } },
      choices = {
        { text = "Innocents tortured as plagued. Raleigh saw it.", next = "crusade_road2" },
        { text = "Nothing I can prove.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    crusade_road2 = {
      lines = { { id = "cr2_default", text = "Then I'll stop pretending not to know. I won't close the doors; that isn't who we are. But no one goes down those stairs again without praying with me first." } },
      choices = {
        { text = "That's something.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "It isn't enough.", next = "BACK", fx = { align = { light = -1 }, affinity = -1, trait = { stern = 1 } } },
      },
    },
    crusade_harm = {
      lines = { { id = "ch_default", text = "Then the Light will see it, and so will we, and the doors will still be open for them to come home through. That's the hardest part of keeping a church, child. Hope that outlasts reason." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    priest = {
      big = true,
      lines = { { id = "p_default", text = "Heal the people who annoy you, bless the ones who don't thank you, and sit with the dying even when you can do nothing. The spells come with practice; that comes with choosing, every day." } },
      choices = {
        { text = "That's harder than any spell.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Healing people who never thank me isn't a habit I'll keep.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "And when I fail?", next = "priest_fail" },
      },
    },
    priest_fail = {
      lines = { { id = "pf_default", text = "Then you come back here, kneel, get up, and try again tomorrow. I've done it more times than any priest in this city, and that isn't a confession, child; it's a qualification." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shadow = {
      big = true,
      lines = { { id = "s_default", text = "It calls shadow a blade with no handle. Some of our brothers and sisters learn to hold it and do good with it, but I never have, so I'd ask you to watch your hands, and come and see me if they start to feel cold." } },
      choices = {
        { text = "I'll keep to the Light.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "Shadow is a tool. I'll use what works.", next = "BACK", fx = { affinity = -1, align = { light = -2 }, trait = { stern = 1 } } },
        { text = "Has a priest ever gone too far into it?", next = "shadow_far" },
      },
    },
    shadow_far = {
      big = true,
      lines = { { id = "sf_default", key = true, text = "Once, that I know of. A bishop, after the First War, studied what the orcs' death-priests knew so we could fight it, and kept studying long after the fighting stopped. She preached that we need the dark as much as the light, and it ended badly; Dalaran's magi took every book she wrote, and I've never wanted to read them." } },
      choices = {
        { text = "She sounds as if she was wrong.", next = "shadow_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_wrong = {
      lines = { { id = "sw_default", text = "About the need? Perhaps not, but about how much of herself to pay for it, yes, and that's all I'd ask of you. Count what it costs, every time, and if you ever stop counting, come and see me." } },
      choices = {
        { text = "I'll keep count.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Some costs are worth paying.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    lordaeron = {
      lines = { { id = "lo_default", text = "Then you've seen what I only heard about, and heard about every night for a year. You're welcome here, and you always will be; light a candle for someone, if you'd like, as many do." } },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Candles won't bring them back, so I'll keep my grief to myself.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    masons_ledger = {
      big = true,
      lines = {
        { id = "ml_default", text = "Once, when the Cathedral was newly blessed, and I was told the treasury was empty and the masons would be paid in the spring. I believed it, child, and I let it drop, and the spring never came." },
        { id = "ml_tally", text = "Their foreman left me a tally of the unpaid days, every name and every week, and it's still in my desk. I read it on the anniversary of the riot, and I've never once found the courage to carry it back up to the Keep." },
        { id = "ml_priest", when = { class = "PRIEST" }, text = "You'll hear confessions one day, so here is mine: I was more grateful for the Cathedral than troubled by its price, and that's a sin I've been paying on ever since." },
      },
      choices = {
        { text = "Then carry it up now, Your Grace.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "You've done more than most, Your Grace.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Thank you for telling me.", next = "BACK" },
      },
    },
    masons_gentle = {
      lines = {
        { id = "mg_default", text = "The Church spoke for them, child, and it still does. That's all I'll say on it today, I think, because it's an old ache and I'd rather not wake it in front of the altar." },
        { id = "mg_default2", text = "We asked, as we ask for many things, and the asking goes on. Come and pray with me for them some evening; that's the better answer, and the only one I have just now." },
      },
      choices = {
        { text = "I understand, Your Grace.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_doubt = {
      big = true,
      lines = { { id = "paladin_doubt_l", text = "Every one of them should, child, and the good ones do it before they swing the hammer rather than after. A paladin who never doubts is only a soldier who glows." } },
      choices = {
        { text = "Then I'll keep my doubts close.", next = "paladin_doubt2" },
        { text = "Doubt gets people killed. I'll leave it to priests.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Doubt keeps the hammer honest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    paladin_doubt2 = {
      lines = { { id = "paladin_doubt2_l", text = "Close, but not hidden. Bring them to Rall, or to Lord Shadowbreaker, or to me; we've all carried a few, and they're lighter shared." } },
      choices = { { text = "Thank you, Your Grace.", next = "BACK", fx = { affinity = 1 } } },
    },
    warlock = {
      big = true,
      lines = { { id = "warlock_l", text = "The Light doesn't turn anyone away, child, though I'll not lie to you: some of my brothers might. You're standing under this roof, and nobody has struck you down, which tells you something about whose house it is." } },
      choices = {
        { text = "And if I never give up what I've learned?", next = "warlock_keep" },
        { text = "I don't need the Light's welcome.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then I'll come back, Your Grace.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    warlock_keep = {
      lines = { { id = "warlock_keep_l", text = "Then the door stays open all the same, and I'll pray you never need it as badly as I fear you might. Mind what answers when you call, child; not everything that answers is listening." } },
      choices = { { text = "Something else, Your Grace.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    elune = {
      lines = { { id = "elune_l", text = "So I'm told, and the kaldorei who come here to light candles at the sunset bell seem to find something under this roof all the same. I don't think the moon and the Light quarrel nearly as much as their priests do." } },
      choices = {
        { text = "Elune and the Light may be one mercy.", next = "elune_one" },
        { text = "Elune is not your Light, Your Grace.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    elune_one = {
      lines = { { id = "elune_one_l", text = "I'd like to think so, though I'd not say it too loudly near Bishop Farthing. Come and light a candle at the bell, if you like; nobody will ask which of them it's for." } },
      choices = { { text = "Something else, Your Grace.", next = "BACK", fx = { affinity = 2 } } },
    },
    rogue = {
      big = true,
      lines = { { id = "rogue_l", text = "Then you've done what kingdoms ask of their quieter children, and you've come to an archbishop about it, which tells me you're not sure it was right. Do you want absolution, child, or only someone to know?" } },
      choices = {
        { text = "Only someone to know.", next = "rogue_know" },
        { text = "It was necessary. I don't need absolution.", next = "BACK", fx = { align = { light = -1, order = 1 } } },
        { text = "Absolution, if the Light will give it.", next = "rogue_know", fx = { align = { light = 1 } } },
      },
    },
    rogue_know = {
      lines = { { id = "rogue_know_l", text = "Then I know, and I'll keep it the way Master Shaw keeps his files, without the filing. The Light was here before you told me, and it's still here now." } },
      choices = { { text = "Thank you, Your Grace.", next = "BACK", fx = { affinity = 2 } } },
    },
    shaman = {
      lines = { { id = "shaman_l", text = "Wrong? I've no idea, child, and I'd be a poor archbishop if I pretended otherwise. The orcs' shamans brought the Horde to us, but their warchief's shamans are said to have turned away from all that, and the earth you hear is the same earth this Cathedral stands on." } },
      choices = {
        { text = "Then you don't object?", next = "shaman_object" },
        { text = "The spirits are nothing to do with orcs.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    shaman_object = {
      lines = { { id = "shaman_object_l", text = "I object to cruelty, and to pride, and to very long sermons. Listen to your stones kindly and you'll have no quarrel with me." } },
      choices = { { text = "Something else, Your Grace.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    holy_light = {
      { id = "tp_holy_light", text = "The Light is not a lord who demands tribute, but a fire that burns in every soul, if only we tend it. I've seen it in a pauper and in a king, and I've seen it missing from both." },
      { id = "tp_holy_light2", when = { class = "PRIEST" }, text = "You serve the Light with your hands as well as your words, and that is the whole of our faith. Never forget that the beggar on the steps deserves your prayers as much as any lord." },
    },
    scourge = { { id = "tp_scourge", text = "The Scourge took Lordaeron, and the Church there fell with it, and I still pray for the priests who stayed to the end. I can't say their names without weeping, so I say them very quietly." } },
    forsaken = {
      { id = "tp_forsaken", text = "The Forsaken claim to have broken free of the Scourge, and some among the Church say they're beyond the Light's reach. I'm not so sure, though I'd not say it too loudly in council." },
      { id = "tp_forsaken2", when = { race = "Undead" }, text = "You walk here in the Light's own house, and the Light hasn't struck you down, which teaches me something I'm still trying to understand. Be at peace while you're here, whatever you were and whatever you are." },
    },
    stratholme = { { id = "tp_stratholme", text = "Stratholme's people were the Church's faithful, and they died in the prince's purge or worse. I've asked the Light many times what they did to earn that, and I've had no answer I could bear." } },
    silver_hand = { { id = "tp_silver_hand", text = "The Silver Hand was the Church's sword in the world, and Uther was its heart. The order's scattered now, but the Light it carried isn't, and I see it in every young paladin who kneels here." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood of Northshire keep the old abbey and train our priests and paladins. They're good men and women, and a little stubborn, which is what the Light requires sometimes." } },
    varian = { { id = "tp_varian", text = "I pray for King Varian every morning, as I've done since the day his ship was lost. I believe he lives, because I must, and because the Light has not told me otherwise." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "The Scarlet Crusade began as men grieving their homes, and they've grown into something that grieves nothing. I've written to them to urge mercy, and they've written back to call me weak." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn fight the Scourge without the Crusade's hatred, and I bless them for it. If the Light has soldiers in the north today, I think they wear silver, not red." } },
    elune = { { id = "tp_elune", text = "The night elves pray to Elune, and I've stood beside their priestesses in prayer and felt nothing strange about it. The Light and the moon may be different words for the same warmth, though I'd not say that before every bishop." } },
    knows = {
      { id = "tp_knows", text = "People bring the Cathedral their troubles from every corner of the kingdom, and some of it sticks to an old priest. Ask me about any of this, child." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, I've all the time the bells allow. Ask me anything here, and I'll tell you what I know, and what I only hope." },
    },
    background = { { id = "tp_ba", text = "A student of Archbishop Faol who never stopped being one. The robes came later. The look of a farmer never left.", next = "faol" } },
    advice = { { id = "tp_ad", text = "Pray when you're grateful, not only when you're frightened. The Light enjoys being thanked, I think. Most of us do." } },
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian's test. I've read the book, but I've never had the patience to teach from it, and he has." } },
    northshire_abbey = { { id = "tp_abbey", text = "Where many of us began. The bells there are older than this Cathedral." } },
    defias = { { id = "tp_defias", text = "I pray for the masons. I pray for the people they rob. Some days I run out of prayers before I run out of names." } },
    _none = { { id = "tp_none", text = "I don't know, child. I'd rather say that than pretend." } },
  },
}

-- Gazin Tenorm: a dwarf at the altar, frightened for his friend.
P:NPC {
  key = "gazin", id = TODO_NPC("Gazin Tenorm"), name = "Gazin Tenorm",
  bible = "bibles/gazin.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "brave", "lawful" },
  notices = { "paladin" },
  impression = {
    first = "Gazin Tenorm is a dwarf frightened for his friend and far too stubborn to hide it. He would sooner be out searching than standing at an altar waiting on prayers.",
    third = "{name} met Gazin Tenorm at the Cathedral, a dwarf sick with worry for his friend Henze Faulk.",
  },

  greetings = {
    { id = "g_altar", text = "Aye? Make it quick, I've a friend tae worry about." },
    { id = "g_symbol", when = { questActive = TODO_QUEST("The Symbol of Life") }, text = "Ye've got the Symbol? Then go, because Henze cannae wait." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Symbol of Life") }, text = "There's the {g:lad|lass} who brought Henze back. Stand a moment so I can look at ye." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", maxLevel = 15 },
      text = "Rall sent ye? Ye're young, which is good, for young legs get places quicker. Now listen close." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Prayers and patience, they give me. Our folk listen to the stone, not the wind, but if your spirits can do better than an altar, I'll take it." } },
      choices = {
        { text = "I'll help you search, Gazin. A friend isn't left to prayers alone.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Wait a while longer. Rushing out blind helps no one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I asked, lad, an' they told me scrying costs money an' a lock o' the man's hair, an' I had neither. Henze went into the dark wi' the proof we gathered, an' I'll not rest till someone fetches him or tells me plain what's become of him." },
      },
      choices = {
        { text = "Then I'll go looking myself, Gazin, without coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The Quarter's right. Nobody works for free.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gazin.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "If they could talk, I'd buy every wolf in the forest a pint. Ye're the only one who's offered tae ask them, so I'll take it, though I'll keep prayin' all the same." } },
      choices = {
        { text = "I'll ask every creature in Elwynn until one of them answers.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Henze chose his danger. The forest owes him nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Near enough, though no' on any list ye'll find, which is how Shaw likes it. We were tae follow the coin from the Defias tae whoever's payin' them in the city, an' we got close enough tae be stabbed for it." } },
      choices = {
        { text = "Whoever's paying them should face the King's justice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Find the payer and settle it quietly, without any courts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Ye'd raise him, would ye, wi' that fel stuff? No, friend, I'll no' have Henze come back wearin' somethin' else's shadow, an' I'd rather he stayed dead than that." } },
      choices = {
        { text = "You're right. Some help costs more than it gives.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Dead is dead, dwarf, and I'd bring him back any way I could.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Cannae say, an' I've asked meself every night since. The Defias came quiet an' many, an' a good shield would've bought time, but time against that many is only a slower endin'." } },
      choices = {
        { text = "Then I'll be the shield the next one needs.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some fights can't be won. Better to know when to run.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, if they knew where tae start. The Defias move through Westfall like foxes through wheat, an' they leave sign if ye know how tae read it: cart ruts tae the old mines, an' red cloth snagged on fences." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} could sniff out a Defias camp, I'd wager, if ye let it loose near the Westfall farms. Mind it doesnae find a trap first." },
      },
      choices = {
        { text = "I'll follow the trail and bring the evidence back for justice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll follow it, and settle things myself when I get there.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Gazin Tenorm. Henze Faulk an' me were gatherin' proof on the Defias for the king's advisors, but they found us first. I got away, an' Henze didnae." },
        { id = "h_tome", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity") },
          text = "He's out by Heroes' Vigil, or what's left of him is. Rall says the Light can bring him back, if the hand holding it is steady." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Symbol of Life"), days = 3 } },
          text = "He's alive. Grumblin', bruised, alive. I owe ye more than I can pay, an' I'm a dwarf, so I'll try anyway." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf in the Cathedral! We're rarer here than ale, so I'm glad tae see a friendly beard." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Another o' the healers? Yer brothers here have patched me twice today, an' I'm mended, so save yer prayers for Henze." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye move like Henze did, quiet an' careful. Did Shaw send ye, or are ye one o' the Defias come tae finish the job?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Keep yer distance from the altar, would ye? I've no quarrel wi' ye, but the priests here go pale when yer kind walks in." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, aye. If Henze had had a warrior at his back that night, mebbe he'd be standin' here instead o' me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Ye'll know how tae follow a trail, then, which is more than the king's advisors seem able tae do with the one Henze an' I left 'em." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, eh? Ye've a nose for the wild, an' Henze is still out there somewhere wi' the Defias. If ye could track a man by the smell o' him, I'd be in yer debt." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, eh? Ye'll know a fair bit about readin' old scripts, I'd guess, an' Henze an' me had papers that needed readin'." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "You talk to the earth? Then ask it where my friend is, because the priests here only tell me to wait, and I'm sick of waiting." },
      },
      again = {
        { id = "h_again", text = "Aye? What else?" },
        { id = "h_again2", text = "Go on. Talkin' keeps me from pacin'." },
      },
      choices = {
        { text = "You were investigating something out there.", next = "proof" },
        { text = "Tell me about Henze.", next = "henze" },
        { text = "Those Defias papers must have gone somewhere.", next = "script", when = { questDone = TODO_QUEST("The Symbol of Life") } },
        { text = "Let me see to those wounds.", next = "priest", when = { class = "PRIEST" } },
        { text = "You and Henze sound like SI:7 to me.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would a warrior have saved Henze, Gazin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a hunter track the Defias to their hideouts, Gazin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would a warlock's help be welcome for Henze?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could the beasts of Elwynn tell us where Henze went, Gazin?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Have the priests given you any hope for your friend, Gazin?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll bring him back.", next = "END", when = { class = "PALADIN" }, fx = { affinity = 1, align = { light = 1 } } },
        { text = "Henze is beyond saving, friend, so let him rest.", next = "END", when = { class = "PALADIN" }, fx = { align = { light = -1 } } },
        { text = "Could the Mage Quarter help you find Henze, Gazin?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    proof = {
      lines = {
        { id = "p_default", text = "We'd heard the Defias were in Elwynn. Out on Heroes' Vigil we caught a pair o' them goin' over papers, so we went for the papers. Their wizards went for us." },
      },
      choices = {
        { text = "Why you two?", next = "proof_why" },
        { text = "Then the papers matter.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    proof_why = {
      lines = { { id = "pw_default", text = "Because the King's advisors wouldnae believe the Defias were in Elwynn without proof in their hands. Henze an' me thought we'd put it there." } },
      choices = { { text = "Brave of you.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    henze = {
      lines = { { id = "he_default", text = "Henze Faulk. Stubborn as a rockslide an' braver than he's got sense for. He held them off on that island so I could run. So I ran." } },
      choices = {
        { text = "You had no choice.", next = "henze_guilt", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "You left him?", next = "henze_guilt", fx = { trait = { stern = 1 } } },
      },
    },
    henze_guilt = {
      big = true,
      lines = { { id = "hg_default", text = "Aye, an' every night since I've asked myself which o' us was the brave one. I know the answer, an' I dinnae like it." } },
      choices = {
        { text = "Running took courage too.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Then make it right.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
      },
    },
    script = {
      lines = { { id = "sc_default", text = "Rall read it first, then it went up tae the King's advisors. Proof the Defias are in Elwynn, in their own hand. Let them call it rumour now.",
        fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "pr_default", text = "Ach, the Cathedral's priests have done what they can, an' it's plenty. If ye've Light tae spare, spend it on Henze. I'll live." } },
      choices = {
        { text = "Then I'll pray for Henze.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Henze is gone, Gazin, and my prayers are for the living.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    heroes_vigil = {
      { id = "tp_heroes_vigil", text = "Henze and I were at Heroes' Vigil on Stone Cairn Lake when the Defias caught us goin' over their papers. He held them off so I could run, and I ran, and I'll not forgive myself until he's on his feet again." },
      { id = "tp_heroes_vigil2", when = { questDone = TODO_QUEST("The Symbol of Life") }, text = "Henze is back on his feet, and he's already askin' to go back to Heroes' Vigil and finish the job. I've told him he's mad, and I'm goin' with him." },
    },
    magni = { { id = "tp_magni", text = "King Magni sent us south to keep an eye on the Defias, and I'd like to send him better news than I've got. He's a good king, {g:lad|lass}, and a patient one, but patience has its limits." } },
    explorers_league = { { id = "tp_explorers_league", text = "Henze and I did a turn with the Explorers' League before the King gave us this work, diggin' in the Loch Modan hills. I miss the quiet of it, if I'm honest, and I miss not bein' shot at." } },
    holy_light = { { id = "tp_holy_light", text = "The Light healed my wounds when the priests here laid hands on me, and I'll not doubt it again. I've asked it to bring Henze back too, and Rall tells me it's listenin'." } },
    deadmines = { { id = "tp_deadmines", text = "Henze and I followed the Defias trail far enough to know they've a nest under Moonbrook. We never got close enough to see it, and that's the only reason I'm still breathin'." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are a curse on every dwarf, and I'd hammer them flat if I could. Henze always said we'd go after them once the Defias were done, and I mean to hold him to it." } },
    knows = {
      { id = "tp_knows", text = "I've been sitting by this altar long enough to hear half the Trade District's business, lad. Ask me about any of it, and I'll tell you what I can between prayers." },
    },
    background = { { id = "tp_bg", text = "A dwarf who went lookin' for proof an' found more than he wanted. That's me lately. Ask me again when Henze is on his feet." } },
    advice = { { id = "tp_ad", text = "If a friend tells ye tae run, run, but then come back with help. Dinnae skip the second part." } },
    defias = { { id = "tp_defias", text = "Organized, well-armed, an' meaner than they look. They look plenty mean." } },
    tome_of_divinity = { { id = "tp_tome", text = "Rall's book. I'm no paladin, but I've seen what it does tae the ones who finish it." } },
    _none = { { id = "tp_none", text = "Cannae help ye there. I'm a worrier, no' a scholar." } },
  },
}

-- Stephanie Turner: she and her husband run the orphanage.
P:NPC {
  key = "stephanie", id = TODO_NPC("Stephanie Turner"), name = "Stephanie Turner",
  bible = "bibles/stephanie.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "craft", "child" },
  impression = {
    first = "Thirty children wait on Stephanie Turner, so she is always in a hurry, and still she found a moment to tell me to eat something. I doubt she has slept properly in years.",
    third = "{name} met Stephanie Turner, who runs Stormwind's orphanage with her husband and never has enough linen.",
  },

  greetings = {
    { id = "g_busy", text = "Sorry, love, I'm in a hurry, as always; children don't wait." },
    { id = "g_tome", when = { questActive = TODO_QUEST("The Tome of Divinity") }, text = "Did Duthorian send you? He does that, bless him." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew! Oh, if you've ever a spare afternoon, there are thirty children who'd love a coat that fits." },
    { id = "n_young", cat = "child", when = { maxLevel = 8 },
      text = "You look barely older than some of mine. Eat something. That's an order from someone's mother." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every day, and I've no good answer for them. Some of them lost fathers to the orcs, so you might keep the spirit-talk quiet around them, love." } },
      choices = {
        { text = "Then I'll show them a shaman can be a friend to Stormwind.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They'll have to learn the world's not simple. Better now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Frighten? They'd climb all over your imp and ask it its name, and then they'd have nightmares for a week and I'd be the one up with them. These children have seen enough already, from the north and the farms and the war, so I'd thank you to keep your magic where they can't see it." },
      },
      choices = {
        { text = "I'll keep it hidden, Stephanie. They've seen enough.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They'll see worse in this world. Better they learn now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Stephanie.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They'd love it, and they'd dig it up again by morning to see if it had roots yet. There's nowhere to plant one here anyway, unless the Archbishop lends me a corner of the square, and I'd not dare ask him." } },
      choices = {
        { text = "Ask the Archbishop properly. A tree in his square needs his leave.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Don't ask. Plant it at night and let him find it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Some do, love, when the bread runs short, and the Defias are always waiting at the canal's edge with a warm coat and a knife. I lose one or two a year to them, and I lie awake over every one." } },
      choices = {
        { text = "The men who recruit children should answer to the Watch.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A hungry child takes the coat that's offered. I don't blame them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Would you, love? Something small and pretty, a bit of frost on the window or a little light, because they've seen enough fire for one lifetime, and the ones from Lordaeron don't laugh at flames." } },
      choices = {
        { text = "Only gentle things, then. I'll keep it soft for them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fire's part of the world, so they may as well get used to it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Half of the boys do, and a few of the girls, and I can't blame them when every soldier they see is a hero in a story. I only wish they'd remember that their own fathers marched off the same way." } },
      choices = {
        { text = "I'll tell them the truth: it's hard, and it costs people.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them dream. They'll learn soon enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every night, if you could spare it, though I'd settle for once a week. Half of them lost their families to the Defias or the plague, and the prayers I know are only the ones my mother taught me, which aren't nearly enough." } },
      choices = {
        { text = "Then I'll come when I can. No child should sleep without comfort.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers don't fill bellies, Stephanie. Food would help them more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every one of them, and half the girls too, though I'd sooner they wanted to be bakers. It's a fine thing to protect people, but I've seen too many go off to war and never come home." } },
      choices = {
        { text = "Someone must stand between them and the dark. Let them dream.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You're right. Let them choose a safer trade while they can.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! The little ones sleep better on the nights someone from the Cathedral comes to say prayers with them, so you'll forgive me if I ask." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Oh, don't let the boys see you, or they'll follow you to the gate and I'll spend the afternoon fetching them back." },
        { id = "h_default", text = "Stephanie Turner. My husband and I run the orphanage. I make their clothes and keep them fed; John's off begging for the rest. Neither of us sleeps much." },
        { id = "h_tome", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity") },
          text = "You'd help? Then it's linen I need, plain linen cloth, because I've more children than shirts this winter. Bring me ten pieces and I'll have something to sew." },
        { id = "h_john", text = "John's up in Ironforge asking the dwarves for help. They're generous, once they've decided you're not a fool. It takes them a while." },
        { id = "h_war", when = { origin = "human_lordaeron_refugee" },
          text = "Some of my little ones came south from Lordaeron, same as you. They don't talk about it. Maybe you'd sit with them sometime." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Oh, the little ones love a robe. Come by the orphanage, love, just past the Cathedral, and tell them a story with a happy ending. They're short of those." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You keep your hands where I can't see them, love, which is a habit I'd break in any of my boys. Show me your hands, there's a dear." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Oh, the children would go wild for a few sparks, if you've a minute, so long as nothing sets the curtains alight." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The boys will want to see your sword, and I'll thank you not to let them hold it, however nicely they ask." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Please don't change into anything in front of the children, love, because I'll never get them to sleep again after a bear." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, near the orphanage. Keep that creature close, please, the little ones will want to pet it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Well, whatever you do, eat something first. Thirty children, and not one of them knows what a spirit is." },
      },
      again = {
        { id = "h_again", text = "What else, love? Quick, I've a hem to finish." },
        { id = "h_again2", text = "Go on, I'm listening. My hands are busy, not my ears." },
      },
      choices = {
        { text = "There are a great many children here.", next = "children" },
        { text = "I don't see your husband about.", next = "john" },
        { text = "The children look like they could use a good deal.", next = "needs" },
        { text = "I came south from Lordaeron as a child.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "I sew, as it happens.", next = "sew", when = { profession = "Tailoring" } },
        { text = "Would the children like to meet {pet}?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Do your orphans ever turn to thieving?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Shall I show the children a little magic?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the orphans want to grow up to be soldiers?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could the children use someone to pray with them?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the boys really want to be paladins, Stephanie?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would the children like to plant a tree somewhere, Stephanie?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the children frighten easily, Stephanie?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the children ever ask about the war, Stephanie?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll keep you in mind.", next = "END" },
      },
    },
    children = {
      lines = {
        { id = "c_default", text = "Too many, and not enough beds. The wars made orphans faster than anyone could build homes for them." },
      },
      choices = {
        { text = "That's a hard thing.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Orphans are the price of war, and they'd better learn it early.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Someone should do something.", next = "someone" },
      },
    },
    someone = {
      lines = { { id = "s_default", text = "Someone is, love, and it's me. You're welcome to join in." } },
      choices = { { text = "Ha. Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    john = {
      lines = { { id = "j_default", text = "He's in Ironforge, asking the dwarves for help. He writes that the beer is strong and the purses are slow to open. Then they open all the way." } },
      choices = {
        { text = "It can't be enough.", next = "john_enough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    john_enough = {
      lines = { { id = "je_default", text = "It has been, every winter so far. Every winter I wonder whether this is the one it won't be. Then I go back to sewing." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    needs = {
      lines = { { id = "n_default", text = "Shirts and trousers, mostly, because they grow out of everything. Duthorian sends me his young paladins with linen, but I'd take anyone's." } },
      choices = {
        { text = "Paladins bring you linen?", next = "needs_paladins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    needs_paladins = {
      lines = { { id = "np_default", text = "Part of their training. They come in proud and leave having hemmed a dozen sleeves. Best thing that could happen to them." } },
      choices = { { text = "I can believe it.", next = "BACK", fx = { affinity = 1 } } },
    },
    refugee = {
      lines = { { id = "r_default", text = "Then tell me something, love. What helped you, that first winter here? I'll do more of it." } },
      choices = {
        { text = "Someone who didn't ask questions.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Bread, honestly.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },
    sew = {
      lines = { { id = "se_default", text = "Then you know linen goes further than wool and wears out twice as fast. Bring me a few bolts sometime and I'll remember your name." } },
      choices = { { text = "I'll bring some.", next = "BACK", fx = { affinity = 2, trait = { generous = 1 } } } },
    },
    pet = {
      lines = { { id = "pet_l", text = "Like to? They'd never let it leave! Does it mind being climbed on, love, because I can't promise thirty children won't try." } },
      choices = {
        { text = "{pet}'s patient. Bring them out.", next = "pet2" },
        { text = "Maybe one at a time.", next = "pet2", fx = { trait = { cautious = 1 } } },
      },
    },
    pet2 = {
      lines = { { id = "pet2_l", text = "Oh, bless you. Little Timmy will cry when you go, mind, and then he'll ask for a cat again, and I'll have to say no again." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    holy_light = { { id = "tp_holy_light", text = "The Light watches over every child in that orphanage, and I'd like it to send a few more blankets while it's watching. I pray every night, and I darn every night, and I think the Light prefers the darning." } },
    scourge = { { id = "tp_scourge", text = "Half the new children come from Lordaeron, and some of them won't sleep without a candle. I don't ask what they've seen, because I can see it in their faces when the lights go out." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I took the children to the Darkmoon Faire when it came to Goldshire, all thirty of them, and only lost one for an hour. He was found asleep in the fortune-teller's tent, and he said she'd promised him a dog." } },
    deadmines = { { id = "tp_deadmines", text = "Some of my older boys talk about running off to join the Defias in their mines under Moonbrook. I tell them the Defias have no orphanage, and they go quiet, and I pray it's enough." } },
    knows = {
      { id = "tp_knows", text = "I hear all sorts on the way to the market and back, love, mostly from people who think a woman with a basket isn't listening. Ask me about any of this, quickly, before the children miss me." },
    },
    background = { { id = "tp_bg", text = "John's wife, and everything else the orphans need. There isn't time for more of a story than that, love. There's a hem waiting." } },
    advice = { { id = "tp_ad", text = "Mend a thing before it tears all the way, whether it's clothes, roofs or people. It's always cheaper early." } },
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian's young paladins come to me. I put them to work. They go away a little kinder." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, love, but ask me about children's sizes." } },
  },
}

-- Lil Timmy: has a kitten. Needs a good home for it. Dad says no.
P:NPC {
  key = "timmy", id = TODO_NPC("Lil Timmy"), name = "Lil Timmy",
  bible = "bibles/timmy.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "cowardly" }, values = { "kind" },
  notices = { "pet", "wonder" },

  barks = {
    { id = "b_kitten", text = "Kitten for a good home! She's a very good kitten and she hardly scratches!" },
    { id = "b_dad", text = "Dad says I can't keep her. Dad says a lot of things." },
  },
  impression = {
    first = "Lil Timmy has a kitten that needs a good home and a father who says theirs isn't one. He made his case with all the persistence of a seasoned merchant.",
    third = "{name} met Lil Timmy, a boy near the Cathedral who is determined to find his kitten a good home.",
  },
  greetings = {
    { id = "g_kitten", text = "Do you want a kitten? Please say yes." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Did you change your mind? Say you changed your mind." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "You've already got an animal! Does {pet} like cats? She's very small and she won't be any trouble... probably." },
    { id = "n_cat", cat = "wonder", place = "replace", when = { form = "cat" },
      text = "Look, a kitty, a big one! Are you her mum? No, you're not her mum, you're a person, and that's even better." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Yes, and Father says ours isn't one, but he's wrong, because it's warm and there's milk. You could talk to his spirit and fix him." } },
      choices = {
        { text = "Ask your father honestly, Timmy, and keep asking.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Hide the kitten in the cellar. He'll never know.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I don't think so, she's hiding in my coat now, and she only does that when the guards' dogs go past. Dad says demons are bad and people who keep them are worse, but you don't look worse, you look tired, and maybe that's different." },
      },
      choices = {
        { text = "Your dad means well, Timmy. Keep her away from it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your dad doesn't know everything, Timmy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Timmy.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "She'd love it, but she'd want to be the boss, because she's the boss of the whole bakery and the mice know it. Can you be a little cat, though, and not a big one, because a big one might eat her?" } },
      choices = {
        { text = "Every house needs a boss, Timmy, and she can be it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cats don't have bosses, Timmy. Every cat is free.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Very sneaky, which is good, because my mum says sneaky people and cats get along. If you took her home, she could teach you to catch mice, and you could teach her to open doors." } },
      choices = {
        { text = "She'd be safest with someone honest, Timmy, not someone sneaky.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A sneak and a kitten sounds like the perfect team.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only a little bit, just so he'd say yes about the kitten, and then you could unmagic him after. Mum says that's not fair, but Mum didn't say it was impossible." } },
      choices = {
        { text = "That wouldn't be fair, Timmy, so ask him honestly instead.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A little spell never hurt anyone, Timmy.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Yes, please, because the guards keep telling me to move and the cats in the alley keep hissing at her! If you guarded her nobody would hiss, I bet, not even the big orange one." } },
      choices = {
        { text = "Every little one deserves someone to stand up for them, Timmy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A warrior has bigger things to guard than kittens, Timmy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Yes! Pray she finds a good home, and pray my dad changes his mind, because that would be the same home and then everybody's happy." } },
      choices = {
        { text = "I'll pray she finds a loving home, Timmy, wherever it is.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't change your father's mind. You'll have to ask nicely.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Would you really? She'd be Sir Whiskers, then, and my dad couldn't say no to a knight, could he, because that would be against the law." } },
      choices = {
        { text = "Knighthood is a solemn oath, Timmy, even for kittens.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Kneel, Sir Whiskers, and never mind the rules.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Are you from the Cathedral? Do priests like cats? I think my kitten likes priests, because they have soft robes." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "You're a paladin! Are you a knight? Can you knight my kitten? She's very brave, because she fought a moth yesterday." },
        { id = "h_default", text = "I'm Timmy, and this is my kitten. She needs a good home, and my dad says ours isn't one, for cats; he likes it fine for me." },
        { id = "h_rich", when = { money = { min = 10000 } },
          text = "You look like you've got a nice house, with a fire, and cats love fires. I'm just saying." },
        { id = "h_bit", when = { metBefore = true }, text = "One of the kittens bit me today, but I still love him, and you should love him too." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You're really quiet, like my kitten when she's stalking the mice behind the bakery, so I think you're a cat person." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "Are you a wizard? Can you make my dad say yes with a spell? Only a little spell, a nice one." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "You've got a big sword! Is it heavy? My kitten's scared of swords, so please don't swing it near her, all right?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Can you turn into a cat? Because if you can, my kitten would have a friend, and then Dad would have to say yes." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Is that a demon? Is it a nice one? My kitten doesn't like it, she's gone all puffy." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "You talk to animals' spirits? Then tell my father that my kitten has a good soul and needs a home!" },
      },
      again = {
        { id = "h_again", text = "Do you want to hold her now? She's ready." },
        { id = "h_again2", text = "She likes you, I can tell, because she's purring... or that's my tummy." },
      },
      choices = {
        { text = "Let me see her.", next = "BUSINESS" },
        { text = "Your dad won't let you keep her, then.", next = "dad" },
        { text = "I've seen you walking her all over the city.", next = "walk" },
        { text = "Shall I bless her?", next = "bless", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "My {pet} would like to meet your kitten.", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "I'm a sneaky sort, Timmy.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you want me to magic your dad, Timmy?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would your kitten like a warrior to guard her, Timmy?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Would you like me to say a prayer for your kitten, Timmy?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Shall I knight your kitten, Timmy?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think your kitten would like a cat for a friend, Timmy?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would your kitten like my imp, Timmy?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does your kitten really need a home, Timmy?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Sorry, Timmy.", next = "END" },
      },
    },
    dad = {
      lines = { { id = "d_default", text = "He keeps saying allergic, and I don't know what it means, but I don't think it has anything to do with kittens. And her sister needs a home too." } },
      choices = {
        { text = "Her sister?", next = "dad_sister" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dad_sister = {
      lines = { { id = "ds_default", text = "There were two, and Dad says no to both, so that's two noes. I'm still working on him." } },
      choices = { { text = "Good luck, Timmy.", next = "BACK", fx = { affinity = 2 } } },
    },
    walk = {
      lines = { { id = "w_default", text = "Along the canal from the Cathedral, over the bridges, through Old Town where the man shouts, then up by the dwarves. She likes the dwarves, because they smell of smoke." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bless = {
      lines = { { id = "bl_default", text = "Does that make her holy? Holy kittens definitely need homes. That's in a book, probably." } },
      choices = { { text = "It's in a book.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    pet = {
      lines = { { id = "pet_l", text = "Is {pet} nice to kittens? She's very small and very brave, and she'll probably hiss, but she doesn't mean it." } },
      choices = { { text = "{pet} will be gentle.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has a man who juggles knives, and I want to be him, but my da says I'd lose all my fingers. I've been practising with spoons, and I've only broken one." } },
    onyxia = { { id = "tp_onyxia", text = "Is there really a dragon in a swamp who sleeps on gold? I'd keep my kitten away from her, because dragons probably eat kittens, and that's why I need someone to take her." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "The statues in the Valley of Heroes are so big a kitten could live in one of the boots. I tried to tell the guards that, and they said no, but they didn't say why." } },
    background = { { id = "tp_bg", text = "I'm Timmy and I'm nearly big, and I find homes for kittens. That's my whole story so far." } },
    advice = { { id = "tp_ad", text = "If you're sad, get a kitten. If you're happy, get a kitten. I have one, if you need one." } },
    _none = { { id = "t_none", text = "I don't know. Do you want a kitten, though?" } },
  },
}

-- The Cathedral's priest trainers and the Scarlet Crusade's emissary downstairs.
-- Sources: High Priestess Laurena, Brother Joshua, Brother Benjamin, Brother Crowley and
-- Desperate Prayer (Cathedral Square) on warcraft.wiki.gg; bibles/benedictus.md.

-- High Priestess Laurena: the Cathedral's senior priest trainer; promising priests are sent to her.
P:NPC {
  key = "laurena", id = TODO_NPC("High Priestess Laurena"), name = "High Priestess Laurena", title = "Priest Trainer",
  bible = "bibles/benedictus.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "steady", "sharp" }, values = { "pious", "dutiful" },
  spiritSensitive = true,
  notices = { "light", "affliction", "form" },
  impression = {
    first = "High Priestess Laurena likes her students standing in the light from the windows, and she looks at them very carefully when they do. She trusts slowly, and I think she's usually right to.",
    third = "{name} met High Priestess Laurena, the Cathedral's senior priest trainer, who teaches only those she trusts with more.",
  },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Come. Stand where the light from the windows falls. I like to see who I'm teaching." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "Do not turn your back on the Light, friend. It notices who keeps facing it." },
  },

  notice = {
    { id = "n_shadow", cat = "form", place = "before", when = { form = "shadow" },
      text = "Out of that shape, please. You can't call on the Light while you wear it, and I can't teach someone who can't hear the lesson." },
    { id = "n_hurt", cat = "affliction", place = "before", when = { durability = { max = 0.25 } },
      text = "You've been bleeding into your armour, so stand still a moment. There: the Light first, and then the lesson." },
    { id = "n_light", cat = "light", when = { class = "PRIEST", alignment = { axis = "light", min = 40 } },
      text = "Your prayers are getting quieter, and that's good. Loud prayers are usually for the person praying." },
  },

  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "And there goes the Light. Step back out when you want to learn something." },
  },

  start = "hello",
  nodes = {
    xpt_laurena = {
      big = true,
      lines = { { id = "xpt_laurena_default", text = "A paladin teaches you to stand your ground when your instinct is to step back and mend, and you teach them that the Light is not only a hammer. The best pairs I've known argued constantly and never once let the other fall." } },
      choices = {
        { text = "Then I'll stand my ground beside them, whatever comes.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll let them stand. A fallen healer helps nobody.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_whitemane = {
      big = true,
      lines = { { id = "xcl_whitemane_default", text = "Then the Light answered her even at the end, or she believed it did, and I can't say which troubles me more. A priest's power isn't proof of a priest's righteousness, and that's the hardest thing I teach, because most students want the one to mean the other." } },
      choices = {
        { text = "Faith needs humility, Priestess, or it ends on Whitemane's road.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith needs steel. Whitemane only forgot where to point it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Someone ought to have reined the Crusade in.", next = "xcl_whitemane2" },
      },
    },
    xcl_whitemane2 = {
      lines = { { id = "xcl_whitemane2_default", text = "The Archbishop has written to Tirisfal more than once, and the Crusade answers politely and does as it likes. They think the Church in Stormwind is too soft for the north, and some days, reading the reports from Lordaeron, I can't fault them for thinking it." } },
      choices = {
        { text = "Soft isn't the same as weak, Priestess.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think the Light is not jealous, though some of my brothers would argue. But I have seen what spirits did for the orcs, and I am slow to trust them." } },
      choices = {
        { text = "The Light and the spirits both shelter the living. I believe that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light alone is enough. I'll not pretend otherwise here.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The Light sees the dark as clearly as the day, though I'll grant it is more patient than the city guard. I've healed more of the king's quiet servants than you'd believe, and they all asked me that question, usually while I was stitching them up." },
      },
      choices = {
        { text = "Then I'll try to give it less to be patient with.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Patience suits me. I'll keep working in the dark.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, High Priestess.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The Light answers whoever turns to it, though mages are so used to commanding that they rarely think to ask. That's the lesson your kind find hardest, and it isn't in any of your books either." } },
      choices = {
        { text = "I can learn to ask, High Priestess, rather than command.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'd rather command a power than wait for one to answer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "By staying behind you and staying alive, mostly, which is harder than it sounds when you charge off without looking. The best pairs I've trained learn each other's habits, because a shield and a prayer work best when they trust each other." } },
      choices = {
        { text = "I'll keep the line, and trust my healer to keep me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll charge when I see fit. Healers can keep up.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than you'd think, because a hunter and a priest can both stand back and see the whole of a fight. I've sent many young priests out to Redridge with hunter companions, and most came back telling me it was the hunter who kept them alive." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} will be the one taking the blows, I suppose. I've mended a few beasts in my time, and they're far better patients than soldiers." },
      },
      choices = {
        { text = "My pet takes the blows so others don't. I honour that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "That's what a pet is for. Better it than me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "My students learn to listen to the Light, and yours learn to carry it into places it isn't welcome. Both are needed, but I've seen paladins forget to listen, and priests forget that someone has to go out and fight." } },
      choices = {
        { text = "The oath and the Church should guide me together.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll follow the Light as I feel it, not the Church's rules.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_laurena", tags = { "news" }, when = { party = { class = "PALADIN" }, class = "PRIEST" },
          text = "{companion} wears the Light in plate, I see, and you hold it in your hands. Between the two of you, someone in that company will come home who otherwise wouldn't." },
        { id = "h_cl_whitemane", tags = { "news" }, when = { cleared = "Scarlet Cathedral" },
          text = "They say Whitemane is dead in her own cathedral in Tirisfal, and that you were there to see it. She learned the same prayers every priest in this hall learned, and I've been wondering all morning where her road and ours parted." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The Light speaks to you differently than to my students, but it speaks, and I'd like to hear what you've done with it." },
        { id = "h_default", key = true,
          text = "Laurena. I teach the priests the Abbey and Goldshire send me, once they've shown they can be trusted with more. Some of them can." },
        { id = "h_prayer", tags = { "news" }, when = { questActive = TODO_QUEST("Desperate Prayer") },
          text = "Josetta sent you, and good, because she sends me very few and she's never wrong. There are lessons every servant of the Light must learn, and this is the first of the hard ones." },
        { id = "h_prayer_done", when = { questDone = TODO_QUEST("Desperate Prayer") },
          text = "You've carried that prayer a while now. Have you needed it yet? You will, so be glad it's there." },
        { id = "h_young", when = { class = "PRIEST", maxLevel = 12 },
          text = "You're young, for the Cathedral, but that's no fault. It only means the hard lessons are still ahead, and most of them are not in books." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, good, it's you. I've told the novices about you, a little, as an example of what to aim for, so don't let it go to your head." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in the Cathedral. You'll want to know whether the Light and the arcane can share a room, and they can, if both keep their voices down." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in the priests' hall. You've come for healing, I expect, or for an hour where nobody shouts orders at you; either is welcome here." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You keep your distance in a fight, I'm told, which makes you very easy for a priest to love." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You stand at the edge of the light, child, and not in it, and I've taught enough students to know what that means." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Stand in the light from the window, please. A shaman in the Cathedral is rare, and I want to see you clearly before I decide what I think." },
      },
      again = { { id = "h_again", text = "What else? Quietly; there's a service soon." }, { id = "h_again2", text = "Ask. I'll answer what I can, and tell you when I can't." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Some lessons aren't in any book, I'd guess.", next = "lessons", when = { class = "PRIEST" } },
        { text = "A high priestess must have a great deal to do.", next = "duty" },
        { text = "Josetta speaks well of you.", next = "josetta", when = { heardLine = "josetta.h_prayer" } },
        { text = "The Abbey raised me. I'm one of theirs.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "I doubt the Light can mend what a demon has touched.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Do the Cathedral's healers ever tend druids?", next = "druid", when = { class = "DRUID" } },
        { text = "I doubt the Light answers a mage, High Priestess.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How does a priest best help a warrior, High Priestess?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do priests often travel with hunters?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "How do a priest's prayers and a paladin's oath differ?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Light care what I do in the dark, High Priestess?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think the spirits and the Light can stand together?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I saw Whitemane fall. She raised the dead to fight beside her.", next = "xcl_whitemane", when = { cleared = "Scarlet Cathedral" } },
        { text = "What should a priest and a paladin learn from each other?", next = "xpt_laurena", when = { party = { class = "PALADIN" }, class = "PRIEST" } },
        { text = "Thank you, High Priestess.", next = "END" },
      },
    },
    lessons = {
      big = true,
      lines = { { id = "l_default", text = "You learn that you can't save everyone. That you'll be thanked least by the people you helped most. That the Light doesn't make you good; it shows everyone whether you are." } },
      choices = {
        { text = "That's frightening.", next = "lessons_fear", fx = { trait = { cautious = 1 } } },
        { text = "I'm ready for that.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { brave = 1 } } },
        { text = "I'd rather not have the Light judge me so plainly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What has the Light shown you about yourself?", tag = "Persuade", next = "lessons_own",
          check = { pass = { any = { { all = { { class = "PRIEST" }, { disposition = { min = 60 } } } }, { disposition = { min = 72 } }, { trait = "pious" } } } },
          fail = { next = "lessons_mine", fx = { affinity = -1 } } },
      },
    },
    lessons_fear = {
      lines = { { id = "lf_default", text = "Good. A priest who isn't frightened by it hasn't understood it. Be frightened, and come back anyway. That's all courage is, in this house." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    duty = {
      lines = { { id = "d_default", text = "Teach, mostly. Bless the services when His Grace is at the Keep. Sit up with the city's sick when they come to the doors at night. They always come at night." } },
      choices = {
        { text = "Why at night?", next = "duty_night" },
        { text = "Something else.", next = "BACK" },
      },
    },
    duty_night = {
      lines = { { id = "dn_default", text = "Pride, by day, and fear by night. Fear is the more honest of the two, and it knocks louder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    josetta = {
      lines = { { id = "j_default", text = "Josetta could have stood where I stand, but she chose Goldshire. I've never decided whether she was wise or afraid, and perhaps she hasn't either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    novice = {
      lines = { { id = "n_default", text = "Then you were taught by people who'd sooner scrub a floor than preach about it, and you should keep that. The Cathedral has marble, and marble makes some priests forget floors." } },
      choices = {
        { text = "I won't forget.", next = "BACK", fx = { affinity = 3, align = { light = 1, order = 1 } } },
        { text = "Marble suits a priest better than a scrubbing brush, frankly.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    lessons_own = {
      big = true,
      lines = {
        { id = "lo_default", text = "Pride. I came to this Cathedral certain I'd be its finest preacher, and the first time I stood in the Light properly it showed me a woman who loved the sound of her own sermons." },
        { id = "lo_after", text = "So I stopped preaching and started teaching, which is preaching with the vanity sanded off. I still catch myself enjoying it too much, and when I do, I go and sit with the sick at the doors." },
      },
      choices = {
        { text = "That took honesty.", next = "BACK", fx = { affinity = 2 } },
        { text = "So that's why the quiet prayers matter to you.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lessons_mine = {
      lines = {
        { id = "lm_default", text = "That's between me and the Light, and you're not either of us. Ask me again when you've stood in it long enough to know why I won't answer." },
        { id = "lm_default2", text = "A fair question, and a forward one. I teach what the Light shows the student, not what it showed the teacher, so we'll keep to your lessons." },
      },
      choices = {
        { text = "Forgive me, High Priestess.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock = {
      big = true,
      lines = { { id = "warlock_l", text = "Sometimes, if the person wants it mended, and usually they come to my door at night when they've finally decided they do. You're asking in daylight, warlock, which is either a good sign or a very bad one." } },
      choices = {
        { text = "I'm asking for someone else.", next = "warlock2" },
        { text = "I don't want mending. I want to know my options.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "A good sign, I hope.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    warlock2 = {
      lines = { { id = "warlock2_l", text = "Of course you are; they always are. Bring them, or come yourself, and nobody under this roof will ask which it was." } },
      choices = { { text = "Something else, High Priestess.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "druid_l", text = "When they let us, which isn't often; your people heal each other with the moon and the root, and you look at our bandages as if they were quaint. I'd trade lessons, if any of you would sit still long enough." } },
      choices = {
        { text = "I'd trade lessons, High Priestess.", next = "BACK", fx = { affinity = 2 } },
        { text = "The forest heals better than any bandage.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    holy_light = {
      { id = "tp_holy_light", text = "The Light asks only that we tend it in ourselves and share it with others. That's simple to say and very hard to do, and I've watched many good priests fail at the second part." },
      { id = "tp_holy_light2", when = { class = "PRIEST" }, text = "You stand in the Light from the windows like a priest who's earned it, and I'll watch you a while longer to be sure. Don't take that badly, because I watch everyone, and most of them don't notice." },
    },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken were our neighbours once, and our priests, and some of them still call on the Light, I'm told. Whether it answers them is a question I've thought about for a long time and still can't settle." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took more of our clergy than any war ever did, and they raised some of them to fight against us. I pray for those souls, and I pray they've found their rest, because the alternative haunts me." } },
    elune = { { id = "tp_elune", text = "The night elf priestesses who come here speak of Elune with the same love we have for the Light. I've prayed beside them, and I've never once felt out of place." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "I trained some of the Brotherhood's priests at Northshire, and they're the steadiest I've seen. The abbey's a quiet place, and quiet makes for good priests." } },
    stratholme = { { id = "tp_stratholme", text = "I knew priests in Stratholme before the plague, good ones, kind ones. I don't know what happened to them, and I've decided to believe they died before the purge, because I can't think of the alternative." } },
    knows = {
      { id = "tp_knows", text = "I know the Cathedral and the people who come to its doors, and very little of what happens beyond them. Ask me about any of this, and keep your voice down." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer on these, briefly, and then I've a service to prepare." },
    },
    background = { { id = "tp_bg", text = "A priest who stayed when others went home. That's how most high priestesses happen. Stubbornness, mistaken for calling." } },
    advice = { { id = "tp_ad", text = "Heal first and ask questions after. The questions will still be there. The wounded may not be." } },
    northshire_abbey = { { id = "tp_abbey", text = "Where the Light learns your name. The Cathedral only learns what you've done with it." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They heal no one. I've never trusted a faith that only burns." } },
    _none = { { id = "tp_none", text = "I don't know. Ask the library, and if the library doesn't know, ask the Light. It's better at waiting for an answer than I am." } },
  },
}

-- Brother Joshua: priest trainer by the altar.
P:NPC {
  key = "joshua", id = TODO_NPC("Brother Joshua"), name = "Brother Joshua", title = "Priest Trainer",
  bible = "bibles/benedictus.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "gentle" }, values = { "pious", "patient" },
  spiritSensitive = true,
  notices = { "light", "form" },
  impression = {
    first = "Brother Joshua teaches beside the altar because people listen better near it, and I suspect he's right. He has watched the first light come through the east window for years and never tired of it.",
    third = "{name} met Brother Joshua, a quiet priest trainer who teaches beside the Cathedral's altar.",
  },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Kneel if you like. The altar doesn't mind company." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "The Light is patient with everyone, friend. Even me." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadowform, at the altar? The altar doesn't mind, but I'll pray for you twice, once for each road you're walking." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "In the first light through the east window, yes, as if the stone were holding its breath. Perhaps your spirits would call that something else." } },
      choices = {
        { text = "Call it holy, Brother. The name matters less than the reverence.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Stone is stone. Only the Light makes it holy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "People ask that, and I tell them the arcane is something you take hold of, and the Light is something that takes hold of you, if you let it. I've no quarrel with Dalaran, but I've watched mages pray here, and the first thing they have to learn is how to stop trying to grip." },
      },
      choices = {
        { text = "Then I'll try letting go, Brother.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'd rather keep my grip, Brother.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Warmer, I'd say, and louder, though the window can't help that. I've often wondered whether your goddess and my Light stand at the same window from two sides, and I'm content not to know." } },
      choices = {
        { text = "Light and moon share one sky. I'm glad to share your window.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The moon keeps her own counsel, Brother, and so do I.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not watching so much as waiting, I think, the way it waits for everyone who comes near it. You'd be surprised how many of Shaw's people kneel here at dawn, when they think nobody's looking." } },
      choices = {
        { text = "Then I'll kneel openly, because I've nothing to hide from the Light.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll keep my own counsel, Brother, and the Light can wait.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It hears everyone, and I've never once seen it turn its face away, though I've seen plenty of people turn theirs. What you bind doesn't decide that, friend, but what you do with it does." } },
      choices = {
        { text = "Then I'll bind them only to keep worse things away.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll do what I must with them, and the Light can watch.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "For the reason you fight, because it gets lost under all the noise of the fighting itself. I've known soldiers who swung for years before they could say why, and they were the ones who broke first." } },
      choices = {
        { text = "I fight for the people of this kingdom.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I fight because I'm good at it. That's reason enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Light teaches it through prayer, and the forest teaches it through hunger, and I suspect they're the same lesson. You wait, you watch, and you act only when the moment is right." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has it too, that stillness. Watch how it sits by the pews; it's a better student than half my novices." },
      },
      choices = {
        { text = "Waiting on the Light is still praying, Brother.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Patience is just how you catch dinner.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some do, and they're the quiet ones, who kneel a long while and say nothing aloud. The loud ones I worry about, because a paladin who never kneels starts to believe the Light belongs to him." } },
      choices = {
        { text = "The Light belongs to no one. I'm only its servant.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light chose me, Brother. I've earned the right to wield it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, at first light. Your order has sworn its oaths at altars like this one, so you'll know how the morning lies across the stone." },
        { id = "h_default", key = true, text = "Brother Joshua. I teach by the altar, because people pay attention near it. They don't always notice they're doing it." },
        { id = "h_dawn", when = { timeOfDay = "dawn" }, text = "First light through the east window. I've watched it every morning for years. It's never once been the same." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You came in without a sound, but the altar noticed anyway, because it always does and it isn't a thing you can sneak past." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You carry something cold with you, friend, and you needn't tell me what it is, because the Light is patient even with that." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior at the altar. Stand there a moment; people listen better near it, and so, I think, will you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You've a stillness about you that most of my students take months to learn, and you probably learned it in a single cold morning." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the altar. You keep the moon's hours, I think, and I keep the dawn's, so between us we've the whole night watched." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, by the altar. Come and stand in the window's light a moment, it's warmer than any fire you can conjure." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "People listen better near the altar, I've found. I wonder whether your spirits listen better near the earth." },
      },
      again = { { id = "h_again", text = "Something else?" } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why teach by the altar?", next = "altar" },
        { text = "I've seen you at prayer often, Brother.", next = "pray" },
        { text = "Is the altar watching me, Brother?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'm not sure what a warrior should listen for at an altar.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Stillness seems a hard thing for the Light to teach.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would the Light still hear me, Brother?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do paladins come here to pray before they ride out?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the first light here feel anything like moonlight, Brother?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is the Light like the arcane, Brother?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the altar feel different to you, Brother?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Brother.", next = "END" },
      },
    },
    altar = {
      lines = { { id = "a_default", text = "Because it reminds the students, and me, that none of this is ours. We only borrow it, and we're expected to give it back better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "p_default", text = "Badly, and often. Mostly I say thank you and then I listen. The listening is the part people skip." } },
      choices = {
        { text = "Listening is the part I skip, so I'll try harder.", next = "BACK", fx = { align = { light = 1 }, trait = { pious = 1 } } },
        { text = "I'd rather talk than listen, and the Light can wait its turn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    holy_light = { { id = "tp_holy_light", text = "I teach here beside the altar because I've watched the first light come through that window every morning for years. Every time, it reminds me the Light comes back whether we deserve it or not." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is a darkness that doesn't sleep, and I've seen priests come home from Lordaeron who'd forgotten how to pray. I sit with them, and sometimes they remember, and sometimes they don't." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood at Northshire are good people, and they taught me how to pray when I was a boy who'd rather be fishing. I still go back now and then, mostly for the bread." } },
    elune = { { id = "tp_elune", text = "The night elves pray to Elune by moonlight, and I've learned to love the quiet of their prayers. I've told them our Light comes with the morning, and they smiled, as if they knew something I didn't." } },
    background = { { id = "tp_bg", text = "A brother of the Cathedral, and nothing else I'd want to be." } },
    advice = { { id = "tp_ad", text = "When you heal someone, look at their face, not the wound. The wound is the easy part." } },
    _none = { { id = "tp_none", text = "I don't know. I'll pray on it, if you'd like." } },
  },
}

-- Brother Benjamin: priest trainer who paces the eastern hall.
P:NPC {
  key = "benjamin", id = TODO_NPC("Brother Benjamin"), name = "Brother Benjamin", title = "Priest Trainer",
  bible = "bibles/benedictus.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "restless" }, values = { "pious", "curious" },
  spiritSensitive = true,
  notices = { "light", "form" },
  impression = {
    first = "I have never seen a priest so unable to keep still as Brother Benjamin, who teaches while pacing the eastern hall. He asked more questions than he answered and seemed delighted by every one.",
    third = "{name} met Brother Benjamin, a restless priest trainer who thinks best while walking the Cathedral's halls.",
  },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Walk with me. I think better moving, and so will you." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "Don't turn your back on the Light, friend. It walks faster than you'd think." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Oh, now that's interesting. Does it feel cold, inside it? Joshua won't ask, but I will, so walk with me and tell me." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Whether they love you back, I suppose. The Light warms, but I've never heard it laugh, and I wonder whether your spirits do." } },
      choices = {
        { text = "They do, Brother, and so should we. Faith can be joyful.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Spirits are wild things. Better to keep your faith quiet.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Does it hurt, for a start, and does the demon talk back, and when it does, does it ever say anything true? Brother Joshua says I'm not to ask such things, because curiosity is how Morbent Fel and his like began, but I think a priest who won't ask questions is a priest who can't answer them either." },
      },
      choices = {
        { text = "It does hurt, Brother, and it rarely tells the truth.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It tells truths you'd rather not hear, Brother.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More than anything, though I suspect you'll tell me words won't do it justice, and you'll be right. I've only ever felt the Light come into me, and I'd like to know if it's at all the same as becoming something else." } },
      choices = {
        { text = "Some of it is taught only in Moonglade, by those who keep its rules.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "There are no rules to it, Brother. It's wild, and it's freeing.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only the novices who run in the nave, and I mostly fail. Brother Joshua says my sandals squeak like a mouse in a trap, so I've taken to doing my rounds in my stockings." } },
      choices = {
        { text = "Quiet steps should serve the Light, then, not hide from it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I walk quietly so that no one knows I was there.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Alike in the effort, perhaps, but a mage pulls and a priest opens, and I suspect the pulling is more tiring. Jennea would tell you I don't know what I'm talking about, and she'd be partly right." } },
      choices = {
        { text = "I'd sooner open than pull, Brother, if the Light allows it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Pulling gets results, Brother, and waiting rarely does.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than either would admit, I think, because both of us spend our days standing between people and harm. The difference is that you can see what you're fighting, and I've to take a great deal on faith." } },
      choices = {
        { text = "We're both servants. My arm and your prayers serve the same people.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I can see what I hit. That makes my work more honest.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not often enough, I'm afraid, though I walked to Northshire Abbey once on a dare and it took me two days because I stopped to talk to everyone. I saw a doe and her fawn by the river and thought of it for a month." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is doing better than I am at keeping pace. A good companion, that one, and very forgiving of the incense." },
      },
      choices = {
        { text = "Every creature is the Light's, and deserves a quiet death.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A hunter can't afford to be sentimental about the kill.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because if I knew, I might teach it better, and because nobody's ever explained it to my satisfaction. Brother Joshua says the Light can't be measured, and I say that's only because nobody's tried hard enough." } },
      choices = {
        { text = "Some mysteries are best left to the Church's teaching.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep asking, Brother. Questions are how we learn.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Tell me, do you feel the Light in your arms when you swing, or in your chest, or nowhere at all? I've asked six paladins and had seven answers." },
        { id = "h_default", key = true, text = "Brother Benjamin. I teach on my feet, up and down this hall. Brother Joshua says I'll wear a groove in the floor. He's probably right." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk more quietly than I do, and I've been pacing this hall for years. Walk with me, then, and see if you can keep in step without a sound." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Tell me while we walk, does it feel like anything when you cast, or is it only arithmetic, as Jennea says?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Walk with me; I think better on my feet, and I suspect you do too." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, walking my hall. Keep up, then, because I don't stand still, and I'm told you lot are used to following things that move." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Oh, I've a thousand questions, and I promise to ask only nine hundred of them, so tell me first whether the changing hurts." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock in the eastern hall! Fascinating, and slightly alarming, and I've so many questions I don't know where to begin." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Oh, I have questions. Do the spirits answer in words, or is it more of a feeling? Do they ever argue?" },
      },
      again = { { id = "h_again", text = "Keep walking. What else?" } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "You never seem to stop pacing.", next = "pace" },
        { text = "I'd wager some things are harder to teach than others.", next = "hardest" },
        { text = "Do you ever teach anyone to move quietly, Brother?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Magic and prayer seem much alike to me.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you think warriors and priests are much alike, Brother?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you ever get out of the city, Brother Benjamin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why do you care how a paladin feels the Light?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you like to know what it feels like to change shape, Brother?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What questions would you ask a warlock, Brother?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do you most want to know about the spirits, Brother?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Brother.", next = "END" },
      },
    },
    pace = {
      lines = { { id = "p_default", text = "Sitting still makes me think about myself. Walking makes me think about everyone else. One of those is the job." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hardest = {
      lines = { { id = "h2_default", text = "Rest. Young priests heal until they fall over and call it devotion. It's vanity. The Light doesn't need you exhausted." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    holy_light = { { id = "tp_holy_light", text = "The Light is the most curious thing in the world, don't you think? It warms and heals and burns all at once, and I've spent twenty years trying to understand it, and I've barely started." } },
    elune = { { id = "tp_elune", text = "The night elves say their goddess Elune is the moon herself, or lives in it, or watches from it, depending on which priestess you ask. I've asked several, and I love that none of them agree." } },
    earth_mother = { { id = "tp_earth_mother", text = "The tauren speak of an Earth Mother, and they pray to her in the open air, I'm told. I'd like to meet a tauren someday and ask them how she answers, because I've so many questions." } },
    the_elements = { { id = "tp_the_elements", text = "The orc shamans speak to the elements, they say, and the elements speak back. I'd give a year's study for a single conversation with a shaman, though I suspect I'd be told to stop asking questions." } },
    dalaran = { { id = "tp_dalaran", text = "The mages of Dalaran used to argue with the priests over whether the Light was a kind of magic. I'd love to hear that argument again, now that they're rebuilding, though I'd take notes." } },
    background = { { id = "tp_bg", text = "A brother of the Cathedral who can't sit still. That's all; the rest is pacing." } },
    advice = { { id = "tp_ad", text = "Sleep, eat, and then pray, in that order, whatever the abbots say." } },
    _none = { { id = "tp_none", text = "Couldn't say. Walk with me and we'll think about it." } },
  },
}

-- Brother Crowley: the Scarlet Crusade's emissary in the Cathedral's lower levels.
-- Unreliable: he believes in the Crusade; he never says what it has become.
P:NPC {
  key = "crowley", id = TODO_NPC("Brother Crowley"), name = "Brother Crowley", title = "Scarlet Crusade Emissary",
  bible = "bibles/benedictus.md", role = "priest", tier = "quest",
  communities = { "stormwind" }, temper = { "zealous", "sharp" }, values = { "devout", "proud" },
  notices = { "light", "race", "form" },
  impression = {
    first = "Brother Crowley speaks for the Scarlet Crusade with the fervor of someone who has seen the dead walk. He was certain of everything he said, and that certainty stayed with me afterward.",
    third = "{name} met Brother Crowley, the Scarlet Crusade's emissary in the Cathedral's lower halls, who recruits the brave for Lordaeron.",
  },

  greetings = {
    { id = "g_default", text = "You've found your way downstairs, good. The Crusade needs people who don't mind a few steps for the Light." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadow, on a priest, in the Cathedral of Light? In Lordaeron the Crusade would have some very hard questions for you. Here I'll only ask you to take it off." },
    { id = "n_paladin", cat = "light", when = { class = { "PALADIN", "PRIEST" } },
      text = "A servant of the Light. You'll have heard of the Crusade, then. Most of it lies, and the rest is the plague's own work." },
    { id = "n_elf", cat = "race", when = { race = { "NightElf", "Skyborne" } },
      text = "An elf, in Stormwind's catacombs. The Crusade asks only that you hate the dead as much as we do." },
  },

  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "What is that? Take it off, now, before anyone sees you wearing it in this house." },
  },

  start = "hello",
  nodes = {
    xcl_sm = {
      big = true,
      lines = { { id = "xcl_sm_default", text = "It's a fortress in a land of walking corpses, so of course it's grim, and the men who hold it have buried more friends than you've ever met. Whatever you saw there, you saw it in a single day, and they've lived it every day since the plague came to Tirisfal." } },
      choices = {
        { text = "Torturing prisoners is no way to fight anything, Brother.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "War against the dead needs hard men. I won't judge them.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Who leads the Crusade inside the Monastery?", next = "xcl_sm2" },
      },
    },
    xcl_sm2 = {
      lines = { { id = "xcl_sm2_default", text = "High Inquisitor Whitemane keeps the Cathedral, and Scarlet Commander Mograine stands beside her, the son of the Ashbringer himself. If you've raised a hand against either of them, I'd rather not hear it from you here." } },
      choices = {
        { text = "Then I won't tell you, Brother.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I count every heathen rite a door left unbarred, and I have seen what walks through such doors. Prove yourself, dwarf, if you can." } },
      choices = {
        { text = "Judge me by my deeds, Brother, not by orcish crimes.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Crusade's fear has made it cruel. Look to yourself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The Crusade burns your kind on the same pyre as the dead, and Grand Inquisitor Isillien would say I'm being generous telling you so. Lordaeron fell because men bargained with powers they couldn't hold, and you carry that same bargain in your satchel." },
      },
      choices = {
        { text = "Then the Crusade and I will keep our distance.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your Crusade would burn the whole north to save it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Healed? No, it must be burned, root and branch, and every grove that drinks the plague must burn with it. Your people talk of balance, but there is no balance with the dead, and the Crusade will not wait for the trees to agree." } },
      choices = {
        { text = "Then burn it. Sometimes a forest must fall to save the rest.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burned land never heals. The Crusade would kill what it means to save.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Scouting the plague villages, mostly, and finding which of the living have been turned by the Cult of the Damned before they turn anyone else. It's grim work, and it ends with a fire more often than I'd tell the Archbishop." } },
      choices = {
        { text = "Every accusation needs proof before anyone burns, Brother.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If they might be cultists, burning them is the safe choice.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Kel'Thuzad was one of theirs, and he walked out of the Violet Citadel with his books and turned Lordaeron into a graveyard. The Kirin Tor have spent years saying it wasn't their fault, and the dead have spent the same years walking." } },
      choices = {
        { text = "Dalaran should be held to account for what it bred.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "One traitor's crimes belong to him alone, not to Dalaran.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Everything, as the Light asks everything. In Lordaeron the dead outnumber the living, and a warrior who stands with the Crusade fights where it matters, not on some Stormwind parade ground." } },
      choices = {
        { text = "I'll fight the Scourge, but I'll keep my own judgement.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then point me at the dead. I'll ask no questions.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The plague takes beast and man alike, and what it takes it does not give back. Our scouts in Tirisfal burn every carcass they find, because the rot spreads through the wolves and the bats before it reaches the farms." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours looks clean of taint, which is well, because I would not let it near the Crusade's camps otherwise. Keep it so." },
      },
      choices = {
        { text = "Some of those beasts can still be saved, Brother.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Burn them all. The plague can't be risked.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "To stand in the plaguelands and speak the Light's name where the dead can hear it, and to judge the living who have let the plague into their hearts. Brother Anton will tell you the rest, if you've the courage to go to him." } },
      choices = {
        { text = "Judgement belongs to the divine, Brother, not to you or me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If judgement is needed, I'll carry it out myself.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_sm", tags = { "news" }, when = { cleared = "Scarlet Monastery" },
          text = "You've walked the Monastery to its far doors, I'm told, and the brothers who are left are telling a different story about you than you'll tell me. I'll pray for whichever of us has it wrong." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light! Good, for the Crusade needs priests more than soldiers, since the dead fear the Light and the living keep forgetting it." },
        { id = "h_default", key = true,
          text = "Brother Crowley, emissary of the Scarlet Crusade. The dead walk in Lordaeron, and the Crusade stands against them while Stormwind counts its coins. I send the brave to Brother Anton, in Desolace." },
        { id = "h_anton", tags = { "news" }, when = { questActive = TODO_QUEST("Brother Anton") },
          text = "Brother Anton is waiting at Nijel's Point. Tell him I sent you, and tell him the Cathedral still lets me in. He worries." },
        { id = "h_back", when = { questDone = TODO_QUEST("Brother Anton") },
          text = "Anton writes that you went into the Valley of Bones. Good. Come back to me when you're ready for Lordaeron itself." },
        { id = "h_monastery", tags = { "news" }, when = { questDone = TODO_QUEST("In the Name of the Light") },
          text = "You went to the Monastery and came back with the Crusade's blood on you. I know who sent you. Raleigh always did love a confession." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You move like one of Shaw's knives, and the Crusade has use for knives in Lordaeron, so long as they're pointed at the dead." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. Dalaran's mages have done precious little about the plague except study it, and I hope you mean to do more than that." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Good. The Crusade has use for strong arms, far more than this soft city does." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The plaguelands are full of beasts twisted by the Scourge, and the Crusade needs eyes that can tell a sick wolf from a healthy one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The Crusade has seen what the plague does to beasts and green things in the north, and I'd know whether your craft can burn it out or only soothe it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You reek of the Burning Legion's craft, and you dare to stand in this Cathedral? Speak quickly." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The orcs who butchered Lordaeron's villages spoke to spirits too, and the Crusade has a long memory for such things." },
      },
      again = { { id = "h_again", text = "What else? The dead don't wait for questions." } },
      choices = {
        { text = "What is the Scarlet Crusade?", next = "crusade" },
        { text = "I've heard they burn villages.", next = "burn" },
        { text = "Why recruit in the Cathedral?", next = "why" },
        { text = "Tyrosus of the Argent Dawn told me why he left.", next = "tyrosus", when = { heardLine = "tyrosus.l_default" } },
        { text = "Raleigh told me what the Monastery does.", next = "raleigh", when = { thread = { id = "scarlet_path", beat = "b3_raleigh" } } },
        { text = "I doubt the Crusade has much use for a rogue.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "You seem to hold something against Dalaran, Brother.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The Scarlet Crusade must ask a great deal of a warrior.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Are the beasts of Lordaeron truly sick, Brother?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you count every shaman an enemy, Brother Crowley?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've seen inside the Monastery, Brother. It isn't what you think.", next = "xcl_sm", when = { cleared = "Scarlet Monastery" } },
        { text = "I'll go to Brother Anton.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I've sworn the Silver Hand's oath, not yours.", next = "paladin_oath", when = { class = "PALADIN" } },
        { text = "What would the Crusade ask of a priest, Brother?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you believe plagued land can be healed, Brother?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would the Crusade have any use for a warlock, Brother?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'll fight the dead my own way, without your tabard.", next = "END", fx = { align = { order = -1 } } },
      },
    },
    crusade = {
      big = true,
      lines = { { id = "c_default", text = "What's left of the Silver Hand that still remembers what it swore. We hold the line in Lordaeron, where the plague began, and we purify what we must, because someone has to." },
        },
      choices = {
        { text = "Purify how?", next = "burn" },
        { text = "Someone does have to.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Purity at the point of a sword isn't the Light's way.", next = "BACK", fx = { align = { light = 1 } } },
      },
    },
    burn = {
      big = true,
      lines = { { id = "b_default", key = true, text = "Lies, spread by the cowards and the Forsaken. When a village is sick with the plague, you cleanse it, and everyone who's watched the dead rise knows what that means; only those who haven't stand back and judge." } },
      choices = {
        { text = "You're talking about burning people.", next = "burn_people", fx = { align = { light = 2 } } },
        { text = "I've seen the plague. I understand.", next = "BACK", fx = { affinity = 2, align = { light = -1, order = 1 } } },
      },
    },
    burn_people = {
      lines = { { id = "bp_default", text = "I'm talking about stopping it before it reaches Stormwind. If you'd rather pray over a village and leave it to rise, the Cathedral's upstairs, and it's very beautiful, and it's never seen a ghoul." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = -1 } } },
    },
    raleigh = {
      big = true,
      lines = { { id = "ra_default", text = "Raleigh couldn't stomach the work, so now he calls it a crime. Every army has its deserters with stories. Ours just pray louder." } },
      choices = {
        { text = "He said innocents were tortured.", next = "raleigh_innocent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raleigh_innocent = {
      lines = { { id = "ri_default", text = "Innocent. Nobody in Lordaeron is innocent of the plague until they're proven clean. If that offends you, the stairs are behind you." } },
      choices = {
        { text = "The Light doesn't work that way.", next = "BACK", fx = { affinity = -2, align = { light = 2 } } },
        { text = "In a plagued land, I'd suspect everyone too.", next = "BACK", fx = { align = { light = -2 } } },
        { text = "Something else.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because this is where the faithful come, and because the Archbishop is a good man who lets the doors stay open. I'm grateful, and I'm also using it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tyrosus = {
      lines = { { id = "t_default", text = "Tyrosus left because the work got hard. The Dawn asks politely and hopes, but the Crusade doesn't hope; it acts, and you can tell him that next time." } },
      choices = {
        { text = "He'd say you've lost your way.", next = "BACK", fx = { affinity = -2, align = { light = 1 } } },
        { text = "Acting beats hoping, and the Dawn could learn from you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_oath = {
      big = true,
      lines = { { id = "paladin_oath_l", text = "The Hand's oath! Half the Crusade swore it first, paladin, and then watched Uther's order sit on its hands while the plague walked into Andorhal. The Crusade is the Hand with its eyes open." } },
      choices = {
        { text = "The Hand kept its mercy. You threw yours away.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Perhaps the Hand was too gentle.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Who in the Crusade swore it?", next = "paladin_oath2" },
      },
    },
    paladin_oath2 = {
      lines = { { id = "paladin_oath2_l", text = "Mograine, the Highlord's son, and Abbendis's men, and many more. Go to the Monastery and ask them yourself, if Brother Anton thinks you're ready." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
  },

  topics = {
    scourge = { { id = "tp_scourge", text = "The Scourge is a plague on the living and a mockery of the dead, and the Scarlet Crusade will burn it from Lordaeron or die in the trying. Every soul that stands aside is one more for the Lich King's army." } },
    forsaken = {
      { id = "tp_forsaken", text = "The Forsaken are the Scourge with better manners, and nothing more. They walk, they speak, they claim to be free, and every one of them belongs in a pyre." },
      { id = "tp_forsaken2", when = { race = "Undead" }, text = "You dare walk in this Cathedral, corpse? The Crusade would put you to the torch on the steps, and I'd say the prayers myself." },
    },
    sylvanas = { { id = "tp_sylvanas", text = "Sylvanas Windrunner was a hero once, and the Scourge made her a monster, and now she calls herself a queen. The Crusade will see her crowned in fire, if the Light grants us strength." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme was the first to fall to the plague, and its people died screaming while the prince did what he thought was right. The Crusade holds the city now, part of it, and we'll take the rest." } },
    arthas = { { id = "tp_arthas", text = "Arthas Menethil killed his own father and led the dead against his own people, and I'll not speak his name in the Light's house again. He's gone north, they say, and I pray he never comes back." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron was the greatest of the human kingdoms, and it's a graveyard now, ruled by the dead. The Crusade will take it back, one town at a time, and we'll bury every corpse properly." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was a mage of Dalaran who sold his soul to the dead, and now he commands them from a floating citadel over the Plaguelands. The Crusade will drag him down from his tower, or die trying." } },
    holy_light = { { id = "tp_holy_light", text = "The Light is a fire, and fire burns away corruption, and that's all the Crusade asks of it. The soft-hearted priests here have forgotten that." } },
    knows = {
      { id = "tp_knows", text = "The Crusade keeps itself well informed, and so do I. Ask, and I'll answer honestly, which is more than the Church upstairs does about us." },
    },
    background = { { id = "tp_bg", text = "A priest who saw what the plague does and stopped pretending prayer alone would hold it back." } },
    advice = { { id = "tp_ad", text = "If someone you love is bitten, don't wait to be sure. Waiting is how Lordaeron fell." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "The last true servants of the Light in the north. Whatever you've heard, that's the heart of it." } },
    raleigh = { { id = "tp_raleigh", text = "A deserter in a Southshore inn, telling tales to anyone who'll buy him a drink.", next = "raleigh" } },
    scarlet_monastery = { { id = "tp_monastery", text = "Our stronghold in Tirisfal. If you're worthy, you'll see it. If you're not, you'll hear lies about it." } },
    argent_dawn = { { id = "tp_dawn", text = "Well-meaning. Soft. They'll make peace with the Forsaken and be eaten for it." } },
    _none = { { id = "tp_none", text = "Does it touch the plague? No? Then ask someone upstairs, because it isn't my concern." } },
  },
}
