-- Magistrate Solomon, Lakeshire Town Hall. Voice: bibles/solomon.md
-- Elected, besieged, and out of patience with everyone who isn't sending help.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Solomon's grievance against the kaldorei (authored, not canon): a rumour that suits his letters.
P:Claim {
  id = "solomon_ashenvale_soldiers", by = "solomon", truth = "false",
  text = "Stormwind spares soldiers to guard the night elves' forests in Ashenvale while Lakeshire is left to the orcs.",
  truthNote = "In Year 1 the Sentinels hold Ashenvale alone; Stormwind's few regiments are at its own borders and none has gone to Ashenvale. Solomon heard it from a clerk in the Keep and believes it because it fits his grievance.",
  tell = "true",
  exposedBy = { "vimes.vne_ash", "solomon.sxs_default" },
}
P:NPC {
  key = "solomon", id = TODO_NPC("Magistrate Solomon"), name = "Magistrate Solomon",
  bible = "bibles/solomon.md", role = "noble", tier = "major",
  communities = { "lakeshire" }, temper = { "sharp" }, values = { "lawful", "stern" },
  likesTone = "polite",
  prejudice = { class = "WARLOCK", amount = 10, why = "A magistrate: Stormwind's law names demon-summoning a crime, and Lakeshire buried its dead after the Horde's warlocks came through." },
  notices = { "reputation", "deputy" },

  impression = {
    first = "He keeps writing letters that nobody will answer.",
    third = "{name} was received by Magistrate Solomon, Lakeshire's elected leader, whose letters asking for help mostly go unanswered.",
  },

  greetings = {
    { id = "g_hu", when = { race = "Human" }, priority = 5,
      text = "Another of Stormwind's own come up the Redridge road. The court will hear you, and it will try not to hold the kingdom's silence against you personally." },
    { id = "g_nelf", when = { race = "NightElf" }, priority = 5,
      text = "The court recognises a kaldorei visitor, which is rare enough in Lakeshire that the clerk will want to note it. I trust you've not come to ask Redridge for archers." },
    { id = "g_nelf_soft", when = { race = "NightElf", npcFlagBefore = "solomon_nelf_soft" }, priority = 10,
      text = "Ah, the kaldorei who corrected the court's record. Sit, if you can find a chair; the court has not forgotten that it owes you an apology, and it has paid it once already." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "The law of Stormwind names the summoning of demons a crime, and this court has not forgotten it. You may state your matter, but do not mistake my patience for approval." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "Lakeshire buried its dead after the Horde's warlocks passed through in the last war. Be brief, and be careful." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "The court has watched you serve Lakeshire well, and it is honest enough to say so. It has not, however, changed its opinion of your art." },
    { id = "g_op_dragons_myth", when = { opinion = { topic = "dragons", stance = "myth" } }, text = "Ah. The traveller who considers dragons tavern talk. The court welcomes you all the same, and it will be delighted to be proven wrong." },
    { id = "g_brief", text = "Be brief, if you please; the orcs never are." },
    { id = "g_letters", when = { questActive = TODO_QUEST("Messenger to Westfall") }, text = "Why are you still standing in my hall? Take the letter to Westfall, and go quickly." },
    { id = "g_hero", when = { townStanding = { town = "lakeshire", min = 55 } }, text = "Ah, Lakeshire's champion. Sit, if you like; you're the only visitor I don't mind." },
    { id = "g_distrust", when = { townStanding = { town = "lakeshire", max = -20 } }, text = "The court has heard your name, and not kindly." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and in that time I've written Stormwind four more letters. None has been answered, so do sit down." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "The court notes you've returned after {away}, and rather more formidable than you left. Lakeshire could use formidable, so you are welcome in this hall." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "It has come to the court's attention that you were caught in a falsehood in this town. I'll have the truth in my hall, or I'll have nothing at all." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The court has heard you've done Lakeshire real service these past days. It is noted, and I note very few things kindly." },
  },

  notice = {
    { id = "n_deputy", cat = "deputy", place = "before", when = { questDone = TODO_QUEST("The True Masters") },
      text = "So you're the Regent's deputy. I asked Stormwind for an army and it sent me you, and I've stopped being insulted by that, because you've earned it." },
    { id = "n_hero", cat = "reputation", when = { townStanding = { town = "lakeshire", min = 30 } },
      text = "The fishermen say your name now when they talk about the lake being safe. The fishermen never agree on anything." },
  },

  start = "hello",
  nodes = {
    op_dragons = {
      lines = {
        { id = "op_dragons_a", text = "The court has a suspicion it can't yet prove. The Blackrock fight like an army with a general behind them, and the old soldiers in the inn swear they've seen black wings over the Steppes at dusk. You've travelled further than my bailiff, so tell me: do dragons meddle in the affairs of men?" },
      },
      choices = {
        { text = "They do. The black dragonflight is behind more than orcs.", next = "op_dragons_1", fx = { opinion = { black_dragonflight = "fight", dragons = "dangerous" }, align = { order = 1 }, affinity = 2 } },
        { text = "Dragons? That's tavern talk. The orcs need no masters to raid.", next = "op_dragons_2", fx = { opinion = { black_dragonflight = "myth", dragons = "myth" }, align = { order = -1 }, trait = { skeptical = 1 }, affinity = -1 } },
        { text = "Whoever leads them, Lakeshire needs soldiers more than answers.", next = "op_dragons_3", fx = { opinion = { dragons = "unknown", stormwind = "abandoned_its_own" }, trait = { practical = 1 } } },
        { text = "The red dragonflight were slaves of the orcs. Dragons can be used.", next = "op_dragons_4", when = { origin = "dwarf_military_ward" }, fx = { opinion = { dragons = "dangerous", orcs = "distrust" }, trait = { curious = 1 } } },
        { text = "The court should ask someone wiser than me.", next = "BACK" },
      },
    },
    op_dragons_1 = {
      lines = { { id = "op_dragons_r1", text = "The court is gratified to hear it from someone who doesn't sign his letters 'Magistrate'. Write it down, sign it, and I'll send it to the Keep with the rest." } },
      choices = { { text = "Something else, Magistrate.", next = "BACK" } },
    },
    op_dragons_2 = {
      lines = { { id = "op_dragons_r2", text = "The Keep says the same, word for word, in rather finer handwriting. The court notes your view, and the court also notes how many orcs it has buried this year." } },
      choices = { { text = "Something else, Magistrate.", next = "BACK" } },
    },
    op_dragons_3 = {
      lines = { { id = "op_dragons_r3", text = "Spoken like a bailiff, and I mean that kindly. Soldiers first, then, and the truth when someone has time to climb the Spire and ask for it." } },
      choices = { { text = "Something else, Magistrate.", next = "BACK" } },
    },
    op_dragons_4 = {
      lines = { { id = "op_dragons_r4", text = "Grim Batol, yes, I'd forgotten your people saw that firsthand. Then perhaps the question isn't whether dragons serve orcs, but who's holding whose leash this time." } },
      choices = { { text = "Something else, Magistrate.", next = "BACK" } },
    },
    xcl_ubrs = {
      big = true,
      lines = { { id = "xcl_ubrs_default", text = "I said so in forty letters, and the forty-first is on my desk now, informing the Keep that the matter was resolved by a private citizen at no cost to the crown. I'd hoped to feel vindicated, but mostly I feel tired, because the Blackrock are still in my hills and no dragon's death will move them." } },
      choices = {
        { text = "Send the letter anyway, Magistrate. The record matters.", next = "BACK", reply = "It does, and I will, because someday a clerk in Stormwind will read it and wonder why nobody listened. I'd like them to know the answer.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stop writing. Stormwind won't listen, so Lakeshire should act alone.", next = "BACK", reply = "I've been tempted, believe me, more than once a week. But a town that stops writing to its king is a town that's forgotten it has one.", fx = { align = { order = -1 } } },
        { text = "Who was Drakkisath, Magistrate?", next = "xcl_ubrs2" },
      },
    },
    xcl_ubrs2 = {
      lines = { { id = "xcl_ubrs2_default", text = "A general of the black dragonflight, by the reports, who commanded the orcs from the top of the Spire while his masters stayed out of sight. The court does not know who those masters are, and it has stopped guessing aloud, because guessing aloud in this kingdom is how a magistrate loses his post." } },
      choices = {
        { text = "Keep guessing quietly, then, and I'll keep listening.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Slow? It hasn't answered one of them, and I've carried Lakeshire's danger on paper for too long. Your spirits might reach where my letters can't." } },
      choices = {
        { text = "Keep writing, Magistrate. Someone will listen.", next = "BACK", reply = "I'll keep writing, of course; the court's quills outnumber its soldiers. Someone in the Keep must read them eventually.", fx = { align = { order = 1 } } },
        { text = "Stop writing letters, Magistrate, and act yourself.", next = "BACK", reply = "Act how, with what, against whom? I am acting, as best a magistrate can, and that means letters.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "I've had that same unpleasant thought, and it's why I seal every one with wax and my own ring. If someone in Stormwind is reading Lakeshire's mail and doing nothing about it, I'd sooner know it than suspect it." } },
      choices = {
        { text = "Then I'll find out quietly who reads them.", next = "BACK", reply = "Quietly, yes, and report to me alone, if you would. I'll not have rumours of it in the court.", fx = { align = { honor = -1 } } },
        { text = "Seal them and trust the crown. That's proper.", next = "BACK", reply = "I do seal them, and I do trust the crown, mostly. It's the crown's clerks I'm less sure of.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What do the letters say?", next = "letters" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "It was Ilgalar's tower, a wizard dead long before my time, and now a necromancer called Morganth squats in it. I've written to the Mage Quarter about him twice, and they've answered neither letter." } },
      choices = {
        { text = "I'll carry word to the Mage Quarter, properly.", next = "BACK", reply = "Properly, yes, with my seal, and the Mage Quarter will have to answer someone. Thank you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget Stormwind. I'll deal with Morganth myself.", next = "BACK", reply = "Then do, and I'll put it in the record myself. Someone ought to deal with him.", fx = { align = { order = -1 } } },
        { text = "Who is Morganth?", next = "morganth" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Lakeshire has noticed, I assure you, though Stormwind has yet to read my letters about it. The Blackrock clan cuts what it needs for its war machines and burns the rest. If you can slow them, I will put it in writing to the Keep." } },
      choices = {
        { text = "Then I'll drive them off the slopes myself.", next = "BACK", reply = "Then I'll write to the Keep about you, and gladly. That will make a nice change from asking.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your letters won't save a single tree.", next = "BACK", reply = "No, but they'll remember the trees were cut, and who was asked to stop it. Records matter, even when they don't.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xalt_solomon = {
      big = true,
      lines = { { id = "xalt_solomon_default", text = "{alt}, a {altclass}, who read my letters to Stormwind without once telling me they were too long. Lakeshire remembers the few who came when the Regent did not, and that name is written in the court's book in my own hand." } },
      choices = {
        { text = "The Crown will answer in its time, Magistrate. Keep writing.", next = "BACK", reply = "I'll keep writing, then, and keep the court's book open. The Crown has more patience than Lakeshire.", fx = { align = { order = 1 } } },
        { text = "Forget Stormwind. Free swords will serve Lakeshire better.", next = "BACK", reply = "They have so far, I'll admit, and I'll not turn any of them away. But a town still needs a king.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    sol_nelf = {
      lines = {
        { id = "sn_default", key = true, fx = { hear = "solomon_ashenvale_soldiers" },
          text = "The court has no quarrel with the kaldorei as a people; it has a quarrel with being forgotten. I'm told the crown has men to spare for the night elves' forests in Ashenvale, while Lakeshire holds the Everstill bridge with fishermen and a few tired guards." },
      },
      choices = {
        { text = "Who told you Stormwind sends men to Ashenvale?", next = "sol_nelf_2" },
        { text = "That sounds like a rumour, Magistrate.", next = "sol_nelf_2" },
      },
    },
    sol_nelf_2 = {
      big = true,
      lines = {
        { id = "sn2_default",
          text = "A clerk in the Keep, over a cup of something, and I grant you that clerks talk. But the letters from Darnassus are answered within the week and mine have waited forty, so the court may be forgiven for drawing its own conclusions." },
      },
      choices = {
        { text = "The Alliance owes the kaldorei for Hyjal. Their claim is fair.", next = "BACK",
          reply = "Perhaps it is, and the court does not dispute the debt. It disputes the order in which debts are paid.",
          fx = { align = { order = 1 }, opinion = { night_elves = "respect" } } },
        { text = "Stormwind's own towns come before any elf's forest.", next = "BACK",
          reply = "The court could not have put it better, and it intends to put it exactly so in its forty-first letter.",
          fx = { align = { order = -1 }, opinion = { night_elves = "distrust" } } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    sol_xnelf = {
      lines = {
        { id = "sx_default", key = true, fx = { hear = "solomon_ashenvale_soldiers" },
          text = "Resent is a strong word for a court to use, so I'll choose a smaller one: I envy you. Your envoys are heard in Stormwind within the week, and I'm told the crown keeps soldiers in your forests, while my letters wait forty weeks for an answer that never comes." },
      },
      choices = {
        { text = "Darnassus answers to the Alliance, as Lakeshire does. Be patient.", next = "BACK",
          reply = "The court has been patient for two years, kaldorei, and patience has not yet held a bridge. But it hears you.",
          fx = { align = { order = 1 } } },
        { text = "Then go around the crown. Write to Darnassus yourself.", next = "BACK",
          reply = "Go around the crown? The court will pretend it did not hear that, and then it will think about it all night.",
          fx = { align = { order = -1 } } },
        { text = "No Stormwind soldier stands in Ashenvale. The Sentinels hold it alone.", tag = "Persuade", next = "sol_xnelf_soft",
          check = { pass = { any = { { disposition = { min = 55 } }, { townStanding = { town = "lakeshire", min = 30 } }, { questDone = TODO_QUEST("The True Masters") } } } },
          fail = { next = "sol_xnelf_fail", fx = { affinity = -1 } } },
      },
    },
    sol_xnelf_soft = {
      lines = {
        { id = "sxs_default", key = true, fx = { npcFlag = { set = { "solomon_nelf_soft" } }, expose = "solomon_ashenvale_soldiers" },
          text = "Alone? Then my clerk was talking out of his cup, and the court has been sharpening its envy on a rumour. It strikes the remark from the record and apologises to you, which it does not often do." },
      },
      choices = {
        { text = "Thank you, Magistrate. We're both forgotten, it seems.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sol_xnelf_fail = {
      lines = {
        { id = "sxf_default", text = "That is precisely what an envoy would say, and the court has heard a great many envoys. Bring the court something it can enter in the record, and it will listen." },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
        { text = "I'll leave you to your letters.", next = "END" },
      },
    },
    sol_nsoft = {
      lines = {
        { id = "sns_default", text = "One, as it happens, to Astranaar, asking whether the Sentinels have any counsel on holding a line with too few. The court does not expect an answer, but it is a pleasant change to write to someone who isn't Stormwind." },
      },
      choices = {
        { text = "They may surprise you. Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll leave you to your letters.", next = "END" },
      },
    },
    hu_sol = {
      lines = {
        { id = "hus_default", key = true,
          text = "Because it is ours, and because that is what our people do, for better and for worse. Blackhand's raiders burned this town in the first war, Turalyon brought the families home after the second, and they laid the same stones by the same lake, which a wiser people might not have done." },
        { id = "hus_redridge", when = { origin = "human_redridge_born" },
          text = "You of all people know the answer, since your own family walked back to this lake after the second war and laid its stones again. That is what our people do, for better and for worse, and a wiser people might not have done it." },
      },
      choices = {
        { text = "A wiser people? You sound ashamed of us, Magistrate.", next = "hu_sol_2" },
        { text = "Stubbornness kept Lakeshire alive, I'd say.", next = "hu_sol_2" },
      },
    },
    hu_sol_2 = {
      big = true,
      narr = "He squares a stack of letters against the desk, though it was square already.",
      lines = {
        { id = "hus2_default",
          text = "Not ashamed, but honest, which the court considers a duty. Lordaeron housed our refugees after Stormwind fell, and when the war was won the kingdoms of men quarrelled over the cost of the orc camps; Gilneas walled itself in, Stromgarde marched home, and nobody was left standing beside Lordaeron when the plague came." },
      },
      choices = {
        { text = "We rebuild when others would quit. That's the best of us.", next = "BACK",
          reply = "The court agrees with half of that and enters the other half as a dissent. Stubbornness held the bridge last week; it also writes forty letters to a throne that will not read them.",
          fx = { align = { order = 1 }, opinion = { humans = "pride" } } },
        { text = "Men squabble over coin while kingdoms burn. We earned our ruin.", next = "BACK",
          reply = "Earned is a word for priests, not magistrates. But the court has read the ledgers of the last war, and it cannot quite call you wrong.",
          fx = { align = { order = -1 }, opinion = { humans = "shame" } } },
        { text = "And what became of Lordaeron's debt?", next = "hu_sol_3" },
      },
    },
    hu_sol_3 = {
      lines = {
        { id = "hus3_default",
          text = "It is owed still, and it will never be paid, because there is nobody left in Lordaeron's capital to pay it to. So Lakeshire pays it the only way it can: every refugee from the north who finds this road gets a bed and a meal, and the court does not ask whether the town can afford it." },
        { id = "hus3_refugee", when = { origin = "human_lordaeron_refugee" },
          text = "You are standing in front of the only payment the court can make. Every refugee from the north who finds this road gets a bed and a meal, and if Lakeshire cannot afford it, the court has decided not to notice." },
      },
      choices = {
        { text = "That's a decent way to pay it, Magistrate.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    hu_sol_x = {
      lines = {
        { id = "husx_default", key = true,
          text = "We do, and the court won't pretend otherwise; we are a people of petitions and long memories for small slights, which you'll forgive in a race that lives sixty years and spends forty of them arguing. Being human, as far as this court can tell, means building a town in an orc's shadow, expecting the crown to send help, and building it again when the crown doesn't." },
      },
      choices = {
        { text = "That stubbornness built Stormwind twice. It's worth admiring.", next = "BACK",
          reply = "Kind of you to say, and the court will record it, since it so rarely hears anything kind about itself from outside the kingdom.",
          fx = { align = { order = 1 }, opinion = { humans = "admire" } } },
        { text = "It sounds like a people who never learn.", next = "BACK",
          reply = "The court has had that thought itself, usually around the fortieth letter. It would still rather not hear it from a guest.",
          fx = { align = { order = -1 }, opinion = { humans = "mixed" }, affinity = -1 } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_hu", when = { race = "Human" },
          text = "You have a Stormwind face, if the court may say so, and Stormwind faces have grown scarce in Lakeshire since my letters stopped being answered." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Your people's envoys are heard in Stormwind's court within the week, I'm told, which is more than can be said for mine. You will forgive the magistrate a certain coolness." },
        { id = "h_alt_any", when = { alt = true, metBefore = false },
          text = "The court has had dealings with a {altrace} {altclass} called {alt}, and I note for the record that you bear a strong resemblance. If you share that one's sense of duty, Lakeshire will be glad of you." },
        { id = "h_alt_back", when = { alt = { days = 30 }, metBefore = true }, cooldown = "5d",
          text = "{alt} called on the court only recently, and I put that visit in the record beside yours. It is a sad thing when a magistrate can count his town's friends by name, but Lakeshire has so few that I can." },
        { id = "h_cl_ubrs", tags = { "news" }, when = { cleared = "Upper Blackrock Spire", faction = "Alliance" },
          text = "The court is informed that General Drakkisath is dead in Blackrock Spire, and that you were present. The court would like it entered in the record that Lakeshire said so first, and was told it lacked proof." },
        { id = "h_druidx", when = { race = "NightElf", class = "DRUID" },
          text = "A druid of the kaldorei in Lakeshire. I confess I have little notion what your people make of ours." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "This court knows what you are, and the law of Stormwind is quite plain on the matter. I will hear you, because Lakeshire needs help, but I will not pretend to welcome it." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You have served Lakeshire faithfully, and the court records it. Say what you came to say." },
        { id = "h_default", key = true,
          text = "I am Solomon, elected Magistrate of Lakeshire, which means the people chose me to be the one who writes the letters nobody answers, most of them about Stonewatch Keep." },
        { id = "h_new", when = { maxLevel = 17 },
          text = "You've come up from Elwynn? Good, because Lakeshire needs every blade it can borrow, even the short ones." },
        { id = "h_westfall", tags = { "news" }, when = { questActive = TODO_QUEST("Messenger to Westfall") },
          text = "I hear they've raised a militia in Westfall, farmers with spears holding their own. Take my letter to their leader, Gryan Stoutmantle; if anyone understands our plight, it's him." },
        { id = "h_westfall_done", tags = { "news" }, when = { questDone = TODO_QUEST("Messenger to Westfall") },
          text = "Stoutmantle can't spare a man. I'd be angrier if I didn't know exactly how he feels." },
        { id = "h_gath", when = { questActive = TODO_QUEST("Wanted: Gath'Ilzogg") },
          text = "Gath'Ilzogg sits in Stonewatch Keep as if he built it, but he didn't; we did. Bring me his head, and the court will consider the matter closed." },
        { id = "h_fangore", when = { questActive = TODO_QUEST("Wanted: Lieutenant Fangore") },
          text = "Fangore leads Morganth's Shadowhides in the eastern hills. The court has ruled him a betrayer of the kingdom. You carry out the sentence." },
        { id = "h_masters", tags = { "news" }, when = { questActive = TODO_QUEST("The True Masters") },
          text = "Orcs don't plan like this. Somebody is directing them, and the letter you carried names who. Take it to the Keep before the next raid." },
        { id = "h_masters_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The True Masters"), days = 5 } },
          text = "The Highlord read it all and still won't send soldiers without more proof, so he sent a deputy instead, which is to say you. I suppose that's an answer." },
        { id = "h_maxwell", when = { heardLine = "maxwell.h_default" },
          text = "You've been up to Morgan's Vigil and met Marshal Maxwell, then. He and I write to the same deaf ears in Stormwind, and his letters are angrier than mine, which I hadn't thought possible." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "An elf from the sky, is it? If your people could fly I'd want a dozen on the walls, but I'm told you glide, and I'll gladly take gliders." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, in my hall. I asked the kingdom for soldiers and bandages. It seems to have sent the next best thing." },
        { id = "h_letters", when = { metBefore = true }, text = "Another letter to Stormwind this morning. The court notes that it is the fortieth. The court also notes that it expects no reply." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The court is closed, but the magistrate is not. Say what you came to say, and say it briefly." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, you. The court is glad of a friendly face, and so, for that matter, is the magistrate. Sit, if you can find a chair under the letters." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "The court recognises you, which is not the same as welcoming you. State your business." },
        { id = "h_redridge_born", when = { origin = "human_redridge_born" },
          text = "One of our own, back from the wider world. The court remembers your family's name, and it would rather see you on the walls than on a list of the missing." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and I'll ask you to be brief. I've another letter to write that nobody will answer, so tell me, do your spirits carry letters?" },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, if you would; the docket is long and the day is not." },
        { id = "h_again2", text = "Go on. You have the court's attention, which is more than Stormwind gives it." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask what you like. The letters will keep, as they always do." },
      },
      choices = {
        { text = "The orcs are stripping the Redridge hills bare for timber.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What does Lakeshire need?", next = "need" },
        { text = "Stormwind seems in no hurry to help.", next = "stormwind" },
        { text = "What happened at Stonewatch Keep?", next = "stonewatch" },
        { text = "Tell me about the Court of Lakeshire.", next = "court" },
        { text = "I can tend your wounded, Magistrate.", next = "priest", when = { class = "PRIEST" } },
        { text = "The Light sends you a paladin, Magistrate.", next = "paladin", when = { class = "PALADIN" } },
        { text = "My family sits in the House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "I came south from Lordaeron.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "The Blackrock are Ironforge's enemies too.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Highlord Bolvar's deputy, reporting.", next = "deputy", when = { questDone = TODO_QUEST("The True Masters") } },
        { text = "Put me on the walls, Magistrate. I can hold a line.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I've been tracking gnolls through your hills.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Something foul stirs in your hills. I can smell it. Who's behind it?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Gnomeregan knows what it is to lose a city.", next = "gnome", when = { race = "Gnome" } },
        { text = "Someone in Stormwind may be reading your letters before the nobles do.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "There's a wizard's tower in the hills. Who holds it now?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Stormwind seems slow to answer your letters, Magistrate.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Drakkisath is dead, Magistrate. Dragons stood behind the orcs, as you said.", next = "xcl_ubrs", when = { cleared = "Upper Blackrock Spire", faction = "Alliance" } },
        { text = "Who is this other visitor in your record, Magistrate?", next = "xalt_solomon", when = { alt = true } },
        { text = "Your court seems cool toward the night elves.", next = "sol_nelf" },
        { text = "You resent my people, Magistrate. Why?", next = "sol_xnelf", when = { race = "NightElf" } },
        { text = "Any letters to Ashenvale lately, Magistrate?", next = "sol_nsoft", when = { race = "NightElf", npcFlagBefore = "solomon_nelf_soft" } },
        { text = "Lakeshire burned once. Why do our people keep rebuilding here?", next = "hu_sol", when = { race = "Human" } },
        { text = "You humans write a great many letters, Magistrate.", next = "hu_sol_x", when = { race = { "Dwarf", "Gnome", "NightElf" } } },
        { text = "I'll leave you to your letters.", next = "END" },
      },
    },

    need = {
      lines = {
        { id = "n_default", text = "A bridge that stays up and walls that stay manned. And for once, a week where nobody walks into this office carrying someone else's blood." },
      },
      choices = {
        { text = "What's the worst of it?", next = "need_worst" },
        { text = "I'll help where I can.", next = "BACK", reply = "Then you're more help than the Crown has been this season. Report to Marshal Marris, if you would.", fx = { affinity = 2, align = { order = 1 }, standing = { lakeshire = 1 } } },
        { text = "That's a lot to ask.", next = "BACK", reply = "It is, and I've been asking for a year. I'll keep asking until someone says yes.", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },
    need_worst = {
      big = true,
      lines = {
        { id = "nw_default", text = "Bandages, of all things. We ran out of them before we ran out of courage, and I put that in a report to the Keep. It still shames me." },
        { id = "nw_priest", when = { class = "PRIEST" },
          text = "Bandages, and someone who knows what to do when the bandages aren't enough. You'll have guessed why I'm telling you." },
      },
      choices = {
        { text = "Who did you send that report to?", next = "letters" },
        { text = "Stormwind can't ignore that.", next = "BACK", reply = "You'd think so, wouldn't you? I've thought so for months, and here we are, still out of bandages.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Stormwind won't help, so Lakeshire must look after itself.", next = "BACK", reply = "Then Lakeshire will, as it has been, and I'll write it in my report. Not that anyone reads them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stormwind = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "I've asked every territory of the kingdom, one after another. The answers were all polite, and none of them were soldiers." },
        { id = "s_heard", when = { heardLine = "bolvar.t_westfall" },
          text = "The Highlord told Westfall the kingdom is stretched thin? He told me the same, almost word for word. I begin to think someone is writing his answers for him." },
      },
      choices = {
        { text = "You must have written to half the kingdom.", next = "letters" },
        { text = "The kingdom's failing you.", next = "BACK", fx = { opinion = { westfall = "abandoned" }, affinity = 1 } },
        { text = "Maybe the city has its reasons.", next = "reasons", fx = { opinion = { westfall = "patience" } } },
      },
    },
    reasons = {
      lines = { { id = "r_default", text = "Reasons don't man walls. Come back when you've buried someone, and tell me about reasons." } },
      choices = {
        { text = "I've buried people, Magistrate.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Fair. Something else.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    letters = {
      lines = {
        { id = "le_default", text = "General Jonathan in Stormwind, who answered kindly. Gryan Stoutmantle in Westfall, who answered plainly. Lord Ebonlocke in Darkshire, who answered as if I'd gone mad." },
      },
      choices = {
        { text = "What did the General say?", next = "letters_general" },
        { text = "And Stoutmantle?", next = "letters_gryan" },
        { text = "I've met General Jonathan. He spares what he can.", next = "letters_marcus", when = { heardLine = "marcus.h_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters_general = {
      lines = {
        { id = "lg_default", text = "That Lakeshire has the army's support, and soldiers will march when the throne gives the word. Then a line about the throne I won't repeat in an open hall." },
      },
      choices = {
        { text = "What about the throne?", next = "amiss" },
        { text = "Then soldiers are coming.", next = "BACK", reply = "That's what the letter says, at least. I've learned not to hold my breath for the marching.", fx = { align = { order = 1 } } },
        { text = "Soldiers won't come, and Lakeshire should stop waiting for them.", next = "BACK", reply = "I'd agree, and then I'd write another letter, because it's what I do. You'll forgive me the habit.", fx = { align = { order = -1 } } },
      },
    },
    letters_gryan = {
      lines = {
        { id = "lgr_default", text = "Gryan's farmers are holding Westfall by their fingernails, and he'd have sent men if he had any. His reply asked me where Stormwind's army had gone, which is what I've been asking ever since." },
      },
      choices = {
        { text = "Westfall and Lakeshire should stand together.", next = "BACK", fx = { affinity = 1, learn = { "westfall", "people_militia" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "westfall" } } },
      },
    },
    letters_marcus = {
      lines = { { id = "lm_default", text = "'What the kingdom can spare.' I've read that phrase in his hand more than once, and it means none, said by a decent man." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    amiss = {
      big = true,
      lines = {
        { id = "am_default", key = true,
          text = "Only that something in Stormwind is amiss. Westfall left to its farmers, Darkshire to its Night Watch, Lakeshire to me. One neglect is bad luck; three is a pattern.",
          fx = { learn = { "westfall", "night_watch" } } },
      },
      choices = {
        { text = "Three is a pattern. Whose pattern, Magistrate?", next = "op_dragons" },
        { text = "It sounds as if someone at court wants Lakeshire to fall.", next = "amiss_court" },
        { text = "Lady Prestor counsels patience at court.", next = "prestor", when = { heardClaim = "prestor_patience" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    amiss_court = {
      lines = { { id = "ac_default", text = "The court makes no accusation it can't prove, so write that down. Then write down that I didn't say no." } },
      choices = {
        { text = "Careful, Magistrate. Stormwind's walls have ears.", next = "BACK", fx = { trait = { cautious = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Off the record, Magistrate. What do you really suspect?", tag = "Persuade", next = "amiss_record",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PRIEST", "PALADIN" } }, { questDone = TODO_QUEST("Messenger to Westfall") } } } },
          fail = { next = "amiss_seal", fx = { affinity = -1 } } },
      },
    },
    prestor = {
      lines = {
        { id = "pr_default", text = "Patience, is it? The court notes that Lady Prestor has never stood a night on Lakeshire's wall, and it would gladly lend her a spear." },
        { id = "pr_masters", when = { questDone = TODO_QUEST("The True Masters") },
          text = "She called me paranoid, I'm told, with the Highlord standing beside her. A paranoid magistrate with a letter about dragons; very well, I'll wear it." },
      },
      choices = {
        { text = "She has the Regent's ear.", next = "BACK", fx = { opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stonewatch = {
      big = true,
      lines = {
        { id = "sk_default", text = "We kept a platoon at Stonewatch Keep. Gath'Ilzogg's Blackrock took it, with Morganth's sorcery driving them on. Then the warlock turned on the orcs, and now we have two enemies instead of one.",
          fx = { learn = { "blackrock", "morganth" } } },
      },
      choices = {
        { text = "Who is Gath'Ilzogg?", next = "gath" },
        { text = "So Morganth turned on his own allies.", next = "morganth" },
        { text = "Was anyone taken alive?", next = "keeshan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gath = {
      lines = {
        { id = "ga_default", text = "The Blackrock warlord who led the assault, now sitting in our keep. There's a price on his head, and I mean it plainly." },
        { id = "ga_done", when = { questDone = TODO_QUEST("Wanted: Gath'Ilzogg") },
          text = "Was, you mean. His head sat on this desk for a day before I let them take it away, and that was the first step toward taking the keep back." },
      },
      choices = {
        { text = "Can the keep be retaken?", next = "gath_retake" },
        { text = "He'll answer for Stonewatch.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gath_retake = {
      lines = { { id = "gr_default", text = "With an army, which brings us back, as everything in this hall comes back, to the letters." } },
      choices = {
        { text = "Then tell me about the letters.", next = "letters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morganth = {
      lines = {
        { id = "mo_default", text = "He did, soon after the victory. He raised a tower in the northeast and took the Shadowhide gnolls for his own, with Fangore at their head.",
          fx = { learn = { "morganth" } } },
      },
      choices = {
        { text = "Why would he betray the orcs?", next = "morganth_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morganth_why = {
      lines = { { id = "mw_default", text = "I can only speculate, and a judge dislikes speculating. Ask Theocritus at the Tower of Azora. He has made a study of Morganth, and he's welcome to it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    keeshan = {
      lines = {
        { id = "ke_default", text = "Corporal Keeshan was seen dragged off by the Blackrock. The notice outside the inn is mine: whoever brings him home, Marris rewards." },
        { id = "ke_done", when = { questDone = TODO_QUEST("Missing In Action") },
          text = "Keeshan walked back into this town and reported for duty with his head still bleeding. It's in the court's record, and it's in mine too, privately." },
      },
      choices = {
        { text = "Then I'll look for him.", next = "BACK", reply = "Good, then the town owes you, and so do I. He was a good soldier, Keeshan, and I'd like him back.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll look for him if the reward's worth it.", next = "BACK", reply = "The reward is fair, I'm told, and Marris keeps his word. Go and fetch him, and be quick about it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    court = {
      lines = {
        { id = "co_default", text = "The township elected a magistrate, and the magistrate sits as its judge. Bailiff Conacher carries out what I rule. Lately I rule mostly on orcs." },
      },
      choices = {
        { text = "What does the law say about the gnolls?", next = "court_law" },
        { text = "Lakeshire seems to have known little peace.", next = "court_history" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court_law = {
      lines = { { id = "cl_default", text = "That aiding an enemy of the kingdom is a hanging matter. Morganth is an enemy, and the Shadowhides aid him. Conacher will walk you through it; he enjoys procedure." } },
      choices = {
        { text = "Hanging gnolls seems excessive.", next = "court_mercy" },
        { text = "Good. The law should have teeth.", next = "BACK", reply = "It should, and in Lakeshire it does, though I'd prefer it bite less often. Conacher will see to the details.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Fighting gnolls is a soldier's job, not a hangman's.", next = "BACK", reply = "Fair enough, though once they're dead, the hangman's job is done for him. Hunt them, and let the court follow.", fx = { align = { order = -1 } } },
      },
    },
    court_mercy = {
      lines = { { id = "cm_default", text = "We don't hang them, because we can't catch them. The law is a statement of what we would do if we had the time." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    court_history = {
      big = true,
      lines = {
        { id = "ch_default", text = "Blackhand's raiders took this town in the first war. After the second, Turalyon's Alliance gave it back and brought our families home. I won't be the magistrate who loses it twice." },
      },
      choices = {
        { text = "You won't. Not while I'm here.", next = "BACK", fx = { affinity = 2, standing = { lakeshire = 1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      big = true,
      lines = {
        { id = "pt_default", text = "Lakeshire has no chapel and no priest. The wounded lie wherever there's a bed, and the bandages ran out a fortnight ago. If you mean it, the guards will show you." },
        { id = "pt_novice", when = { origin = "human_abbey_novice" },
          text = "Northshire trained you? Then you know how to work on an empty stomach and no sleep. You'll need both here." },
      },
      choices = {
        { text = "Take me to them.", next = "BACK", reply = "Bless you, then, and go quickly, because some of them won't last the night without help. Ask any guard for the wounded, and they'll walk you there themselves.", fx = { affinity = 3, standing = { lakeshire = 2 }, align = { light = 1 } },
          journal = { first = "Magistrate Solomon told me Lakeshire has no priest of its own. I said I'd see to the wounded.",
                      third = "{name} offered to tend Lakeshire's wounded." } },
        { text = "I'm not here to nurse anyone, Magistrate.", next = "BACK", reply = "Then I'll not ask you to, and the wounded will lie where they are. The guards will keep you posted, should you change your mind.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'd have thought the Church would send someone.", next = "priest_church" },
      },
    },
    priest_church = {
      lines = { { id = "pc_default", text = "I asked the Cathedral too, but they're stretched like everyone else, and they sent prayers. I'll take prayers gladly, though I'd rather take you." } },
      choices = {
        { text = "Prayers matter more than you think.", next = "BACK", reply = "Perhaps they do, and I'll not argue it with a priest. But a bandage would go further than either of us.", fx = { align = { light = 1 }, trait = { pious = 1 } } },
        { text = "I'll tell the Archbishop what I saw here.", next = "BACK", reply = "Do that, and tell him plainly, because he doesn't read my letters. Thank you, priest.", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    paladin = {
      lines = { { id = "pl_default", text = "I asked for a regiment and the Light sends one paladin. I've learned not to argue with the Light; it doesn't answer letters either. Stand where the guards can see you." } },
      choices = {
        { text = "I'll stand on the walls.", next = "BACK", reply = "Then you'll have the court's thanks, and Marris will be glad of you. The east wall, if you please.", fx = { affinity = 2, align = { light = 1, order = 1 } } },
        { text = "I'll go where I'm needed, not where I'm posted.", next = "BACK", reply = "That's what everyone says, and then I can't find them. Tell the Marshal where you are, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble = {
      lines = { { id = "nb_default", text = "Then perhaps your family has heard my letters read aloud, just before someone says 'next item'. Ask them what Lakeshire must do to become the item." } },
      choices = {
        { text = "I'll raise it with them.", next = "BACK", reply = "Thank you, though I'll believe it when I see the soldiers. Raise it loudly, if you would.", fx = { affinity = 2, align = { honor = 1 } },
          journal = { first = "Promised Magistrate Solomon I'd raise Lakeshire's letters with my family in the House of Nobles.",
                      third = "{name} promised Magistrate Solomon to raise Lakeshire's plight in the House of Nobles." } },
        { text = "They have bigger concerns than Redridge.", next = "BACK", reply = "They always do, and it's always just before Redridge falls. I'll keep writing anyway.", fx = { align = { honor = -1 }, affinity = -2 } },
      },
    },
    lordaeron = {
      lines = { { id = "ld_default", text = "Then Lakeshire owes your kingdom. It was the Alliance of Lordaeron that rebuilt this town after the second war. I'm sorry we've nothing to repay it with but a bed." } },
      choices = {
        { text = "What do you hear from the north?", next = "lordaeron_north" },
        { text = "A bed is enough.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    lordaeron_north = {
      lines = { { id = "ln_default", text = "Nothing good, I'm afraid. I wrote to the Keep that something darker than any orc is brewing up there, and nobody answered that part either." } },
      choices = {
        { text = "You were right. I've seen it.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "That's what I reasoned too, so we sent envoys to King Magni months ago, asking for help against the Blackrock. No dwarves have come over the mountains yet." } },
      choices = {
        { text = "Ironforge keeps its word. Give it time.", next = "BACK", reply = "I'll give it time, then, though time is what Lakeshire has least of. Thank you for the reassurance.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I wouldn't count on Ironforge keeping that promise.", next = "BACK", reply = "That's what I feared, and I'll write that down too. Another letter for the pile.", fx = { align = { honor = -1 } } },
        { text = "They came. Princess Moira was taken on the road.", next = "dwarf_moira", when = { questDone = TODO_QUEST("Kharan's Tale") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf_moira = {
      big = true,
      lines = { { id = "dm_default", text = "The princess herself, for Lakeshire? Light help me, I wrote that letter. Lakeshire will remember her name, whatever comes of this." } },
      choices = {
        { text = "It wasn't your doing.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    deputy = {
      lines = { { id = "dp_default", text = "When you handed me that decree, the court had something in its eye. The court would like that left out of the record." } },
      choices = {
        { text = "It's safe with me.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "One deputy beats no army.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    amiss_record = {
      big = true,
      lines = {
        { id = "ar_default", text = "Nothing is off the record in a court, but very well. I have kept every reply from the Keep, and laid them side by side on this table, and they are written in four different hands and they all use the same word: patience." },
        { id = "ar_after", text = "Four clerks don't choose the same word by accident; somebody chooses it for them. I've sealed copies in a box with instructions for the court, should anything befall its magistrate, and I'll thank you to forget I said so." },
        { id = "ar_priest", when = { class = { "PRIEST", "PALADIN" } }, text = "You wear the Light's colours, so I'll say it plainly: I don't believe the Regent means us harm, and I don't believe the Regent is the one writing." },
      },
      choices = {
        { text = "I've heard that word in the Keep myself.", next = "BACK", when = { heardClaim = "prestor_patience" }, fx = { affinity = 2 } },
        { text = "Your secret's safe, Magistrate.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's a dangerous thing to suspect.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    amiss_seal = {
      lines = {
        { id = "as_default", text = "The court has said what it's prepared to say, and it has said it to you once already. I'm a magistrate, not a gossip at the Lakeshire Inn." },
        { id = "as_default2", text = "Suspicions are for people who have time to entertain them. I have orcs on the ridge and a stack of letters to answer, so ask me something useful." },
      },
      choices = {
        { text = "As you say, Magistrate.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "The court would take a hundred of you if Stormwind would send them, and it will take one gladly. Marshal Marris decides who stands where, but tell him I said the east wall first." },
        { id = "wa_guard", when = { origin = "human_city_guard" },
          text = "City Guard, by your bearing. Then you know how it feels to be told the kingdom has no soldiers to spare while the kingdom's soldiers polish the Trade District." },
      },
      choices = {
        { text = "Why the east wall?", next = "warrior_east" },
        { text = "A town should fight for itself before it begs for soldiers.", next = "BACK", reply = "We are fighting, friend, with farmers and fishermen. We're begging because we've run out of both.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll stand where the Marshal puts me.", next = "BACK", reply = "Good, and he'll put you somewhere useful, which is everywhere. Thank you, warrior.", fx = { affinity = 2, align = { order = 1 }, standing = { lakeshire = 1 } } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    warrior_east = {
      lines = { { id = "we_default", text = "Because the Blackrock come down from Render's Valley and the east wall is the one they test, every time, the way a man worries a loose tooth. The day it gives, the court will be holding session in the lake." } },
      choices = {
        { text = "Then it won't give.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", fx = { learn = { "redridge_gnolls" } },
          text = "Then you've seen more of Redridge than my bailiff has this month. The court would be grateful for an honest count of the Redridge gnolls, and more grateful still for fewer of them." },
        { id = "hu_human", when = { race = "Human" },
          text = "A Stormwind hunter, and not a ranger from the north. I'd heard the young ones were taking up the bow and the beast; I hadn't expected one in my hall." },
      },
      choices = {
        { text = "They may be working with the orcs.", next = "hunter_orcs" },
        { text = "I'll bring you a count.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hunter_orcs = {
      lines = { { id = "ho_default", text = "The court has no proof, and the court hates guessing aloud. But gnolls never raided this boldly before the Blackrock came over the mountains, and I don't believe in coincidences that cost me farms." } },
      choices = {
        { text = "Then I'll find your proof.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", fx = { learn = { "morganth" } },
          text = "That would be Morganth, in his tower in the eastern hills. He raises the dead and calls things out of the dark, and you've just asked me about it with more interest than I'd like. The court will assume that was professional curiosity." },
      },
      choices = {
        { text = "It was. Know your enemy, Magistrate.", next = "warlock_enemy" },
        { text = "Power isn't evil. It's how a man uses it.", next = "BACK", reply = "Morganth would agree with you, which ought to trouble you more than it does. I'll be watching how you use yours.", fx = { affinity = -2, align = { light = -1 } } },
        { text = "Morganth's arts are a sickness. I mean to end him.", next = "BACK", reply = "Then the court will thank you, and I'll write it in the book myself. Go, and finish it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock_enemy = {
      lines = { { id = "wle_default", text = "A fair principle, and one I've heard from a great many people shortly before they joined the enemy. Do your work in the hills, not in my town, and the court won't ask what you carry in your pack." } },
      choices = {
        { text = "Understood.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "It does, and I'm sorry for it; I read the reports when they came through. Lakeshire hasn't fallen yet, and I'd be glad of advice from anyone who has seen how a city is lost." } },
      choices = {
        { text = "It starts when help is promised and doesn't come.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
        { text = "Build your defenses before you need them.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "How very civil. I have had nothing but orcs and unanswered letters for a year, so you will forgive me if I am slow to recognise a compliment when one arrives." },
        { id = "s2", text = "The court thanks you, and so, less formally, do I. It is pleasant to learn that someone has noticed Lakeshire still has a magistrate and that he is still at his desk." },
      },
      fail = {
        { id = "f1", text = "I sit in judgment for a living, and I have heard a great many people be charming just before sentence. It has never yet altered a ruling." },
        { id = "f2", text = "You are kind, I am sure, but I should trade every compliment in Redridge for a single company of the King's foot. Shall we proceed to your business?" },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha. A magistrate who defends his town with a pen and a seal; yes, I am aware of how it looks. You are the first in this hall with the wit to notice and the courage to let me know it." },
        { id = "s2", text = "That is insolence, and well turned. I have missed a proper argument, since the orcs do not offer one, so do go on, and the court will try not to enjoy it." },
      },
      fail = {
        { id = "f1", text = "You are addressing the magistrate of Lakeshire in his own hall, and you will do it with respect. I have fined men for less on quieter days." },
        { id = "f2", text = "While you sharpen your wit, the Blackrock are sharpening axes above Stonewatch. Kindly take the one and go and blunt the other." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "There is no need to raise your voice in my hall, for I heard you. Very well, I concede the point, as I would sooner lose an argument than a pair of hands Lakeshire needs." },
        { id = "s2", text = "I see. You are in earnest, and I am not so proud that I cannot tell when to give way. State what you require, and the court will consider it favourably." },
      },
      fail = {
        { id = "f1", text = "I have Blackrock orcs across the lake and gnolls on the road, and I assure you that you are a poor third. Lower your voice." },
        { id = "f2", text = "Threatening an officer of the Crown is an offence in this township, and I happen to be the one who hears such cases. I suggest you reconsider before I must." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "Gath'Ilzogg holds Stonewatch Keep for the Blackrock and has not left its walls in months. Every raid on this valley is planned behind them." },
    { id = "bl2", text = "I have come to suspect my letters to the Regent are read by Lady Prestor's clerks before they ever reach his desk. I cannot prove it, and I should not have said it." },
    { id = "bl3", text = "The Shadowhide gnolls in the eastern hills take their orders from the Blackrock, whatever they pretend. Break the orcs, and the gnolls will scatter of their own accord." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "This court has formed an opinion of you, and it was not formed lightly. I am afraid it is not a favourable one." },
      { id = "gv_prej", when = { grudge = "prejudice" }, text = "The law of Stormwind names demon-summoning a crime, and Lakeshire buried its dead the last time warlocks came down this valley. I will not set either fact aside for your convenience." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You addressed this court with less respect than I would expect from an orc under a flag of truce. I have entered it in the record, and the record does not forget." },
      { id = "gv_town", when = { grudge = "town" }, text = "Lakeshire has complained of you, and Lakeshire is my court's first and only concern. When my people speak, I listen, which is more than Stormwind does for me." },
    },
    amends = {
      { id = "am1", text = "Serve Lakeshire, and let the township speak for you before this court. Petitions on your behalf will be weighed fairly, as all petitions are." },
      { id = "am_prej", when = { grudge = "prejudice" }, text = "Show this valley that your craft can be turned against the Blackrock and not against us. Until then, the law and I will both keep our distance." },
    },
    spite = {
      { id = "sp1", text = "I think you are one more thing this township must endure while it waits for help that never comes. I have endured a great deal, and I shall endure you." },
      { id = "sp_town", when = { grudge = { worst = "town" } }, text = "I think Lakeshire would be glad to see your back on the road to Elwynn, and I would sign the order myself if the law allowed it." },
    },
    kaldorei = { { id = "tp_kaldorei", text = "The court has no quarrel with the night elves, only with how quickly Stormwind answers their letters. It notes the difference, and it notes it often." } },
    _gated = {
      { id = "gt1", text = "That is not a matter I discuss with persons the court has no reason yet to trust. Serve Lakeshire, and you may ask me again." },
      { id = "gt2", text = "I decline to answer, and I am under no obligation to say why. Perhaps I shall when you have shown the township some good will." },
    },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade was meant to keep Stormwind's worst where they couldn't harm anyone, and now the prisoners hold it. If the King's own prison can't be held, I don't know how Stormwind expects Lakeshire to hold its walls." } },
    bolvar = { { id = "tp_bolvar", text = "I have written to Highlord Fordragon so many times that his clerks must recognise my seal by now. He means well, I believe, but meaning well has never yet driven an orc out of Redridge." } },
    prestor = {
      { id = "tp_prestor", text = "Lady Prestor sends replies to my letters on the Regent's behalf, gracious and long and entirely empty of soldiers. I'm beginning to wonder whether the Highlord sees my letters at all." },
      { id = "tp_prestor2", when = { disposition = { min = 65 } }, text = "Between us, I've begun to wonder whether Lady Prestor reads my letters before the Regent does, and whether he ever sees them at all. I'd say that to no one else, so keep it to yourself." },
    },
    varian = { { id = "tp_varian", text = "King Varian never would have left a town of his to hold the line alone, and I believe that with all my heart. But he's gone, and Lakeshire is still here, and someone must write the letters." } },
    second_war = { { id = "tp_second_war", text = "Lakeshire was burned to the waterline in the Second War and rebuilt on the King's promises. I'm still waiting for the King's promises, so you see my patience is quite well practised." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The orcs who raid Redridge answer to that black mountain north of the Steppes, I'm told, and no army of Stormwind's has gone near it in years. I'd like to know why before I write my next letter." } },
    stonemasons = { { id = "tp_stonemasons", text = "The Stonemasons' Guild rebuilt Stormwind and was never paid, and now they're the Defias, and now we pay for it in Redridge too. The House of Nobles may yet learn that a debt never stays where it was left." } },
    syndicate = { { id = "tp_syndicate", text = "Letters from Arathi say the Syndicate is a band of fallen Alterac nobles playing at being thieves. I've enough trouble with honest orcs without dishonest lords." } },
    theramore = { { id = "tp_theramore", text = "Lady Proudmoore holds Theramore with a fleet and a handful of soldiers, and I'm told the city is safe. I'd like her to write to me and explain how, because I've a handful of soldiers and no fleet at all." } },
    knows = {
      { id = "tp_knows", text = "Every report from the ridge and every letter from the Keep crosses this table, so the court is well informed, if poorly defended. Ask me about any of this." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "The court will answer on these matters, and only these." },
    },
    background = { { id = "tp_bg", text = "The township elected me to judge its quarrels and keep its peace. Lately the quarrels carry axes.", next = "court" },
                   { id = "tp_bg2", text = "I'm the Magistrate of Lakeshire, and the rest of my story is in the letters, which nobody reads." } },
    advice = { { id = "tp_ad", text = "Keep to the roads, and never trust a quiet night in Redridge. The orcs count on both." } },
    stonewatch_keep = { { id = "tp_stonewatch", text = "It was ours until Morganth's sorcery and Gath'Ilzogg's axes took it. The court has not ruled it lost, only taken.", next = "stonewatch" } },
    keeshan = { { id = "tp_keeshan", text = "Of the 12th Sabre Regiment, dragged off the walls at Stonewatch. The notice by the inn carries my seal." } },
    night_watch = { { id = "tp_watch", text = "Lord Ebonlocke's lantern-bearers, you mean. I asked him for them anyway; that's how desperate Lakeshire has become." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "There are two packs: one steals our horses, and the other serves a warlock. I've put a price on the second." } },
    defias = { { id = "tp_defias", text = "That's Westfall's trouble, and Stoutmantle's reply told me enough to stop asking him for men." } },
    blackrock = { { id = "tp_blackrock", text = "They hold Render's Valley and Stonewatch Keep, and there are too many of them, too well organized, and getting bolder by the week." } },
    everstill_bridge = { { id = "tp_bridge", text = "Oslow says it'll be finished before the rains, but Oslow said that last year." } },
    westfall = { { id = "tp_westfall", text = "They have it worse than we do, and I wrote to them anyway. Desperation makes for poor manners." } },
    morganth = { { id = "tp_morganth", text = "He holds the tower in the eastern hills, and the gnolls there serve him. That's all I know, and it's more than I like." } },
    _none = { { id = "tp_none", text = "If it's not a threat to Lakeshire, it can wait until there aren't any." } },
  },
}
