-- Arathi Highlands: Refuge Pointe (Alliance) and Hammerfall (Horde). Voice: bibles/arathi.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "nials", id = TODO_NPC("Captain Nials"), name = "Captain Nials",
  bible = "bibles/arathi.md", role = "soldier", tier = "major",
  communities = { "refuge_pointe" }, temper = { "firm" }, values = { "dutiful", "proud" },
  prejudice = { class = "ROGUE", amount = 10, why = "Syndicate cutthroats in the same leathers keep killing his lookouts." },
  notices = { "kit", "race" },

  impression = {
    first = "Captain Nials told me to make it quick, and meant it. What's left of Stromgarde is mostly tents now, and she carries that like a sword he refuses to put down.",
    third = "{name} met Captain Nials at Refuge Pointe, an officer of Stromgarde fighting to win back the fallen kingdom.",
  },

  greetings = {
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
  },

  start = "hello",
  nodes = {
    prej = {
      lines = { { id = "prej_default", text = "Because the Syndicate wear the same dark leathers and the same soft boots, and they've cut the throats of three of my lookouts this season. I can't read a man's heart, so I read his boots." } },
      choices = {
        { text = "Judge me by what I do, Captain, not by my boots.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You're right to be wary. I'd watch me too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Put a sentry on me, then. I've nothing to hide.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "Who are the Syndicate, exactly?", next = "prej_why" },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "Alterac's nobles, or what's left of them, carrying Lord Perenolde's debts and a crowd of hired knives. They sold the Horde passage through their mountains in the war, and now they sell whatever they can steal out of Arathi." } },
      choices = {
        { text = "Thieves or nobles, they answer to the law.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The law failed Alterac first. That's how thieves get made.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Alterac betrayed everyone. Its nobles deserve the rope.", next = "opn_alterac_r_hate", fx = { affinity = 1, align = { light = -1 }, opinion = { alterac = "hate" } } },
        { text = "The farmers never chose treason. Punish the lords, not them.", next = "opn_alterac_r_pity", fx = { align = { light = 1 }, trait = { kind = 1 }, opinion = { alterac = "pity" } } },
        { text = "Alterac is dead. The Syndicate is just thieves now.", next = "opn_alterac_r_dead", fx = { trait = { practical = 1 }, opinion = { alterac = "dead", stromgarde = "retake" } } },
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
        { text = "You're right. The people first, and the towers after.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Retake the towers and raise the banner. The people will follow.", next = "BACK", fx = { align = { order = 1 } } },
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
        { text = "Then I'll fight under your command, Captain.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight, but the spirits come before your orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They were here before Arathor raised a single stone, and they've never forgiven us for building on their land. My soldiers call them savages, but savages don't hold a hill for three thousand years." } },
      choices = {
        { text = "Then Stromgarde's claim must be enforced with steel.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Perhaps the trolls have the older claim, Captain.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "A full company, and on my doorstep at that! Refuge Pointe holds because the Forsaken and the Boulderfist can't agree which of them wants it more, and five more blades on the wall changes that sum nicely." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. I've heard Ironforge's priests speak of the earth as the Titans' handiwork, {class}, not as a voice, so I'll judge what you bring to the field and leave the theology to others." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid of the Kaldorei, here in the Highlands? Stromgarde could use anyone who knows wild country, because the Witherbark know these hills far better than my soldiers do." },
        { id = "h_default", key = true,
          text = "Captain Nials. Stromgarde's keep fell in the Third War, and these tents are most of what our kingdom still holds. We're here to win the rest back." },
        { id = "h_badges", tags = { "news" }, when = { questActive = TODO_QUEST("Stromgarde Badges") },
          text = "The Syndicate's assassins took the badges off our dead, so bring them back; their families deserve that much." },
        { id = "h_plea", when = { questActive = TODO_QUEST("Plea To The Alliance") },
          text = "Take our plea to the Alliance. Tell them Stromgarde still stands, in tents if not in stone." },
        { id = "h_northfold", when = { questActive = TODO_QUEST("Northfold Manor") },
          text = "Northfold Manor's crawling with Syndicate, so clear it out; every house they hold is one more we have to win back." },
        { id = "h_badges_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Stromgarde Badges"), days = 3 } },
          text = "The badges went out with the last rider south, and some families will open a letter this month and finally know. So thank you, and I don't say that often." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in Stromgarde's camp, {class}. I've lost too many soldiers this year to turn away anyone who'll fight, but I'll have someone watching you." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Syndicate", min = 30 } }, text = "The Syndicate have pulled back from the roads, and my scouts found their camps half empty. Stromgarde's dead are a little better avenged tonight, and I have you to thank for it." },
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
        { text = "I'll fight for Stromgarde.", next = "END", fx = { affinity = 2, align = { honor = 1 }, standing = { refuge_pointe = 1 } } },
        { text = "The Syndicate wouldn't see me coming, Captain.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I can scout the Highlands for you.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Arathor's first mages learned their craft in these hills.", next = "xmage", when = { class = "MAGE" } },
        { text = "Your sentries follow me everywhere, Captain. Why?", next = "prej", when = { prejudiced = true } },
        { text = "I fought for Stromgarde once, Captain, until the pay stopped.", next = "xorig_sellsword", when = { origin = "human_stromgarde_sellsword" } },
        { text = "I'll help where it pays, Captain, and Stromgarde's coin is as good as any.", next = "END", fx = { align = { honor = -1 } } },
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
      lines = { { id = "xlock_default", text = "Because Stromgarde was built by the men who stood beside the elves against the Amani, and I'll not see its banner carried on demon fire. Fight the Syndicate with whatever you must, but keep the fel out of my soldiers' sight." } },
      choices = {
        { text = "Then I'll keep it out of sight, as you ask.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pride won't win back Stromgarde, Captain. Power will.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Stromgarde comes first. I'd have kept them here too.", next = "BACK", fx = { align = { order = -1 } } },
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
      lines = { { id = "ka_default", text = "This one, small, stubborn and still here, and whoever walks in off the road willing to help. Today, that's you." } },
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
        { text = "Then they'll answer for it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner rob the robbers than wait on a court to do it.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Leaving each other be suits me well enough.", next = "BACK", fx = { align = { order = -1 }, opinion = { peace = "for" } } },
        { text = "They should be driven out.", next = "BACK", fx = { align = { order = 1 }, opinion = { peace = "against" } } },
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
        { text = "Every one.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, standing = { refuge_pointe = 2 } } },
        { text = "The dead are past blessing, Captain. Words are for the living.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Then I'll take them back their way: knives in the dark.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll get the badges, and I'll do it cleanly.", next = "BACK", fx = { affinity = 2, align = { honor = 1 }, standing = { refuge_pointe = 1 } } },
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

  topics = {
    knows = {
      { id = "tp_knows", text = "My scouts report everything they see in the highlands, and I listen to all of it. Ask, and keep it short." },
    },
    background = { { id = "tp_ba", text = "I'm a soldier of Stromgarde and captain of what's left of it, and that's the whole of my story until the keep is ours again.", next = "keep" } },
    advice = { { id = "tp_ad", text = "Never sleep in the open in the highlands. Ogres, trolls or Syndicate: one of them is always awake." } },
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
  notices = { "race", "kit" },

  impression = {
    first = "Drum Fel speaks of Hammerfall as though its prosperous days have already begun. He sees the ogres and Witherbark as obstacles on a road he's certain of.",
    third = "{name} met Drum Fel, who leads Hammerfall and means to clear the highlands of ogres and trolls.",
  },

  greetings = {
    { id = "g_fort", text = "You're in Hammerfall, {class}, built where the humans once kept us in chains, and here we fight now and soon we'll prosper. Which are you here for?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, good, because the hills won't clear themselves, and your axe has honor in it." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}, and Hammerfall kept fighting without you. Now you're back, so fight with us." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You're stronger than when you last stood here, I can see it in your stance. The hills will notice it too." },
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
        { text = "Peace lets our children grow up free. Thrall is right.", next = "opn_peace_r_peace", fx = { align = { honor = 1 }, opinion = { peace = "peace", warchief = "trust" } } },
        { text = "The humans built the camps. There's no peace with that.", next = "opn_peace_r_war", fx = { affinity = 1, align = { honor = -1 }, opinion = { peace = "war" } } },
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
        { id = "opn_peace_r_war", text = "Say that louder at the fire and you'll have friends for life, and Korin will glare at you across it. I won't argue, though I'll follow the Warchief." },
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
        { text = "I'll prove myself in Hammerfall's fights.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them glare. I don't need their trust.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To hold the walls while the rest of us build, for the Boulderfist come down from the hills every few nights and the Witherbark never sleep. When the walls are safe the traders will come, and when the traders come, Hammerfall will be what Doomhammer died for." } },
      choices = {
        { text = "I'll hold the wall. Hammerfall deserves to stand.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Walls are for traders. I came to crack ogre skulls.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Drum Fel.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, and the Highland striders too, for they kick over carts and scatter the pack beasts. When Hammerfall trades with the Undercity in earnest, I want those roads clear enough for a peon to walk them alone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks fierce enough to clear a road on its own. Feed it well, {class}, because it'll earn its keep here." },
      },
      choices = {
        { text = "I'll clear the roads, and take only what I need.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll clear them, and sell every hide I take.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Share? The Boulderfist share nothing but their clubs, and they took Stromgarde's ruins before the humans had finished mourning them. When they are gone, the land will have room to breathe, and so will Hammerfall." } },
      choices = {
        { text = "Then we break them in open battle.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the ogres and the humans bleed each other first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "On the wall, when the ogres come, and in the yard after, when the young ones come back from the Witherbark with poisoned cuts. Tor'gan does what he can with the spirits, but he's one troll and he has Gor'mul to look after, and I won't lose a warrior because the shaman was busy with a ghost." } },
      choices = {
        { text = "Then I'll stand on the wall with your warriors.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Gor'mul's a lost cause. Tor'gan should tend the living.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, chieftain.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
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
          text = "There's blood on your gear and sweat on your brow, and that's how I like my soldiers to come home. Rest, then go again." },
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
        { text = "Where do their leaders hide?", next = "stromgarde" },
        { text = "Hammerfall seems more camp than stronghold.", next = "future" },
        { text = "Lok'tar, chieftain. I came to fight.", next = "orc", when = { race = "Orc" } },
        { text = "The Witherbark are trolls. Do you trust me?", next = "troll", when = { race = "Troll" } },
        { text = "Korin worries for you, Drum Fel.", next = "korin", when = { questDone = TODO_QUEST("The Real Threat") } },
        { text = "The elements are with Hammerfall, chieftain.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I wield fel magic. Does that trouble you?", next = "xwarlock", when = { class = "WARLOCK" } },
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
        { text = "Somebody has to count spears. I don't mind the mud.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather face them openly, Drum Fel.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, Drum Fel.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ogres fear little and understand less, but their ogre-mages know enough to be dangerous, and they hide behind the brutes. Burn the mages first and the rest will stand around wondering who to follow, which is how ogres spend most of their lives." } },
      choices = {
        { text = "Burning their mages from cover is the smart way.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll meet their champions face to face, not hide.", next = "BACK", fx = { align = { honor = 1 } } },
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
        { text = "Lok'tar ogar.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Doomhammer's way got him killed. I'd rather live to fight again.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { id = "sh_default", text = "A prince with a handful of soldiers holds a corner of it, and the Syndicate thieves crawl through the rest. Zengu has business with that prince, so ask him, but my quarrel is with the ogres." },
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
        text = "It troubles me more than any ogre, and I'll tell you why: I've seen the Burning Blade, and I remember what that magic did to our people. Thrall allows your kind in the Horde, so I allow you in Hammerfall, but I'll be watching where you point it." } },
      choices = {
        { text = "Watch, then. It points at the Horde's enemies.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Power is power. Hammerfall needs mine.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    xforsaken = {
      lines = { { id = "xfo_default", text = "Does she? Then you can carry mine back: Hammerfall holds, and it holds without Undercity's apothecaries. Fight the Boulderfist beside my grunts and we'll get along well enough." } },
      choices = {
        { text = "I'll fight. Nothing more.", next = "BACK", fx = { affinity = 1 } },
        { text = "Who's attacking you?", next = "enemies" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Hammerfall's scouts range far, and they tell me what they find. Ask, and I'll tell you what serves the Horde." },
    },
    burning_blade = { { id = "tp_blade", text = "Not here, they're not; Doomhammer would have broken their necks himself." } },
    background = { { id = "tp_ba", text = "I beat an ogre called Or'Kalar once, years ago, and I've been fighting his kind ever since. That's the only story an orc in Hammerfall needs." } },
    advice = { { id = "tp_ad", text = "The Witherbark fight from the trees, so look up before you look ahead. The Boulderfist fight from the front, so look up anyway." } },
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
  notices = { "class", "race" },

  impression = {
    first = "Zengu is patient the way a good hunter is patient, and he finds it very funny that a human-made troll-killing sword might be turned on the Gurubashi. I rather agree.",
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
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It be the best joke of all, mon, because the humans called on the Light against the Amani and called us beasts. Now it fight on our side, and the spirits must be laughin' themselves sick." } },
      choices = {
        { text = "The Light was never theirs to own. It serves the just.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's a weapon, Zengu, and now it's ours.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Trol'kalar was made to kill trolls, and Vol'jin say we turn it on the Gurubashi, who be worse than any human. I think there be justice in that, even if the sword don't care which troll it cut." } },
      choices = {
        { text = "Justice is justice. Use the sword against the Gurubashi.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A weapon made for slaughter should be broken.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, mon.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Zengu trust you to carry it back here and nothin' more, mon. That blade been killin' trolls since the days of Arathor, and Zengu want to see it turned on the Gurubashi, which be the best joke in the whole Highlands." } },
      choices = {
        { text = "I'll fight Stromgarde's guards openly for it, not creep in.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Steal it, turn it, whatever works. It's a good joke.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Zengu.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The humans lock it with the sigil, and that be magic of a sort, mon, old Arathor magic. The witch doctors say a tomb like that got a chill on it too, the kind a dead king leave behind when he still be angry, so walk soft in there." } },
      choices = {
        { text = "Respect the dead king. Take the sword and nothing else.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A dead human king can stay angry. I'll take what I like.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The spirits don't care much who made the sword, mon, they care who swing it. Trol'kalar been sleepin' in Trollbane's tomb a long time, dreamin' of troll blood, so maybe we ask the ancestors to cool its temper before Vol'jin pick it up." } },
      choices = {
        { text = "Cleanse it first. A cursed blade shames whoever wields it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let it stay angry. The Gurubashi earned every drop.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
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
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid, mon. The loa of the wild must like you, 'cause you walk like one of their own." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Ha, a dead paladin, mon! The humans' Light, in the hands of the Forsaken, and me here fetchin' a troll-killin' sword to use on the Gurubashi, so this be a very good week for jokes." },
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
        { text = "Ha. Let's get it.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a sword made to kill trolls know where a troll keep his heart, and the Gurubashi got plenty of hearts. Takin' it from Stromgarde be easy enough, mon, but keepin' Trol'kalar from turnin' on the hand that hold it." } },
      choices = {
        { text = "Using the enemy's own weapon is clever. I like it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Stolen blades bring bad luck. Forge your own.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, mon.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Darkspear trust whoever Vol'jin trust, and Vol'jin trust the Warchief, so here we be. Some of the young ones at Sen'jin learnin' fire now, and the old ones grumble, but the old ones always grumble." } },
      choices = {
        { text = "Old ways should make room for new ones.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The old ones grumble for a reason. Listen to them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },

    joke = {
      lines = { { id = "j_default", text = "Every blade cut whoever be in front of it, mon, and the humans forgot that, but Zengu didn't." } },
      choices = {
        { text = "Who made the sword?", next = "joke_history" },
        { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
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
        { id = "st_default", text = "Galen break the sigil of Thoradin into eleven bits and hand them to his defenders, clever boy. Bring the bits to Tor'gan, our shaman here, and he put it back together while you look away." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sigils_galen = {
      lines = {
        { id = "sg_default", text = "He sit in a chapel deep in the militia's part of the keep, well guarded, and he be no slouch with a blade. The line of Trollbane hunt my people for ages, mon, so Zengu don't weep for it." },
      },
      choices = {
        { text = "That's cold.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "After what Trollbane's line did to your people, I wouldn't weep either.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Then I'll help.", next = "BACK", fx = { affinity = 3, align = { order = 1 } } },
        { text = "I'll help, but for the Darkspear, not because Vol'jin says so.", next = "BACK", fx = { align = { order = -1 } } },
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
      lines = { { id = "xwl_default", text = "Zengu hear that about some Darkspear, mon, and Zengu don't like it. The Gurubashi listen to voices too, and look where it got them, all bowing to a blood god in the jungle." } },
      choices = {
        { text = "I listen, but I don't bow.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "You're right. I'll be careful with them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
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
    yenniku = { { id = "tp_yenniku", text = "The chief's boy, and bad business in the jungle. Nimboya see to that, and I see to this." } },
    echo_isles = { { id = "tp_isles", text = "One day, mon, but first the sword, then the rest." } },
    background = { { id = "tp_ba", text = "A Darkspear hunter, sent by the chief because I be patient, and stealing a sword out of a tomb take patience.", next = "why" } },
    advice = { { id = "tp_ad", text = "The Syndicate in Stromgarde wear masks, but their boots be loud. Listen for the boots, mon." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear stand with the Horde, and I am proud of it, mon, even this far from the Echo Isles. Vol'jin leads us well, and he don't forget a debt." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin is a clever leader, and he knows what it is to lose a home and build another. He sent me to watch the Witherbark here, and I watch them well." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "Zul'Gurub is the heart of the Gurubashi, and they have woken Hakkar again in there. The Zandalar are gathering to stop it, and I hope they move quickly." } },
    _none = { { id = "tp_none", text = "Zengu only know the hunt, and the sword." } },
  },
}

P:NPC {
  key = "adegwa", id = TODO_NPC("Innkeeper Adegwa"), name = "Innkeeper Adegwa",
  bible = "bibles/arathi.md", role = "innkeeper", tier = "service",
  communities = { "hammerfall" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary" },

  impression = {
    first = "Innkeeper Adegwa keeps the one soft place in Hammerfall's hard stone. A tauren far from Mulgore, he offered me rest as though it was the most natural thing in the world.",
    third = "{name} rested by Innkeeper Adegwa's fire, a tauren far from Mulgore who keeps the inn at Hammerfall.",
  },

  greetings = {
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
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "My people give thanks to the Earth Mother for the sun on the grass, and I wonder sometimes whether your Light is only that same warmth by another name. I am an innkeeper, not an elder, so I keep a fire, and I do not mind what anyone calls it." } },
      choices = {
        { text = "Perhaps it is, Adegwa. Warmth is warmth, for living or dead.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light is nothing like your Earth Mother's warmth. It burns.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They come in angry and they leave tired, which I count as rest. The orcs here fight with a fury the Earth Mother would not recognise, and I think some of them no longer know how to stop." } },
      choices = {
        { text = "A warrior must master his fury, or it masters him.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fury is strength. The Highlands need it more than calm.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Adegwa.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Few, for the Highlands are strange to us, all stone and wet wind instead of grass. I miss the plainstriders and the open sky, and I think the young hunters who come here miss them more, though they would never say so." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Let {pet} lie by the fire, {class}. The Earth Mother made it as she made us, and it has walked as far as you have to get here." },
      },
      choices = {
        { text = "Hunt with respect, as the Earth Mother taught. Take only what you need.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Earth Mother is far away. Here, we take what keeps us alive.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The Witherbark, mostly, because their witch doctors chant from the hills at night and the grunts swear the chanting gives them nightmares. If you could quiet those voices, I'd sleep better, and so would every soldier in this fort." } },
      choices = {
        { text = "I'll face those witch doctors and drive them off.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll turn their own curses back on them, quietly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Angry and grieving both, I think, because men have fought over these hills longer than any tauren can remember. The grunts say elementals walk inside the old stone circles out in the Highlands, so I leave a cup of water by the door at night, in case the gentler spirits come calling." } },
      choices = {
        { text = "I'll soothe them where I can, as the Earth Mother would ask.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grieving spirits make dangerous neighbors. I'll put them down if I must.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Every morning, when I wake to stone and orc voices instead of wind in the grass. But the Earth Mother is under these hills too, and somebody must keep a fire burning for the warriors who walk them." } },
      choices = {
        { text = "Our people belong wherever the Horde needs them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A tauren belongs on the open plains, not in a fort.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, walking the Earth Mother's paths so far from home! The spirits of the Highlands are sour and stony, but sit by my fire, and perhaps they'll warm to you as they've slowly warmed to me." },
        { id = "h_druidcl", when = { class = "DRUID" },
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
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than the grunts notice, for a fort on the edge of the Highlands draws those who watch and those who are watched. I give them all the same bread and ask nothing, because a hearth that asks questions soon loses its guests." } },
      choices = {
        { text = "Asking nothing is the kind thing to do.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some guests ought to be questioned, innkeeper.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Adegwa.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some of the elders frown on it, for the Earth Mother gives freely and the arcane, they say, takes without asking. I keep my own counsel, since a fire is warm whether a shaman or a mage kindles it, and the cold does not care." } },
      choices = {
        { text = "Taking without asking worries me too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is there to be used. The elders are wrong.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of something gentler.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Earth Mother turns no child away, but the things you bargain with have no mother, and they want to be fed. Take care what you feed them, {class}, for a hungry thing grows." } },
      choices = {
        { text = "I feed it only what I choose. I'm careful.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let it grow. A strong demon serves me better.", next = "BACK", fx = { align = { light = -1 } } },
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
