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
  likesTone = "polite",
  spiritSensitive = true,
  prejudice = { class = "WARLOCK", amount = 12, why = "Faol's student; his mercy is wide, but he will not bless demon-binding." },
  notices = { "light", "affliction", "form" },
  impression = {
    first = "He makes a vast cathedral feel like a small chapel.",
    third = "{name} met Archbishop Benedictus, who tends the Church of the Holy Light and keeps its doors open to all.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "The Light's mercy is wide, child, but there is a darkness on you I will not bless. Say what you came to say." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I have sat with the families of those the Horde's warlocks killed, and I cannot pretend I don't remember them. Speak, and I will listen." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "I have prayed over you more than once, and still you come back. Perhaps the Light isn't finished with you after all." },
    { id = "g_peace", text = "Peace, child. The Cathedral is open to everyone. Even the tired." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "One of ours. Sit, if you've a moment, because you rarely will, later." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "Duthorian's latest, I suspect, and he speaks well of very few. Welcome." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, child, and I wondered now and then where the road had taken you. Come in and rest a while." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since last we spoke, child, and I can see the road has taken its toll on you. I hope it left you some kindness to bring home." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear harsh words passed between you and one of our neighbors. I won't ask what was said, child, but the Light is patient with those who mend things." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in the city has been speaking warmly of you, child, and it did an old man good to hear it." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Step out of the shadow while you're under this roof, child. Not because the Light minds, but because I'd like to see your face while we talk." },
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
        { text = "Then I'll trust the Light to carry what I can't.", next = "BACK", reply = "Then you'll last longer than most of the healers I've buried, child. Lean on it; it can bear the weight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll trust my own hands before any sermon, Archbishop.", next = "BACK", reply = "Your hands will tire, child, and on that day I hope you'll remember this conversation. The door is always open.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_strat = {
      big = true,
      lines = { { id = "xcl_strat_default", text = "I pray that's so. Rivendare was a lord of Lordaeron before he gave himself to the Scourge, and a man who chooses that has made a darker bargain than any poor soul the plague took unawares. Archbishop Faol taught that the Light is offered even to such men, though I confess I find it hard to say over this one." } },
      choices = {
        { text = "The Light is offered to all, Archbishop, even to him.", next = "BACK", reply = "It is, and that's the hardest truth of our faith. I pray for him, though I'll not pretend it's easy.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some men are past saving. Rivendare chose his side.", next = "BACK", reply = "He did, and the Light will judge him for it. I'll pray anyway, because that's my part.", fx = { align = { light = -1 } } },
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
        { text = "Mercy is enough. I'd gladly kneel beside your faithful, Your Grace.", next = "BACK", reply = "Then kneel, child, and the Light and Elune can share you for an hour. I don't think either will mind.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My faith is Elune's, Your Grace, and I won't blur it with yours.", next = "BACK", reply = "I understand, and I'd not ask you to. Laurena would tell me I was foolish to hope otherwise.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not fear, child, but we remember that the more magic men wielded, the more the darkness noticed them, and the Guardian of Tirisfal was set to watch for exactly that. Power that serves only the curious tends to forget the people standing near it." } },
      choices = {
        { text = "My power will serve the people standing near it, Your Grace.", next = "BACK", reply = "Then it will be well used, child. That's all the Church has ever asked of Dalaran.", fx = { align = { light = 1 } } },
        { text = "Curiosity built Dalaran, Your Grace, and I won't apologise for mine.", next = "BACK", reply = "Nor should you, but remember what else curiosity built. Dalaran knows that better than anyone.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only what it asks of anyone: that you remember the people behind you are the reason you carry the sword. Archbishop Faol used to say a soldier's mercy is harder won than a priest's, because the soldier has the means to refuse it." } },
      choices = {
        { text = "My sword is for protecting people, not for punishing them.", next = "BACK", reply = "Then you've understood Faol better than half my priests. Go with the Light.", fx = { align = { light = 1 } } },
        { text = "Mercy is a priest's business. Mine is winning.", next = "BACK", reply = "Winning without mercy has a way of losing what you won. I'll pray you learn it gently.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I believe it does, though the Church has been slow to say so. Our priests in Northshire bless the harvest every autumn, and I've never understood why we don't bless the woods that feed half of Elwynn." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I believe it does, though the Church has been slow to say so. Your {pet} has been very patient with the incense, I notice. Bring it to the steps whenever you like; the children would be glad of it." },
      },
      choices = {
        { text = "The wild has its own holiness, Archbishop.", next = "BACK", reply = "It does, and I'll say so in the next sermon, though I'll expect some letters about it.", fx = { align = { light = 1 } } },
        { text = "The forest is just meat and timber. The Light is for people.", next = "BACK", reply = "Then I'll pray for the forest too, child, since you won't. It's no trouble.", fx = { align = { light = -1 } } },
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
        { id = "h_default", text = "Benedictus. I tend the Church as Archbishop Faol tended it before me, and where he built it to hold people, I try to keep its doors open." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "There is a darkness on you that the Cathedral's light shows plainly, child. I will not turn you from these doors, but I will not bless what walks with you." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You have returned again, and the shadow with you. I still pray you'll set it down one day, and I am still watching for that day." },
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
          text = "Listen, that's the sunset bell. We ring it for the kaldorei in the city, who never grew used to walls, and I've come to need it myself." },
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
        { text = "Archbishop Faol must have taught you much.", next = "faol" },
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
        { text = "Is there anything the Light refuses to forgive, Your Grace?", next = "warlock", when = { class = "WARLOCK" } },
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
        { text = "That's a kind teaching.", next = "BACK", reply = "It's the one I've tried hardest to keep, though Light knows I've stumbled over it often enough. Thank you, child.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The Light favors the strong, whatever Faol taught.", next = "BACK", reply = "The strong say so, child, and the weak have always disagreed. I'll stand with Faol.", fx = { align = { light = -1 } } },
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
        { text = "That takes faith.", next = "BACK", reply = "Some days I have very little of it left, I'll confess. But I keep asking, and so far the Light keeps answering.", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "I'd have stopped asking and turned my back on it.", next = "BACK", reply = "Many have, child, and the Light didn't turn its back on them. It's still waiting.", fx = { align = { light = -2 } } },
        { text = "Maybe there's no answer.", next = "none", fx = { trait = { skeptical = 1 } } },
      },
    },
    none = {
      lines = { { id = "n_default", text = "Maybe there isn't, and the work is still worth doing. That was always the point." } },
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
        { text = "Few others said so at the time.", next = "BACK", fx = { affinity = 2, learn = { "defias" }, opinion = { defias = "masons_wronged" } } },
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
        { text = "That's something.", next = "BACK", reply = "It's a beginning, and a small one. I'll pray it's enough.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "It isn't enough.", next = "BACK", reply = "It isn't, and I know it. But it's what I can do without becoming what I fear.", fx = { align = { light = -1 }, affinity = -1, trait = { stern = 1 } } },
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
        { text = "That's harder than any spell.", next = "BACK", reply = "It is, child, and that's why most priests never learn it. You might.", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Healing people who never thank me isn't a habit I'll keep.", next = "BACK", reply = "Then you'll learn it the hard way, or not at all. I'll pray for the first.", fx = { align = { light = -1 } } },
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
        { text = "I'll keep to the Light.", next = "BACK", reply = "Good. That's the choice I made, and I've never regretted it.", fx = { affinity = 2, align = { light = 2 } } },
        { text = "Shadow is a tool. I'll use what works.", next = "BACK", reply = "Then use it carefully, child, and count every time you do.", fx = { affinity = -1, align = { light = -2 }, trait = { stern = 1 } } },
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
        { text = "I'll keep count.", next = "BACK", reply = "Thank you. That's all I ask.", fx = { affinity = 2, align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Some costs are worth paying.", next = "BACK", reply = "Some are, and only you can know which. I'll pray you choose well.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    lordaeron = {
      lines = { { id = "lo_default", text = "Then you've seen what I only heard about, and heard about every night for a year. You're welcome here, and you always will be; light a candle for someone, if you'd like, as many do." } },
      choices = {
        { text = "I will.", next = "BACK", reply = "Thank you, child. The Light remembers every one of them.", fx = { affinity = 3, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Candles won't bring them back, so I'll keep my grief to myself.", next = "BACK", reply = "Keep it, then, but don't keep it alone. My door is open.", fx = { align = { light = -1 } } },
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
        { text = "You've done more than anyone could ask, Your Grace.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Thank you for telling me.", next = "BACK" },
      },
    },
    masons_gentle = {
      lines = {
        { id = "mg_default", text = "The Church spoke for them, child, and it still does. That's all I'll say on it today, I think, because it's an old ache, and the altar is no place to wake it." },
        { id = "mg_default2", text = "We asked, as we ask for many things, and the asking goes on. Come and pray with me for them some evening; that's the better answer, and the only one I have just now." },
      },
      choices = {
        { text = "I understand, Your Grace.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_doubt = {
      big = true,
      lines = { { id = "paladin_doubt_l", text = "They all should, child, and the good ones do it before they swing the hammer rather than after. A paladin who never doubts is only a soldier who glows." } },
      choices = {
        { text = "Then I'll keep my doubts close.", next = "paladin_doubt2" },
        { text = "Doubt gets people killed. I'll leave it to priests.", next = "BACK", reply = "Then you'll be a soldier with a hammer, child, and nothing more. I'll pray for you.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Doubt keeps the hammer honest.", next = "BACK", reply = "It does, and you've understood it better than many. The Light go with you.", fx = { affinity = 1, align = { light = 1 } } },
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
        { text = "I've found warmer things than the Light's welcome, Your Grace.", next = "BACK", reply = "Perhaps not, child, but it's there all the same. It doesn't need you to need it.", fx = { align = { light = -1 } } },
        { text = "Then I'll come back, Your Grace.", next = "BACK", reply = "Do, child. The candles will be lit, and I'll be here.", fx = { affinity = 2, align = { light = 1 } } },
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
        { text = "It was necessary. I don't need absolution.", next = "BACK", reply = "Perhaps it was, and I'll not offer absolution unasked. But you came here, and that means something.", fx = { align = { light = -1, order = 1 } } },
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

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You're kind to say so, child, though I'm only an old student of Faol's in a finer robe than I deserve. I'll keep your words for one of the grey mornings." },
        { id = "s2", text = "That warms an old priest more than the Cathedral's braziers do. Give the credit to the Light, child, and I'll keep only the smile." },
      },
      fail = {
        { id = "f1", text = "Gently, child. Men have praised me in this nave before asking the Church to bless something it shouldn't, and I've learned to hear it coming." },
        { id = "f2", text = "Praise belongs to the Light and not to its servants, and I'd be a poor archbishop if I forgot that for a pleasant word. Let's speak plainly instead." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Faol used to tease me in just that tone when I grew too solemn over my books, and I haven't heard it since. You've done an old man good, child." },
        { id = "s2", text = "You've a sharp tongue, and I'll own that the robes invite it. I looked like a farmer long before I looked like an archbishop, and I laugh at the difference myself." },
      },
      fail = {
        { id = "f1", text = "There are wounded in the side chapels and orphans at the door, child, and you spend your wit on an old priest. I'll pray you find a better use for it." },
        { id = "f2", text = "I've been mocked by better and forgiven them all, so I forgive you as well. I'd ask you, though, to remember whose house you're standing in." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "There's a great deal of anger in you, child, and I felt it across the nave. Come, I'll not quarrel with you; tell me what you need, and we'll see whether the Church can give it." },
        { id = "s2", text = "You needn't raise your hand to be heard in this house. I'm an old man, and I'll give way on the small matter if it lets us speak of the larger one in peace." },
      },
      fail = {
        { id = "f1", text = "I buried the refugees of Lordaeron with these hands, child, and there's little left in the world that I fear for myself. Sit down and tell me what's truly troubling you." },
        { id = "f2", text = "No one is threatened beneath this roof, not the least beggar and not its archbishop. Lower your voice, or the paladins at the door will ask you to take it outside." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That is something I share with those I've come to know, child, and we've not walked far enough together yet. Come and sit with us a few more times." },
      { id = "gt2", text = "I'll keep my counsel on that for now. It's no unkindness, only that some things are for friends of the Cathedral, and I'd be glad to count you one in time." },
    },
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
    background = { { id = "tp_ba", text = "A student of Archbishop Faol who never stopped being one. The robes came later, and the look of a farmer never left.", next = "faol" } },
    advice = { { id = "tp_ad", text = "Pray when you're grateful, not only when you're frightened. The Light enjoys being thanked, I think. Most of us do." } },
    tome_of_divinity = { { id = "tp_tome", text = "The Tome of Divinity is Duthorian Rall's test for paladins. I've read the book, but I've never had the patience to teach from it, and he has." } },
    northshire_abbey = { { id = "tp_abbey", text = "Northshire Abbey is where many of us began, and its bells are older than this Cathedral." } },
    defias = { { id = "tp_defias", text = "I pray for the masons who became the Defias, and for the people they rob. Some days I run out of prayers before I run out of names." } },
    _none = { { id = "tp_none", text = "I don't know, child. I'd rather say that than pretend." } },
  },
}

-- Gazin Tenorm: a dwarf at the altar, frightened for his friend.
P:NPC {
  key = "gazin", id = TODO_NPC("Gazin Tenorm"), name = "Gazin Tenorm",
  bible = "bibles/gazin.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "brave", "lawful" },
  prejudice = { class = "WARLOCK", amount = 12, why = "Keeps watch at the altar for Henze's sake; sure demon-callers bring the dark into holy places." },
  notices = { "paladin" },
  impression = {
    first = "He would sooner be out searching for his friend than praying.",
    third = "{name} met Gazin Tenorm at the Cathedral, a dwarf sick with worry for his friend Henze Faulk.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I know that stink, an' it's no' incense. Get away from the altar before I drag ye from it by the collar." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "Henze nearly went into the dark for good, an' I'll no' have yer kind bringin' more o' it in here. Say what ye want an' be quick." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "Ye've kept yer filth out o' this hall every time ye came. Pray, if ye like, but I'm still watchin'." },
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
        { text = "I'll help you search, Gazin. A friend isn't left to prayers alone.", next = "BACK", reply = "Thank ye, friend. Henze would've liked ye, an' I'll be glad o' the company.", fx = { align = { honor = 1 } } },
        { text = "Wait a while longer. Rushing out blind helps no one.", next = "BACK", reply = "Aye, maybe ye're right, an' maybe it's only cowardice talkin'. I'll wait, but no' long.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I asked, {g:lad|lass}, an' they told me scrying costs money an' a lock o' the man's hair, an' I had neither. Henze went into the dark wi' the proof we gathered, an' I'll not rest till someone fetches him or tells me plain what's become of him." },
      },
      choices = {
        { text = "Then I'll go looking myself, Gazin, without coin.", next = "BACK", reply = "Ye'd do that? Then ye're a better friend tae Henze than the whole Quarter. Thank ye.", fx = { align = { honor = 1 } } },
        { text = "The Quarter's right. Nobody works for free.", next = "BACK", reply = "They're no' wrong, I suppose, but it's a cold way tae run a city. I'll keep prayin'.", fx = { align = { honor = -1 } } },
        { text = "Something else, Gazin.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "If they could talk, I'd buy every wolf in the forest a pint. Ye're the only one who's offered tae ask them, so I'll take it, though I'll keep prayin' all the same." } },
      choices = {
        { text = "I'll ask every creature in Elwynn until one of them answers.", next = "BACK", reply = "Thank ye, friend. If one o' them answers, I'll buy it that pint.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Henze chose his danger. The forest owes him nothing.", next = "BACK", reply = "Maybe no', but I owe him, an' I'll keep askin'. That's what friends do.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Near enough, though no' on any list ye'll find, which is how Shaw likes it. We were tae follow the coin from the Defias tae whoever's payin' them in the city, an' we got close enough tae be stabbed for it." } },
      choices = {
        { text = "Whoever's paying them should face the King's justice.", next = "BACK", reply = "Aye, an' I'll stand at the trial wi' my own beard trimmed for it.", fx = { align = { order = 1 } } },
        { text = "Find the payer and settle it quietly, without any courts.", next = "BACK", reply = "Quiet's how Shaw likes it, an' maybe ye're right. Just make sure it's the right man.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Ye'd raise him, would ye, wi' whatever ye keep in that satchel? No, friend, I'll no' have Henze come back wearin' somethin' else's shadow, an' I'd rather he stayed dead than that." } },
      choices = {
        { text = "You're right. Some help costs more than it gives.", next = "BACK", reply = "Aye, it does, an' I'm glad ye see it. Henze would agree wi' me.", fx = { align = { light = 1 } } },
        { text = "Dead is dead, dwarf, and I'd bring him back any way I could.", next = "BACK", reply = "No' Henze, ye won't, no' while I'm breathin'. Keep yer cellar magic away from him.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Cannae say, an' I've asked meself every night since. The Defias came quiet an' many, an' a good shield would've bought time, but time against that many is only a slower endin'." } },
      choices = {
        { text = "Then I'll be the shield the next one needs.", next = "BACK", reply = "That's the spirit, friend. Henze would've raised a glass tae ye.", fx = { align = { honor = 1 } } },
        { text = "Some fights can't be won. Better to know when to run.", next = "BACK", reply = "Aye, an' I ran, an' I've regretted it every night since. Some fights ye stay for.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, if they knew where tae start. The Defias move through Westfall like foxes through wheat, an' they leave sign if ye know how tae read it: cart ruts tae the old mines, an' red cloth snagged on fences." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Aye, if they knew where tae start. That {pet} could sniff out a Defias camp, I'd wager, if ye let it loose near the Westfall farms. Mind it doesnae find a trap first." },
      },
      choices = {
        { text = "I'll follow the trail and bring the evidence back for justice.", next = "BACK", reply = "Good. Bring it back tae the king's advisors, an' Henze's death won't be for nothin'.", fx = { align = { order = 1 } } },
        { text = "I'll follow it, and settle things myself when I get there.", next = "BACK", reply = "Then be careful, friend. Settlin' things yerself is how Henze ended up where he is.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Gazin Tenorm. Henze Faulk an' me were gatherin' proof on the Defias for the king's advisors, but they found us first. I got away, an' Henze didnae." },
        { id = "h_tome", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity") },
          text = "He's out by Heroes' Vigil, or what's left of him is. Rall says the Light can bring him back, if the hand holding it is steady." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Symbol of Life"), days = 3 } },
          text = "He's alive, grumblin' an' bruised, but alive! I owe ye more than I can pay, an' I'm a dwarf, so I'll try anyway." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf in the Cathedral! We're rarer here than ale, so I'm glad tae see a friendly beard." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Another o' the healers? Yer brothers here have patched me twice today, an' I'm mended, so save yer prayers for Henze." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye move like Henze did, quiet an' careful. Did Shaw send ye, or are ye one o' the Defias come tae finish the job?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Keep yer distance from the altar, would ye? I've no quarrel wi' ye, but the priests here go pale when yer kind walks in." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "A warlock at the altar, bold as brass. Ye'll keep yer distance, an' ye'll keep that wee beastie further off still." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "Ach, it's you again. Ye've never brought yer filth near the altar, I'll grant ye, so speak, but I've an eye on ye." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, aye. If Henze had had a warrior at his back that night, mebbe he'd be standin' here instead o' me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Ye'll know how tae follow a trail, then, which is more than the king's advisors seem able tae do with the one Henze an' I left 'em." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, eh? Ye've a nose for the wild, an' Henze is still out there somewhere wi' the Defias. If ye could track a man by the smell o' him, I'd be in yer debt." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, eh? Ye'll know a fair bit about readin' old scripts, I'd guess, an' Henze an' me had papers that needed readin'." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Ye talk tae the earth? Then ask it where my friend is, because the priests here only tell me tae wait, an' I'm sick o' waitin'." },
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
        { text = "There are older ways to bring Henze back, Gazin. Would you want them?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could the beasts of Elwynn tell us where Henze went, Gazin?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Have the priests given you any hope for your friend, Gazin?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll bring him back.", next = "END", reply = "Bring him back, then, an' I'll be waitin' right here wi' a pint for each o' ye. May the stone keep ye safe.", when = { class = "PALADIN" }, fx = { affinity = 1, align = { light = 1 } } },
        { text = "Henze is beyond saving, friend, so let him rest.", next = "END", reply = "Maybe he is, an' maybe ye're right. But I'll no' rest until I know, so walk careful out there, friend.", when = { class = "PALADIN" }, fx = { align = { light = -1 } } },
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
      lines = { { id = "he_default", text = "Henze Faulk, stubborn as a rockslide an' braver than he's got sense for. He held them off on that island so I could run, an' so I ran." } },
      choices = {
        { text = "You had no choice.", next = "henze_guilt", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "You left him?", next = "henze_guilt", fx = { trait = { stern = 1 } } },
      },
    },
    henze_guilt = {
      big = true,
      lines = { { id = "hg_default", text = "Aye, an' every night since I've asked myself which o' us was the brave one. I know the answer, an' I dinnae like it." } },
      choices = {
        { text = "Running took courage too.", next = "BACK", reply = "Maybe it did, but it doesnae feel like it. Thank ye for sayin' so.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Then make it right.", next = "BACK", reply = "Aye, that's what I mean tae do, an' ye've given me the push. Thank ye.", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
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
        { text = "Then I'll pray for Henze.", next = "BACK", reply = "Thank ye. He'd be glad o' it, wherever he is.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Henze is gone, Gazin, and my prayers are for the living.", next = "BACK", reply = "Fair enough. I'll keep prayin' for him meself, then.", fx = { align = { light = -1 } } },
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
      { id = "tp_knows", text = "I've been sitting by this altar long enough to hear half the Trade District's business, {g:lad|lass}. Ask me about any of it, and I'll tell you what I can between prayers." },
    },
    background = { { id = "tp_bg", text = "A dwarf who went lookin' for proof an' found more than he wanted. That's me lately. Ask me again when Henze is on his feet." } },
    advice = { { id = "tp_ad", text = "If a friend tells ye tae run, run, but then come back with help. Dinnae skip the second part." } },
    defias = { { id = "tp_defias", text = "The Defias are organized, well-armed an' meaner than they look, an' they look plenty mean." } },
    tome_of_divinity = { { id = "tp_tome", text = "The Tome's Rall's book. I'm no paladin, but I've seen what it does tae the ones who finish it." } },
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
    first = "Thirty children wait on her, and she still tells me to eat.",
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
        { text = "Then I'll show them a shaman can be a friend to Stormwind.", next = "BACK", reply = "That would be a fine thing, love, and a hard one. Go gently with them.", fx = { align = { light = 1 } } },
        { text = "They'll have to learn the world's not simple. Better now.", next = "BACK", reply = "They'll learn it soon enough, love. I'd rather they had a few more years of thinking it was.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Frighten? They'd climb all over that little creature of yours and ask it its name, and then they'd have nightmares for a week and I'd be the one up with them. These children have seen enough already, from the north and the farms and the war, so I'd thank you to keep your magic where they can't see it." },
      },
      choices = {
        { text = "I'll keep it hidden, Stephanie. They've seen enough.", next = "BACK", reply = "Thank you, love. They've seen far too much already.", fx = { align = { light = 1 } } },
        { text = "They'll see worse in this world. Better they learn now.", next = "BACK", reply = "They will, love, and I'll be up with them every night. Keep it hidden anyway.", fx = { align = { light = -1 } } },
        { text = "Something else, Stephanie.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They'd love it, and they'd dig it up again by morning to see if it had roots yet. There's nowhere to plant one here anyway, unless the Archbishop lends me a corner of the square, and I'd not dare ask him." } },
      choices = {
        { text = "Ask the Archbishop properly. A tree in his square needs his leave.", next = "BACK", reply = "That's the proper way, love, and he'll probably say yes. He's soft about trees.", fx = { align = { order = 1 } } },
        { text = "Don't ask. Plant it at night and let him find it.", next = "BACK", reply = "Ha! The children would love that, and the Archbishop would pretend not to notice.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Some do, love, when the bread runs short, and the Defias are always waiting at the canal's edge with a warm coat and a knife. I lose one or two a year to them, and I lie awake over every one." } },
      choices = {
        { text = "The men who recruit children should answer to the Watch.", next = "BACK", reply = "They should, love, and they never do. I'll keep the children away from the canal.", fx = { align = { order = 1 } } },
        { text = "A hungry child takes the coat that's offered. I don't blame them.", next = "BACK", reply = "Nor do I, love. I just wish I had more coats to give them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Would you, love? Something small and pretty, a bit of frost on the window or a little light, because they've seen enough fire for one lifetime, and the ones from Lordaeron don't laugh at flames." } },
      choices = {
        { text = "Only gentle things, then. I'll keep it soft for them.", next = "BACK", reply = "Thank you, love. A little frost would make their whole week.", fx = { align = { light = 1 } } },
        { text = "Fire's part of the world, so they may as well get used to it.", next = "BACK", reply = "They've had enough of it, love, more than you know. Gentle things, please.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Half of the boys do, and a few of the girls, and I can't blame them when every soldier they see is a hero in a story. I only wish they'd remember that their own fathers marched off the same way." } },
      choices = {
        { text = "I'll tell them the truth: it's hard, and it costs people.", next = "BACK", reply = "Thank you, love. They'll listen to you more than they listen to me.", fx = { align = { light = 1 } } },
        { text = "Let them dream. They'll learn soon enough.", next = "BACK", reply = "They will, love, and I'd rather they learned it from you than from a field.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every night, if you could spare it, though I'd settle for once a week. Half of them lost their families to the Defias or the plague, and the prayers I know are only the ones my mother taught me, which aren't nearly enough." } },
      choices = {
        { text = "Then I'll come when I can. No child should sleep without comfort.", next = "BACK", reply = "Thank you, love. They'll sleep better knowing you're coming.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers don't fill bellies, Stephanie. Food would help them more.", next = "BACK", reply = "They don't, love, and food's always welcome. But a child who's frightened at night needs both.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "All the boys do, and a good many girls too, though I'd sooner they wanted to be bakers. It's a fine thing to protect people, but I've seen too many go off to war and never come home." } },
      choices = {
        { text = "Someone must stand between them and the dark. Let them dream.", next = "BACK", reply = "Someone must, love, and I suppose it might as well be someone who was once an orphan.", fx = { align = { honor = 1 } } },
        { text = "You're right. Let them choose a safer trade while they can.", next = "BACK", reply = "I'd like that, love, though they never listen. They all want to be paladins.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! The little ones sleep better on the nights someone from the Cathedral comes to say prayers with them, so I hope you won't mind my asking." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Oh, don't let the boys see you, or they'll follow you to the gate and I'll spend the afternoon fetching them back." },
        { id = "h_default", text = "Stephanie Turner. My husband John and I help keep the orphanage: I make the children's clothes and keep them fed, and John's off begging for the rest. Neither of us sleeps much." },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "There's a smell of struck matches about you, love, and something small keeping close. Keep that creature near you, please, the little ones will want to pet it." },
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
        { text = "That's a hard thing.", next = "BACK", reply = "It is, love, and harder still on them, though they're braver about it than most grown folk. Visit them if you've a moment, because a friendly face does them more good than you'd think.", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Orphans are the price of war, and they'd better learn it early.", next = "BACK", reply = "They've learned it already, love. That's why they're here.", fx = { align = { light = -1 } } },
        { text = "Someone should do something.", next = "someone" },
      },
    },
    someone = {
      lines = { { id = "s_default", text = "Someone is, love, and it's me. You're welcome to join in." } },
      choices = { { text = "Ha. Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    john = {
      lines = { { id = "j_default", text = "He's in Ironforge, asking the dwarves for help. He writes that the beer is strong and the purses are slow to open, but then they open all the way." } },
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
        { text = "Bread, if I'm choosing.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
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
    scourge = { { id = "tp_scourge", text = "Most of the new children come from Lordaeron, and some of them won't sleep without a candle. I don't ask what they've seen, because I can see it in their faces when the lights go out." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I took the children to the Darkmoon Faire when it came to Goldshire, all thirty of them, and only lost one for an hour. He was found asleep in the fortune-teller's tent, and he said she'd promised him a dog." } },
    deadmines = { { id = "tp_deadmines", text = "Some of my older boys talk about running off to join the Defias in their mines under Moonbrook. I tell them the Defias have no orphanage, and they go quiet, and I pray it's enough." } },
    knows = {
      { id = "tp_knows", text = "I hear all sorts on the way to the market and back, love, mostly from people who think a woman with a basket isn't listening. Ask me about any of this, quickly, before the children miss me." },
    },
    background = { { id = "tp_bg", text = "John's wife, and everything else the orphans need. There isn't time for more of a story than that, love. There's a hem waiting." } },
    advice = { { id = "tp_ad", text = "Mend a thing before it tears all the way, whether it's clothes, roofs or people. It's always cheaper early." } },
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian Rall's young paladins come to me with linen for their test, and I put them to work, and they go away a little kinder." } },
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
    first = "He pleads his kitten's case like a seasoned merchant.",
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
        { text = "Ask your father straight out, Timmy, and keep asking.", next = "BACK", reply = "I will! I'll ask him every morning until he says yes.", fx = { align = { honor = 1 } } },
        { text = "Hide the kitten in the cellar. He'll never know.", next = "BACK", reply = "In the cellar? Mum would find her, and then I'd be in trouble too. But it's a good idea.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I don't think so, she's hiding in my coat now, and she only does that when the guards' dogs go past. Dad says demons are bad and people who keep them are worse, but you don't look worse, you look tired, and maybe that's different." },
      },
      choices = {
        { text = "Your dad means well, Timmy. Keep her away from it.", next = "BACK", reply = "All right. I'll keep her in my coat when things like that go by.", fx = { align = { light = 1 } } },
        { text = "Your dad doesn't know everything, Timmy. Grown-ups rarely do.", next = "BACK", reply = "He doesn't! He doesn't know about cats at all. You're right.", fx = { align = { light = -1 } } },
        { text = "Something else, Timmy.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "She'd love it, but she'd want to be the boss, because she's the boss of the whole bakery and the mice know it. Can you be a little cat, though, and not a big one, because a big one might eat her?" } },
      choices = {
        { text = "Every house needs a boss, Timmy, and she can be it.", next = "BACK", reply = "She can be the boss of the bakery, and I'll be the boss of her. That's fair.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cats don't have bosses, Timmy. Every cat is free.", next = "BACK", reply = "Then she's free to come home with me! I'll tell Dad you said so.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Very sneaky, which is good, because my mum says sneaky people and cats get along. If you took her home, she could teach you to catch mice, and you could teach her to open doors." } },
      choices = {
        { text = "She'd be safest with someone honest, Timmy, not someone sneaky.", next = "BACK", reply = "Oh. Then she should stay with me, because I'm honest. Mostly.", fx = { align = { honor = 1 } } },
        { text = "A sneak and a kitten sounds like the perfect team.", next = "BACK", reply = "That's what I said! Mum says it's a terrible idea.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only a little bit, just so he'd say yes about the kitten, and then you could unmagic him after. Mum says that's not fair, but Mum didn't say it was impossible." } },
      choices = {
        { text = "That wouldn't be fair, Timmy, so ask him plainly instead.", next = "BACK", reply = "All right, I'll ask him honestly. It won't work, though.", fx = { align = { honor = 1 } } },
        { text = "A little spell never hurt anyone, Timmy.", next = "BACK", reply = "See? That's what I told Mum! Can you do it now?", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Yes, please, because the guards keep telling me to move and the cats in the alley keep hissing at her! If you guarded her nobody would hiss, I bet, not even the big orange one." } },
      choices = {
        { text = "Every little one deserves someone to stand up for them, Timmy.", next = "BACK", reply = "That's what I think too! You can guard her and I'll guard you.", fx = { align = { light = 1 } } },
        { text = "A warrior has bigger things to guard than kittens, Timmy.", next = "BACK", reply = "Oh. Bigger things like dragons? I suppose that's fair.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Yes! Pray she finds a good home, and pray my dad changes his mind, because that would be the same home and then everybody's happy." } },
      choices = {
        { text = "I'll pray she finds a loving home, Timmy, wherever it is.", next = "BACK", reply = "Thank you! I hope it's my home, though, really.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't change your father's mind. You'll have to ask nicely.", next = "BACK", reply = "I've asked nicely a hundred times. I'll try a hundred and one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Would you really? She'd be Sir Whiskers, then, and my dad couldn't say no to a knight, could he, because that would be against the law." } },
      choices = {
        { text = "Knighthood is a solemn oath, Timmy, even for kittens.", next = "BACK", reply = "Then I'll make her take it seriously. She'll be the best knight.", fx = { align = { order = 1 } } },
        { text = "Kneel, Sir Whiskers, and never mind the rules.", next = "BACK", reply = "Arise, Sir Whiskers! Dad can't say no now, it's the law!", fx = { affinity = 1, align = { order = -1 } } },
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
        { text = "Would your kitten like to meet the thing in my shadow, Timmy?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
    first = "She trusts slowly, and I think she's usually right to.",
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
        { text = "Then I'll stand my ground beside them, whatever comes.", next = "BACK", reply = "Good. The paladin will be grateful, and you'll learn more than any lesson I could give.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll let them stand. A fallen healer helps nobody.", next = "BACK", reply = "Sometimes that's true, and sometimes it's an excuse. Learn which is which before it matters.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_whitemane = {
      big = true,
      lines = { { id = "xcl_whitemane_default", text = "Then the Light answered her even at the end, or she believed it did, and I can't say which troubles me more. A priest's power isn't proof of a priest's righteousness, and that's the hardest thing I teach, because most students want the one to mean the other." } },
      choices = {
        { text = "Faith needs humility, Priestess, or it ends on Whitemane's road.", next = "BACK", reply = "It does, and I pray every morning that I remember it. Her road began with the same prayers as mine.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith needs steel. Whitemane only forgot where to point it.", next = "BACK", reply = "That's what the Crusade tells itself, and it frightens me how easily it sounds right.", fx = { align = { light = -1 } } },
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
        { text = "The Light and the spirits both shelter the living. I believe that.", next = "BACK", reply = "I'm not so sure, but I'll grant you've seen more of it than I have. Prove it to me in time.", fx = { align = { light = 1 } } },
        { text = "The Light alone is enough. I'll not pretend otherwise here.", next = "BACK", reply = "Good. Then you'll find the Cathedral a comfortable home.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The Light sees the dark as clearly as the day, though I'll grant it is more patient than the city guard. I've healed more of the king's quiet servants than you'd believe, and they all asked me that question, usually while I was stitching them up." },
      },
      choices = {
        { text = "Then I'll try to give it less to be patient with.", next = "BACK", reply = "That would be a kindness to both of you, and to my healers. Thank you.", fx = { align = { light = 1 } } },
        { text = "Patience suits me. I'll keep working in the dark.", next = "BACK", reply = "Then I'll keep healing you when you come in at night, and I'll not ask why.", fx = { align = { light = -1 } } },
        { text = "Something else, High Priestess.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The Light answers whoever turns to it, though mages are so used to commanding that they rarely think to ask. That's the lesson your kind find hardest, and it isn't in any of your books either." } },
      choices = {
        { text = "I can learn to ask, High Priestess, rather than command.", next = "BACK", reply = "That's harder than it sounds, and you've taken the first step by saying it. Kneel when you're ready.", fx = { align = { light = 1 } } },
        { text = "I'd rather command a power than wait for one to answer.", next = "BACK", reply = "Then the Light will be patient with you, and so will I, though I'll pray you learn.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "By staying behind you and staying alive, mostly, which is harder than it sounds when you charge off without looking. The best pairs I've trained learn each other's habits, because a shield and a prayer work best when they trust each other." } },
      choices = {
        { text = "I'll keep the line, and trust my healer to keep me.", next = "BACK", reply = "That's how the best pairs I've trained work. You'll come home more often.", fx = { align = { order = 1 } } },
        { text = "I'll charge when I see fit. Healers can keep up.", next = "BACK", reply = "They can't always, and the day they don't, you'll remember this. Look back once in a while.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Often, and gladly, for a hunter and a priest can both stand back and see the whole of a fight. I've sent many young priests out to Redridge with hunter companions, and most came back telling me it was the hunter who kept them alive." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} will be the one taking the blows, I suppose. I've mended a few beasts in my time, and they're far better patients than soldiers." },
      },
      choices = {
        { text = "My pet takes the blows so others don't. I honour that.", next = "BACK", reply = "Then you understand more about sacrifice than many of my priests.", fx = { align = { light = 1 } } },
        { text = "That's what a pet is for. Better it than me.", next = "BACK", reply = "Better it than you, perhaps, but it's still a life. I'd ask you to remember that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "My students learn to listen to the Light, and yours learn to carry it into places it isn't welcome. Both are needed, but I've seen paladins forget to listen, and priests forget that someone has to go out and fight." } },
      choices = {
        { text = "The oath and the Church should guide me together.", next = "BACK", reply = "Then you've found the balance most priests spend their whole lives looking for. Hold to it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll follow the Light as I feel it, not the Church's rules.", next = "BACK", reply = "That's how Whitemane began, child. I'd be careful with that thought.", fx = { align = { order = -1 } } },
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
        { text = "A high priestess must have little time to herself.", next = "duty" },
        { text = "Josetta speaks well of you.", next = "josetta", when = { heardLine = "josetta.h_prayer" } },
        { text = "The Abbey raised me. I'm one of theirs.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "I doubt the Light can mend what I've let in.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Do the Cathedral's healers ever tend druids?", next = "druid", when = { class = "DRUID" } },
        { text = "I doubt the Light answers a mage, High Priestess.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How does a priest best help a warrior, High Priestess?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do priests often travel with hunters?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "How do a priest's prayers and a paladin's oath differ?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Light care what I do in the dark, High Priestess?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think the spirits and the Light can stand together?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I saw Whitemane fall. She raised the dead to fight beside her.", next = "xcl_whitemane", when = { cleared = "Scarlet Cathedral" } },
        { text = "What should a priest and a paladin learn from each other?", next = "xpt_laurena", when = { party = { class = "PALADIN" }, class = "PRIEST" } },
        { text = "The Cathedral healed my hands, High Priestess, and I stayed to learn.", next = "xorig_cathpupil", when = { origin = "gnome_cathedral_pupil" } },
        { text = "Thank you, High Priestess.", next = "END" },
      },
    },
    xorig_cathpupil = {
      lines = {
        { id = "xocathpupil_default", text = "I remember those hands, and I remember the first thing you asked when they'd healed, which was whether the brothers had any plans you could see. There are no plans, little one, but you've learned it well enough without them. Have you made your peace with that?" },
      },
      choices = {
        { text = "Mostly. I still keep notes.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "No. Someday somebody will draw it properly.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lessons = {
      big = true,
      lines = { { id = "l_default", text = "You learn that you can't save everyone, and that you'll be thanked least by the people you helped most. Above all, the Light doesn't make you good; it shows everyone whether you are." } },
      choices = {
        { text = "That's frightening.", next = "lessons_fear", fx = { trait = { cautious = 1 } } },
        { text = "I'm ready for that.", next = "BACK", reply = "Then you're readier than most. Come and kneel with me tomorrow.", fx = { affinity = 2, align = { light = 2 }, trait = { brave = 1 } } },
        { text = "I'd rather not have the Light judge me so plainly.", next = "BACK", reply = "Nobody would, child, but it does it anyway. Better to know than to wonder.", fx = { align = { light = -1 } } },
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
      lines = { { id = "d_default", text = "I teach, mostly, and bless the services when His Grace is at the Keep, and sit up with the city's sick when they come to the doors at night. They always come at night." } },
      choices = {
        { text = "Why at night?", next = "duty_night" },
        { text = "Something else.", next = "BACK" },
      },
    },
    duty_night = {
      lines = { { id = "dn_default", text = "Because pride keeps them home by day, and fear brings them by night. Fear is the more honest of the two, and it knocks louder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    josetta = {
      lines = { { id = "j_default", text = "Josetta could have stood where I stand, but she chose Goldshire. I've never decided whether she was wise or afraid, and perhaps she hasn't either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    novice = {
      lines = { { id = "n_default", text = "Then you were taught by people who'd sooner scrub a floor than preach about it, and you should keep that. The Cathedral has marble, and marble makes some priests forget floors." } },
      choices = {
        { text = "I won't forget.", next = "BACK", reply = "Good. Scrub the floor here as well, and you'll be a better priest than half my novices.", fx = { affinity = 3, align = { light = 1, order = 1 } } },
        { text = "Marble suits a priest better than a scrubbing brush, frankly.", next = "BACK", reply = "Then you'll be comfortable here, and you'll lose something on the way. Keep the brush close.", fx = { align = { light = -1 } } },
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
      lines = { { id = "warlock_l", text = "Sometimes, if the person wants it mended, and usually they come to my door at night when they've finally decided they do. You're asking in daylight, child, which is either a good sign or a very bad one." } },
      choices = {
        { text = "I'm asking for someone else.", next = "warlock2" },
        { text = "I don't want mending. I want to know my options.", next = "BACK", reply = "Then you'll have them, and the Light will be one of them. Come back when you want it.", fx = { align = { light = -1 } } },
        { text = "A good sign, I hope.", next = "BACK", reply = "It is, and the best one I've seen in a long while. Come back at night, if you'd rather.", fx = { affinity = 1, align = { light = 1 } } },
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
    background = { { id = "tp_bg", text = "A priest who stayed when others went home. That's how most high priestesses happen: stubbornness, mistaken for a calling." } },
    advice = { { id = "tp_ad", text = "Heal first and ask questions after. The questions will still be there. The wounded may not be." } },
    northshire_abbey = { { id = "tp_abbey", text = "Northshire Abbey is where the Light learns your name; the Cathedral only learns what you've done with it." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "The Scarlet Crusade heals no one, and I've never trusted a faith that only burns." } },
    _none = { { id = "tp_none", text = "I don't know. Ask the library, and if the library doesn't know, ask the Light. It's better at waiting for an answer than I am." } },
  },
}

-- Brother Joshua: priest trainer by the altar.
P:NPC {
  key = "joshua", id = TODO_NPC("Brother Joshua"), name = "Brother Joshua", title = "Priest Trainer",
  bible = "bibles/benedictus.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "gentle" }, values = { "pious", "patient" },
  spiritSensitive = true,
  notices = { "light", "form", "race" },
  impression = {
    first = "He has never tired of first light through the east window.",
    third = "{name} met Brother Joshua, a quiet priest trainer who teaches beside the Cathedral's altar.",
  },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Kneel if you like. The altar doesn't mind company." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "The Light is patient with everyone, friend. Even me." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadowform, at the altar? The altar doesn't mind, but I'll pray for you twice, once for each road you're walking." },
    { id = "n_dwarf_priest", cat = "light", when = { race = "Dwarf", class = "PRIEST" },
      text = "A dwarven priest. Your people came to the Light through our missionaries, and I've often thought you've kept it more plainly than we have, which I mean as praise." },
  },

  start = "hello",
  nodes = {
    dd_joshua_d = {
      lines = {
        { id = "dd_joshua_d_a", text = "Then admit it here, where it's safe to. Each time the spirit returns, it brings something back from the other side, and some find they grow braver for it while others grow careless. Which are you becoming?" },
      },
      choices = {
        { text = "Braver. Each death teaches me what's worth fighting for.", next = "dd_joshua_d2", fx = { align = { light = 1 } } },
        { text = "Careless, maybe. Death doesn't frighten me any more.", next = "dd_joshua_d2", fx = { align = { light = -1 } } },
      },
    },
    dd_joshua_d2 = {
      lines = {
        { id = "dd_joshua_d2a", text = "Then I'll pray for you either way, because both kinds need it. Come and sit in the Cathedral some evening when you're not bleeding, and let the quiet do what the healers can't." },
      },
      choices = { { text = "I'll try, Brother. Something else.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "In the first light through the east window, yes, as if the stone were holding its breath. Perhaps your spirits would call that something else." } },
      choices = {
        { text = "Call it holy, Brother. The name matters less than the reverence.", next = "BACK", reply = "That's a generous way to put it, and I'll pray on it. Thank you.", fx = { align = { light = 1 } } },
        { text = "Stone is stone. Only the Light makes it holy.", next = "BACK", reply = "Perhaps, but the stone holds the Light very well. I'll keep watching the window.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "People ask that, and I tell them the arcane is something you take hold of, and the Light is something that takes hold of you, if you let it. I've no quarrel with Dalaran, but I've watched mages pray here, and the first thing they have to learn is how to stop trying to grip." },
      },
      choices = {
        { text = "Then I'll try letting go, Brother.", next = "BACK", reply = "That's all it asks. Kneel when you're ready, and see what happens.", fx = { align = { light = 1 } } },
        { text = "I'd rather keep my grip, Brother.", next = "BACK", reply = "Then keep your grip, and I'll keep praying for you. There's room for both.", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Warmer, I'd say, and louder, though the window can't help that. I've often wondered whether your goddess and my Light stand at the same window from two sides, and I'm content not to know." } },
      choices = {
        { text = "Light and moon share one sky. I'm glad to share your window.", next = "BACK", reply = "So am I. It's a lovely window, and big enough for two faiths.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The moon keeps her own counsel, Brother, and so do I.", next = "BACK", reply = "Then she and I share that too, I think. Come back any morning.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not watching so much as waiting, I think, the way it waits for everyone who comes near it. You'd be surprised how many of Shaw's people kneel here at dawn, when they think nobody's looking." } },
      choices = {
        { text = "Then I'll kneel openly, because I've nothing to hide from the Light.", next = "BACK", reply = "Good. That's how the Light likes it, though it'll wait for the others.", fx = { align = { light = 1 } } },
        { text = "I'll keep my own counsel, Brother, and the Light can wait.", next = "BACK", reply = "It will, and very patiently. It's waited for Shaw's people for years.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It hears everyone, and I've never once seen it turn its face away, though I've seen plenty of people turn theirs. What you bind doesn't decide that, friend, but what you do with it does." } },
      choices = {
        { text = "Then what I hold will only ever hold back worse things.", next = "BACK", reply = "That's a good reason, if it stays the reason. I'll pray it does.", fx = { align = { light = 1 } } },
        { text = "I'll use what I hold as I see fit. Let the Light watch.", next = "BACK", reply = "Then it will watch, and so will I, with hope.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "For the reason you fight, because it gets lost under all the noise of the fighting itself. I've known soldiers who swung for years before they could say why, and they were the ones who broke first." } },
      choices = {
        { text = "I fight for the people of this kingdom.", next = "BACK", reply = "That's a fine reason, and I'll pray you remember it in the noise.", fx = { align = { light = 1 } } },
        { text = "I fight because I'm good at it. That's reason enough.", next = "BACK", reply = "It's a reason, but it won't sustain you forever. Find another while you can.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Light teaches it through prayer, and the forest teaches it through hunger, and I suspect they're the same lesson. You wait, you watch, and you act only when the moment is right." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The Light teaches it through prayer, and the forest teaches it through hunger, and I suspect they're the same lesson. Your {pet} has it too, that stillness. Watch how it sits by the pews; it's a better student than half my novices." },
      },
      choices = {
        { text = "Waiting on the Light is still praying, Brother.", next = "BACK", reply = "You've understood it better than half the novices in my charge, and they've had a year of sermons. Thank you.", fx = { align = { light = 1 } } },
        { text = "Patience is just how you catch dinner.", next = "BACK", reply = "And prayer is how you catch something else entirely. I'll keep both.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some do, and they're the quiet ones, who kneel a long while and say nothing aloud. The loud ones I worry about, because a paladin who never kneels starts to believe the Light belongs to him." } },
      choices = {
        { text = "The Light belongs to no one. I'm only its servant.", next = "BACK", reply = "Then you'll kneel well, and long. That's what I'd hope for.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light chose me, Brother. I've earned the right to wield it.", next = "BACK", reply = "That's what the loud ones say, and I worry for them. Kneel a little, anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "dd_deaths_joshua", when = { deaths = { min = 20 } },
          text = "You carry the weight of many returns, friend, and I can see it even if you can't. The Light has brought you back more than twenty times, I'd guess, and I wonder whether you've stopped to ask it why." },

        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, at first light. Your order has sworn its oaths at altars like this one, so you'll know how the morning lies across the stone." },
        { id = "h_default", key = true, text = "Brother Joshua. I teach by the altar, because people pay attention near it. They don't always notice they're doing it." },
        { id = "h_dawn", when = { timeOfDay = "dawn" }, text = "Look, the first light through the east window. I've watched it every morning for years, and it's never once been the same." },
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
      again = {
        { id = "h_again", text = "Something else, friend? The Light's in no hurry, and nor am I." },
        { id = "h_again2", text = "Ask what you like. The altar and I have all morning." },
        { id = "h_again3", text = "Go on, friend. I'll listen, which you'll remember is the part I said people skip." },
      },
      choices = {
        { text = "I've died more times than I like to admit, Brother.", next = "dd_joshua_d", when = { deaths = { min = 20 } } },

        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why teach by the altar?", next = "altar" },
        { text = "I've seen you at prayer often, Brother.", next = "pray" },
        { text = "What do you teach the novices first?", next = "teach" },
        { text = "Where did you learn to pray yourself?", next = "northshire" },
        { text = "Who else teaches here in the Cathedral?", next = "cathedral_folk" },
        { text = "There's a Scarlet Crusader recruiting downstairs.", next = "crusade" },
        { text = "You look like you've been up since well before dawn.", next = "dawn" },
        { text = "What should a priest know that the spells don't teach?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Elune's light and yours. Are they so different?", next = "xnelf", when = { race = "NightElf" } },
        { text = "I was a novice at Northshire, Brother.", next = "xabbey", when = { origin = "human_abbey_novice" } },
        { text = "I prayed in Lordaeron, before it fell.", next = "xrefugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "I learned my lessons here, among the Cathedral's pupils.", next = "xgnome", when = { origin = "gnome_cathedral_pupil" } },
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
      choices = {
        { text = "Give it back better? How?", next = "altar_window" },
        { text = "Something else.", next = "BACK" },
      },
    },
    altar_window = {
      big = true,
      lines = { { id = "aw_default", text = "By healing someone who goes on to heal someone else, mostly, the way the dawn comes through the east window and lights the whole nave, not just the altar. A priest who keeps the Light for himself is a window with the shutters closed." } },
      choices = {
        { text = "The Light is meant for everyone, or it's meant for no one.", next = "BACK", reply = "I believe that too, and I try to teach it to the novices, with mixed success. Thank you.", fx = { align = { light = 1 } } },
        { text = "Some don't deserve healing. A priest must choose.", next = "BACK", reply = "Some priests do, and some of them end up in the Crusade. I'd rather heal everyone I can.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = { { id = "p_default", text = "Badly, and often. Mostly I say thank you and then I listen. The listening is the part people skip." } },
      choices = {
        { text = "Listening is the part I skip, so I'll try harder.", next = "BACK", reply = "That's honest, and it's a good start. The Light is a patient listener too.", fx = { align = { light = 1 }, trait = { pious = 1 } } },
        { text = "I'd rather talk than listen, and the Light can wait its turn.", next = "BACK", reply = "Oh, it'll wait; it has waited on louder folk than you. But you might be surprised what you hear when you stop for breath.", fx = { align = { light = -1 } } },
        { text = "What do you hear, when you listen?", next = "pray_listen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray_listen = {
      lines = { { id = "pl_default", text = "Nothing, most mornings, and I've come to think the nothing is part of the answer. Now and then there's a warmth, or a name comes to me, someone I ought to visit, and I've learned to go when it does." } },
      choices = {
        { text = "A name? Whose, the last time?", next = "pray_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray_name = {
      lines = { { id = "pn_default", text = "A widow in the Canals I hadn't seen in a year, and when I knocked she'd been sitting in the dark since morning, with nobody to tell. I don't claim it was the Light that sent me, but I don't claim it wasn't, either." } },
      choices = {
        { text = "It was the Light, Brother. I'm sure of it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Or simply a good man's memory.", next = "BACK" },
      },
    },

    -- Teaching
    teach = {
      lines = { { id = "t_default", text = "To look at the person and not the wound, before I teach them a single word of healing. The wound is the easy part; it's the frightened face above it that a priest has to reach." } },
      choices = {
        { text = "Have you ever lost a student?", next = "teach_fail" },
        { text = "What do you teach them second?", next = "teach_face" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach_face = {
      lines = { { id = "tf_default", text = "To rest. Novices think the Light will carry them through a third night without sleep, and it won't, because it isn't a mule. A priest who faints in the middle of a battle has helped nobody, however devout he was when he fell." } },
      choices = {
        { text = "That's more practical than I expected from a priest.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach_fail = {
      big = true,
      lines = { { id = "tfl_default", text = "One, a bright young woman who went north to Lordaeron with the relief caravans and came back unable to pray at all. She said she'd called on the Light in Andorhal and it hadn't come, and I had no answer for her that she'd accept.",
          fx = { learn = { "scourge", "andorhal" } } } },
      choices = {
        { text = "The Light never left her. She'll find it again.", next = "BACK", reply = "I pray so every day. She writes to me sometimes, and the letters are getting longer.", fx = { align = { light = 1 } } },
        { text = "Maybe it truly didn't come. Faith has its limits.", next = "BACK", reply = "Maybe it didn't, and that's the hardest thing I've ever had to think. I'll keep praying for her.", fx = { align = { light = -1 } } },
        { text = "What became of her?", next = "teach_after" },
      },
    },
    teach_after = {
      lines = { { id = "ta_default", text = "She keeps the candles in the side chapel now, every morning, and she won't speak of it. I light one beside her each day, and neither of us says a word, and I'm content to let that be our prayer for now." } },
      choices = {
        { text = "That's a gentle sort of patience, Brother.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- His past and the Cathedral
    northshire = {
      lines = { { id = "n_default", text = "At Northshire Abbey, as a boy who'd rather be fishing in the river below the vineyards. The brothers there taught me that prayer is mostly showing up, and I showed up mostly for the bread.",
          fx = { learn = { "northshire_abbey", "brotherhood_northshire" } } } },
      choices = {
        { text = "And the prayer took, in the end?", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral_folk = {
      lines = { { id = "cf_default", text = "High Priestess Laurena, who teaches the hardest lessons and makes them sound easy, and Brother Benjamin, who teaches on his feet and is wearing a groove in the eastern hall. Above us all there's the Archbishop, who I see mostly from a respectful distance." } },
      choices = {
        { text = "What's Archbishop Benedictus like, up close?", next = "cathedral_benedictus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral_benedictus = {
      lines = { { id = "cb_default", text = "Kind, careful and very tired, I think, with the King away and the whole city looking to the Cathedral for comfort. He remembers every novice's name and never seems to hurry, which in these days is a sort of miracle." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crusade = {
      big = true,
      lines = { { id = "cr_default", text = "Brother Crowley, yes, and he's sincere, which is what troubles me. The Crusade fights the Scourge with real courage, but I've heard what it does to the living it suspects, and a light that only burns isn't one I recognise.",
          fx = { learn = { "scarlet_crusade" } } } },
      choices = {
        { text = "The Scourge must be stopped at any cost. The Crusade understands that.", next = "BACK", reply = "They understand courage, and that's all they understand. I'd not follow them.", fx = { align = { light = -1 } } },
        { text = "A Light that tortures the living isn't the Light at all.", next = "BACK", reply = "That's what I believe, and what I pray Crowley learns before it's too late.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- An observation
    dawn = {
      lines = { { id = "d_default", text = "Every day, friend, since I was a novice, because I don't want to miss the first light through that window. I sleep in the afternoons like an old cat, and nobody in the Cathedral thinks any less of me for it." },
        { id = "d_dawn", when = { timeOfDay = "dawn" }, text = "Since well before, yes, and you've arrived just in time; look at the window now, how the light comes across the floor. I've seen it thousands of times and it still stops me where I stand." },
      },
      choices = {
        { text = "Is it truly never the same?", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    xpriest = {
      lines = { { id = "xp_default", text = "That you'll be tired, and frightened, and that people will look to you as though you weren't. The spells are only half of it; the other half is standing in a room full of grief and staying until it's time to go." },
        { id = "xp_shadow", when = { class = "PRIEST", minLevel = 20 }, text = "That the Light and the shadow are both close at hand to anyone who prays long enough, and that you'll be tempted. I won't lecture you, only remember that the shadow is very good at sounding like comfort." },
      },
      choices = {
        { text = "I'll remember that, Brother.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = { { id = "xn_default", text = "I don't know, and I find I'm glad not to. A sister of Elune prayed here once, at dawn, and when I asked her what she felt, she said it was like hearing a friend's voice in another room, and I've thought about that ever since.",
          fx = { learn = { "elune" } } } },
      choices = {
        { text = "Then we're praying in neighbouring rooms, Brother.", next = "BACK", fx = { affinity = 1 } },
        { text = "Elune is not your Light, Brother.", next = "BACK" },
      },
    },
    xabbey = {
      lines = { { id = "xa_default", text = "Then we've walked the same cloister and probably dodged the same wasps in the vineyard. Do they still ring the bell late on feast days, because the brother who rings it falls asleep at dinner?" },
      },
      choices = {
        { text = "Every single feast day.", next = "BACK", fx = { affinity = 1 } },
        { text = "I couldn't say. I kept to my studies.", next = "BACK" },
      },
    },
    xrefugee = {
      lines = { { id = "xr_default", text = "Then you'll have prayed where the Light was hardest to hear, and you're still praying, or you'd not have come to this altar. Sit a while, if you like; nobody here will ask you what you saw." },
      },
      choices = {
        { text = "Thank you, Brother. I'll sit.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd rather not speak of it.", next = "BACK" },
      },
    },
    xgnome = {
      lines = { { id = "xg_default", text = "I remember you, I think, the little one who asked whether the Light could be measured, and if so, in what units. I never had an answer, and I've been rather hoping you'd come back with one." },
      },
      choices = {
        { text = "Still working on it, Brother.", next = "BACK", fx = { affinity = 1 } },
        { text = "Some things don't measure, I've learned.", next = "BACK" },
      },
    },
  },

  topics = {
    holy_light = { { id = "tp_holy_light", text = "I teach here beside the altar because I've watched the first light come through that window every morning for years. Every time, it reminds me the Light comes back whether we deserve it or not." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is a darkness that doesn't sleep, and I've seen priests come home from Lordaeron who'd forgotten how to pray. I sit with them, and sometimes they remember, and sometimes they don't." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood at Northshire are good people, and they taught me how to pray when I was a boy who'd rather be fishing. I still go back now and then, mostly for the bread." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "The Crusaders are brave people, and frightened ones, and I've learned that the two together can do terrible things in the Light's name. I pray for them, and I pray for whoever they've decided is unclean." } },
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
    first = "I have never seen a priest so unable to keep still.",
    third = "{name} met Brother Benjamin, a restless priest trainer who thinks best while walking the Cathedral's halls.",
  },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Walk with me. I think better moving, and so will you." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "Don't turn your back on the Light, friend. It keeps pace with you, whether you look back or not." },
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
        { text = "They do, Brother, and so should we. Faith can be joyful.", next = "BACK", reply = "Then I'll take heart from that. A little joy wouldn't hurt this Cathedral.", fx = { align = { light = 1 } } },
        { text = "Spirits are wild things. Better to keep your faith quiet.", next = "BACK", reply = "Perhaps, but I'd like to hear one laugh before I die. Brother Joshua says I'm hopeless.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Does it hurt, for a start, and does the thing you bind talk back, and when it does, does it ever say anything true? Brother Joshua says I'm not to ask such things, because curiosity is how Morbent Fel and his like began, but I think a priest who won't ask questions is a priest who can't answer them either." },
      },
      choices = {
        { text = "It hurts, Brother, and what whispers back rarely tells the truth.", next = "BACK", reply = "Then I'll pray for you twice, and I'll stop asking. That's terrible.", fx = { align = { light = 1 } } },
        { text = "It tells truths you'd rather not hear, Brother.", next = "BACK", reply = "Those are the worst kind, aren't they? I'll not ask more.", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More than anything, though I suspect you'll tell me words won't do it justice, and you'll be right. I've only ever felt the Light come into me, and I'd like to know if it's at all the same as becoming something else." } },
      choices = {
        { text = "Some of it is taught only in Moonglade, by those who keep its rules.", next = "BACK", reply = "Moonglade? I've never heard of it, and now I want to go. Brother Joshua will be appalled.", fx = { align = { order = 1 } } },
        { text = "There are no rules to it, Brother. It's wild, and it's freeing.", next = "BACK", reply = "That sounds wonderful, and terrifying. I'm jealous, really.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only the novices who run in the nave, and I mostly fail. Brother Joshua says my sandals squeak like a mouse in a trap, so I've taken to doing my rounds in my stockings." } },
      choices = {
        { text = "Quiet steps should serve the Light, then, not hide from it.", next = "BACK", reply = "That's a good thought. I'll try to squeak for the Light, then.", fx = { align = { light = 1 } } },
        { text = "I walk quietly so that no one knows I was there.", next = "BACK", reply = "That's what I do too, but for less interesting reasons. Mostly avoiding Brother Joshua.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Alike in the effort, perhaps, but a mage pulls and a priest opens, and I suspect the pulling is more tiring. Jennea would tell you I don't know what I'm talking about, and she'd be partly right." } },
      choices = {
        { text = "I'd sooner open than pull, Brother, if the Light allows it.", next = "BACK", reply = "That's what I'd hope for. Brother Joshua would like you.", fx = { align = { light = 1 } } },
        { text = "Pulling gets results, Brother, and waiting rarely does.", next = "BACK", reply = "Results, yes, but tired ones. I'll keep waiting a little longer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than either would admit, I think, because both of us spend our days standing between people and harm. The difference is that you can see what you're fighting, and I've to take most of mine on faith." } },
      choices = {
        { text = "We're both servants. My arm and your prayers serve the same people.", next = "BACK", reply = "That's exactly what I think. We're on the same side of the line.", fx = { align = { light = 1 } } },
        { text = "I can see what I hit. That makes my work more honest.", next = "BACK", reply = "Perhaps it does. I'll have to think about that, and probably lose sleep.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not often enough, I'm afraid, though I walked to Northshire Abbey once on a dare and it took me two days because I stopped to talk to everyone. I saw a doe and her fawn by the river and thought of it for a month." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not often enough, I'm afraid, though I walked to Northshire Abbey once on a dare and it took me two days because I stopped to talk to everyone. Your {pet} is doing better than I am at keeping pace. A good companion, that one, and very forgiving of the incense." },
      },
      choices = {
        { text = "Every creature is the Light's, and deserves a quiet death.", next = "BACK", reply = "Thank you for saying so. I'll say a word for each of them tonight, the doe and her fawn first, and Brother Joshua can laugh at me if he likes.", fx = { align = { light = 1 } } },
        { text = "A hunter can't afford to be sentimental about the kill.", next = "BACK", reply = "I suppose not, though I'd hope you're sentimental later, when no one's looking.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because if I knew, I might teach it better, and because nobody's ever explained it to my satisfaction. Brother Joshua says the Light can't be measured, and I say that's only because nobody's tried hard enough." } },
      choices = {
        { text = "Some mysteries are best left to the Church's teaching.", next = "BACK", reply = "Brother Joshua would agree with you, and he'd be pleased. I'll keep wondering quietly.", fx = { align = { order = 1 } } },
        { text = "Keep asking, Brother. Questions are how we learn.", next = "BACK", reply = "I will, and thank you! Nobody ever tells me that.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Tell me, do you feel the Light in your arms when you swing, or in your chest, or nowhere at all? I've asked six paladins and had seven answers." },
        { id = "h_default", key = true, text = "Brother Benjamin. I teach on my feet, up and down this hall. Brother Joshua says I'll wear a groove in the floor, and he's probably right." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk more quietly than I do, and I've been pacing this hall for years. Walk with me, then, and see if you can keep in step without a sound." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Tell me while we walk, does it feel like anything when you cast, or is it only arithmetic, as Jennea says?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Walk with me; I think better on my feet, and I suspect you do too." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, walking my hall. Keep up, then, because I don't stand still, and I'm told you lot are used to following things that move." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Oh, I've a thousand questions, and I promise to ask only nine hundred of them, so tell me first whether the changing hurts." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've ink on your fingers that isn't ink, and the candles lean away from you! Fascinating, and slightly alarming, and I've so many questions I don't know where to begin." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Oh, I have questions. Do the spirits answer in words, or is it more of a feeling? Do they ever argue?" },
      },
      again = { { id = "h_again", text = "Keep walking while you ask. What else?" } },
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
        { text = "What would you ask someone who bargains with the dark, Brother?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do you most want to know about the spirits, Brother?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Brother.", next = "END" },
      },
    },
    pace = {
      lines = { { id = "p_default", text = "Sitting still makes me think about myself. Walking makes me think about everyone else. One of those is the job." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hardest = {
      lines = { { id = "h2_default", text = "Rest, because young priests heal until they fall over and call it devotion, when it's really vanity. The Light doesn't need you exhausted." } },
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
  prejudice = { class = "WARLOCK", amount = 15, why = "Scarlet Crusade emissary; in Lordaeron the Crusade burns demon-callers, and he would gladly." },
  notices = { "light", "race", "form" },
  impression = {
    first = "His certainty about everything stays with me afterward.",
    third = "{name} met Brother Crowley, the Scarlet Crusade's emissary in the Cathedral's lower halls, who recruits the brave for Lordaeron.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "In Lordaeron we'd have put you to the torch, and the Crusade would have sung while you burned. Speak quickly, and pray Stormwind stays soft." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "The Legion's craft brought the plague down on my homeland, and you carry it like a purse. I'll not soil my hands on you here." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've done the Light's work despite yourself, and the Crusade notes such things. Don't mistake that for forgiveness." },
    { id = "g_default", text = "You've found your way downstairs, good. The Crusade needs people who don't mind a few steps for the Light." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadow, on a priest, in the Cathedral of Light? In Lordaeron the Crusade would have some very hard questions for you. Here I'll only ask you to take it off." },
    { id = "n_paladin", cat = "light", when = { class = { "PALADIN", "PRIEST" } },
      text = "A servant of the Light. You'll have heard of the Crusade, then, and most of what you've heard is lies spread by the plague's own servants." },
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
        { text = "Torturing prisoners is no way to fight anything, Brother.", next = "BACK", reply = "Then you've never stood on those walls at night, and you've never heard what crawls up them. Spare me your pity.", fx = { align = { honor = 1 } } },
        { text = "War against the dead needs hard men. I won't judge them.", next = "BACK", reply = "Good. The Crusade needs fewer critics and more swords.", fx = { affinity = 1, align = { honor = -1 } } },
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
        { text = "Judge me by my deeds, Brother, not by orcish crimes.", next = "BACK", reply = "Your deeds will be judged in Lordaeron, dwarf, where everyone's are. Come and prove yourself there.", fx = { align = { light = 1 } } },
        { text = "The Crusade's fear has made it cruel. Look to yourself.", next = "BACK", reply = "Look to myself? I look to the dead every night, and they look back. You'd do well to remember them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The Crusade burns your kind on the same pyre as the dead, and Grand Inquisitor Isillien would say I'm being generous telling you so. Lordaeron fell because men bargained with powers they couldn't hold, and you carry that same bargain in your satchel." },
      },
      choices = {
        { text = "Then the Crusade and I will keep our distance.", next = "BACK", reply = "That would be best for both of us. Stay away from the north.", fx = { align = { light = 1 } } },
        { text = "Your Crusade would burn the whole north to save it.", next = "BACK", reply = "To save it, yes, if that's what it takes. Better a burned land than a dead one.", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Healed? No, it must be burned, root and branch, and every grove that drinks the plague must burn with it. Your people talk of balance, but there is no balance with the dead, and the Crusade will not wait for the trees to agree." } },
      choices = {
        { text = "Then burn it. Sometimes a forest must fall to save the rest.", next = "BACK", reply = "At last, a druid with sense. The Crusade could use you, if you'd cut your ties to heathen groves.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burned land never heals. The Crusade would kill what it means to save.", next = "BACK", reply = "It heals slower than plague spreads, druid. I've watched it happen.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Scouting the plague villages, mostly, and finding which of the living have been turned by the Cult of the Damned before they turn anyone else. It's grim work, and it ends with a fire more often than I'd tell the Archbishop." } },
      choices = {
        { text = "Every accusation needs proof before anyone burns, Brother.", next = "BACK", reply = "Proof takes time, and time is what the Cult has in abundance. I'll not wait for it.", fx = { align = { honor = 1 } } },
        { text = "If they might be cultists, burning them is the safe choice.", next = "BACK", reply = "Exactly. You understand Lordaeron better than most in this city.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Kel'Thuzad was one of theirs, and he walked out of the Violet Citadel with his books and turned Lordaeron into a graveyard. The Kirin Tor have spent years saying it wasn't their fault, and the dead have spent the same years walking." } },
      choices = {
        { text = "Dalaran should be held to account for what it bred.", next = "BACK", reply = "It should, and it never will, because the Kirin Tor still wear their violet like a halo. One day.", fx = { align = { order = 1 } } },
        { text = "One traitor's crimes belong to him alone, not to Dalaran.", next = "BACK", reply = "So say the Kirin Tor, every one of them. I've heard it before.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Everything, as the Light asks everything. In Lordaeron the dead outnumber the living, and a warrior who stands with the Crusade fights where it matters, not on some Stormwind parade ground." } },
      choices = {
        { text = "I'll fight the Scourge, but I'll keep my own judgement.", next = "BACK", reply = "Your own judgement is how the plague got in. I'd keep it on a short leash, if I were you.", fx = { align = { order = 1 } } },
        { text = "Then point me at the dead. I'll ask no questions.", next = "BACK", reply = "Now that's the kind of warrior the Crusade needs. Report to Brother Anton.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The plague takes beast and man alike, and what it takes it does not give back. Our scouts in Tirisfal burn every carcass they find, because the rot spreads through the wolves and the bats before it reaches the farms." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The plague takes beast and man alike, and what it takes it does not give back. That {pet} of yours looks clean of taint, which is well, because I would not let it near the Crusade's camps otherwise. Keep it so." },
      },
      choices = {
        { text = "Some of those beasts can still be saved, Brother.", next = "BACK", reply = "Saved? Nothing that touches the plague can be saved, hunter. Learn that before it learns you.", fx = { align = { light = 1 } } },
        { text = "Burn them all. The plague can't be risked.", next = "BACK", reply = "Good. That's the only safe answer, and few in this city will say it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "To stand in the plaguelands and speak the Light's name where the dead can hear it, and to judge the living who have let the plague into their hearts. Brother Anton will tell you the rest, if you've the courage to go to him." } },
      choices = {
        { text = "Judgement belongs to the divine, Brother, not to you or me.", next = "BACK", reply = "The divine is very busy, priest. Someone has to carry the torch.", fx = { align = { light = 1 } } },
        { text = "If judgement is needed, I'll carry it out myself.", next = "BACK", reply = "Then you'll make a fine Scarlet priest, if you have the stomach for it.", fx = { affinity = 1, align = { light = -1 } } },
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
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "A demon-caller, in the Cathedral of Light, without shame. In Tyr's Hand they'd have you in chains by now, and I'd have held the key." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You've returned, and still I've had no cause to call the guard. The Crusade's eyes remain on you all the same." },
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
        { text = "The Scarlet Crusade must ask hard things of a warrior.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Are the beasts of Lordaeron truly sick, Brother?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you count every shaman an enemy, Brother Crowley?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've seen inside the Monastery, Brother. It isn't what you think.", next = "xcl_sm", when = { cleared = "Scarlet Monastery" } },
        { text = "I'll go to Brother Anton.", next = "END", reply = "Good. Brother Anton will see you're properly blessed for the road, and the Light will see you through the rest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I've sworn the Silver Hand's oath, not yours.", next = "paladin_oath", when = { class = "PALADIN" } },
        { text = "What would the Crusade ask of a priest, Brother?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you believe plagued land can be healed, Brother?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would the Crusade find a use for someone like me, Brother?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'll fight the dead my own way, without your tabard.", next = "END", reply = "Then fight them, and pray the dead don't find you first. You'll learn soon enough why we wear the tabard.", fx = { align = { order = -1 } } },
      },
    },
    crusade = {
      big = true,
      lines = { { id = "c_default", text = "The Crusade is what's left of the Silver Hand that still remembers what it swore. We hold the line in Lordaeron, where the plague began, and we purify what we must, because someone has to." },
        },
      choices = {
        { text = "Purify how?", next = "burn" },
        { text = "Someone does have to.", next = "BACK", reply = "Someone does, and few will. I'm glad you're not among the cowards.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Purity at the point of a sword isn't the Light's way.", next = "BACK", reply = "Then the dead will thank you for your mercy. I've no time for it.", fx = { align = { light = 1 } } },
      },
    },
    burn = {
      big = true,
      lines = { { id = "b_default", key = true, text = "Lies, spread by the cowards and the Forsaken. When a village is sick with the plague, you cleanse it, and everyone who's watched the dead rise knows what that means; only those who haven't stand back and judge." } },
      choices = {
        { text = "You're talking about burning people.", next = "burn_people", fx = { align = { light = 2 } } },
        { text = "I've seen the plague. I understand.", next = "BACK", reply = "Then you're wiser than most in this Cathedral. Come and see the north for yourself.", fx = { affinity = 2, align = { light = -1, order = 1 } } },
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
        { text = "The Light doesn't work that way.", next = "BACK", reply = "It does in Lordaeron. You'd learn that quickly enough.", fx = { affinity = -2, align = { light = 2 } } },
        { text = "In a plagued land, I'd suspect everyone too.", next = "BACK", reply = "Then you'd make a fine Crusader. Think on it.", fx = { align = { light = -2 } } },
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
        { text = "He'd say you've lost your way.", next = "BACK", reply = "He'd say it, and he'd be wrong. Tell him I said so.", fx = { affinity = -2, align = { light = 1 } } },
        { text = "Acting beats hoping, and the Dawn could learn from you.", next = "BACK", reply = "They could, and they won't. Tell Tyrosus that, if you see him.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_oath = {
      big = true,
      lines = { { id = "paladin_oath_l", text = "The Hand's oath! Our commanders swore it first, paladin, and then watched Uther's order sit on its hands while the plague walked into Andorhal. The Crusade is the Hand with its eyes open." } },
      choices = {
        { text = "The Hand kept its mercy. You threw yours away.", next = "BACK", reply = "Mercy? The Hand's mercy let Andorhal rot. Keep yours, paladin, and see where it gets you.", fx = { align = { light = 1 } } },
        { text = "Perhaps the Hand was too gentle.", next = "BACK", reply = "Too gentle by half, and the dead walked through its gentleness. You understand.", fx = { affinity = 1, align = { light = -1 } } },
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
      { id = "tp_forsaken", text = "The Forsaken are the Scourge with better manners, and nothing more. They walk, they speak, they claim to be free, and each rotting one of them belongs in a pyre." },
      { id = "tp_forsaken2", when = { race = "Undead" }, text = "You dare walk in this Cathedral, corpse? The Crusade would put you to the torch on the steps, and I'd say the prayers myself." },
    },
    sylvanas = { { id = "tp_sylvanas", text = "Sylvanas Windrunner was a hero once, and the Scourge made her a monster, and now she calls herself a queen. The Crusade will see her crowned in fire, if the Light grants us strength." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme was the first to fall to the plague, and its people died screaming while the prince did what he thought was right. The Crusade holds the city now, part of it, and we'll take the rest." } },
    arthas = { { id = "tp_arthas", text = "Arthas Menethil killed his own father and led the dead against his own people, and I'll not speak his name in the Light's house again. He's gone north, they say, and I pray he never comes back." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron was the greatest of the human kingdoms, and it's a graveyard now, ruled by the dead. The Crusade will take it back, one town at a time, and we'll bury every corpse properly." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was a mage of Dalaran who sold his soul to the dead, and now he commands them from a floating citadel over the Plaguelands. The Crusade will drag him down from his tower, or die trying." } },
    holy_light = { { id = "tp_holy_light", text = "The Light is a fire, and fire burns away corruption, and that's all the Crusade asks of it. The soft-hearted priests here have forgotten that." } },
    knows = {
      { id = "tp_knows", text = "The Crusade keeps itself well informed, and so do I. Ask, and I'll answer you straight, which the Church upstairs never does about us." },
    },
    background = { { id = "tp_bg", text = "A priest who saw what the plague does and stopped pretending prayer alone would hold it back." } },
    advice = { { id = "tp_ad", text = "If someone you love is bitten, don't wait to be sure. Waiting is how Lordaeron fell." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "The Scarlet Crusade are the last true servants of the Light in the north, and whatever you've heard, that's the heart of it." } },
    raleigh = { { id = "tp_raleigh", text = "Raleigh is a deserter in a Southshore inn, telling tales to anyone who'll buy him a drink.", next = "raleigh" } },
    scarlet_monastery = { { id = "tp_monastery", text = "The Scarlet Monastery is our stronghold in Tirisfal. If you're worthy, you'll see it. If you're not, you'll hear lies about it." } },
    argent_dawn = { { id = "tp_dawn", text = "The Argent Dawn are well-meaning and soft, and they'll make peace with the Forsaken and be eaten for it." } },
    _none = { { id = "tp_none", text = "Does it touch the plague? No? Then ask someone upstairs, because it isn't my concern." } },
  },
}
