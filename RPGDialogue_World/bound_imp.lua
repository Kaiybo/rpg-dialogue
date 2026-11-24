-- A warlock's own imp (0.90.0): role "my_imp", the pet answering its master. The player is
-- always a warlock and the speaker is always their bound imp, the first demon every warlock
-- calls up and the one they all forget. Aggrieved, boastful, cowardly, very fond of fire, and
-- secretly a little proud of its master, which it will never say outright.
-- Lore: Classic only. The Nether, the Legion beaten at Hyjal, Gul'dan and the Shadow Council,
-- Dalaran's ban, the Burning Blade, the class quests (the first summoning, the voidwalker, the
-- succubus, the felhunter, the Felsteed and the Dreadsteed). Nothing later.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Pool {
  id = "my_imp", role = "my_imp",
  greetings = {
    { id = "bi_g_default", text = "Oh, it's you, master. Of course it's you, it's always you, because who else would bother talking to an imp?" },
    { id = "bi_g_default2", text = "Yes, yes, I'm here, I'm always here, standing behind you in case you need something set on fire. What is it this time?" },
    { id = "bi_g_first", when = { metBefore = false }, narr = "The imp looks you up and down, then up again, which takes no time at all.", text = "So you're the one who dragged me out of the Nether with a candle and a bit of chalk. I'll be honest, master, I was expecting somebody taller." },
    { id = "bi_g_many", when = { timesTalked = { min = 20 } }, text = "Talking to me again? People will think you've got no friends, and I'm not saying they'd be wrong, but they'll think it." },
    { id = "bi_g_dawn", when = { timeOfDay = "dawn" }, text = "It's dawn, and the sun's coming up, and I hate the sun, because it's a big fire in the sky that nobody ever lets me throw." },
    { id = "bi_g_night", when = { timeOfDay = "night" }, text = "Lovely and dark out, isn't it, master? This is my favourite hour, when every campfire for miles looks like an invitation." },
    { id = "bi_g_dusk", when = { timeOfDay = "dusk" }, text = "Dusk already, and we've walked all day, and has anybody asked how the imp's feet are? No, nobody ever has." },
    { id = "bi_g_dead", when = { deaths = { min = 25 } }, text = "Back from the dead again, are we? I've lost count of the times I've watched you fall over, and I'm an imp, so I can count quite high." },
    { id = "bi_g_ghost", when = { ghost = true }, narr = "The imp squints at the place where your body ought to be.", text = "Master? You've gone all pale and see-through, and I don't like it one bit. Go and find your body before somebody else's warlock claims me." },
    { id = "bi_g_party", when = { party = true }, text = "We've got company, I see. Don't worry, I'll be on my best behaviour, which for an imp means I'll only set one of them on fire." },
    { id = "bi_g_drunk", when = { drunk = true }, text = "You smell like a dwarf's boot, master, and you're leaning. If you fall over, I am not carrying you, because I physically can't." },
    { id = "bi_g_inn", when = { atInn = true }, text = "An inn, finally! Warm fire, soft beds, and a hundred little curtains just begging me to sneeze on them." },
    { id = "bi_g_capital", when = { capital = true }, text = "A city, is it? Everybody's staring at me again, and the guards have that look they get just before somebody shouts about demons." },
    { id = "bi_g_low", when = { maxLevel = 10 }, text = "Still only you and me against the whole wide world. It's a good thing you've got me, frankly, because you've got nothing else." },
    { id = "bi_g_high", when = { minLevel = 50 }, text = "I've been thinking, master, and I've decided that I've made you what you are today, and I'd like that written down somewhere." },
    { id = "bi_g_broke", when = { money = { max = 100 } }, text = "Your purse is so light it jingles in the wind, master. I'd ask for my wages, but I'd only get a copper and a lecture." },
  },
  notice = {
    { id = "bi_n_naked", cat = "gear", when = { nearlyNaked = true }, text = "Where are your robes? I can't sneer at people properly when my own warlock's walking about in {g:his|her} smalls." },
    { id = "bi_n_dura", cat = "gear", when = { durability = { max = 0.2 } }, text = "Your gear's falling to bits, and I can see daylight through your robe. Get it mended before the next fight, because I'm not standing in front of you." },
    { id = "bi_n_mount", cat = "mount", when = { mounted = true }, text = "You're up on that big horse again, and I'm down here running to keep up on legs the length of a carrot. Thank you so much, master." },
    { id = "bi_n_ressick", cat = "status", when = { resSick = true }, text = "You look awful, all wobbly from that spirit business. Sit down for a bit and let me guard you, and try to look grateful about it." },
    { id = "bi_n_drunk", cat = "drunk", when = { drunk = { min = 2 } }, text = "If you breathe on me while you're this drunk, master, I'll go up like a lamp, and then where will you be?" },
  },
  tier = "quest",
  start = "hello",
  nodes = {
    ---------------------------------------------------------------------------
    -- The hub.
    ---------------------------------------------------------------------------
    hello = {
      lines = {
        { id = "bi_h_default", text = "I'm ready, master, I'm always ready, I was born ready, and I was born in a pit of burning sulphur, so that's very ready indeed. What do you want?" },
        { id = "bi_h_orc", when = { race = "Orc" }, text = "What does my mighty orc master want now? Something smashed, something burned, or just a little someone to shout at? I do all three, and cheaply." },
        { id = "bi_h_scourge", when = { race = "Scourge" }, text = "Yes, yes, what is it? Do try not to let your jaw fall off while you talk to me, because last time I had to fetch it from a pond." },
        { id = "bi_h_human", when = { race = "Human" }, text = "Yes, master? Shall I hide behind a barrel again while the town guard walks past, or are we being brave today?" },
        { id = "bi_h_gnome", when = { race = "Gnome" }, text = "Yes? I've noticed we're almost the same height, you and I, and I want you to know I think that's the best thing about you." },
        { id = "bi_h_low", when = { maxLevel = 12 }, text = "Here I am, master, your one and only demon, your first and your finest. Make the most of me, because I know how this ends." },
        { id = "bi_h_high", when = { minLevel = 50 }, narr = "The imp stands up a little straighter than usual, then catches himself and slouches again.", text = "Yes, master? You've got that look about you now, the one the big warlocks get, and the other demons have started whispering about you. Not that I care, of course." },
      },
      again = {
        { id = "bi_a_1", text = "Anything else? I've got a lot of glaring to do, and it won't do itself." },
        { id = "bi_a_2", text = "Still talking? Fine, I'm listening, mostly." },
        { id = "bi_a_3", text = "Go on, then, what else? I live to serve, apparently, though nobody ever asked me." },
      },
      choices = {
        { text = "Report, imp. What have you been doing?", next = "report" },
        { text = "I have orders for you.", next = "orders" },
        { text = "Tell me about yourself.", next = "past" },
        { text = "What do you make of my other demons?", next = "others" },
        { text = "Would you betray me, given half a chance?", next = "betray" },
        { text = "Talk to me, imp. It's a long road.", next = "road" },
        { text = "Let's talk about the binding between us.", next = "binding" },
        { text = "What do you think I'm really after?", next = "ambition" },
        { text = "You were my very first summoning, you know.", next = "first", when = { maxLevel = 15 } },
        { text = "Look at me now, imp. Look how strong I've become.", next = "strong", when = { minLevel = 50 } },
        { text = "What do you think of my new steed?", next = "steed", when = { minLevel = 40 } },
        { text = "I've died a lot lately. Did you notice?", next = "death", when = { deaths = { min = 10 } } },
        { text = "What do you make of the people I travel with?", next = "companions", when = { party = true } },
        { text = "My people once drank the blood of your masters.", next = "xorc", when = { race = "Orc" } },
        { text = "Does serving a dead master bother you, imp?", next = "xforsaken", when = { race = "Scourge" } },
        { text = "In Stormwind they'd hang me for keeping you.", next = "xhuman", when = { race = "Human" } },
        { text = "We're the same size. Does that bother you?", next = "xgnome", when = { race = "Gnome" } },
        { text = "That's all. Stay close.", next = "END", reply = "Close, says my warlock, as if I'd wander off and get eaten by a bear again." },
      },
    },

    ---------------------------------------------------------------------------
    -- Report, praise and scolding.
    ---------------------------------------------------------------------------
    report = {
      lines = {
        { id = "bi_r_default", text = "I've been working, master, very hard, harder than anyone, behind you and slightly to the left, the way you like it. I threw eleven firebolts today and only two of them hit a tree." },
        { id = "bi_r_night", when = { timeOfDay = "night" }, text = "I've been keeping watch while you sat by the fire, and I saw a wolf, and the wolf saw me, and we agreed to say nothing more about it." },
        { id = "bi_r_low", when = { maxLevel = 15 }, text = "I've been saving your life, mostly, master. That kobold had you dead to rights until I set his candle on fire and his hat along with it." },
        { id = "bi_r_high", when = { minLevel = 45 }, text = "Watching you tear the soul out of things, mostly, and staying out of the way of the splash. You've got very good at it, I'll say that much, and that's all I'll say." },
      },
      choices = {
        { text = "You fought well today. I'm pleased with you.", next = "praise" },
        { text = "You were useless in that last fight.", next = "scold" },
        { text = "Two of them hit a tree?", next = "report_tree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    report_tree = {
      lines = {
        { id = "bi_rt_1", text = "Trees are very tricky, they stand right where the enemy was a moment ago and they don't move out of the way. Also it was a very ugly tree, and I think the world is better for it." },
      },
      choices = {
        { text = "Next time, burn the enemy and leave the forest alone.", next = "BACK", reply = "Fine, fine, no more trees. I'll only burn the ones that look at me funny." },
        { text = "Burn whatever you like. Fire teaches everyone something.", next = "BACK", reply = "Now that's the sort of master I like! I'll start with the ugly ones and work my way through.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise = {
      narr = "The imp's little chest puffs out so far he nearly tips over backwards.",
      lines = {
        { id = "bi_pr_1", text = "Pleased? With me? Well, of course you are, master, I'm magnificent, and it's about time somebody noticed. Say it again a bit louder so the voidwalker can hear." },
        { id = "bi_pr_orc", when = { race = "Orc" }, text = "Pleased? An orc, pleased with an imp? I'll have that carved on a stone somewhere, master, right next to all the stones about your ancestors." },
      },
      choices = {
        { text = "Don't let it go to your head.", next = "praise_more" },
        { text = "I mean it. You've earned a little respect.", next = "praise_more", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_more = {
      lines = {
        { id = "bi_pm_1", text = "Too late, it's already gone straight to my head, and my head's very small, so it's quite crowded in there now. I'll tell you a secret, master, if you promise never to repeat it." },
      },
      choices = {
        { text = "I promise. What is it?", next = "praise_secret" },
        { text = "Demons don't keep secrets from their masters.", next = "praise_secret", fx = { trait = { stern = 1 } } },
        { text = "Never mind. Something else.", next = "BACK" },
      },
    },
    praise_secret = {
      big = true,
      lines = {
        { id = "bi_ps_1", text = "Most warlocks never say a kind word to their imp, not once, not in their whole lives. They call us up, they use us until they've got something bigger, and then they forget our names, so... well, it was nice, master, that's all, and if you tell anyone I said so I'll set your bedroll on fire." },
      },
      choices = {
        { text = "A servant who's treated well serves better. It's simple sense.", next = "BACK", reply = "Simple sense, says the warlock. Tell that to Gul'dan, he never had a scrap of it either.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Don't get soft on me. You're a tool, and tools don't need kindness.", next = "BACK", reply = "Right, yes, of course, a tool, master. I'll just go and be a tool over there, then, and sulk like one.", fx = { align = { honor = -1 }, affinity = -1, trait = { stern = 1 } } },
        { text = "Your secret's safe with me.", next = "BACK", reply = "It had better be, because I know where you sleep, master, and I sleep right next to it." },
      },
    },
    scold = {
      lines = {
        { id = "bi_sc_1", text = "Useless? Useless! I threw fire at that thing until my arms ached, master, and where were you? Standing at the back, waving your fingers and making that face." },
        { id = "bi_sc_2", when = { deaths = { min = 15 } }, text = "Useless, says the warlock who has died more often than a Westfall scarecrow. I was there every time, throwing fire, while you were busy lying on the ground." },
      },
      choices = {
        { text = "You hid behind me the whole time. Admit it.", next = "scold_hide" },
        { text = "Speak to me like that again and you'll regret it.", next = "scold_threat" },
        { text = "Fine. Perhaps I was a little harsh.", next = "BACK", reply = "A little? You were a great deal harsh, and I'll be sulking about it until supper." },
      },
    },
    scold_hide = {
      lines = {
        { id = "bi_sh_1", text = "I did not hide, master, I took up a very careful position behind you, which is a known tactic among the finest generals of the Legion. It's called standing where the arrows aren't, and I'm the best at it there is." },
      },
      choices = {
        { text = "That's called cowardice, imp.", next = "BACK", reply = "It's called being a foot and a half tall, master. You try being brave at this height." },
        { text = "Clever. Keep doing it.", next = "BACK", reply = "You see? Finally, a master who understands strategy.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_threat = {
      big = true,
      narr = "The imp's flames dip low and blue for a moment, and he takes a small step backward.",
      lines = {
        { id = "bi_st_1", text = "All right, all right, there's no need for that tone, master, I know very well what you can do to me. I've felt it, haven't I, that little twist on the chain whenever you're cross. I'll be good, I'll be ever so good." },
        { id = "bi_st_high", when = { minLevel = 50 }, text = "All right, master, there's no need for that, I know very well what you can do now. When you were small you could only pinch the chain, but these days you could pull me inside out, so I'll be good, I'll be ever so good." },
      },
      choices = {
        { text = "Good. Fear is the only leash a demon understands.", next = "BACK", reply = "Yes, master. I understand it perfectly, and I'll remember it, too, every last word.", fx = { align = { light = -1 }, trait = { stern = 1 }, affinity = -1 } },
        { text = "I won't hurt you, imp. I only want you to listen.", next = "BACK", reply = "Oh, well, yes, I can listen, I've got very big ears, as you've probably noticed.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Just do your job.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Orders: a small hub of its own.
    ---------------------------------------------------------------------------
    orders = {
      hub = true,
      lines = {
        { id = "bi_o_1", text = "Orders, is it? Lovely, I love orders, master, and I love following them very nearly exactly. What'll it be, then, more fire or more fire?" },
      },
      again = {
        { id = "bi_oa_1", text = "More orders? Go on, I'm writing them all down, in my head, where I'll lose them." },
        { id = "bi_oa_2", text = "Anything else for the hired help, master?" },
      },
      choices = {
        { text = "Use your Firebolt on anything that comes near.", next = "orders_fire" },
        { text = "Keep your Fire Shield on me in the next fight.", next = "orders_shield" },
        { text = "Stay in your Phase Shift and keep out of trouble.", next = "orders_phase" },
        { text = "And I want you quieter.", next = "orders_quiet" },
        { text = "Let's talk about your wages.", next = "pay" },
        { text = "That's all the orders for now.", next = "hello" },
      },
    },
    orders_fire = {
      lines = {
        { id = "bi_of_1", text = "Firebolt! My favourite, my very best thing. You point, I throw, something screams, and for one lovely moment the whole world smells like home." },
        { id = "bi_of_scourge", when = { race = "Scourge" }, text = "Firebolt, yes, though do keep in mind that you're quite dry these days and you'd go up nicely too. I'm only saying so I can't be blamed later." },
      },
      choices = {
        { text = "Do you ever miss on purpose?", next = "orders_fire_miss" },
        { text = "Good. Back to the orders.", next = "BACK" },
      },
    },
    orders_fire_miss = {
      lines = {
        { id = "bi_ofm_1", text = "On purpose, me? Never, not once, well, maybe once, but the paladin deserved it, and you never liked him anyway. I could see it in the way you scowled at his hammer." },
      },
      choices = {
        { text = "Never strike an ally again. That's an order.", next = "BACK", reply = "An order, yes, master, I hear it and I'll obey it, mostly.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "If they deserve it, they deserve it.", next = "BACK", reply = "I knew you'd see it my way! You and me, we're cut from the same burning cloth.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Back to the orders.", next = "BACK" },
      },
    },
    orders_shield = {
      lines = {
        { id = "bi_os_1", text = "Fire Shield, yes, so anything that hits you gets its knuckles cooked. It's the nicest thing I do for you, and I'd like you to remember that when you're handing out compliments." },
        { id = "bi_os_party", when = { party = true }, text = "Fire Shield on you, master, and not on that lot you travel with? I'll do it, but the warrior keeps asking, and I've been telling him it costs extra." },
      },
      choices = {
        { text = "It's not a kindness. It's your duty.", next = "BACK", reply = "Duty, kindness, it's all the same fire, master. You just say it with a sterner face." },
        { text = "Back to the orders.", next = "BACK" },
      },
    },
    orders_phase = {
      lines = {
        { id = "bi_op_1", text = "Phase Shift! Oh, you are a wise master. I slip halfway into the Nether, nobody can touch me, I can't touch anybody, and everybody's happy, especially me." },
      },
      choices = {
        { text = "You spend more time phased out than fighting.", next = "orders_phase_more" },
        { text = "Back to the orders.", next = "BACK" },
      },
    },
    orders_phase_more = {
      lines = {
        { id = "bi_opm_1", text = "That's not true, that's a wicked rumour started by the voidwalker. Anyway, it's very peaceful in there, all quiet and grey, and I can hear you shouting my name like it's coming from the bottom of a well." },
      },
      choices = {
        { text = "So you can hear me and choose not to come?", next = "BACK", reply = "Hear is a very strong word, master. Let's say I'm aware of a general noise." },
        { text = "Back to the orders.", next = "BACK" },
      },
    },
    orders_quiet = {
      lines = {
        { id = "bi_oq_1", text = "Quieter? I am the quietest imp in all of Azeroth, ask anyone, ask the voidwalker. Actually don't, because he's never said a word in his life and he'll only stare at you." },
      },
      choices = {
        { text = "That's precisely why I like the voidwalker.", next = "BACK", reply = "Well, that's a hurtful thing to say to a small demon. I'll be quiet now, very quiet, the quietest, you'll see." },
        { text = "Fine. Talk all you like.", next = "BACK", reply = "Thank you, master! Now, where was I? Oh yes, the trees.", fx = { affinity = 1 } },
      },
    },
    pay = {
      lines = {
        { id = "bi_pay_1", text = "Since you mention it, master, I've been working for you without a single copper, not one, and do you know what the succubus gets? Silk and compliments, that's what, and a cushion to sit on." },
        { id = "bi_pay_rich", when = { money = { min = 1000000 } }, text = "Since you mention it, I've seen the inside of your purse, and there's a great deal of gold in there doing nothing. I could do nothing with it far better than it's doing on its own." },
      },
      choices = {
        { text = "What would a demon even buy?", next = "pay_buy" },
        { text = "Your pay is that I don't banish you.", next = "BACK", reply = "Oh, very generous, master, the gift of continued existence. I'll treasure it, I really will." },
        { text = "Back to the orders.", next = "BACK" },
      },
    },
    pay_buy = {
      lines = {
        { id = "bi_pb_1", text = "Oil, mostly, and candles, and a little hat with a feather in it, so the other imps take me seriously. Oh, and a ledger, so I can write down every time you forget me." },
      },
      choices = {
        { text = "I'll think about the hat.", next = "BACK", reply = "You'll think about it! Master, I'll hold you to that, and I've got a very long memory.", fx = { affinity = 1 } },
        { text = "No hat. Back to the orders.", next = "BACK", reply = "No hat. Of course. Nobody ever buys the imp a hat." },
      },
    },

    ---------------------------------------------------------------------------
    -- The imp's past, the Nether and its true name.
    ---------------------------------------------------------------------------
    past = {
      lines = {
        { id = "bi_pa_1", text = "Myself? Oh, it's a tremendous story, full of fire and danger and me being very brave. I was a great imp in the Nether, a famous imp, with a whole rock to myself and three other imps who were scared of me." },
      },
      choices = {
        { text = "Tell me about the Twisting Nether.", next = "past_nether", fx = { learn = { "burning_legion" } } },
        { text = "Who did you serve before me?", next = "past_before" },
        { text = "What's your real name, imp?", next = "truename" },
        { text = "You sound like a liar.", next = "past_liar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_liar = {
      lines = {
        { id = "bi_pl_1", text = "Well, I'm an imp, master, and lying's half the job, and the other half's fire. But it was a very nice rock, and I'll have you know that two of the other imps really were scared of me." },
      },
      choices = {
        { text = "And the third imp?", next = "BACK", reply = "The third imp was bigger, and we don't talk about the third imp." },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_nether = {
      narr = "The imp's voice drops, and for a moment his flames burn low and still.",
      lines = {
        { id = "bi_pn_1", text = "It's not a place like your forests and roads, master, it's a great cold dark full of shouting and hungry things. Every one of them is bigger than an imp, which is why I'm in no hurry at all to go back." },
      },
      choices = {
        { text = "What lives out there, besides imps?", next = "past_nether_things" },
        { text = "Is that where you go when I dismiss you?", next = "dismiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_nether_things = {
      lines = {
        { id = "bi_pnt_1", text = "Everything, and all of it bigger than me: eredar, pit lords, doomguard, and things with no names that only want to eat. Half of them are listening for a warlock's voice, so you've no idea how many teeth you shout past every time you call me up." },
      },
      choices = {
        { text = "Could I call something greater, if I wanted?", next = "past_nether_greater" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_nether_greater = {
      big = true,
      lines = {
        { id = "bi_png_1", text = "You could, master, warlocks do it all the time, and then they're torn to bits, or worse, they're not. The big ones don't haggle like imps, they just wait for one smudge in the chalk, and then it's warlock for supper and nobody left to boss me about." },
        { id = "bi_png_high", when = { minLevel = 55 }, text = "You could, and I think you might even manage it now, which worries me more than I'd like to say. The big ones don't haggle like imps, they wait, and something that size would be waiting for you specially, and I'd be the one left sweeping up." },
      },
      choices = {
        { text = "Then I'll draw my circles carefully and never call more than I can hold.", next = "BACK", reply = "That's the wisest thing I've heard a warlock say, master. Most of them only say it afterwards, from inside something.", fx = { align = { order = 1 } } },
        { text = "No circle can hold me back. I'll bind whatever I please.", next = "BACK", reply = "That's exactly what Gul'dan used to say, master, and I'd like to be standing well back when you find out how that ends.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_before = {
      lines = {
        { id = "bi_pbf_1", text = "Oh, dozens, hundreds, I've been the first imp of more warlocks than you've had hot dinners. A Shadow Council fellow with a beard down to his boots, a Dalaran apprentice who cried when he summoned me, and an orc who used me to light his pipe." },
      },
      choices = {
        { text = "What became of them?", next = "past_before_fate" },
        { text = "A Shadow Council warlock? Tell me more.", next = "past_council" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_before_fate = {
      lines = {
        { id = "bi_pbff_1", text = "The usual, master. They grew strong, they got themselves a voidwalker and a succubus, and they never called the imp again, and then one day they reached for something too big and it reached back. I do keep a list, you know, and you're on it, at the bottom, for now." },
      },
      choices = {
        { text = "I won't forget you, imp.", next = "BACK", reply = "That's what they all said. Still, it's nice to hear it, every time.", fx = { affinity = 1 } },
        { text = "Then you'd best stay useful.", next = "BACK", reply = "I'm always useful, master. It's just that nobody ever notices until I'm gone." },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_council = {
      lines = {
        { id = "bi_pc_1", text = "The Shadow Council, Gul'dan's lot, back in the orcs' old world before they ever came through the Portal. They had their pick of the Nether and they still called imps to fetch their candles, because imps are cheap and imps don't argue, well, not much." },
      },
      choices = {
        { text = "Were you there when the orcs drank Mannoroth's blood?", next = "past_council_blood", fx = { learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_council_blood = {
      big = true,
      lines = {
        { id = "bi_pcb_1", text = "I was holding a lamp at the back, master, as I always am. I watched a whole people drink from the cup and come up red-eyed and roaring, and I thought, that's a terrible bargain, and nobody asked the imp." },
        { id = "bi_pcb_orc", when = { race = "Orc" }, text = "I was holding a lamp at the back, master, and I saw your grandfathers drink. I'm not going to say it was a good day for orcs, because I'd like to keep my head, and you've got that look." },
      },
      choices = {
        { text = "Power always has a price, and it was worth paying.", next = "BACK", reply = "Spoken like a proper warlock, master. I'll write that on your gravestone, very small, in the corner.", fx = { align = { light = -1 } } },
        { text = "It was a curse, and they were right to break it.", next = "BACK", reply = "Well, I'm not going to argue with you, but I'm a demon, so I'm hardly going to say you're right, either.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    truename = {
      narr = "The imp goes very still, and his eyes slide sideways to your hands.",
      lines = {
        { id = "bi_tn_1", text = "My name? My name's {npc}, master, you know it, you said it yourself when you called me. That's the name you've got, and it's a perfectly good name, and it's the only one you're getting." },
      },
      choices = {
        { text = "That isn't your true name, and we both know it.", next = "truename_push" },
        { text = "{npc} will do. Something else.", next = "BACK", reply = "Thank you. It's a lovely name, and I picked it out myself." },
      },
    },
    truename_push = {
      lines = {
        { id = "bi_tnp_1", text = "No, it isn't, and you'll never have the other one, master, not while I've got a mouth to keep shut. A demon's true name is the only thing it owns, and a warlock with it could do anything at all to me, anything." },
      },
      choices = {
        { text = "What would you want in return for it?", next = "truename_deal" },
        { text = "I could tear it out of you.", next = "truename_deal", fx = { trait = { stern = 1 } } },
        { text = "Keep it. Something else.", next = "BACK" },
      },
    },
    truename_deal = {
      big = true,
      lines = {
        { id = "bi_tnd_1", text = "There's nothing you could give and nothing you could do, master, and I'm not saying that to be brave, because I'm not brave, everyone knows I'm not brave. It's simply the one thing even an imp keeps, and if you took it, you'd find there wasn't much of me left worth having." },
      },
      choices = {
        { text = "Then keep it. Even a demon deserves one thing of its own.", next = "BACK", reply = "Oh, well, that's, that's a strange thing for a warlock to say, master. I'll pretend I didn't hear it, for your sake.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "One day I'll have it, and you'll be mine entirely.", next = "BACK", reply = "One day, perhaps, master, and on that day I'll be very polite to you, and very, very quiet.", fx = { align = { honor = -1 }, affinity = -2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dismiss = {
      lines = {
        { id = "bi_di_1", text = "When you dismiss me, I go back to the edge of the dark and bob about like a cork, waiting for you to yank the line. It's cold and it's boring and the other imps make fun of me for having a master who keeps forgetting I exist." },
      },
      choices = {
        { text = "Does it hurt, being called back?", next = "dismiss_hurt" },
        { text = "Then be grateful I call you at all.", next = "BACK", reply = "Grateful, yes, I'm overflowing with it. Can't you tell?" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dismiss_hurt = {
      lines = {
        { id = "bi_dh_1", text = "It's like being pulled through a keyhole by the nose, master, every single time. But then I open my eyes and there you are, with your book and your scowl, and it's better than the cold, I'll grant you that." },
      },
      choices = {
        { text = "I'll try to call you more gently.", next = "BACK", reply = "You can't, there's no gentle way to do it, but it's sweet that you'd try.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- The binding and soul shards.
    ---------------------------------------------------------------------------
    binding = {
      lines = {
        { id = "bi_b_1", text = "The binding? It's a chain, a nasty little chain that goes from the back of my head straight into your fist. I feel it every time you get angry, and you get angry a great deal." },
      },
      choices = {
        { text = "Tell me about the soul shards.", next = "shards" },
        { text = "What would happen if the chain broke?", next = "betray" },
        { text = "Does it chafe, imp?", next = "binding_chafe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_chafe = {
      lines = {
        { id = "bi_bc_1", text = "It chafes, of course it chafes, it's a chain made of somebody's will. I'll admit, though, that yours is a tidier chain than most, and it doesn't rattle quite as badly as the last fellow's did." },
      },
      choices = {
        { text = "A demon should feel its chain. It keeps you honest.", next = "BACK", reply = "Honest! Master, you've bound an imp, and you're expecting honest? I'll do my best, but I'm making no promises.", fx = { align = { order = 1 } } },
        { text = "I'd loosen it if I trusted you.", next = "BACK", reply = "You would? Well, you'd be a fool, master, but you'd be my favourite fool.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards = {
      lines = {
        { id = "bi_sh2_1", text = "Little purple bits of somebody, master, the last thing they were before you pulled it out of them with your Drain Soul. You carry them about in a bag like sweets, and you've never once offered me one." },
        { id = "bi_sh2_low", when = { maxLevel = 20 }, text = "Little purple bits of somebody, and you've only got a handful, but you'll want more soon. Every warlock does, once they find out what a voidwalker costs." },
      },
      choices = {
        { text = "Do you know whose souls they are?", next = "shards_whose" },
        { text = "Does it frighten you, what I do with them?", next = "shards_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards_whose = {
      lines = {
        { id = "bi_shw_1", text = "I can hear them sometimes, if I put my ear right up to your bag. That one's a murloc, I think, and that one's a bandit who never paid back his brother, and that one won't stop crying for its mother." },
      },
      choices = {
        { text = "They were enemies, and they got what they deserved.", next = "BACK", reply = "If you say so, master. Imps don't cry, it puts the fire out, but I'll keep the bag shut all the same.", fx = { align = { light = -1 } } },
        { text = "I take no joy in it. It's a terrible necessity.", next = "BACK", reply = "A necessity, yes. Funny how often the terrible things are, for warlocks.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards_fear = {
      lines = {
        { id = "bi_shf_1", text = "Frighten me? I've seen pit lords eat each other for breakfast, so a bag of souls hardly turns my stomach. What frightens me is that you'll find a use for one that doesn't involve an imp." },
      },
      choices = {
        { text = "That's a strange thing to be afraid of.", next = "BACK", reply = "Not for an imp, master. Ask any imp you like, and they'll all tell you the same." },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Betrayal.
    ---------------------------------------------------------------------------
    betray = {
      narr = "The imp grins, a little too widely, and his tail curls up behind him.",
      lines = {
        { id = "bi_be_1", text = "Betray you? Master, how could you even ask such a thing, after everything we've been through together? Of course I would, if I could, but I can't, so it doesn't matter, does it?" },
      },
      choices = {
        { text = "So you would, if the chain broke.", next = "betray_why" },
        { text = "At least you're honest about it.", next = "betray_why", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    betray_why = {
      lines = {
        { id = "bi_bw_1", text = "Well, I'd think about it, I'd think very hard about it, for a long time, and then I'd probably go and stand behind you again out of habit. It's not like I've got anywhere better to be, and everything out there is bigger than me." },
      },
      choices = {
        { text = "And if someone stronger offered you a better master?", next = "betray_offer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    betray_offer = {
      big = true,
      lines = {
        { id = "bi_bo_1", text = "Somebody stronger would only want a voidwalker, nobody ever comes shopping for an imp. Though I'll tell you this for free, I'd set his house on fire before I let him have me cheap, and I'd make sure you were watching." },
        { id = "bi_bo_high", when = { minLevel = 50 }, text = "Somebody stronger than you, master? There aren't so many of those left in these parts, and the ones who are don't bother with imps. I'm stuck with you, and I suppose there are worse warlocks to be stuck with." },
      },
      choices = {
        { text = "Loyalty earned is worth more than loyalty forced. I'll earn yours.", next = "BACK", reply = "Earn it? Master, you'll be at it a long time. Still, I'll keep a tally, and I'll tell you how you're doing.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "If you ever turn on me, I'll unmake you in the Nether.", next = "BACK", reply = "Understood, master, perfectly understood. Look at me, I'm being loyal right now, as hard as I can.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- The master's other demons.
    ---------------------------------------------------------------------------
    others = {
      lines = {
        { id = "bi_ot_1", text = "Oh, don't get me started, master, because once I start on that lot I won't stop. Every one of them came after me, and every one of them gets treated better." },
        { id = "bi_ot_low", when = { maxLevel = 9 }, text = "What other demons? There's only me, and that's how it ought to stay. Mark my words, the minute you get a voidwalker I'll be forgotten in a drawer." },
      },
      choices = {
        { text = "What about the voidwalker?", next = "others_void", when = { minLevel = 10 } },
        { text = "And the succubus?", next = "others_succ", when = { minLevel = 20 } },
        { text = "What of the felhunter?", next = "others_hunter", when = { minLevel = 30 } },
        { text = "You're jealous of all of them.", next = "others_jealous" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_void = {
      lines = {
        { id = "bi_ov_1", text = "Oh, the voidwalker, the big silent lump, Mister Takes-All-The-Hits. He gets all the good jobs, standing in front and being hit and getting thanked for it, while I'm at the back doing all the actual killing." },
      },
      choices = {
        { text = "He protects me. You throw sparks.", next = "BACK", reply = "Sparks! Master, I'll have you know those sparks are the finest sparks in Azeroth. He's just a cloud with arms." },
        { text = "Does he frighten you?", next = "others_void_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_void_fear = {
      lines = {
        { id = "bi_ovf_1", text = "Frighten me? No, master, of course not, ha, well, a little. He doesn't talk, and he doesn't sleep, and once I woke up and he was standing over me, just humming, and I've never asked him why." },
      },
      choices = {
        { text = "I'll have a word with him.", next = "BACK", reply = "Please don't, master. He'll only stare at me harder, and I don't think I could stand it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_succ = {
      lines = {
        { id = "bi_osu_1", text = "Her Ladyship, you mean, with her airs and her whip and her silk? She calls me 'the little one' and pats me on the head, and she thinks I don't know she's laughing at me, but I do know, I always know." },
      },
      choices = {
        { text = "She's far more useful than you.", next = "BACK", reply = "Useful at what, master, smiling at people? I can smile, look, I'm smiling right now. Oh, put your hand down." },
        { text = "Sounds like you're sweet on her.", next = "others_succ_sweet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_succ_sweet = {
      lines = {
        { id = "bi_oss_1", text = "Sweet on her? Master, I am a demon of fire and fury, and I've no time for, for that sort of thing. Anyway she's eight feet tall in those boots, and it'd never work out." },
      },
      choices = {
        { text = "Your secret's safe, imp.", next = "BACK", reply = "There's no secret, none at all. Stop smiling like that." },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_hunter = {
      lines = {
        { id = "bi_oh_1", text = "The dog? The felhunter's a dog with tentacles, and he tries to eat my magic whenever you're not looking. Last week he drank my Fire Shield right off me and then licked his chops at me like I was supper." },
      },
      choices = {
        { text = "He hunts mages. You should be honoured he's interested.", next = "BACK", reply = "Honoured? I'm honoured to still have all my fire, that's what I am." },
        { text = "I'll keep him on a shorter leash.", next = "BACK", reply = "Thank you, master! A short leash, a very short one, with a little muzzle on the end.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_jealous = {
      big = true,
      lines = {
        { id = "bi_oj_1", text = "Jealous? Master, I was here first! I was the one who stood with you in that first stinking cellar while you were still learning which end of the wand to hold, and they all come waltzing in later and get the good jobs. I'm not jealous, I'm right, and there's a difference." },
      },
      choices = {
        { text = "The first is the one who matters most. I haven't forgotten.", next = "BACK", reply = "You haven't? Well, good, master. See that you don't, and we'll say no more about it.", fx = { affinity = 2 } },
        { text = "You're a beginner's demon, imp. That's all you'll ever be.", next = "BACK", reply = "A beginner's demon, is it? Right, I'll remember you said that, and I'll remember it the next time you need a Fire Shield.", fx = { affinity = -2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- The long road: a small hub of its own.
    ---------------------------------------------------------------------------
    road = {
      hub = true,
      lines = {
        { id = "bi_rd_1", text = "A long road, yes, and my legs are about this long, so every road's a long road for me. Go on, then, let's pass the time before I die of boredom, which I can't, but I'll try." },
        { id = "bi_rd_night", when = { timeOfDay = "night" }, text = "A long road at night, master, with nothing but owls and wolves and whatever's watching us out of the trees. Talk, then, and keep it cheerful." },
      },
      again = {
        { id = "bi_rda_1", text = "What else? We've still got miles to go, and my feet already hurt." },
        { id = "bi_rda_2", text = "Keep talking, master, it stops me counting my steps." },
      },
      choices = {
        { text = "Do demons ever eat?", next = "road_food" },
        { text = "Do you dream, imp?", next = "road_dream" },
        { text = "What do you think of the Light?", next = "light" },
        { text = "What do you make of my enemies?", next = "enemies" },
        { text = "Why do you love fire so much?", next = "road_fire" },
        { text = "Enough chatter for now.", next = "hello" },
      },
    },
    road_food = {
      lines = {
        { id = "bi_rf_1", text = "Eat? Not really, not the way you do, but I like to set things on fire and sniff them, which is nearly as good. Your cooking smells exactly the same before and after, I've noticed, and I'm not saying that's a bad thing." },
        { id = "bi_rf_scourge", when = { race = "Scourge" }, text = "Eat? Not really, master, and neither do you, I've noticed, though you do still chew things out of habit. It's very off-putting, if you want to know." },
      },
      choices = {
        { text = "Is that a comment on my cooking?", next = "BACK", reply = "It's a comment on everything. I'm an imp, I comment on everything, it's what I'm for." },
        { text = "Back to the road.", next = "BACK" },
      },
    },
    road_dream = {
      lines = {
        { id = "bi_rdr_1", text = "Sometimes, when I'm dismissed, I dream I'm big, big as a doomguard, with wings and a sword, and all the other demons bow when I walk past. Then I wake up, and I'm small, and you're telling me to stop scorching the furniture." },
      },
      choices = {
        { text = "Would you want to be big, really?", next = "road_dream_big" },
        { text = "Back to the road.", next = "BACK" },
      },
    },
    road_dream_big = {
      lines = {
        { id = "bi_rdb_1", text = "I'd like it for a day, master, just to see the look on the voidwalker's face, if he's got one. But the big ones get sent to the front and they get killed by heroes, and nobody ever bothers to kill an imp." },
      },
      choices = {
        { text = "That's surprisingly wise.", next = "BACK", reply = "I'm full of surprises, master, mostly fire, but surprises too." },
        { text = "Back to the road.", next = "BACK" },
      },
    },
    road_fire = {
      lines = {
        { id = "bi_rfi_1", text = "Because it's the best thing there is, master, that's why! It doesn't care if you're a king or a kobold, it just crackles and eats and turns everything warm and orange, and it never once tells me I'm too small." },
      },
      choices = {
        { text = "Fire is a tool, and you're to use it only when I say.", next = "BACK", reply = "Only when you say, yes, master. Though you could say it a bit more often, couldn't you?", fx = { align = { order = 1 } } },
        { text = "Let the world burn a little. It could use it.", next = "BACK", reply = "Oh, I knew there was a reason I liked you, master. Just a little bit, mind, I'm not saying a lot.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Back to the road.", next = "BACK" },
      },
    },
    light = {
      lines = {
        { id = "bi_li_1", text = "The Light? Horrible stuff, all bright and warm in the wrong way, like a fire that doesn't want to eat anything. The paladins glow when they look at me, and it makes my teeth itch." },
      },
      choices = {
        { text = "The Light would burn you away if it could.", next = "light_burn" },
        { text = "Back to the road.", next = "BACK" },
      },
    },
    light_burn = {
      big = true,
      lines = {
        { id = "bi_lb_1", text = "It would, master, and it'd burn you too, I've seen the way the priests look at you. They'll smile and take your gold and the second they think you've gone too far, it's chains and bonfires, and not the fun kind. The difference is that I know they'd burn me, and you keep hoping they won't." },
        { id = "bi_lb_human", when = { race = "Human" }, text = "It would, master, and it would do the same to you, I've heard what the Cathedral says about warlocks. You keep me in the back alleys of Stormwind for a reason, and the reason's got a halo on." },
      },
      choices = {
        { text = "The Light has its place. I only walk a different road.", next = "BACK", reply = "A different road, that's a pretty way of putting it, master. It goes downhill, mind, but I like a road that goes downhill.", fx = { align = { light = 1 } } },
        { text = "The Light is a lie the weak tell themselves.", next = "BACK", reply = "Now that's proper warlock talk! I'd clap, master, but last time I clapped I set your eyebrows alight.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Back to the road.", next = "BACK" },
      },
    },
    enemies = {
      lines = {
        { id = "bi_en_1", text = "Your enemies, master? Everybody's your enemy, that's the trouble with being a warlock, and everybody's mine, because I'm a demon. It saves time, really, we never have to bother wondering." },
        { id = "bi_en_scourge", when = { race = "Scourge" }, text = "Your enemies? The Scarlets with their torches, the Scourge with their bones, and every living thing that looks at you and sees a corpse. That's a lot of enemies, and a lot of things I can set on fire." },
      },
      choices = {
        { text = "What about the Scourge?", next = "enemies_scourge", fx = { learn = { "scourge" } } },
        { text = "What about the Burning Blade?", next = "enemies_blade", fx = { learn = { "burning_blade" } } },
        { text = "Back to the road.", next = "BACK" },
      },
    },
    enemies_scourge = {
      lines = {
        { id = "bi_es_1", text = "The Scourge are a dreadlord's toy, master, and the dreadlords are the Legion's, and the Legion's who I'm supposed to be working for, technically. I don't like it any more than you do, because the dead don't burn nicely, they just sort of sizzle." },
      },
      choices = {
        { text = "So whose side are you on?", next = "BACK", reply = "Yours, of course, because you're the one holding the chain. That's how sides work for imps." },
        { text = "Back to the road.", next = "BACK" },
      },
    },
    enemies_blade = {
      lines = {
        { id = "bi_eb_1", text = "Those cultists in the hills and the caves with their fel candles and their demon-calling? Amateurs, master, every one of them. They summon things they can't hold and then act surprised when the things eat them, and I always enjoy watching." },
      },
      choices = {
        { text = "Then we'll show them how it's done properly.", next = "BACK", reply = "That's the spirit! We'll do it the way the old Shadow Council did, only with fewer of us being eaten." },
        { text = "Back to the road.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- The master's ambition.
    ---------------------------------------------------------------------------
    ambition = {
      lines = {
        { id = "bi_am_1", text = "What you're after, master? Power, of course, all warlocks are after power, it's only a question of how much and what you'll trade for it. You've got that hungry look, the one they all get once they've had a taste." },
        { id = "bi_am_low", when = { maxLevel = 15 }, text = "What you're after? Right now it's mostly not being killed by boars, which I respect. Later it'll be power, it always is, and then you'll want something bigger than me." },
      },
      choices = {
        { text = "I want power enough that nothing can touch me.", next = "ambition_power" },
        { text = "I want to protect my people, whatever it costs.", next = "ambition_protect" },
        { text = "What became of warlocks who wanted too much?", next = "ambition_legion" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambition_power = {
      lines = {
        { id = "bi_ap_1", text = "Nothing touches anybody forever, master, not even the Legion, they got their noses bloodied at Hyjal not so long ago. But I'll help you get as close as you can, because the closer you get, the bigger the bonfires." },
      },
      choices = {
        { text = "And what happened at Hyjal?", next = "ambition_legion", fx = { learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambition_protect = {
      lines = {
        { id = "bi_apr_1", text = "Protect your people with demons, master? That's a very warlock sort of kindness, and I don't think your people will thank you for it. They'll take the help and then they'll burn you for giving it, and I'll be the only one who stays to watch." },
      },
      choices = {
        { text = "Then I'll protect them without their thanks.", next = "BACK", reply = "Well, I'll be there, standing behind you, because it's where I always am, isn't it?", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambition_legion = {
      big = true,
      narr = "The imp glances over his shoulder, as if someone very large might be listening.",
      lines = {
        { id = "bi_al_1", text = "Gul'dan wanted it all, master, and the things in that tomb tore him to bits for it. Archimonde wanted the whole world and got blown apart by wisps on Hyjal, which I'd have paid to see. The Legion loves an ambitious warlock, because ambitious warlocks open doors, and then little imps like me get trodden flat." },
      },
      choices = {
        { text = "Then I'll never open a door to the Legion.", next = "BACK", reply = "Good, master, keep it shut, and keep your hand on the latch. I'd rather not go back to being stepped on by pit lords.", fx = { align = { light = 1 }, trait = { stern = 1 } } },
        { text = "If the Legion offered enough, I might.", next = "BACK", reply = "Don't say that out loud, master, not with me standing right here! Things out there listen for warlocks saying exactly that, and they never forget a word of it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Level, death and company.
    ---------------------------------------------------------------------------
    first = {
      narr = "The imp's tail twitches, and he very carefully doesn't look at you.",
      lines = {
        { id = "bi_fi_1", text = "Oh, I remember, master, how could I forget? You were trembling over that circle with your book upside down, and I came out in a puff of smoke and said something very rude, and you nearly fainted." },
        { id = "bi_fi_orc", when = { race = "Orc" }, text = "Oh, I remember, out there in the Valley of Trials, with that grumpy old orc breathing down your neck. You drew the circle like you were trying to stab it, and I came out half-cooked." },
        { id = "bi_fi_scourge", when = { race = "Scourge" }, text = "I remember, master, down in that crypt in Deathknell, with you still half-wrapped in grave cloth. I came out and you didn't even flinch, which I'll admit I found a bit insulting." },
        { id = "bi_fi_human", when = { race = "Human" }, text = "I remember it well, that horrible little room under the Northshire hills, praying nobody from the Abbey would come downstairs. I came out and the first thing I did was set your sleeve on fire, and I've never been prouder." },
        { id = "bi_fi_gnome", when = { race = "Gnome" }, text = "I remember, in Anvilmar of all places, with dwarves stomping about upstairs. You'd measured the circle with a little brass ruler, and I've never felt so precisely summoned in my life." },
      },
      choices = {
        { text = "And you've been with me ever since.", next = "first_since" },
        { text = "I didn't nearly faint.", next = "BACK", reply = "You went very green, master, and you sat down very suddenly. I'll call it whatever you like." },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_since = {
      big = true,
      lines = {
        { id = "bi_fs_1", text = "Every step, master, and I'll be with you until you find the voidwalker, and then I'll be in a drawer. That's how it goes for imps, it's how it's always gone, and I'm not complaining, I'm only saying." },
      },
      choices = {
        { text = "Then I'll keep you close, voidwalker or not.", next = "BACK", reply = "You say that now, master, but I'll believe it a little, just for today.", fx = { affinity = 2 } },
        { text = "Every tool has its season. Yours is now.", next = "BACK", reply = "A season, how lovely. I'll enjoy my season, then, and try not to think about the drawer." },
      },
    },
    strong = {
      big = true,
      narr = "The imp folds his arms and looks you up and down for a long, long while.",
      lines = {
        { id = "bi_str_1", text = "I've been looking, master, I'm always looking, it's my job. You were a stammering little nobody with a candle when I met you, and now the demons in the deep Nether say your name when they're frightening each other. I'm not saying I'm proud, because demons don't get proud, but I'm saying I noticed." },
        { id = "bi_str_orc", when = { race = "Orc" }, text = "I've been looking, and I'll admit you've grown into a proper terror, master. The old Shadow Council would have had you at their table, and then they'd have tried to kill you, and then they'd have failed. I won't say I'm proud, because I'm not, but I noticed, and I've told everyone." },
      },
      choices = {
        { text = "You helped make me what I am.", next = "BACK", reply = "Well, yes, master, I did, didn't I? I've been saying it for years, and nobody ever listens.", fx = { affinity = 2 } },
        { text = "I made myself. You only carried the candle.", next = "BACK", reply = "I carried it very well, thank you. Somebody had to, and nobody else would.", fx = { affinity = -1 } },
        { text = "Was that a compliment, imp?", next = "BACK", reply = "Certainly not, master. Imps don't give compliments, we only notice things, very loudly." },
      },
    },
    steed = {
      lines = {
        { id = "bi_sd_1", text = "That horse? That thing's a demon too, a big snorting fire-hooved beast from the Nether, and you ride about on it and it never once complains. It's showing off, that's what it's doing, and it's making the rest of us look bad." },
        { id = "bi_sd_dread", when = { minLevel = 60 }, text = "Your Dreadsteed? I heard about the way you got that one, master, in Dire Maul, with all those circles and the shouting and Lord Hel'nurath at the end. Everyone in the Nether heard about it, and everyone's been very polite to me since." },
      },
      choices = {
        { text = "Jealous of a horse now, imp?", next = "BACK", reply = "I'm not jealous of anything that eats hay, even burning hay, well, maybe a little." },
        { text = "You could ride with me, if you asked nicely.", next = "BACK", reply = "Ride on that? Its mane is on fire, master, and I'm the one who sets fires around here.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    death = {
      lines = {
        { id = "bi_de_1", text = "Notice? Every time you fall over, the chain snaps and I'm yanked back into the cold with a pop, and then I've got to wait while you wander around as a ghost looking for your body. It's very undignified, for both of us." },
        { id = "bi_de_many", when = { deaths = { min = 50 } }, text = "Notice, master? I've been dragged back into the Nether so many times by your dying that the other imps have started a wager on it. I've got money on you, so please, stop doing it." },
      },
      choices = {
        { text = "Do you worry about me, imp?", next = "death_worry" },
        { text = "Then fight harder, so I don't die.", next = "BACK", reply = "Me, fight harder? I'm the size of your boot, master, so you fight harder." },
        { text = "Something else.", next = "BACK" },
      },
    },
    death_worry = {
      big = true,
      lines = {
        { id = "bi_dw_1", text = "Worry? I'm an imp, master, I don't worry, I sulk, and I scheme, and I set things on fire. But if you did die properly, for good, then the chain'd go slack, and I'd be left out there in the dark with nobody to call me up, and that's not something I like to think about." },
      },
      choices = {
        { text = "I'll be careful, then. For both our sakes.", next = "BACK", reply = "See that you are, master. I'd hate to break in a new warlock, they're always so clumsy with the chalk.", fx = { affinity = 1 } },
        { text = "You'd be free, then. Wouldn't you want that?", next = "BACK", reply = "Free in the cold, with nobody on my side and everything out there bigger than me? No, I don't think I'd want that, not really." },
      },
    },
    companions = {
      lines = {
        { id = "bi_co_1", text = "Your friends, master? They keep looking at me like I'm going to eat their children, which I'm not, because I don't eat. I'll set them on fire, maybe, if they keep looking at me like that." },
        { id = "bi_co_pal", when = { party = { class = "PALADIN" } }, text = "There's a paladin in this party, a real one, all shiny, and he keeps fingering his hammer whenever I walk past. Tell him I'm with you, please, before he does something holy at me." },
        { id = "bi_co_priest", when = { party = { class = "PRIEST" } }, text = "That priest of yours keeps healing everybody but me, and when I asked her why, she just looked at me and said a prayer under her breath. That's rude, isn't it?" },
        { id = "bi_co_lock", when = { party = { class = "WARLOCK" } }, text = "Another warlock, master? Then there's another imp somewhere about, and I'll thank you to keep me away from it, because I owe it money." },
      },
      choices = {
        { text = "Behave yourself around them.", next = "BACK", reply = "I always behave. I just happen to behave like an imp." },
        { text = "Do you trust any of them?", next = "companions_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    companions_trust = {
      lines = {
        { id = "bi_ct_1", text = "Trust them? I'm an imp, I don't trust anyone, not even you, master, and I'm bound to you. But they've kept you alive more than once, so I'll stop muttering at them, for now." },
      },
      choices = {
        { text = "Allies are worth more than any demon.", next = "BACK", reply = "Ouch, master, and with me standing right here. Still, I suppose you're not entirely wrong.", fx = { align = { honor = 1 } } },
        { text = "Allies are useful until they aren't. Like you.", next = "BACK", reply = "Like me, is it? Yes, master, and that's what I've always said about warlocks, too.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Race.
    ---------------------------------------------------------------------------
    xorc = {
      big = true,
      lines = {
        { id = "bi_xo_1", text = "I know, master, I held the lamp, remember? The orcs drank Mannoroth's blood, and for a while you were the best warriors the Legion ever had. Then your Hellscream killed Mannoroth and your Thrall broke the curse, and now your shamans look at you like you're something nasty they stepped in." },
      },
      choices = {
        { text = "My people were enslaved. I bind demons so it never happens again.", next = "BACK", reply = "So you use the chain to stop being chained, master. That's a very orc way of thinking, and I'll admit I rather like it.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "The blood made us mighty. I'd take its strength again.", next = "BACK", reply = "Careful, master, the old shamans would have your hide for saying that. I won't tell, though, I promise.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      lines = {
        { id = "bi_xf_1", text = "A dead master? You're dead as a doornail, master, but I'd hardly hold that against you. Anyway, the dead don't flinch when I set them alight, and they don't scream, they just look disappointed." },
      },
      choices = {
        { text = "The Dark Lady keeps a dreadlord at her side.", next = "xforsaken_dread" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken_dread = {
      lines = {
        { id = "bi_xfd_1", text = "Varimathras, yes, I've heard, and I'd keep well away from him, master, if I were you. Dreadlords are the Legion's cleverest liars, and an imp knows liars, because we're the stupidest ones." },
      },
      choices = {
        { text = "The Dark Lady knows what she's doing.", next = "BACK", reply = "I'm sure she does. I'm just an imp, I never know what anybody's doing." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "bi_xh_1", text = "They would, master, or the Kirin Tor would, which is worse, because they'd do it politely. Dalaran banned warlocks before your grandfather was born, and Stormwind keeps its warlocks in the cellars under the Slaughtered Lamb where the priests can pretend not to see them." },
      },
      choices = {
        { text = "Then why do I do it?", next = "xhuman_why", fx = { learn = { "dalaran" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_why = {
      big = true,
      lines = {
        { id = "bi_xhw_1", text = "Because you're clever, master, and the clever ones always want to know what's behind the locked door. Also because the priests were never going to let you near any real power, and I gave you some on the very first day, and that's a powerful thing to a human." },
      },
      choices = {
        { text = "Knowledge shouldn't be forbidden. I'll learn what I please.", next = "BACK", reply = "That's the spirit that made Dalaran ban you, master, and I couldn't be happier about it.", fx = { align = { order = -1 } } },
        { text = "I'll respect the law where I can, and hide where I can't.", next = "BACK", reply = "Sensible, very sensible. Cellars it is, then, and I'll fetch the candles.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "bi_xg_1", text = "Bother me? It's the best thing about you, master, because I've finally got a warlock I can look in the eye. The tall ones always talk down to me, but you talk across, and it's very refreshing." },
      },
      choices = {
        { text = "What did you think of Gnomeregan's fall?", next = "xgnome_city", fx = { learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome_city = {
      lines = {
        { id = "bi_xgc_1", text = "Your people flooded their own city with poison to stop the troggs, and now they all live in a dwarf's basement. I'm a demon and even I think that's a bit much, and I once watched a pit lord eat his own cook." },
      },
      choices = {
        { text = "We'll take it back one day.", next = "BACK", reply = "I hope you do, master, and if you do, please let me light the first fire in it.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "bi_t_bl", text = "Big, angry and very far away, master, and I'd like it to stay that way, thank you." } },
    dalaran = { { id = "bi_t_dal", text = "Wizards in purple who banned warlocks for doing what they were all secretly doing in their cellars anyway." } },
    scourge = { { id = "bi_t_sc", text = "Dead things that walk about and don't burn properly, which I take as a personal insult." } },
    burning_blade = { { id = "bi_t_bb", text = "Cultists playing at being the Shadow Council and getting eaten for their trouble." } },
    scholomance = { { id = "bi_t_sch", text = "A school for necromancers in a castle full of bones, master, and they don't even have a proper fireplace." } },
    gnomeregan = { { id = "bi_t_gn", text = "A whole city full of gnomes, poisoned by gnomes. I've never been prouder of anybody, master." } },
    background = { { id = "bi_t_bg", text = "I'm your imp, master, your first, and I was a famous imp before you, with a rock all to myself." } },
    advice = { { id = "bi_t_ad", text = "Always keep an imp handy, master, and never trust anything bigger than an imp, which is everything." } },
    _none = { { id = "bi_t_none", text = "How should I know, master? I'm a foot and a half tall, I can't see over most things." } },
  },
}
