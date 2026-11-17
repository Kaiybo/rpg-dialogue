-- Stormwind, part four: the general at the gate, the goblin at SI:7, the captain in the
-- throne room, and the baker who never stops walking. Voice: bibles/city4.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marcus", id = TODO_NPC("General Marcus Jonathan"), name = "General Marcus Jonathan",
  bible = "bibles/city4.md", role = "soldier", tier = "major",
  communities = { "stormwind" }, temper = { "steady" }, values = { "dutiful", "courteous" },
  notices = { "soldier", "kit" },
  impression = {
    first = "General Marcus Jonathan keeps Stormwind's walls with whatever the Keep will spare him, and it plainly isn't enough. He reads every letter from the provinces twice and answers fewer than he'd like.",
    third = "{name} met General Marcus Jonathan, High Commander of Stormwind's defence, who watches over the Valley of Heroes.",
  },

  greetings = {
    { id = "g_gate", text = "Well met. The Valley of Heroes is open to all who come in peace. Keep your blade sheathed and you'll find us friendly." },
    { id = "g_back", when = { metBefore = true }, text = "Good, you've come back. I like faces that come back." },
    { id = "g_away", when = { away = 14 }, text = "Welcome back to the Valley of Heroes. You've been gone {away}, and the roads have been hard on good folk, so I'm glad to see you whole." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come a long way since you last stood at my gate, and it shows in how you carry your blade. Stormwind could use a hundred more like you." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The watch tells me you've been doing good work for the city's folk. That's the sort of thing I like to find in my reports." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "I've heard you've been leaning hard on folk in the city. Keep your blade sheathed inside these walls, as I asked you the first time." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You stand like a soldier. Stormwind's army could use you, if you ever tire of the road. We all tire of it eventually." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been in a real fight, so get to the smiths in the Dwarven District before you go back out. That's an order, though a friendly one." },
  },

  start = "hello",
  nodes = {
    xpt_marcus = {
      big = true,
      lines = { { id = "xpt_marcus_default", text = "Because the levies we raise now are farmers' sons who've never held a line, and too many of our veterans are buried in Lordaeron or guarding the roads to Lakeshire. A pair who already know how to fight together would teach a company more in a week than my sergeants manage in a season." } },
      choices = {
        { text = "Then perhaps we owe the kingdom a season of service.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We do more good on the road than drilling farm boys.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_brd = {
      big = true,
      lines = { { id = "xcl_brd_default", text = "Then you've been where the Dark Irons have hidden since the Second War, when they threw in with the Horde and made Ironforge pay for it. They held Reginald Windsor in that mountain too, an old comrade of mine, and I'll not pretend to mourn the man who kept him there." } },
      choices = {
        { text = "A soldier doesn't gloat over a dead enemy, General.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "He made war on us. I'm glad he's dead, and I'll say so.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "The Dark Irons may trouble Stormwind next.", next = "xcl_brd2" },
      },
    },
    xcl_brd2 = {
      lines = { { id = "xcl_brd2_default", text = "Less than they'll trouble Ironforge, I'd wager, because their quarrel was always with Magni's people first. Still, a city of angry dwarves under a mountain full of fire doesn't go quiet because its emperor dies, so I'll keep a watch on the Redridge road." } },
      choices = {
        { text = "Keep them watched, General. I'll go back if I'm needed.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The army has a place for anyone who'll stand on a wall and face the enemy, and I've seen warlocks hold a line at Lakeshire when the regulars broke. But I've also buried men who trusted a summoned thing to watch their backs, and I'll not have one near my gates." },
      },
      choices = {
        { text = "Then I'll serve where you put me, General.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your walls need what I bring, General, gates or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Gladly, if the Keep ever lets the army march anywhere, because a healer who can take a wolf's shape and run would be worth a squad. I've read the reports from Ashenvale, and I'd trust your people on a flank." } },
      choices = {
        { text = "Send for us, General, and we'll come.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My people fight for Ashenvale first, General, not for Stormwind's wars.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I trust Shaw to do his work and my soldiers to do theirs, but I'd rather the two didn't meet in a dark street. An army needs to know who's standing beside it, and SI:7 never tells anyone." } },
      choices = {
        { text = "Then SI:7 should sign the book like everyone else.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "SI:7 works best when nobody knows it's there, General.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the Mage Quarter answers to its own masters as much as to the crown, and half of them still look to Dalaran before they look to us. I don't blame them for it, but I can't hold a wall with men who are waiting for a letter." } },
      choices = {
        { text = "A mage of Stormwind should serve Stormwind first, General.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A mage serves knowledge first, General, not any crown.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Out in the provinces, frankly, where the army can't go because I'm ordered to keep it here. Lakeshire, Westfall and Duskwood are all crying for help, and every paladin who answers them is one less letter I have to write saying no." } },
      choices = {
        { text = "Then I'll go where the army can't. The provinces won't stand alone.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The city comes first, General. The provinces must hold themselves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_marcus", tags = { "news" }, when = { party = { class = "WARRIOR" } },
          text = "{companion} has the look of a soldier, and you've the look of someone who keeps soldiers alive. If you ever tire of wandering, the Stormwind army would take the pair of you and be glad of it." },
        { id = "h_cl_brd", tags = { "news" }, when = { cleared = "Blackrock Depths", faction = "Alliance" },
          text = "Word came up from the Burning Steppes that Thaurissan is dead in his own throne room, and that you were standing in it. I marched under Turalyon to the foot of that mountain once, and none of us ever went down into it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I could use a dozen of you on the walls, and the Keep sends me letters about the budget instead." },
        { id = "h_default", key = true,
          text = "General Marcus Jonathan, High Commander of Stormwind's defence. I keep the city's walls and its army, such as the kingdom can spare of it, and Lakeshire's letters remind me daily how little that is." },
        { id = "h_messenger", tags = { "news" }, when = { questActive = TODO_QUEST("Messenger to Stormwind") },
          text = "Magistrate Solomon writes again, asking reinforcements for Lakeshire. I'll take it to the throne myself, and you can tell him the army hasn't forgotten Redridge." },
        { id = "h_messenger_done", when = { questDone = TODO_QUEST("Messenger to Stormwind") },
          text = "I promised Solomon support, and I meant it. Whether the Keep lets me send it is another matter. Between us." },
        { id = "h_solomon", when = { heardLine = "solomon.s_default" },
          text = "Solomon's letters reach me, every one, and I read them twice. I can't answer them the way he'd like, and that sits badly with me." },
        { id = "h_insignia", tags = { "news" }, when = { questActive = TODO_QUEST("Bloodied Insignia") },
          text = "Lordaeron insignia, from those ruins in the north? Set them down here, carefully. Many who fled that kingdom came to us, and some of their kin will want these back." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "My guards stand in the rain all night, and a blessing does more for them than another cloak. I'm glad you came by the gate." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The statues look taller at night. I walk the valley before the watch changes and say good evening to each of them, though they never answer." },
        { id = "h_guard", when = { origin = "human_city_guard" },
          text = "One of the Watch's own, come back up the valley with a warrior's kit. I remember the recruits who leave for the provinces; you were right to go, and I'm sorry we couldn't keep you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "SI:7's people come through my gate at odd hours and never sign the book, and I've given up asking them to. Are you one of theirs, or only shy?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at the Valley gate. The army could use more of you, if the Quarter could spare any, because fire wins sieges." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the Valley gate. The kaldorei are new to this Alliance and my soldiers stare, I'll admit, but they'll learn their manners." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. The army has had dealings with your sort, and I'd prefer they stayed few, but I'll hear you out." },
      },
      again = {
        { id = "h_again", text = "Something else, citizen? Ask away; it's a quiet watch." },
        { id = "h_again2", text = "Go on. The gate can spare me a moment more." },
      },
      choices = {
        { text = "The army doesn't seem to be helping Lakeshire.", next = "army" },
        { text = "Tell me about the statues.", next = "statues" },
        { text = "A city this size must be hard to defend.", next = "walls" },
        { text = "There's a fisherman down by the water.", next = "jorgen" },
        { text = "What becomes of the Lordaeron insignia?", next = "insignia",
          when = { any = { { questActive = TODO_QUEST("Bloodied Insignia") }, { questDone = TODO_QUEST("Bloodied Insignia") }, { origin = "human_lordaeron_refugee" } } } },
        { text = "Shall I bless your guards?", next = "priest", when = { class = "PRIEST" } },
        { text = "Reporting for duty, General.", next = "duty", when = { class = "WARRIOR" } },
        { text = "Do you need scouts in the hills, General?", next = "scouts", when = { class = "HUNTER" } },
        { text = "Ironforge's soldiers would come if you asked, General.", next = "dwarves", when = { race = "Dwarf" } },
        { text = "The Sentinels hold Ashenvale with fewer than you have.", next = "sentinels", when = { race = "NightElf" } },
        { text = "Ironforge's shamans could help guard your walls, General.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Do you trust SI:7, General?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why doesn't the army have more mages, General?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Where would a paladin serve Stormwind best, General?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would the army ever march beside druids, General?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Has the army any place for warlocks, General?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Emperor Thaurissan is dead, General. I went down into the Depths.", next = "xcl_brd", when = { cleared = "Blackrock Depths", faction = "Alliance" } },
        { text = "Why does the army want people like us, General?", next = "xpt_marcus", when = { party = { class = "WARRIOR" } } },
        { text = "Good day, General.", next = "END", fx = { affinity = 1 } },
      },
    },

    army = {
      big = true,
      lines = {
        { id = "a_default", text = "It will, when the orders come. I've asked and I keep asking, but the Regent has many voices in his ear, and not all of them speak for the soldiers." },
      },
      choices = {
        { text = "Whose voices?", next = "voices", fx = { trait = { curious = 1 } } },
        { text = "What did you write to Solomon?", next = "army_letter", when = { any = { { questActive = TODO_QUEST("Messenger to Stormwind") }, { questDone = TODO_QUEST("Messenger to Stormwind") }, { heardLine = "solomon.s_default" } } } },
        { text = "Keep asking.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Stop asking and march without orders, General.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    voices = {
      lines = { { id = "v_default", text = "That's above a general's rank to say. I'll only say I salute the Regent, and I watch the court." } },
      choices = {
        { text = "Understood. Something else.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A general who only watches the court won't save Lakeshire.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    army_letter = {
      lines = { { id = "al_default", text = "That the army stands with Lakeshire and I'd carry his words to the throne. The rest I wrote in confidence. Don't break the seal on the road." } },
      choices = {
        { text = "I wouldn't.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I make no promises about seals, General.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    statues = {
      lines = { { id = "st_default", text = "The five who went through the Dark Portal to close it from the other side: Turalyon, Khadgar, Alleria, Danath and Kurdran. Presumed dead, the plaques say." } },
      choices = {
        { text = "Did you know any of them?", next = "turalyon" },
        { text = "Kurdran was a Wildhammer. My kin, near enough.", next = "kurdran", when = { race = "Dwarf" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    turalyon = {
      big = true,
      lines = { { id = "tu_default", text = "I served under Turalyon in the Second War, beside Reginald Windsor, and he was a paladin who could plan a campaign. I salute his statue every morning, and he'd have hated that." } },
      choices = {
        { text = "And Windsor?", next = "windsor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    windsor = {
      lines = { { id = "wi_default", text = "A good soldier, and better than me with a map. I haven't had word of him in a long while, and in my trade, that's rarely good news." } },
      choices = { { text = "I hope you hear soon.", next = "BACK", fx = { affinity = 1 } } },
    },
    kurdran = {
      lines = { { id = "ku_default", text = "Near enough for a gryphon, maybe. Falstad Wildhammer wrote his epitaph. Read it; it says more in four lines than the court says in a season." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    walls = {
      lines = { { id = "wa_default", text = "With fewer men than I'd like. The City Guard keeps the streets, the army keeps the walls, and the court decides how many of either can be spared. Rarely enough." } },
      choices = {
        { text = "Westfall seems to have been forgotten.", next = "walls_westfall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    walls_westfall = {
      lines = { { id = "ww_default", text = "Stoutmantle holds it with farmers and a hill, and I'd be ashamed if I weren't so grateful. A soldier's matter, I say, though the court says otherwise.",
        fx = { learn = { "people_militia", "westfall" } } } },
      choices = {
        { text = "Then send soldiers.", next = "BACK", fx = { align = { honor = 1 }, opinion = { westfall = "send_soldiers" } } },
        { text = "The court has its reasons.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
      },
    },

    jorgen = {
      lines = { { id = "jo_default", text = "Jorgen. He fishes the moat and keeps his own counsel. The guards like him. I've never once seen him catch anything, and I've never once seen him mind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    insignia = {
      lines = { { id = "in_default", text = "When Lordaeron fell, its people ran here and its dead stayed. I give each insignia to whoever can name the soldier who wore it. Some days nobody can." } },
      choices = {
        { text = "My family's name might be on one.", next = "insignia_name", when = { origin = "human_lordaeron_refugee" } },
        { text = "Someone should remember every one of those names.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Those names are better left in the ground.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    insignia_name = {
      lines = { { id = "inn_default", text = "Then come back when you're ready, and we'll look together. I keep the list in my own hand. Nobody else reads it." } },
      choices = {
        { text = "Thank you, General.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } },
        { text = "I'm not sure I want to know, General.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "Walk the wall at dusk, when the watch changes, and say whatever priests say. They'll pretend not to listen, but they'll listen." } },
      choices = {
        { text = "I'll be there at dusk.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { stormwind = 1 } } },
        { text = "The watch has heard enough sermons, so I'll let them be.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    duty = {
      big = true,
      lines = {
        { id = "duty_l", text = "I've no regiment to put you in, soldier, and I'll not pretend otherwise. The army Lothar and Turalyon marched to Blackrock Spire is scattered across four provinces, and half of what's left is guarding nobles' warehouses." },
        { id = "duty_dwarf", when = { race = "Dwarf" },
          text = "A dwarf reporting to a Stormwind general, and I'll take it gladly, though I've no regiment to put you in. The army Lothar and Turalyon led is scattered across four provinces." },
      },
      choices = {
        { text = "Then what should a soldier do?", next = "duty_what" },
        { text = "Guarding warehouses is still duty, General.", next = "BACK", fx = { align = { order = 2 } } },
        { text = "Then I'll fight where I'm needed, not where I'm posted.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    duty_what = {
      lines = { { id = "duty_what_l", text = "What Lothar's soldiers did when the orders ran out: find the nearest people in trouble and stand in front of them. Redridge, if you want my advice; Lakeshire's watch can't hold that bridge alone." } },
      choices = { { text = "Something else, General.", next = "BACK", fx = { affinity = 1 } } },
    },
    scouts = {
      lines = { { id = "scouts_l", text = "I need them everywhere. The army never trained many; a human with a bow and a hound was a poacher, in my day, and now I'd pay one in gold to tell me what the Blackrock are doing in the Redridge hills." } },
      choices = {
        { text = "Times change, General.", next = "scouts_change" },
        { text = "I'll take a look at Redridge.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    scouts_change = {
      lines = { { id = "scouts_change_l", text = "They do, and an old soldier has to change with them or be left on the wall with the statues. Bring me what you see; I'll read it twice, like the letters." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      lines = { { id = "dwarves_l", text = "They would, and Magni has said so himself. But Ironforge has the Dark Irons at its back door and troggs in Gnomeregan, and I'll not ask a friend to bleed for our neglect when he's busy with his own." } },
      choices = {
        { text = "That's pride talking, General.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "That's how allies should treat each other.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Kurdran's statue stands in your valley. Did you know him?", next = "kurdran" },
      },
    },
    sentinels = {
      lines = { { id = "sentinels_l", text = "So I hear, and I hear they do it well. Your Sentinels are all volunteers and all soldiers, which is more than I can say of the Watch; I'd learn from them if Darnassus weren't so far." } },
      choices = {
        { text = "They'd teach you, if you asked.", next = "sentinels_ask" },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    sentinels_ask = {
      lines = { { id = "sentinels_ask_l", text = "Then perhaps I will. The Watch would grumble at taking lessons from elves, and that's precisely why they should." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = { { id = "shaman_l", text = "Shamans on Stormwind's walls. The men who fought the Horde would choke on their ale to hear it, and I'm one of them. Still, if Ironforge vouches for you, I'll judge you by how you stand a watch, not by what you call on." } },
      choices = {
        { text = "That's all I ask, General.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The spirits don't care what old soldiers think.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
  },

  topics = {
    valley_of_heroes = {
      { id = "tp_valley_of_heroes", text = "The Valley of Heroes is Stormwind's front door, and I've stood guard over it since the day the statues went up. Those heroes gave everything, and I'll not let anyone pass beneath them who means the city harm." },
      { id = "tp_valley_of_heroes2", when = { disposition = { min = 65 } }, text = "I knew some of the people those statues are carved for, and they weren't marble then, only tired soldiers. I walk the Valley at dawn to say good morning to them, and I'd thank you not to tell anyone." },
    },
    second_war = { { id = "tp_second_war", text = "I was a captain in the Second War, and I watched the Horde break against Lordaeron's walls. We won, and we paid for it in lives I can still count, and I still count them." } },
    the_stockade = { { id = "tp_the_stockade", text = "The prisoners have the Stockade, and I've told the Keep that I can take it back in an afternoon if they'll let me. They won't let me, and I'm told it's for reasons above my rank." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias have a nest under Moonbrook, and Stoutmantle's been asking for soldiers to clear it out for months. I've none to send, and I've told him so, and he still writes every week." } },
    thrall = { { id = "tp_thrall", text = "Thrall's orcs keep to Kalimdor, and he's made peace with Theramore, and I'm told I'm to treat that as good news. I'll treat it as good news when the Blackrock in Redridge hear about it." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took Lordaeron, and they're the greatest threat this kingdom has ever faced. If they ever come south, I'll hold this gate until the last man falls, and I'd like a few more men to hold it with." } },
    dark_portal = { { id = "tp_dark_portal", text = "The Dark Portal stands broken in the Black Morass, and Nethergarde watches it from the cliffs. I've read their reports, and I'm glad I'm not stationed there." } },
    internment = { { id = "tp_internment", text = "The internment camps cost this kingdom a fortune and kept the orcs fed for years. When Thrall broke them open, the coin went with them, and I've not stopped hearing the nobles complain." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord's a good soldier and a better man, and he's doing the job of a king without the crown. I'd serve him to the end, and I've told him so." } },
    varian = { { id = "tp_varian", text = "The King would have given me the men I need, I believe that, and he'd have given them gladly. I miss him every time I read a letter from Lakeshire." } },
    knows = {
      { id = "tp_knows", text = "The Watch reports to me on most things that happen inside these walls and a few that happen outside them. Ask me about any of this, and I'll answer as a soldier should." },
    },
    background = { { id = "tp_bg", text = "Second War, under Turalyon. Now the walls of this city. A soldier's life is short to tell, if it's a lucky one.", next = "turalyon" } },
    advice = { { id = "tp_ad", text = "Know where your exits are before you need them. Every general who forgot that has a statue. Or a grave." } },
    defias = { { id = "tp_defias", text = "A Westfall matter, the court says, and a soldier's matter, I say. We'll see who's right." } },
    blackrock = { { id = "tp_blackrock", text = "Orcs in Redridge, near enough to see from Lakeshire's walls. Near enough to worry me." } },
    westfall = { { id = "tp_westfall", text = "Westfall fed this city once, and now it feeds the Defias, while Stoutmantle does my job with pitchforks.", next = "walls_westfall" } },
    _none = { { id = "tp_none", text = "That's not a military matter, I'm afraid. Try City Hall." } },
  },
}

P:NPC {
  key = "renzik", id = TODO_NPC("Renzik \"The Shiv\""), name = "Renzik \"The Shiv\"",
  bible = "bibles/city4.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "prickly" }, values = { "proud", "practical" },
  notices = { "class", "stealth" },
  impression = {
    first = "Renzik speaks of himself by name, like a goblin selling his own legend, and he is second at SI:7 all the same. He decided I might be worth something and told me so bluntly.",
    third = "{name} met Renzik the Shiv, the goblin who serves as second at SI:7 and decides what good means there.",
  },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You got potential, pal, and Renzik can price potential from across the room. Renzik can also see you're about to get yourself killed, which is a lousy return on the investment, so let's fix that." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "You lost, pal? This ain't the bank, and Renzik don't do visitors, 'cause visitors take time and nobody's payin' Renzik for it." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Cute, but Renzik saw you come in, pal. Renzik sees everybody come in, 'cause that's the job, and the crown pays him real well not to miss nothin'." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Renzik wants ears, chum, ears that hear the wind and the stone, and good ears are worth good silver in this business. Renzik don't care who you pray to, only whether you can listen without bein' noticed." } },
      choices = {
        { text = "I'll serve the kingdom, but openly. I don't skulk.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Ears for coin? Renzik, you might have a deal.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Renzik keeps a file on everybody, pal, and yours is real thin, which is either good news or very good acting, and Renzik pays a clerk by the page to find out which. The Lamb's cellar is the best-watched cellar in Stormwind, and the folk down there pretend not to know it, which suits everybody nicely." },
      },
      choices = {
        { text = "Then keep the file thin. I'll give you no reason.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Files burn, Renzik. Mine especially.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Renzik.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Renzik pays for results, chum, and a cat nobody notices gets results nobody can trace, which is the most expensive kind there is. But you'd be workin' for Renzik, not for some tree, so if the tree calls, you tell it to wait its turn like every other client." } },
      choices = {
        { text = "The forest comes first, Renzik. Your coin won't change that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Pay me well enough and the trees can wait.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once or twice, sure, when the boss needed somethin' read that was written in sparkles, and the mage billed us like it was written in gold. Renzik likes his secrets dark, though, 'cause a secret that glows ain't a secret for long." } },
      choices = {
        { text = "SI:7 has its rules, Renzik, and I'll keep to them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I work my own way, Renzik, glow and all.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Sometimes we need a distraction, pal, and nobody's more distracting than a big guy yellin' in a courtyard, and you come cheaper than a barrel of blasting powder. While you're gettin' stabbed at the front, Renzik's people slip in the back, and everybody wins except the guy who was guardin' the back." } },
      choices = {
        { text = "I'll make the noise, if it gets the job done for the kingdom.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'm nobody's distraction. Find someone else to get stabbed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "When we need somebody watched from a long way off, sure, and Renzik pays by the hour, not by the arrow. Hunters see things from a rooftop that Renzik's people would need to be standin' on the guy's toes to see, and the beast makes a good alarm." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And that {pet} of yours, does it bark when somebody sneaks up? Good, keep it that way, kid, 'cause the boss hates surprises and Renzik hates payin' for 'em." },
      },
      choices = {
        { text = "I'll watch for SI:7 if the kingdom needs it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't spy on people. Hire someone else.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Sure, for the front door, when we need somebody loud and honest to walk in while Renzik's people go in the back. You'd be surprised how often a big shiny distraction closes the deal, and paladins never even ask for a cut." } },
      choices = {
        { text = "I'll be no one's distraction. I go in honestly or not at all.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it gets the job done, I'll walk in the front door.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, huh? Renzik don't usually get the shiny ones, but Renzik ain't complainin', so long as you don't preach at him, 'cause sermons ain't in the budget." },
        { id = "h_default", key = true,
          text = "Name's Renzik, pal, and people call him the Shiv, second to the boss here at SI:7. Renzik don't like people much, but he likes bein' the guy they gotta be polite to, and that's worth more than the wages." },
        { id = "h_si7", tags = { "news" }, when = { questActive = TODO_QUEST("SI:7") },
          text = "So you wanna work for us? Good, but first you gotta not die, 'cause a dead recruit's a total loss on Renzik's books, so go see Lucius in Redridge. He'll teach you the parts that keep you breathin'." },
        { id = "h_redridge", when = { questActive = TODO_QUEST("Redridge Rendezvous") },
          text = "Lucius is a pro, kid, so do what he says, how he says it. Don't improvise, 'cause improvisers end up in rivers, and Renzik don't get a refund on 'em." },
        { id = "h_shakedown", when = { questActive = TODO_QUEST("Kingly Shakedown") },
          text = "Some people forget who they owe, so remind 'em, and Renzik means the whole balance, interest and all. Politely, if they're polite, and the other way if they ain't." },
        { id = "h_shaw", when = { heardLine = "shaw.h_default" },
          text = "Talked to the boss, huh? He don't say much, so Renzik says the rest and bills the crown for both, and that's the arrangement." },
        { id = "h_erion", tags = { "news" }, when = { questActive = TODO_QUEST("Erion's Behest") },
          text = "Long trip from Darnassus, huh? Erion says you're good, pal, but Erion ain't the one signin' your pay, so Renzik decides what good means around here." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Holy robes, in SI:7? Now Renzik's seen everything, so are you here to bless the knives or confess to somethin'? Either way, pal, Renzik's takin' notes." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, in SI:7? Renzik don't like mages, pal, 'cause they make everything glow, and every agent who glows is an agent Renzik's gotta pay to replace." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, huh? You're about as quiet as a dropped anvil, pal, but at least you don't pretend otherwise, and Renzik respects honest merchandise." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, huh? Renzik knows your type, kid: you sit in a bush six hours waitin' for one shot, and Renzik respects a guy who knows what his time's worth." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in SI:7! Renzik's heard your people turn into cats and sneak about, which is a real valuable skill, so Renzik wants to know who's payin' you and how much." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Renzik sees a warlock, pal, and Renzik wonders if the warlock knows SI:7 keeps a file on every one of 'em who comes up from the Lamb, paid for by the crown." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Renzik sees a dwarf with totems, and Renzik thinks a shaman might be worth somethin' to SI:7, if the shaman can keep quiet. Quiet's the expensive part, chum." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Renzik's got a schedule, and every minute you stand there is a minute nobody's payin' him for." },
        { id = "h_again2", text = "Go on and talk, chum, 'cause Renzik's always listenin', and listenin' is half of what the crown pays him for." },
        { id = "h_again3", text = "Still here, pal? Renzik likes a customer who knows what he wants, so ask, and ask quick, 'cause the next guy in line pays better." },
      },
      choices = {
        { text = "Why do you talk about yourself like that?", next = "third" },
        { text = "A goblin in SI:7?", next = "goblin" },
        { text = "I'd wager SI:7's rogues come from all over.", next = "recruits" },
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Bless the knives, then?", next = "bless", when = { class = "PRIEST" } },
        { text = "Has SI:7 ever worked with a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I doubt SI:7 has work for a warrior, Renzik.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you ever use hunters for SI:7 jobs, Renzik?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does SI:7 have any use for a paladin, Renzik?", next = "xapala", when = { class = "PALADIN" } },
        { text = "A druid who prowls as a cat could be useful, Renzik.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "So SI:7 keeps a file on me, Renzik.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would SI:7 want with a shaman, Renzik?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go.", next = "END" },
      },
    },
    third = {
      big = true,
      lines = {
        { id = "t_default", text = "Because Renzik is a reputation, pal, and a reputation's an asset. Me, I'm just a goblin in a back room, but Renzik is the guy nobody wants to meet in an alley, and an asset like that's gotta be fed." },
      },
      choices = {
        { text = "Then I'll stay out of Renzik's alleys.", next = "BACK", fx = { affinity = 2 } },
        { text = "Does anyone know the real you?", next = "third_real" },
      },
    },
    third_real = {
      lines = { { id = "tr_default", text = "The boss, maybe. That's one more than Renzik likes and one less than Renzik admits, so don't go sellin' that to nobody, pal." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    goblin = {
      lines = { { id = "g_default", text = "Sure, and think about it, pal: what happens when a goblin walks into Orgrimmar? Nothin', 'cause nobody looks twice at a goblin who looks like he's sellin' somethin', and you just try that with a human." } },
      choices = {
        { text = "A goblin working for Stormwind seems odd.", next = "goblin_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblin_why = {
      lines = { { id = "gw_default", text = "Pay's good, pal, and folks here gotta be polite to me, which no trade prince ever threw in on a contract. Back home a goblin's feared or ignored, but here Renzik gets called sir, and Renzik likes sir." } },
      choices = { { text = "Sir it is.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
    recruits = {
      lines = { { id = "re_default", text = "Everywhere, pal, 'cause talent's a market like any other. Erion sends night elves from Darnassus, and Hulfdan in Ironforge sends dwarves, him bein' an old friend of Renzik's, and every last one of 'em goes through Lucius first." } },
      choices = {
        { text = "Who's Lucius?", next = "recruits_lucius" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits_lucius = {
      lines = { { id = "rl_default", text = "He works the Lakeshire docks lookin' like a layabout, and he is a layabout, but he's also the best teacher of not-dyin' Renzik ever paid for, and Renzik's seen what dyin' costs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bless = {
      lines = { { id = "b_default", text = "Ha! Go on, then, 'cause Renzik's knives could use the luck, and luck's the one thing the quartermaster don't stock. Just don't tell the boss; he thinks luck's for amateurs." } },
      choices = { { text = "Blessed. Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    si7 = { { id = "tp_si7", text = "SI:7 is the finest outfit in Stormwind, and Renzik is the finest blade in it, after the boss. Renzik doesn't say that to brag, only to inform." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is where Renzik learned his trade, and where he learned that everything's for sale, including loyalty. Renzik found something better to sell himself to, and he's never looked back." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Steamwheedle Cartel would sell their grandmothers if the price was right, and Renzik knows because he's met their grandmothers. Renzik prefers working for a kingdom, because kingdoms pay on time, mostly." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "Ravenholdt is a manor in the Alterac foothills full of people who think they're better than SI:7. Renzik has been invited, and Renzik declined, because Renzik doesn't need to be told he's good." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade's riot is a mess, and Renzik could clean it up in an evening if the boss would only let him. The boss says wait, so Renzik waits, and sharpens things." } },
    deadmines = { { id = "tp_deadmines", text = "VanCleef's down in the Moonbrook mines with a ship and an army of masons, and Renzik's been in there once. Renzik came out, which is the important part of that story." } },
    background = { { id = "tp_bg", text = "Renzik's past is Renzik's business, pal, and Renzik's present is SI:7, so that's all you get, and you didn't even have to pay for it." } },
    advice = { { id = "tp_ad", text = "Never trust a guy who says he's got nothin' to hide, 'cause everybody's carryin' somethin' off the books. The honest ones just know it." } },
    defias = { { id = "tp_defias", text = "That's SI:7's business, which means none of yours, pal, unless you want it to be, and then you talk to Renzik and Renzik names the terms." } },
    _none = { { id = "tp_none", text = "Renzik don't know, pal, and if Renzik don't know it, it ain't worth the price of askin'." } },
  },
}

P:NPC {
  key = "samuelson", id = TODO_NPC("Major Samuelson"), name = "Major Samuelson",
  bible = "bibles/city4.md", role = "guard", tier = "quest",
  communities = { "stormwind" }, temper = { "curt" }, values = { "dutiful" },
  notices = { "soldier" },
  impression = {
    first = "Major Samuelson keeps the throne room orderly and expects visitors to behave as though they know where they are standing. He said that was all I needed to know about him, and he meant it.",
    third = "{name} met Major Samuelson, captain of the guard in Stormwind Keep, a man of few words and fewer exceptions.",
  },

  greetings = {
    { id = "g_throne", text = "This is the King's throne room. Conduct yourself accordingly." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry yourself like you've been drilled. Good. Too many come in here like they're entering a tavern." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "There is a rule against anything I don't understand in the hall. You are welcome; your totems are not. That's all you need to know." } },
      choices = {
        { text = "The hall has its rules. I'll respect them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules for the sake of rules make poor guards, Major.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Nobody is trusted in the Keep, and you least of all, because I've read the histories of what the Guardian's meddling brought down on this city. You'll stand where you're told and speak when you're spoken to, and you'll do it without anything at your heel." },
      },
      choices = {
        { text = "Understood, Major. I'll keep my hands in sight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your reports tell half of it, Major.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Major.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It does, and it's forbidden the same as any fireball, because I don't care whether the magic comes from a book or a goddess. You walked in on two legs and you'll leave on them." } },
      choices = {
        { text = "The king's hall has its laws, Major, and I'll keep them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My shape is my own, Major, not a spell for you to forbid.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every day, and more so since the king vanished on the road to Theramore, because a boy on a throne is an easy target. Lady Prestor tells me the court is quite safe, and I keep my men exactly where they are regardless." } },
      choices = {
        { text = "Vigilance is right, Major. The king's safety comes first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No guard stops a blade that's patient enough, Major.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because I can't tell a parlour trick from an attack until it's too late, and neither can my men. The Regent agreed with me and Lady Prestor agreed with the Regent, so it's the rule, and it'll stay one." } },
      choices = {
        { text = "A sensible rule, Major, and I'll keep to it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules like that make a court weaker, not safer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "On the walls, at night, when the lamps don't reach the harbor road. A hunter on the battlements sees what my guards miss, though I'd not say that in front of them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} will stay out of the throne room, but it can sit by the gate. It looks better behaved than some of the nobles." },
      },
      choices = {
        { text = "I'll keep to your rules, Major. The Keep deserves order.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My pet goes where I go, Major. That's the bargain.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Before every change of the watch, though the men would never say so aloud. The king himself is missing, so if a prayer helps them stand a little straighter, I won't forbid it." } },
      choices = {
        { text = "Faith keeps a guard steady, Major. Let them pray.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Discipline keeps a guard steady. Prayer is for afterwards.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I guard the throne room, and the young king sits in it, so yes, near enough. Highlord Fordragon is a paladin like you, and I'll serve him to the end, but I sleep better knowing the Keep's doors are mine." } },
      choices = {
        { text = "Order in the Keep keeps the kingdom safe. Your work matters.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A paladin answers to the Light, Major, not to court rules.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Bishop DeLavey keeps his place near the throne, and I'll thank you to keep your voice low on the way to him." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll stand where you're told in the throne room, {class}, the same as anyone, Silver Hand or not." },
        { id = "h_default", key = true,
          text = "Major Samuelson, captain of the guard in the Keep. I keep the throne room orderly and the people in it safe. That's all you need to know." },
        { id = "h_farren", when = { heardLine = "farren.h_default" },
          text = "Orinelle? I trained him. He's a good officer who thinks he's wasted in Southshore, and he isn't, but don't tell him I said so." },
        { id = "h_reassign", tags = { "news" }, when = { questActive = TODO_QUEST("Reassignment") },
          text = "Orinelle's asking to come home again. Tell him his request has been received. Tell him nothing else." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Clergy approach the court through Bishop DeLavey in the Petitioner's Chamber, not through me, and certainly not today." },
        { id = "h_guard", when = { origin = "human_city_guard" },
          text = "I remember you from the Trade District rolls; you were one of the few recruits who could stand a whole night watch without leaning on the lamp-post. Don't lean on anything in here, either." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I've a guard at every pillar in this room for a reason, so whatever you're thinking of doing, my guards have already thought of it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "No spells in the throne room. The last mage who thought to show off for the young king spent a night in the guardroom." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, in the Keep. Your animal stays by the door, and you'll keep your bow unstrung while you're in the throne room." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in the throne room. You'll keep whatever shape you walked in with, because a bear before the king is not something my guards are paid to handle." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. You'll leave your companion at the doors of the Keep, and you'll keep your hands where my guards can see them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman in the throne room. Behave as though you know where you are standing, and keep your spirits outside the hall." },
      },
      again = {
        { id = "h_again", text = "Anything else? Briefly." },
        { id = "h_again2", text = "Yes?" },
      },
      choices = {
        { text = "You never seem to leave the throne room.", next = "leave" },
        { text = "You must guard more than the throne.", next = "guard" },
        { text = "I'd like to conduct myself properly here.", next = "conduct" },
        { text = "Lieutenant Orinelle speaks of you.", next = "farren",
          when = { any = { { heardLine = "farren.h_default" }, { questActive = TODO_QUEST("Reassignment") } } } },
        { text = "The Keep guard could use another warrior, Major.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Do you worry about assassins in the throne room?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why are spells forbidden in the throne room?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the Keep guard ever need a hunter's eye, Major?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the Keep's guard ever ask for prayers, Major?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you guard the young king yourself, Major?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does changing shape count as spellwork in the throne room, Major?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Are warlocks not trusted in the Keep, Major?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is there a rule against spirits in the hall, Major?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go.", next = "END" },
      },
    },
    guard = {
      lines = { { id = "g2_default", text = "The Regent, the young King and the court: everyone who stands in this room, whether I'd choose to guard them or not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = {
        { id = "l_watch", text = "Rarely. The boy king needs every sword in this room while his father is missing. I'll rest when King Varian comes home." },
      },
      choices = {
        { text = "I hope that's soon.", next = "BACK", fx = { affinity = 1 } },
        { text = "Do you think he will?", next = "leave_varian" },
      },
    },
    leave_varian = {
      lines = { { id = "lv_default", text = "A guard who answers that in this room is a fool. I keep the room ready, and that's my answer." } },
      choices = {
        { text = "A ready room is answer enough for me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A guard who won't answer is hiding something.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    conduct = {
      lines = { { id = "co_default", text = "Speak when spoken to. Keep your hands where the guard can see them. Bow to the King, then the Regent, in that order." } },
      choices = {
        { text = "Does everyone follow that order?", next = "conduct_court" },
        { text = "Understood.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll bow to whoever I please.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    conduct_court = {
      lines = { { id = "cc_default", text = "Some of the court forget it. You won't. I notice who forgets, and I don't forget who forgets." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    farren = {
      lines = { { id = "fa_default", text = "Orinelle is a good officer who thinks Southshore is beneath him. His reports are excellent, which is exactly why he's still there." } },
      choices = {
        { text = "You could bring him home.", next = "farren_review" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farren_review = {
      lines = { { id = "fr_default", text = "I review assignments next month, and he'll hear when he hears. If you see him, he heard none of this from you." } },
      choices = { { text = "Not a word.", next = "BACK", fx = { affinity = 1 } } },
    },
    warrior = {
      lines = { { id = "warrior_l", text = "The Keep guard is chosen, not recruited, and chosen from men who've stood the Watch for years. You'd do more good in Redridge than standing beside me looking at tapestries." } },
      choices = {
        { text = "Guarding the king matters more than Redridge.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then Redridge it is. The tapestries can guard themselves.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    bolvar = { { id = "tp_bolvar", text = "The Highlord holds the throne for the boy king, and I hold the throne room for the Highlord. That's all you need to know about the chain of command." } },
    varian = { { id = "tp_varian", text = "I stood in this hall the day the King left for Theramore, and I'll stand here the day he returns. Until then, I keep the room as he'd want it kept." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor is the Regent's most trusted adviser, and she's never once broken the protocols of this room. I wish I could say the same for most of the nobles." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "Visitors to the throne room pass beneath the Valley of Heroes, and I expect them to arrive with that in mind. Many don't, and I correct them, politely." } },
    background = { { id = "tp_bg", text = "Captain of the guard, and before that, a guard. That's all the background this room needs." } },
    advice = { { id = "tp_ad", text = "Stand straight in the Keep. People decide who you are from the doorway." } },
    _none = { { id = "tp_none", text = "That's not my concern; my concern is this room." } },
  },
}

P:NPC {
  key = "thomas_miller", id = TODO_NPC("Thomas Miller"), name = "Thomas Miller",
  bible = "bibles/city4.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful" }, values = { "hardworking" },
  notices = { "hunger" },

  barks = {
    { id = "b_bread", text = "Bread! Hot from the oven, or near enough!" },
    { id = "b_loaf", text = "A loaf for the road, a loaf for the pocket, a loaf for later!" },
  },
  impression = {
    first = "Thomas Miller walks the Trade District from dawn to dusk with a basket of bread and a left foot that complains the whole way. He had a roll halfway into my hand before I'd decided I was hungry.",
    third = "{name} met Thomas Miller, the Trade District's walking baker, whose basket always wins the argument with his feet.",
  },
  greetings = {
    { id = "g_bread", text = "Bread, friend? Best price in the Trade District, and I'll stand behind every crust." },
  },

  notice = {
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look like you haven't eaten since Goldshire. Have a roll, go on, and then buy six." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Better than any almanac, though it complains about everything. Maybe your spirits and my foot are kin, eh?" } },
      choices = {
        { text = "I'd take your kindness over any almanac, Thomas.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your foot's a fine prophet. Charge for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "More than you'd think, because the folk from the Lamb come up hungry and pale and buy six rolls at once, and I never ask what kept them below so long. I sell to the Cathedral at noon and the Lamb at dusk, and I'm fairly sure I'm the only man in the city who does both." },
      },
      choices = {
        { text = "Then I'll pay for my roll and keep your secret.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Six rolls? I'll take them, and pay you next time.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Thomas.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Something with berries in it, and I'd charge the same as for anything else. My foot says walk faster and my wife says sell more, so if you like it, tell your friends in the Park." } },
      choices = {
        { text = "I'll tell them. A city should feed everyone who walks it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My friends gather their own food, Thomas. They don't need your rolls.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A few a day, mostly to canal children, and I've stopped chasing them because my feet won't take it. I count it as charity, and I tell myself the Light keeps a tally." } },
      choices = {
        { text = "That's a good heart, Thomas. Let them eat.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Chase them down, because theft is theft, even of bread.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not much, because it's dry as parchment and tastes of nothing, and folk come back to mine within the week. Still, every time I see a mage pull a loaf from the air, my feet ache a little more." } },
      choices = {
        { text = "A good trade is worth keeping, even when magic is easier.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If magic does the job better, the trade should change.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "All the time, because the Barracks cooks bake like they're punishing someone. I sell soldiers my hard-crust rolls by the dozen, and I like to think I've kept more warriors fighting than any priest." } },
      choices = {
        { text = "Good bread keeps an army marching. I'll take a dozen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather fight hungry than carry bread around.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now and then a hunter swaps me a brace of rabbits for a basket of rolls, and my wife makes the best pie in the Trade District from them. Never let it be said the bakers and hunters of Stormwind don't look after each other." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has been sniffing my basket since you walked up. I'll pretend I didn't see it, just this once." },
      },
      choices = {
        { text = "A fair swap between working folk. I like that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll buy my bread with coin. Rabbits are for me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every morning there's a basket for the orphans and another for the poor at the steps, and the Cathedral pays when it can. My foot says I shouldn't walk that far, but the children are always waiting, so the foot loses again." } },
      choices = {
        { text = "That's holy work, Thomas, and the children are lucky.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You'll ruin yourself giving it away. Charge them full price.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than ever, and most of them heading out to Westfall or Redridge. I used to sell to the same faces every week, but now half of them buy once and I never see them again." } },
      choices = {
        { text = "Then I'll make sure some of them come home.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "That's a soldier's lot. They knew it when they signed.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Here, take a roll, because you look like you've been up with the sick, and the sick never let anyone eat." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Take a roll for your march, {class}, because a hero on an empty stomach is only a hungry man in armour." },
        { id = "h_default", text = "Thomas Miller, baker. I walk the Trade District from dawn to dusk with a basket, and my feet hate me but my customers love me, so it evens out." },
        { id = "h_foot", when = { metBefore = true }, text = "My left foot's been talking to me all morning, telling me to sit down, but my basket says keep walking, and the basket wins." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "These are the last loaves of the day, a bit squashed, but they taste the same, mostly." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Mind your hands near the basket, friend, because a roll that walks off without paying is a roll I've baked for nothing." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Don't you go conjuring bread in front of me, because I've been baking since before dawn and it's bad for a baker's spirits." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll be wanting a loaf that doesn't crumble in a pack, and I've got just the one, baked hard enough to use as a shield." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll be living on what you catch, I suppose, but take a loaf anyway; venison's lonely without bread." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You'll be wanting something wholesome, I expect, because your people look at my sweet rolls as if they'd done something wrong." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Would your little friend like a roll? No? Well, you'll have one, then, because you look half-starved." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Here, have a roll. A shaman needs bread like anyone else. My left foot says rain's coming; maybe your spirits would agree." },
      },
      again = {
        { id = "h_again", text = "Something else, friend? Walk with me; I can't stop." },
        { id = "h_again2", text = "Another question? Ask while I've crusts left." },
      },
      choices = {
        { text = "Show me your bread.", next = "BUSINESS" },
        { text = "You could open a shop instead.", next = "shop" },
        { text = "Flour is dear these days, I hear.", next = "flour" },
        { text = "My family grew wheat in Westfall.", next = "westfall", when = { origin = "human_westfall_farmhand" } },
        { text = "Do many rolls walk off without paying?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does conjured bread hurt your trade, Thomas?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Soldiers must buy plenty of bread from you, Thomas.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Hunters must trade with you now and then, Thomas.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever bake for the Cathedral, Thomas?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do many soldiers buy bread from you, Thomas?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you bake for someone who lives on berries, Thomas?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do warlocks buy much bread, Thomas?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does your foot really tell the weather, Thomas?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not hungry.", next = "END" },
      },
    },
    shop = {
      lines = { { id = "s_default", text = "A shop waits for customers. A basket goes and finds them. Besides, the rent in this city would make a dwarf weep." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    flour = {
      lines = { { id = "f_default", text = "Elwynn's mills, these days, and dear. Half the bread in this city was Westfall wheat, once. Not since the farms went.",
        fx = { learn = { "westfall" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    westfall = {
      lines = { { id = "w_default", text = "Did they? Then I've likely baked your family's work, because it was the best wheat there was. I'd give you a roll for it, if my margins let me, but they don't." } },
      choices = { { text = "I'll buy one, then.", next = "BUSINESS", fx = { affinity = 2 } }, { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I sold bread at the Darkmoon Faire one summer, and I walked so far my left foot went on strike for a week. Never again, I said, and I say that about every faire, and I go to every faire." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias are hiding in the mines under Moonbrook, and they're eating Westfall's bread that should be in my basket. I'd walk there and tell them so, but my foot says no." } },
    holy_light = { { id = "tp_holy_light", text = "I say a little prayer every morning for my left foot, and the Light has yet to answer. Bishop Farthing says the Light works in mysterious ways, and I say it works slowly." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "I start my rounds at the Valley of Heroes every morning, because the guards there are always hungry. They buy more rolls than the rest of the city put together." } },
    background = { { id = "tp_bg", text = "A baker with a basket and two bad feet. If there's more to me, it's flour." } },
    advice = { { id = "tp_ad", text = "Never leave Stormwind without bread in your pack. The road's full of things that want to eat you, and you'll want to eat first." } },
    _none = { { id = "tp_none", text = "I only know bread, friend. And which streets have the best customers." } },
  },
}
