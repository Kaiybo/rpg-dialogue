-- Desolace: Nijel's Point (Alliance, with a neutral Cenarion keeper) and Ghost Walker Post (Horde). Voice: bibles/desolace.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pentigast", id = TODO_NPC("Captain Pentigast"), name = "Captain Pentigast",
  bible = "bibles/desolace.md", role = "soldier", tier = "major",
  communities = { "nijels_point" }, temper = { "calculating" }, values = { "dutiful", "cunning" },
  prejudice = { class = "WARLOCK", amount = 12, why = "Has buried soldiers the Burning Blade sent back to him in pieces." },
  notices = { "kit", "status", "lock_shards", "lock_steed" },

  impression = {
    first = "He plays the centaur clans against each other like cards.",
    third = "{name} met Captain Pentigast, who commands the Stormwind Army's thin garrison at Nijel's Point.",
  },

  greetings = {
    { id = "g_post", text = "Another sword for Nijel's Point, good. I've more ground to hold than men to hold it." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the valley? Which clan did you run into this time?" },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and in that time the Kolkar moved twice and the Gelkis once, so you've some catching up to do. Sit down and I'll show you the map." },
    { id = "g_away_long", when = { away = 60 }, text = "You've been away {away}, and I'd struck you off my list of swords, which I don't do lightly with so few to hold this ridge. I'll gladly write you back on, if you're staying." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown a good deal since we last talked, and I can see it from here. A fighter like you is worth a squad on this ridge, and I mean to use you that way." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone at the Point round to your way of thinking, and I'd like that knack on my side when I next deal with the clans. The Gelkis enjoy a good argument, and the Magram don't." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word on the ridge is that someone caught you in a lie, and I play enough games with the centaur to know what that costs. Lie to them if you must, but don't lie to the people holding this post with you." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I've buried soldiers the Burning Blade sent back to me in pieces, and every one of those cultists started with a summoning circle. Keep your hands where I can see them." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "You'll be watched while you're in my camp. Take that as an order rather than an insult, though I'd not blame you for taking it as both." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've done my garrison more good than harm, which is more than I expected of you. I'm still watching, mind." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you got between two centaur clans. It's an easy mistake, so get patched." },
    { id = "n_stormwind", cat = "status", when = { race = "Human" },
      text = "A face from home. Tell me Stormwind still remembers we're out here." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "That bag of yours clinks like a quartermaster's purse, and it's colder than the wind off the Kodo Graveyard. I'll want to know whose souls those are before you bed down inside my walls." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "That horse is burning the grass at our gate, and it's the only grass in Desolace, so I'll ask you to tether it out on the dust. I'll not have Nijel's Point lose its one green patch to a warlock's mount." },
  },

  start = "hello",
  nodes = {
    dd_dalinda = {
      lines = {
        { id = "dd_dl_default", text = "I did, and I was glad of it. Her family thought her dead, and the Burning Blade would have made her so before long. What do you make of the Blade holding a fortress this close to us, now that you've seen inside it?" },
      },
      choices = {
        { text = "We should storm it and drive them out entirely.", next = "BACK", reply = "With what men? But I agree, and if Stormwind ever sends reinforcements, that's the first place I'll aim them.", fx = { align = { order = -1 } } },
        { text = "Watch them closely. Don't waste men on a siege.", next = "BACK", reply = "That's my thinking too, sadly. We hold what we can and watch the rest, until Stormwind remembers we're out here.", fx = { align = { order = 1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If you could speak of their ancestors in a way they respect, maybe. The Gelkis think the earth belongs to them, and I'd like to see their faces if it answered you instead." } },
      choices = {
        { text = "I won't use the spirits to set the centaur fighting.", next = "BACK", reply = "That's your right, and I'll not force it, but don't be surprised when the clans turn their spears on us instead.", fx = { align = { honor = 1 } } },
        { text = "If it keeps the outpost alive, I'll stir them up.", next = "BACK", reply = "Every arrow the Gelkis loose at the Magram is one that never flies at my ridge, so stir away.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Which clan is moving and which way, mostly, because the Kolkar, the Gelkis and the Magram spend more time watching each other than watching us. If any of their war parties turn our way, I want to hear about it a day before the Point does." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Which clan is moving and which way, mostly, because the Kolkar, the Gelkis and the Magram spend more time watching each other than watching us. Keep {pet} low in the scrub. Centaur scouts know a wild animal from a trained one, and they'll come looking for whoever's holding the leash." },
      },
      choices = {
        { text = "I'll scout them, but I won't help set clan against clan.", next = "BACK", reply = "Fair enough, and I'll take the scouting gladly, because I need to know who's coming even if you won't help me steer them.", fx = { align = { honor = 1 } } },
        { text = "I'll find their weak point, and you can use it.", next = "BACK", reply = "That's what I need, and I'll make good use of it, and my men will live longer for it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior_pg = {
      lines = {
        { id = "wpg_default", text = "Welcome, and don't get comfortable, because there's no line here to hold, only a ridge and a sea of centaur on either side of it. My best warriors are the ones who learned to count before they learned to charge." },
        { id = "wpg_guard", when = { origin = "human_city_guard" },
          text = "City Watch, aren't you? I can tell by the way you check the gate before you check the view. Stormwind sends me plenty of those, and they're the only ones who ever remember to lock anything." },
      },
      choices = {
        { text = "Point me at the Kolkar and I'll charge.", next = "BACK", reply = "Then charge, but count first, because there are more of them than you think and fewer of us than I'd like.", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I can count. Tell me the numbers.", next = "clans", fx = { align = { honor = -1 } } },
      },
    },
    paladin_pg = {
      big = true,
      lines = {
        { id = "ppg_default", text = "I'm sure it does, and I'm sure the Light would rather I had three hundred more men. I don't, so I make the Kolkar and the Gelkis bleed each other, and I pray about it afterwards, when there's time." },
      },
      choices = {
        { text = "Then I'll keep your men alive and leave the scheming to you.", next = "BACK", reply = "That's a fair division of labour, and my men will thank you for it, even if the Light doesn't thank me.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I won't help betray anyone, Captain.", next = "BACK", reply = "Then don't, and I won't ask you to, but my men will still be alive tomorrow because somebody did.", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nelf_pg = {
      lines = {
        { id = "npg_default", text = "They do, and your Sentinels make very sure we know whose trees they are. The Circle's keepers share this ridge with us, and we get on, mostly because they ignore me and I'm careful not to cut anything down." },
      },
      choices = {
        { text = "That's wise of you, Captain.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The alternative is to stand here with a handful of soldiers and wait for the clans to notice us. The Kolkar and the Magram and the Gelkis hate each other more than they hate us, and I mean to keep it that way." } },
      choices = {
        { text = "There's no honor in playing them like cards.", next = "BACK", reply = "There isn't, and I've never pretended there was, but there's a great deal of honour in bringing my men home.", fx = { align = { honor = 1 } } },
        { text = "Let them bleed each other. It saves our soldiers.", next = "BACK", reply = "That's my thinking exactly, and I'll sleep easier knowing someone else sees the arithmetic of it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Plenty, because a single fireball dropped between the Kolkar and the Gelkis at the right moment starts a feud that lasts all season. Better the clans blame each other's shamans than come looking for us, and a little well-placed flame helps them along." } },
      choices = {
        { text = "I'll start no feuds. I fight in the open, Captain.", next = "BACK", reply = "Then fight in the open, and my men will cheer you on from the ridge, but I'll keep my own methods.", fx = { align = { honor = 1 } } },
        { text = "Point me at the right camp and I'll light it.", next = "BACK", reply = "I'll point, you light, and the clans will spend the season blaming each other for the smoke. I could almost enjoy that.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I trust results, and I keep a close eye on how they're got. Thunder Axe Fortress is full of cultists who thought they had their masters on a leash, so if you go down there, mind that whatever you keep doesn't slip while you're watching theirs." },
      },
      choices = {
        { text = "What I keep answers to me. Judge me by what I bring back.", next = "BACK", reply = "Then I'll judge you by it, and if what you bring back is worth having, I'll not ask how you carried it.", fx = { align = { order = -1 } } },
        { text = "I'll keep it leashed and follow your orders, Captain.", next = "BACK", reply = "That's all I ask, and you'll find I'm a fair captain to those who keep their leash short.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_mara = {
      big = true,
      lines = {
        { id = "xcl_mara_default", text = "And motherless children fight each other harder than ever, which suits the Point fine. The Kolkar and Gelkis and Magram all claim her blood one way or another, so every khan in Desolace will be arguing over what her death means, and while they argue, they aren't riding on us." },
      },
      choices = {
        { text = "Make peace while they're shaken, Captain, not more war.", next = "BACK", reply = "Peace with three clans who hate each other? I'd like to see it, but I'd be very surprised.", fx = { align = { honor = 1 } } },
        { text = "Stoke it, then. Let them bleed each other dry.", next = "BACK", reply = "That's the plan, and it's a grim one, but it's the one that keeps my ridge standing.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The centaur all seem to call Theradras their mother.", next = "xcl_mara2" },
      },
    },
    xcl_mara2 = {
      lines = { { id = "xcl_mara2_default", text = "The Gelkis pray to the earth, which is to say to her, and the Magram call the Gelkis fools and claim their father's side of the family instead. I don't much care which of them is right, so long as the question keeps them busy." } },
      choices = {
        { text = "Then I'll let the khans keep arguing, Captain.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_dalinda", tags = { "news" }, when = { questDone = TODO_QUEST("Return to Vahlarriel") },
          text = "Vahlarriel Demonslayer tells me you brought Dalinda Malem out of Thunder Axe Fortress alive. That's the best news this outpost has had in a long while, and I've made sure the men know your name." },
        { id = "h_cl_mara", tags = { "news" }, when = { cleared = "Maraudon", faction = "Alliance" }, text = "My scouts tell me someone went into Maraudon and came out with the princess of the place dead behind them. I'll take any good news out here, but I'll take it twice when it means the centaur lose their holy ground." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. Good, because I need eyes on the centaur camps more than I need another sword, and the Kolkar can smell a soldier a mile off." },
        { id = "h_default", key = true,
          text = "I'm Captain Pentigast, of the Stormwind Army. We're spread thin out here, and the centaur outnumber us, but luckily they hate each other more." },
        { id = "h_clans_resolved", tags = { "news" }, when = { thread = { id = "desolace_clans", state = "resolved" }, faction = "Alliance" },
          text = "Khan Hratha of the Maraudine is dead, I hear, and the clan you rode with is crowing about it from one end of the valley to the other. The Gelkis and the Magram are still at each other, which suits my ridge, though I'll admit it doesn't make for a pleasant report to write." },
        { id = "h_alliance", tags = { "news" }, when = { questActive = TODO_QUEST("Strange Alliance") },
          text = "One of the clans will deal with us, for a price. Pick your partner and earn their trust. We can sort out what we owe them later." },
        { id = "h_politics", when = { questActive = TODO_QUEST("Brutal Politics") },
          text = "Politics out here are brutal: make friends with one clan, then remind them they were never ours. It's ugly work, but necessary." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid of the Circle at Nijel's Point. Keeper Marandis has his own business in Desolace, and I'd be obliged if one of you told me what it is." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, and from the look of you, one who can throw fire farther than my archers can shoot. I won't ask where you studied, so long as you're willing to do it from my ridge." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "I'll be plain with you, since you've a look I've learned to read: the last people out here who trafficked with the Nether were the Burning Blade, and I've buried soldiers they sent to me in pieces." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "There's the Nether on you, and I've learned to read that look. My men will follow you round the Point, and I'll not apologise for it." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You've earned a straight hearing from me, and I don't give those lightly. Go on." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Kolkar", min = 40 } }, text = "The Kolkar have been licking their wounds since you went through their camps, and the other clans have noticed. I'd call that a useful kind of message." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. The centaur hold their ancestors close, and if they see a dwarf calling on the earth, I've no idea whether they'll respect you or come at you twice as hard." },
      },
      again = { { id = "h_again", text = "Anything else? Make it count; the drums are starting." } },
      choices = {
        { text = "You heard about Dalinda Malem, Captain?", next = "dd_dalinda", when = { questDone = TODO_QUEST("Return to Vahlarriel") } },
        { text = "Must you set the centaur clans against each other, Captain?", next = "druid_q", when = { class = "DRUID" } },
        { text = "So you play the clans against each other.", next = "clans" },
        { text = "Why is Stormwind even out here?", next = "stakes" },
        { text = "Who's who at the Point?", next = "point" },
        { text = "Stormwind remembers you, Captain.", next = "home", when = { race = "Human" } },
        { text = "I could handle the betraying part.", next = "rogue", when = { class = "ROGUE" } },
        { text = "What do you make of Brother Anton?", next = "anton", when = { heardLine = "anton.h_default" } },
        { text = "Your men need a chaplain, Captain.", next = "priest_chaplain", when = { class = "PRIEST" } },
        { text = "Another blade for the Point, Captain.", next = "warrior_pg", when = { class = "WARRIOR" } },
        { text = "Betraying a clan sits ill with the Light.", next = "paladin_pg", when = { class = "PALADIN" } },
        { text = "Stormwind's soldiers march through our forests to get here.", next = "nelf_pg", when = { race = "NightElf" } },
        { text = "I can't think Nijel's Point has much use for a mage, Captain.", next = "xmage", when = { class = "MAGE" } },
        { text = "Will you trust me on your ridge, Captain, whatever you've guessed?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'd guess you want the centaur camps scouted, Captain.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Could a shaman help you play the centaur against each other?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Maraudon's princess is dead, Captain. The centaur lost their mother.", next = "xcl_mara", when = { cleared = "Maraudon", faction = "Alliance" } },
        { text = "I'll help hold the Point.", next = "END", fx = { affinity = 1, standing = { nijels_point = 1 } } },
      },
    },
    clans = {
      big = true,
      lines = {
        { id = "c_default", text = "Kolkar, Magram, Gelkis: three clans, three grudges, one valley. If they spend their arrows on each other, they don't spend them on us, and that suits me better than a war I can't win." },
      },
      choices = {
        { text = "Clever.", next = "BACK", reply = "It is, and it's kept my men alive this long, which is the only kind of clever that matters out here.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Turning them on each other is a coward's way to win.", next = "BACK", reply = "Maybe so, but the cowards are still breathing on my ridge, and the brave ones are buried in the pass.", fx = { align = { honor = 1 } } },
        { text = "And when they find out?", next = "clans_after" },
      },
    },
    clans_after = {
      lines = { { id = "ca_default", text = "Then I'll be the most hated man in Desolace, and still alive. I've been both of those before, separately." } },
      choices = {
        { text = "There has to be an honest way.", next = "BACK", reply = "If there is, I'd love to hear it, and I'll gladly try it the moment someone shows me how.", fx = { affinity = -1, align = { honor = 2 } } },
        { text = "Honesty won't keep your men alive out here.", next = "BACK", reply = "No, it won't, and I've buried enough honest men to know it.", fx = { align = { honor = -2 } } },
        { text = "You don't like it any more than I do, Captain.", tag = "Persuade", next = "arithmetic",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { trait = "cautious" } } } },
          fail = { next = "arithmetic_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stakes = {
      lines = { { id = "s_default", text = "Because if we're not, someone else is. A foothold in Desolace is a road between Stonetalon and Feralas, and roads matter, even ones through dust." } },
      choices = {
        { text = "Does Stormwind send you what you need?", next = "stakes_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stakes_help = {
      lines = { { id = "sh_default", text = "Stormwind sends orders. Supplies come when the road's clear and the sea's calm, which is rarely both, so we make do, and making do is most of soldiering." } },
      choices = {
        { text = "Whose orders, these days? The Regent's, or the court's?", next = "court_op" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court_op = {
      lines = { { id = "ct_default", text = "Officially Lord Fordragon's, and he's a good soldier. But word from home says Lady Prestor has the court's ear these days, and orders come back stranger than they went out, so you tell me, since you've seen Stormwind more recently than I have: what do you make of it?" } },
      choices = {
        { text = "Bolvar's a soldier's soldier. I'd follow him anywhere.", next = "ct_bolvar", fx = { affinity = 1, align = { order = 1 }, opinion = { bolvar = "trust" } } },
        { text = "Lady Prestor has too much sway over the boy king.", next = "ct_prestor", fx = { affinity = 2, align = { order = -1 }, opinion = { prestor = "distrust" } } },
        { text = "Stormwind needs King Varian back, not regents.", next = "ct_varian", fx = { opinion = { varian = "return" } } },
        { text = "The nobles cheated the masons. The court's rotten.", next = "ct_rotten", when = { race = "Human" }, fx = { opinion = { stormwind = "corrupt" } } },
        { text = "I keep out of court business, Captain.", next = "BACK" },
      },
    },
    ct_bolvar = {
      lines = { { id = "ctb_default", text = "So would I, and so would every man on this ridge. I only wish his orders reached us the way he wrote them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ct_prestor = {
      lines = { { id = "ctp_default", text = "Careful, that's a noble you're talking about, and nobles have long ears. But I'll admit I've thought it on a cold night or two." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ct_varian = {
      lines = { { id = "ctv_default", text = "Wherever he is. A king who vanishes on the way to a peace parley leaves a hole that regents can't fill, however hard they try." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ct_rotten = {
      lines = { { id = "ctr_default", text = "The masons' business is ugly, and I've a few of their cousins under my command who'd agree with you. Say it quietly, though, because I have to keep taking those orders." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    point = {
      lines = { { id = "p_default", text = "Keeper Marandis and his dryads are here on the Circle's business, Kreldig Ungor on the Reclaimers', and Brother Anton on the Scarlet Crusade's. I'm here on everyone's." } },
      choices = {
        { text = "The keeper seems to have business of his own out here.", next = "point_keeper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    point_keeper = {
      lines = { { id = "pk_default", text = "Something under the earth, south of here. He won't say more to me, and I've stopped asking. A man who brings his own dryads doesn't need my help." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    home = {
      lines = { { id = "h2_default", text = "Do they? Then tell them we've had dust for supper three nights running and nobody's deserted. Tell them it's a miracle, because it is." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    rogue = {
      lines = { { id = "r_default", text = "I don't doubt it, and that's exactly why I'll be watching you while you do it. No offence; it's the job." } },
      choices = {
        { text = "None taken.", next = "BACK", reply = "We'll get along, then, and you'll understand when I still check the gate after you've passed.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Watch all you like, because I've nothing to hide.", next = "BACK", reply = "Then you'll not mind me watching, and I'll not mind being wrong about you.", fx = { align = { honor = 1 } } },
      },
    },
    anton = {
      lines = { { id = "a_default", text = "He's earnest, brave and very sure of things a long way from here. I don't argue with him; I'd rather he kept his faith than lost it in my camp." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    priest_chaplain = {
      lines = { { id = "pch_default", text = "They need a chaplain, a cook and forty more swords, and I'll take the chaplain. Brother Anton prays, but only for the Crusade. My men would like someone to pray for them." } },
      choices = {
        { text = "I'll pray for them.", next = "BACK", reply = "Then you'll do more for this camp than the Crusade ever has, and I'm grateful for it. Pray for the lads on the walls first, because they're the ones who'll need it soonest.", fx = { affinity = 3, standing = { nijels_point = 2 }, align = { light = 1 } } },
        { text = "Your men need swords more than they need prayers.", next = "BACK", reply = "Maybe they do, but I can't conjure forty swords, and a chaplain is something I can actually get.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arithmetic = {
      lines = {
        { id = "ar_default", text = "No, I don't, and I'll thank you not to tell the men. I call it arithmetic, forty soldiers against three clans, and the arithmetic is right, but I don't sleep the night after I break faith with a clan, and I've stopped expecting to." },
        { id = "ar_priest", when = { class = "PRIEST" },
          text = "You'd make a decent chaplain, getting that out of me. I call it arithmetic, forty soldiers against three clans, and the sums are right, but the night after I break faith with a clan I don't sleep, and I've stopped expecting to." },
      },
      choices = {
        { text = "That's what keeps you honest.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arithmetic_no = {
      lines = {
        { id = "ano_default", text = "What I like doesn't come into it; the orders and the odds do. Ask me something useful." },
        { id = "ano_rogue", when = { class = "ROGUE" },
          text = "Looking for a soft spot, are you? I did say I'd be watching you, so ask me something useful." },
      },
      choices = {
        { text = "Useful questions only, then, Captain.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "That's decent of you, and it's more than I get from Stormwind in a year of dispatches. I'll take it, and gladly." },
        { id = "s2", text = "Well, someone's noticed that the Point is still standing. Thank you; I'll pass that along to the men, who've earned it more than I have." },
      },
      fail = {
        { id = "f1", text = "I've served under officers who were promoted on that sort of talk, and I buried the men they commanded. Leave it out when you speak to me." },
        { id = "f2", text = "Flattery's a tactic like any other, and I can see the flank you're working toward. Tell me what you want, and save us both the manoeuvre." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! That's the first honest insult I've had since I was posted here, and I rather enjoyed it. You'd do well in a mess hall." },
        { id = "s2", text = "You've cheek, and you've the nerve to use it on a captain. I can work with nerve, since it's in short supply out in this dust." },
      },
      fail = {
        { id = "f1", text = "I've been sneered at by nobles in Stormwind who never held a wall in their lives. You're in poor company, and you'll keep a civil tongue at my post." },
        { id = "f2", text = "Mock the garrison again and you can find your own way through the centaur. I've no time for it." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "All right, I take your meaning, and I'm not too proud to say it's a persuasive one. I'd sooner have you with the Point than against it." },
        { id = "s2", text = "I weigh threats for a living, and I've just moved you up the list. Let's keep this civil, shall we?" },
      },
      fail = {
        { id = "f1", text = "I've five centaur clans and a valley full of demons trying to frighten me, so you'll have to wait your turn. Stand down." },
        { id = "f2", text = "Threatening an officer of Stormwind at his own post is a poor piece of judgment. I'll overlook it once, because I'm short of swords." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "The Gelkis and the Magram would sooner kill each other than us, and Nijel's Point lives on that hate. If they ever made peace, we'd be gone within the week." },
    { id = "bl2", text = "The centaur say something called Theradras lives beneath Maraudon, the earth spirit who killed their father. Whatever she is, she's poisoning the valley around it." },
    { id = "bl3", text = "The Burning Blade's warlocks keep their circles inside Thunder Axe Fortress in the north, and that's where their demons come from." },
  },
  confides = {
    { id = "cnf_1", text = "The Gelkis and the Magram both send scouts to the cliffs above Nijel's Point at dawn to see which way our patrols ride, so I send the morning patrol the wrong way on purpose." },
    { id = "cnf_2", text = "There's a dry gully running south from Nijel's Point that the centaur never patrol, and it'll get you most of the way to the Kodo Graveyard unseen." },
    { id = "cnf_3", text = "The Burning Blade trade with the Magram for bones, and they make the exchange at night on the edge of the Valley of Bones." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "You've cost me more than you've given, and I keep a careful count. That's my problem with you." },
      { id = "gv_prejud", when = { grudge = { worst = "prejudice" } }, text = "I've buried soldiers the Burning Blade sent back to me in pieces, and you practise the same craft. I'm not inclined to make exceptions." },
      { id = "gv_enemy", when = { grudge = "enemy" }, text = "You wear the Horde's colours in a Stormwind garrison. I'd have you watched even if you'd done nothing, and you've done something." },
      { id = "gv_values", when = { grudge = "values" }, text = "You play everyone false and call it cleverness. I do the same, but I do it for Stormwind, and you do it for yourself." },
    },
    amends = {
      { id = "am1", text = "Help me keep the centaur busy with each other and the Burning Blade busy with their graves. Then we'll see." },
      { id = "am_prejud", when = { grudge = "prejudice" }, text = "Kill the Burning Blade at Thunder Axe Fortress and bring me proof. That's the only sort of warlock I've ever liked." },
    },
    spite = {
      { id = "sp1", text = "I think you're a card I'd play once and then throw away. Don't mistake that for a compliment." },
      { id = "sp_enemy", when = { grudge = "enemy" }, text = "I think Ghost Walker Post sent you to count my soldiers. Go and tell Takata there are more than he'd like." },
    },
    _gated = {
      { id = "gt1", text = "That's not something I discuss with anyone I haven't taken the measure of. Do some work for the Point, and we'll speak again." },
      { id = "gt2", text = "I know the answer, and I'm keeping it. Out here I'm careful about who learns what." },
    },
    knows = {
      { id = "tp_knows", text = "Keeping three clans at each other's throats means knowing what each one is up to. Ask, and I'll tell you what's safe to tell." },
    },
    background = { { id = "tp_ba", text = "I'm Stormwind Army, with a long string of postings nobody else wanted. This is the dustiest, though it isn't the worst." } },
    advice = { { id = "tp_ad", text = "Never let a centaur clan see you leaving another clan's camp. Leave by the back; there's always a back." } },
    cenarion_circle = { { id = "tp_circle", text = "Keeper Marandis is on his own errand. I don't ask and he doesn't explain, and we get along." } },
    centaur = { { id = "tp_centaur", text = "There are five centaur clans in Desolace, and if they ever stopped hating each other for a week, Nijel's Point would be gone. I spend my days making sure that week never comes." } },
    maraudon = { { id = "tp_maraudon", text = "The centaur call Maraudon a holy place, the tomb of their father, and something down there is poisoning the valley around it. I'd rather it stayed their problem, though I doubt it will." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord writes to say Stormwind has no troops to spare, and he writes it politely. I'd rather he wrote less politely and sent more men." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor's office signs off on our supply requests, eventually, and with very elegant handwriting. I've never seen a lady take so long to approve so little." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Blade are bargaining with demons in Thunder Axe Fortress, and I've no soldiers to spare for it. If a real demon ever walks out of that place, we'll have far worse than centaur to worry about." } },
    thrall = { { id = "tp_thrall", text = "The orcs at Shadowprey Village keep to their coast and I keep to my mountain, which suits us both. Their warchief signed a peace with Theramore, but I don't see it written on any Kolkar spear." } },
    scourge = { { id = "tp_scourge", text = "There are dead walking in the Valley of Bones, raised by the Magram, and the Scarlet Crusade has sent zealots after them. I've no love for either, and I'm short of men to spare." } },
    _none = { { id = "tp_none", text = "Not in my orders. Ask Kreldig; the Reclaimers poke into everything." } },
    regard = {
      { id = "rg_1", text = "You get things done without making noise about it, and you know when to keep your mouth shut. That makes you more useful to me than half my garrison." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You've done Nijel's Point more good than the last three reinforcements Stormwind promised me. I wrote as much in my last report, for whatever that's worth." },
      { id = "rg_values", when = { fondness = "values" }, text = "You think before you act, and you think a step or two further than most. I like that in a soldier, and I like it more in a friend." },
      { id = "rg_cunning", when = { fondness = "alignment", alignment = { axis = "honor", max = -30 } }, text = "You understand that honour won't feed a garrison or hold up a wall, {name}. Out here that isn't cynicism, it's arithmetic." },
    },
    confide = {
      { id = "cf_1", text = "Stormwind sent me here because I embarrassed a lord at a staff meeting, and I've never regretted it. Desolace is dry and miserable, but nobody here pretends otherwise." },
      { id = "cf_2", text = "Now and then I let word slip to the Kolkar of where the Gelkis are camped, so the Gelkis stay too busy to look our way. It's not the sort of thing I'd put in a report, but it works." },
    },
    trust = {
      { id = "tr_1", text = "Trust Kreldig and the Reclaimers to tell you what they've found, if not always where. They're dwarves, so they lie about treasure and nothing else." },
      { id = "tr_2", text = "Trust no centaur clan's promise for longer than it takes them to find a better one. That isn't prejudice; it's every report I've ever filed." },
    },
    watchout = {
      { id = "wo_1", text = "Never ride through the Valley of Bones at night, because the Magram raise what's buried there and send it walking. My scouts learned that the hard way, and I'd rather you didn't." },
      { id = "wo_2", text = "Watch the satyrs at Thunder Axe Fortress, and watch the orcs with them even more closely. A demon you can see is less dangerous than a man who'll sell you to one." },
    },
    worries = {
      { id = "wy_1", text = "I've got half the soldiers Nijel's Point needs and a wall that's older than I am. If the centaur ever stopped fighting one another, I'd have about a day to decide what to save." },
      { id = "wy_2", text = "Whatever is poisoning the valley around Maraudon is spreading slowly, the way a thing does when it means to stay. I worry I'll be ordered to hold this post long after it's sensible." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to see a full company march up from Feralas one day with orders to relieve me. I'd hand over the post with a smile and a list of every centaur grudge worth knowing." },
      { id = "hp_2", text = "I hope to retire to a farm in Elwynn and never see sand again. I won't, but a soldier is allowed one foolish hope." },
    },
    favor = {
      { id = "fv_1", text = "If you pass a Gelkis camp, keep your ears open and tell me what they're saying about the Magram. A little news at the right moment is worth a squad to me." },
      { id = "fv_2", text = "Next time you're in Stormwind, mention Nijel's Point to anyone in uniform who'll listen. Somebody up there has to remember we exist." },
    },
    friendship = {
      { id = "fr_1", text = "I suppose I do, which is unusual for me. In my line of work friends are a liability, and I've decided you're one I can afford." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You've done more for Nijel's Point than Stormwind has, and you never asked for a commission. That's a friend by any soldier's reckoning." },
    },
    never_told = {
      { id = "nt_1", text = "I lost a whole patrol my first season here because I trusted a Magram scout who swore the road was clear. I've played the clans against each other ever since, and I've never trusted one again." },
      { id = "nt_2", text = "I write to my sister in Goldshire every month and tell her Desolace is a quiet post with a lovely view. She believes me, and I'd like it to stay that way." },
    },
  },
}

P:NPC {
  key = "marandis", id = TODO_NPC("Keeper Marandis"), name = "Keeper Marandis",
  bible = "bibles/desolace.md", role = "noble", tier = "quest",
  communities = { "nijels_point" }, temper = { "formal" }, values = { "proud", "devout" },
  prejudice = { class = "WARLOCK", amount = 12, why = "Cenarion keeper; to her every warlock carries the Legion's corruption toward the grove." },
  notices = { "class", "form", "lock_taint" },

  impression = {
    first = "Whatever brought him down from Stonetalon, he considers it far from small.",
    third = "{name} met Keeper Marandis of the Cenarion Circle, who keeps the grove at Nijel's Point.",
  },

  greetings = {
    { id = "g_keeper", text = "You stand before a keeper of the grove, under Elune's eye. Speak carefully; my time is the Circle's, not mine." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "The Legion burned my people's forests with the very fire you carry. Speak from where you stand, and come no nearer to the grove." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I will not call you welcome here, and I will not pretend to. Say what you must, and then go." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You have kept your fel away from my grove for a long while now. That does not make us friends, but I will hear you without bracing for the worst." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you know what the Circle asks of its servants, and perhaps one day it will ask more of you." },
    { id = "n_lock_taint", cat = "lock_taint", when = { taint = { min = 30 } },
      text = "I can smell it on you, the fel that soaks the ground around the Mannoroc Coven, and it is in your blood now as well. The land there is still dying, and I fear you carry it the way that ground does, deeper than you know." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "You wear the bear with some dignity, which is good. Keep it when you take your own shape again." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The Circle welcomes any who keep the balance. Desolace has none left, and the spirits here are as sick as the land, so if you can feel them, you'll understand why my sisters and I came." } },
      choices = {
        { text = "Then I'll help restore the balance here, Keeper.", next = "BACK", reply = "The Circle will welcome you, and the land, I think, will notice, even if it cannot thank you.", fx = { align = { light = 1 } } },
        { text = "Desolace is dead. Balance is a luxury it can't afford.", next = "BACK", reply = "Many say so, and perhaps they are right, but my sisters and I came here believing otherwise.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Circle would tell you that nature defends itself, and in a greener place I would agree. Here the satyrs foul the land faster than we can cleanse it, and I will not tell you that the Circle's patience has kept a single one of my sisters safe." } },
      choices = {
        { text = "Then I'll guard your sisters while the Circle does its work.", next = "BACK", reply = "My sisters will be glad of you. The satyrs come at dusk, mostly, and they come from the east.", fx = { align = { order = 1 } } },
        { text = "Patience cleanses nothing. I'll cut the satyrs out myself.", next = "BACK", reply = "Perhaps it does not, and I cannot fault your anger, but the land will remember the blade as well as the satyr.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_md = {
      lines = {
        { id = "hmd_default", text = "Wrong is a kind word for it. The earth here is poisoned from below, and what grazes on it sickens, and what hunts what grazes sickens after; you may be the first to notice, because you are the last link in that chain." },
      },
      choices = {
        { text = "Then I'll hunt only what's already dying.", next = "BACK", reply = "That is a hunter's mercy, and the land will be grateful for it, in whatever way it can.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A hunter eats what's there, sick or not.", next = "BACK", reply = "Then eat it, but watch for the sickness, because it does not stay in the meat.", fx = { align = { order = -1 } } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "We distrust carelessness, and arcane power has always invited it, as the Well of Eternity taught us at a terrible price. The earth of Desolace was poisoned long ago, and I would not have a young mage add a new wound while the old ones are still weeping." } },
      choices = {
        { text = "Magic is a tool like any other. The fault is in the hand.", next = "BACK", reply = "So the Highborne said, and the hands were very sure of themselves, right up until the Well drowned them.", fx = { align = { light = -1 } } },
        { text = "Then I'll tread lightly and wield my power with care.", next = "BACK", reply = "Then you are welcome in my grove, and I will be glad of a mage who understands what the land has suffered.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "May I ask about something else?", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because I have walked the corrupted ground around the Mannoroc Coven, where nothing grows straight even now. Whatever pact you have made, the land pays for it sooner or later, even if you never see the bill." }, { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because I have walked the corrupted ground around the Mannoroc Coven, and the thing beside you smells of it, the same burnt air that has hung over that valley since the Legion came. Whatever pact you have made, the land pays for it sooner or later, even if you never see the bill." } },
      choices = {
        { text = "I'll turn it against the demons themselves. It's a weapon.", next = "BACK", reply = "The fel is a weapon that cuts both ways, and I have seen the ground it leaves behind, so please be careful.", fx = { align = { light = -1 } } },
        { text = "You're right to be wary. I'll keep what I carry away from the green.", next = "BACK", reply = "Thank you, and the green will thank you, though it cannot speak, and I will speak for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let us speak of something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The Light mends what lives, and very little lives here, so I would not ask it to mend the ground itself. The Circle believes Desolace is not dead but sleeping badly, and that its healing will be slow, patient work that outlasts us both." } },
      choices = {
        { text = "The Light can reach even here, Keeper. I'll prove it.", next = "BACK", reply = "Prove it, then, and I will be glad. I have long hoped the Light and the land could work together here, and so far I have only hoped.", fx = { align = { light = 1 } } },
        { text = "Some places are past saving. Spend the effort where it counts.", next = "BACK", reply = "Perhaps they are. But I have watched one green shoot come up through the grey dust near Nijel's Point, and I am not ready to stop watering it.", fx = { align = { light = -1 } } },
        { text = "Something else, Keeper.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "There is corruption, certainly, among the demons of Mannoroc Coven and the Burning Blade at Thunder Axe Fortress. The Circle would ask you to judge each thing you meet with care, because not everything frightening in Desolace is wicked." } },
      choices = {
        { text = "Evil hiding in the wilds must be rooted out by force.", next = "BACK", reply = "Some of it, yes, but please judge carefully, because not everything strange here is evil.", fx = { align = { order = 1 } } },
        { text = "The wild has its own balance. I'll tread carefully.", next = "BACK", reply = "Thank you, that is all the Circle asks, and more than most who walk through here give us.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Perhaps. The Gelkis and the Magram both send scouts close to our camp, and I would know which clan watches us, and why, before either decides we are worth the trouble. A druid in the shape of a cat can do it, but my sisters are few and Desolace is wide." } },
      choices = {
        { text = "I'll watch them for you, and tell you only the truth.", next = "BACK", reply = "Thank you, and I will trust what you tell me, because the Circle needs truth more than it needs comfort.", fx = { align = { order = 1 } } },
        { text = "I'll watch them, but I'll decide what you need to know.", next = "BACK", reply = "Then decide wisely, because the Circle will act on what you tell us, and it will not know what you kept back.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xcl_mara = {
      big = true,
      lines = {
        { id = "xcl_mara_default", text = "Zaetar's spirit is free, then, after all those ages bound in the stone beside the one who loved him. My sisters and I have watched over that place since we came down from Stonetalon, and I will tell you plainly that I did not expect to see the day the Circle could set down that grief." },
      },
      choices = {
        { text = "The Circle should guard Maraudon now, so nothing takes her place.", next = "BACK", reply = "You are right, and I have already asked Moonglade to send keepers, though they are slow to answer.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the place be. The Circle can't wall off every cave.", next = "BACK", reply = "Perhaps not, but this one held a princess of the earth, and I would not leave it empty for long.", fx = { align = { order = -1 } } },
        { text = "What becomes of the centaur, now that she's gone?", next = "xcl_mara2" },
      },
    },
    xcl_mara2 = {
      lines = { { id = "xcl_mara2_default", text = "They remain what they are, the children of a murder, and her death will not soften them overnight. The Circle teaches that every wound may close, though, and I am bound to believe even this one will, whether or not I live to see it." } },
      choices = {
        { text = "Then I'll hope alongside you, Keeper.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_mara", tags = { "news" }, when = { cleared = "Maraudon" }, text = "The earth beneath Desolace has stopped trembling the way it trembled when she was angry. You went down to the heart of Maraudon, and the Circle will remember it, whatever the centaur say of you." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. The Circle has little need of blades, though in Desolace I have learned that need and preference are seldom the same thing." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light, so far from the cathedrals. The Circle does not pray as you do, but we tend the same wounded world, and Desolace has more wounds than either of us can count." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the Silver Hand, here among the centaur and the dust. I hope you have come to protect this land and not only to fight upon it, because Desolace has had more than enough of fighting." },
        { id = "h_default", key = true,
          text = "I am Keeper Marandis, of the Cenarion Circle. My sisters and I came down from Stonetalon on the Circle's business, and it is not small business." },
        { id = "h_corruption", tags = { "news" }, when = { questActive = TODO_QUEST("Corruption of Earth and Seed") },
          text = "The earth here is sick at its root. Bring me proof of what's poisoning it, for the Circle must know." },
        { id = "h_strong", when = { minLevel = 45 },
          text = "You've grown strong, so hear it: a princess of the earth, Theradras, holds the body of one dear to the Circle, and we mean to take it back." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "You smell of the arcane, and my people remember where that scent led the Highborne. Still, you came to the Circle's camp openly, so I will speak with you." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Something clings to you as smoke clings to cloth, and I can smell it from across the clearing. Say what you have come to say, and do not call anything here." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I know the stench of the Burning Legion's craft, and it is on you. Do not call anything into this clearing while I live." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You have never once broken your word in this clearing. I still mistrust what you are, but I will speak with you." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You came into the clearing without a sound, and the birds did not stir. That is a gift the Circle respects, though I would know what you meant to do with it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. The Circle has spoken with tauren who hear the elements for a long time, but I did not expect to hear the earth answer one of Ironforge." },
      },
      again = { { id = "h_again", text = "You have another question; ask it plainly, as Malfurion's students are taught to." } },
      choices = {
        { text = "What business brings the Circle here?", next = "mission" },
        { text = "The earth here feels sick underfoot.", next = "earth" },
        { text = "Who travels with you, Keeper?", next = "sisters" },
        { text = "The Circle asks more of me. How do I answer?", next = "druid", when = { class = "DRUID" } },
        { text = "Tell me of Theradras.", next = "theradras", when = { minLevel = 45 } },
        { text = "I hunt these lands. The beasts are wrong here.", next = "hunter_md", when = { class = "HUNTER" } },
        { text = "Do the keepers distrust all mages, Keeper?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why does that smell trouble you so much, Keeper?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Can the Light do anything for a land this broken?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "There must be evil here that a paladin should root out, Keeper.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Cenarion Circle ever need a warrior, Keeper?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "The Circle might have use for someone who walks unseen, Keeper.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does the Circle welcome a dwarf shaman, Keeper?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Theradras is dead, Keeper. What she held is free.", next = "xcl_mara", when = { cleared = "Maraudon" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    mission = {
      lines = { { id = "m_default", text = "Ask me again when you've grown, for the Circle's business is not for apprentices. No offense is meant." } },
      choices = {
        { text = "Some taken.", next = "BACK", fx = { affinity = -1 } },
        { text = "I understand.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } },
      },
    },
    earth = {
      lines = { { id = "e_default", text = "Something below sours it. The roots go grey, the water goes bitter, and the valley remembers nothing green. It has been so a long time, but it need not stay so." } },
      choices = {
        { text = "Can it be healed?", next = "earth_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    earth_heal = {
      lines = { { id = "eh_default", text = "Everything can be healed, given time, and the Circle has time. It is the people of Desolace who do not." } },
      choices = {
        { text = "Then the land comes first, and the people must wait.", next = "BACK", reply = "That is the Circle's way, and I hold to it, though I see the cost of it in every face that passes.", fx = { align = { order = -1 } } },
        { text = "The people can't wait, so heal them first and the land after.", next = "BACK", reply = "You speak with a mortal's urgency, and perhaps you are right, but a healed people on dead land will not stay healed.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sisters = {
      lines = { { id = "s_default", text = "My sisters, the dryads of my grove. They walk where I cannot and see what I would rather not. Do not stare at them; they find it tiresome." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Patiently. The Circle asks slowly, and expects you to answer slowly. Those who hurry are the ones it stops asking." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    theradras = {
      big = true,
      lines = { { id = "t_default", text = "A daughter of the earth, and its shame. She dwells below, in Maraudon, and what she holds there is not hers to keep. When you are ready, the Circle will ask." } },
      choices = { { text = "I'll be ready.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Circle's business is mine to know, and some of it I may share. Ask, and I will answer as I am able." },
    },
    background = { { id = "tp_ba", text = "I am a keeper of the grove, sworn to the Circle. What I was before that does not matter to the work." } },
    advice = { { id = "tp_ad", text = "Watch where the grass will not grow. The land is telling you where not to sleep." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle sees further than any one keeper. I see as far as Desolace, and it is far enough to worry." } },
    maraudon = { { id = "tp_maraudon", text = "Maraudon is where Zaetar, son of Cenarius, lies buried, with Theradras the earth princess watching over him, and something foul has grown in the tomb. The Circle watches it with great concern and very little help." } },
    centaur = { { id = "tp_centaur", text = "The centaur are the children of Zaetar and Theradras, a son of Cenarius and a princess of earth, and they despise any reminder of it. They are, in a sense, our cousins, which the Circle finds very uncomfortable." } },
    malfurion = { { id = "tp_malfurion", text = "Malfurion taught the first druids, and his sleep in the Dream has outlasted most of our lives. We keep his teachings in good order, so that he will find them so." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream is the world as it was meant to be, and druids walk there in their sleep. Something there troubles our elders lately, though I am not permitted to say what." } },
    green_dragons = { { id = "tp_green_dragons", text = "The green dragons are Ysera's children and the Dream's guardians, and we respect them as such. Lately they are quick to anger, and the Circle would very much like to know why." } },
    _none = { { id = "tp_none", text = "That does not concern the Circle, so it does not concern me. The Dream keeps its own counsel on such things." } },
  },
}

P:NPC {
  key = "kreldig", id = TODO_NPC("Kreldig Ungor"), name = "Kreldig Ungor",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  communities = { "nijels_point" }, temper = { "busy" }, values = { "practical", "friendly" },
  notices = { "craft", "lock_shards" },

  impression = {
    first = "He is prouder of a patched kettle than of anything else.",
    third = "{name} met Kreldig Ungor, the busy dwarf who runs Reclaimers Inc.'s business out of Nijel's Point.",
  },

  greetings = {
    { id = "g_busy", text = "Got a lot on out here, friend. Wrecks to pick, reagents to fetch, an' only the one of me." },
    { id = "g_away", when = { away = 14 }, text = "Well, look who's back! Ye've been gone {away}, an' I've picked three new wrecks clean that ye missed, so ye'll have tae make do wi' the stories." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk round the Point say ye've been doin' right by us, an' I'm glad tae hear it, because there's no' many as bother. Ye're welcome at my stall whenever ye like." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear ye've a silver tongue, friend, an' someone at the Point swallowed every word ye said. Mind ye don't try it on old Kreldig, because I've haggled wi' the Reclaimers an' lived." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering", "Mining" } },
      text = "Good with yer hands, are ye? The Reclaimers are always hirin' folk who know salvage from scrap." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "Ye've shards in yer pack, I can hear 'em hummin' from here, an' my lantern's gone dim to match. I'll thank ye to set the bag outside the door while we talk." },
  },

  start = "hello",
  nodes = {
    dw_finds = {
      lines = {
        { id = "dw_finds_default", text = "Now an' then, an' it always makes me homesick. A Dark Iron blade in a centaur camp, an Ironforge rifle on a dead Burning Blade cultist. Dwarves get everywhere, an' so does what we make, which is why I never run out o' stock." },
      },
      choices = {
        { text = "Those things should go back to their clans.", next = "BACK", reply = "Back tae their clans? For a fee, maybe, an' only if the clan asks. Reclaimers aren't a charity.", fx = { align = { honor = 1 } } },
        { text = "Finders keepers. That's fair trade.", next = "BACK", reply = "Now ye're talkin' like a Reclaimer! I'll make a businessman o' ye yet.", fx = { align = { honor = -1 } } },
        { text = "Something else, Kreldig.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Help? It could make us rich! But I've a feelin' the spirits would take it badly if we went diggin' up whatever they told us about, so I'll keep tae honest salvage." } },
      choices = {
        { text = "Honest salvage only. The earth isn't a treasure map.", next = "BACK", reply = "Aye, that's the Reclaimers' creed, near enough, an' I'll drink tae it, even if the ledgers would rather I didnae.", fx = { align = { honor = 1 } } },
        { text = "If the earth tells me where treasure lies, I'll dig.", next = "BACK", reply = "Ye're a dwarf after my own heart, but mind the spirits don't take it out on yer shovel.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Centaur spears, ogre clubs as long as I am, an' once a dwarven axe frae afore the Second War, still sharp under the rust. I cleaned it up an' hung it above the stall, because some things ye don't sell, no matter what the Reclaimers' ledger says." } },
      choices = {
        { text = "Right. A fallen warrior's axe deserves a wall, not a price.", next = "BACK", reply = "Aye, that's how I see it, an' it's stayin' right there above the stall until the day I die.", fx = { align = { honor = 1 } } },
        { text = "A good axe should be swung, not hung up for show.", next = "BACK", reply = "Maybe so, but I'd never sell it, so it'll hang there, an' ye can look at it for free.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Belt buckles, arrowheads, a centaur's earring, an' once the whole brass compass off a wagon, which I'll swear blind is true. The Scorpashi dig deep in the sand, an' a hunter who knew where they nest could tell me plenty about what Desolace has lost." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} out o' the nests, though, because Scorpashi venom'll lay a beast low faster than a dwarf after a cask o' stout." },
      },
      choices = {
        { text = "What the dead dropped belongs to their kin, not your ledger.", next = "BACK", reply = "Ye're right, if they're alive tae claim it, but nobody's come lookin' in years, so I keep it safe for them.", fx = { align = { honor = 1 } } },
        { text = "Lost is lost. If I find it, I'll sell it.", next = "BACK", reply = "Now ye're talkin' like a Reclaimer, an' I'll pay a fair price for anything ye bring me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf_kr = {
      lines = {
        { id = "dkr_default", text = "Aye, an' they'd say it wi' a pickaxe in one hand an' a bit o' Titan pottery in the other! The League puts things in glass cases in Ironforge; Reclaimers put 'em back to work, an' I know which one's more use to a hungry dwarf." },
      },
      choices = {
        { text = "History belongs in a hall, not a market.", next = "BACK", reply = "The League would agree wi' ye, an' they'd send me a very long letter about it, which I'd use tae light the fire.", fx = { align = { order = 1 } } },
        { text = "A hungry dwarf makes a fair point. Salvage feeds people.", next = "BACK", reply = "Aye, that's the Reclaimers' whole argument, an' I'm glad tae hear it from someone who isnae a Reclaimer.", fx = { align = { order = -1 }, affinity = 2 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We find what others lost, friend, an' there's a fine line between lost an' taken that I'd rather not walk. Bring me salvage from the Karnitol wreck or the old ruins an' I'll not ask twice, but bring me a man's purse an' ye'll be talkin' to the Captain." } },
      choices = {
        { text = "Lost or taken, it's all salvage once it's in Desolace.", next = "BACK", reply = "Steady, friend, steady, that's a line I'd rather not cross, so let's keep it tae the wrecks.", fx = { align = { order = -1 } } },
        { text = "Right, then. I'll stick to wrecks and ruins.", next = "BACK", reply = "Good, an' I'll pay ye fair for anything ye find in either, no questions asked about the wreck.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Odds an' ends from the night elves' time, mostly, an' bits from the Karnitol's hold that some noble wanted kept dry. Half o' them hum when ye hold 'em, an' I've learned to set the hummin' ones down gently an' walk away." } },
      choices = {
        { text = "Leave anything that hums sealed. Some things should stay lost.", next = "BACK", reply = "Aye, that's the sensible answer, an' it's the one I keep tellin' myself every time I set one down gently.", fx = { align = { order = 1 } } },
        { text = "Crack them open. Knowledge is worth the risk of a burn.", next = "BACK", reply = "Ye'll crack them on your own time, friend, an' well away from my stall, if ye don't mind.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Soul shards I'll not touch, an' I'll thank ye not to leave any lyin' about, but I've candles, chalk an' good thick string, which is more than ye'll find down in the valley. The Burning Blade at Thunder Axe have their own suppliers, an' I'd like to keep it that way." }, { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Soul shards I'll not touch, an' I'll thank ye to keep yer demon from pokin' at my shelves, for it's had its nose in the candles twice already. I've chalk an' good thick string besides, but the Burning Blade at Thunder Axe have their own suppliers, an' I'd like to keep it that way." } },
      choices = {
        { text = "I'll buy honestly and keep my business tidy.", next = "BACK", reply = "That's all I ask, an' I'll throw in an extra candle for the courtesy.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My business is mine. Sell me the chalk and ask nothing.", next = "BACK", reply = "Fair enough, friend, but I'll still be watchin' for soul shards, an' I'll not be shy about askin' then.", fx = { align = { order = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More often than I'd like, aye, out by the Kodo Graveyard an' along the old roads where the centaur caught a caravan. I take what's useful an' I bury what's left, though I'll admit I'm no hand at the prayin' part." } },
      choices = {
        { text = "Bury them properly, and I'll say the words with you.", next = "BACK", reply = "Bless ye, an' I'll be glad o' the company, because I never know the right words.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead don't need their gear. Take it and don't look back.", next = "BACK", reply = "Aye, I take it, but I'll not stop lookin' back, because somebody ought tae.", fx = { align = { light = -1 } } },
        { text = "Something else, Kreldig.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Honest enough, I'd say, because what lies in the sand helps nobody, an' what I bring back keeps Nijel's Point in nails an' kettles. Still, I'll no' pretend there's never a night I wonder whose pack I'm carryin'." } },
      choices = {
        { text = "Return what you can to the families. That's the honest way.", next = "BACK", reply = "I try, when I can find them, but Desolace is a big place, an' most of the families are far away.", fx = { align = { honor = 1 } } },
        { text = "Nobody's coming to claim it. Use it and stop fretting.", next = "BACK", reply = "Easier said than done, friend, but I'll try tae fret a wee bit less, for your sake.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some o' it does, aye. There's stones out by Maraudon that hum when ye hold 'em, an' Keeper Marandis told me tae leave 'em be, so I did, though I'll confess it near broke me heart tae walk away from a find like that." } },
      choices = {
        { text = "He was right. Some things should stay buried.", next = "BACK", reply = "Aye, he was, an' I listened, though I'll admit I still dream o' those stones some nights.", fx = { align = { light = 1 } } },
        { text = "If it hums, it's worth studying. Sell it to someone careful.", next = "BACK", reply = "Ach, now ye're temptin' me, an' I'll think about it, but Marandis'll have my beard if I do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_caravan", when = { questDone = TODO_QUEST("Bodyguard for Hire") },
          text = "The Gizelton caravan rolled in safe, an' Cork Gizelton says ye were the one keepin' the centaur off it. Reclaimers Inc. ships half its finds on that caravan, so ye've done me a good turn without even knowin' it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Ye'll be wantin' tae know if I've any old arms out o' the wreckage, an' the answer's aye, though most o' it's rusted tae its scabbard." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, eh? If ye're headed down past the Kodo Graveyard, keep an eye out for anythin' shiny, because I'd swear the scorpids drag all sorts back tae their holes." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, eh? Good, because half o' what I salvage out o' this waste was left behind by folk who didnae make it home, an' it'd sit easier wi' me if someone said a word over them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin o' the Silver Hand, out among the dust an' the demon-lovers! Reclaimers Inc. could use a strong back an' a stronger conscience, an' ye look like ye've brought both." },
        { id = "h_default", key = true,
          text = "Kreldig Ungor, o' Reclaimers Inc., an' we find what others lost an' put it back to use. Desolace has lost more'n its share, the Karnitol's cargo not least." },
        { id = "h_karnitol", tags = { "news" }, when = { questActive = TODO_QUEST("The Karnitol Shipwreck") },
          text = "The Karnitol went down off the coast with her cargo, an' the Reclaimers want what's left aboard. Fetch what ye can." },
        { id = "h_reagents", when = { questActive = TODO_QUEST("Reagents for Reclaimers Inc.") },
          text = "I need reagents frae the beasts an' the ruins. The Reclaimers pay fair, an' mostly on time." },
        { id = "h_business", when = { questActive = TODO_QUEST("Reclaimers' Business in Desolace") },
          text = "Ye came all this way on Reclaimers' business? Good, then pull up a crate." },
        { id = "h_salvage", when = { metBefore = true }, text = "Found a perfectly good kettle in the dust yesterday, wi' a centaur arrow through it. I patched it, an' it makes tea fine; that's Reclaimers' work in one kettle." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Light-fingered sort, are ye? I can tell by how ye looked at me crates afore ye looked at me, an' I'll ask ye to keep yer hands where Reclaimers Inc. can see 'em." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Grand, because I've a crate o' scrolls an' trinkets from the old ruins that might be priceless or might explode, an' I've no way o' tellin' which." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Ye've the look o' someone who buys chalk by the pound. Ye're welcome to warm yer hands, but if anythin' o' yours gets into me reagents, ye'll be payin' for the lot." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now dinnae give me that look, because everythin' I dig up out o' this dust was dead long afore Reclaimers Inc. came along." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! The lads at the Reclaimers would give a week's wages tae ask ye what the earth's buried an' where." },
      },
      again = { { id = "h_again", text = "Anythin' else? Mind the crates, {g:lad|lass}; there's a Karnitol cannonball in one o' them." } },
      choices = {
        { text = "What are the Reclaimers?", next = "reclaimers" },
        { text = "What sank the Karnitol?", next = "karnitol" },
        { text = "How do you get on with the Explorers' League?", next = "league" },
        { text = "I know salvage from scrap.", next = "salvage", when = { profession = "Mining" } },
        { text = "The Explorers' League would call you looters.", next = "dwarf_kr", when = { race = "Dwarf" } },
        { text = "Does Reclaimers Inc. ever buy things that are quietly recovered?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You must pull all sorts of relics out of Desolace, Kreldig.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you stock anything for work done in chalk circles, Kreldig?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you ever find the dead along with their belongings?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is salvage from the fallen honest work, Kreldig?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What arms have the Reclaimers pulled from Desolace, Kreldig?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do the scorpids drag back to their holes, Kreldig?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Surely something you dig up here troubles you, Kreldig.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Could the earth help Reclaimers Inc., Kreldig?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Do the Reclaimers ever find dwarven things out here?", next = "dw_finds" },
        { text = "I'll help.", next = "END", fx = { affinity = 1 } },
      },
    },
    reclaimers = {
      lines = { { id = "r_default", text = "We're dwarves wi' shovels an' a head fer business. Somethin' lost is somethin' found, if ye're stubborn enough, an' we're very stubborn." } },
      choices = {
        { text = "It can't be very profitable work.", next = "reclaimers_profit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reclaimers_profit = {
      lines = { { id = "rp_default", text = "Some years it is. Other years we're very rich in kettles." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    karnitol = {
      lines = { { id = "k_default", text = "Rocks, weather, or somebody wantin' her cargo more than her crew did; nobody knows. The sea doesnae say, an' neither does what's left aboard, but it's worth askin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    league = {
      lines = { { id = "l_default", text = "We get on fine! They want the past, an' we want what still works. If they find a ruin, we'll take the hinges, an' everybody's happy, mostly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    salvage = {
      lines = { { id = "sv_default", text = "Do ye now? Then ye'll know a cracked casing's still good fer parts, an' a good casing's never good fer long. Reclaimers could use ye." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "We Reclaimers poke our noses intae everythin', so I know a bit o' all of it. Ask away." },
    },
    background = { { id = "tp_ba", text = "I'm an Ironforge lad, a Reclaimer by trade an' a salvager by nature, an' I never met a broken thing I didnae want tae look inside." } },
    advice = { { id = "tp_ad", text = "Never throw anythin' away in Desolace. Ye'll need it a week later, an' there's no shop for a hundred miles." } },
    explorers_league = { { id = "tp_league", text = "The League digs fer history, an' we dig fer things that still work. Friendly rivals, ye might say." } },
    magni = { { id = "tp_magni", text = "Magni Bronzebeard is a good king and a better drinker, and he backs the League an' the Reclaimers both when he remembers we exist. A dwarf in the field learns to manage on remembered support." } },
    maraudon = { { id = "tp_maraudon", text = "Maraudon's crammed with crystals and old earth magic, and the centaur'll kill you for walking in. If I were twenty years younger I'd go in anyway, and then I'd come out with a beard full of arrows." } },
    dire_maul = { { id = "tp_dire_maul", text = "Dire Maul's the old elf city west of here, and the ogres have it now. There's salvage in there that'd make a man rich, if the ogres would kindly step aside." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Iron are a shame to the whole race, and every Bronzebeard knows it. I'll fix anything that comes in here, except their gear, which I melt." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "I trade with Gadgetzan goblins for spare gears now and then, and every deal leaves me feeling I've been robbed politely." } },
    _none = { { id = "tp_none", text = "Never salvaged one o' those, an' I've salvaged near everythin'. Ask the Captain." } },
  },
}

P:NPC {
  key = "anton", id = TODO_NPC("Brother Anton"), name = "Brother Anton",
  bible = "bibles/desolace.md", role = "priest", tier = "quest",
  communities = { "nijels_point" }, temper = { "zealous" }, values = { "devout", "brave" },
  notices = { "class", "race" },

  impression = {
    first = "He looks at me as a recruit he hasn't signed up yet.",
    third = "{name} met Brother Anton, an emissary of the Scarlet Crusade who seeks the faithful at Nijel's Point.",
  },

  greetings = {
    { id = "g_light", text = "The Light be with you, friend. Have you come to take up the Crusade's cause? There's work for the faithful here." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "A servant of the Light! Then you'll want to see the Valley of Bones. The dead walk there, and the Crusade means to stop them." },
  },

  start = "hello",
  nodes = {
    xpt_anton = {
      big = true,
      lines = { { id = "xpt_anton_default", text = "Because the Crusade is the only order that never stopped fighting the Scourge, while the Silver Hand scattered and argued over who should lead it. Our methods are hard, I admit, but the dead don't negotiate, and neither do we." } },
      choices = {
        { text = "Hard methods in the Light's name are still wrong, Brother.", next = "BACK", reply = "Perhaps you are right, and I have heard the stories too, but I have not yet seen them with my own eyes.", fx = { align = { light = 1 } } },
        { text = "The Crusade does what must be done. I respect that.", next = "BACK", reply = "Thank you, friend, it is rare to hear that from anyone outside the order, and I will remember it.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some brothers do, and loudly. I've seen what the Scourge does with the souls of the dead, so I can't blame them for distrusting anyone who speaks to spirits, but I'm willing to be proven wrong." } },
      choices = {
        { text = "The Crusade's zeal has its place against the Scourge.", next = "BACK", reply = "It does, and I am glad you see it, though I pray it never has to be turned against anyone but the dead.", fx = { align = { order = 1 } } },
        { text = "Your Crusade's zeal frightens me more than the dead.", next = "BACK", reply = "I hear that often out here, and I am beginning to wonder whether the people who say it are right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Obedience, courage and a heart that will not hesitate when the dead wear the faces of people you knew. Brother Crowley says hesitation has cost more lives in Lordaeron than any plague, and I've no reason to doubt him." } },
      choices = {
        { text = "Obedience and courage, then. I'd stand against the Scourge.", next = "BACK", reply = "The Crusade would welcome you, I'm sure of it, and I would be glad to send word to Brother Crowley of your heart.", fx = { align = { order = 1 } } },
        { text = "I don't follow orders blindly, not even the Crusade's.", next = "BACK", reply = "That is your right, and some of the brothers would call it weakness, but I am not sure I agree with them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Follow the silence, the brothers say, because no bird sings where the dead walk and no fox will den near a plague pit. The Valley of Bones down there is just as quiet, and I've asked more than once who is stirring the dead in it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Follow the silence, the brothers say, because no bird sings where the dead walk and no fox will den near a plague pit. Your {pet} will know them before you do. A beast's hackles rise at the dead long before any of us can smell the rot." },
      },
      choices = {
        { text = "Then I'll hunt the dead wherever they walk.", next = "BACK", reply = "Then the Light walk with you, and may every grave you find be one you can close for good.", fx = { align = { light = 1 } } },
        { text = "I hunt beasts, Brother. Your crusade isn't my trail.", next = "BACK", reply = "That is fair, and I will not press you, but if the trail ever leads you to the dead, I hope you follow it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock_an = {
      big = true,
      lines = {
        { id = "wan_default", text = "Forgive? Friend, I've seen that look and smelled that sulphur before, and the Crusade takes such folk to the pyre while I stand by and watch. Put that craft away while you're near me, and pray to the Light that it isn't too late for you." },
      },
      choices = {
        { text = "I fight the undead too, with whatever I have.", next = "BACK", reply = "Then you are fighting the right enemy, and I will pray that the craft does not turn on you first.", fx = { align = { light = -1 } } },
        { text = "Maybe it isn't too late. Pray for me.", next = "BACK", reply = "I will, and gladly, and I hope you will let me, because I would rather save you than watch you burn.", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Eyes in the dark, mostly, because the Scourge hide in ruins and cellars where an honest soldier makes far too much noise. Brother Crowley values those who can find the plague's servants before they find us, and he asks few questions about where they learned it." } },
      choices = {
        { text = "I'd hunt the Scourge for you, but I keep my own counsel.", next = "BACK", reply = "Then keep your counsel, and I will keep mine, and perhaps the Scourge will lose a few servants between us.", fx = { align = { order = -1 } } },
        { text = "If the cause is just, I'd serve the Crusade gladly.", next = "BACK", reply = "I would be proud to send your name to Brother Crowley. They need good hearts in the north, more than they know.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Perhaps something else, Brother.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The Crusade trusts any arm that strikes at the undead, and fire purifies better than steel ever could. Some of the brothers say that magic opened the door to the plague, but I say the Lich King would have come no matter what Dalaran did." } },
      choices = {
        { text = "The Crusade's zeal frightens me more than the Scourge.", next = "BACK", reply = "I hear that more often than I would like, and I am beginning to wonder whether you are right.", fx = { align = { light = -1 } } },
        { text = "Fire against the Scourge is a fine use for my craft.", next = "BACK", reply = "You're welcome among us, and the brothers would be glad of you, whatever some of them mutter about magic.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Crusade welcomes anyone who will put the dead back in their graves, friend. Still, there are brothers in Lordaeron who would call your moon goddess a heresy, and I pray you never have to meet them." } },
      choices = {
        { text = "Then I'll fight the Scourge, but never under your banner.", next = "BACK", reply = "That is fair, and I will not argue, as long as the dead go back into the ground.", fx = { align = { order = -1 } } },
        { text = "The dead are a common enemy. I'll stand with you.", next = "BACK", reply = "Thank you, friend, the Light will bless that choice, whatever moon you pray to.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_anton", tags = { "news" }, when = { party = { class = "PALADIN" }, faction = "Alliance" },
          text = "A paladin rides with you! I'd hoped to see one of the Silver Hand out here, so tell {companion} that the Crusade has need of every true servant of the Light." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! The Crusade has a place for a strong arm and a sound heart, and the Scourge have never once been turned back by anything softer." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. The Crusade could use someone who reads tracks, because the Scourge leave a trail of their own, if you know where to look." },
        { id = "h_default", key = true,
          text = "I am Brother Anton, an emissary of the Scarlet Crusade. We fight the undead wherever they rise, even in the Valley of Bones to the south. Brother Crowley in Stormwind sends me the willing." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("Down the Scarlet Path") },
          text = "Go to the Valley of Bones to the south, where the dead walk, and destroy them. Then the Crusade will welcome you." },
        { id = "h_crowley", when = { questActive = TODO_QUEST("Brother Anton") },
          text = "Brother Crowley sent you! Good, then you're ready to prove yourself to the Crusade." },
        { id = "h_letter", tags = { "news" }, when = { questDone = TODO_QUEST("Down the Scarlet Path"), ["not"] = { questDone = TODO_QUEST("In the Name of the Light") } },
          text = "You've proven yourself in the valley, but the true fight is in Lordaeron. Take my letter to Raleigh the Devout, in Southshore; he'll see you to the Monastery." },
        { id = "h_resolved", key = true, when = { thread = { id = "scarlet_path", state = "resolved" } },
          text = "I've been praying on what you told me about Raleigh, and I haven't finished. I'm starting to think I'm not meant to." },
        { id = "h_soured", when = { thread = { id = "scarlet_path", state = "soured" } },
          text = "Raleigh sends his blessing, you said. I think of it every night when the valley goes quiet, and it helps." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You move like someone who has slipped through a few doors, friend. The Crusade has use for such skills, though we'd ask you to use them only against the Scourge." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, and still among the living, praise the Light. Dalaran's fall cost us so many of your kind, and the Crusade would welcome your fire against the Scourge." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID" }, text = "A druid of the night elves. You don't kneel to the Light, I know, but the Scourge hate every living thing alike, and that makes us allies whether you like it or not." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who calls on spirits. The Crusade has burned better men than you for less, but the dead walk, and I'll take any ally against them." },
      },
      again = { { id = "h_again", text = "Yes, friend? The Light hears every question." } },
      choices = {
        { text = "I've heard troubling things about the Crusade.", next = "troubling" },
        { text = "What's in the Valley of Bones?", next = "valley" },
        { text = "Who is Brother Crowley?", next = "crowley" },
        { text = "Pray with me, Brother.", next = "pray", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Raleigh read your letter, Brother.", next = "raleigh",
          when = { thread = { id = "scarlet_path", beat = "b3_raleigh", state = { "stirring", "unfolding" } } } },
        { text = "I doubt the Crusade welcomes those who don't follow the Light.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why should a paladin join the Scarlet Crusade, Brother?", next = "xpt_anton", when = { party = { class = "PALADIN" }, faction = "Alliance" } },
        { text = "I'll go to the valley.", next = "END", reply = "Then the Light go with you, friend, and may you find only quiet graves and nothing walking among them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Is there anything the Crusade refuses to forgive, Brother?", next = "warlock_an", when = { class = "WARLOCK" } },
        { text = "What would the Crusade want with someone like me, Brother?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does the Crusade trust mages after Dalaran, Brother?", next = "xmage", when = { class = "MAGE" } },
        { text = "What does the Crusade ask of its warriors, Brother?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "A hunter could track the Scourge as well as any beast.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the Crusade see the spirits as heresy, Brother?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I won't fight for the Crusade, Brother.", next = "END", reply = "I understand, friend, and I will not hold it against you, though I will pray for you all the same.", fx = { align = { order = -1 } } },
      },
    },
    troubling = {
      big = true,
      lines = {
        { id = "t_default", text = "Those are rumors, friend. There are always rumors about anyone who fights hard, but the Crusade's cause is just; I'm sure of it. I've been in Desolace a long while, I admit." },
      },
      choices = {
        { text = "Maybe you should go back and see.", next = "troubling_go", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "I'm sure you're right.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    troubling_go = {
      lines = { { id = "tg_default", text = "And leave the valley to the dead? No. If the Crusade has lost its way, it'll need men who kept to the path, and I'll be one. Ask me something else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    valley = {
      lines = { { id = "v_default", text = "There are bones, more than you can count, and things that won't stay down. The Crusade's sworn to put them down, every one. It's honest work, whatever else you've heard." } },
      choices = {
        { text = "Every one? Even those who think for themselves?", next = "undead_op" },
        { text = "Something else.", next = "BACK" },
      },
    },
    undead_op = {
      lines = { { id = "un_default", text = "I hear the Horde has taken in a whole kingdom of the walking dead and calls them allies, and some say they're not Scourge at all. Tell me plainly, friend: can any of the risen be saved, or must all of them be put down?" } },
      choices = {
        { text = "All of them. The Crusade has the right of it.", next = "un_all", fx = { affinity = 2, align = { order = 1 }, opinion = { undeath = "hate", scarlet_crusade = "admire" } } },
        { text = "The Forsaken broke free of the Lich King. They're different.", next = "un_free", fx = { affinity = -1, opinion = { forsaken = "pity" } } },
        { text = "I hear the Crusade burns the living too. That's no cure.", next = "un_crusade", fx = { affinity = -2, align = { order = -1 }, opinion = { scarlet_crusade = "distrust" } } },
        { text = "The Light can redeem anyone, Brother, even the risen.", next = "un_light", when = { class = "PALADIN" }, fx = { opinion = { undeath = "redeemable", the_light = "mercy" } } },
        { text = "I'll leave that to the Light.", next = "BACK" },
      },
    },
    un_all = {
      lines = { { id = "una_default", text = "Then you'd be welcome in Hearthglen, friend, and I'll write Brother Crowley about you myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    un_free = {
      lines = { { id = "unf_default", text = "Free of one master and sworn to another, in a city built on Lordaeron's bones. Forgive me if I don't call that saved." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    un_crusade = {
      lines = { { id = "unc_default", text = "Rumors again. I told you, I've been out here a long while, and I'll not hear the Crusade slandered at my own fire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    un_light = {
      lines = { { id = "unl_default", text = "A merciful thought, and the Light is merciful. I have never once seen it work on the dead, though, and I've prayed over a great many of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowley = {
      lines = { { id = "c_default", text = "He's our brother in Stormwind. He finds the brave and sends them to me, and I've never met a better judge of courage." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    raleigh = {
      big = true,
      lines = { { id = "r_default", text = "Raleigh! How is he? He hasn't written since I came west. Did he take you north, to the Monastery?" } },
      choices = {
        { text = "He left the Crusade. He told me why.", next = "raleigh_truth" },
        { text = "He's well. He sends his blessing.", next = "raleigh_lie",
          fx = { thread = { id = "scarlet_path", state = "soured" }, trait = { kind = 1 } } },
      },
    },
    raleigh_truth = {
      lines = { { id = "rt_default", text = "Left? Raleigh? He was the most devout of us. What could make a man like that walk away?" } },
      choices = {
        { text = "I've been to the Monastery. He was right.", next = "raleigh_told", when = { questDone = TODO_QUEST("In the Name of the Light") },
          fx = { thread = { id = "scarlet_path", state = "resolved" }, align = { honor = 1, light = 1 } } },
        { text = "They torture innocents and call them plagued.", next = "raleigh_told",
          fx = { thread = { id = "scarlet_path", state = "resolved" }, align = { honor = 1 } } },
        { text = "I shouldn't have said anything.", next = "raleigh_lie",
          fx = { thread = { id = "scarlet_path", state = "soured" }, trait = { cautious = 1 } } },
      },
    },
    raleigh_told = {
      lines = {
        { id = "rto_default", key = true, text = "I told you the rumors were only rumors. I've been saying it a long time, out here where it was easy. Pray with me; I don't know yet what for." },
      },
      choices = {
        { text = "I'll pray with you.", next = "BACK", reply = "Thank you, and I do not know what we are praying for yet, but I am glad not to be doing it alone.", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Take off the tabard, Brother.", next = "BACK", reply = "I know, I know, and I have thought of it every night since, but I am not ready yet, and I am ashamed of that.", fx = { affinity = -1, align = { honor = 1 }, trait = { stern = 1 } } },
      },
    },
    raleigh_lie = {
      lines = { { id = "rl_default", text = "Good, good, I knew he would be. Go with the Light, then; the valley won't empty itself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "p_default", text = "Gladly. Out here, prayer's the only thing that isn't covered in dust. For the fallen, then, and for the Crusade's good name." } },
      choices = {
        { text = "For the fallen.", next = "BACK", reply = "For the fallen, and for every one of them whose names I never learned.", fx = { affinity = 2, align = { light = 2 } } },
        { text = "For the Crusade's good name.", next = "BACK", reply = "For its good name, if it still has one, and I am beginning to fear it does not.", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Light has shown me a good deal out here, friend, and I'm glad to share it. Ask." },
    },
    background = { { id = "tp_ba", text = "I'm a brother of the Light who took up the Crusade's cause. I came west to hold back the dead where I'm sent.", next = "troubling" } },
    advice = { { id = "tp_ad", text = "Bless your blade before the Valley of Bones. The dead there don't stay down for steel alone." } },
    scarlet_crusade = { { id = "tp_crusade", text = "The Crusade is brave men and women, fighting the plague where no one else will. Whatever you've heard, that's the heart of it." } },
    scourge = {
      { id = "tp_scourge", text = "The Scourge killed my village in Lordaeron and raised my neighbors to march against me. The Crusade gave me a sword and a purpose, and I'll carry both until every last corpse is still." },
      { id = "tp_scourge2", when = { race = "Scourge" }, text = "You walk and talk like the living, but I know what you are, and so does the Light. Leave before I forget my orders to keep the peace here." },
    },
    holy_light = { { id = "tp_holy_light", text = "The Light burns away corruption, and the Crusade is its fire. Anyone who cannot see that has been touched by the plague, whether they know it or not." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken claim to be free of the Lich King, as if a corpse could choose its master. They are the Scourge wearing a different mask, and the Crusade will tear it off." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn have soft hearts and softer tactics, and they talk to the dead as if they were people. The Crusade will finish the work they won't." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme is where the Scourge took the very heart of Lordaeron, and the Crusade still fights inside its walls. One day it will be cleansed, and I pray I'm there to see it." } },
    arthas = { { id = "tp_arthas", text = "The prince betrayed his people and his father, and the Scourge rose behind him. If you hear any man defend Arthas Menethil, you are listening to a heretic." } },
    _none = { { id = "tp_none", text = "I couldn't say, but pray on it." } },
  },
}

P:NPC {
  key = "lyshaerya", id = TODO_NPC("Innkeeper Lyshaerya"), name = "Innkeeper Lyshaerya",
  bible = "bibles/desolace.md", role = "innkeeper", tier = "service",
  communities = { "nijels_point" }, temper = { "calm" }, values = { "kind" },
  notices = { "weary", "lock_shadow" },

  impression = {
    first = "She sweeps the dust as she talks and has given up winning.",
    third = "{name} met Innkeeper Lyshaerya, who keeps the only warm hearth at Nijel's Point.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. Your bed is made and a meal is warming. Rest; you've earned it here." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You may rest here, as anyone may. I will not refuse a traveler, but I will not pretend to be glad." },
    { id = "g_inn", text = "Ishnu-alah. Rest here; there's little enough comfort in Desolace, and this land has been grey since long before my grandmother's grandmother walked it." },
    { id = "g_home", when = { homeInn = { "Nijel's Point" } }, text = "You've come back to the Point. Your bed's made, though the dust got in anyway." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the dust has had all that time to settle in your room, though I swept it as often as I could. Come in, and rest." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone came in this evening still smiling about a talk with you, and that's rare enough at the Point that I noticed. Whatever you said, it helped." },
    { id = "g_word_angered", when = { word = "angered" }, text = "One of our folk has been sour since speaking with you, and sat by the fire muttering till the lamps burned out. I won't ask what happened, but I'd mend it if I were you." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've walked back from the spirit healer across a dead land. Sit; nothing here will ask anything of you for an hour." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The candles in my inn bent toward you when you came in, as they did, my grandmother said, when the Highborne walked the halls of Zin-Azshari. I'll pour your drink, but you'll forgive me if I keep the lamps lit late tonight." },
  },

  start = "hello",
  nodes = {
    dd_karnitol = {
      lines = {
        { id = "dd_kn_default", text = "Very unusual, and very loud. He says Reclaimers Inc. will be rich off what was in that hold, and he's already making plans for the next wreck. I worry about the souls who went down with the ship, though; does anyone think of them?" },
      },
      choices = {
        { text = "The dead don't need cargo. The living do.", next = "BACK", reply = "Perhaps you're right, and the sea takes what it takes. I'll leave a candle in the window for them anyway.", fx = { align = { light = -1 } } },
        { text = "Someone should. I'll say a word for them.", next = "BACK", reply = "Thank you; that's kind of you, and rarer than it should be. Elune keep them, wherever they are now.", fx = { align = { light = 1 } } },
        { text = "Something else, Lyshaerya.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some nights I think I hear them in the wind off the bone fields, but I'm no shaman. If they speak to you, I hope they say something kinder than they say to me." } },
      choices = {
        { text = "They grieve, but with care they can heal.", next = "BACK", reply = "I hope you are right, and I will listen more kindly to the wind tonight because of it.", fx = { align = { light = 1 } } },
        { text = "They're bitter, and they'll stay that way.", next = "BACK", reply = "Perhaps they will. I think I would be too, if I had died out there among the bones and nobody came to bury me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Most who go down into Desolace stop here first, and the warriors sleep soundest, because they've stopped worrying about what they can't fight. It's the ones who come back up that I watch, because the centaur and the Burning Blade leave marks you can't see." } },
      choices = {
        { text = "I'll rest while I can. The fight will wait.", next = "BACK", reply = "That is wise, and I will make sure your bed is the quietest one I have.", fx = { align = { order = 1 } } },
        { text = "I don't rest before a fight. Sleep comes after.", next = "BACK", reply = "I will keep a bowl warm for when you come back, then. You will want it more after.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Thunder lizards on the open plain, scorpids in the sand and the hyenas that trail the old kodos toward the Graveyard. The hunters who stay here say the hyenas are the worst, because they never fight fair and they never give up." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Thunder lizards on the open plain, scorpids in the sand and the hyenas that trail the old kodos toward the Graveyard. {pet} can lie by the fire with the others, if it doesn't mind the dust. There's no keeping it out of anything here, so the beasts and I have made our peace with it." },
      },
      choices = {
        { text = "I'll hunt the hyenas and leave the old kodos in peace.", next = "BACK", reply = "Thank you, and the old kodos thank you too, though they will never know who to thank.", fx = { align = { light = 1 } } },
        { text = "I'll hunt whatever pays, kodo or not.", next = "BACK", reply = "That is your choice, but the tauren will remember it, and so will the old kodos' spirits.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I'd like to think so, though I've swept this floor every morning and the dust never seems to mind. Keeper Marandis says the sickness rises from deep under Maraudon, and if he's right, no broom of mine will help." } },
      choices = {
        { text = "It will heal. Every wasteland was green once.", next = "BACK", reply = "I hope you are right, and I will keep sweeping, in case the green comes back and needs a clean floor to walk on.", fx = { align = { light = 1 } } },
        { text = "Some places are meant to die. Let it go.", next = "BACK", reply = "Perhaps some are, but I came here to keep a hearth, and a hearth is a stubborn sort of hope.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Everyone passes through eventually, because there is no other roof between Stonetalon and Feralas. I've fed Reclaimers, Crusaders, Sentinels and a few who gave three names in one night, and I've found that a full plate keeps most of them honest while they're under mine." } },
      choices = {
        { text = "Then I'll be honest under your roof, at least.", next = "BACK", reply = "Thank you, and that is all I ask of anyone, whatever names they give at the door.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Three names is careful, not shady. Desolace is a hard road.", next = "BACK", reply = "I will not argue with you, but I will still remember all three, and I will know which one is true by spring.", fx = { align = { order = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Twice, on the worst storm nights, when the wind came up from the Kodo Graveyard and filled the chimney with grit. I sat everyone round a single lamp and told stories until morning, and I'd choose that over any spell, though I'm glad to see a mage all the same." } },
      choices = {
        { text = "A good story warms better than any fire I could conjure.", next = "BACK", reply = "I think so too, and the guests seemed to agree, because not one of them complained about the cold.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Next storm, let a mage keep the hearth lit. Power is for using.", next = "BACK", reply = "Perhaps next time I will ask, and perhaps you will be here, and the stories will be warmer for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Grief, mostly, and the kind of silence that follows a person to bed. Some have lost companions to the centaur and some have only stared too long at the bones in the Kodo Graveyard, but they all sit closer to the fire than they need to." } },
      choices = {
        { text = "Then I'll sit with them tonight. No one should carry that alone.", next = "BACK", reply = "Thank you, and they will thank you too, in the morning, when the silence has eased a little.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grief passes. They need rest and a hot meal, not sermons.", next = "BACK", reply = "Perhaps it does, but it passes faster with someone to sit beside, and sermons are not what I meant.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Most come back thinner and quieter, and some don't come back at all. The soldiers lose friends to the Kolkar and the Magram, and Brother Anton tells them the Light is with them, though I've noticed he never sits by the fire long enough to hear what they say back." } },
      choices = {
        { text = "I'll sit by the fire with them, then, and listen.", next = "BACK", reply = "Thank you, and they will be glad of it, because the Brother's words do not reach them anymore.", fx = { align = { light = 1 } } },
        { text = "Soldiers need orders and steel, not someone to talk to.", next = "BACK", reply = "They need those, yes. But I have had a soldier cry into his stew at this table, and no order on earth was going to help him.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Vahlarriel, the night elf who hunts the Burning Blade, came up from Thunder Axe Fortress with stories that kept the whole Point awake for a week, and the same cult took a woman named Dalinda Malem. Someone with your smell walking in here reminds them of all that, however polite you are about it." },
      },
      choices = {
        { text = "I'll keep my companion out of sight, for their sake.", next = "BACK", reply = "Thank you, and they will sleep easier for it, as will I.", fx = { align = { order = 1 } } },
        { text = "They'll have to get used to me. I've earned my place.", next = "BACK", reply = "Perhaps you have. Give them a season, and keep your temper while they stare.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_karnitol", when = { questDone = TODO_QUEST("The Karnitol Shipwreck") },
          text = "Kreldig has been telling everyone at my hearth that you found the Karnitol's cargo for him, and he's been buying drinks all week. I've never seen a dwarf so happy about a shipwreck, and I hope I never do again." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior, and dusty to the knees, like everyone who climbs up from below. Leave your boots by the door, and the floor and I will both thank you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. The game is poor down in Desolace, but what's left is hard and hungry, and I'd ask you to come back to this hearth before you're as thin as it is." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light, here at the edge of the dust. Sit by the hearth a while, because the people who come up from Desolace often carry more than dust home with them, and I think you would know what to say to them." },
        { id = "h_default", key = true,
          text = "I'm Innkeeper Lyshaerya, and I keep the only warm hearth between Stonetalon and Feralas, and travelers find their way to it eventually." },
        { id = "h_op_prestor", tags = { "news" }, when = { gossip = { topic = "prestor", stance = "distrust" } },
          text = "The Captain said you'd a sharp word for Lady Prestor. He's been repeating it to himself all week, so whatever it was, it stuck." },
        { id = "h_op_crusade", tags = { "news" }, when = { gossip = { topic = "scarlet_crusade", stance = "distrust" } },
          text = "Brother Anton's been sitting alone by the fire since you spoke with him. Don't take it to heart; he needed to hear it from someone." },
        { id = "h_dust", when = { metBefore = true }, text = "Desolace dust gets into everything: the bread, the beds, my hair. I've stopped fighting it, and now I just sweep while I talk." },
        { id = "h_night", key = true, when = { timeOfDay = "night" }, text = "The centaur drums carry a long way at night. You stop hearing them after a week, though I haven't stopped yet." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, come down to Desolace. Most of your kind take one look at the dust and go straight back to Feralas, and I can't say I blame them." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Walk as softly as you like, but my floorboards have learned every trick, and they'll tell me if you come down for a midnight snack. Sit, and I'll bring you something all the same." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Could you warm the hearth a little? I'm only joking, though the dust does make the fire sulk, and I'd not say no." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the Silver Hand, at the edge of Desolace. Sit, and let me feed you before you go down, because I've seen what that dust does to armour, and to the people inside it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "You're welcome at my hearth like anyone else, but leave whatever follows you outside, please. The soldiers here have seen what the Burning Blade do with theirs." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. Sit by the fire, if you like; the spirits of this land have little warmth left, and you look as though you've been listening to them a long while." },
      },
      again = { { id = "h_again", text = "Something else? I'll keep sweeping; the sand comes back faster than I can push it out." } },
      choices = {
        { text = "Desolace deserves healing, not just survival.", next = "BACK", reply = "It does. Perhaps one day the land will remember what it was.", fx = { align = { light = 1 } } },
        { text = "Desolace is dead. Take what's left and move on.", next = "BACK", reply = "Then why do you stay at my inn? Rest, and leave in the morning.", fx = { align = { light = -1 } } },
        { text = "Kreldig's been buying drinks? That's unusual for him.", next = "dd_karnitol", when = { questDone = TODO_QUEST("The Karnitol Shipwreck") } },
        { text = "Can this land ever heal, Lyshaerya?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Those drums haven't stopped all night.", next = "drums", when = { heardLine = "lyshaerya.h_night" } },
        { text = "Why keep an inn in Desolace?", next = "why" },
        { text = "Do many shady folk pass through your inn, Lyshaerya?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Has the dust ever beaten your hearth, Lyshaerya?", next = "xmage", when = { class = "MAGE" } },
        { text = "Travelers must bring strange things back up from Desolace.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do many warriors rest here before going down, Lyshaerya?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Little can still live down in Desolace, I'd think.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What becomes of the folk who go down there, Lyshaerya?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The soldiers here seem to fear me more than the centaur.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do the spirits of Desolace still speak, Lyshaerya?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just a room, thank you.", next = "END" },
      },
    },
    drums = {
      lines = { { id = "d_default", text = "That's one clan telling another it's still there. Louder means angrier, and tonight is loud." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because a hearth matters most where there's nothing else. Anyone can keep an inn in Darnassus." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Travelers bring news from both ends of the valley to this hearth. Ask, and I'll tell you what I've heard." },
    },
    background = { { id = "tp_ba", text = "I have a hearth, a broom, and travellers who need both, and I don't need more of a story than that." } },
    advice = { { id = "tp_ad", text = "Shake out your boots every morning. Desolace has scorpions, and scorpions like boots." } },
    elune = { { id = "tp_elune", text = "I pray to Elune each morning for patience with the dust, and she has given me patience in plenty and not one day free of dust. I take it as a lesson." } },
    centaur = { { id = "tp_centaur", text = "The centaur thunder past at night, and the guards count the hoofbeats from the walls. I keep the shutters closed and the tea warm." } },
    maraudon = { { id = "tp_maraudon", text = "The druids speak of Maraudon in hushed voices, as of a tomb that should not be opened. Those who go in come back thirsty, and some come back not at all." } },
    teldrassil = { { id = "tp_teldrassil", text = "I left Teldrassil for this dusty mountain because someone had to keep a fire lit for travelers. On quiet nights I can almost hear its leaves." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess keeps our people safe, even out here, where her reach is long and thin. I set a cup aside for her each evening, a foolish habit, I suppose." } },
    _none = { { id = "tp_none", text = "I keep the hearth; ask the Captain for news. Elune keeps the rest, and she seldom shares it." } },
  },
}

-- Ghost Walker Post: the Horde's camp in Desolace.
P:NPC {
  key = "takata", id = TODO_NPC("Takata Steelblade"), name = "Takata Steelblade",
  bible = "bibles/desolace.md", role = "soldier", tier = "major",
  communities = { "ghost_walker" }, temper = { "hard" }, values = { "loyal", "stern" },
  race = "Orc", likesTone = "blunt",
  notices = { "class", "kit" },

  impression = {
    first = "He measures people by whether they will fight.",
    third = "{name} met Takata Steelblade, the hard-bitten orc who hunts the Burning Blade from Ghost Walker Post.",
  },

  greetings = {
    { id = "g_post", text = "You're in Desolace now, and the demons' servants are thick here, as they were in our clans before Thrall freed us. Are you here to fight them?" },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the Burning Blade did not rest while you were away. If you're here to fight, there are more of them now than when you left." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown stronger since we last spoke, and I've no use for small talk about it. Thunder Axe Fortress is where I'd see that strength spent, for the Horde." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I hear you put fear into someone at the post, and I don't mind that, so long as it was the right someone. Save your threats for the cultists, because they've earned them." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "I've killed a great many who walked your road too far. Don't make me add you to the count." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Satyr claws, by the look of it. They fight dirty, so learn to fight dirtier." },
  },

  start = "hello",
  nodes = {
    dd_spirits = {
      lines = {
        { id = "dd_sp_default", text = "I trust that Keldran sent him, and Keldran sent me too, so we're on the same side. But Maurin knows the Blade's magic a little too well for my comfort, and I watch him the way I'd watch any blade I didn't forge myself. Do you think a weapon that cuts both ways is worth carrying?" },
      },
      choices = {
        { text = "Yes. You use every weapon you have against the Blade.", next = "BACK", reply = "That's what Keldran says, and maybe he's right. I'll keep watching, but I'll keep using him too.", fx = { align = { light = -1 } } },
        { text = "No. Some weapons cost more than the victory.", next = "BACK", reply = "Then we agree, though I can't send him home without Keldran's leave. Watch him for me when I'm not around.", fx = { align = { light = 1 } } },
        { text = "Something else, Takata.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd take anyone who fights. The cultists in Thunder Axe Fortress call on demons, and if your Light burns them, then I don't care whose corpse it lives in." } },
      choices = {
        { text = "I'll face them openly and burn them with the Light.", next = "BACK", reply = "Let them see it coming and know it's the end. I'll be watching from the ridge with a drink in my hand.", fx = { align = { honor = 1 } } },
        { text = "I'll take them from behind before they can summon.", next = "BACK", reply = "A cultist who never gets to summon is the best kind of dead cultist. Cut the throat before the chant, not after.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They take the satyrs' paths and the satyrs' caves, and the satyrs take their coin and their demons in return. Follow the hoofprints into the hills and you'll find robed orcs where you expected beasts, and that's where I want arrows." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They take the satyrs' paths and the satyrs' caves, and the satyrs take their coin and their demons in return. Keep {pet} downwind of the camps. Satyrs smell beasts better than they smell men, and one warning growl costs us the whole ambush." },
      },
      choices = {
        { text = "I'll hunt the cultists, but satyrs who keep away can live.", next = "BACK", reply = "That is fair. My quarrel is with the Blade, and the satyrs who stay in their hills are not my concern today.", fx = { align = { honor = 1 } } },
        { text = "Every satyr dies. They chose their company.", next = "BACK", reply = "They did, and I'll not argue, but finish the Blade first and the satyrs after.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman_tk = {
      lines = {
        { id = "stk_default", text = "Sick, yes, and the Burning Blade made them so, the same way the demons sickened our blood. Thrall's shamans are the only ones I've seen make a fel-touched place breathe again, so if you can, do it while I kill what's poisoning it." },
        { id = "stk_thrall", when = { origin = "orc_thrall_shaman" },
          text = "You learned at Thrall's side, I hear it in how you speak of them. Then you know what this land feels like; it's the same thing we felt in the camps, when the bloodlust left us." },
      },
      choices = {
        { text = "Heal first. Killing won't clean the land.", next = "BACK", reply = "You speak like Thrall's shamans, and they have done more good here than my blade ever has.", fx = { align = { light = 1 } } },
        { text = "Kill first. The spirits can wait for quiet.", next = "BACK", reply = "Then kill quickly, and heal after, because the land has waited long enough already.", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    warrior_tk = {
      lines = {
        { id = "wtk_default", text = "Good, and don't stop to talk to them, because the Blade hides among the satyrs and the satyrs lie for sport. Thunder Axe Fortress is full of them, and every one you leave alive tells the next one you're coming." },
        { id = "wtk_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "Razor Hill sends its grunts a long way these days. The Blade was in Durotar too, you'll remember, in the Skull Rock caves; this is the same rot, only older." },
      },
      choices = {
        { text = "None of them will walk away.", next = "BACK", reply = "Then the next one won't know you're coming, and that is how this war is won.", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "I'll leave one alive, to follow home.", next = "BACK", reply = "Clever. Let it run home, and then you'll know where home is, and so will I.", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Everywhere they camp, the ground goes black and the water turns bitter. The Burning Blade feeds them and they feed the rot, and I don't care which came first." } },
      choices = {
        { text = "Strike the satyrs, but spare the land your fire.", next = "BACK", reply = "That is right. The land has suffered enough from the Blade without our fire as well.", fx = { align = { light = 1 } } },
        { text = "Burn their camps and everything around them.", next = "BACK", reply = "Then you will be burning the land with them, and I will not thank you for that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Quietly, from the inside, until they no longer trust their own brothers. Their cultists in Thunder Axe sleep beside the demons they serve, and a cultist who wakes up next to a dead brother starts wondering which of them sold the other." } },
      choices = {
        { text = "I'll make them doubt each other. That's how cults fall.", next = "BACK", reply = "A cult that doubts itself eats itself, and they deserve that death more than any blade I could give them.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll kill them face to face. Even cultists deserve that.", next = "BACK", reply = "Honourable, and I respect it, but they will not give you the same, so watch your back.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They fear what they remember, and orcs once filled the sky with fel fire before Thrall freed us of it. Burn the satyrs of Sargeron with clean flame and let the tauren see the difference with their own eyes, because that will do more than any talking." } },
      choices = {
        { text = "My magic answers to me alone. Let them think what they like.", next = "BACK", reply = "Then they will think what they like, and they will fear you for it, so do not be surprised.", fx = { align = { order = -1 } } },
        { text = "I'll fight where the tauren can see me. Trust is earned.", next = "BACK", reply = "Let them watch you, then. The tauren of Ghost Walker Post have seen enough orcs with demons at their heels, and they need to see the other kind.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They rot from the edges inward, and no poultice we brought from Orgrimmar slows it. Maurin says it's fel, and he would know, so I need healers who will close a wound first and ask whose fault it was afterward." } },
      choices = {
        { text = "I'll heal anyone who bleeds for the Horde here.", next = "BACK", reply = "Then you will be welcome at every fire in this camp, and my warriors will remember you.", fx = { align = { light = 1 } } },
        { text = "I'll heal those who pull their weight. The careless can wait.", next = "BACK", reply = "Then the careless will die, and I will have to bury them, so heal them anyway and curse them after.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_spirits", when = { questDone = TODO_QUEST("The Burning of Spirits") },
          text = "Maurin says you helped him with his spirit-burning business. I don't pretend to understand what he does with those bones and fires, but if it hurts the Burning Blade, then I'm glad of it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Can you track a satyr through broken ground, or only deer through grass? I need the first." },
        { id = "h_default", key = true,
          text = "I'm Takata Steelblade. Keldran sent me from Orgrimmar to hunt the Burning Blade here, the last orcs who still drink the demons' poison. They hide among the satyrs, so the satyrs die too." },
        { id = "h_op_necro", when = { gossip = { topic = "necromancy", stance = "wrong" } },
          text = "Maurin says you called his work rot. I'd not say it twice near his tent, but I'll not argue with you either." },
        { id = "h_op_centaur", when = { gossip = { topic = "centaur", stance = "hate" } },
          text = "Felgur Twocuts likes you, which is rare. He says you called the centaur beasts, and he's been grinning about it at the fire." },
        { id = "h_satyr", tags = { "news" }, when = { questActive = TODO_QUEST("Befouled by Satyr") },
          text = "The satyrs foul everything they touch, so thin them. The Blade loses its friends one horn at a time." },
        { id = "h_corrupter", when = { questActive = TODO_QUEST("The Corrupter") },
          text = "I saw what that demon lord's shadow did to Maurin, and it was only a shadow. Find Lord Azrethoc and his warlock servant at the Mannoroc Coven, and end them both." },
        { id = "h_relations", when = { questActive = TODO_QUEST("Alliance Relations") },
          text = "So Keldran sent you with news from Orgrimmar, good. Maurin Bonesplitter handles the Blade's warlocks for us, so speak to him, and he'll tell you his designs." },
        { id = "h_corrupter_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Corrupter"), days = 3 } },
          text = "Azrethoc is dead, and the Blade has lost its newest master. For the first time since I came here, I think we may one day call some place safe again." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid. You'll feel the satyrs' rot in the soil long before you see their horns, and that's reason enough to help me thin them." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Good, because the Burning Blade fear knives in the dark more than axes in daylight, and I want them afraid." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage of the Horde. Your fire is not fel, so I have no quarrel with it, but do not let anyone at Ghost Walker Post mistake you for the Blade." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The warriors here take wounds from satyr claws that fester, and I'll take any healer who can stand the smell of Desolace." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Burning Blade", min = 30 } }, text = "The Blade's cultists are fewer at Thunder Axe this week, and I hear it was your doing. Keep at it, because a cult this size breaks once enough of its knees do." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The Burning Blade bow to demons, and I hear demons hate the Light, so come and prove it." },
      },
      again = {
        { id = "h_again", text = "Something else? Say it and be done; an orc's word should be short and his axe long." },
        { id = "h_again2", text = "Speak. The satyrs won't wait while we talk, so neither will I for long." },
      },
      choices = {
        { text = "Maurin's magic is strange, Takata. Do you trust him?", next = "dd_spirits", when = { questDone = TODO_QUEST("The Burning of Spirits") } },
        { text = "Do the satyrs poison the land, Takata?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who are the Burning Blade?", next = "blade" },
        { text = "Why kill every satyr?", next = "satyrs" },
        { text = "Does the Horde have other worries out here?", next = "relations" },
        { text = "You must miss home, out here.", next = "home" },
        { text = "The night elves say orcs still carry the demons' taint.", next = "taint" },
        { text = "What did the demon lord do to Maurin?", next = "corrupter", when = { any = { { questActive = TODO_QUEST("The Corrupter") }, { questDone = TODO_QUEST("The Corrupter") } } } },
        { text = "Not everyone who walks my road is the Blade.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Do you trust the Forsaken who fight beside you?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm an orc mage, not a warlock.", next = "orc_mage", when = { race = "Orc", class = "MAGE" } },
        { text = "The spirits here are sick with demon taint.", next = "shaman_tk", when = { class = "SHAMAN" } },
        { text = "Give me a satyr camp. I'll clear it.", next = "warrior_tk", when = { class = "WARRIOR" } },
        { text = "How do you want the Blade hunted, Takata?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "The tauren here seem wary of mages, Takata.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "How do the Burning Blade hide among the satyrs, Takata?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Wounds from satyr claws look slow to heal, Takata.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Would you take a paladin against the Burning Blade, Takata?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I scouted the Kolkar camps out of this post once, Takata.", next = "xorig_ghost", when = { origin = "tauren_ghost_walker_scout" } },
        { text = "I'll hunt with you.", next = "END", fx = { affinity = 2, learn = { "burning_blade" } } },
      },
    },
    xorig_ghost = {
      lines = {
        { id = "xgh_default", text = "I know. You were the scout who always came back, and in Desolace that's the only kind worth remembering. Do the Kolkar still move the way they did when you watched them?" },
      },
      choices = {
        { text = "They're bolder than ever, and they're watching this post.", next = "BACK", fx = { affinity = 2 } },
        { text = "I couldn't say. I've been away too long.", next = "BACK" },
        { text = "The ghosts of this post still walk in my sleep.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    blade = {
      big = true,
      lines = {
        { id = "b_default", text = "They are members of the Horde who gave their loyalty to the demons and kept practicing their dark magic. They care nothing for the Warchief's vision of our future in Kalimdor, and that is the threat Thrall most wants dealt with." },
      },
      choices = {
        { text = "Who hunts them with you?", next = "blade_maurin" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    blade_maurin = {
      lines = {
        { id = "bm_default", text = "Maurin Bonesplitter, a Forsaken whom Keldran sent because he knows the Blade and their warlock ways. He plots against them, and I deal with every other demonic thing in Desolace, and it does not please me to need a warlock's help, but I do my duty." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },

    satyrs = {
      lines = {
        { id = "s_default", text = "The Hatefury satyrs to the northeast have ties to the Blade, and the Warchief would have them slain. A satyr is what a night elf becomes when the demons are finished with him, and I don't leave those standing." },
      },
      choices = {
        { text = "How does a demon get a foothold?", next = "satyrs_pain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    satyrs_pain = {
      lines = {
        { id = "sp_default", text = "Never without help. It needs a weak spirit, a hunger for power, a thirst for revenge or even for justice, because when we're in pain, evil comes and offers to ease it." },
      },
      choices = {
        { text = "You sound like you've seen it happen.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Then I'll guard my spirit.", next = "BACK", reply = "Guard it well. The pain will come, and the offer right behind it, and they always come together.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Power is power, whoever offers it.", next = "BACK", reply = "That is what the Blade said, and that is how the Blade began, so think on it.", fx = { align = { light = -1 } } },
      },
    },

    taint = {
      lines = {
        { id = "ta_default", text = "They say it, and they're half right, because I spend my days hunting the orcs who never stopped kneeling to the fire. But every satyr in those hills was a night elf once, a Highborne who sold himself to the Legion long before my people ever heard its name, so the kaldorei can sweep their own house first." },
        { id = "ta_troll", when = { race = "Troll" },
          text = "They say it of us, and your people they call savages, so neither of us comes off well in their songs. But every satyr in those hills was a night elf once, a Highborne who sold himself to the Legion, so the kaldorei can sweep their own house first." },
      },
      choices = {
        { text = "Do the elves admit what the satyrs were?", next = "taint_admit" },
        { text = "Something else, Takata.", next = "BACK" },
      },
    },
    taint_admit = {
      lines = {
        { id = "tad_default", text = "Some do, and the Sentinels in Ashenvale kill satyrs with more hate than they spend on us, which tells me they know whose children those satyrs are. The rest pretend the Highborne never happened and call every orc a demon's dog." },
      },
      choices = {
        { text = "Then we share an enemy with them. That's worth something.", next = "BACK", reply = "It was worth a truce at Hyjal, once. It hasn't been worth one since, but I'll grant you it's a better start than an axe.", fx = { align = { honor = 1 }, opinion = { night_elves = "mixed" } } },
        { text = "Their hypocrisy is reason enough to fight them.", next = "BACK", reply = "Reason enough for some, and I won't argue it's untrue. But I've demons to kill first, so the elves will have to wait their turn.", fx = { align = { honor = -1 }, opinion = { night_elves = "arrogant" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    relations = {
      lines = {
        { id = "r_default", text = "As the Alliance pushes deeper into Kalimdor, they see the Blade and the satyrs and conclude the Horde has made pacts with the Legion. Keldran won't allow that, and with the Warchief's blessing, neither will I." },
      },
      choices = {
        { text = "Why care what the Alliance thinks?", next = "relations_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    relations_why = {
      lines = {
        { id = "rw_default", text = "Because Thrall wants peace with them, and a war started over a lie is still a war. Hunting the Blade helps the centaur too, in its way, and I'll not pretend I like that, but it's better than war." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },

    home = {
      lines = {
        { id = "h2_default", text = "I hoped the Warchief would let us go home before the seasons turned. Every new demon that crawls up out of this land pushes that hope a little further off, and some days I wish it were only the centaur we had to fight." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    corrupter = {
      lines = {
        { id = "c_default", text = "An apparition of a demon lord called Azrethoc came against him, and even as a shadow it had more power than my warlock companion. I wonder if Maurin is equal to the task, though I'd never say so to his face." },
      },
      choices = {
        { text = "Why not fight it yourself?", next = "corrupter_honor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corrupter_honor = {
      lines = {
        { id = "ch_default", text = "It would serve the Warchief better if I went, and my blade itches for it. But I hold this post, and I would disgrace my clan if I left it to chase glory for my own honor, so I'll trust you to gather a party in my place." },
      },
      choices = {
        { text = "I'll do it.", next = "BACK", reply = "Bring it back to me, and I will see the Warchief hears your name.", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "I'd have taken the glory over a post, and gone myself.", next = "BACK", reply = "Then you have never held a post, and you have never seen what happens when it is left empty.", fx = { align = { honor = -1 } } },
      },
    },

    warlock = {
      lines = {
        { id = "w_default", text = "Maybe not, and Maurin is proof of it, but every one of the Blade said the same thing once. Show me with deeds, and I'll stop counting you." },
      },
      choices = {
        { text = "Then watch me.", next = "BACK", fx = { affinity = 1, trait = { proud = 1 } } },
        { text = "Count away, then. I'll be counting too.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "Maurin Bonesplitter is the only one here, and I trust that he hates the Blade as much as I do, and I trust his knowledge of them. What he does with the rest of his studies is his business, as long as it isn't done near my post." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orc_mage = {
      lines = {
        { id = "om_default", text = "From across a battlefield, I can't tell your fire from theirs, and neither can the Alliance. Keep your magic clean and your loyalty plain, and we'll have no quarrel." },
      },
      choices = {
        { text = "Understood.", next = "BACK", reply = "Understood is all I need. We'll have no quarrel.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My magic's my own business, and I'll use it how I like.", next = "BACK", reply = "Then you'll find the Horde watches you closely, and I'll be watching closest of all.", fx = { align = { order = -1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Hm. I don't fight for praise, but I'll not spit on it when it's honestly given. You have my thanks, {class}." },
        { id = "s2", text = "It's been a long while since anyone at this post spoke of anything but demons. That was well said, and I'll remember it." },
      },
      fail = {
        { id = "f1", text = "The satyrs flatter too, just before they lie. Speak plainly, or go back up the road." },
        { id = "f2", text = "I've no use for soft words in a place like this. If you want my respect, bring me a warlock's head." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha, you've got teeth, and that's good, because the demons here mock far worse and I need warriors who can laugh back at them." },
        { id = "s2", text = "An orc who can't take a jab has no business holding a blade. You gave me a fair one, and I'll own it." },
      },
      fail = {
        { id = "f1", text = "I've killed things that mocked me in my own father's voice, and you're a poor second to them. Hold your tongue." },
        { id = "f2", text = "Insult me again and we'll settle it the old way, in the dust outside. I've no patience for fools at a war post." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "I know strength when I see it, and I don't insult it by pretending otherwise. Lok'tar, {class}; I'd rather hunt beside you than stand in your way." },
        { id = "s2", text = "There's something in your eye that I've seen in few besides the demons, and I mean that with respect. Speak, and I'll listen." },
      },
      fail = {
        { id = "f1", text = "Our people were ruled by fear once, and it was the Legion holding the whip. I'll never bend to it again, least of all for you." },
        { id = "f2", text = "I hunt demons for a living, so you'd need to be worse than they are to frighten me, and you aren't." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "The Burning Blade's warlocks keep to the inner rooms of Thunder Axe Fortress, and the fel stink is strongest there. Go in from the side, not the gate." },
    { id = "bl2", text = "The Blade here are the same cult that hides in Ragefire Chasm beneath Orgrimmar, and the Warchief knows it. Kill them in one place and they crawl out of another." },
    { id = "bl3", text = "Nijel's Point has fewer soldiers than it shows. Pentigast walks the same men along different walls, and he thinks we don't notice." },
  },
  confides = {
    { id = "cnf_1", text = "The satyrs around Thunder Axe Fortress patrol in a ring, and if you watch long enough you'll see the gap they leave every time they pass the eastern wall." },
    { id = "cnf_2", text = "The Burning Blade hide their supplies in the dry riverbeds north of the fortress, because they think nobody will look in a ditch." },
    { id = "cnf_3", text = "The tauren at Ghost Walker Post know where every clean spring in Desolace lies, and they'll tell you if you ask them with respect." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "You've shown me nothing worth respecting, and I measure everyone by that. Fight, or get out of my way." },
      { id = "gv_enemy", when = { grudge = "enemy" }, text = "You're Alliance, and Nijel's Point sits up the valley with its spears pointed at us. Don't ask me what my problem is." },
      { id = "gv_values", when = { grudge = "values" }, text = "You talk the way the Burning Blade talk, about the power you'll have. I kill people who talk like that." },
    },
    amends = {
      { id = "am1", text = "Kill Burning Blade at Thunder Axe Fortress and bring me their heads. That's how you make anything right at Ghost Walker Post." },
      { id = "am_enemy", when = { grudge = "enemy" }, text = "You can't. Go back to Nijel's Point and leave us to our dead." },
    },
    spite = {
      { id = "sp1", text = "I think you'd last one night in the internment camps, and you'd be begging the guards for mercy before dawn." },
      { id = "sp_values", when = { grudge = "values" }, text = "I think the Blade would welcome you, and I'd kill you along with the rest of them." },
    },
    _gated = {
      { id = "gt1", text = "That's not something I tell to one who hasn't bled beside me. Fight the demons here, and then ask." },
      { id = "gt2", text = "I'll keep that to myself until I know what kind of {class} you are." },
    },
    knows = {
      { id = "tp_knows", text = "I know what my hunt has taught me. Ask, and I'll answer if it serves the Horde." },
    },
    burning_blade = { { id = "tp_blade", text = "The Blade are orcs who still kneel to the old fire. In Durotar they hide in caves and here they hide behind satyrs, but I find them either way.", next = "blade" } },
    background = { { id = "tp_ba", text = "I'm a soldier sent by Keldran to clear demons out of Desolace. I'll tell you more about myself when the job is done, which means not soon." } },
    advice = { { id = "tp_ad", text = "Hit a satyr before it speaks. Whatever it says, you'll wish you hadn't heard it." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Blade still sell themselves to demons, after everything the Legion did to our people. I hunt them because someone must answer for that shame." } },
    thrall = { { id = "tp_thrall", text = "The Warchief broke the demon blood's hold on us and gave us back our souls. Every Burning Blade warlock spits on that gift, and every one I kill spits a little less." } },
    satyrs = { { id = "tp_satyrs", text = "The satyrs of Desolace serve the same masters as the Burning Blade, and they fight like cornered rats. I do not care what they were before." } },
    centaur = { { id = "tp_centaur", text = "The centaur clans fight each other more than they fight us, and I am content to let them. My blade is for demon-lovers first." } },
    dark_portal = { { id = "tp_dark_portal", text = "The orcs came through the Dark Portal with demon blood in their veins, and some of us have never washed it out. I would see that door stay shut forever." } },
    _none = { { id = "tp_none", text = "Not my hunt. Ask someone who has time to talk instead of fight." } },
    regard = {
      { id = "rg_1", text = "You kill demon-lovers without hesitating, and you don't ask me to explain why. That's all I ask of anyone, and you give it." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You've put enough Burning Blade in the dust to earn my respect, {name}, and that's not a thing I give away." },
      { id = "rg_tone", when = { fondness = "tone" }, text = "You don't waste words, and you don't flinch when I don't waste mine. We understand each other." },
      { id = "rg_honor", when = { fondness = "alignment", alignment = { axis = "honor", min = 30 } }, text = "You fight with honour, and you'd never sell your soul for power. After what the Blade have done to my people, that's worth more to me than any blade." },
    },
    confide = {
      { id = "cf_1", text = "My father drank the demon's blood with the rest of them, and he never got over it, even after Thrall freed us. I hunt the Blade because I couldn't hunt the thing that ruined him." },
      { id = "cf_2", text = "Keldran sent me to Desolace because I was too angry to keep in Orgrimmar. He was right, and I'll never tell him so." },
    },
    trust = {
      { id = "tr_1", text = "Trust my scouts at Ghost Walker Post; they're the best I've ever had. Trust the Magram's hatred of the Gelkis, and nothing else about either clan." },
      { id = "tr_2", text = "Don't trust any orc who smells of brimstone, whatever he tells you about the Horde. The Blade wear our faces, and that's the worst thing about them." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the satyrs in the hills around Thunder Axe Fortress, because they can make you see things that aren't there. If a friend calls you off the road, look twice." },
      { id = "wo_2", text = "Stay away from the Kodo Graveyard after dark. The spirits there don't care whose side you're on." },
    },
    worries = {
      { id = "wy_1", text = "The Blade are spreading faster than I can kill them, and some of the new ones are young. I worry the Horde is still making warlocks faster than I can unmake them." },
      { id = "wy_2", text = "Some nights I wonder whether there'll be enough of me left over from this hunt to be anything else. I don't like the answer." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to walk through Thunder Axe Fortress one day and find it empty. Then I'll sit on its steps and drink something stronger than water for once." },
      { id = "hp_2", text = "I hope the next generation of orcs hears the word warlock and never once thinks of their own people. That's all I want out of this war." },
    },
    favor = {
      { id = "fv_1", text = "If you go down into Ragefire Chasm beneath Orgrimmar, kill every Blade you find and come tell me how many there were. I want to know if they're growing or shrinking." },
      { id = "fv_2", text = "When you're next in Orgrimmar, tell Keldran I'm still angry and still hunting. He'll know what it means." },
    },
    friendship = {
      { id = "fr_1", text = "I don't have friends, {name}; I have people I'd fight beside. You're one of them, and that's as close as I get." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You've hunted the Blade with me and never once flinched. That's friendship, the only kind I know." },
    },
    never_told = {
      { id = "nt_1", text = "The first Burning Blade I ever killed was my cousin. I didn't know it until his hood fell back, and I've never told a soul, not even Keldran." },
      { id = "nt_2", text = "I'm afraid of what's in my own blood, {name}. My father had it, and I hunt it in other orcs so that I don't have to look for it in myself." },
    },
  },
}

P:NPC {
  key = "nataka", id = TODO_NPC("Nataka Longhorn"), name = "Nataka Longhorn",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  communities = { "ghost_walker" }, temper = { "easygoing" }, values = { "patient", "practical" },
  notices = { "craft", "race", "lock_armor" },

  impression = {
    first = "He has grown fond of Desolace and asked me not to tell.",
    third = "{name} met Nataka Longhorn of Thunder Bluff, an easygoing tauren posted at Ghost Walker Post.",
  },

  greetings = {
    { id = "g_post", text = "Desolace isn't such a bad place, once you stop expecting the Earth Mother to grow anything in it. Sit down." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Are the centaur still out there? They always are." },
    { id = "g_away", when = { away = 14 }, text = "Ah, you've been gone {away}, and the fish have been biting the whole time, which is how I measure such things. Sit down and tell me where you went." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown like spring grass since we last sat together, and I'm glad the road was good to you. I've only grown older, and a little better at fishing." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in camp told me you gave them good words and a lighter heart, and I was glad to hear it, because Desolace has little enough of either." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You fish, out here? Good, because there's a catch off the coast I'd like to see before I'm too old to eat it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the herd, in this grey place. It does me good to see horns that aren't centaur bows." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "My kodo won't stand near you, because that ward of demon hide you wear smells like the walls of Thunder Axe to her. She's wiser than I am about such things, so I'll ask you to keep a little farther off." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Much the same as I make of Desolace: strange, harder than it looks, and somehow still worth caring about. The Earth Mother does not explain herself, and I suspect the Light doesn't either, so I'll not ask you to." } },
      choices = {
        { text = "The Light gave me back. That's a gift, not a curse.", next = "BACK", reply = "A gift, then, and a strange one, and I am glad it came to someone who sees it so.", fx = { align = { light = 1 } } },
        { text = "The Light gave me a weapon, Nataka, nothing more.", next = "BACK", reply = "A weapon is a gift too, I think, if it is used well, and I hope you use it well.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some do, if they stay long enough to stop listening for centaur hooves. I fought the Kolkar when I first came to Desolace, and now I fish, and I'm not sure which of the two takes more patience." } },
      choices = {
        { text = "Patience is a warrior's strength too. I'll sit awhile.", next = "BACK", reply = "Sit, then, and fish with me. We will see whose patience is greater, though I warn you, the fish have been winning.", fx = { align = { light = 1 } } },
        { text = "A warrior who sits too long goes soft.", next = "BACK", reply = "Perhaps, but I have sat a long while, and I can still swing an axe when the centaur come.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The thunder lizards on the plains, if you have the stomach for it, and the kodo herds if you have the patience. My people don't hunt the old kodos that walk toward the Graveyard, though, and I'd ask the same of you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The thunder lizards on the plains, if you have the stomach for it, and the kodo herds if you have the patience. {pet} has the look of a beast that knows the land it's walking on. That's more than I can say for most hunters who come through Shadowprey." },
      },
      choices = {
        { text = "The old kodos walk in peace. I'll leave them be.", next = "BACK", reply = "Thank you, and my elders will thank you too, if they ever hear of it.", fx = { align = { honor = 1 } } },
        { text = "A kodo is meat. Old or young, I hunt what's there.", next = "BACK", reply = "Then hunt, but do not let the tauren see you do it, or you will find the road a lonelier place.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_nt = {
      lines = {
        { id = "hnt_default", text = "Then you'll weep at the kodo graveyard, as I did. The old kodo come all the way out here to die, and the centaur pick at their bones, and I've never once heard a good reason why they walk so far." },
        { id = "hnt_run", when = { origin = "tauren_plains_runner" },
          text = "A plains runner! You'll find no grass to run in here, cousin, only sand and bones. Your legs will hate it for a week, and then you'll love it like I do." },
      },
      choices = {
        { text = "They come home to the earth. That's reason enough.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else, Nataka.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because it fights, I think. The centaur fight, the land fights, even the fish fight harder here than anywhere in Mulgore, and there's something to love in a place that won't lie down." } },
      choices = {
        { text = "Then help it fight. The Earth Mother hasn't left it.", next = "BACK", reply = "I think so too, and I am glad to hear someone else say it.", fx = { align = { light = 1 } } },
        { text = "It's a dying land. Fondness won't save it.", next = "BACK", reply = "Perhaps it won't, but fondness keeps me here, and I am glad of it most days.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The water off Shadowprey is clean and cold and full of fish that have learned to be patient, and I've learned to be more patient than they are. You might try your fire on the centaurs if you need to burn something, because the sea has done nothing to deserve it." } },
      choices = {
        { text = "Patience is its own magic. I'll sit with you a while.", next = "BACK", reply = "Sit, and I will show you how the fish learn patience, and how I learned it from them over a great many empty lines.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A frost bolt into the shallows would fill your net faster.", next = "BACK", reply = "It would, but the fish would never trust me again, and then where would I be?", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Ground where nothing grows, and kodos that will not walk past the fortress walls even when I lead them by the horn. My elders say the land remembers wounds, and Desolace has more of them than any place I know, so I ask you to add no new ones." }, { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Ground where nothing grows, and kodos that will not walk past the fortress walls, and mine are pulling at their tethers now that your servant has come close. My elders say the land remembers wounds, and Desolace has more than any place I know, so I ask you to add no new ones." } },
      choices = {
        { text = "Their fire is a tool. I don't answer to the Legion.", next = "BACK", reply = "Perhaps not, but the land does not know that, and it will remember you all the same.", fx = { align = { light = -1 } } },
        { text = "I'll leave the land as I found it. You have my word.", next = "BACK", reply = "Thank you, and the land will thank you, in its slow way, which is by not getting worse.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Nataka.", next = "BACK" },
      },
    },
    xcl_mara = {
      big = true,
      lines = {
        { id = "xcl_mara_default", text = "Then you killed a princess of the earth itself, in a place where the walls bloom purple and the water bites. My grandmother used to say the ground here was angry, and now I wonder whether she meant the ground or the one sleeping under it." },
      },
      choices = {
        { text = "The earth may rest now, and that's worth any fight.", next = "BACK", reply = "Perhaps it may, and perhaps my grandmother will finally sleep easy, wherever she is.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Princess or not, she bled like anything else.", next = "BACK", reply = "She did, and so do we all, and perhaps that is the only thing the earth and the rest of us share.", fx = { align = { light = -1 } } },
        { text = "Will Desolace ever grow green again, do you think?", next = "xcl_mara2" },
      },
    },
    xcl_mara2 = {
      lines = { { id = "xcl_mara2_default", text = "Not in my lifetime, I'd guess, and the kodo graveyard will still be a graveyard. But I put a seed in the ground behind the post last spring, just to see, and if it comes up this year I'm going to say it was your doing." } },
      choices = {
        { text = "Tell me if it sprouts, Nataka.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_mara", tags = { "news" }, when = { cleared = "Maraudon", faction = "Horde" }, text = "Somebody went into Maraudon and came out again, and the Gelkis have been wailing about it all week. I hear it was you, and I'll admit I've slept better for the noise." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. Sit, if you like, and set that weapon down for a while, because the fish don't bite for anyone who looks ready to fight." },
        { id = "h_huntcl", when = { class = "HUNTER", race = { "Orc", "Troll" }, faction = "Horde" },
          text = "A hunter of the Horde. Mind the shore when you hunt near Shadowprey, because the surf is rougher than it looks and the things in it don't care what you came for." },
        { id = "h_default", key = true,
          text = "I'm Nataka Longhorn, of Thunder Bluff. The centaur harass us, the land gives nothing, and still I've grown fond of it. Don't tell anyone." },
        { id = "h_family", tags = { "news" }, when = { questActive = TODO_QUEST("Family Tree") },
          text = "A letter, from my brother at Freewind? I'd given up waiting. Let me sit down before I read it." },
        { id = "h_brother", when = { heardLine = "longhorn.h_default" },
          text = "You've been to Freewind Post? Then you've met my brother. Does he still stand on the edge of the mesa like he's holding it up?" },
        { id = "h_catch", when = { questActive = TODO_QUEST("Catch of the Day") },
          text = "There's a fish off this coast worth the trouble. Bring me one, and we'll both eat better than Desolace deserves." },
        { id = "h_catch_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Catch of the Day"), days = 2 } },
          text = "My hoof still tingles from that Bloodbelly fish, and the whole post smelled of frying for an evening. That's the best thing to happen here all season." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, here at Shadowprey? Sit down, sit down. The sea is the only thing in Desolace that hasn't given up, and I suspect you'll like it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out here in Desolace? The spirits of this place are tired, so be gentle with them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, come all the way out to Desolace. The land here could use a prayer, though I think it would be content just to be left alone for a while." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You came up so quietly the fish didn't even notice, which is more than I can manage. Sit, if you like, and tell me what you're really doing in Desolace." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, out here with the fishermen. If you could conjure a fish that bites, I'd call it the greatest magic I've ever seen." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "I will keep my line between us, if you don't mind. I've seen what the Burning Blade leave behind at Thunder Axe, and you carry a little of that smell." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken with the Light in hand. The Earth Mother sends us all kinds of surprises, and I think you might be the strangest one I've seen in Desolace." },
      },
      again = {
        { id = "h_again", text = "Something else? Sit; nothing out here is in a hurry except the centaur, and the Earth Mother taught us not to be like them." },
      },
      choices = {
        { text = "Why have you grown fond of Desolace, Nataka?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's to like about Desolace?", next = "fond" },
        { text = "Do you have family elsewhere, Nataka?", next = "brother" },
        { text = "Is there anything good to eat out here?", next = "fish" },
        { text = "Which centaur are giving you trouble?", next = "centaur" },
        { text = "It's good to see another tauren out here.", next = "tauren", when = { race = "Tauren" } },
        { text = "I fish. What should I know about these waters?", next = "fisher", when = { profession = "Fishing" } },
        { text = "I met your brother. He seemed well.", next = "brother_met", when = { heardLine = "longhorn.h_default" } },
        { text = "I've run the plains with my kodo since I was a calf.", next = "hunter_nt", when = { race = "Tauren", class = "HUNTER" } },
        { text = "The spirits of Desolace seem tired, Nataka.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What should a spellcaster know about Desolace?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Desolace seems to hold plenty of enemies.", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Is fishing in Desolace really so hard, Nataka?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What have you seen the Burning Blade leave behind, Nataka?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do warriors ever find peace out here, Nataka?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "There must be hunting worth having near Shadowprey, Nataka.", next = "xhuntcl", when = { class = "HUNTER", race = { "Orc", "Troll" }, faction = "Horde" } },
        { text = "What does a tauren make of a Forsaken paladin, Nataka?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "It was me, Nataka. Theradras is dead.", next = "xcl_mara", when = { cleared = "Maraudon", faction = "Horde" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },

    fond = {
      lines = {
        { id = "f_default", text = "The quiet, mostly, when the centaur let us have it, and the sky, which is as wide as Mulgore's. And the graveyard next to the post, where the kodo come to rest, which is a sad place and a holy one." },
      },
      choices = {
        { text = "Tell me about the Kodo Graveyard.", next = "fond_kodo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fond_kodo = {
      lines = {
        { id = "fk_default", text = "Bones as big as huts, as far as you can see, and at night something of the old beasts walks among them. We leave them be, and they leave us be, and that's the best arrangement in Desolace." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    brother = {
      lines = {
        { id = "b_default", text = "Cliffwatcher Longhorn, at Freewind Post in Thousand Needles. He writes when there's something to worry about, so a whole year can go by between letters." },
      },
      choices = {
        { text = "I'd guess he had news to write about this time.", next = "brother_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother_worry = {
      lines = {
        { id = "bw_default", text = "He did, about centaur stirring around the Needles more than usual, as if I didn't have enough centaur of my own. He always worried more than me, and I always told him he'd go grey early." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fish = {
      lines = {
        { id = "fi_default", text = "Bloodbelly fish, my favourite, and the trolls at Shadowprey Village are the only ones who know how to catch them. The post hasn't smelled of cooked fish in far too long, and the centaur keep me too busy to go and ask." },
      },
      choices = {
        { text = "Who should I ask at Shadowprey?", next = "fish_jinar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish_jinar = {
      lines = {
        { id = "fj_default", text = "Jinar'Zillen, their fisherman; follow the road south and then west to the coast. Tell him a hungry tauren sent you, and he'll know exactly which one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    centaur = {
      lines = {
        { id = "c_default", text = "All of them, one way or another, since the tribes here fight each other as hard as they fight us. The Magram and the Gelkis are the nearest, and they don't much care which of us they're shooting at." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tauren = {
      lines = {
        { id = "t_default", text = "And it's good for me to see you. Mulgore feels a long way off from this grey place, but horns and a good laugh bring it a little closer." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    fisher = {
      lines = {
        { id = "fs_default", text = "That the best catch here is the one somebody else already caught. Talk to the trolls at Shadowprey; they've been fishing this coast longer than any of us has been in Desolace." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    brother_met = {
      lines = {
        { id = "bm_default", text = "Good, good; that's all I needed to hear. If you pass through Freewind again, tell him his brother is eating well, even if it isn't quite true yet." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_default", text = "That the land remembers whatever is done to it, and much has been done to this one. The Burning Blade foul the ground near Thunder Axe, and the Kodo Graveyard has a heaviness to it that no spell could lift, so walk softly and you'll do better than most." },
      },
      choices = {
        { text = "I'll walk softly and leave the land as I found it.", next = "BACK", reply = "Thank you, that is all the land asks, and more than most who come through here give it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Burning Blade need burning, whatever it costs the ground.", next = "BACK", reply = "They do, and I will not argue, but the land will remember the fire as well as the cult.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "There are the Kolkar and the Magram, who'll kill each other or you without much preference. The Burning Blade watch the roads too, and they're cleverer than the centaur, so don't trust an orc on the road just because he's an orc." } },
      choices = {
        { text = "I'll scout their camps and bring the elders word.", next = "BACK", reply = "Thank you, and the elders will be glad of it, because the roads have grown more dangerous every season.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the centaur bleed each other. I'll pick the bones.", next = "BACK", reply = "Then pick carefully, because the bones out here have a way of biting back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They have reason to be. The Kodo Graveyard is full of ancient bones, the Burning Blade foul the ground around Thunder Axe Fortress, and the centaur clans spill blood over every spring. I fish and I let the land be, because I think it's done enough for one age." } },
      choices = {
        { text = "Then we should help it rest, and heal what we can.", next = "BACK", reply = "That is all I ask, and the Earth Mother would ask the same.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Tired land is still land, and the Horde should take what it gives.", next = "BACK", reply = "Perhaps it should, but tired land gives less each year, and one year it will give nothing at all.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've spent a long time in this dusty land, and I've learned more than I expected to. Ask, and I'll tell you." },
    },
    grimtotem = { { id = "tp_grimtotem", text = "My brother writes about the Grimtotem, when he writes. He worries; he always worried more than me." } },
    background = { { id = "tp_ba", text = "I'm a tauren of Thunder Bluff, posted to Desolace, and the brother of a tauren who worries too much. That's about all of it.", next = "brother" } },
    advice = { { id = "tp_ad", text = "Travel the roads in the daytime here. The centaur ride at night, and a lone traveler on a dark road is the easiest prey there is." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is the oldest and wisest of us, and I hope he lives another hundred years. He would tell you to fish more and worry less, and I listen to him." } },
    earth_mother = { { id = "tp_earth_mother", text = "Desolace looks dead to most eyes, but the Earth Mother is still here, sleeping under the dust. If you are quiet at dawn you can feel her breathing." } },
    centaur = { { id = "tp_centaur", text = "The centaur were once our bitter enemies, and they still are, but out here I almost feel sorry for them. They fight over a land that has nothing left to give." } },
    maraudon = { { id = "tp_maraudon", text = "Maraudon is the tomb of Zaetar, and the centaur hold it sacred, and the Earth Mother weeps for what grows in its heart. I do not go near it." } },
    thrall = { { id = "tp_thrall", text = "The Warchief gave the tauren friendship when no one else would, and we repay it gladly. I would not see him take fish from my net, though." } },
    _none = { { id = "tp_none", text = "I couldn't say; Desolace doesn't bring much news, and the wind here carries more dust than words." } },
  },
}
