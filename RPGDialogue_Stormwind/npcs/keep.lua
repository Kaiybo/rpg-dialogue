-- Stormwind Keep, the Petitioner's Chamber: the Church's man at court and two lords of the House.
-- Voices: bibles/keep_court.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bishop DeLavey: the Church at court, and a quiet search for a missing diplomat.
P:NPC {
  key = "delavey", id = TODO_NPC("Bishop DeLavey"), name = "Bishop DeLavey",
  bible = "bibles/keep_court.md", role = "priest", tier = "quest",
  communities = { "stormwind" }, temper = { "steady", "sharp" }, values = { "discreet", "pious" },
  notices = { "priest", "noble", "rogue" },
  impression = {
    first = "Bishop DeLavey speaks for the Church at court, and he chooses every word as if someone might write it down. He trusts a fisherman and a cheesemaker more than the courtiers around him.",
    third = "{name} met Bishop DeLavey, who represents the Church of the Holy Light in the court of Stormwind Keep.",
  },

  greetings = {
    { id = "g_court", text = "Keep your voice low, please. The Chamber has more ears than chairs." },
    { id = "g_diplomat", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "Any word? Quietly, now." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "One of the Cathedral's own, in this den of petitions. Welcome." },
  },

  notice = {
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "You wear the Church's robes into the Keep, which is braver than you know. The court remembers every priest who visits, and wonders what we want." },
    { id = "n_noble", cat = "noble", when = { origin = "human_minor_noble" },
      text = "You carry yourself like someone raised to stand in rooms like this one. Then you'll know already that nothing said here stays here, so choose your words as I do." },
    { id = "n_rogue", cat = "rogue", when = { class = "ROGUE" },
      text = "I'd ask what brings someone of your talents to the Petitioner's Chamber, but I suspect I'd rather not hear the answer in front of the guards." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The Church trusts the Sanctum, mostly, because Master Dumas keeps his students honest and his doors open. It's the cellar under the Lamb that troubles us, though Lord Wishock's shouting about it does more harm than good." } },
      choices = {
        { text = "The cellar should be cleared, Your Grace, quietly or not.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Every power has its use, even what's under the Lamb.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd speak with anyone who walks into this room on their own feet, because that's what the Light asks of me. I'll pray that your shadows stay on their leash, though, and I'll pray it every evening whether you like it or not." } },
      choices = {
        { text = "Pray if you like. I'll keep the leash tight.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Save your prayers. The shadows serve me well enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I try, though the Church's voice is often lost beneath the sound of the treasury closing. I've asked the Regent for chaplains in Lakeshire and Sentinel Hill, and I'll ask again, because asking is the one thing I'm here to do." } },
      choices = {
        { text = "Keep asking, Bishop. Someone has to speak for them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Soldiers need swords and coin, not chaplains.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Very little that isn't about rents or bandits, I'm afraid. When the wolves of Duskwood took three children last winter, it reached this chamber as a line in a tax petition." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} sits more patiently than half the court, I'd say. I'll pray for its health along with yours, if you don't mind." },
      },
      choices = {
        { text = "Then I'll tell them what's happening out there, Bishop.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The court won't listen. I won't waste my breath.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Bishop DeLavey, and I represent the Church of the Holy Light at the King's court. Which is to say I sit in this chamber, I listen, and I remind the court now and then that the Light has opinions." },
        { id = "h_diplomat", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "If young Thomas sent you, he's done well again. I'll be blunt, because I haven't time to be anything else: a diplomat bound for Theramore never arrived, and I believe the Defias had a hand in it. Please keep this from becoming common knowledge." },
        { id = "h_diplomat_done", when = { questDone = TODO_QUEST("The Missing Diplomat") },
          text = "My contacts tell me you followed the trail further than I dared hope. I won't ask you to repeat what you found here, in this room, but you have the Church's gratitude, and mine." },
        { id = "h_human", when = { race = "Human" },
          text = "You'll know how this city talks: everything is a rumour by noon and a scandal by supper. My work is mostly keeping the Church out of both." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Ironforge's envoys come through here often, and they're refreshingly plain about what they want. I wish the House of Nobles would take lessons." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at court is usually here to petition about the Slaughtered Lamb, and I confess I'm usually on their side. Speak plainly, and quietly." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I can tell what you are, and I'll not pretend otherwise in my own chamber. You're welcome to speak, though, because the Light has never closed its ears to anyone." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, at court. I'm sure you've opinions on how the kingdom's soldiers are spent, and I'm sure no one here has asked for them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, before the throne. I'll ask you to keep your animal close; some of the nobles here startle easily, and complain longer." },
      },
      again = {
        { id = "h_again", text = "Something else? Speak softly." },
        { id = "h_again2", text = "Go on. The petitioners can wait a little longer; they're used to it." },
      },
      choices = {
        { text = "Who is this missing diplomat?", next = "diplomat" },
        { text = "What does the Church want from the court?", next = "court" },
        { text = "Why trust a fisherman over the guard?", next = "contacts" },
        { text = "Your Grace, how does a priest serve at court?", next = "priest", when = { class = "PRIEST" } },
        { text = "My family has a seat in the House.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "Your fisherman would make a fine spy, Your Grace.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Does the Church trust the Mage Quarter, Your Grace?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the Church speak for the soldiers at court, Bishop?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What news does the court get of the wilds, Bishop?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You'd speak with a warlock, Your Grace?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'll leave you to your petitions.", next = "END" },
      },
    },
    diplomat = {
      lines = {
        { id = "d_default", text = "Someone whose safe arrival mattered a great deal, and that's all I'll say in this chamber. The meeting in Theramore never took place, and the silence since has been louder than any message." },
      },
      choices = {
        { text = "Why suspect the Defias?", next = "diplomat_defias" },
        { text = "You're keeping something back.", next = "diplomat_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    diplomat_defias = {
      lines = { { id = "dd_default", text = "Because they have friends on the roads, friends in the city, and a grudge against the crown that's older than their masks. Whoever took the diplomat knew the route, and few people did.",
        fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    diplomat_more = {
      big = true,
      lines = {
        { id = "dm_default", text = "Of course I am. A secret told to everyone who asks isn't a secret, and some secrets keep people alive. If that troubles you, you're welcome to decline the work." },
        { id = "dm_warm", when = { disposition = { min = 70 } }, text = "I am, and I'm sorry for it, because you've earned better. I'll tell you this much: if I'm right about who is missing, the whole kingdom will feel it when it's known, so I pray it never needs to be." },
      },
      choices = {
        { text = "Secrets have their place, and I'll keep yours.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "People deserve the truth, Your Grace.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    court = {
      lines = { { id = "c_default", text = "Bread for the poor, a voice for the stonemasons nobody paid, and a seat when the Regent decides things that touch the faithful. We get perhaps half of that in a good year, and this hasn't been a good year." } },
      choices = {
        { text = "Who truly decides at court?", next = "court_regent" },
        { text = "The stonemasons?", next = "court_masons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court_regent = {
      lines = { { id = "cr_default", text = "Highlord Bolvar rules as Regent for the boy king, and he's an honest man buried in other people's advice. Lady Prestor has his ear more than most, and she's very gracious to the Church, so I'm told to be grateful." } },
      choices = {
        { text = "You don't sound grateful.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    court_masons = {
      lines = { { id = "cm_default", text = "The men who rebuilt this city and were never paid for it. Some of them wear red masks in Westfall now, which makes my petitions on their behalf rather harder to read aloud.",
        fx = { learn = { "stonemasons", "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    contacts = {
      lines = { { id = "co_default", text = "Because the guard reports to the court, and the court talks. Jorgen fishes by the gate and sees everyone who comes and goes, and Elling Trias sells cheese and hears everything else. Neither of them has ever repeated a word of mine." } },
      choices = {
        { text = "A bishop with spies?", next = "contacts_spies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    contacts_spies = {
      big = true,
      lines = { { id = "cs_default", text = "Friends, I'd say, who happen to be observant. The Light asks us to be wise as well as kind, and in this building wisdom means knowing who you can trust before you need to." } },
      choices = {
        { text = "A bishop shouldn't play at shadows.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A little shadow keeps the Light safe.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      big = true,
      lines = { { id = "p_default", text = "By being patient, polite and impossible to bribe, and by remembering that every petition in this room is a person who couldn't reach the throne themselves. It's less glorious than the Cathedral, but someone must carry the Light up these stairs." } },
      choices = {
        { text = "I'd rather heal than petition.", next = "priest_choice" },
        { text = "That sounds like a calling.", next = "priest_choice", fx = { affinity = 2 } },
      },
    },
    priest_choice = {
      lines = { { id = "pc_default", text = "Most of us would, and the Cathedral needs healers far more than it needs another bishop at court. But if you ever find the people you heal keep coming back with the same wounds, come and see me, and we'll talk about why." } },
      choices = {
        { text = "The court should hear about those wounds.", next = "BACK", fx = { align = { order = -1 }, trait = { stern = 1 } } },
        { text = "I'll trust the court to know its business.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble = {
      lines = { { id = "n_default", text = "Then you'll know the House is three parts gossip and one part business, and that the business is usually done over dinner. If your family ever needs the Church's ear, come to me before you go to the floor; it saves embarrassment on all sides." } },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 2 } },
        { text = "My family can speak for itself.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    rogue = {
      lines = { { id = "rogue_l", text = "He'd be appalled to hear it, and he'd be very good at it. The Church has its listeners, child, as SI:7 has its knives, and I'd thank you not to compare them in Master Shaw's hearing." } },
      choices = {
        { text = "Listening is the same work, whoever pays.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "The Church's way is the honest one.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Who else listens for the Church?", next = "rogue2" },
      },
    },
    rogue2 = {
      lines = { { id = "rogue2_l", text = "Fishermen, washerwomen and a great many grandmothers, all of whom think they're simply gossiping with their bishop. They're right, and that's what makes it work." } },
      choices = { { text = "Something else, Your Grace.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything that's petitioned at court passes within earshot of this chair, and some of it I'm even allowed to repeat. Ask, and I'll tell you what I can." },
    },
    background = { { id = "tp_bg", text = "A churchman who was better at listening than preaching, and so was sent where the listening is hardest. I don't complain, much." } },
    advice = { { id = "tp_ad", text = "Never say anything in the Keep you'd mind hearing at the Pig and Whistle by evening. It will be there by evening." } },
    defias = { { id = "tp_defias", text = "Westfall's brigands, with friends in more places than the court likes to admit. I keep their name out of the Church's prayers only so I can say it in its petitions.", next = "diplomat_defias" } },
    stonemasons = { { id = "tp_masons", text = "Their unpaid wages are written in a ledger somewhere in this building. I've asked to see it twice." } },
    _none = { { id = "tp_none", text = "I couldn't say, and in this chamber that's usually the wisest answer anyway." } },
  },
}

-- Count Remington Ridgewell: the House's most enthusiastic collector.
P:NPC {
  key = "ridgewell", id = TODO_NPC("Count Remington Ridgewell"), name = "Count Remington Ridgewell",
  title = "House of Nobles",
  bible = "bibles/keep_court.md", role = "noble", tier = "quest",
  communities = { "stormwind" }, temper = { "jovial" }, values = { "proud", "greedy" },
  notices = { "noble", "dwarf", "travel" },
  impression = {
    first = "Count Remington Ridgewell talks about his family's collection the way other men talk about their children, and he'd like everyone to admire his new coat. He sends other people into ruins for treasure and pays them handsomely to do it.",
    third = "{name} met Count Remington Ridgewell of the House of Nobles, whose family keeps a museum of jewels and art.",
  },

  greetings = {
    { id = "g_cuffs", text = "Do mind my cuffs, there's a dear; this outfit is newly tailored." },
    { id = "g_tiara", when = { questActive = TODO_QUEST("The Perenolde Tiara") }, text = "The tiara! Have you got it? Tell me you've got it." },
    { id = "g_clasp", when = { questDone = TODO_QUEST("Delivery to Ridgewell") }, text = "My favourite treasure-hunter! The clasp has its own case now, you know." },
  },

  notice = {
    { id = "n_noble", cat = "noble", when = { origin = "human_minor_noble" },
      text = "Ah, you're one of us, I can tell by the posture, even under all that road dust. Which house? No, don't tell me, I'll guess at dinner." },
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf" },
      text = "A dwarf! Do you know, the finest piece I'm hoping to acquire was made by Ironforge jewellers? Your people have the most extraordinary hands." },
    { id = "n_travel", cat = "travel", when = { durability = { max = 0.3 } },
      text = "Good heavens, you look as if you've been dragged through a ruin backwards. You simply must have been somewhere interesting; was there anything shiny?" },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Twice, and both times the Watch caught the thieves before they reached the stairs, which cost me a fortune in grateful dinners. Still, I sometimes think the best pieces in any collection were stolen by somebody, once upon a time." } },
      choices = {
        { text = "Then they belong with whoever came by them honestly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then a clever thief is only a collector in a hurry.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I'd adore it, though I warn you that every mage who's looked has told me my Alterac silver is only silver. One of them said it was cursed, actually, and I've never been so thrilled in my life." } },
      choices = {
        { text = "I'd tell you the truth, Count, even if it's dull.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd say it's cursed too. You'd enjoy that more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A few pieces, naturally, though only the finest, like a ceremonial blade said to have belonged to one of Lothar's knights. I'd never dream of using it, of course, but I'd dearly love to see someone use one like it properly." } },
      choices = {
        { text = "A blade should be used, Count, not sat on a wall.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A blade that fine belongs in a collection, Count.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rare pelts, unusual feathers, a set of antlers that would make the Lescovars weep with envy! My family's hall has a gap above the fireplace that has been waiting for something magnificent for nine years." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, what a remarkable creature your {pet} is. I don't suppose you'd consider... no, no, of course not. Forget I asked." },
      },
      choices = {
        { text = "Some trophies belong in the wild, Count, not on a wall.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "For the right price, I'll fill that gap above your fireplace.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Count Remington Ridgewell, at your service! My family boasts the finest collection of jewellery and fine art among all the nobles of Stormwind, and we are always, always looking to make it larger." },
        { id = "h_tiara", key = true, tags = { "news" }, when = { questBefore = TODO_QUEST("The Perenolde Tiara"), minLevel = 34 },
          text = "You look capable, and capable is exactly what I need. There's a certain tiara, an heirloom of the Perenoldes of Alterac, and I'm told an ogre has it up in the ruins. Imagine it under glass in our museum!" },
        { id = "h_tiara_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Perenolde Tiara") },
          text = "Grel'borg the Miser, they call him, an ogre mage wandering the Ruins of Alterac and picking through the rubble for treasures. Well, he's had his turn; now it's mine." },
        { id = "h_tiara_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Perenolde Tiara"), days = 5 } },
          text = "The tiara is being cleaned as we speak, emerald by emerald. Our gratitude is as grand as our collection, and you've seen how grand that is!" },
        { id = "h_mayara", when = { questActive = TODO_QUEST("Mayara Brightwing") },
          text = "Mayara writes from the Burning Steppes that she's found something marvellous, though not in Thaurissan after all, and she'll need help fetching it. Do go and see her, would you?" },
        { id = "h_human", when = { race = "Human" },
          text = "Every family in this city has a story, and ours happens to be told in gold and gemstones. You must come and see the museum; I'll give you the long tour." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Oh, I know that light step; I've had my collection guarded against it for years! Do keep your hands where I can admire them, friend." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! The Sanctum sends someone round now and then to tell me whether my pieces are enchanted, and they always say no, which is terribly disappointing." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, at my side! Splendid; I never feel so safe in this chamber as when there's someone armed nearby who isn't a guard." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, my word! You must come across all kinds of curiosities in the wild, and I'm always, always interested in curiosities." },
      },
      again = {
        { id = "h_again", text = "What else, what else? I do so love a little company." },
        { id = "h_again2", text = "Go on, then. My next appointment is only the Duke, and he's always late." },
      },
      choices = {
        { text = "Tell me about your museum.", next = "museum" },
        { text = "Why would you want a traitor's tiara?", next = "tiara" },
        { text = "Who is Mayara Brightwing?", next = "mayara" },
        { text = "Dwarves made it, you said?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Which house do you think I'm from?", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "Has anyone ever tried to rob your museum, Count?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you like me to look over your collection?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you collect arms and armour too, Count?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What curiosities would a collector like you want, Count?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Good day, Count.", next = "END" },
      },
    },
    museum = {
      lines = { { id = "m_default", text = "Three floors, my friend, and every piece with a story. A dagger from the First War, a goblet from old Lordaeron, a brooch that may have belonged to a queen. People come from all over the city to see it, and I come every morning just to admire it." } },
      choices = {
        { text = "Where do you find it all?", next = "museum_find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    museum_find = {
      lines = { { id = "mf_default", text = "Oh, I don't find it myself, heavens no. I hire brave people, like you, and they go to frightful places, and they come back with lovely things. It's a wonderful arrangement for everyone except the ogres." } },
      choices = {
        { text = "And the people who lose them?", next = "museum_whose" },
        { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    museum_whose = {
      big = true,
      lines = { { id = "mw_default", text = "Lose them? My dear, they're mostly dead, and have been for centuries, or they're ogres, who don't count. Better a treasure safe under glass in Stormwind than rotting in a ruin, surely?" } },
      choices = {
        { text = "Some things belong where they were left.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Treasure's for whoever can take it.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tiara = {
      lines = { { id = "t_default", text = "A traitor's, yes, which makes it all the more interesting! The Perenoldes sold Alterac to the orcs, and their kingdom fell for it. The tiara is all that's left of them that anyone would want to look at.",
        fx = { learn = { "alterac" } } } },
      choices = {
        { text = "It should stay buried with them.", next = "tiara_shame", fx = { align = { honor = 1 } } },
        { text = "History is history, so put it on display.", next = "tiara_shame", fx = { align = { honor = -1 } } },
        { text = "What does it look like?", next = "tiara_shame" },
      },
    },
    tiara_shame = {
      lines = { { id = "ts_default", text = "Emeralds, the finest, set by master jewellers in Ironforge, so whatever you think of the family, you can't fault the craftsmanship. I'll put a little card beside it explaining the treachery; visitors adore a scandal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mayara = {
      lines = { { id = "ma_default", text = "My agent, and a marvel: she goes where I'd never dream of going and writes me the most thrilling letters. She's in the Burning Steppes now, among the ruins of the Dark Iron capital, looking for things that ought to be in a museum.",
        fx = { learn = { "thaurissan" } } } },
      choices = {
        { text = "Isn't that dangerous?", next = "mayara_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mayara_danger = {
      lines = { { id = "md_default", text = "Terribly, which is why I pay her so well and worry about her so much. She says the Blackrock orcs are the worst of it, and that I'm not to send any more letters asking her to be careful." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Master jewellers of Ironforge, long before the Perenoldes went bad. I've always wondered whether your people kept the designs. If you ever hear of a workshop that did, you must tell me at once." } },
      choices = {
        { text = "Dwarves don't sell their family secrets.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "I'll ask around for you.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    noble = {
      lines = { { id = "no_default", text = "One of the minor houses, I'd wager, with a good name and not quite enough land, which is the best kind to come from; you learn to be charming. Don't worry, I won't say it at dinner. Probably." } },
      choices = {
        { text = "Close enough, Count.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I hear everything worth hearing at dinner, and I collect gossip nearly as eagerly as brooches. Ask me anything!" },
    },
    background = { { id = "tp_bg", text = "A Ridgewell, of the Ridgewells! Our collection is our history, and I'm merely its latest and most devoted keeper.", next = "museum" } },
    advice = { { id = "tp_ad", text = "Never wear your second-best coat to the Keep. Someone always notices, and it's always the Duchess." } },
    alterac = { { id = "tp_alterac", text = "Ruins, ogres and a traitor's treasure. I'd never go myself, but I'd love to own a piece of it.", next = "tiara" } },
    thaurissan = { { id = "tp_thaurissan", text = "The old Dark Iron capital, all ash now, and Mayara says there's beauty in the ash if you dig. I believe her." } },
    _none = { { id = "tp_none", text = "Haven't the faintest, my dear, and if it isn't valuable, I shan't worry about it." } },
  },
}

-- Lord Baurles K. Wishock: a thirsty lord with a crusade against the Slaughtered Lamb.
P:NPC {
  key = "wishock", id = TODO_NPC("Lord Baurles K. Wishock"), name = "Lord Baurles K. Wishock",
  title = "House of Nobles",
  bible = "bibles/keep_court.md", role = "noble", tier = "quest",
  communities = { "stormwind" }, temper = { "proud" }, values = { "proud", "lawful" },
  notices = { "warlock", "priest" },
  impression = {
    first = "Lord Wishock means to have the warlocks under the Slaughtered Lamb dragged before the House of Nobles, and he found them by drinking there on credit. He is loud, red-faced and, about the warlocks at least, perfectly right.",
    third = "{name} met Lord Baurles K. Wishock of the House of Nobles, who is lobbying to shut down the coven beneath the Slaughtered Lamb.",
  },

  greetings = {
    { id = "g_house", text = "Mark my words, the House will hear of it! Oh, it's you; what is it?" },
    { id = "g_thirst", text = "Lobbying is thirsty work, dreadfully thirsty work." },
  },

  notice = {
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK" },
      text = "You smell of sulphur and candle smoke, and I know that smell; it's the Slaughtered Lamb's cellar! Don't think I won't name you to the House along with the rest of them." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "Ah, a priest, good! The Church ought to be on my side in this, you know; dark practitioners under a city tavern are surely your department more than mine." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Dozens, and every one of them pretends to be my friend at supper. I suspect half of them drink at the Lamb themselves, which is precisely why nobody wants an inquiry." } },
      choices = {
        { text = "Then let the inquiry go ahead and shame them all.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them keep their secrets. Everyone's entitled to a few.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Shut your cellar, burn your books and send you out of the gates in the clothes you're wearing. The law protects you for now, I know, but laws can be rewritten when enough of us are frightened." } },
      choices = {
        { text = "Burn the worst books, then. Some knowledge shouldn't survive.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fear makes bad law, my lord. Leave my books alone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Absolutely, and in full daylight, so that the whole city can see it done! These practitioners hide beneath respectable shops and call it study, and I mean to show the House of Nobles exactly what they've been tolerating." } },
      choices = {
        { text = "I'll go, if there's proof and a lawful warrant, my lord.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Point me at the door. I don't need a warrant.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "If they leave footprints, and they do, believe me, in brimstone and candle-ash and stolen goats. I've had reports of strange things in the Mage Quarter's cellars, and I'd like someone with a good nose to follow them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours has a good nose, I don't doubt, and I'd pay well to point it at the right cellar. Think on it." },
      },
      choices = {
        { text = "I'll look, but I'll only accuse someone with proof.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If you're paying, I'll find you all the warlocks you like.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Lord Baurles K. Wishock, of the House of Nobles, and I am about to cause a great deal of trouble for some very deserving people. There is a nest of dark practitioners in this city, and I mean to have it cleared out." },
        { id = "h_brew", key = true, when = { questActive = TODO_QUEST("A Noble Brew") },
          text = "The Lamb's lot have stopped serving me, can you believe it? Over a trifling bill! It hardly matters, because the House will have them shut by spring, and I'll toast it somewhere with better wine." },
        { id = "h_human", when = { race = "Human" },
          text = "You're a Stormwind citizen, so you'll want your city free of witches and devil-callers, I trust. Write to the House; tell them Wishock sent you, and tell them loudly." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "I'll speak to you, since the law says I must, but I'll keep this chair between us, if it's all the same to you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You have a furtive look about you, and I'll thank you not to stand behind my chair. The House is full of enough knives as it is." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Excellent. When I've found the nest of warlocks I mean to clear out, I'll want stout fellows like you to break down the door." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll know how to track things to their dens, which is precisely what I need; the dark practitioners in this city are no better than vermin." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick; I've a speech to polish." },
        { id = "h_again2", text = "Well? Out with it." },
      },
      choices = {
        { text = "What dark practitioners?", next = "coven" },
        { text = "How did you find them?", next = "found" },
        { text = "Will the House listen?", next = "house" },
        { text = "Don't drink anything sent from the Mage Quarter.", next = "warn", when = { questActive = TODO_QUEST("A Noble Brew") } },
        { text = "The Church stands with you, my lord.", next = "priest", when = { class = "PRIEST" } },
        { text = "The Mage Quarter isn't all demon-callers, my lord.", next = "mage", when = { class = "MAGE" } },
        { text = "Have you many enemies in the House, my lord?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you really send soldiers after the warlocks, my lord?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a hunter track down warlocks, my lord?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would you have the House do with my kind, my lord?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good luck with your speech.", next = "END" },
      },
    },
    coven = {
      big = true,
      lines = { { id = "c_default", text = "Warlocks, {g:sir|madam}, in the cellar of the Slaughtered Lamb, not a hundred paces from the Wizard's Sanctum! They summon things down there, and teach others to, and the magi upstairs pretend not to notice. It's a disgrace." } },
      choices = {
        { text = "Then they should be driven out.", next = "coven_more", fx = { align = { light = 1 } } },
        { text = "They harm no one, so leave them be.", next = "coven_more", fx = { align = { light = -1 } } },
        { text = "What do they summon?", next = "coven_more" },
      },
    },
    coven_more = {
      lines = { { id = "cm_default", text = "Imps, and worse things with too many teeth, and I've heard a voice down those stairs that wasn't a man's. I'm no coward, but I'll not drink in that place again, and I've told the House as much." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    found = {
      lines = { { id = "f_default", text = "I was enjoying a quiet evening at the Lamb, as a gentleman does, and I went looking for the privy and found a staircase instead. I've an excellent memory for what I see, even after a few cups." } },
      choices = {
        { text = "And the bill you never paid?", next = "found_bill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    found_bill = {
      lines = { { id = "fb_default", text = "Slander! An oversight, at most, and one that will be settled in full once they've been shut down, by which time there'll be no one to settle it with. You'll find that's how these things usually work out." } },
      choices = {
        { text = "Convenient, my lord.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    house = {
      lines = { { id = "h2_default", text = "They will, if I shout long enough, and I've a very good voice for shouting. Half of them are afraid of the magi and the other half are afraid of me, so I expect a full investigation by the end of the season." } },
      choices = {
        { text = "Aren't you worried they'll come for you?", next = "house_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    house_fear = {
      big = true,
      lines = { { id = "hf_default", text = "A lord of the House? They wouldn't dare. Besides, I keep good company and I don't drink anything I haven't paid for. Well, not lately." } },
      choices = {
        { text = "Keep your guard up anyway.", next = "BACK", fx = { affinity = 1, align = { honor = 1 }, trait = { cautious = 1 } } },
        { text = "A man who drinks on credit deserves what's coming to him.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    warn = {
      big = true,
      lines = { { id = "w_default", text = "From the Mage Quarter? Why ever would anyone send me a drink from that end of town? Unless you mean the magi have finally come round to my side, which would be very handsome of them." } },
      choices = {
        { text = "I mean it. Refuse any gift you didn't order.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Never mind, my lord, and drink up.", next = "BACK", fx = { align = { honor = -1 }, trait = { cruel = 1 } } },
      },
    },
    priest = {
      lines = { { id = "p_default", text = "Splendid! Then tell the Archbishop to send a letter to the House, a stern one, with plenty of Light in it. Nobody votes against the Cathedral in public, whatever they do over dinner." } },
      choices = {
        { text = "I'll speak to Bishop DeLavey.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "mage_l", text = "Isn't it? The Sanctum sits on the same street as that tavern and pretends not to smell the brimstone. If you mages were as clean as you claim, I'd not have to give this speech." } },
      choices = {
        { text = "The Sanctum fights the same rot, quietly.", next = "mage2" },
        { text = "You're right. The Quarter turns a blind eye.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your speech is about your bar tab, my lord.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    mage2 = {
      lines = { { id = "mage2_l", text = "Then it can say so in front of the House, and I'll applaud. Until then I'll assume silence means guilt, as one generally should." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've sat in the House long enough to know everyone's secrets, and in most of the city's taverns for longer. Ask, and I'll tell you what I know, and what I suspect." },
    },
    background = { { id = "tp_bg", text = "A lord of the House of Nobles with a good voice and a long memory. That's all the background a man needs in the Keep." } },
    advice = { { id = "tp_ad", text = "Never go down a tavern staircase you didn't come up. That's free, and it's the best advice you'll get in this chamber." } },
    _none = { { id = "tp_none", text = "Never heard of it, and if it were important, I would have done. Next!" } },
  },
}
