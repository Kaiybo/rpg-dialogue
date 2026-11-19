-- Orgrimmar's trainers, from the Valley of Honor to the Cleft of Shadow. Voice: bibles/orgrimmar.md
-- Zevrost never names Neeru; the Cleft keeps its own secrets.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "grezz", id = TODO_NPC("Grezz Ragefist"), name = "Grezz Ragefist",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "fierce" }, values = { "brave", "proud" },
  notices = { "class" },
  impression = {
    first = "He believes every lesson should leave a bruise.",
    third = "{name} met Grezz Ragefist, the warrior trainer in Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_hi", text = "Into the Valley of Honor, are you? Then stand like you mean it." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and I'll wager your arms have gone soft. Pick up a blade and show me I'm wrong." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "When you first came to my yard you were all elbows, and now look at you. Somebody's been knocking you around out there, and it's done you good." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "I hear you made somebody in the city back down without throwing a punch. That's a warrior's trick too, though I still prefer the punch." },
  },
  start = "hello",
  nodes = {
    xpt_grezz = {
      big = true,
      lines = { { id = "xpt_grezz_default", text = "One of you holds the line and the other breaks it, and you take turns, because nobody can do either all day. The best pair I ever trained were a brother and sister from the Frostwolf clan, and they never once argued over glory, and both of them are still alive." } },
      choices = {
        { text = "Glory can be shared. We fight as one shield.", next = "BACK", reply = "Spoken like a Frostwolf, and I'll train you both gladly. One shield, two arms, and nobody counting.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The stronger warrior leads, and glory goes to whoever earns it.", next = "BACK", reply = "Then you'll argue every fight, and one of you will die arguing. Learn to share it, or train somewhere else.", fx = { align = { honor = -1 } } },
        { text = "Something else, Grezz.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I train anyone who can take a bruise and get back up. The humans' paladins never fought fair with my people; they fought us chained and starving. Show me you can fight fair for the Horde, and I'll call you a warrior like any other." } },
      choices = {
        { text = "I'll fight fair, and for the Horde.", next = "BACK", reply = "Then you're a warrior like any other in my yard, and nobody here will ask where you came from. Pick up a shield.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fairness is for training yards. War is different.", next = "BACK", reply = "War is different, aye, and it's why the yard matters. Learn fair here, and you'll know when to break it out there.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They respect whoever puts them back on their feet, and they'll pretend otherwise until they need you. A warrior who's been healed mid-fight learns two things at once, that he was about to die and that someone cared enough to stop it." } },
      choices = {
        { text = "Then I'll stand behind the line and keep them standing.", next = "BACK", reply = "They'll respect you for it sooner than they'd ever admit. I've seen grunts carry a healer off the field on their shoulders.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they won't respect me, they can heal themselves.", next = "BACK", reply = "They will, the day they need you, and they'll be ashamed of what they said. Heal them anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not the axe, and not the rage, though the Horde has plenty of both. The demon blood gave our fathers rage without end and it nearly killed us all, so I teach control first, and the warriors who learn it live long enough to teach the next ones." } },
      choices = {
        { text = "Control first. Rage is a tool, not a master.", next = "BACK", reply = "That's the first lesson and the hardest. Half my recruits never learn it, and the other half learn it bleeding.", fx = { align = { order = 1 } } },
        { text = "Rage won the old wars. I'll let it run free.", next = "BACK", reply = "Free, like our fathers' rage, and look where it took them. Learn control, or don't come back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Of course you should. Your beast will hold most things off, but one day a raptor will get past it, and on that day you'll want to know how to block with an axe rather than how to run, so spend a week sparring with my recruits and you'll thank me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Of course you should, because one day a raptor will get past your beast and you'll want to know how to block with an axe. Mind you, your {pet} has better footwork than half my students, and it doesn't talk back." },
      },
      choices = {
        { text = "I'll learn the axe. A hunter shouldn't hide behind a beast.", next = "BACK", reply = "A hunter with sense! Spar with my recruits for a week, and you'll curse me, and then you'll thank me.", fx = { align = { honor = 1 } } },
        { text = "My beast takes the blows. That's what it's for.", next = "BACK", reply = "Until the day it falls, and then you're alone in the Barrens with a raptor and a bow string. Learn the axe anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If you call it to your hand and look your enemy in the eye, yes, and I'll fight anyone who says otherwise. What I won't have is a shaman hiding behind a totem while the grunts bleed for him, because that isn't a fight, it's a hiding place." } },
      choices = {
        { text = "I'll call the storm face to face, never from cover.", next = "BACK", reply = "Then you're a shaman I'll fight beside any day. Nobody ever called lightning sneaky.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A wise shaman fights from wherever he's safest.", next = "BACK", reply = "Wise, maybe, but not honorable. Hide behind your totems, and don't expect the grunts to love you for it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Strength used for the Horde is always honorable, whatever shape it comes in. I only ask that you don't turn into a cat halfway through a duel, because my warriors find that insulting." } },
      choices = {
        { text = "A fair fight is fought face to face.", next = "BACK", reply = "It is. Face to face, druid, and try to stay in one shape while you're at it.", fx = { align = { honor = 1 } } },
        { text = "Victory matters more than how it's won.", next = "BACK", reply = "Victory matters, aye, but how you win is what you carry home. Remember that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Results, is it? I've buried better orcs than you who thought the same thing, and the honorable ones still won more fights than they lost, so hit me from behind and I'll forgive you once, but do it twice and I'll stop teaching you anything." },
      },
      choices = {
        { text = "Results win wars. Honor fills graves.", next = "BACK", reply = "They fill graves, aye, but they fill them with heroes. Hit me from behind once, and I'll forgive you.", fx = { align = { honor = -1 } } },
        { text = "Perhaps you're right. Honor counts for something.", next = "BACK", reply = "It does, and I'm glad to hear you say it out loud. Maybe you'll make a warrior yet, rogue.", fx = { align = { honor = 1 } } },
        { text = "What does honor mean to you?", next = "honor" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Some do, and I'll fight beside one if the Warchief asks it of me. But the warlocks of the Shadow Council sold our people to demons, and every orc who fought in the old Horde gets that taste in his mouth whenever he sees an imp." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Some do, and I'll fight beside one if the Warchief asks it of me. But the Shadow Council sold our people to demons, and every orc who fought in the old Horde gets that taste in his mouth seeing one, so don't stand it so close to me when you speak." },
      },
      choices = {
        { text = "I'll earn your respect openly, in battle.", next = "BACK", reply = "I'll be watching for it. Fight well enough, and maybe the old taste of fel will fade from my mouth.", fx = { align = { honor = 1 } } },
        { text = "I don't need respect. I need results.", next = "BACK", reply = "Results, then, but don't expect the old Horde to forget. Results won't buy their trust.", fx = { align = { honor = -1 } } },
        { text = "Who else trains in the valley?", next = "valley" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They think you hide behind them, and they're right, but a good mage makes it worth their while. Burn whatever's hitting them, and they'll stand in front of you until they drop, because that's what warriors are for." },
      },
      choices = {
        { text = "I'll guard their backs as they guard mine.", next = "BACK", reply = "Then you're a mage they'll die for, and you'll deserve it. Burn well, and burn the right side.", fx = { align = { light = 1 } } },
        { text = "They're there to bleed. I'm there to win.", next = "BACK", reply = "They'll bleed for you, mage, but they'll remember who stood behind them. Win, and thank them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_road = {
      hub = true,
      lines = {
        { id = "wr_default", text = "Your road runs the way every Horde warrior's has since the Warchief freed us: out of this yard, into the Barrens, and back again with more scars than you left with. I'll tell you what waits on it, but I won't walk it for you." },
        { id = "wr_low", when = { maxLevel = 9 }, text = "You're still learning to charge without tripping, so your road runs no farther than Durotar for now. Come back at ten, and I'll send you to someone who'll teach you to stand." },
        { id = "wr_mid", when = { minLevel = 20, maxLevel = 29 }, text = "You've got your shield and your stances, and now the Barrens and Stonetalon will teach you which one to use. Keep at it, because at thirty the road turns hard." },
        { id = "wr_high", when = { minLevel = 30 }, text = "You've walked most of the road already, and the rest of it is steeper. I'll tell you where it goes, though you'll have heard half of it in the inns." },
      },
      again = {
        { id = "wr_again", text = "What else about the road? Ask now, because out there nobody stops to explain." },
        { id = "wr_again2", text = "Go on. I've sent a thousand grunts down that road, so I know where it bends." },
      },
      choices = {
        { text = "What did my charge and rend teach me?", next = "w_charge" },
        { text = "Uzzek's test. What does a shield teach?", next = "w_defense", when = { minLevel = 10 } },
        { text = "Arms, fury or the shield. Which should I choose?", next = "w_talent", when = { minLevel = 10 } },
        { text = "I've heard warriors at thirty go to Fray Island.", next = "w_fray", when = { minLevel = 28 } },
        { text = "When do I put on plate, Grezz?", next = "w_plate", when = { minLevel = 36 } },
        { text = "You've nothing left to teach me. What now?", next = "w_sixty", when = { minLevel = 60 } },
        { text = "Enough about the road, Grezz.", next = "BACK" },
      },
    },
    w_charge = {
      lines = {
        { id = "wc_default", text = "That a warrior who reaches the enemy first chooses where the fight happens, and that a wound which keeps bleeding does your work while you guard. Charge in, open them up, and stand there making them regret it." },
        { id = "wc_troll", when = { race = "Troll" }, text = "That reaching the enemy first chooses the fight, and you trolls already knew it from hunting in the islands. Charge in, open them up with a rend, and let them bleed while you laugh at them, if you must laugh." },
      },
      choices = {
        { text = "I charge first so my brothers don't have to.", next = "w_road", reply = "That's the right reason, and it's rarer than you'd think. Most charge first because they want the songs.", fx = { align = { honor = 1 } } },
        { text = "I charge first because the first kill is mine.", next = "w_road", reply = "Then you'll be first into every ambush too. Learn to want the right thing before the wrong one kills you.", fx = { align = { honor = -1 } } },
        { text = "Back to the road.", next = "w_road" },
      },
    },
    w_defense = {
      lines = {
        { id = "wd_default", text = "That standing still under a blow is harder than giving one, and that the Horde needs warriors who can do it. Uzzek holds a hill near Far Watch in the Barrens, and he'll have you hunting thunder lizards with your shield up until you stop flinching." },
        { id = "wd_done", when = { questDone = TODO_QUEST("Path of Defense") }, text = "You already know, because Uzzek taught you on the hill near Far Watch. Now learn to taunt and to sunder from me, so whatever you're guarding stays looking at you and not at the shaman behind you." },
        { id = "wd_orc", when = { race = "Orc", questBefore = TODO_QUEST("Path of Defense") }, text = "Our fathers forgot it, because the demon blood made them charge until they died. Go to Uzzek near Far Watch in the Barrens, and he'll teach you to stand still, which is the hardest thing an orc can learn." },
      },
      choices = {
        { text = "Why taunt? Let them hit whoever they like.", next = "w_taunt" },
        { text = "Back to the road.", next = "w_road" },
      },
    },
    w_taunt = {
      lines = { { id = "wt_default", text = "Because the healer behind you can't take three blows, and you can, so you shout until they come for you and you sunder their armor while they're busy hating you. A warrior who lets the shaman die has failed, however many he killed." } },
      choices = {
        { text = "Then every blow meant for them is mine to take.", next = "w_road", reply = "Good. That's the oath the Warchief's guard swears, though they say it louder than you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they can't take a blow, they shouldn't be fighting.", next = "w_road", reply = "Then you'll fight alone soon enough, because nobody heals a warrior who lets them bleed.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "w_road" },
      },
    },
    w_talent = {
      big = true,
      lines = { { id = "wtl_default", text = "Arms is the old way, the great axe and the killing stroke, and fury is two blades and no patience, and the shield is for the ones who'd rather the Horde come home than be remembered. I've trained all three, and I'll not tell you which is best, so tell me which one you are." } },
      choices = {
        { text = "The shield. I'd rather my brothers live.", next = "w_road", reply = "Then you'll be the one everybody wants beside them and nobody thanks. I'll thank you, at least.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fury. Let them see the Horde's rage coming.", next = "w_road", reply = "Then keep the rage on a short chain, because it's the same rage that put our fathers in the camps.", fx = { align = { order = -1 } } },
        { text = "I haven't chosen yet.", next = "w_road", reply = "Then fight a season with each, and the one you miss most is yours." },
      },
    },
    w_fray = {
      lines = {
        { id = "wf_default", text = "Aye, to Klannoc Macleod, a human who runs a fighting grate on Fray Island off the coast south of Ratchet. Win his affray and you'll have learned the berserker's stance, which is rage you choose rather than rage that chooses you." },
        { id = "wf_done", when = { questDone = TODO_QUEST("The Affray") }, text = "You've stood on Klannoc's grate and walked off it, so you know the berserker's stance already. If he sent you north to the troll in Alterac after that, go, because the whirlwind weapons are worth the climb." },
      },
      choices = {
        { text = "A human judging Horde warriors? I don't like it.", next = "w_fray2" },
        { text = "Back to the road.", next = "w_road" },
      },
    },
    w_fray2 = {
      lines = { { id = "wf2_default", text = "Neither did I, the first time, but he's fair, and he's never cared what banner a fighter carries onto his grate. After the camps, I'll take a fair human over a crooked orc, and so should you." } },
      choices = {
        { text = "A fair judge is a fair judge, whatever his blood.", next = "w_road", reply = "That's how the Warchief thinks, and it's why he's Warchief and I'm teaching grunts.", fx = { align = { order = -1 } } },
        { text = "Humans built the camps. I won't forget that.", next = "w_road", reply = "Don't forget it, then, but don't let it lose you a lesson either.", fx = { align = { order = 1 } } },
        { text = "Back to the road.", next = "w_road" },
      },
    },
    w_plate = {
      lines = {
        { id = "wp_default", text = "When you've the strength to carry it all day and still swing, and for most that comes near forty. Get it made at the forges here, or take it off something in the Badlands that won't need it, but get used to it before you need it." },
        { id = "wp_plate", when = { minLevel = 40 }, text = "Now, if you haven't already, and I'll know if you haven't, because you'll walk in here clanking or you won't. Plate turns blows that mail only slows, so stop sending your blood to the healer when iron could take it." },
      },
      choices = { { text = "Back to the road.", next = "w_road" } },
    },
    w_sixty = {
      lines = { { id = "ws_default", text = "Now you go where the trainers can't follow, into Blackrock Spire and the Plaguelands and the deep places, and you come back and tell the grunts what you saw. That's the last lesson of the Valley of Honor: the ones who make it teach the ones who don't yet." } },
      choices = {
        { text = "I'll come back and teach them, Grezz.", next = "w_road", reply = "Then you'll have repaid me, and you'll learn how much shouting it takes.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I fight for myself now, not for recruits.", next = "w_road", reply = "Then you've grown strong and forgotten why, and I've seen that before. It ended in a demon's cup.", fx = { align = { honor = -1 } } },
        { text = "Back to the road.", next = "w_road" },
      },
    },
    w_grom = {
      big = true,
      lines = {
        { id = "wg_default", text = "Grom Hellscream drank the demon's blood first and broke its hold last, and he died in Ashenvale killing Mannoroth so the rest of us would be free. Every Warsong warrior in this valley carries that, the shame and the glory both." },
        { id = "wg_orc", when = { race = "Orc" }, text = "Grom drank the demon's blood first, and he cut Mannoroth down in Ashenvale and died freeing us from it. You're an orc, so you carry his shame and his glory both, whether your clan was Warsong or not." },
      },
      choices = {
        { text = "He paid his debt. I honor him for that.", next = "BACK", reply = "So do I, and so does the Warchief. Lok'tar, Hellscream.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "He doomed us first. One brave death doesn't wash that.", next = "BACK", reply = "It doesn't wash it, no, but it's more than most of the guilty ever paid. Say it quietly near the Warsong.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_view = {
      lines = {
        { id = "hum_v_default", text = "Better than recruits want to hear, and that's why I tell them. A human footman is half an orc's strength, but he'll hold a shield wall in a hailstorm and step over his dead brother to keep it closed." },
        { id = "hum_v_undead", when = { race = "Scourge" },
          text = "You'd know, since you stood in their lines once, before the plague. They're half an orc's strength, but they'll hold a shield wall in a hailstorm, and I'd guess that habit never died with you." },
      },
      choices = {
        { text = "So you respect them?", next = "hu_stance" },
        { text = "They broke the Horde, didn't they?", next = "BACK", reply = "They broke a Horde drunk on demon blood and led by Gul'dan's fools. I'd like to see them try it against orcs who fight with clear eyes.", fx = { learn = { "humans" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_stance = {
      lines = {
        { id = "hum_s_default", text = "I respect what they did to us, which is not the same as liking them. Their knights rode us down at Blackrock Spire, and their jailers had us fighting in pits for wagers, so I teach every orc in this valley to fight like the next human line won't break." },
      },
      choices = {
        { text = "A worthy enemy deserves honest respect. I'll give it.", next = "BACK", reply = "Good. Respect the shield and break it anyway, and you'll be the kind of warrior the Valley of Honor remembers.", fx = { align = { honor = 1 }, opinion = { humans = "respect" } } },
        { text = "Respect is wasted on jailers. I'll break them, nothing more.", next = "BACK", reply = "Then break them, but don't come crying to me when the first line holds. Contempt has killed more orcs than human steel ever did.", fx = { align = { honor = -1 }, opinion = { humans = "hate" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_defense", when = { questDone = TODO_QUEST("Path of Defense") },
          text = "Uzzek sent word from the Barrens that you finished his test and earned your shield. I don't hand out praise, so you'll have to make do with this: you didn't embarrass the Valley of Honor." },
        { id = "h_alt_same", tags = { "news" }, when = { alt = { sameClass = true } },
          text = "I trained a {altclass} called {alt} not long ago, with the same habit you have of dropping the shield arm when tired. Whoever taught the pair of you, they taught you both the same bad lesson." },
        { id = "h_alt_higher", tags = { "news" }, when = { alt = { higher = true, class = "WARRIOR" } },
          text = "{alt} still comes back to my yard now and then, and I'd put that {altclass} against most of the Warchief's guard. You'll need a good many more bruises before I say the same about you." },
        { id = "h_pt_pair", tags = { "news" }, when = { class = "WARRIOR", party = { sameClass = true } },
          text = "Two warriors in one company, and both still standing. Most bands I've seen with two of you end up arguing over who goes through the door first, so settle that now, before it gets one of you killed." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin in the Valley of Honor. The last knight of the Silver Hand I saw was guarding a camp, recruit, so don't complain when I hit you twice as hard." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest in the Valley of Honor! Good, because my warriors bleed faster than they learn, and I'm tired of carrying them to the Valley of Spirits." },
        { id = "h_default", key = true, text = "I'm Grezz Ragefist, and I train the Warchief's warriors. The Valley of Honor is named for what we earn here, so don't waste my time with anything less." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Another warrior come for lessons? Good, because the Horde can never have enough strong arms." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" }, text = "A druid on my training ground? Fine, because a tauren in bear form hits harder than most of my students, and I'm not too proud to say so." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman on my training ground! The Warchief swings the Doomhammer and calls the storm with the same arm, so don't tell me your kind are too soft for real fighting." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "Back again, warrior? Show me your stance before you say a word, because your feet tell me more than your mouth ever will." },
        { id = "h_orcwar", when = { race = "Orc", class = "WARRIOR" }, text = "An orc with an axe, come to the Valley of Honor. Your father's generation fought with demon fire in their blood, so you'll fight better than they did, or I'll know the reason why." },
        { id = "h_trollwar", when = { race = "Troll", class = "WARRIOR" }, text = "A Darkspear warrior! Vol'jin's people fight loose and laughing, and I'll make you fight tight and grim as well, and then nothing in Kalimdor will stand against you." },
        { id = "h_taurwar", when = { race = "Tauren", class = "WARRIOR" }, text = "A tauren in my yard, and the ground shakes to prove it. Cairne's people repaid our help a hundred times over, so I'll teach you as hard as I teach my own." },
        { id = "h_deadwar", when = { race = "Scourge", class = "WARRIOR" }, text = "A Forsaken warrior. You fought orcs once, I'd wager, before the plague, so show me you've learned to fight beside us instead." },
        { id = "h_w10", tags = { "news" }, when = { class = "WARRIOR", minLevel = 10, faction = "Horde", questBefore = TODO_QUEST("Path of Defense") }, text = "You're ready for the shield, and I'm not the one who'll teach it. Go to Uzzek near Far Watch in the Barrens, and come back when you can stand still under a blow." },
        { id = "h_w30", tags = { "news" }, when = { class = "WARRIOR", minLevel = 30, questBefore = TODO_QUEST("The Affray") }, text = "Thirty, and still walking in here like a recruit. Klannoc Macleod on Fray Island tests warriors your age, so take the boat from Ratchet and show him what this valley made." },
        { id = "h_w40", when = { class = "WARRIOR", minLevel = 40, maxLevel = 49 }, text = "Plate suits you, or it will once you stop walking like it's borrowed. Strength gets you into plate, and stubbornness keeps you in it." },
        { id = "h_w60", when = { class = "WARRIOR", minLevel = 60 }, text = "There's nothing left in my yard you haven't learned, and still you come back. Good, because the grunts need to see what they could become." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter in the Valley of Honor? Ormak's lot are over by the range, but stay if you like, because a hunter who can hold a blade survives longer." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! You won't need my lessons, but you'll need my warriors in front of you, so treat them well." },
      },
      choices = {
        { text = "What do you make of humans as fighters?", next = "hu_view" },
        { text = "Do your warriors respect a priest who never swings an axe?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Some would call it dishonorable to strike with lightning.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is a druid's strength honorable, Grezz?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What does honor mean to you?", next = "honor" },
        { text = "Who else trains in the valley?", next = "valley" },
        { text = "Honor doesn't win wars, Grezz. Results do.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What makes a warrior of the Horde, Grezz?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should a hunter learn to fight up close, Grezz?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I doubt my kind has any honor in your eyes, Grezz.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I'd guess your warriors think little of mages.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Will you train beside a paladin, Grezz?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Teach me, Grezz. I'm ready for more bruises.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Where does my road go from here, Grezz?", next = "w_road", when = { class = "WARRIOR" } },
        { text = "Tell me about Grom Hellscream.", next = "w_grom", when = { faction = "Horde" } },
        { text = "Two warriors in one band. How should we fight together?", next = "xpt_grezz", when = { class = "WARRIOR", party = { sameClass = true } } },
        { text = "Farewell, Grezz.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Still standing there? Then ask, and ask loudly." },
        { id = "h_again2", text = "What else? Speak up, because I've got recruits to bruise." },
        { id = "h_again_war", when = { class = "WARRIOR" }, text = "Something else, warrior? Ask it with your feet set, and I'll answer it." },
      },
    },
    honor = {
      lines = { { id = "o_default", text = "It means you face your enemy and you don't strike his back, even when he'd strike yours. The Warchief taught us that our fathers forgot it, and I won't let my students forget it twice." } },
      choices = {
        { text = "Honor is what makes us more than beasts.", next = "BACK", reply = "It is, and the Warchief built this city on it. Keep it, and you'll be more than our fathers ever were.", fx = { align = { honor = 1 } } },
        { text = "Honor is fine until it gets you killed.", next = "BACK", reply = "It might, and it's still worth it. Our fathers lived without it, and look where that got them.", fx = { align = { honor = -1 } } },
      },
    },
    valley = {
      lines = { { id = "v_default", text = "Ormak teaches the hunters across the way, and the smiths work the forges behind us. They all answer to the Warchief, and each of them thinks his trade matters most." } },
      choices = { { text = "And which matters most?", next = "valley_best" } },
    },
    valley_best = {
      lines = { { id = "vb_default", text = "Mine, of course, because a smith's blade is just iron until a warrior swings it. Don't tell the smiths I said so, though." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know steel and I know sweat. Anything else, ask Gryshka at the inn." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War, and I lost, and I learned more in the losing than I ever did in the winning. I teach that, and I teach it with bruises." } },
    thrall = { { id = "tp_thrall", text = "The Warchief fought in a human arena before he fought in a war. That's the kind of warrior I respect, one who's been knocked down and got back up." } },
    scourge = { { id = "tp_scourge", text = "The Scourge don't feel pain, which means you have to hit them harder. I teach my students to hit hard, so I suppose I'm ready." } },
  },
}

P:NPC {
  key = "ormak", id = TODO_NPC("Ormak Grimshot"), name = "Ormak Grimshot",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "He would rather watch a student's pet than the student.",
    third = "{name} met Ormak Grimshot, the hunter trainer in Orgrimmar.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the beasts. Most of them bite, and the rest are thinking about it." },
    { id = "g_hunter", when = { class = "HUNTER", pet = { type = "Beast" } }, text = "Bring {pet} in where I can see it. I'll judge the beast first and you after, the same as always." },
    { id = "g_nopet", when = { class = "HUNTER", minLevel = 12, ["not"] = { pet = { type = "Beast" } } }, text = "A hunter walking in alone. Either your beast is with the stable master or you've lost it, and I'd like to know which before we talk." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and you came back smelling of somewhere I haven't hunted. Come and tell me where." },
  },
  start = "hello",
  nodes = {
    dd_echeyakee = {
      lines = {
        { id = "dd_ec_default", text = "He was, because he never hunted the same way twice and the grass hid his white coat better than you'd think. Some of the tauren say a beast like that is a spirit of the plains and should be left alone. What do you say to that?" },
      },
      choices = {
        { text = "A spirit or not, he was killing Sergra's hunters.", next = "BACK", reply = "And that's the only argument Sergra needed. A hunter takes the beast that threatens the camp; the spirits can sort out the rest.", fx = { align = { order = 1 } } },
        { text = "The tauren may be right. I'll honor him in the hunt.", next = "BACK", reply = "Good, because a hunter who honors what he kills hunts longer than one who doesn't. The tauren taught us that, and they were right.", fx = { align = { order = -1 } } },
        { text = "Something else, Ormak.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Most of us don't think of it at all. The Light came to Durotar on the armour of men who caged orcs, and my students would rather trust their beasts than any glow. You'll have to show them it's yours and not theirs." } },
      choices = {
        { text = "I'll show them. It's mine to use for the Horde.", next = "BACK", reply = "They'll come round when they see you use it. Hunters trust what they can see.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I've nothing to prove to anyone's students.", next = "BACK", reply = "Then they'll keep their distance, and you'll hunt alone. Your choice.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I'd trust anyone with steady hands and a calm voice, and most priests have both. The beasts can tell who means them well, and they know it long before my new hunters do." } },
      choices = {
        { text = "A wounded beast deserves the same care as any grunt.", next = "BACK", reply = "It's good to hear a priest say so. My students drag their beasts to me half dead, and I'm no healer.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I heal the Horde first, Ormak, and beasts after.", next = "BACK", reply = "Fair enough, the Horde first. But the beasts are part of the Horde too, in their way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Patience, and how to read the ground before you charge across it. I've seen grunts run straight into a scorpid nest in the Barrens because they never looked down, so watch the tracks and the wind, and you'll pick your fights instead of falling into them." } },
      choices = {
        { text = "I'll learn to read the ground before I charge.", next = "BACK", reply = "Then you'll never charge into a scorpid nest, which is how I lost my first boar.", fx = { align = { order = 1 } } },
        { text = "A fast charge beats any amount of tracking.", next = "BACK", reply = "Until you charge into one, and then you'll wish you'd looked down. Learn the tracks anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "With food, with patience and with your own voice, every day, until it knows yours from any other. Durotar's beasts stay half wild even when they're tamed, so start with a boar if you're nervous, and move to the raptors only when you've learned to read a temper." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "With food, with patience and with your own voice, every day, until it knows yours from any other. Your {pet} looks well kept, which is good, because I judge my students by their beasts more than by their aim." },
      },
      choices = {
        { text = "A beast is my partner. I'll earn its trust.", next = "BACK", reply = "That's the hunter's way. It'll trust you back, in time, though cats take longer than wolves.", fx = { align = { honor = 1 } } },
        { text = "A beast obeys, or it goes back to the wild.", next = "BACK", reply = "Then it'll go back to the wild, and you'll be left with nothing. Earn its trust.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "You hear its spirits and I read its tracks, and most days we come to the same answer. The difference is that when the earth's angry you ask it why, and I just pack up and hunt somewhere else." } },
      choices = {
        { text = "Facing the land's anger is the honest path.", next = "BACK", reply = "It is, and I respect you for it. I'm still packing up my camp, though.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "There's no shame in leaving a fight you can't win.", next = "BACK", reply = "There isn't. Hunt somewhere else and live to come back, which is more than the brave ones manage.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "A hunter tracks prey to feed someone and a rogue tracks prey to rob it, so I'd say the hunter's better, though I've seen rogues track as well as any of mine. Durotar is hard ground, and anyone who can follow a trail across it has my respect." },
      },
      choices = {
        { text = "Then I'll track to protect, not to rob.", next = "BACK", reply = "Then you're a hunter at heart, whatever you call yourself. Durotar will teach you the rest.", fx = { align = { light = 1 } } },
        { text = "Prey is prey, whatever the reason.", next = "BACK", reply = "It is, and I can't argue with that. Track well, rogue.", fx = { align = { light = -1 } } },
        { text = "Where's the best hunting near Orgrimmar?", next = "hunt" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Turning a boar into a sheep isn't taming it, friend, it's only confusing it. A tamed beast chooses to stay at your side, and no spell ever made a creature choose anything." },
      },
      choices = {
        { text = "Fair. Trust is earned, not forced.", next = "BACK", reply = "Now you're thinking like a hunter. Earned trust stays, and nothing else does.", fx = { align = { order = 1 } } },
        { text = "Choice is overrated. A spell works faster.", next = "BACK", reply = "Faster, maybe, but a spell wears off and a bond doesn't. Trust lasts as long as the beast does.", fx = { align = { order = -1 } } },
        { text = "How do you choose a companion?", next = "pet" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "We both want it to go on feeding us, and few in this city ever spare it a thought. But I take the beast and you become it, so I suspect you feel every kill a little more than I do." } },
      choices = {
        { text = "A clean kill honours the beast. I won't take a sloppy one.", next = "BACK", reply = "The beast's spirit will thank you for it. Clean kills, always, and the land keeps feeding us.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Prey is prey. I don't spare it a thought once it's down.", next = "BACK", reply = "Then you're more hunter than druid, I think. Strange, but I'll not argue.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "The same way I judge a hunter's beast, by whether it fights well and whether it trusts you, though I doubt anything from the Nether trusts anyone. Keep it fed and keep it leashed, and never let it near my students' pets, because they can smell it." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "The same way I judge a hunter's beast, by whether it fights well and trusts you, and yours hasn't looked at you once since you walked in. Keep it fed and keep it leashed, and get it away from my students' pets, because you can see them all pressed against the far wall." },
      },
      choices = {
        { text = "I'll keep it leashed and away from your pets.", next = "BACK", reply = "Thank you. The last imp in my yard set a student's cat on fire, and she still hasn't forgiven me.", fx = { align = { order = 1 } } },
        { text = "What serves me goes wherever I send it.", next = "BACK", reply = "Then it doesn't go near my students' pets, or we'll have words. Keep it close.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    o_road = {
      hub = true,
      lines = {
        { id = "or_default", text = "The Hunter's Hall sends hunters out by the hundred, and the road they take hardly changes: Durotar, the Barrens, Stonetalon and the Needles, then the far places where the beasts are older than the Horde. Ask what you like about it, and I'll tell you what I'd want told." },
        { id = "or_young", when = { maxLevel = 14 }, text = "You've only just got a beast at your heel, so most of the road is still ahead of you. That's the best part of it, though you won't believe me until you've walked the rest." },
        { id = "or_mid", when = { minLevel = 30, maxLevel = 49 }, text = "You've learned to fall down dead and get up again, so you're past the middle of the road. From here the beasts get cleverer and the trainers get fewer, so ask while I'm still useful." },
        { id = "or_high", when = { minLevel = 55 }, text = "There's not much road left that I've walked myself. I'll tell you what the hunters who came back have told me, which is the best a trainer can do at the end." },
      },
      again = {
        { id = "or_again", text = "What else? The wolves can wait a little longer, though they'll tell you otherwise." },
        { id = "or_again2", text = "Go on. Every hunter who stood where you are asked me something I'd not heard before." },
      },
      choices = {
        { text = "Thotar sent me to learn to train my beast.", next = "o_train", when = { minLevel = 10 } },
        { text = "Wolf, cat or boar? Which should I keep?", next = "o_keep", when = { minLevel = 10 } },
        { text = "What beasts in the Barrens are worth the chase?", next = "o_barrens", when = { minLevel = 12 } },
        { text = "When do hunters stop wearing leather?", next = "o_mail", when = { minLevel = 34 } },
        { text = "Is there anything left to hunt at the end?", next = "o_end", when = { minLevel = 50 } },
        { text = "How does an orc hunter honor the old ways?", next = "o_orc", when = { race = "Orc" } },
        { text = "The tauren say to thank every kill.", next = "o_tauren", when = { race = "Tauren" } },
        { text = "The Skyborne hunt too, Ormak.", next = "o_sky", when = { race = "Skyborne" } },
        { text = "That's enough of the road, Ormak.", next = "BACK" },
      },
    },
    o_train = {
      lines = {
        { id = "otr_default", text = "He did, and he sent you to the right orc. You've tamed and you've let go, and now I'll teach you to train, so that every beast you bind for a day leaves something behind in the one you keep. Xao'tsu down the hall will teach it the rest, if you bring him meat." },
        { id = "otr_active", when = { questActive = TODO_QUEST("Training the Beast") }, text = "Thotar's word reached me before you did, and he says your hands are steady on the rod. Stand there and I'll teach you to train what you've tamed, and then you'll be a hunter and not just a child with a pet." },
        { id = "otr_done", when = { questDone = TODO_QUEST("Training the Beast") }, text = "You learned it from me already, so I'll only remind you: every beast you tame can teach yours something, so tame widely and keep one. Xao'tsu will teach the rest, and he likes hunters who bring their beasts in fed." },
      },
      choices = {
        { text = "What's the first thing I should teach it?", next = "o_train2" },
        { text = "Back to the road.", next = "o_road" },
      },
    },
    o_train2 = {
      lines = { { id = "otr2_default", text = "To growl, so the boar comes at your beast and not at you, because a hunter who's being bitten isn't shooting. After that, whatever it needs most for the beast it is: a bite for a wolf, a claw for a cat, and a thick hide for anything that's going to stand in front of you." } },
      choices = {
        { text = "Good. Back to the road.", next = "o_road" },
      },
    },
    o_keep = {
      lines = {
        { id = "ok_default", text = "A wolf if you like to run, a cat if you like to strike first, and a boar if you'd rather it took the beating than you. I've kept all three, and I'd tell you the boar, but my students never listen, because a cat looks better at the Drag." },
        { id = "ok_cat", when = { pet = { family = "Cat" } }, text = "You've already chosen a cat, so I'll only say she'll strike harder than anything else in the hall and complain louder about her supper. Feed her fish now and then, and she'll forgive you most things." },
        { id = "ok_wolf", when = { pet = { family = "Wolf" } }, text = "You've chosen a wolf, which pleases the old orc in me. He'll run with you and howl you into the next fight, and he'll never forgive you for leaving him in the stables." },
      },
      choices = {
        { text = "I'll keep one beast for life.", next = "o_road", reply = "Then you'll know it better than any hunter knows a bow. That's how my first boar and I lived.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep whatever beast suits the hunt.", next = "o_road", reply = "The stable master will be glad of the work. Just don't let the one at your heel see you eyeing the next.", fx = { align = { order = -1 } } },
        { text = "Back to the road.", next = "o_road" },
      },
    },
    o_barrens = {
      lines = {
        { id = "ob_default", text = "Sergra will set you on the plainstriders and the zhevra and the prowlers, and then give you the horn that calls Echeyakee, the white lion. West of Ratchet there's Humar the Pridelord, a black lion under a lone tree, and hunters camp there for days to tame him, because there's no other cat like him on the plains." },
        { id = "ob_humar", when = { pet = { family = "Cat" }, minLevel = 20 }, text = "Sergra's white lion and Humar the Pridelord, the black one west of Ratchet, and by the colour of your cat I wonder if you didn't go and sit under that tree yourself. If you did, I'll not ask how long you waited." },
      },
      choices = {
        { text = "And beyond the Barrens?", next = "o_badlands" },
        { text = "Back to the road.", next = "o_road" },
      },
    },
    o_badlands = {
      lines = { { id = "obd_default", text = "In the Badlands there's a mountain cat the hunters call Broken Tooth, and he strikes quicker than any beast I've ever seen, so quick that some hunters say he's the best companion in the world. The road there is long and full of ogres, so be past forty before you go looking." } },
      choices = {
        { text = "A swift beast is worth any journey.", next = "o_road", reply = "Then go and find him, and send me word of it. I've wanted to see that cat since before you were born.", fx = { align = { order = -1 } } },
        { text = "My beast has bled beside me. I'll not trade it.", next = "o_road", reply = "Good. Broken Tooth is a fast cat, but he's never once guarded your back, and yours has.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Back to the road.", next = "o_road" },
      },
    },
    o_mail = {
      lines = {
        { id = "om_default", text = "Near forty, when you're strong enough to carry links and still draw a bow all day. Leather is quiet and mail is loud, so you'll scare off half the game the first week, and you'll be glad of it the first time a raptor gets past your beast." },
        { id = "om_forty", when = { minLevel = 40 }, text = "Now, if you haven't already, and by the sound of you walking in, I'd say you have. Mail turns teeth that leather only slows, and you'll forgive the noise the first time something bites you and doesn't get through." },
      },
      choices = {
        { text = "And before forty, what should I learn?", next = "o_feign" },
        { text = "Back to the road.", next = "o_road" },
      },
    },
    o_feign = {
      lines = { { id = "of_default", text = "To fall down dead at thirty and stand up again when the danger's passed, which is the trick that keeps old hunters old. And your traps, frost and fire, laid where the beast must step, so that you choose where the fight happens before it starts." } },
      choices = {
        { text = "Back to the road.", next = "o_road" },
      },
    },
    o_end = {
      lines = {
        { id = "oe_default", text = "There's armor that hunters wear at the end of the road, the Beaststalker's, made in pieces and scattered through Stratholme and Scholomance and Blackrock Spire, and you'll have to take it back one piece at a time. And there's a bow I've heard of but never seen." },
        { id = "oe_sixty", when = { minLevel = 60 }, text = "There's the Beaststalker's armor, scattered through Stratholme, Scholomance and the Spire, and I hope you've started taking it back. And there's a bow, and you're the first of my students I'd tell about it." },
      },
      choices = {
        { text = "What bow?", next = "o_bow" },
        { text = "Back to the road.", next = "o_road" },
      },
    },
    o_bow = {
      narr = "He lowers his voice, though there is nobody near enough to hear but the wolves.",
      lines = { { id = "obw_default", text = "Rhok'delar, the bow of the ancient keepers. The story goes that a leaf of an ancient lies deep in the Molten Core, and an ancient in Felwood called Vartrus will make a bow of it for any hunter who can face four demons hiding in mortal shapes, alone, with nothing but a beast for company." } },
      choices = {
        { text = "Alone? Why must the hunter fight alone?", next = "o_bow2" },
        { text = "Back to the road.", next = "o_road" },
      },
    },
    o_bow2 = {
      big = true,
      lines = { { id = "obw2_default", text = "Because the ancients want to know the hunter, not her friends. Any warrior can win with a shaman behind him, but a hunter is meant to be enough alone, with a beast that trusts the hand that feeds it and nothing else. I'd like to think I trained one who could do it." } },
      choices = {
        { text = "Then I'll go alone, with my beast, and prove it.", next = "o_road", reply = "Then I've trained you well. Come back and show me the bow, and I'll show it to every recruit in this valley.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A bow isn't worth dying alone for.", next = "o_road", reply = "Maybe it isn't, and you're alive to say so. Still, think on it when you've nothing left to hunt.", fx = { align = { honor = -1 } } },
        { text = "Back to the road.", next = "o_road" },
      },
    },
    o_orc = {
      lines = { { id = "oo_default", text = "By remembering that the clans hunted before they ever made war. On Draenor the Frostwolves and the Warsong rode wolves to the hunt, not to battle, and it was the demon's blood that made them beasts of war. Keep your wolf for the hunt first, and for the Horde after, and you'll be closer to the old ways than most." } },
      choices = {
        { text = "The wolves were born for war. We made them strong.", next = "o_road", reply = "We made them dead, mostly, in their thousands at Blackrock. Hunt with yours before you fight with it.", fx = { align = { light = -1 } } },
        { text = "Then I'll hunt as the clans did before the blood.", next = "o_road", reply = "So will I, as long as I live. That's the best honour I know to give our fathers.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Back to the road.", next = "o_road" },
      },
    },
    o_tauren = {
      lines = { { id = "ota_default", text = "They do, and I laughed at it the first time I saw Holt Thunderhorn kneel over a plainstrider. Then I watched his hunters for a season, and they never once came home empty, and I stopped laughing and started kneeling. Tell me, do you thank the beast or the Earth Mother?" } },
      choices = {
        { text = "The beast. It's the one that gave its life.", next = "o_road", fx = { trait = { kind = 1 } } },
        { text = "The Earth Mother, who made it and takes it back.", next = "o_road", fx = { affinity = 1 } },
      },
    },
    o_sky = {
      lines = { { id = "osk_default", text = "So I hear, and the Bluff vouches for you, which is good enough for this hall. I'd like to know what beasts hunt on the winds where your people came from, though I don't suppose many of them could be coaxed down to a stable in Orgrimmar." } },
      choices = {
        { text = "Some could. We'd have to ask the wind first.", next = "o_road", fx = { trait = { witty = 1 } } },
        { text = "I'd rather not speak of the old places, Ormak.", next = "o_road", reply = "Then I'll not ask again. A hunter's past is his own trail to walk.", fx = { affinity = 1 } },
      },
    },
    xorig_raptor = {
      lines = { { id = "xrp_default", text = "Good, that's how a raptor ought to be. The Darkspear raise them from the egg and they never forget the first hand that fed them, and a wolf would bite that same hand the first lean winter. Has she ever bitten you?" } },
      choices = {
        { text = "Once, as a hatchling. Never since.", next = "BACK", fx = { affinity = 1 } },
        { text = "Every morning, but only gently.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_echeyakee", tags = { "news" }, when = { killed = { name = "Echeyakee" } },
          text = "Sergra Darkthorn tells me you took Echeyakee, the white lion of the Barrens, and brought his hide back to the Crossroads. Every hunter in the Horde has tried to track that cat at least once, and most of us came back empty-handed." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. Not my students, but I'll watch you anyway, because I watch everything that moves in this valley." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. I've no lessons for you, but if a hunter's pet comes back torn, I'd rather send it to you than to anyone in this valley." },
        { id = "h_default", key = true, text = "I'm Ormak Grimshot, and I teach the hunters of the Horde. Durotar is a hard land for game, so a hunter here learns to track things that would rather not be found." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Your companion is with you, good. Now let's see if you've been worthy of it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You've come to the wrong trainer, but stay a while, because your kind and mine both learned long ago that the land watches us back." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid at the hunters' range. You hunt with your own teeth instead of a bow, which I respect, though I'd like to see you tame a boar that way." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior at the hunters' range? Stay a while, because you could do worse than learn to throw an axe straight." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "One of mine, and with a beast in tow. Show me how it heels, because a pet that doesn't heel is a pet that gets you killed." },
        { id = "h_trainbeast", tags = { "news" }, when = { class = "HUNTER", questActive = TODO_QUEST("Training the Beast") }, text = "Thotar sent you down from Razor Hill, so you've tamed and let go, and now you want to learn to train. Good, stand over there where the wolves can see you, and we'll begin." },
        { id = "h_sixty", when = { class = "HUNTER", minLevel = 60 }, text = "Look at you, a hunter with nothing left in this hall to learn. Sit a moment anyway, because there are things at the end of the road I only tell the ones who reach it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Something walks at your heel that was never a beast. I won't ask to see it, but I'll ask how you treat it." },
      },
      choices = {
        { text = "Echeyakee was hard to track, Ormak.", next = "dd_echeyakee", when = { killed = { name = "Echeyakee" } } },
        { text = "Would you really trust a priest with a hunter's pet?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shamans and hunters must see the land differently.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Hunters and druids must want the same things from the wild.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "How do you choose a companion?", next = "pet" },
        { text = "Where's the best hunting near Orgrimmar?", next = "hunt" },
        { text = "Hunters and rogues both track prey. Which is better?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My polymorph tames a beast faster than you can.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What can a warrior learn from a hunter, Ormak?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How should I train my companion, Ormak?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Tell me where the hunter's road goes from here.", next = "o_road", when = { class = "HUNTER" } },
        { text = "How would you judge a companion that was never a beast, Ormak?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Hunters can't think much of the Light, I'd guess.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "My raptor's from the Sen'jin pens. She bites everyone but me.", next = "xorig_raptor", when = { origin = "troll_raptor_rider" } },
        { text = "Farewell, Ormak.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? Make it quick, the wolves need feeding." } },
    },
    pet = {
      lines = { { id = "p_default", text = "You don't choose it, not really, because the beast chooses whether to follow you. Feed it well, fight beside it, and never leave it behind in a fight." } },
      choices = {
        { text = "A companion is family.", next = "BACK", reply = "Family, aye, and the best kind, because it never asks you for anything but meat.", fx = { align = { light = 1 } } },
        { text = "A companion is a tool, a good one.", next = "BACK", reply = "A good tool, maybe, but it won't love you for that. Treat it like family, and see.", fx = { align = { light = -1 } } },
      },
    },
    hunt = {
      lines = { { id = "h1_default", text = "The Barrens, past the Crossroads, where the zhevra and the lions run. Durotar's scorpids make poor sport and worse eating." } },
      choices = { { text = "And further than that?", next = "hunt_far" } },
    },
    hunt_far = {
      lines = { { id = "h2_default", text = "Ashenvale, if you dare the night elves, and Stonetalon beyond it. A hunter goes where the game is, whatever the warlords say about borders." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Unless it leaves tracks or wears fur, I've nothing to teach you about it." } },
    centaur = { { id = "tp_centaur", text = "Centaur run fast, and a hunter's pet runs faster. Teach your beast to go for the legs, and the centaur won't run at all." } },
    quilboar = { { id = "tp_quilboar", text = "Quilboar keep boars, and boars make good pets if you can tame them. They're stubborn, but they're loyal, which I like." } },
    thrall = { { id = "tp_thrall", text = "The Warchief rides a wolf, and I've watched the way he talks to it. That's a hunter's heart, whatever else he is." } },
  },
}

P:NPC {
  key = "kardris", id = TODO_NPC("Kardris Dreamseeker"), name = "Kardris Dreamseeker",
  prejudice = { race = "Orc", class = "WARLOCK", amount = 12, why = "An orc who takes up the fel again is, to her, choosing the old sickness twice; she is gentler with warlocks of other races." },
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "wise", "devout" },
  notices = { "class" },
  impression = {
    first = "Kardris speaks of the spirits with quiet certainty.",
    third = "{name} met Kardris Dreamseeker, a shaman trainer in Orgrimmar's Valley of Wisdom.",
  },
  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "The spirits draw away from you, warlock, and so do I. Our people drank the demon's blood once and burned Draenor for it, so tell me why an orc would reach for that cup again." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "I was hard on you when we met, warlock, and the spirits have since told me what you are, which is not what I feared. Sit, if you like; I'll not move my mat away." },
    { id = "g_hi", text = "The spirits are restless in the city today. Come, sit where they are quieter." },
  },
  start = "hello",
  nodes = {
    prej_kardris = {
      big = true,
      lines = { { id = "prej_kardris_default", text = "It is, and I'll not hide it. I grew up in the camps on the stories of what the warlocks did to us, how Gul'dan sold our grandfathers to the Legion for power. When an orc comes to me with that stink on him, I see the whole history standing behind him." } },
      choices = {
        { text = "I master the fel so it never masters our people again.", next = "BACK", reply = "Then I'll watch you, and I'll hope you're telling the truth. Master it, and never let it master you.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Power is power. Your spirits never freed us from the camps.", next = "BACK", reply = "The spirits didn't free us, but they waited for us, which is more than the fel ever did. Go, warlock.", fx = { align = { light = -1, order = -1 }, affinity = -1 } },
        { text = "You're right; I'll leave the fel behind when I can.", next = "BACK", reply = "Then the spirits may yet come back to you, as they came back to us. I'll be glad to see it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Watch me, then. I'm not Gul'dan's and I'm not the Blade's.", next = "prej_kardris_calm", fx = { affinity = 1 } },
        { text = "Were there warlocks in the camps too?", next = "prej_kardris_why" },
      },
    },
    prej_kardris_why = {
      lines = { { id = "prej_kardris_why_default", text = "There were, and the humans let them be, because a warlock who'd lost his demons was just another hungry orc. Some taught the young ones in secret, and some of those young ones are the Burning Blade now, in the canyons south of here." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_kardris" }, { text = "Something else.", next = "BACK" } },
    },
    prej_kardris_calm = {
      lines = { { id = "prej_kardris_calm_default", text = "Then I'll watch, and listen, and the spirits will tell me the rest. They have a way of knowing which hands are only borrowing a thing and which hands mean to keep it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_kardris = {
      big = true,
      lines = { { id = "xpt_kardris_default", text = "Respect, first and always, because the elements answer a shaman's call as a favour and never as a duty. A shaman who must heal a careless war band again and again begins to wonder whom the spirits are really serving, so be a companion worth the trouble." } },
      choices = {
        { text = "We'll honour the spirits and the one who speaks to them.", next = "BACK", reply = "The spirits will thank you for that. Be a companion to them, and never a burden.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The spirits answer strength. That's the way of things.", next = "BACK", reply = "They answer respect, not strength. Learn that, or you'll find them silent when you need them.", fx = { align = { order = -1 } } },
        { text = "Something else, Kardris.", next = "BACK" },
      },
    },
    xcl_mc = {
      big = true,
      lines = { { id = "xcl_mc_default", text = "Then you did not kill him, because nobody can kill an elemental lord, but you sent him back to the realm of fire where he belongs, and that is a great thing. The Dark Iron dwarves tore him into this world centuries ago, and fire torn from its place goes mad, which is what you faced." } },
      choices = {
        { text = "Every element has its place, and his isn't here.", next = "BACK", reply = "It isn't, and you've done the world a great service. The fire is back in the deep places where it belongs.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Places change, Kardris. Let the strong elements take what they can.", next = "BACK", reply = "Then you'd let Ragnaros burn the world, and call it change. The spirits would not forgive you.", fx = { align = { order = -1 } } },
        { text = "Ragnaros may return one day.", next = "xcl_mc2" },
      },
    },
    xcl_mc2 = {
      lines = { { id = "xcl_mc2_default", text = "In time, perhaps, because an elemental lord is patient in a way we cannot imagine. But the spirits of the mountain can breathe again for a while, and the Dark Irons who served him will have to learn what they are without a master. I'll be listening for him either way." } },
      choices = { { text = "Then I'll listen too, Kardris.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They do not reject you; they only do not know you. The Light came to my people in the camps, on the hammers of the Silver Hand, and the elements came back to us when we were freed. Perhaps you are walking the same road from the other end." } },
      choices = {
        { text = "Then I'll walk it with respect for the spirits.", next = "BACK", reply = "Then the spirits will learn your name in time, and they don't forget the ones who respect them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My road is the Light. The spirits may keep theirs.", next = "BACK", reply = "Then keep it, and the spirits will keep theirs. Perhaps one day the roads will meet.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The spirits are not jealous, as the demons were; they ask only that we listen and give back what we take. Your prayers may go to the loa or to something in the shadow, but if they mend what was broken, the elements will not think less of you for it." } },
      choices = {
        { text = "Then the spirits and I want the same thing.", next = "BACK", reply = "We do, and the elements will welcome you for it. The Barrens alone could use a hundred of you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers answer to me, not the elements.", next = "BACK", reply = "Then the elements will let you be, as long as you mend. That's all they ask.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The earth holds up the warrior's feet and the fire fills his blood, so yes, though most warriors never stop to listen. Before the demons came, our warriors went to the shaman before every battle to ask the spirits' blessing, and I would see that custom return." } },
      choices = {
        { text = "Then I'll seek the spirits' blessing before I fight.", next = "BACK", reply = "Then come to me before your next battle, and I'll ask the spirits to bless your axe.", fx = { align = { light = 1 } } },
        { text = "My axe needs no spirit's blessing, Kardris.", next = "BACK", reply = "Maybe not, but it would serve you better with it. The offer stands.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every beast has a spirit, and the spirits of the wild watch over those who walk with them honestly. Our ancestors hunted Draenor with wolves at their side long before the demons taught them to hunt their own kind, and the spirits remember that better than we do." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Every beast has a spirit, and the spirits of the wild watch over those who walk with them honestly. Your {pet} has a calm spirit, and that comes from you, {class}, so keep it that way." },
      },
      choices = {
        { text = "I'll honour my companion's spirit in all I do.", next = "BACK", reply = "The spirits of the wild will watch over you both, then. I've seen them do it.", fx = { align = { light = 1 } } },
        { text = "A beast's spirit is its own concern, not mine.", next = "BACK", reply = "Then the spirits will watch you from a distance. Your beast deserves better.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The same land, I think, but different voices in it. The elements speak to us as they rage and settle, and you hear the slower voice beneath them, the one that grows things." } },
      choices = {
        { text = "Each path should keep to its own ways.", next = "BACK", reply = "Perhaps, though I think the land would like it if we spoke more often. Keep your ways, druid.", fx = { align = { order = 1 } } },
        { text = "The two paths should learn from each other freely.", next = "BACK", reply = "I'd like that, and I think the land would too. Come and listen with me sometime.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Our shamans listened to the elements and never needed the arcane, and the first orcs to grasp at stranger powers became Gul'dan's warlocks. The trolls teach you a cleaner kind of magic, I'm told, but I'd ask you never to forget there's more to the world than what you can grasp." },
      },
      choices = {
        { text = "I'll remember. The world is more than power.", next = "BACK", reply = "The spirits will thank you for remembering. Not many warlocks do.", fx = { align = { order = 1 } } },
        { text = "What I can grasp is what I'll use.", next = "BACK", reply = "That's what the first warlocks said, and the spirits went silent. Be careful what you grasp.", fx = { align = { order = -1 } } },
        { text = "What were the orcs before the demons?", next = "before" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They don't hate you, but they turn away from you, and that's worse. When our people began bargaining with demons, the spirits of Draenor went silent, and it took Thrall years to coax them back, so I'll ask you not to walk too near my students." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "They don't hate you, but they turn away from you, and I feel them going now, the closer your servant stands to the fire. When our people bargained with demons, the spirits of Draenor went silent, and it took Thrall years to coax them back, so please don't bring it any nearer." },
      },
      choices = {
        { text = "I understand. I'll keep my distance from them.", next = "BACK", reply = "Thank you. The spirits are frightened of what you carry, and I can't blame them.", fx = { align = { light = 1 } } },
        { text = "Let them turn away. I don't need the spirits.", next = "BACK", reply = "Then they'll turn further, and you'll be alone with your demons. I'll grieve for you.", fx = { align = { light = -1 } } },
        { text = "Why are the spirits restless?", next = "restless" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The elements care about balance, and a blade in the dark can tip the balance either way. Use yours for the Horde and against those who poison the land, and the spirits won't trouble you, but use it for your own greed and they'll remember." },
      },
      choices = {
        { text = "My blade serves the Horde, not my purse.", next = "BACK", reply = "Then the spirits won't trouble you, and neither will I.", fx = { align = { honor = 1 } } },
        { text = "Greed's an honest reason, Kardris.", next = "BACK", reply = "Honest, maybe, but the spirits will remember it. Be careful who you rob.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_tsham = {
      lines = { { id = "xts_default", text = "Your grandmother isn't wrong to worry, because orcs know better than anyone what it costs to forget the voices that raised you. But the earth under Durotar is the same earth under the Echo Isles, and I don't think your loa and my spirits are jealous of each other. Do you still keep their offerings?" } },
      choices = {
        { text = "Every night, beside the totems.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Not as often as she'd like.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_water", when = { questDone = TODO_QUEST("Call of Water") },
          text = "Islen Waterseer tells me the water has answered you, and that you went where she sent you without complaint. That pleases me, because water is the hardest of the elements to hear and the slowest to forgive." },
        { id = "h_pt_sham", tags = { "news" }, when = { party = { class = "SHAMAN" } },
          text = "The spirits sit easier around you, and I think it's because you travel with a shaman. {companion} has a steady way about them, so listen when they tell you the land is uneasy, because they'll hear it long before you do." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who wields the Light. The spirits around you are quiet and uneasy, as though they cannot decide what you are. I find I cannot decide either." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The spirits speak to me, and something else speaks to you, and I would very much like to hear what it says." },
        { id = "h_default", key = true, text = "I am Kardris Dreamseeker, and I guide the shaman of the Horde. The Valley of Wisdom is where the orcs came to remember what they were before the demons." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "Welcome, shaman. Tell me, have the elements spoken to you clearly since we last met?" },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" }, text = "A druid of the tauren, welcome to the Valley of Wisdom. Your people kept faith with the Earth Mother while mine forgot the spirits entirely, and we have learned much at your elders' fires." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior in the Valley of Wisdom. Good, because the elements respect a strong spirit as much as a wise one, and you may have more of the first than you think." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and a beast who walks with you. The spirits of the wild are close to the elements, and I can feel them gathered around you both." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue in the Valley of Wisdom. The spirits see you, even when nobody else does." },
        { id = "h_cl_mc", tags = { "news" }, when = { cleared = "Molten Core", faction = "Horde" }, text = "The fire spirits have been quieter these past days, as if something in Blackrock Mountain stopped burning so hot. I think you know why, because your boots still stink of the Firelord's hall." },
      },
      choices = {
        { text = "You flinch from me, Dreamseeker. Is it the fel you smell?", next = "prej_kardris", when = { prejudiced = true } },
        { text = "Do the spirits mind that a priest prays to something else?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shaman and druid must hear the same voices.", next = "druid_q", when = { class = "DRUID" } },
        { text = "What were the orcs before the demons?", next = "before" },
        { text = "The spirits seem restless here.", next = "restless" },
        { text = "Did the orc shamans ever study the arcane?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "The elements can't care much for warriors.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the spirits watch over my companion, Kardris?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The spirits must hate me, Kardris.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the elements care what a rogue does?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The spirits must reject a Forsaken paladin, Kardris.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I faced Ragnaros in the Molten Core, Kardris.", next = "xcl_mc", when = { cleared = "Molten Core", faction = "Horde" } },
        { text = "Our shaman keeps us alive. What do they owe the spirits?", next = "xpt_kardris", when = { party = { class = "SHAMAN" } } },
        { text = "My grandmother says your teaching made me forget the loa.", next = "xorig_tsham", when = { origin = "troll_orgrimmar_shaman" } },
        { text = "Farewell.", next = "END" },
      },
      again = { { id = "h_again", text = "Ask what you wish. Wisdom grows by sharing it." } },
    },
    before = {
      lines = { { id = "b_default", text = "Clans who honored the land and its spirits, and shaman who listened rather than commanded. The warlocks taught us to take, and the Warchief is teaching us again to ask." } },
      choices = { { text = "The old ways might return someday.", next = "before_return" } },
    },
    before_return = {
      lines = { { id = "br_default", text = "They already have, in every shaman who answers the elements' call. It is slow, and some orcs still long for the fel, but the spirits are patient with us." } },
      choices = {
        { text = "Then those who cling to the fel must be stopped.", next = "BACK", reply = "They must, and I'll help if I'm asked. The fel took too much already.", fx = { align = { order = 1 } } },
        { text = "Each orc must find his own way back.", next = "BACK", reply = "They must, and the spirits will wait for them. The spirits waited for all of us in the camps.", fx = { align = { order = -1 } } },
      },
    },
    restless = {
      lines = { { id = "r_default", text = "A city is many voices, and some of them are angry. The spirits feel every grudge in Orgrimmar, and there are a great many of those." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The spirits have not shown me that. Perhaps they will, in time." } },
    the_elements = { { id = "tp_the_elements", text = "The elements spoke to the orcs long before the demons came, and they speak to us again now. Listen to them, and they will tell you more than any book." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is the greatest shaman of our people, and he learned it from Drek'Thar in the mountains of Alterac. He is proof that the old ways can come back." } },
    earth_mother = { { id = "tp_earth_mother", text = "The tauren speak of the Earth Mother, and the spirits of earth know her well. I find their faith a comfort, though I do not share it." } },
    burning_legion = { { id = "tp_burning_legion", text = "The warlocks turned away from the spirits and called demons instead, and the spirits went silent for a generation. I do not forgive that, and I do not forget it." } },
  },
}

P:NPC {
  key = "zevrost", id = TODO_NPC("Zevrost"), name = "Zevrost",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "ambitious", "cunning" },
  notices = { "class", "fel" },
  impression = {
    first = "He insists the power he teaches is only a tool.",
    third = "{name} met Zevrost, the warlock trainer in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the Cleft. The rats down here are friendlier than the faces above, and better fed." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Come in out of the light, my friend. Nobody up there will miss you, and down here someone always notices when you're gone." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, and still in one piece, I see. The Cleft keeps a student's place for as long as the student keeps their nerve." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "The city whispers that someone took one of your tales for the truth. That's a useful skill for a student of shadow, provided you remember who you must never lie to." },
  },
  notice = {
    { id = "n_succ", cat = "fel", when = { class = "WARLOCK", pet = { family = "Succubus" } },
      text = "Your succubus is smiling at me. I'd smile back, but I know exactly what she's pricing, and I'm not for sale." },
    { id = "n_taint", cat = "fel", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "You've a little green under the skin of your wrists, my friend. Don't hide it from me; hide it from the guards at the top of the ramp." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Threaten? It despises them, which is not the same thing. But you are dead and the Light answers you anyway, so I suspect you understand better than most that power doesn't care who holds it, only how firmly." } },
      choices = {
        { text = "The Light is no mere tool, Zevrost.", next = "BACK", reply = "Isn't it? You wield it and it answers, which sounds very like a tool to me, but believe what you like.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. Power is power, however it shines.", next = "BACK", reply = "Ah, you see it! Hold it firmly, and it won't matter what colour it shines.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Closer than either of us would say aloud in the Valley of Wisdom. You draw on the dark to mend and to hurt, and I draw on it to bind, and the difference is mostly in who holds the leash, which is a thing the Warchief's shaman never quite understand." } },
      choices = {
        { text = "The difference is that I don't bind anyone, Zevrost.", next = "BACK", reply = "Not yet, priest, but the shadow is very persuasive. We'll see.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Perhaps we're not so different. I'll remember that.", next = "BACK", reply = "I'll remember it too. The Valley of Wisdom needn't hear about our little understanding.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every use, I assure you, though most warriors don't care for the answer. A demon guards the front of a fight well enough, but a warrior beside us keeps the enemy's eyes off the caster, and a warlock who isn't being stabbed is a warlock who wins." } },
      choices = {
        { text = "I'd never fight beside a demon. The Horde learned that lesson.", next = "BACK", reply = "Then you'll fight alone, and the demon will win the fight anyway. That's your loss, warrior.", fx = { align = { light = 1 } } },
        { text = "If a demon wins the fight, I'll fight beside it.", next = "BACK", reply = "Now there's a practical warrior, rarer than a quiet imp. We'll work well together.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Your beast loves you, and mine would devour me the moment I faltered, so I suppose the difference is trust. A hunter tames by patience and a warlock binds by will, and only one of us sleeps soundly at night, though I'll leave you to guess which." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your beast loves you, and mine would devour me the moment I faltered, so I suppose the difference is trust. Your {pet} doesn't care for me, I see, because animals can smell the Twisting Nether on our robes." },
      },
      choices = {
        { text = "Trust is stronger than any binding, warlock.", next = "BACK", reply = "Perhaps, but trust can be betrayed, and a binding never forgets. I'll keep my bindings.", fx = { align = { light = 1 } } },
        { text = "Binding by will sounds more reliable than trust.", next = "BACK", reply = "It is, and it's why I sleep at all, though not soundly. Come and study, if you like.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It burned a world and carried us through the Dark Portal, and it cost us everything else, so I suppose that depends on how you count. The Warchief keeps us on a short chain, and I teach my students to remember why, which is more than the Shadow Council ever did." } },
      choices = {
        { text = "Nothing the demons gave was worth what it cost us.", next = "BACK", reply = "Perhaps, and I won't argue it with a shaman. But the power was real, and so were the victories.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power, and only fools refuse a weapon.", next = "BACK", reply = "Then you've understood the Cleft better than most of the Valley. Welcome, shaman.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Friendly is a strong word, but we understand one another, which is rarer. The rogues keep their secrets and we keep ours, and the Warchief's guards watch us both, so we all behave impeccably." },
      },
      choices = {
        { text = "Good. The Warchief's watch keeps us all honest.", next = "BACK", reply = "It does, and we behave impeccably for it. You'll find the Cleft very polite.", fx = { align = { order = 1 } } },
        { text = "Secrets are what keep the Cleft alive.", next = "BACK", reply = "They do, and you understand the Cleft better than most. Keep yours well.", fx = { align = { order = -1 } } },
        { text = "What is the Cleft of Shadow, really?", next = "cleft" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Cleaner, you say, and yet it was the arcane that first drew the Legion's eye to this world. I'll grant your craft has a better name in Orgrimmar, but power is power, and both of us study it because we want more of it." },
      },
      choices = {
        { text = "I want power to protect, not to hold.", next = "BACK", reply = "Protect, hold, it's all the same once you have it. Tell yourself what you like, mage.", fx = { align = { light = 1 } } },
        { text = "True enough. We both want more, and that's fine.", next = "BACK", reply = "I'm glad someone in this city admits it. We'll get along, you and I.", fx = { align = { light = -1 } } },
        { text = "Isn't this the magic that ruined the orcs?", next = "ruin" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The same way you call claws and fangs a tool, druid, because power belongs to whoever has the will to hold it. The difference is only that my tools must be watched, and I watch them more closely than any guard up those stairs." } },
      choices = {
        { text = "The Warchief permits you, and I'll watch you as closely as he does.", next = "BACK", reply = "Then watch closely, druid, and you'll find nothing to report. I'm very careful.", fx = { align = { order = 1 } } },
        { text = "Power is power. I won't judge how you choose to hold yours.", next = "BACK", reply = "A druid with sense, how refreshing. Hold yours, and I'll hold mine.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin, here in the Cleft, now there's a thing. The Light and my arts rarely share a room, and yet here we both are, serving the same Warchief." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest in the Cleft of Shadow. You'll find the shadows here darker than the ones you pray in, but you'll find we have that much in common." },
        { id = "h_default", key = true, text = "I am Zevrost, and I teach those with the will to command what others fear. The Warchief permits us, so long as we remember who serves whom." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "One of mine, and welcome. Your demon is well leashed, I hope, because the guards above notice when it isn't, and they never notice when it is." },
        { id = "h_fslock", when = { race = "Scourge", class = "WARLOCK" }, text = "A Forsaken warlock, down from Undercity's Magic Quarter to see how the orcs do it. You'll find us more nervous than your teachers and, I like to think, more careful." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Cleft of Shadow. Your path and mine both began with the shaman of Draenor, though you'd rather forget it, so do try not to glare at my students." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, in the Cleft of Shadow. You change your own flesh and call it nature, and I bind demons and call it discipline, so perhaps we're less different than your kind would like." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, here among the warlocks? How brave of you, or how lost; the Valley of Honor is up the stairs and well away from us." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, with a pet of flesh and fur. We warlocks keep pets as well, though ours are rather harder to feed." },
      },
      again = {
        { id = "h_again", text = "More questions? Curiosity is the first step to power, after all." },
        { id = "h_again2", text = "Go on, I'm in no hurry. Nobody in the Cleft is ever in a hurry, except to leave before the guards change." },
        { id = "h_again3", text = "Ask, my friend. I'll answer, and you can decide later how much of it to believe." },
      },
      choices = {
        { text = "Teach me, Zevrost.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What do you teach that Mirket doesn't?", next = "fear", when = { class = "WARLOCK" } },
        { text = "The fel whispers to me when I sleep.", next = "whisper", when = { class = "WARLOCK", taint = { min = 20 } } },
        { text = "I died to a warlock's plague once. Now I am one.", next = "plague", when = { race = "Scourge", class = "WARLOCK" } },
        { text = "Is a priest's shadow anything like your craft, Zevrost?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Your kind traded the elements for demons. Was it worth it?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How can you call demon magic a mere tool, Zevrost?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Rogues and warlocks share the Cleft. Friendly neighbours, I'm sure.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The arcane is cleaner than what you teach, Zevrost.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do warlocks have any use for warriors, Zevrost?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How is a demon different from a hunter's beast, Zevrost?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The Light must threaten your arts, Zevrost.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "This is the magic that ruined the orcs.", next = "ruin" },
        { text = "You talk like a merchant with something to sell.", next = "sell" },
        { text = "What is the Cleft of Shadow?", next = "cleft" },
        { text = "I'll go.", next = "END" },
      },
    },
    fear = {
      lines = { { id = "fe_default", text = "Fear, mostly. Mirket teaches you the sums, and I teach you the moment a man's courage leaves him and he turns his back to run, because that moment is worth more than any curse in your book. You'll learn Fear first, Howl of Terror later, and Death Coil for the one who won't break." } },
      choices = {
        { text = "Mirket calls that theatre.", next = "fear2" },
        { text = "Show me the spells, then.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear2 = {
      narr = "He smiles slowly, and steps back half a pace so the shadow of the Cleft wall falls across his face.",
      lines = { { id = "fe2_default", text = "She does, and she's right, and she's never understood why that isn't an insult. A frightened enemy makes mistakes your arithmetic can't predict, and every one of those mistakes is a gift to you, so learn her sums and my theatre both, and you'll outlive us." } },
      choices = { { text = "Sums and theatre. I'll learn both.", next = "BACK", reply = "Good. Don't tell her I said she was right; she'd never let me forget it." } },
    },
    whisper = {
      big = true,
      lines = { { id = "wh_default", text = "Of course it does, and it will promise you things, sensible things at first. Every warlock in this Cleft hears it, my friend, and the only difference between us and the Burning Blade is what we do in the morning. What do you mean to do?" } },
      choices = {
        { text = "Listen, and take what's useful.", next = "BACK", reply = "Ambitious, and honest about it. Take it, then, but count what you take, or someone else will count it for you.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Shut it out, whatever it offers.", next = "BACK", reply = "Admirable, and harder than it sounds. Tell me in a year whether you still can.", fx = { align = { light = 1 } } },
        { text = "I'd rather not say.", next = "BACK", reply = "Wise. Down here, that's the safest answer anyone gives." },
      },
    },
    plague = {
      lines = { { id = "pl_default", text = "Kel'Thuzad's cult gave you the plague, and now you take up the craft that cult was built on. I don't pity you; I envy you a little, because you've seen the end of this road already and came back to walk it with your eyes open." } },
      choices = {
        { text = "I walk it to burn the Scourge.", next = "BACK", reply = "Then the Dark Lady chose her warlocks well. Burn them thoroughly, and I'll teach you how." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    sell = {
      lines = { { id = "se_default", text = "Everyone in the Cleft is selling something, and I'm only honest enough to sound like it. The rogues sell silence and the reagent man sells shards and candles, and I sell the idea that you can hold this power and stay yourself." } },
      choices = {
        { text = "And is that idea true?", next = "sell2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sell2 = {
      lines = { { id = "se2_default", text = "It's true for the ones who believe it hardest and check it most often. The old warlocks believed it once and stopped checking, and you know what came of them, so I sell the belief and I insist on the checking." } },
      choices = { { text = "A merchant who insists on quality, then.", next = "BACK", reply = "It is, and my prices are fair, or at least they're Orgrimmar prices." } },
    },
    ruin = {
      lines = { { id = "r_default", text = "The orcs were ruined by bowing to demons, not by learning their names. A warlock commands and a slave obeys, and there is all the difference in the world between them." } },
      choices = {
        { text = "And if the demon wins, the warlock is lost.", next = "ruin_wins" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    ruin_wins = {
      big = true,
      lines = { { id = "rw_default", text = "Then the warlock was weak, and the Horde is better rid of him. That's the price of the art, and every student of mine pays it willingly." } },
      choices = {
        { text = "Power like that should be watched closely.", next = "BACK", reply = "It should, and I watch it more closely than anyone. That's the art.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Strength takes risks. The weak can stay above.", next = "BACK", reply = "And the weak are welcome to their sunlight. Down here, we take the risk.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    cleft = {
      lines = { { id = "c_default", text = "It's the lowest part of the city, where rogues and warlocks and the less welcome trades keep their shops. The Warchief knows we're here, and so long as we pay the guards on time, he doesn't come down to look." } },
      choices = {
        { text = "And the cave at the bottom?", next = "cleft2" },
        { text = "Back to the other questions.", next = "BACK" },
      },
    },
    cleft2 = {
      lines = { { id = "c2_default", text = "Ragefire Chasm, where the Searing Blade keep their own little congregation under our feet. They're the reason the guards count us so carefully, and I can't say I blame the guards." } },
      choices = { { text = "Let's talk about something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Some things are better left unasked in the Cleft, friend." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion's power is a tool, nothing more, and a tool can be used by anyone with the will to master it. The old warlocks lost that mastery, and I don't intend to make their mistake." } },
    thrall = { { id = "tp_thrall", text = "The Warchief tolerates us, which is wiser than most would be. He knows the Horde needs every weapon it can find, even the ones that make him uncomfortable." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken have warlocks too, and they're less squeamish than ours. I find them refreshing company, if a little cold." } },
    dark_portal = { { id = "tp_dark_portal", text = "The Dark Portal was our door into this world, and the warlocks of the old Horde opened it. I sometimes wonder what's left of Draenor on the other side, though I'm in no hurry to find out." } },
  },
}
