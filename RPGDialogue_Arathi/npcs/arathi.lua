-- Arathi Highlands: Refuge Pointe (Alliance) and Hammerfall (Horde). Voice: bibles/arathi.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "nials", id = TODO_NPC("Captain Nials"), name = "Captain Nials",
  bible = "bibles/arathi.md", role = "soldier", tier = "major",
  communities = { "refuge_pointe" }, temper = { "firm" }, values = { "dutiful", "proud" },
  likesTone = "blunt",
  prejudice = { class = "ROGUE", amount = 10, why = "Syndicate cutthroats in the same leathers keep killing his lookouts." },
  notices = { "kit", "race", "lock_armor", "lock_shadow" },

  impression = {
    first = "She carries ruined Stromgarde like a sword she won't put down.",
    third = "{name} met Captain Nials at Refuge Pointe, an officer of Stromgarde fighting to win back the fallen kingdom.",
  },

  greetings = {
    { id = "g_hu", when = { race = "Human" }, priority = 5,
      text = "A southerner, with a southerner's good boots. Stormwind's sons come through here now and then to look at the ruins of the first kingdom of men, and then they go home." },
    { id = "g_hu_strom", when = { race = "Human", origin = "human_stromgarde_sellsword" }, priority = 7,
      text = "Stromgarde blood, and back under its own banner, even if that banner's a tent. Good. Find a fire and then find me; I've work for anyone who remembers the keep." },
    { id = "g_hu_soft", when = { race = "Human", npcFlagBefore = "nials_hu_soft" }, priority = 10,
      text = "There's the southerner who didn't go home. Come in out of the wind; you've earned a place at Stromgarde's fire, such as it is." },
    { id = "g_nelf", when = { race = "NightElf" }, priority = 5,
      text = "A kaldorei at Refuge Pointe. Arathor kept faith with elves for two thousand years, so you'll understand if I'm slow to warm to the ones who joined us last year." },
    { id = "g_nelf_soft", when = { race = "NightElf", npcFlagBefore = "nials_nelf_soft" }, priority = 10,
      text = "You again, the elf who told me Stromgarde has no stones left to throw. You were right, and I've not thrown any since." },
    { id = "g_prej1", when = { prejudiced = true }, text = "A rogue in my camp. Keep your hands out of my supplies and in plain sight, because the last one who walked in looking like you was a Syndicate scout." },
    { id = "g_prej2", when = { prejudiced = true }, text = "I know that walk; it's a cutthroat checking for the exits. Stand where my sentries can see you, and then we'll talk." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You've been in and out of Refuge Pointe and nothing's gone missing from the stores, and I can't say that of the last three sellswords Stromgarde sent me. Come in, then." },
    { id = "g_tent", text = "Captain Nials. Make it quick; the highlands don't wait, and neither do I." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the hills, are you? What did you find?" },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "You've been gone {away}, and the highlands haven't got any quieter. Tell me you're back to stay a while." },
    { id = "g_away_long", when = { away = 60 }, text = "I'd stopped expecting you after {away} away, and I'm glad I was wrong. The Pointe needs everyone it can get, so get your kit squared away." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've hardened up since we last spoke, I can see it. Good, because the Syndicate and the ogres haven't softened any." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I hear you leaned on someone here at the Pointe. Do that to the Syndicate all you like, but my people are on your side." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word around the Pointe is you've been pulling your weight for us. Keep that up and I'll stop asking what took you so long." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been fighting, good. Mend and go again, because we've no spare soldiers, so we use every one." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "One of ours, from the south? Stromgarde stood beside Stormwind in the last war, so remember it, if anyone there forgets." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The fire in the brazier just shrank and went cold at the edges, and I watched it happen as you walked into the camp. Stromgarde has enough shadows over it already, so stand where my soldiers can see you and keep that darkness to yourself." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That's demon hide you're wearing over your gear, and it moves on you like it's still breathing. I've seen my men flinch at less, so I'd thank you to keep a cloak over it while you're in this camp." },
  },

  start = "hello",
  nodes = {
    prej = {
      lines = { { id = "prej_default", text = "Because the Syndicate wear the same dark leathers and the same soft boots, and they've cut the throats of three of my lookouts this season. I can't read a man's heart, so I read his boots." } },
      choices = {
        { text = "Judge me by what I do, Captain, not by my boots.", next = "BACK", reply = "Fair, and I'll try, though three dead lookouts make it hard. Earn it in the field and I'll not mention your boots again.", fx = { align = { honor = 1 } } },
        { text = "You're right to be wary. I'd watch me too.", next = "BACK", reply = "Honest, at least, which is more than the Syndicate ever gave me. I will watch you, then, and hope I've nothing to see.", fx = { align = { honor = -1 } } },
        { text = "Put a sentry on me, then. I've nothing to hide.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "Who are the Syndicate, exactly?", next = "prej_why" },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "Alterac's nobles, or what's left of them, carrying Lord Perenolde's debts and a crowd of hired knives. They sold the Horde passage through their mountains in the war, and now they sell whatever they can steal out of Arathi." } },
      choices = {
        { text = "Thieves or nobles, they answer to the law.", next = "BACK", reply = "They do, here, as long as Stromgarde has a captain left to swing it. Thank you for saying so.", fx = { align = { order = 1 } } },
        { text = "The law failed Alterac long before anyone there took up a knife.", next = "BACK", reply = "Perhaps it did, but my lookouts didn't fail anyone, and they're dead all the same. I'll judge the knife, not the reason.", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "Brave words, or clever ones, and I'll find out which in time. Go on; the sentry will only follow you halfway now." } },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_alterac = {
      lines = {
        { id = "opn_alterac_q", text = "Lord Perenolde sold the Alliance to the Horde in the Second War, and Stromgarde paid for it in blood before anyone else did. Some say his common folk were never asked, and should be forgiven. You've seen what his nobles have become; what do you say?" },
      },
      choices = {
        { text = "Alterac sold out every kingdom in the Alliance. Hang its nobles.", next = "opn_alterac_r_hate", fx = { affinity = 1, align = { light = -1 }, opinion = { alterac = "hate" } } },
        { text = "The farmers never chose treason, Captain. Hang the lords and leave them be.", next = "opn_alterac_r_pity", fx = { align = { light = 1 }, trait = { kind = 1 }, opinion = { alterac = "pity" } } },
        { text = "Alterac's gone. Whatever they call themselves, the Syndicate are only thieves now.", next = "opn_alterac_r_dead", fx = { trait = { practical = 1 }, opinion = { alterac = "dead", stromgarde = "retake" } } },
        { text = "Perenolde tried to save his people. He chose wrong.", next = "opn_alterac_r_mistaken", when = { origin = "human_minor_noble" }, fx = { affinity = -2, opinion = { alterac = "mistaken" } } },
        { text = "That's for Stromgarde to judge, Captain.", next = "BACK" },
      },
    },
    opn_alterac_r = {
      lines = {
        { id = "opn_alterac_r_default", text = "Stromgarde has judged, and the Syndicate is what came of it. Ask me something else." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_alterac_r_hate = {
      lines = {
        { id = "opn_alterac_r_hate", text = "The rope, and the gibbet after it, and I'd tie the knots myself. Bring me their badges and I'll count them as a down payment." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_alterac_r_pity = {
      lines = {
        { id = "opn_alterac_r_pity", text = "Merciful of you. I'd like to be that merciful, and perhaps I will be, once the Syndicate stops robbing our dead." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_alterac_r_dead = {
      lines = {
        { id = "opn_alterac_r_dead", text = "Thieves with long memories and old titles, but thieves, yes. That makes them easier to hang and harder to forgive." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_alterac_r_mistaken = {
      lines = {
        { id = "opn_alterac_r_mistaken", text = "Tried to save his people? He fed mine to the orcs to do it. I'll thank you not to say that again inside Refuge Pointe, {class}." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "Then fight for Stromgarde's people and not for its stones, because the stones have changed hands more times than I can count and the people only once, when they ran here. Hammerfall's orcs and the Syndicate both want this land, and I'd sooner see you guard a farmer than take back a tower." } },
      choices = {
        { text = "You're right. Feed the people first; the towers will keep.", next = "BACK", reply = "Good. Towers can wait a season, but a family starving at Refuge Pointe can't.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Take back the towers and raise the banner. The people will come.", next = "BACK", reply = "They'll come, perhaps, and then they'll die under it. I've buried enough banners in these hills to doubt the rest.", fx = { align = { order = 1 } } },
        { text = "Who holds Stromgarde now, Captain?", next = "xpt_company2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_company2 = {
      lines = { { id = "xpt_company2_default", text = "The Syndicate hold much of the old city and the ogres roam its edges, and the last of Stromgarde's soldiers keep a corner of it out of sheer stubbornness. The Trollbane banner still flies over the keep, if you can believe it, though I wonder some nights who's left to salute it." } },
      choices = {
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Stromgarde will fight beside anyone who'll help us take back the keep, for I can't afford the luxury of choosing. The Syndicate and the ogres hold our walls, and if the stones of Arathor answer a dwarf before they answer us, then I'll thank you and ask them to answer faster." } },
      choices = {
        { text = "Then I'll fight under your command, Captain.", next = "BACK", reply = "Then you're welcome in Stromgarde's ranks, and I'll see you're fed and armed.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight, but the spirits come before your orders.", next = "BACK", reply = "Your spirits don't hold the line at night, {class}. Still, I'll take your blade, and argue about the rest later.", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They were here before Arathor raised a single stone, and they've never forgiven us for building on their land. My soldiers call them savages, but savages don't hold a hill for three thousand years." } },
      choices = {
        { text = "Then Stromgarde's claim must be enforced with steel.", next = "BACK", reply = "It will be, as long as I have soldiers to enforce it. The trolls will learn that, or they'll die learning.", fx = { align = { order = 1 } } },
        { text = "Perhaps the trolls have the older claim, Captain.", next = "BACK", reply = "Perhaps they do, but Stromgarde has buried its children in these hills for two thousand years. Ask the Witherbark how they'd settle that, and see if they let you finish the question.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ni_nelf = {
      lines = {
        { id = "nin_default", key = true,
          text = "Stromgarde thinks what it always thinks of newcomers: they'll be worth something once they've bled beside us. The quel'dorei bled with Arathor in the Troll Wars and had our oath for two thousand years, and the kaldorei have had one year and a war on the far side of the sea." },
      },
      choices = {
        { text = "Hyjal was bleeding enough, surely.", next = "ni_nelf_2" },
        { text = "Aren't all elves alike to Stromgarde?", next = "ni_nelf_2" },
      },
    },
    ni_nelf_2 = {
      big = true,
      lines = {
        { id = "nin2_default",
          text = "Not alike at all, though I've heard fools in Menethil call them the same folk in a different dye. The high elves built towers and kept treaties, and these ones grow their city and keep their own counsel, and I've never been sure whether that's wisdom or contempt for the rest of us." },
      },
      choices = {
        { text = "Wisdom. They've watched empires fall for ten thousand years.", next = "BACK",
          reply = "Then they'll have watched Stromgarde fall too, and I'll thank them not to mention it.",
          fx = { align = { honor = 1 }, opinion = { night_elves = "admire" } } },
        { text = "Contempt. They think the young races are children.", next = "BACK",
          reply = "That's what I fear, and I'd sooner be called a child to my face than smiled at from a tree.",
          fx = { align = { honor = -1 }, opinion = { night_elves = "arrogant" } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    ni_xnelf = {
      lines = {
        { id = "nix_default", key = true,
          text = "That stings, because it's true. King Thoras took Stromgarde out of the Alliance after the Second War, and look where our pride has left us, camped in a ruin with the Syndicate sitting in our own keep." },
      },
      choices = {
        { text = "Pride ruins kingdoms. Mine should learn from yours.", next = "BACK",
          reply = "Then tell them so in Darnassus, kaldorei, and tell them Stromgarde paid for the lesson.",
          fx = { align = { honor = 1 } } },
        { text = "Stromgarde's ruin is its own affair, Captain.", next = "BACK",
          reply = "It is, and Stromgarde once said the same of Lordaeron's troubles, which is how we came to be alone. Mind it doesn't come round to you.",
          fx = { align = { honor = -1 } } },
        { text = "Then don't judge our pride more harshly than your own.", tag = "Persuade", next = "ni_xnelf_soft",
          check = { pass = { any = { { disposition = { min = 55 } }, { questDone = TODO_QUEST("Stromgarde Badges") } } } },
          fail = { next = "ni_xnelf_fail", fx = { affinity = -1 } } },
      },
    },
    ni_xnelf_soft = {
      lines = {
        { id = "nixs_default", key = true, fx = { npcFlag = { set = { "nials_nelf_soft" } } },
          text = "No, I shouldn't, and I'll own it. Stromgarde has no stones left to throw, and you're the first elf in a long while to tell me so without being cruel about it." },
      },
      choices = {
        { text = "Then we'll both do better, Captain.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ni_xnelf_fail = {
      lines = {
        { id = "nixf_default", text = "Easy to say from a tree a thousand leagues away. Bring me back a few badges from these hills first, and then you may lecture me." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    ni_nsoft = {
      lines = {
        { id = "nins_default", text = "None, and I've stopped expecting any, but I've stopped minding too. You've put more Syndicate in the ground than Darnassus has ever heard of, and that will do me." },
      },
      choices = {
        { text = "Glad to, Captain. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hu_ni = {
      narr = "She looks north toward the broken towers of the keep, as if checking they're still there.",
      lines = {
        { id = "huni_default", key = true,
          text = "Strom was the first city of men, and Arathor the first human kingdom, when your ancestors and mine were the same tribe hiding from the trolls. Stromgarde is what's left of that, and it held the highlands and the Thandol Span for every human kingdom that came after." },
      },
      choices = {
        { text = "Then how did it come to tents and ruins?", next = "hu_ni_2" },
        { text = "Stromgarde left the Alliance after the second war.", next = "hu_ni_2" },
      },
    },
    hu_ni_2 = {
      big = true,
      lines = {
        { id = "huni2_default",
          text = "It did, and I'll not pretend otherwise; Lord Trollbane had his reasons, and the southern kings had theirs for not caring. When the plague war came, nobody marched for Stromgarde, and now the Syndicate hold the keep, the ogres hold the hills and the Witherbark hold everything else." },
      },
      choices = {
        { text = "Arathor's children owe Stromgarde. I'd fight to retake it.", next = "BACK",
          reply = "Then you're worth more than the last forty southerners put together, and I'll hold you to it when the order comes.",
          fx = { align = { honor = 1 }, opinion = { stromgarde = "retake" }, affinity = 1 } },
        { text = "Stromgarde walked out on the Alliance. It reaped what it sowed.", next = "BACK",
          reply = "Say that once more in this camp and you'll be saying it to my sergeant, who lost two brothers on those walls. Then go home, southerner.",
          fx = { align = { honor = -1 }, opinion = { stromgarde = "lost" }, affinity = -2 } },
        { text = "Who holds Stromgarde's crown now?", next = "hu_ni_3" },
      },
    },
    hu_ni_3 = {
      lines = {
        { id = "huni3_default",
          text = "The Trollbane line, for what that's worth with the keep in Syndicate hands and the throne room full of rats. I serve the crown, but I serve it out here, where Stromgarde still has soldiers and a flag that hasn't been taken down." },
      },
      choices = {
        { text = "Then the flag still means something.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    hu_ni_x = {
      lines = {
        { id = "hunix_default", key = true,
          text = "I think Stromgarde bled on the Thandol Span so that Stormwind's boats could reach Lordaeron, and that Stormwind's lords sent sympathy when our keep fell. I think southerners are very fond of the Alliance, so long as it's someone else holding it together." },
      },
      choices = {
        { text = "That's unfair. Stormwind's lost its king and half its army.", next = "BACK",
          reply = "Maybe it has, and maybe I'm unfair. But I've buried enough of my own to be allowed a little unfairness toward the folk who stayed warm.",
          fx = { align = { order = 1 } } },
        { text = "You're right. The south forgot Stromgarde.", next = "BACK",
          reply = "Then at least one of you remembers, which is one more than I expected this morning.",
          fx = { align = { order = -1 } } },
        { text = "I'm a southerner standing in your camp. I didn't go home.", tag = "Persuade", next = "hu_ni_soft",
          check = { pass = { any = { { disposition = { min = 55 } }, { townStanding = { town = "refuge_pointe", min = 30 } }, { questDone = TODO_QUEST("Stromgarde Badges") } } } },
          fail = { next = "hu_ni_fail", fx = { affinity = -1 } } },
      },
    },
    hu_ni_soft = {
      lines = {
        { id = "hunis_default", key = true, fx = { npcFlag = { set = { "nials_hu_soft" } } },
          text = "No, you didn't, and I've been talking about southerners in front of one who's been bleeding for my keep. That's poor manners for a captain of Stromgarde, so I'll stop, and I'll start counting you as one of mine." },
      },
      choices = {
        { text = "That's all I wanted, Captain.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_ni_fail = {
      lines = {
        { id = "hunif_default", text = "You're standing in it today, and so did the last southerner, until the rain got to him. Do something for the Pointe, and then tell me you're staying." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
        { text = "I'll be in the hills.", next = "END" },
      },
    },
    hu_ni_s = {
      lines = {
        { id = "hunis2_default",
          text = "One of them's in my camp, eating my stew, and I've stopped minding. I even wrote to Stormwind last week without using the word 'forgotten', which my clerk says is a first." },
      },
      choices = {
        { text = "Progress, Captain. Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll be in the hills.", next = "END" },
      },
    },
    hello = {
      lines = {
        { id = "h_hu", when = { race = "Human" },
          text = "Every human kingdom from Stormwind to Gilneas grew from Arathor, and every one of them has forgotten it. Stromgarde hasn't, which is why we're sleeping in tents in the rain." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "The elves Stromgarde remembers are the quel'dorei, whose magisters taught Arathor's first mages and whose kingdom we saved from the Amani. Your people we know only from envoys' letters, and they never once mention the Highlands." },
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "A full company, and on my doorstep at that! Refuge Pointe holds because the Syndicate and the Boulderfist can't agree which of them wants it more, and five more blades on the wall make that sum a good deal better for us." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. I've heard Ironforge's priests speak of the earth as the Titans' handiwork, {class}, not as a voice, so I'll judge what you bring to the field and leave the theology to others." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID" },
          text = "A druid of the Kaldorei, here in the Highlands? Stromgarde could use anyone who knows wild country, because the Witherbark know these hills far better than my soldiers do." },
        { id = "h_default", key = true,
          text = "Captain Nials. Stromgarde's keep fell after the Third War, and these tents are most of what our kingdom still holds. We're here to win the rest back." },
        { id = "h_badges", tags = { "news" }, when = { questActive = TODO_QUEST("Stromgarde Badges") },
          text = "The Syndicate's assassins took the badges off our dead, so bring them back; their families deserve that much." },
        { id = "h_plea", when = { questActive = TODO_QUEST("Plea To The Alliance") },
          text = "Take our plea to the Alliance. Tell them Stromgarde still stands, in tents if not in stone." },
        { id = "h_northfold", when = { questActive = TODO_QUEST("Northfold Manor") },
          text = "Northfold Manor's crawling with Syndicate, so clear it out; every house they hold is one more we have to win back." },
        { id = "h_badges_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Stromgarde Badges"), days = 3 } },
          text = "The badges went out with the last rider south, and some families will open a letter this month and finally know. So thank you, and I don't say that often." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You carry yourself like someone with a cellar full of secrets, {class}. I've lost too many soldiers this year to turn away anyone who'll fight, but I'll have someone watching you." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Syndicate", min = 30 } }, text = "The Syndicate have pulled back from the roads, and my scouts found their camps half empty. Stromgarde's dead are a little better avenged tonight, and I have you to thank for it." },
        { id = "h_dd_plague", when = { questDone = TODO_QUEST("Hints of a New Plague?") },
          text = "Quae tells me you helped her chase the Forsaken courier across the Highlands. I don't like to think what the Undercity's brewing, but I'd rather know than not." },
      },
      again = { { id = "h_again", text = "What else? Keep it brief." }, { id = "h_again2", text = "Go on; the tent can wait, though the hills can't." } },
      choices = {
        { text = "Why do the Witherbark know these hills so well, Captain?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why not leave and regroup?", next = "leave" },
        { text = "The keep doesn't seem to be in Stromgarde's hands.", next = "keep" },
        { text = "Who are the Syndicate?", next = "syndicate" },
        { text = "There's a Horde camp east of here.", next = "hammerfall" },
        { text = "Lordaeron fell too. I know what that's like.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "Put me in the line, Captain.", next = "line", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Let me bless the badges before they go home.", next = "priest_badges", when = { class = "PRIEST", questActive = TODO_QUEST("Stromgarde Badges") } },
        { text = "The Syndicate use dark magic. Why not answer in kind?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I doubt Stromgarde will fight beside a dwarf shaman, Captain.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "We've come to fight for the Highlands, Captain.", next = "xpt_company", when = { party = { size = 4 }, faction = "Alliance" } },
        { text = "What does Stromgarde think of the night elves, Captain?", next = "ni_nelf" },
        { text = "Stromgarde left the Alliance too, Captain.", next = "ni_xnelf", when = { race = "NightElf" } },
        { text = "Any word from my people for the Highlands, Captain?", next = "ni_nsoft", when = { race = "NightElf", npcFlagBefore = "nials_nelf_soft" } },
        { text = "Stromgarde has my sword, Captain.", next = "END", reply = "Then go, and I'll see Stromgarde remembers your name. Watch the hills for the Syndicate.", fx = { affinity = 2, align = { honor = 1 }, standing = { refuge_pointe = 1 } } },
        { text = "The Syndicate wouldn't see me coming, Captain.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I can scout the Highlands for you.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Arathor's first mages learned their craft in these hills.", next = "xmage", when = { class = "MAGE" } },
        { text = "Your sentries follow me everywhere, Captain. Why?", next = "prej", when = { prejudiced = true } },
        { text = "I fought for Stromgarde once, Captain, until the pay stopped.", next = "xorig_sellsword", when = { origin = "human_stromgarde_sellsword" } },
        { text = "Stromgarde was the first kingdom of men, wasn't it?", next = "hu_ni", when = { race = "Human" } },
        { text = "You don't think much of southern humans, Captain.", next = "hu_ni_x", when = { race = "Human", ["not"] = { origin = "human_stromgarde_sellsword" } } },
        { text = "What's become of Stormwind's sons, then? We're here.", next = "hu_ni_s", when = { race = "Human", npcFlagBefore = "nials_hu_soft" } },
        { text = "I'll help where it pays, Captain, and Stromgarde's coin is as good as any.", next = "END", reply = "Honest, at least. Stromgarde's coin is thin, but it's yours if you earn it.", fx = { align = { honor = -1 } } },
      },
    },
    xorig_sellsword = {
      lines = {
        { id = "xosellsword_default", text = "I know, and I've not forgotten the day you walked out, because I signed your last pay slip myself and there was nothing in the chest to honour it. Most who left that week are in the Syndicate's camps now, but you came back. Is it the coin that brought you, or the Syndicate?" },
      },
      choices = {
        { text = "The coin, Captain, and I'll not pretend otherwise.", next = "BACK", fx = { trait = { greedy = 1 } } },
        { text = "The Syndicate. I've unfinished business with them.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because Stromgarde was built by the men who stood beside the elves against the Amani, and I'll not see its banner carried on the kind of fire the orcs once brought here. Fight the Syndicate with whatever you must, but keep it out of my soldiers' sight." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because Stromgarde was built by the men who stood beside the elves against the Amani, and I'll not see its banner carried on demon fire, nor see that creature standing beside it. Fight the Syndicate with whatever you must, but take it out of my soldiers' sight, for half of them have stopped work to stare." },
      },
      choices = {
        { text = "Then I'll keep it out of sight, as you ask.", next = "BACK", reply = "Thank you. My soldiers have enough to fear without wondering who stands beside them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pride won't win back Stromgarde, Captain. Power will.", next = "BACK", reply = "Power is what Perenolde wanted, too, and you can see where that took Alterac. Keep it from my banner.", fx = { align = { order = -1 } } },
        { text = "Let's talk of something else, Captain.", next = "BACK" },
      },
    },
    leave = {
      big = true,
      lines = {
        { id = "l_default", text = "Because if we leave, nobody comes back. Others have asked me to send soldiers to guard the bridges and the passes, and I said no, because duty keeps us here." },
      },
      choices = {
        { text = "The bridges matter too.", next = "leave_bridge", fx = { align = { order = 1 } } },
        { text = "Stromgarde comes first. I'd have kept them here too.", next = "BACK", reply = "I hoped you'd say that. My grandfather walked out of Stromgarde with the court, and he spent the rest of his life telling me he meant to go back.", fx = { align = { order = -1 } } },
        { text = "I understand.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
      },
    },
    leave_bridge = {
      lines = { { id = "lb_default", text = "To someone, but not to Stromgarde. If the Alliance wants the Thandol Span guarded, the Alliance can send the guards; I've none to spare, and half of mine are sleeping in tents with the rain coming through." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keep = {
      lines = { { id = "k_default", text = "Syndicate in the halls, ogres in the yard, trolls on the walls: everyone but the people it belongs to. I can see the towers from the ridge, and I go and look, some evenings." } },
      choices = {
        { text = "You'll take it back.", next = "BACK", fx = { affinity = 2 } },
        { text = "You'd need an army for that.", next = "keep_army", fx = { trait = { skeptical = 1 } } },
      },
    },
    keep_army = {
      lines = { { id = "ka_default", text = "I have one: this one, small, stubborn and still here, and whoever walks in off the road willing to help. Today, that's you." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "How long can you really hold, Captain?", tag = "Persuade", next = "tents",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { questDone = TODO_QUEST("Stromgarde Badges") } } } },
          fail = { next = "tents_no", fx = { affinity = -1 } } },
      },
    },
    syndicate = {
      lines = { { id = "s_default", text = "Alterac's leftovers, nobles who lost their kingdom and found a trade in knives. They rob the dead, even cut the badges off our fallen, and call it business." } },
      choices = {
        { text = "Why take the badges?", next = "syndicate_badges" },
        { text = "Then they'll answer for every one of those badges.", next = "BACK", reply = "They will, if I have any say in it. I've the names of the men who wore them written on the tent pole behind me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner rob the robbers than wait on a court to do it.", next = "BACK", reply = "That's Syndicate thinking, I'm afraid, but I'll not complain if the badges come home. Just don't make a habit of it.", fx = { align = { order = -1 } } },
      },
    },
    syndicate_badges = {
      lines = { { id = "sb_default", text = "To sell, or to wear, or to walk into a village as one of ours; I don't know which. I know the families get nothing to bury." } },
      choices = {
        { text = "Should Alterac's people pay for Perenolde's treason?", next = "opn_alterac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammerfall = {
      lines = { { id = "h2_default", text = "Hammerfall was a camp for orc prisoners, once, and they broke it open and kept the ruins. We leave each other alone, most days, and most days is enough, for now." } },
      choices = {
        { text = "Leaving each other be suits me well enough.", next = "BACK", reply = "For now, it suits me too. I've no men to spare for a second war.", fx = { align = { order = -1 }, opinion = { peace = "for" } } },
        { text = "Drive them out of the Highlands, all of them.", next = "BACK", reply = "With what army? Speak to me again when you've found me a hundred spears.", fx = { align = { order = 1 }, opinion = { peace = "against" } } },
      },
    },
    lordaeron = {
      lines = { { id = "lo_default", text = "Then you know the worst part isn't losing it; it's the people who tell you to stop looking at what you lost. Don't stop, not yet." } },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 3, trait = { brave = 1 } } } },
    },
    line = {
      lines = { { id = "ln_default", text = "Northfold first, then the farms past it, and then, one day, the keep. Stand where I tell you and don't retreat unless I do, and I won't." } },
      choices = { { text = "Understood.", next = "BACK", fx = { affinity = 2, standing = { refuge_pointe = 1 } } } },
    },
    priest_badges = {
      lines = { { id = "pba_default", text = "The families need their dead back, and a blessing is the next best thing. Bless them, and I'll write in every letter that a priest stood over each one." } },
      choices = {
        { text = "Every one.", next = "BACK", reply = "Thank you. The families will know their sons were blessed, and that will mean more than you think.", fx = { affinity = 3, align = { light = 2 }, standing = { refuge_pointe = 2 } } },
        { text = "The dead are past blessing, Captain. Your words are for the living.", next = "BACK", reply = "For the living, then, which is who I'm writing to. Say the words anyway, if only for their mothers.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tents = {
      lines = {
        { id = "te_default", text = "Not as long as I tell the soldiers. I count the tents every morning and there are fewer each season, because the Syndicate's knives and the ogres' clubs take more than Stromgarde can send me, and I write each of those letters home myself." },
        { id = "te_priest", when = { class = "PRIEST" },
          text = "You've blessed enough of our dead to know the answer, priest. I count the tents every morning and there are fewer each season, and I write every letter to the families myself, because I won't let a clerk do it." },
      },
      choices = {
        { text = "Then I'll stay and help you hold.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tents_no = {
      lines = {
        { id = "tn_default", text = "As long as it takes, and that's all a soldier of Stromgarde needs to hear. Ask me something else." },
        { id = "tn_rogue", when = { class = "ROGUE" },
          text = "That's a spy's question, and the Syndicate pays well for answers to it. As long as it takes is all anyone outside my command will hear." },
      },
      choices = {
        { text = "Understood, Captain.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xro_default", text = "They're Alterac's nobles with their faces covered, and they'd see you coming the way thieves see each other. Still, they cut the badges off my dead, and I've stopped being particular about who takes them back." } },
      choices = {
        { text = "Then I'll take them back their way: knives in the dark.", next = "BACK", reply = "Their way, then, and I'll not ask about it in my report. Bring the badges home.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll get the badges, and I'll do it cleanly.", next = "BACK", reply = "Clean, then, and quiet, and I'll write it as a scouting patrol. Thank you.", fx = { affinity = 2, align = { honor = 1 }, standing = { refuge_pointe = 1 } } },
        { text = "Why do the badges matter so much?", next = "syndicate_badges" },
      },
    },
    xhunter = {
      lines = {
        { id = "xhu_default", text = "Good. My scouts went out to Northfold last week and only one came back. Watch the ridges for Witherbark and the low ground for Boulderfist, and tell me where the Horde's riders are going." },
        { id = "xhu_dwarf", when = { race = "Dwarf" },
          text = "A dwarf with a rifle and a beast, and Ironforge's eyes, I hope. My scouts went to Northfold last week and only one came back, so look sharp for Witherbark on the ridges." },
      },
      choices = {
        { text = "Why the Horde's riders?", next = "hammerfall" },
        { text = "I'll bring you a map.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "So the old stories say: a hundred of Arathor's people taught by the elves to fight the trolls, and Strom stood at the heart of it. I'd trade my whole garrison for one of those hundred today, so you'll have to do." } },
      choices = {
        { text = "I'll do.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "The keep doesn't seem to be in Stromgarde's hands.", next = "keep" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "That's good of you to say. The men here have held this camp with no walls and half a supply line, and they don't hear it nearly enough." },
        { id = "s2", text = "I'll take that, and thank you. Stromgarde's name still means something to a few people, and I'm glad you're one of them." },
      },
      fail = {
        { id = "f1", text = "I don't need compliments, I need swords. If you admire the defense so much, you can help me hold it." },
        { id = "f2", text = "That's courtier's talk, and Stromgarde's courtiers are all dead or fled. Speak like a soldier or don't waste my time." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha. You've got some gall, and so did the best sergeant I ever had. I'll let it pass, because I'd rather have a sharp tongue in camp than a dull blade." },
        { id = "s2", text = "Fair enough, I walked into that one. It's been a long while since anyone here had the spirit to joke, so I can't say I mind." },
      },
      fail = {
        { id = "f1", text = "I've lost a kingdom and half my company, and I won't be laughed at by a sellsword passing through. Watch yourself in my camp." },
        { id = "f2", text = "That's the kind of thing the Syndicate shout from the hills before they run. I thought better of you than that." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "All right, stand easy. You've made yourself clear, and I can't afford a brawl in a camp this small, so I'll give you the point." },
        { id = "s2", text = "You've a hard way about you, and I'll admit it gives me pause. Say your piece, and I'll hear it." },
      },
      fail = {
        { id = "f1", text = "I've held this ground against ogres, trolls and the Horde, so a stare won't shift me. Try it again and my sentries will see you to the road." },
        { id = "f2", text = "Men of Stromgarde don't frighten, friend, or we'd have left these highlands years ago. Take that tone somewhere else." },
      },
    },
  },
  confides = {
    { id = "cnf_1", text = "The Syndicate's cutthroats at Northfold Manor change their watch at dawn, and that's the hour my scouts go in." },
    { id = "cnf_2", text = "There's an old Arathor watchtower on the ridge east of camp that the ogres have never found, and my sentries use it to watch the keep." },
    { id = "cnf_3", text = "The old supply cellars beneath Refuge Pointe's ridge still hold dry stores from the Second War, and only my officers know where the door is." },
  },
  blurts = {
    { id = "bl1", text = "The Syndicate's cutthroats bed down in Northfold Manor on the northern road, and their masters have crept into the upper halls of Stromgarde itself." },
    { id = "bl2", text = "The Witherbark trolls in the southeastern hills raid Hammerfall as often as they raid us, and Drum Fel will never admit how badly they hurt him." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you're a soldier, {name}, whatever you call yourself, and Stromgarde has always known what to do with soldiers. You've earned your place at my fire." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You've fought for Refuge Pointe when the pay was poor and the odds were worse. My sentries say your name with respect, and they don't say anyone's that way lightly." },
      { id = "rg_tone", when = { fondness = "tone" }, text = "You speak plainly and you don't waste my time, which is more than I can say for Stormwind's letters. I like that in a soldier." },
      { id = "rg_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "You keep your word, and in these highlands that's rarer than an unburned farmhouse. Stromgarde was built by people like you." },
      { id = "rg_al_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "You've a crooked streak in you, and I've seen it. I'll take your sword gladly, but I'll be counting my patrol routes after you leave." },
    },
    confide = {
      { id = "cf_1", text = "I count the tents every morning before the sentries wake. We lose more each season than Stromgarde sends, and I tell the soldiers otherwise." },
      { id = "cf_2", text = "I write every letter to the families myself, every one, because a captain ought to. Some nights there are more letters than there are candles to write them by." },
    },
    trust = {
      { id = "tr_1", text = "Trust the dwarves who come down from the Thandol Span, because they've never once failed to answer when Stromgarde called. Trust my sentries, too, because they've stayed when every sensible soul has gone south." },
      { id = "tr_2", text = "Trust nobody who comes up the northern road with fine boots and an easy smile. The Syndicate sends its cutthroats dressed as merchants, and I've buried the soldiers who believed them." },
    },
    watchout = {
      { id = "wo_1", text = "Watch Northfold Manor and the northern road, where the Syndicate's cutthroats bed down. They're better armed than they appear, and they don't fight fair." },
      { id = "wo_2", text = "Watch the Witherbark in the southeastern hills, who fight from the trees and take their dead with them. You'll seldom see more than one of them at a time, and that's what makes them dangerous." },
      { id = "wo_3", text = "Watch the Boulderfist ogres in the ruins of Stromgarde. They're slow to anger and very quick to kill once they've started." },
    },
    worries = {
      { id = "wy_1", text = "That I'll lose Refuge Pointe before I ever see the inside of Stromgarde Keep again. I tell the soldiers we'll hold as long as it takes, and I don't know how long that is." },
      { id = "wy_2", text = "That the families back home will stop waiting for their soldiers to come back. Without them, there's nothing left to fight for but stones." },
    },
    hopes = {
      { id = "hp_1", text = "To raise Stromgarde's banner over the keep again and hand it back to a kingdom that still has people in it. That's all I've wanted since the day it fell." },
      { id = "hp_2", text = "I hope to see Arathor's old fields ploughed again from Refuge Pointe to the Thandol Span. My grandfather farmed there, and I'd like to see wheat where he did." },
    },
    favor = {
      { id = "fv_1", text = "If you take Stromgarde badges off the Syndicate's dead, bring them here. They belonged to my soldiers, and their families deserve to have them back." },
      { id = "fv_2", text = "Speak for Stromgarde when you're in Ironforge or Stormwind, and tell them we're still here. Nobody marched for us when we needed it, and we need it now." },
    },
    friendship = {
      { id = "fr_1", text = "I count you a friend, {name}, and I don't say that to many who pass through. You've stood with what's left of my kingdom, and that's enough for me." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "After everything you've done for Refuge Pointe? You're Stromgarde's friend for as long as there's a Stromgarde to speak of, and longer than that if I have a say." },
      { id = "fr_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "You're honest, you're brave, and you've never broken your word to me. That's a friend, by any measure Stromgarde ever kept." },
    },
    never_told = {
      { id = "nt_1", text = "When the keep fell, I was ordered to hold the gate, and I held it until there was nothing left to hold. I've never told anyone that I wept when we retreated, because a captain doesn't." },
      { id = "nt_2", text = "Some nights I don't know whether I'm fighting to take back Stromgarde or only because I don't know how to stop. I've never said that aloud, and I'd ask you not to repeat it." },
    },
    grievance = {
      { id = "gv1", text = "My problem is that I've a kingdom to take back, and you've given me nothing but trouble. Stromgarde can't afford trouble, and neither can I." },
      { id = "gv_prejud", when = { grudge = { worst = "prejudice" } }, text = "You walk like the Syndicate walks, and men in boots like yours cut down three of my lookouts this season. I'll not apologise for remembering it." },
      { id = "gv_wronge", when = { grudge = "wronged" }, text = "I spoke to you as one soldier to another, and you answered like a sellsword with a hand in my stores. That's my problem." },
      { id = "gv_enemy", when = { grudge = "enemy" }, text = "You wear the Horde's colours in a Stromgarde camp, and I've buried too many soldiers to forget what those colours cost us." },
    },
    amends = {
      { id = "am1", text = "Fight for Refuge Pointe and let my sentries see you do it. Stromgarde forgives soldiers, but it has no use for talkers." },
      { id = "am_prejud", when = { grudge = "prejudice" }, text = "Bring me Syndicate blood from the northern road, and I'll stop reading your boots before I read your face." },
      { id = "am_tone", when = { grudge = "tone" }, text = "Speak to me like a soldier, plainly and to the point, and we'll start again from there." },
    },
    spite = {
      { id = "sp1", text = "I think you're a passing sellsword who'll leave the highlands to the ogres the moment the pay runs dry. I've met a hundred like you." },
      { id = "sp_prejud", when = { grudge = { worst = "prejudice" } }, text = "I think you're one bad night away from selling my patrol routes to the Syndicate, and I've told my sentries as much." },
      { id = "sp_enemy", when = { grudge = "enemy" }, text = "I think Hammerfall sent you to count my swords. Go back and tell Drum Fel there are more of them than he hopes." },
    },
    kaldorei = { { id = "tp_kaldorei", text = "Not the elves Stromgarde remembers. The quel'dorei kept faith with Arathor for two thousand years, and the kaldorei have had a year to show us what they're worth." } },
    _gated = {
      { id = "gt1", text = "That's the camp's business, and I don't share it with people I haven't seen under arms. Prove yourself to Refuge Pointe first." },
      { id = "gt2", text = "I know well enough, and I'm keeping it to myself for now. A captain doesn't talk freely to a stranger she's only just met." },
    },
    knows = {
      { id = "tp_knows", text = "My scouts report everything they see in the highlands, and I listen to all of it. Ask, and keep it short." },
    },
    background = { { id = "tp_ba", text = "I'm a soldier of Stromgarde and captain of what's left of it, and that's the whole of my story until the keep is ours again.", next = "keep" } },
    advice = { { id = "tp_ad", text = "Never sleep in the open up here. Ogres, trolls or Syndicate, one of them is always awake and looking for a fire." } },
    stromgarde = { { id = "tp_stromgarde", text = "Stromgarde was the strongest of the human kingdoms once, and it held the line against the Horde when others ran. Now ogres sit in our halls and the Syndicate picks through our dead, and I mean to take it back stone by stone." } },
    scourge = { { id = "tp_scourge", text = "The dead haven't reached the Highlands yet, and I thank the Light for it, because I haven't the soldiers for both them and the ogres. If they come, Refuge Pointe will be the first to know and the last to fall." } },
    thrall = { { id = "tp_thrall", text = "The orc warchief has a camp at Hammerfall, built on the bones of an internment camp, and his people watch us as closely as we watch them. I'll not start a war I can't finish, and neither will they, for now." }, { id = "tp_thrall2", when = { faction = "Horde" }, text = "Your warchief's people sit in Hammerfall and stare at my walls, and I stare right back. Be quick about your business and keep your hand off your weapon in my camp." } },
    alterac = { { id = "tp_alterac", text = "Perenolde's treachery cost Stromgarde dearly in the Second War, and his heirs are picking at our ruins today. I'd hang every one of the Syndicate if I had the rope and the soldiers to carry it." } },
    magni = { { id = "tp_magni", text = "King Magni sends what he can, and the dwarves of the Thandol Span were the first to answer when Stromgarde called. I owe Ironforge more than I can repay." } },
    second_war = { { id = "tp_second_war", text = "Stromgarde fought in the Second War from the first battle to the last, and we lost more than any kingdom but Lordaeron. We're still paying for it, and I'll not have it forgotten." } },
    bolvar = { { id = "tp_bolvar", text = "Stormwind's regent sends letters full of sympathy and very few soldiers. I understand why, and I don't have to like it." } },
    _none = { { id = "tp_none", text = "That's not Stromgarde's concern, so ask someone with more soldiers than we have." } },
  },
}

P:NPC {
  key = "drumfel", id = TODO_NPC("Drum Fel"), name = "Drum Fel",
  bible = "bibles/arathi.md", role = "soldier", tier = "major",
  communities = { "hammerfall" }, temper = { "driven" }, values = { "loyal", "ambitious" },
  likesTone = "blunt", race = "Orc",
  notices = { "race", "kit" },

  impression = {
    first = "He talks as though Hammerfall's prosperous days have already begun.",
    third = "{name} met Drum Fel, who leads Hammerfall and means to clear the highlands of ogres and trolls.",
  },

  greetings = {
    { id = "g_fort", text = "You're in Hammerfall, {class}, built where the humans once kept us in chains. We fight here now, and soon we'll prosper here, so which have you come for?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, good, because the hills won't clear themselves, and Hammerfall can use you." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}, and Hammerfall kept fighting without you. Now you're back, so fight with us." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You're stronger than when you last stood here, I can see it in how you carry yourself. Good; the Witherbark will see it too." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The grunts say you've done good work for Hammerfall. That's how a stranger earns a place by our fire." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I've heard you were caught lying to one of mine. Hammerfall was a prison once, and we don't forget who speaks false to us." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar, {g:brother|sister}! Doomhammer fell on this ground setting us free, and we owe him a fortress worth the price." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Boulderfist clubs, or Witherbark spears? Mend, and then go answer them." },
  },

  start = "hello",
  nodes = {
    opn_peace = {
      lines = {
        { id = "opn_peace_q", text = "The Warchief freed us, and I'd die for him without asking why. But he signs his name beside Lady Proudmoore's while there's a Stromgarde soldier on the next hill who'd see us all back in chains. Some at this fire say Doomhammer would never have made that bargain. Where do you stand?" },
      },
      choices = {
        { text = "Peace lets our children grow up free. Thrall chose right.", next = "opn_peace_r_peace", fx = { align = { honor = 1 }, opinion = { peace = "peace", warchief = "trust" } } },
        { text = "Humans built the camps. I'll make no peace with them.", next = "opn_peace_r_war", fx = { affinity = 1, align = { honor = -1 }, opinion = { peace = "war" } } },
        { text = "Peace in Kalimdor. Out here, we fight for what we hold.", next = "opn_peace_r_local_war", fx = { affinity = 1, trait = { practical = 1 }, opinion = { peace = "local_war" } } },
        { text = "Thrall's soft on humans. Doomhammer knew better.", next = "opn_peace_r_soft", when = { race = "Orc" }, fx = { opinion = { warchief = "soft" } } },
        { text = "That's for the Warchief to decide.", next = "BACK" },
      },
    },
    opn_peace_r = {
      lines = {
        { id = "opn_peace_r_default", text = "Good answer. It's the one I give when the hotheads ask me." },
      },
      choices = {
        { text = "Something else, Drum Fel.", next = "BACK" },
      },
    },
    opn_peace_r_peace = {
      lines = {
        { id = "opn_peace_r_peace", text = "Free. Aye, that's the word that matters. I'll build the walls high anyway, so our children get to be free behind them." },
      },
      choices = {
        { text = "Something else, Drum Fel.", next = "BACK" },
      },
    },
    opn_peace_r_war = {
      lines = {
        { id = "opn_peace_r_war", text = "Say that louder at the fire and you'll have friends for life, and my wife Korin will glare at you across it. I won't argue, though I'll follow the Warchief." },
      },
      choices = {
        { text = "Something else, Drum Fel.", next = "BACK" },
      },
    },
    opn_peace_r_local_war = {
      lines = {
        { id = "opn_peace_r_local", text = "Ha! That's Hammerfall's answer exactly, and you didn't even need to be in a camp to learn it." },
      },
      choices = {
        { text = "Something else, Drum Fel.", next = "BACK" },
      },
    },
    opn_peace_r_soft = {
      lines = {
        { id = "opn_peace_r_soft", text = "Careful. Doomhammer named Thrall himself, with his last breath, on this ground. Say what you like about the humans, but not about him in Hammerfall." },
      },
      choices = {
        { text = "Something else, Drum Fel.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Hammerfall trusts anyone who bleeds for it, or whatever it is your people do instead. The orcs who were chained here saw the Light in the hands of their jailers, so some will glare, but I will tell them to judge you by your deeds." } },
      choices = {
        { text = "I'll prove myself in Hammerfall's fights.", next = "BACK", reply = "Good. Bleed for it, and the orcs will forget what you look like.", fx = { align = { honor = 1 } } },
        { text = "Let them glare. I didn't come here for their trust.", next = "BACK", reply = "Then you'll stand alone at the wall, and the ogres won't care either way. Your choice.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To hold the walls while the rest of us build, for the Boulderfist come down from the hills every few nights and the Witherbark never sleep. When the walls are safe the traders will come, and when the traders come, Hammerfall will be what Doomhammer died for." } },
      choices = {
        { text = "I'll hold the wall. Hammerfall deserves to stand.", next = "BACK", reply = "Good. Hammerfall stood once as a cage, and now it stands as ours. Keep it standing.", fx = { align = { honor = 1 } } },
        { text = "Walls are for traders. I came here to crack ogre skulls.", next = "BACK", reply = "Then crack them on the wall, where they're coming. Same skulls, less walking.", fx = { align = { honor = -1 } } },
        { text = "Something else, Drum Fel.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, and the Highland striders too, for they kick over carts and scatter the pack beasts. When Hammerfall trades with the Undercity in earnest, I want those roads clear enough for a peon to walk them alone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Aye, and the Highland striders too, for they kick over carts and scatter the pack beasts. Your {pet} looks fierce enough to clear a road on its own, {class}, so feed it well, because it'll earn its keep here." },
      },
      choices = {
        { text = "I'll clear the roads, and take only what I need.", next = "BACK", reply = "Good. Leave the young ones and the striders will be back next spring, and so will the traders who follow them.", fx = { align = { honor = 1 } } },
        { text = "I'll clear them, and I'll sell every hide I take.", next = "BACK", reply = "Sell them, then, and buy something useful. Hammerfall needs coin as much as it needs walls.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Share? The Boulderfist share nothing but their clubs, and they took Stromgarde's ruins before the humans had finished mourning them. When they are gone, the land will have room to breathe, and so will Hammerfall." } },
      choices = {
        { text = "Then we break them in open battle.", next = "BACK", reply = "In battle, then, and I'll be in the front of it. That's how Doomhammer did it.", fx = { align = { honor = 1 } } },
        { text = "Let the ogres and the humans bleed each other first.", next = "BACK", reply = "Let them bleed, yes, but don't wait too long. Whoever wins comes for us next.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "On the wall, when the ogres come, and in the yard after, when the young ones come back from the Witherbark with poisoned cuts. Tor'gan, our shaman, does what he can, but he's one troll and he spends half his days on old Gor'mul, and I won't lose a warrior because the shaman was busy elsewhere." } },
      choices = {
        { text = "Then I'll stand on the wall with your warriors.", next = "BACK", reply = "Good. I'd sooner have one priest on the wall beside my grunts than three of them waiting in the infirmary.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Gor'mul is past saving. Tor'gan should spend himself on the living.", next = "BACK", reply = "Maybe so, but Gor'mul is ours, and we don't give up on our own. Tor'gan will tend him, and you'll tend the rest.", fx = { align = { honor = -1 } } },
        { text = "Something else, chieftain.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" },
          text = "A tauren druid in Hammerfall! The Earth Mother's children are welcome among us, and so are their claws, for the Boulderfist have plenty of hide to tear." },
        { id = "h_default", key = true,
          text = "I am Drum Fel, and I lead Hammerfall, which we raised on the ashes of an internment camp in Orgrim Doomhammer's name. The Boulderfist ogres and the Witherbark trolls stand between us and the highlands, and once they fall, Hammerfall will thrive." },
        { id = "h_hammer", tags = { "news" }, when = { questActive = TODO_QUEST("The Hammer May Fall") },
          text = "The Boulderfist hit our walls and think we'll sit and take it. Show them otherwise." },
        { id = "h_tallow", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Hammer May Fall"), days = 2 } },
          text = "So Tallow sent you up from Tarren Mill, either hoping the ogres would finish you or thinking you could help. You're here now, so rest, and come back to me when you're ready to fight." },
        { id = "h_arms", when = { questActive = TODO_QUEST("Call to Arms") },
          text = "This is a call to arms: the Witherbark first, then whoever's next, because Hammerfall doesn't wait to be attacked." },
        { id = "h_arms_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Call to Arms"), days = 2 } },
          text = "There's blood on your gear and sweat on your brow, and that's how I like my soldiers to come home. Eat something, rest, and then go out again." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage, {class}. Hammerfall's walls are stone, but the Boulderfist hit them with stone too, and fire is something they are not used to." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A quiet one, {class}. Hammerfall could use eyes among the Witherbark, for the trolls watch our walls and I would like to watch them back." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior of the Horde! Hammerfall bears the Doomhammer's name, and it'll be built by warriors like you, one cracked ogre skull at a time." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! These hills are thick with raptors and worse, and every beast you bring down is one less to trouble our caravans when they come." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. Hammerfall bleeds every time the Boulderfist hit the walls, {class}, and I'd sooner have one healer on the parapet than ten more mouths in the barracks." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = { "Boulderfist", "Witherbark" }, min = 40 } }, text = "The scouts say the Boulderfist and Witherbark have stopped testing our walls, and I know whose axe taught them that. Hammerfall remembers who bled for it." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "One of the Dark Lady's people, and a paladin as well. Hammerfall will take any strong arm against the Boulderfist and the Witherbark, and if yours carries the Light, so much the better." },
      },
      again = {
        { id = "h_again", text = "What else? Say it plain; Hammerfall has no time for riddles." },
        { id = "h_again2", text = "Say your piece, but keep it low; there are too many ears in these hills." },
      },
      choices = {
        { text = "Must the ogres be driven out, or can the highlands be shared?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me about this place.", next = "history" },
        { text = "Hammerfall looks like it's been under attack.", next = "enemies" },
        { text = "Where do the ogre leaders hide?", next = "stromgarde" },
        { text = "Hammerfall seems more camp than stronghold.", next = "future" },
        { text = "Lok'tar, chieftain. I came to fight.", next = "orc", when = { race = "Orc" } },
        { text = "The Witherbark are trolls. Do you trust me?", next = "troll", when = { race = "Troll" } },
        { text = "Korin worries for you, Drum Fel.", next = "korin", when = { questDone = TODO_QUEST("The Real Threat") } },
        { text = "The elements are with Hammerfall, chieftain.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I carry a power the Horde once paid for dearly. Does that trouble you?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "The Dark Lady sends her regards to Hammerfall.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "The Boulderfist ogres must fear magic.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What should I look for among the Witherbark?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What does Hammerfall need most from its warriors, Drum Fel?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I could hunt the raptors along the caravan roads, Drum Fel.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Where does Hammerfall need a healer most, Drum Fel?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does Hammerfall trust a Forsaken who calls on the Light, Drum Fel?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll fight.", next = "END", fx = { affinity = 2, standing = { hammerfall = 1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Their numbers, their shamans, and the paths between their villages, for the Witherbark move through these hills faster than any grunt can follow. When Hammerfall thrives, it will be because somebody crawled through Witherbark dung to count their spears, and I will remember who did it." } },
      choices = {
        { text = "Somebody has to count spears. I don't mind the mud.", next = "BACK", reply = "Good. Mud washes off, and every spear you count is one less that surprises us at the gate.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather face them openly, Drum Fel.", next = "BACK", reply = "Openly, then, and you'll be the first thing they see. Count fast before the arrows start.", fx = { align = { honor = 1 } } },
        { text = "Something else, Drum Fel.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ogres fear little and understand less, but their ogre-mages know enough to be dangerous, and they hide behind the brutes. Burn the mages first and the rest will stand around wondering who to follow, which is how ogres spend most of their lives." } },
      choices = {
        { text = "Burning their mages from cover is the smart way.", next = "BACK", reply = "Smart, and quick, and the brutes won't know what's happened until their robes are burning. Good.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll meet their champions face to face, not hide.", next = "BACK", reply = "Face to face, then, like an orc. I'll respect it, though their champions won't.", fx = { align = { honor = 1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },

    history = {
      big = true,
      lines = {
        { id = "hi_default", text = "The humans built a camp here to hold our people in chains, and Thrall and Doomhammer tore it down. Doomhammer took a lance in that fight and didn't survive it, so we rebuilt on the ruins and named it for him." },
      },
      choices = {
        { text = "Who lives here now?", next = "history_refuge" },
        { text = "The old camps must still haunt you.", next = "history_camps" },
        { text = "Lok'tar ogar.", next = "BACK", reply = "Lok'tar ogar. Doomhammer would have liked you; he never trusted anyone who needed a speech first.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Doomhammer's way got him killed. I'd rather live to fight tomorrow.", next = "BACK", reply = "Maybe it did, and maybe living is the smarter road. But you won't speak ill of him on these stones, not where I can hear it.", fx = { align = { honor = -1 } } },
      },
    },
    history_refuge = {
      lines = {
        { id = "hr_default", text = "Orcs who never found a place in the new cities, and a few who never looked for one. Hammerfall takes anyone who'll stand a wall and swing an axe, and doesn't ask much about the rest." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    history_camps = {
      lines = {
        { id = "hc_default", text = "Every orc behind these walls was in a camp, or was born to someone who was. We don't talk about it at the fire; we build on top of it, and that's our answer." },
      },
      choices = {
        { text = "Thrall keeps peace with the humans now. What do you think?", next = "opn_peace" },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },

    enemies = {
      lines = {
        { id = "e_default", text = "The Witherbark trolls to the south and the Boulderfist ogres to the west, and they work together to drive us out of this land. We won't meet our end at their hands or anyone else's." },
      },
      choices = {
        { text = "Trolls and ogres together seems an odd pairing.", next = "enemies_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies_why = {
      lines = {
        { id = "ew_default", text = "The trolls turned their backs on the Horde, and the ogres would use us for food and bedding if we let them. Neither likes the other, but both like us less." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    stromgarde = {
      lines = {
        { id = "s_default", text = "The Boulderfist lords and their shamans have made their lair in the ruins of Stromgarde, a fine monument to human weakness. Kill the head of the beast and the body stops coming at us." },
      },
      choices = {
        { text = "Don't the humans still hold part of it?", next = "stromgarde_humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stromgarde_humans = {
      lines = {
        { id = "sh_default", text = "A prince with a handful of soldiers holds a corner of it, and the Syndicate thieves crawl through the rest. Zengu, the Darkspear by our fire, has business with that prince, so ask him, but my quarrel is with the ogres." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "syndicate" } } } },
    },

    future = {
      lines = {
        { id = "f_default", text = "A real stronghold, with fields and herds and young ones who've never seen a chain. Once the trolls and ogres are dealt with, Hammerfall will thrive in these highlands, and I mean to see it." },
      },
      choices = {
        { text = "I'll help you build it.", next = "BACK", fx = { affinity = 2, standing = { hammerfall = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    orc = {
      lines = {
        { id = "o_default", text = "Then you've come to the right fortress, {g:brother|sister}. Rest tonight, because tomorrow I'll have more fighting for you than your arms can carry." },
      },
      choices = { { text = "Lok'tar!", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    troll = {
      lines = {
        { id = "t_default", text = "You're Darkspear, and the Darkspear stood with Thrall when it mattered, which is more than the Witherbark ever did. Zengu sits by my fire, and so can you." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    korin = {
      lines = {
        { id = "k_default", text = "Korin reads her auguries and worries, and I read the hills and fight; between us we keep Hammerfall standing. Whatever she told you, she'd tell me herself if it were my business." },
      },
      choices = {
        { text = "Of course.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = {
        { id = "xsh_default", text = "Good, because the trolls have their own spirits and the ogres have their own fists, and I'll take all the help the earth will give us. Korin listens for the omens, but a shaman who can call the lightning down is worth ten omens." },
        { id = "xsh_tauren", when = { race = "Tauren" },
          text = "A tauren who speaks to the elements, in my fortress. Thrall would like that. Call the storm on the Witherbark, friend, and Hammerfall will remember your name." },
      },
      choices = {
        { text = "The elements aren't a weapon to aim.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Show me where to call the storm.", next = "enemies", fx = { affinity = 1 } },
      },
    },
    xwarlock = {
      big = true,
      lines = { { id = "xwl_default", fx = { learn = { "burning_blade" } },
        text = "It troubles me more than any ogre, and I'll tell you why: I've seen the Burning Blade, and I remember what that magic did to our people. Thrall allows your kind in the Horde, so I allow you in Hammerfall, but I'll be watching where you point it." },
        { id = "xwl_demon", when = { pet = { type = "Demon" } }, fx = { learn = { "burning_blade" } }, text = "It troubles me more than any ogre, and more with that thing at my fire, for I've seen the Burning Blade and I remember what that magic did to our people. Thrall allows your kind in the Horde, so I allow you in Hammerfall, but your demon stays where my grunts can see it, and so do you." },
      },
      choices = {
        { text = "Watch all you like. It points at the Horde's enemies.", next = "BACK", reply = "Good. As long as it keeps pointing that way, we have no quarrel.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Power is power, and Hammerfall needs every bit of mine.", next = "BACK", reply = "Hammerfall needs every arm, and I'll take yours. But the orcs here remember Gul'dan, so don't forget it.", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    xforsaken = {
      lines = { { id = "xfo_default", text = "Does she? Then you can carry mine back: Hammerfall holds, and it holds without Undercity's apothecaries. Fight the Boulderfist beside my grunts and we'll get along well enough." } },
      choices = {
        { text = "I'll fight, and that's all you'll get from me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Who's attacking you?", next = "enemies" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Good. You see what we've built on this ground, and you say so without crawling. I'll remember that you spoke well of Hammerfall." },
        { id = "s2", text = "Praise from a fighter is worth having, and you carry yourself like one. It's welcome, {class}." },
      },
      fail = {
        { id = "f1", text = "Words are cheap in Hammerfall. Bring me Witherbark tusks or ogre heads, and that will be all the praise I need." },
        { id = "f2", text = "You flatter like a human trader. I've no use for it, and you'll find I'm harder to please than that." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You've got fire in you, and you're not afraid to throw it at me. Good, because I've no use for anyone who flinches." },
        { id = "s2", text = "That was bold. I beat an ogre for less once, but you said it with a grin, and I find I'm grinning too." },
      },
      fail = {
        { id = "f1", text = "Our people wore chains on this very ground, so choose what you laugh at here. Insult me again and we'll settle it in the yard." },
        { id = "f2", text = "That was a whelp's yapping, and it's earned you nothing. Come back when you've got deeds to put behind your mouth." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Hm. You stand your ground, and I respect strength when I see it. I'll hear you, for Hammerfall has enemies enough beyond the wall." },
        { id = "s2", text = "You've a warrior's stare, and I won't pretend it's nothing. Very well, you've earned an answer." },
      },
      fail = {
        { id = "f1", text = "I've broken ogres with my own hands, so that look does nothing to me. If you want to try me, the yard is open and I'm not busy." },
        { id = "f2", text = "You threaten me in Hammerfall, where Doomhammer fell so that no orc would be cowed again? You shame yourself, and I'll not bend to it." },
      },
    },
  },
  confides = {
    { id = "cnf_1", text = "The Witherbark trolls carry their wounded back to the old troll ruins in the southeast hills, so the ones you wound are never truly gone." },
    { id = "cnf_2", text = "The Boulderfist lords in Stromgarde's ruins trade with the Syndicate for steel, so every dead Syndicate courier means fewer ogre blades at my walls." },
    { id = "cnf_3", text = "Korin reads the auguries every morning, and when she will not tell me what she saw, I double the watch on the walls." },
  },
  blurts = {
    { id = "bl1", text = "Refuge Pointe is thinner than it looks. Stromgarde has more tents than soldiers there, and the Syndicate pick off its lookouts every week." },
    { id = "bl2", text = "The Boulderfist ogres have crawled into the ruins of Stromgarde, and nothing pleases me more than watching the humans bleed against them for it." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you are a strong {class}, and you fight for the Horde without asking what it pays. Hammerfall needs more like you." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You have bled against the Witherbark and the Boulderfist for Hammerfall, and my grunts speak your name with respect. That is worth more than any medal." },
      { id = "rg_orc", when = { race = "Orc" }, text = "You are of my blood, and you carry yourself like an orc who remembers the camps. Hammerfall is your home whenever you need it." },
      { id = "rg_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "You fight with honor and you keep your word, as the Warchief taught us. Doomhammer would have been proud to have you in his ranks." },
      { id = "rg_al_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "You fight like a rogue, and I don't care for that. Still, you've done much for Hammerfall, and I will not spit on that." },
    },
    confide = {
      { id = "cf_1", text = "I beat Or'Kalar in single combat, years ago, and he has never forgiven me for it. Sometimes I think every ogre in these highlands knows my name because of that one fight." },
      { id = "cf_2", text = "I was a grunt in this camp when it was still a camp, with human guards on the walls and our people in chains. I sleep in the room where the warden slept, and I chose it on purpose." },
    },
    trust = {
      { id = "tr_1", text = "Trust Korin, my mate, who sees further than I do and says less. Trust Gor'mul and any grunt who has bled on these walls." },
      { id = "tr_2", text = "Trust the Forsaken from Tarren Mill to fight, and nothing more than that. They are allies, but they smile at the wrong things." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the Witherbark, who fight from the trees and strike from above. Look up before you look ahead in the southeastern hills." },
      { id = "wo_2", text = "Watch the Boulderfist in Stromgarde's ruins, who would use an orc for food and his armor for bedding. They are slow, but they hit like a falling wall." },
      { id = "wo_3", text = "Watch the humans at Refuge Pointe, who keep their swords sharp and their tempers sharper. There is no war between us now, but there could be by morning." },
    },
    worries = {
      { id = "wy_1", text = "That the Witherbark and the Boulderfist will put their quarrels aside and come for Hammerfall together. If they do, these walls will not hold, and I know it." },
      { id = "wy_2", text = "That Korin hides things from me to keep me from rushing into a fight. She is usually right to, and I hate that she is usually right." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to see Hammerfall grow into the strongest Horde city in the east, with markets and forges and children who have never seen a chain." },
      { id = "hp_2", text = "I hope to clear these highlands of ogres and trolls before my arms grow too weak to swing an axe. After that, I will rest, and not before." },
    },
    favor = {
      { id = "fv_1", text = "Kill Witherbark and Boulderfist in Hammerfall's name, and come back to tell me of it. My grunts need to hear that the enemy can be beaten." },
      { id = "fv_2", text = "Speak well of Hammerfall in Orgrimmar, if you are ever before the Warchief. Tell him we hold, and that we could hold better with more warriors." },
    },
    friendship = {
      { id = "fr_1", text = "You are my friend, {name}, and I don't say that to many who come through Hammerfall's gates. Lok'tar, and may your axe stay sharp." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You have fought beside my grunts and bled on my walls. That makes you blood to me, and an orc does not say that lightly." },
      { id = "fr_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "You keep your word and you fight with honor, and that is all I ask of a friend. You have mine, and you have Hammerfall's." },
    },
    never_told = {
      { id = "nt_1", text = "I did things in the Second War that I am not proud of, before the camps. I have never told Korin all of it, and I never will." },
      { id = "nt_2", text = "When Doomhammer broke this camp open, I was too frightened to run out with the others, and I hid in the barracks until it was over. I have spent my life making up for that night." },
    },
    grievance = {
      { id = "gv1", text = "You've made yourself a nuisance in Hammerfall, and I've no patience for nuisances while there are ogres left in the highlands." },
      { id = "gv_enemy", when = { grudge = "enemy" }, text = "You're Alliance, standing inside walls your people built to cage mine. I've not forgotten who held the keys." },
      { id = "gv_wronge", when = { grudge = "wronged" }, text = "I gave you honest words and honest work, and you threw both back at me. An orc remembers that a long time." },
      { id = "gv_values", when = { grudge = "values" }, text = "You fight for yourself and nobody else. Hammerfall was built by orcs who learned better than that in the camps." },
    },
    amends = {
      { id = "am1", text = "Kill ogres and trolls in Hammerfall's name, and keep at it until my grunts can say your name without spitting." },
      { id = "am_enemy", when = { grudge = "enemy" }, text = "You can't, not while you wear Alliance colours. Keep away from my walls, and we'll both live longer." },
    },
    spite = {
      { id = "sp1", text = "I think you'd have made a good guard in the internment camps, and that's the worst thing I know how to say to anyone." },
      { id = "sp_enemy", when = { grudge = "enemy" }, text = "I think Refuge Pointe sent you to look at my walls. Tell them these walls are thicker than the ones they kept us behind." },
    },
    _gated = {
      { id = "gt1", text = "That isn't for your ears yet. Fight for Hammerfall first, and then I'll decide what you've earned." },
      { id = "gt2", text = "I know it, and I'll keep it until you've proven yourself to me. I don't share such things with those I haven't seen bleed for the Horde." },
    },
    knows = {
      { id = "tp_knows", text = "Hammerfall's scouts range far, and they tell me what they find. Ask, and I'll tell you what serves the Horde." },
    },
    burning_blade = { { id = "tp_blade", text = "Not here, they're not; Doomhammer would have broken their necks himself." } },
    background = { { id = "tp_ba", text = "I beat an ogre called Or'Kalar once, years ago, and I've been fighting his kind ever since. That's the only story an orc in Hammerfall needs." } },
    advice = { { id = "tp_ad", text = "The Witherbark fight from the trees, so look up before you look ahead. The Boulderfist fight from the front, so look up anyway, because they're tall." } },
    thrall = { { id = "tp_thrall", text = "The Warchief freed us from the camps, and Hammerfall is proof of it, built on the very ground where we were chained. One day this will be the strongest Horde city in the east, and he will see it." } },
    internment = { { id = "tp_internment", text = "Hammerfall was an internment camp, and Orgrim Doomhammer died breaking it open. We built our city on that ground so no orc would ever forget what it cost to be free." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are allies of the Horde, and they send their warriors from Tarren Mill when we ask. I don't understand them, but I respect that they fight." } },
    stromgarde = { { id = "tp_stromgarde", text = "The humans at Refuge Pointe cling to their ruined kingdom like a dog to a bone, and the ogres take more of it every season. When the ogres are gone, we'll see whose land this is." } },
    second_war = { { id = "tp_second_war", text = "The Second War ended with us in chains, and I'll not pretend I was proud of everything we did in it. The Warchief has given us a better way, and I mean to follow it." } },
    _none = { { id = "tp_none", text = "That's not my concern, {class}. Hammerfall is, and the Horde." } },
  },
}

P:NPC {
  key = "zengu", id = TODO_NPC("Zengu"), name = "Zengu",
  bible = "bibles/arathi.md", role = "questgiver", tier = "quest",
  communities = { "hammerfall" }, temper = { "patient" }, values = { "loyal", "brave" },
  notices = { "class", "race", "lock_pact" },

  impression = {
    first = "He finds it funny to turn a troll-killing sword on the Gurubashi.",
    third = "{name} met Zengu, a Darkspear troll sent by Vol'jin to find the sword Trol'kalar in Arathi.",
  },

  greetings = {
    { id = "g_hunt", text = "Sit, sit. Zengu be patient, mon, like a good hunter always be." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Another hunter, good! You know the waiting part of the hunt be longer than the killing part." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! Then you know who sent me: the chief want something, and Zengu be bringing it home." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You be runnin' hot, mon, like a fever with no sickness behind it, and Zengu can smell the little fire demon's mark in your blood. Zengu don't mind the heat, but the loa do, so maybe sit downwind." },
  },

  start = "hello",
  nodes = {
    dd_witherbark = {
      lines = { { id = "dd_witherbark_default", text = "Kin is a big word, mon. Dey troll, and I be troll, but de Witherbark turned away from Thrall and took dem old gods' bloody ways back up de hills, so dey made dem choice, and you only answered it." } },
      choices = {
        { text = "They chose blood. I'll keep answering it until they stop.", next = "BACK", reply = "Den keep your spear sharp, because dey don't stop easy. De loa watch, and dey keep count too.", fx = { align = { light = -1 } } },
        { text = "Some might come down from the hills, given the chance.", next = "BACK", reply = "Maybe one or two, mon, maybe. If you find one dat want to, you bring him to Zengu, and we see.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else, Zengu.", next = "BACK" },
      },
    },

    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It be the best joke of all, mon, because the humans called on the Light against the Amani and called us beasts. Now it fight on our side, and the spirits must be laughin' themselves sick." } },
      choices = {
        { text = "The Light was never the humans' to own. It answers to the just.", next = "BACK", reply = "Ya, dat be the best answer, mon, and Zengu like it. The Light find a strange home in a troll, and a good one.", fx = { align = { light = 1 } } },
        { text = "It's a weapon, Zengu, and now it belongs to us.", next = "BACK", reply = "A weapon, ya, and now it point the other way. That be the joke Zengu like best.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Trol'kalar was made to kill trolls, and Vol'jin say we turn it on the Gurubashi, who be worse than any human. I think there be justice in that, even if the sword don't care which troll it cut." } },
      choices = {
        { text = "Justice is justice. Turn the sword on the Gurubashi.", next = "BACK", reply = "Ya, justice for the Gurubashi, and a good laugh for the loa. You got the right idea, mon.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A blade made for slaughter ought to be broken.", next = "BACK", reply = "Broken? Maybe one day, mon, after it finish with the Gurubashi. Then we see.", fx = { align = { light = 1 } } },
        { text = "Something else, mon.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Zengu trust you to carry it back here and nothin' more, mon. That blade been killin' trolls since the days of Arathor, and Zengu want to see it turned on the Gurubashi, which be the best joke in the whole Highlands." } },
      choices = {
        { text = "I'll fight Stromgarde's guards openly for it, not creep in.", next = "BACK", reply = "Openly, mon? Brave, and maybe foolish, but Zengu not tell you how to die.", fx = { align = { honor = 1 } } },
        { text = "Steal it, turn it, whatever works. I like the joke.", next = "BACK", reply = "Ha! You see the joke too! Zengu like you more every minute.", fx = { align = { honor = -1 } } },
        { text = "Something else, Zengu.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The humans lock it with the sigil, and that be magic of a sort, mon, old Arathor magic. The witch doctors say a tomb like that got a chill on it too, the kind a dead king leave behind when he still be angry, so walk soft in there." } },
      choices = {
        { text = "Respect the dead king. Take the sword and touch nothing else.", next = "BACK", reply = "Respect, ya, and a quick hand. Old kings get angry slow, and you be gone by then.", fx = { align = { honor = 1 } } },
        { text = "A dead human king can stay angry. I'll take whatever I like.", next = "BACK", reply = "Then you be the one he come lookin' for, mon, not Zengu. Remember that when the candles go out.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The spirits don't care much who made the sword, mon, they care who swing it. Trol'kalar been sleepin' in Trollbane's tomb a long time, dreamin' of troll blood, so maybe we ask the ancestors to cool its temper before Vol'jin pick it up." } },
      choices = {
        { text = "Cleanse it first. A cursed blade shames whoever carries it.", next = "BACK", reply = "Cleanse it, ya, and the witch doctors will bless it after. That be wisdom, mon.", fx = { align = { honor = 1 } } },
        { text = "Let the blade stay angry. The Gurubashi earned every drop.", next = "BACK", reply = "Ya, every drop, mon, and then some. Zengu hope it still remember the taste.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, mon! The Darkspear been talkin' to the spirits long before the orcs come, but Thrall teach us a few new tricks too, and the loa don't seem to mind." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, mon! If you be Darkspear, the loa walk with you, and if you be Forsaken, well, Zengu hope somethin' walk with you, because these hills be cold." },
        { id = "h_default", key = true,
          text = "Zengu, of the Darkspear. Vol'jin send me for a sword, Trol'kalar, made by humans to kill trolls and sleepin' now in Trollbane's tomb in Stromgarde, and we going to use it against the Gurubashi, which be a fine joke, mon." },
        { id = "h_trollbane", tags = { "news" }, when = { questActive = TODO_QUEST("Trollbane") },
          text = "The sword sleep in Trollbane's tomb, in Stromgarde, and the humans guard it, so we going to need a key first." },
        { id = "h_sigil", when = { any = { { questActive = TODO_QUEST("Sigil of Strom") }, { questActive = TODO_QUEST("The Broken Sigil") }, { questActive = TODO_QUEST("Sigil of Thoradin") }, { questActive = TODO_QUEST("Sigil of Arathor") }, { questActive = TODO_QUEST("Sigil of Trollbane") } } },
          text = "The sigil be broken in pieces, all over these hills, so bring the pieces; a key that open a tomb don't come easy." },
        { id = "h_trolkalar", when = { questActive = TODO_QUEST("Trol'kalar") },
          text = "Bring Trol'kalar out of that tomb, and the chief will hear your name." },
        { id = "h_trolkalar_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Trol'kalar"), days = 3 } },
          text = "For longer than anyone remember, Strom and Arathor cut down our people, and now their best blade be in troll hands. I see it get to Nimboya at Grom'gol, mon, and the Darkspear owe you a debt." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "Mage, eh? The Gurubashi blood priests use their own kind of magic, {class}, and it smell worse than yours by a long way." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "The Darkspear teach their young to move quiet in the jungle, {class}, and you got that same walk. Maybe you be the one to fetch Trol'kalar for Vol'jin, eh?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon, and a big one. Stromgarde keep a sword in their vaults made to kill trolls, and Zengu would like it carried by a warrior who know what to do with it." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID", faction = "Horde" }, text = "A tauren druid, mon. The loa of the wild must like you, 'cause you walk like one of their own." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Ha, a dead paladin, mon! The humans' Light, in the hands of the Forsaken, and me here fetchin' a troll-killin' sword to use on the Gurubashi, so this be a very good week for jokes." },
        { id = "h_dd_witherbark", tags = { "news" }, when = { killed = { name = "Witherbark", min = 30 } },
          text = "You been killin' a lot of Witherbark in dem hills, mon, and Zengu can tell, because de drums at Hammerfall don't sound so worried no more. Some of dem trolls I knew de faces of, once." },
      },
      again = {
        { id = "h_again", text = "More? Zengu got all day, mon. Hunters always do." },
      },
      choices = {
        { text = "Will the spirits bless a human sword against the Gurubashi?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there magic guarding Trollbane's tomb, Zengu?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "A human sword against trolls?", next = "joke" },
        { text = "Vol'jin must want that sword badly.", next = "why" },
        { text = "How do we open the tomb?", next = "sigils" },
        { text = "These hills look hard to hunt in.", next = "hunt" },
        { text = "Teach me your patience.", next = "hunter", when = { class = "HUNTER" } },
        { text = "I'm Darkspear. What does the chief need of me?", next = "troll", when = { race = "Troll" } },
        { text = "I've met Nimboya, in Grom'gol.", next = "nimboya", when = { heardLine = "nimboya.h_default" } },
        { text = "I hear voices the loa don't send.", next = "xwarlock", when = { race = "Troll", class = "WARLOCK" } },
        { text = "I'd guess the Darkspear don't trust mages, Zengu.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why steal a human sword instead of forging your own?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'd guess you'd trust a warrior to carry Trol'kalar, Zengu.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should we use a troll-killing sword against trolls?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Does it amuse you that the Light now serves the Horde, Zengu?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Ha! Let's go get it.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "The Witherbark are your kin, Zengu. Does it trouble you?", next = "dd_witherbark", when = { killed = { name = "Witherbark", min = 30 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a sword made to kill trolls know where a troll keep his heart, and the Gurubashi got plenty of hearts. Takin' it from Stromgarde be easy enough, mon; the hard part be keepin' Trol'kalar from turnin' on the hand that hold it." } },
      choices = {
        { text = "Using their own weapon against them? Clever. I like it.", next = "BACK", reply = "Ya, it be clever, and Zengu wish it be his own idea. Maybe it was, mon.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Stolen blades bring bad luck, Zengu. Forge your own.", next = "BACK", reply = "Bad luck for the Gurubashi, maybe. Zengu take his chances, mon.", fx = { align = { honor = 1 } } },
        { text = "Something else, mon.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Darkspear trust whoever Vol'jin trust, and Vol'jin trust the Warchief, so here we be. Some of the young ones at Sen'jin learnin' fire now, and the old ones grumble, but the old ones always grumble." } },
      choices = {
        { text = "The old ways should make room for new ones.", next = "BACK", reply = "Ya, dat be what Vol'jin say too, and Zengu listen to Vol'jin. The old ones grumble, but they come round when they see it work.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The old ones grumble for a reason. Listen to them.", next = "BACK", reply = "They do, mon, and Zengu listen to them too. But the world change faster than they do.", fx = { align = { order = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },

    joke = {
      lines = { { id = "j_default", text = "Every blade cut whoever be in front of it, mon, and the humans forgot that, but Zengu didn't." } },
      choices = {
        { text = "Who made the sword?", next = "joke_history" },
        { text = "Ha! Let's talk about something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    joke_history = {
      lines = {
        { id = "jh_default", text = "Long ago, when the forest trolls fight the empire of Arathor, their worst enemy be Lord Ignaeus of Strom, and they call him Trollbane. He ride into battle with Trol'kalar, and in the old tongue that mean troll slayer." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = {
        { id = "w_default", text = "Thoras Trollbane be dead and Stromgarde be ruins, so the chief say now be the time to take the sword from human hands. We use it in the battles to come against the trolls of Zul'Gurub." },
      },
      choices = {
        { text = "Where will it go?", next = "why_nimboya" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_nimboya = {
      lines = {
        { id = "wn_default", text = "South, to Nimboya at Grom'gol, closer to the Gurubashi. A sword that kill trolls should be near the trolls that need killing." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } } },
    },

    sigils = {
      lines = {
        { id = "s_default", text = "The tomb be warded, and the sigils that open it were shared out among the last of Stromgarde. The Syndicate grab one, the militia hold pieces of another, the cavalry captain carry one, and Prince Galen keep the last himself." },
      },
      choices = {
        { text = "Pieces of another?", next = "sigils_torgan" },
        { text = "The prince himself?", next = "sigils_galen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sigils_torgan = {
      lines = {
        { id = "st_default", key = true, text = "Galen break the sigil of Thoradin into eleven bits and hand them to his defenders, clever boy. Bring the bits to Tor'gan, our shaman here, and he put it back together while you look away." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sigils_galen = {
      lines = {
        { id = "sg_default", text = "He sit in a chapel deep in the militia's part of the keep, well guarded, and he be no slouch with a blade. The line of Trollbane hunt my people for ages, mon, so Zengu don't weep for it." },
      },
      choices = {
        { text = "That's a cold thing to say, Zengu.", next = "BACK", reply = "Cold, ya, and Zengu not sorry. Trollbane's line been cold to us for two thousand years.", fx = { align = { light = 1 } } },
        { text = "After what Trollbane's line did to your people, I wouldn't weep either.", next = "BACK", reply = "Zengu not weep either, mon. Zengu laugh, maybe, and pour a little rum for Bwonsamdi.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hunt = {
      lines = {
        { id = "hu_default", text = "Slow, mon, and from downwind. The Highlands be open ground, so the one who move first be the one who get seen, and Zengu don't get seen." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hunter = {
      lines = {
        { id = "hn_default", text = "Patience don't get taught, it get practiced. Sit on a rock from dawn to noon and don't move, and you be halfway there; the other half be not getting bored." },
      },
      choices = { { text = "I'll try it.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } } },
    },
    troll = {
      lines = {
        { id = "tr_default", text = "The same thing he need from Zengu: the sword, in our hands, so our fight in the jungle stop crawling and start running. Every Darkspear who help with this be helping Vol'jin himself." },
      },
      choices = {
        { text = "Then I'll help you.", next = "BACK", reply = "Good, mon, then the jungle fight start running soon. Zengu thank you.", fx = { affinity = 3, align = { order = 1 } } },
        { text = "I'll help, but for the Darkspear, not because Vol'jin says so.", next = "BACK", reply = "Ya, for the Darkspear, and that be the best reason of all, mon.", fx = { align = { order = -1 } } },
      },
    },
    nimboya = {
      lines = {
        { id = "ni_default", text = "Then you know he carry a heavy load for the chief, and this sword be going to him when we done. Tell him Zengu say the hunt go well, if you see him first." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } } },
    },
    xwarlock = {
      big = true,
      lines = { { id = "xwl_default", text = "Zengu hear that about some Darkspear, mon, and Zengu don't like it. The Gurubashi listen to voices too, and look where it got them, all bowing to a blood god in the jungle." },
        { id = "xwl_demon", when = { pet = { type = "Demon" } }, text = "Zengu hear that about some Darkspear, mon, and now Zengu see the thing that be whispering to them, standing right there at your heel. The Gurubashi listen to voices too, and look where it got them, so you keep that one quiet around Zengu." },
      },
      choices = {
        { text = "I listen to them, but I don't bow to them.", next = "BACK", reply = "Good, mon. Listen, but don't bow, and you be fine.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "You're right. I'll be careful with them.", next = "BACK", reply = "Ya, be careful, mon. Zengu hear plenty sweet voices in Zul'Gurub, and every one of dem had teeth behind it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What would Vol'jin say?", next = "xwarlock_voljin" },
      },
    },
    xwarlock_voljin = {
      lines = { { id = "xwv_default", text = "Vol'jin say a troll be judged by what he do with the gift, not where it come from. Zengu still be watching you, but Zengu watch everybody." } },
      choices = {
        { text = "Let Zengu watch, then. I've nothing to hide.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Zengu hear plenty, mon, sittin' quiet while the orcs shout. Ask, and I tell you what I know." },
    },
    yenniku = { { id = "tp_yenniku", text = "Yenniku be Nimboya's boy, taken by the Bloodscalp in the jungle, and that be bad business. Nimboya see to that, and Zengu see to this." } },
    echo_isles = { { id = "tp_isles", text = "The Echo Isles be home, and Zengu go back one day, mon, but first the sword, and then the rest." } },
    background = { { id = "tp_ba", text = "A Darkspear hunter, sent by the chief because I be patient, and stealing a sword out of a tomb take patience.", next = "why" } },
    advice = { { id = "tp_ad", text = "The Syndicate in Stromgarde wear masks, but their boots be loud. Listen for the boots, mon." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear stand with the Horde, and I am proud of it, mon, even this far from the Echo Isles. Vol'jin leads us well, and he don't forget a debt." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin is a clever leader, and he knows what it is to lose a home and build another. He sent me here for Trol'kalar, and Zengu don't go home without it." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "Zul'Gurub is the heart of the Gurubashi, and they have woken Hakkar again in there. The Zandalar are gathering to stop it, and I hope they move quickly." } },
    _none = { { id = "tp_none", text = "Zengu only know the hunt, and the sword." } },
  },
}

P:NPC {
  key = "adegwa", id = TODO_NPC("Innkeeper Adegwa"), name = "Innkeeper Adegwa",
  bible = "bibles/arathi.md", role = "innkeeper", tier = "service",
  communities = { "hammerfall" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "lock_shards" },

  impression = {
    first = "He offered me rest as though it were the most natural thing.",
    third = "{name} rested by Innkeeper Adegwa's fire, a tauren far from Mulgore who keeps the inn at Hammerfall.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You have come home to the fire, friend. The kodo hide is warm and waiting, as the plains wait for the spring rain." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You may rest here, for the Earth Mother turns no one away, but I will not sit with you tonight." },
    { id = "o_warchief_lesser", tags = { "news" }, when = { gossip = { topic = "warchief", stance = "lesser" } },
      text = "Gor'mul told the fire you said Thrall is no Doomhammer, and then he sat with the others for a whole evening. I've never seen him do that, so whatever you said, thank you." },
    { id = "o_peace_war", tags = { "news" }, when = { gossip = { topic = "peace", stance = "war" } },
      text = "The young ones at the fire are repeating what you told Drum Fel about the humans and their camps. They sing it louder each night, and I hum a little quieter." },
    { id = "g_inn", text = "Come, rest. Hammerfall is hard stone, but there is a soft kodo hide by my fire, and the Earth Mother does not ask who you are before she lets you sleep." },
    { id = "g_home", when = { homeInn = { "Hammerfall" } }, text = "Welcome back to Hammerfall, {class}. Your place by the fire is waiting, as the grass waits for the rain." },
    { id = "g_away", when = { away = 14 }, text = "Ah, you have come back to us after {away} away. Come and sit by the fire, for the stone did not grow any softer while you were gone, and the Earth Mother kept your place warm." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in Hammerfall has been smiling all day after speaking with you. That is as rare in this hard place as rain on the Barrens, so I thank you for it." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone here has turned sour toward you, after whatever you said. I take no sides at my fire, but perhaps you should sit with your back to the wall tonight, as a wary calf keeps close to the herd." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You carry the spirit healer's chill still, so sit close to the fire; it fades." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "The souls in your bag are crying, little one, faint as wind in dry grass, and I can hear them even over the fire. The Earth Mother would ask you to let them go when you can, though I know you will not." },
  },

  start = "hello",
  nodes = {
    dd_arms = {
      lines = { { id = "dd_arms_default", text = "Every night they come home whole, and some nights when they don't. My people sing for the hunt and for the rain, but the orcs sing for the ones who fought beside them, and I have come to think it is the same song in a different hide." } },
      choices = {
        { text = "A warrior's deeds should be sung. It keeps them honest.", next = "BACK", reply = "Then I hope they sing yours for a long time, and truly. Walk with the Earth Mother.", fx = { align = { honor = 1 } } },
        { text = "Songs are for the living. I fight for what it gets me.", next = "BACK", reply = "That is an honest answer, and a lonely one. The fire is here when you change your mind.", fx = { align = { honor = -1 } } },
        { text = "Something else, Adegwa.", next = "BACK" },
      },
    },

    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "My people give thanks to the Earth Mother for the sun on the grass, and I wonder sometimes whether your Light is only that same warmth by another name. I am an innkeeper, not an elder, so I keep a fire, and I do not mind what anyone calls it." } },
      choices = {
        { text = "Perhaps it is, Adegwa. Warmth is warmth, whether you're living or dead.", next = "BACK", reply = "Perhaps it is, and that thought brings me some peace. Even the Forsaken came out to stand in the sun at Hammerfall's gate this morning, and I did not chase them off.", fx = { align = { light = 1 } } },
        { text = "The Light is nothing like your Earth Mother's warmth. It burns.", next = "BACK", reply = "Then I am sorry for it, child. The Earth Mother's warmth never burns those who ask.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They come in angry and they leave tired, which I count as rest. The orcs here fight with a fury the Earth Mother would not recognise, and I think some of them no longer know how to stop." } },
      choices = {
        { text = "A warrior has to master his fury, or it masters him.", next = "BACK", reply = "That is the old wisdom, and you speak it well. I will tell it to the next young grunt who breaks a table in my common room.", fx = { align = { order = 1 } } },
        { text = "Fury is strength, and the Highlands need strength more than calm.", next = "BACK", reply = "Perhaps, for a while, but fury is a fire that eats the grass it stands on. I hope it serves you better than it served the orcs.", fx = { align = { order = -1 } } },
        { text = "Something else, Adegwa.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Few, for the Highlands are strange to us, all stone and wet wind instead of grass. I miss the plainstriders and the open sky, and I think the young hunters who come here miss them more, though they would never say so." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Few, for the Highlands are strange to us, all stone and wet wind instead of grass. Let {pet} lie by the fire, {class}, because it has walked as far as you have to get here." },
      },
      choices = {
        { text = "Hunt with respect, as the Earth Mother taught. Take only what you need.", next = "BACK", reply = "That is the Earth Mother's way, and you honour her by it. May the hunt be kind to you.", fx = { align = { light = 1 } } },
        { text = "The Earth Mother is a long way off. Here, we take what keeps us alive.", next = "BACK", reply = "She is never far, child, even under these hard stones. But I understand, and I will not judge you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The Witherbark, mostly, because their witch doctors chant from the hills at night and the grunts swear the chanting gives them nightmares. If you could quiet those voices, I'd sleep better, and so would every soldier in this fort." } },
      choices = {
        { text = "I'll face those witch doctors and drive them off.", next = "BACK", reply = "Then go with my blessing, and come back to rest. The grunts will sleep easier for it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll turn their own curses back on them, quietly.", next = "BACK", reply = "Quietly, then, and the grunts will never know what saved them. Come to me after, and I will burn sage over you before you sleep.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Angry and grieving both, I think, because men have fought over these hills longer than any tauren can remember. The grunts say elementals walk inside the old stone circles out in the Highlands, so I leave a cup of water by the door at night, in case the gentler spirits come calling." } },
      choices = {
        { text = "I'll soothe them where I can, as the Earth Mother would ask.", next = "BACK", reply = "Then you walk the Earth Mother's road, and these hills will thank you in time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grieving spirits make dangerous neighbours. I'll put them down if I must.", next = "BACK", reply = "If you must, then do it gently, as one would put down a wounded kodo. They were once like us.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Every morning, when I wake to stone and orc voices instead of wind in the grass. But the Earth Mother is under these hills too, and somebody must keep a fire burning for the warriors who walk them." } },
      choices = {
        { text = "Our people belong wherever the Horde needs them.", next = "BACK", reply = "Then I will try to belong here too, for a while. Thank you, child.", fx = { align = { order = 1 } } },
        { text = "A tauren belongs on the open plains, not inside a fort.", next = "BACK", reply = "You speak my heart, but the Horde needs us here. When the war is done, I will go home to the grass.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, walking the Earth Mother's paths so far from home! The spirits of the Highlands are sour and stony, but sit by my fire, and perhaps they'll warm to you as they've slowly warmed to me." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" },
          text = "One of the Earth Mother's druids, and a tauren besides! Sit by my fire and tell me whether the grass still grows tall in Mulgore." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, and welcome at my fire. The grunts bring me their bruises and their bad dreams, and I'd be glad of someone who can mend more than I can with tea." },
        { id = "h_default", key = true,
          text = "I am Innkeeper Adegwa, a tauren among orcs, far from Mulgore's grass. Every fort needs a fire, and this one is mine." },
        { id = "h_grass", when = { metBefore = true }, text = "I keep a little pot of Mulgore grass by the door, and it doesn't like the Highlands, but neither did I, at first. We're both getting used to it." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The grunts sing old war songs after dark, and I don't know the words, so I hum, and they let me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "There is a cold in you that the hearth cannot reach, {class}. Sit closer anyway, and I will not ask what follows you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "Your hands hum like a summer storm over Mulgore, {class}. Please do not light my hearth with them, for I lit it myself, and it remembers my hand." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Sit by the fire, {class}, and keep your back to the wall if it helps you rest. I have known many who could not sleep any other way." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Sit, and set that weapon down, for there is no foe in this room, and the fire will mend what the Witherbark have bruised." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The wild has followed you in, I see, and it is as welcome at my fire as you are." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "One of the Forsaken, and the Light shines in you like the sun on Mulgore's grass. The Earth Mother keeps her own counsel about the dead, but I think she would not mind a light kept burning." },
        { id = "h_dd_arms", tags = { "news" }, when = { questDone = TODO_QUEST("Call to Arms") },
          text = "Drum Fel's grunts came in from the Witherbark hills singing your name, or something close to it, since orcs sing the way kodo walk. Sit, and rest a while, for the hills will still be there tomorrow." },
        { id = "h_dd_threat", when = { questDone = TODO_QUEST("The Real Threat") },
          text = "Korin Fel has been easier in his spirit since you came back from Northfold. He reads his bones every evening by my fire, and lately they have not made him frown." },
      },
      again = { { id = "h_again", text = "Something else? The fire's in no hurry, and neither am I." } },
      choices = {
        { text = "You must miss Mulgore, Adegwa.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Are the spirits of the Highlands angry, Adegwa?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What troubles Hammerfall that magic might mend, Adegwa?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "A tauren must stand out among all these orcs.", next = "among" },
        { text = "What do the grunts sing about?", next = "songs" },
        { text = "We're a long way from Mulgore, you and I.", next = "home", when = { race = "Tauren" } },
        { text = "Thunder Bluff sent me here, innkeeper.", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "Would the Earth Mother turn me away, innkeeper?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the tauren think well of the arcane?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'd guess few quiet travelers come through Hammerfall.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do many warriors find rest here, Adegwa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Tauren hunters rarely come this far from Mulgore.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the tauren see the Light as the Earth Mother's gift?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Just a rest, thank you.", next = "END" },
        { text = "Do the grunts often sing about the battles, Adegwa?", next = "dd_arms", when = { questDone = TODO_QUEST("Call to Arms") } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than the grunts notice, for a fort on the edge of the Highlands draws those who watch and those who are watched. I give them all the same bread and ask nothing, because a hearth that asks questions soon loses its guests." } },
      choices = {
        { text = "Asking a guest nothing is the kind thing to do.", next = "BACK", reply = "I think so too, and the Earth Mother would agree. Whoever comes to my fire wet and tired gets a bowl first, and the questions can wait for morning.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some guests ought to be questioned, innkeeper.", next = "BACK", reply = "Perhaps, but not by me. I keep the hearth, and let the warriors keep the questions.", fx = { align = { order = 1 } } },
        { text = "Something else, Adegwa.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some of the elders frown on it, for the Earth Mother gives freely and the arcane, they say, takes without asking. I keep my own counsel, since a fire is warm whether a shaman or a mage kindles it, and the cold does not care." } },
      choices = {
        { text = "Taking without asking worries me too.", next = "BACK", reply = "You are not alone in that, and I am glad. The Earth Mother gives; we should give back.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is there to be used. The elders are wrong.", next = "BACK", reply = "They may be, and they may not. I am only an innkeeper, child, but I have seen what happens to a fire that is fed and fed and never banked.", fx = { align = { light = -1 } } },
        { text = "Let's talk of something gentler.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Earth Mother turns no child away, but the things you bargain with have no mother, and they want to be fed. Take care what you feed them, {class}, for a hungry thing grows." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "The Earth Mother turns no child away, but the thing at your side has no mother, and I can feel it watching my fire as if it is hungry. Take care what you feed it, {class}, for a hungry thing grows, and I would not like it to grow in my inn." },
      },
      choices = {
        { text = "I feed it only what I choose. I'm careful.", next = "BACK", reply = "Then stay careful always, child. My uncle was careful with his kodo for twenty years, and it only took one bad morning.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let it grow. The hungrier it is, the harder it works for me.", next = "BACK", reply = "A hungry servant is a dangerous one, and you cannot feed it from my kitchen. I will pray to the Earth Mother for you.", fx = { align = { light = -1 } } },
        { text = "Something else, Adegwa.", next = "BACK" },
      },
    },
    among = {
      lines = {
        { id = "a_default", text = "Well enough. They're loud and they're proud and they eat like starving wolves, but they've never once let my fire go cold or my door go unguarded." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    songs = {
      lines = {
        { id = "s_default", text = "Doomhammer, mostly, and the night the camps were broken open. They sing it louder each time, as if the old warchief might hear them from wherever he's gone." },
      },
      choices = {
        { text = "Do you ever join in?", next = "songs_hum" },
        { text = "Something else.", next = "BACK" },
      },
    },
    songs_hum = {
      lines = {
        { id = "sh_default", text = "I hum, and they pretend not to notice, and between us we've made a song nobody would admit to. A tauren humming under an orc war chant would make all of Thunder Bluff laugh." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = {
        { id = "h2_default", text = "A long way, but the Earth Mother is under this stone too, if you listen for her. Sit with me a while and we'll both pretend the wind smells of grass." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    xskyborne = {
      lines = { { id = "xsk_default", text = "Then you are welcome twice, once for the Horde and once for the Bluff. I have not met your people before, so if my eyes linger, it is curiosity and nothing worse; sit by the fire, and the grunts will soon find someone else to look at." } },
      choices = {
        { text = "Winds be with you, innkeeper.", next = "BACK", fx = { affinity = 2 } },
        { text = "A tauren must stand out among all these orcs.", next = "among" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every traveller who warms himself at my fire leaves a story behind. Ask me, and I will share what the fire has heard." },
    },
    background = { { id = "tp_ba", text = "I came where the Horde needed a fire, and Hammerfall, with the wind off the highlands and the grunts coming in cold from the walls, needed one sooner than most. That is all there is to tell, and may the Earth Mother keep you as you go." } },
    advice = { { id = "tp_ad", text = "Eat before you climb to Stromgarde. Nobody fights well hungry, not even an orc, though they'll swear otherwise." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother walks beneath every land, even these hard stones of Arathi. I feel her here, faintly, and I think she is tired of so much fighting." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is the wisest of the tauren, and he gave us a home in Mulgore when we had none. I miss him, and I miss the grass of Mulgore more." } },
    thrall = { { id = "tp_thrall", text = "The Warchief helped my people reach Mulgore when the centaur would have killed us all. I serve his Horde gladly, even here, so far from home." } },
    centaur = { { id = "tp_centaur", text = "The centaur hunted my people across the plains for generations, and they are still there, in the Barrens and Desolace. I pray to the Earth Mother that they find peace, and that they find it far from us." } },
    _none = { { id = "tp_none", text = "Ask Drum Fel, for he knows the fort, and I know only the fire and the long grass of home." } },
  },
}
