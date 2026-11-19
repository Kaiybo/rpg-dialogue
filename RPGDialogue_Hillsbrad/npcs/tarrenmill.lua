-- Tarren Mill (Horde, Forsaken). Voice: bibles/hillsbrad.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "darthalia", id = TODO_NPC("High Executor Darthalia"), name = "High Executor Darthalia",
  bible = "bibles/hillsbrad.md", role = "soldier", tier = "major",
  communities = { "tarren_mill" }, temper = { "cold" }, values = { "loyal", "relentless" },
  likesTone = "blunt",
  prejudice = { faction = "Horde", race = { "Orc", "Tauren", "Troll" }, amount = 10, why = "The living Horde flinch from the Forsaken, and she returns the contempt." },
  notices = { "race", "class" },

  impression = {
    first = "She measures everyone by their use to the Dark Lady's front.",
    third = "{name} met High Executor Darthalia, who holds Tarren Mill for the Dark Lady and presses the line against Southshore.",
  },

  greetings = {
    { id = "g_prej1", when = { prejudiced = true }, text = "Another of the living Horde, holding your breath so you won't smell us. The front doesn't care how I smell, so state your business and breathe as you like." },
    { id = "g_prej2", when = { prejudiced = true }, text = "The Warchief sends his living soldiers to help us, and they spend their first week staring at our jaws. Are you here to fight, or to stare?" },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You again. You've stood on this front without wrinkling your nose, which few of your kind manage, and I have noticed it." },
    { id = "g_front", text = "You stand at the Dark Lady's front. Be useful to it, or stand somewhere else." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, good. The front moves forward only when people like you push it." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "You were gone {away}, and the front did not wait for you. Report what you can and take up your post." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "You've been gone {away} and come back stronger than you left, which the Dark Lady can use. Put it to work at the front." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You are a good deal more dangerous than when we last spoke. Southshore will learn that soon enough, I expect." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I'm told you put fear into someone at the Mill. Good, so long as you save the rest of it for Southshore." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word reached me that you were caught in a lie at the Mill. The dead have long memories and little patience, so don't make me hear it twice." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of the living allies. The Horde lends us blades and we are grateful. Keep them pointed south." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR", race = "Scourge" },
      text = "A warrior of the Forsaken, good. The dead don't tire, and neither should we." },
  },

  start = "hello",
  nodes = {
    dd_honor = {
      lines = { { id = "dd_honor_default", text = "They do, and they'll go on doing it while Southshore stands, because they think this valley is still theirs. Each one you send back to their graveyard costs them more than it costs us, and that is how the Forsaken win wars." } },
      choices = {
        { text = "Then I'll keep the road red until Southshore breaks.", next = "BACK", reply = "That is the Dark Lady's work, and you do it well. Mind their paladins; they come back up just as stubbornly as we do.", fx = { align = { honor = -1 } } },
        { text = "I fight them fairly. I'll not ambush their wounded.", next = "BACK", reply = "Fair is a living word, {class}. Keep it if you like, but don't let it slow your blade when they come over that hill.", fx = { align = { honor = 1 } } },
        { text = "Something else, Executor.", next = "BACK" },
      },
    },

    prej = {
      lines = { { id = "prej_default", text = "Because most of them do, in the end, or they ask to pitch their tents upwind of us. The orcs call us allies in Orgrimmar and corpses in the field, and I stopped waiting for the difference to close." } },
      choices = {
        { text = "The Horde stands together. Your contempt only widens the gap.", next = "BACK", reply = "The gap was dug by others, and I only refuse to pretend it isn't there. When the orcs stand at our side in the field and not just in speeches, I'll mind my tongue.", fx = { align = { order = 1 } } },
        { text = "Then stop waiting. The Forsaken need nobody's approval.", next = "BACK", reply = "Spoken like one of the Dark Lady's own. We earned our freedom in the Undercity's mud, and we owe no one an apology for surviving.", fx = { align = { order = -1 } } },
        { text = "I'll camp where you tell me and keep my nose to myself.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "What happened to make you say that?", next = "prej_why" },
        { text = "Something else, High Executor.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "A Warsong band came to Tarren Mill last spring to help us hold the ridge. Their captain spat when he saw our apothecaries at work, and when Southshore's militia came up the road, his band was already halfway to the Barrens." } },
      choices = {
        { text = "One coward doesn't speak for the whole Horde.", next = "BACK", reply = "Perhaps not, but he spoke loudly enough that I heard nothing else that spring. Show me a better orc and I'll gladly revise my opinion.", fx = { align = { honor = 1 } } },
        { text = "Then trust only your own dead. It's the safer bet.", next = "BACK", reply = "It has been safe enough so far. The dead do not run when the militia comes up the road, because the dead have nowhere else to go.", fx = { align = { honor = -1 } } },
        { text = "Something else, High Executor.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "Do that, and do it twice, and I may start remembering your name instead of your smell." } },
      choices = {
        { text = "Something else, High Executor.", next = "BACK" },
      },
    },
    opn_sylvanas = {
      lines = {
        { id = "opn_sylvanas_q", text = "I think she freed us from the Lich King's voice, and I would follow her into the sea for it. I am more curious what you think, since you walk under the Horde's banner beside us, and the Horde's opinions of her are seldom said to our faces." },
      },
      choices = {
        { text = "She broke the Lich King's hold. She has my loyalty.", next = "opn_sylvanas_r_loyal", fx = { affinity = 2, align = { order = 1 }, opinion = { sylvanas = "loyal" } } },
        { text = "She serves herself first. I'd watch her.", next = "opn_sylvanas_r_distrust", fx = { affinity = -2, align = { order = -1 }, opinion = { sylvanas = "distrust" } } },
        { text = "She's useful to the Horde. That's enough for me.", next = "opn_sylvanas_r_useful", fx = { trait = { practical = 1 }, opinion = { sylvanas = "useful" } } },
        { text = "She gave us back our minds. I owe her everything.", next = "opn_sylvanas_r_loyal", when = { race = "Scourge" }, fx = { affinity = 2, opinion = { sylvanas = "loyal" } } },
        { text = "And a demon at her side? I don't like it.", next = "opn_sylvanas_r_dangerous", when = { faction = "Horde" }, fx = { affinity = -1, opinion = { sylvanas = "dangerous", demons = "distrust" } } },
        { text = "I'll keep my opinions, High Executor.", next = "BACK" },
      },
    },
    opn_sylvanas_r = {
      lines = {
        { id = "opn_sylvanas_r_default", text = "Keep them, then. The dead are patient, and opinions surface eventually." },
      },
      choices = {
        { text = "Something else, High Executor.", next = "BACK" },
      },
    },
    opn_sylvanas_r_loyal = {
      lines = {
        { id = "opn_sylvanas_r_loyal", text = "Good. Loyalty is rare among the living and rarer among their allies. I will remember it when the reports are written." },
      },
      choices = {
        { text = "Something else, High Executor.", next = "BACK" },
      },
    },
    opn_sylvanas_r_distrust = {
      lines = {
        { id = "opn_sylvanas_r_distrust", text = "Watch her, then, from very far away. Tarren Mill is close enough for her to hear it, and I am close enough to tell her." },
      },
      choices = {
        { text = "Something else, High Executor.", next = "BACK" },
      },
    },
    opn_sylvanas_r_useful = {
      lines = {
        { id = "opn_sylvanas_r_useful", text = "Useful. That is how the orcs speak of us all. It is honest, at least, and honesty I can use." },
      },
      choices = {
        { text = "Something else, High Executor.", next = "BACK" },
      },
    },
    opn_sylvanas_r_dangerous = {
      lines = {
        { id = "opn_sylvanas_r_dangerous", text = "My opinion of Lord Varimathras was not requested, and yours is noted. Do not say it in the Undercity." },
      },
      choices = {
        { text = "Something else, High Executor.", next = "BACK" },
      },
    },
    xcl_sm = {
      big = true,
      lines = { { id = "xcl_sm_default", text = "Good, because every crusader who dies in Tirisfal is one fewer to stiffen Southshore's flank. The Crusade likes to think it stands apart from the Alliance, but a human with a torch is a human with a torch, and my deathguards don't stop to ask which banner it marches under." } },
      choices = {
        { text = "They were fanatics, but they fought bravely. I'll grant them that.", next = "BACK", reply = "Brave, yes, in the way a rabid hound is brave. Grant them whatever you like, so long as you also grant them a grave.", fx = { align = { honor = 1 } } },
        { text = "Their bravery doesn't matter. They died, and that's all I wanted.", next = "BACK", reply = "Good, because that is the only thing about them that matters to me. Every one buried is a torch that will never reach the Mill.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Will the Crusade send more against Tarren Mill?", next = "xcl_sm2" },
      },
    },
    xcl_sm2 = {
      lines = { { id = "xcl_sm2_default", text = "They've tried it twice since I took this post, a few torchbearers with prayers on their lips, and the Deathguard sent them back up the hill in pieces. Without their leaders they'll come less often, and when they do come they'll be angrier and stupider, which I can work with." } },
      choices = {
        { text = "Then I'll be ready for the angry ones.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Hillsbrad Fields, where the farmers have been handed swords and told they are soldiers. Kill the ones who fight, let the rest run to Southshore with the story, and Marshal Redpath will spend a month deciding what to do while we take another field." } },
      choices = {
        { text = "Kill those who fight and spare those who run.", next = "BACK", reply = "That is the order, and you understand it exactly. A survivor who runs to Southshore is worth more to us than a corpse.", fx = { align = { honor = 1 } } },
        { text = "Spare none. Fear spreads faster when no one escapes.", next = "BACK", reply = "Fear spreads fastest when someone is left to carry it, and the Marshal must hear the story. Follow my orders, not your appetite.", fx = { align = { honor = -1 } } },
        { text = "Something else, High Executor.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Their patrols, their couriers, and the gryphons that come down from the Wildhammer aeries, because Southshore's messages go north by air. Bring down a rider, and the dwarves will think twice before they offer the humans more help." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Southshore's patrols and couriers, and your {pet} will be useful to the front as long as it obeys you. The Dark Lady has no patience for beasts that run wild, or for those who cannot hold their leash." },
      },
      choices = {
        { text = "The Dark Lady's orders come first. I'll follow them to the letter.", next = "BACK", reply = "Good, because the Dark Lady's orders are all that hold this hill together. Bring me a gryphon's feathers and I'll know you meant it.", fx = { align = { order = 1 } } },
        { text = "I hunt my own way. Results matter more than orders.", next = "BACK", reply = "Results, then, and I'll judge them when they arrive. If your way gets my riders killed, you'll answer to me and not to your pride.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "You tell me, druid, since you are the one who speaks with her. I only know that the soil of these hills took our bodies once and gave them back, and I owe it nothing either way." } },
      choices = {
        { text = "She turns away no one who seeks her.", next = "BACK", reply = "Then she has a stranger taste in company than I thought. I'll take your word on it, druid, though I doubt she'd take mine.", fx = { align = { light = 1 } } },
        { text = "Undeath is against nature. She owes you nothing.", next = "BACK", reply = "Then we understand each other perfectly, and I owe her nothing in return. The hills can keep their opinions about what I am.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "One at a time, by night, so the humans wake up to find their neighbors gone and wonder who is next. Fear costs the Dark Lady nothing at all, and it does half my work for me." } },
      choices = {
        { text = "Fear is a weapon. I'll use it well.", next = "BACK", reply = "Then use it on Southshore, and use it well. I want the farmers barring their doors before the sun is down.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll fight soldiers, not frighten farmers.", next = "BACK", reply = "A noble sentiment, and a very living one. The soldiers are farmers here, and you'll learn that soon enough.", fx = { align = { light = 1 } } },
        { text = "Something else, High Executor.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The living still cower before fire and frost, and the Kirin Tor's survivors hide in their half-rebuilt city while we take their old lands. Burn the fields around Southshore and you'll do more for the front than a hundred Deathguards." } },
      choices = {
        { text = "I'll serve the front, but not by burning farms.", next = "BACK", reply = "You'll serve the front however I tell you to serve it, but I'll find you soldiers to burn instead. Mind you don't disappoint me.", fx = { align = { light = 1 } } },
        { text = "Point me at the fields. They'll burn.", next = "BACK", reply = "Excellent. The smoke will be seen from Southshore's walls, and the Marshal will have a long night ahead of him.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I trust the Dark Lady, and the Dark Lady trusts him as far as she must. His kind once ruled us through the Lich King, and I watch every dreadlord who walks the Undercity with the same care I'd watch a coiled snake." } },
      choices = {
        { text = "The dreadlord serves us now. Use him.", next = "BACK", reply = "Use him, by all means, but never turn your back on him. The Dark Lady keeps her dreadlord close for a reason, and it is not affection.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Never trust a dreadlord. Watch him as he watches us.", next = "BACK", reply = "You have the instincts of a survivor. Keep them, because the Undercity has a great many shadows and he lives in most of them.", fx = { align = { order = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Soldiers who don't fall, first, and soldiers who fall and rise again, second. The Deathguard who die in Hillsbrad's fields are carried back to the Mill, and I would rather a priest mend them in the evening than Apothecary Lydon stitch them in the morning, for he enjoys it far too much." } },
      choices = {
        { text = "I'll mend your soldiers, High Executor. That's the work.", next = "BACK", reply = "Good. A soldier mended is a soldier on the ridge tomorrow, and I'd rather spare Lydon the pleasure of his needles.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll heal who I choose. Your line is your affair.", next = "BACK", reply = "Then choose quickly, priest, because the line bleeds whether you approve of it or not. I'll remember who you chose.", fx = { align = { order = -1 } } },
        { text = "Something else, High Executor.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" },
          text = "A tauren druid, among the dead. Your people make their oaths to the Earth Mother, I'm told, and I have yet to decide whether she would count us among her children." },
        { id = "h_default", key = true,
          text = "High Executor Darthalia. I hold Tarren Mill for the Dark Lady and Lord Varimathras, and I push the line against the humans of Southshore, one field at a time if I must." },
        { id = "h_strike", tags = { "news" }, when = { questActive = TODO_QUEST("Time to Strike") },
          text = "The humans are slow and comfortable. Time we reminded them otherwise, before they notice how far we've come." },
        { id = "h_syndicate", when = { questActive = TODO_QUEST("WANTED: Syndicate Personnel") },
          text = "The Syndicate are thieves who think the land still belongs to their grandfathers. Remind them the land belongs to the dead now." },
        { id = "h_battle", tags = { "news" }, when = { questActive = TODO_QUEST("Battle of Hillsbrad") },
          text = "Hillsbrad's fields feed Southshore. Take the fields, and Southshore starves. It is simple arithmetic, and I am very good at arithmetic." },
        { id = "h_vardus", when = { questActive = TODO_QUEST("WANTED: Baron Vardus") },
          text = "Vardus is a baron of a kingdom that no longer exists, hiding among thieves in the Uplands. Bring me his head; he may keep the title." },
        { id = "h_dangerous", when = { questActive = TODO_QUEST("Dangerous!") },
          text = "There are four names on that list. Each one killed one of mine and hides among the farmers, but the living are very bad at hiding from the dead." },
        { id = "h_lydon", when = { heardLine = "lydon.h_default" },
          text = "You've met Lydon, then: brilliant, devoted, and forever complaining about the fresh air. Leave him his complaints, for the Society needs his work." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The living sleep and we do not, so every night the line moves a little closer to Southshore." },
        { id = "h_krusk", when = { questDone = TODO_QUEST("Gol'dir") },
          text = "Gol'dir, Krusk's captain, is free, I hear, and the orcs are grateful. Gratitude from Orgrimmar is a currency I intend to spend." },
        { id = "h_xsoldier", when = { origin = "forsaken_lordaeron_soldier" },
          text = "You carried Lordaeron's colours once; it shows in how you stand. Southshore's watchmen once served the same king, so try to remember which side of the line you are on now." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Good, because Southshore's farms are best taken quietly, and I have no patience for soldiers who announce themselves with a battle cry." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage of the Forsaken or the Horde, it hardly matters. The Dark Lady values any power that can break a human line, and you'll find plenty of lines to break here." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Lord Varimathras has given us many gifts, and I suspect you're one of the few who knows exactly what they cost." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Good, because Southshore's farms are not taken by stealth alone, and when the humans finally form a line, I want someone who can break it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Southshore's patrols keep to the shore road, and I need someone who can follow them unseen and who doesn't mind what happens at the end of the trail." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The Light abandoned Lordaeron's dead, so I care very little which god or shadow you pray to, so long as my soldiers stand back up after you're done with them." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Hillsbrad", min = 40 } }, text = "The farms below the Mill are emptier than they were, and Southshore's grain carts have started coming back half full. Your work, I'm told. Keep at it, for arithmetic favours the patient." },
        { id = "h_cl_sm", tags = { "news" }, when = { cleared = "Scarlet Monastery", faction = "Horde" },
          text = "The Crusade's monastery has lost its masters, I'm told, and the bat riders say you were among those who saw to it. Tirisfal will breathe easier, and I'll have fewer zealots coming down the road to bother my line." },
        { id = "h_dd_honor", tags = { "news" }, when = { honorKills = { min = 100 } },
          text = "My watchers on the hill count the Alliance soldiers you've cut down, and the tally is long enough to make Southshore nervous. Good; I want them nervous." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief about it." },
        { id = "h_again2", text = "Continue. You are not dismissed yet." },
      },
      choices = {
        { text = "Does the Earth Mother turn her back on the Forsaken?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why fight over Southshore?", next = "why" },
        { text = "What are your orders, High Executor?", next = "orders" },
        { text = "The Syndicate seem to be a thorn in your side too.", next = "syndicate" },
        { text = "You must answer to someone in the Undercity.", next = "command" },
        { text = "I was of Lordaeron too, once.", next = "forsaken", when = { race = "Scourge" } },
        { text = "My people were caged in these hills.", next = "orc", when = { race = "Orc" } },
        { text = "The Darkspear hunt well. Point me at something.", next = "troll", when = { race = "Troll" } },
        { text = "My people do not make war on farmers.", next = "tauren", when = { race = "Tauren" } },
        { text = "Hillsbrad's farms are burning.", next = "after_battle", when = { questDone = TODO_QUEST("Battle of Hillsbrad") } },
        { text = "I've cut through the Scarlet Monastery, High Executor.", next = "xcl_sm", when = { cleared = "Scarlet Monastery", faction = "Horde" } },
        { text = "For the Dark Lady.", next = "BUSINESS", fx = { affinity = 2 } },
        { text = "The Light answers me, High Executor, even now.", next = "xpaladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "The spirits of this land are restless.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "The Windshapers fight for the Horde.", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "How do you want Southshore's farms taken, High Executor?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What use does the Dark Lady have for mages, High Executor?", next = "xmage", when = { class = "MAGE" } },
        { text = "I wouldn't trust Lord Varimathras, High Executor. I know what his kind want.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Where would you have me break the human line, High Executor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What should I track for you, High Executor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do you need from a priest at Tarren Mill, High Executor?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "You treat every living soldier as if they're about to run.", next = "prej", when = { prejudiced = true } },
        { text = "I served in the Hillsbrad militia, High Executor, against the dead.", next = "xorig_militia", when = { origin = "forsaken_hillsbrad_militia" } },
        { text = "I'll take my leave.", next = "END" },
        { text = "Southshore's soldiers keep coming at Tarren Mill, Executor.", next = "dd_honor", when = { honorKills = { min = 100 } } },
      },
    },
    xorig_militia = {
      lines = {
        { id = "xml_default", text = "Then you've seen this war from both ends of the same hill, and few of my Deathguard can say that. Southshore's militia will be full of your old neighbors. Can I trust you to fight them?" },
      },
      choices = {
        { text = "All of them, if need be. They'd not hesitate over me.", next = "BACK", reply = "No, they would not, and I'm glad you remember that. Your old neighbors buried you once already, and they'd do it again.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I'll fight their soldiers, not farmers with pitchforks.", next = "BACK", reply = "Pitchforks kill as surely as swords, as many of my Deathguard have learned. Fight the soldiers, then, and let me worry about the rest.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Who do you think taught them to drill?", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because this was Lordaeron, and the living drove us out of it after we died for it. We do not ask for it back. We take it back." },
      },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 2 } },
        { text = "They're just villagers.", next = "villagers" },
      },
    },
    villagers = {
      lines = { { id = "v_default", text = "So were we, once, until the plague came and the villagers threw stones at us. Go and fight, or go away." } },
      choices = {
        { text = "And what happens to them in the end?", next = "plague" },
        { text = "I'll fight.", next = "BUSINESS", fx = { affinity = 1 } },
      },
    },
    plague = {
      lines = {
        { id = "pl_default", text = "Then the apothecaries finish what we started. Until then, we hold the fields and wait. Waiting is easy for the dead." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "That's no kind of war.", next = "BACK", reply = "No, it is not, but it is the war the Dark Lady has given us. The living are welcome to their glory; we have time.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Patience wins wars. Let the apothecaries do their work.", next = "BACK", reply = "Exactly, and the apothecaries are very patient people. When they are finished, Southshore will be a field of graves and nothing more.", fx = { align = { honor = -1 } } },
      },
    },
    orders = {
      lines = {
        { id = "or_default", text = "Quell the human settlements of Hillsbrad until the Society's plague is ready: the farms first, then the smith who arms them, then Southshore." },
      },
      choices = {
        { text = "Why the farms first?", next = "farms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farms = {
      big = true,
      lines = {
        { id = "fa_default", text = "It comes down to food, iron and nerve. Take the farms and they lose the first; kill the smith and they lose the second. The third leaves on its own." },
      },
      choices = {
        { text = "Cold, but sound.", next = "BACK", reply = "Sound is all I ask of a plan. Cold, I already am.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Starving farmers out isn't a war I'd want to win.", next = "BACK", reply = "You don't have to want it, only to win it. The living would starve us out in a heartbeat, if we still needed bread.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    syndicate = {
      lines = {
        { id = "sy_default", text = "By the Dark Lady's decree, all of them are wanted dead, and those we capture are executed, since it saves us posting guards on them." },
      },
      choices = {
        { text = "Where do they hide?", next = "durnholde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    durnholde = {
      lines = {
        { id = "du_default", text = "In the ruins of Durnholde, southeast of here, where the humans once caged orcs. The irony is lost on them. Very little is lost on me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    command = {
      lines = {
        { id = "cm_default", text = "The Dark Lady, and Lord Varimathras, who speaks for her in these matters. I do not ask what passes between them. I advance the line." },
      },
      choices = {
        { text = "Varimathras is a demon.", next = "varimathras" },
        { text = "Something else.", next = "BACK" },
      },
    },
    varimathras = {
      lines = {
        { id = "va_default", text = "He serves the Dark Lady, and he serves well. My opinion of what he is was not requested. Neither, I notice, was yours." },
      },
      choices = {
        { text = "What do you think of the Dark Lady, then?", next = "opn_sylvanas" },
        { text = "Understood, High Executor.", next = "BACK", reply = "Good. Some questions are best left unasked while the dreadlord walks the halls.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Someone should be asking.", next = "BACK", reply = "Someone is, I assure you, and her name is not yours or mine. Keep your thoughts behind your teeth, for your own sake.", fx = { align = { order = -1 }, affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    forsaken = {
      lines = {
        { id = "fs_default", text = "Then you remember the stones, and the doors that shut in your face. Good; remember them when you walk into Hillsbrad." },
      },
      choices = {
        { text = "I remember.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'd rather forget.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
      },
    },
    orc = {
      lines = {
        { id = "oc_default", text = "Durnholde, yes. Then we both have scores to settle here, yours older and mine fresher, and the Syndicate keep its ruins now, so start there." },
      },
      choices = {
        { text = "Gladly.", next = "BACK", reply = "Then go, and bring back something worth reporting. Durnholde was your prison; let it be the Syndicate's tomb.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Your scores are your own. I'll settle mine my own way.", next = "BACK", reply = "Settle them however you like, orc, as long as they end with dead Syndicate. I am not particular about the rest.", fx = { align = { honor = -1 } } },
      },
    },
    troll = {
      lines = {
        { id = "tr_default", text = "So I am told. Then hunt the Syndicate, who hide better than deer, and whose hides are worth more to me." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      big = true,
      lines = {
        { id = "ta_default", text = "Your Earth Mother does not walk these fields. The plague did, out of human granaries, and it took my life. Your scruples are noted, tauren, but the order stands." },
      },
      choices = {
        { text = "Then I'll fight soldiers, not farmers.", next = "BACK", reply = "Fight whoever lifts a blade against you, then, and I'll not ask more. The farmers will lift plenty of them.", fx = { affinity = -1, align = { honor = 2, light = 1 } } },
        { text = "The Horde stands together. I'll go.", next = "BACK", reply = "Good. The Horde is a word I hear often and see too seldom, so I'm glad to see it walking out of my gate.", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    after_battle = {
      lines = {
        { id = "ab_default", text = "As intended. The grip tightens, field by field. My reports to the Undercity have grown pleasantly short." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { tarren_mill = 1 } } } },
    },
    xpaladin = {
      big = true,
      lines = { { id = "xpa_default", text = "So I have heard, and I do not pretend to understand it. The Light burned many of us when we first rose, and I will not ask what it says to you now, so long as it says nothing kind about Southshore." } },
      choices = {
        { text = "The Light chose me. I'll carry it for the Forsaken.", next = "BACK", reply = "Then carry it well, and carry it at Southshore's throat. I care very little where your strength comes from, so long as it serves.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light is a weapon. Nothing more.", next = "BACK", reply = "At last, a paladin I understand. A weapon I can use, and a sermon I can do without.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "It must trouble your soldiers.", next = "xpaladin_troops" },
      },
    },
    xpaladin_troops = {
      lines = { { id = "xpt_default", text = "It troubles them very much, and I have told them that anything useful to the Dark Lady is a friend. They will learn to stand near you eventually, the same way they learned to stand near the apothecaries." } },
      choices = {
        { text = "I'll give them time.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = { { id = "xsh_default", text = "Restless, are they? Then they have something in common with the dead. Tell them whatever you must to keep them out of my way, and if they can be persuaded to rot Southshore's barley, so much the better." } },
      choices = {
        { text = "Spirits aren't soldiers. They won't take orders.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "I'll do what I can for the land.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xskyborne = {
      lines = { { id = "xsk_default", text = "So I'm told, and Thunder Bluff vouches for you, which is more than Thunder Bluff does for us. I have no opinion about your people yet. Give me one." } },
      choices = {
        { text = "Point me at Southshore's line.", next = "orders", fx = { affinity = 1 } },
        { text = "We fight for the Horde, not the Dark Lady.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Flattery. I had thought I left that behind with my pulse, yet I find I still have a taste for it. You may continue to be useful." },
        { id = "s2", text = "You notice competence, which is uncommon among the living and the dead alike. I accept the compliment, and I shall make a note of your name." },
      },
      fail = {
        { id = "f1", text = "I have been dead long enough to lose my vanity along with most of my face. Save your charm for someone with a heartbeat to quicken." },
        { id = "f2", text = "Compliments are what people offer when they have no results to report. Bring me results from the front instead." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha. That was nearly funny, and I have not laughed since I was buried. You have nerve, and the Dark Lady's front has need of nerve." },
        { id = "s2", text = "You are insolent, and I find it preferable to the way most visitors stare at the floor. I shall overlook it this once, with something like amusement." },
      },
      fail = {
        { id = "f1", text = "The last one who mocked me is now assisting the apothecaries with their work, in several jars. Consider your next remark with care." },
        { id = "f2", text = "I was mocked by the living when I rose, and I have outlasted most of them. You are not clever, and you are wasting the front's time." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "How interesting. Very little unsettles the dead, and yet you have managed a flicker of it. Very well, you have my attention, and you should use it wisely." },
        { id = "s2", text = "You press as though you mean it, and I can respect ruthlessness. I will concede the point, since it costs me less than arguing." },
      },
      fail = {
        { id = "f1", text = "I have already died, and it was a disappointment. Whatever you are threatening me with, I assure you I have had worse." },
        { id = "f2", narr = "She regards you without blinking, which she no longer needs to do.", text = "You are attempting to frighten a corpse who commands a garrison of corpses. I admire the optimism, but do not try it again." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That is not something I discuss with those who have yet to prove their worth to the front, so go and prove it." },
      { id = "gt2", text = "I know the answer, and you have not earned it. The Dark Lady's officers do not confide in every passerby." },
    },
    knows = {
      { id = "tp_knows", text = "I will answer what it serves the Dark Lady for you to know. Choose your questions carefully." },
    },
    new_plague = { { id = "tp_plague", text = "The plague is the Society's work. Until it is ready, we hold the fields.", next = "plague" } },
    background = { { id = "tp_bg", text = "I died for Lordaeron, and now I take it back for the Dark Lady. The account is simple.", next = "why" } },
    advice = { { id = "tp_ad", text = "Do not linger near Southshore's walls. Their guards are bored, and bored men shoot first." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady broke the Lich King's hold on our minds, and she gave us a kingdom from the ruins of the old. Every field I take from Southshore is a field I lay at her feet." }, { id = "tp_sylvanas2", when = { faction = "Alliance" }, text = "You serve the living kings who left us to rot, and you ask me about my queen? She will outlast them all, and I will be standing beside her to watch." } },
    scourge = { { id = "tp_scourge", text = "The Scourge are the Lich King's slaves, and we were once among them. I hate them more than any human could, because I remember what it was to be one." } },
    forsaken = { { id = "tp_forsaken", text = "We are the Forsaken, and we have chosen our own path, and we owe nothing to the living. Southshore will learn that, one field at a time." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is an ally of convenience, and the Dark Lady treats with him as one. He sends his orcs to Hammerfall and Tarren Mill, and I make use of them as I can." } },
    arthas = { { id = "tp_arthas", text = "The prince of Lordaeron unmade us all, and he will pay for it in time. I would like to be there when he does, and I intend to be." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron is ours now, the dead kingdom of the dead, and the living can mourn it from Southshore. We remember it better than they do, because we died in it." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme belongs to the Scourge and to the Scarlet zealots, and both will answer to the Dark Lady in time. I've sent scouts there, and few of them have come back." } },
    _none = { { id = "tp_none", text = "That is irrelevant to the front. Ask someone with less to do." } },
  },
}

P:NPC {
  key = "lydon", id = TODO_NPC("Apothecary Lydon"), name = "Apothecary Lydon",
  bible = "bibles/hillsbrad.md", role = "scholar", tier = "quest",
  communities = { "tarren_mill" }, temper = { "glum" }, values = { "devoted" },
  notices = { "craft", "race" },

  impression = {
    first = "He told me to touch nothing, since most of it kills.",
    third = "{name} met Apothecary Lydon of the Royal Apothecary Society, who brews deadly things at Tarren Mill.",
  },

  greetings = {
    { id = "g_bored", text = "Oh, a visitor, how thrilling. Please don't touch anything; most of it will kill you, and the rest will make you wish it had." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. I'd say I'm pleased, but I'm not anything, really, though you are useful." },
    { id = "g_xcult", when = { origin = "forsaken_cult_remnant" }, text = "The Cult of the Damned, before you died? How refreshing, since most of the Dark Lady's servants pretend they've never touched a plague. I have no such pretensions, and I find I'm almost glad of the company." },
    { id = "g_away", when = { away = 14 }, text = "Oh, you've been gone {away}, have you? I hadn't noticed, though I suppose I'm meant to say I had." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've become considerably more dangerous since we last spoke. I find that almost interesting, and I have not found anything interesting since I died." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear someone at the Mill was talked into something by a clever tongue, and it sounded rather like yours. I'll be reading my own labels twice while you're here." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist. Do you enjoy it? I used to enjoy things. Now I just find them interesting, in a distant sort of way." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "You're alive, warm and breathing, and it's very distracting. Try to breathe more quietly, would you?" },
  },

  start = "hello",
  nodes = {
    opn_plague = {
      lines = {
        { id = "opn_plague_q", text = "Right? Nobody's asked me that since I died. The Society says it's justice, the orcs pretend it's medicine, and Umpi, my frog, says nothing because she's dead again. You seem to have a view, so go on, it might be interesting." },
      },
      choices = {
        { text = "The Scourge must be stopped, by any means. It's necessary.", next = "opn_plague_r_necessary", fx = { align = { light = -1 }, opinion = { new_plague = "necessary" } } },
        { text = "It's an abomination. Thrall would never allow it.", next = "opn_plague_r_wrong", fx = { align = { light = 1 }, opinion = { new_plague = "wrong" } } },
        { text = "It's dangerous. Poisons don't care who they kill.", next = "opn_plague_r_dangerous", fx = { trait = { careful = 1 }, opinion = { new_plague = "dangerous" } } },
        { text = "The living drove us out. Let them choke on it.", next = "opn_plague_r_justice", when = { race = "Scourge" }, fx = { affinity = 1, opinion = { new_plague = "justice" } } },
        { text = "I don't want to know, Lydon.", next = "BACK" },
      },
    },
    opn_plague_r = {
      lines = {
        { id = "opn_plague_r_default", text = "Nobody does. That's why they keep me out here with the birds." },
      },
      choices = {
        { text = "Something else, Lydon.", next = "BACK" },
      },
    },
    opn_plague_r_necessary = {
      lines = {
        { id = "opn_plague_r_necessary", text = "Necessary. That's the Society's word too, and they say it so often it's lost all its flavour. Not that I'd taste it anyway." },
      },
      choices = {
        { text = "Something else, Lydon.", next = "BACK" },
      },
    },
    opn_plague_r_wrong = {
      lines = {
        { id = "opn_plague_r_wrong", text = "An abomination! Oh, that's good, say it again more slowly. No, don't; the Executor's listening, and I've no wish to learn what the Society does with traitors on Umpi." },
      },
      choices = {
        { text = "Something else, Lydon.", next = "BACK" },
      },
    },
    opn_plague_r_dangerous = {
      lines = {
        { id = "opn_plague_r_dangerous", text = "Yes, that's rather the point of it. I've noticed it doesn't care, and I've noticed I don't either, which is the more worrying of the two." },
      },
      choices = {
        { text = "Something else, Lydon.", next = "BACK" },
      },
    },
    opn_plague_r_justice = {
      lines = {
        { id = "opn_plague_r_justice", text = "Choke on it. Master Apothecary Faranell would hug you, if he hugged, which he doesn't, because things fall off." },
      },
      choices = {
        { text = "Something else, Lydon.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Anything is worth feeling, when you've felt nothing for long enough. I stand over these cauldrons hoping for a flicker of anything, and you get a fire every time you pray, so I think you should be grateful, even if it hurts." } },
      choices = {
        { text = "I am grateful. The burning means I'm still someone.", next = "BACK", reply = "Good, then hold onto it with both hands. I'd trade every vial in this room for a burn like that.", fx = { align = { light = 1 } } },
        { text = "Grateful? It's a curse, Lydon. Don't envy it.", next = "BACK", reply = "A curse that reminds you that you're alive, in some fashion? I'd take it gladly, and so would Umpi, I think.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "On whatever wanders into the fields and doesn't wander out again, which is mostly rats and the occasional unlucky boar. I've never tested anything on Umpi, though, and I never will, which I suppose is the closest thing I still have to a principle." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "So that's {pet}. Keep it well clear of Umpi, please, because she's survived more than any frog should, and it would be a waste for her to end her days as a snack." },
      },
      choices = {
        { text = "Beasts don't deserve your plague. Test it on the enemy.", next = "BACK", reply = "The enemy is busy fighting me, unfortunately, so the boars will have to do for now. I'll keep your preference in my notes.", fx = { align = { light = 1 } } },
        { text = "Whatever serves the Dark Lady. Test on anything that breathes.", next = "BACK", reply = "Spoken like a true Society man, though you're not one, I think. Rats breathe, and so do boars, and so does a good deal of Southshore.", fx = { align = { light = -1 } } },
        { text = "Something else, Lydon.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Master Faranell says the arcane is a crutch for people who can't measure, and I agree with him because agreeing is quicker. Still, the Syndicate's shadow mages are collecting blood for me in the hills, so I suppose the Society uses magic the way it uses everything else, at arm's length." } },
      choices = {
        { text = "The Society's methods are sound. I'd follow Faranell's rules.", next = "BACK", reply = "Wise, and quicker than arguing with him, believe me. He doesn't like being argued with, and he likes the argument even less.", fx = { align = { order = 1 } } },
        { text = "Faranell's rules are a crutch too. Use whatever works.", next = "BACK", reply = "Don't let him hear you say that, or you'll find yourself on my table. Though, between us, I've often thought the same.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I've no idea, shaman, and I suspect you're about to tell me. The water spirits in Hillsbrad's streams are welcome to complain to the Society in writing, though I doubt Master Faranell will read it." } },
      choices = {
        { text = "The land suffers enough. I'll ask its spirits to forgive it.", next = "BACK", reply = "How very gentle of you. If they forgive me, do let me know; I'd like to note the date.", fx = { align = { light = 1 } } },
        { text = "The spirits serve the Horde too. They'll endure your poisons.", next = "BACK", reply = "They'll have to, since the Society has no intention of stopping. I'm glad someone in the Horde sees it as I do.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "We poison what the humans would plant, not what we stand on, or so the Society says. I'll admit the soil around my cauldrons hasn't sprouted anything in months, and only Umpi doesn't seem to mind." } },
      choices = {
        { text = "Then keep your poisons far from these hills.", next = "BACK", reply = "They're far from my own hills, if that helps. I've no hills of my own, actually, only this cellar and a frog.", fx = { align = { light = 1 } } },
        { text = "A weapon is a weapon. Use it.", next = "BACK", reply = "That's what Faranell says, more or less, and with more paperwork. You'd fit in nicely down in the Undercity.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I make them for the Dark Lady, and if you're carrying out her work, I suppose that includes you. The ones in the blue bottles are for blades, and the ones in the black bottles are for something much larger, and I'd advise you not to mix them up." } },
      choices = {
        { text = "Give me what I need for the blade. I'll use it carefully.", next = "BACK", reply = "Blue, then, and keep it well away from your own fingers. A rogue with a poisoned thumb is a very short story.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd like to know what's in the black bottles, Lydon.", next = "BACK", reply = "So would I, sometimes, and I've been making them for months. Best not to ask questions the Society hasn't answered for me either.", fx = { align = { order = -1 } } },
        { text = "Something else, Lydon.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Umpi is my frog, and she has survived more of my tests than any frog should, so I'd hate for her to end up as an imp's supper. Keep your demon away from my table and we'll both stay happy, or what passes for happy in Tarren Mill." } },
      choices = {
        { text = "I'll keep my minion far from Umpi. For your sake.", next = "BACK", reply = "Thank you, truly. Umpi can't say it, but she'd thank you too, if frogs did that sort of thing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon goes where it pleases, Lydon.", next = "BACK", reply = "Then it pleases to go elsewhere, or I'll test the black bottles on it. I'm very attached to that frog.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, here among my cauldrons. I'm told you talk to the earth and the water, so please don't tell me what they think of the runoff behind the hut." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" },
          text = "A druid at Tarren Mill. I suspect you won't approve of my work, tauren, since most of it is about making green things die faster." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. The Light stopped visiting Tarren Mill some time ago, and the loa never came at all, so you'll have to make do with me and Umpi." },
        { id = "h_default", key = true,
          text = "Lydon, of the Royal Apothecary Society. I make things that hurt, for the Dark Lady's work, and it's the only thing that still makes me feel much of anything, that and Umpi." },
        { id = "h_pain", tags = { "news" }, when = { questActive = TODO_QUEST("Elixir of Pain") },
          text = "A new elixir needs testing, on something living. Don't look at me like that; the frog's busy." },
        { id = "h_suffering", when = { questActive = TODO_QUEST("Elixir of Suffering") },
          text = "Suffering, in a bottle, is harder to make than the Society's critics suppose. Suffering out of a bottle is everywhere, of course." },
        { id = "h_agony", when = { questActive = TODO_QUEST("Elixir of Agony") },
          text = "Master Apothecary Faranell in the Undercity wants this finished. When the Master wants something, one finishes it." },
        { id = "h_helbrim", when = { heardLine = "helbrim.h_default" },
          text = "Apothecary Helbrim, at the Crossroads, bottling cactus? Good for him; someone in the Society should be getting a tan." },
        { id = "h_spring", when = { timeOfDay = "day" },
          text = "Flowers again, and birdsong, and fresh clean air in every direction. Hillsbrad is unbearable in this weather." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night, finally, and the birds have mostly stopped." },
        { id = "h_innocents", tags = { "news" }, when = { questActive = TODO_QUEST("Blood of Innocents") },
          text = "A toxin to bleed the violence out of goblins. It needs innocent blood, and the Syndicate's shadow mages have been collecting it for me. How generous of them." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Don't touch the bottles, rogue, unless you'd like to find out what's in them by smell, and a few of them are meant to be found out exactly that way." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "You'll want to know whether I've a use for your shards, warlock, and the answer is no, since I've enough trouble keeping Umpi out of my reagents." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Keep your beast away from the table, because most of what's on it would kill it, and the rest would make it wish it had died." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken, standing in my workshop. You must feel something when the Light comes, and I envy that, because the only things I still feel are my work and Umpi." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } },
          text = "You die rather often, {class}, and each time you return a little more stubborn. If you ever care to donate a sample from the next time, I'd be fascinated to compare it with the last." },
      },
      again = {
        { id = "h_again", text = "What else? Not that it matters." },
        { id = "h_again2", text = "Go on; Umpi's listening too, since she has nothing better to do." },
      },
      choices = {
        { text = "Why poison the very land the Horde fights for?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Your plague might do my fighting for me, Lydon.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "What do your poisons do to the spirits of this land?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does the Society ever use magic in its work, Lydon?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "There's a frog staring at me from your bench.", next = "umpi" },
        { text = "What are you working on?", next = "work" },
        { text = "You seem thoroughly miserable.", next = "misery" },
        { text = "Who do you work with?", next = "society" },
        { text = "Your shelves are full of strange reagents.", next = "alch", when = { profession = "Alchemy" } },
        { text = "The Earth Mother would weep at your work.", next = "tauren", when = { race = "Tauren" } },
        { text = "Is there troll's blood in any of those bottles?", next = "troll", when = { race = "Troll" } },
        { text = "Do you miss anything, from before?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I studied in Dalaran before I died.", next = "xmage", when = { race = "Scourge", class = "MAGE" } },
        { text = "Do you make poisons for rogues too, Lydon?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Keep Umpi away from my demon, Lydon. It's been hungry lately.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you test your brews on beasts, Lydon?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Is the Light worth feeling, Lydon, if all it does is burn?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    umpi = {
      lines = { { id = "u_default", text = "Umpi is my frog. She sits there and I test things on her, and she's had a remarkable career, most of it brief." } },
      choices = {
        { text = "Brief?", next = "umpi_brief" },
        { text = "...poor Umpi.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    umpi_brief = {
      lines = {
        { id = "ub_default", text = "I poison her, she dies, and I bring her back, over and over again. She's very forgiving, more so than most of my colleagues." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      big = true,
      lines = {
        { id = "w_default", text = "The Society's work: remedies, officially. Unofficially, the Dark Lady's enemies will one day be very ill and I'll have helped, which is the closest I come to happiness." },
      },
      choices = {
        { text = "Who is it meant for?", next = "plague" },
        { text = "That's grim.", next = "BACK" },
        { text = "For the Dark Lady.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    plague = {
      lines = {
        { id = "pq_default", text = "For the humans, and for the Scourge too. If it were up to me, I'd let them kill each other and save the reagents, but it isn't up to me." },
      },
      choices = {
        { text = "Do you think the plague is right, Lydon?", next = "opn_plague" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    misery = {
      lines = {
        { id = "mi_default", text = "Look out of the window: flowers, clean air, birdsong. Everything here is alive, and it insists on telling me so." },
      },
      choices = {
        { text = "Do you remember being alive?", next = "misery_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    misery_before = {
      lines = {
        { id = "mb_default", text = "I remember liking things, but I can't remember what liking felt like, and that's the part that bores me." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    society = {
      lines = {
        { id = "so_default", text = "Master Apothecary Faranell in the Undercity adds his colloid of decay to my best work, and Apothecary Renferrel at the Sepulcher sends me his findings, which I read in the dark." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alch = {
      lines = {
        { id = "al_default", text = "Mountain lion blood, gray bear tongue, and mudsnout blossom from the gnoll fields at Nethander Stead, and patience, which is the rarest of them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    tauren = {
      lines = {
        { id = "tu_default", text = "Would she? I've never met her, but tell her the clean air here is suffering enough for me, and she may stop weeping." },
      },
      choices = {
        { text = "You're beyond help.", next = "BACK", reply = "So I've been told, mostly by people who meant it. The Earth Mother can take a number.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Clean air never did me much good either.", next = "BACK", reply = "Then we'll suffer together, I suppose. There's a good deal more of it here in the cellar, if you'd like to stay.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = {
        { id = "tl_default", text = "A troll's blood potion, not the blood itself, so don't look so worried; I'd ask first, probably." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "Miss it? No. I know there was something, and I can see where it was, like a stain on the wall where a picture hung." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Not all of it, warrior, but it'll thin the crowd you have to fight. Southshore won't know what's come until it's already in their wells, and then you'll find the work much easier." } },
      choices = {
        { text = "I'd rather beat Southshore with my own two hands.", next = "BACK", reply = "Do it with your hands, then, warrior, and I'll keep my bottles ready for whoever's left standing. There's room for both of us in this war.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then poison them, and I'll finish what's left.", next = "BACK", reply = "That's the spirit. I'll do the quiet part, and you can have all the shouting, which suits us both.", fx = { align = { light = -1 } } },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Then you'll appreciate that I'm doing in a hut what Dalaran did in towers, only with less funding and more fumes. Don't tell me what the city looked like when you left it; I'd rather not have to feel anything about it." } },
      choices = {
        { text = "I won't mention them.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What are you working on?", next = "work" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know a few things, mostly about what hurts and how much. Ask, if you've the stomach for it." },
    },
    new_plague = { { id = "tp_plague", text = "We're close, so very close, and I'd be excited if I still did that.", next = "plague" } },
    syndicate = { { id = "tp_syndicate", text = "Their shadow mages collect innocent blood, and I collect it from them; it's a sort of partnership." } },
    background = { { id = "tp_bg", text = "I'm of the Royal Apothecary Society, and before that I was alive. I think I preferred it, though I can't recall why.", next = "misery" } },
    advice = { { id = "tp_ad", text = "Never test on yourself; use a frog. Frogs complain less, and they come back." } },
    venture_company = { { id = "tp_venture", text = "The Venture Company are goblins in Stonetalon, cutting down everything that grows. I'd almost admire them, if they'd do it quietly." } },
    forsaken = { { id = "tp_forsaken", text = "We are what the plague left behind, and I am what my work has made of me. I feel very little now, except about Umpi, and about my vials." } },
    scourge = { { id = "tp_scourge", text = "The Scourge's plague is crude, and wasteful, and I could do better in an afternoon. That is not a boast, merely a statement of fact." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady funds my work, and I am grateful, insofar as I am anything. I serve her with my vials and my patience." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't much care. Few things interest me, and that isn't one." } },
  },
}

P:NPC {
  key = "shay", id = TODO_NPC("Innkeeper Shay"), name = "Innkeeper Shay",
  bible = "bibles/hillsbrad.md", role = "innkeeper", tier = "service",
  communities = { "tarren_mill" }, temper = { "dry" }, values = { "practical" },
  notices = { "race", "weary" },

  impression = {
    first = "The inn keeps chairs for guests who no longer need to rest.",
    third = "{name} visited the inn at Tarren Mill, kept by Innkeeper Shay, whose guests rarely need to sleep.",
  },

  greetings = {
    { id = "o_sylvanas_distrust", tags = { "news" }, when = { gossip = { topic = "sylvanas", stance = { "distrust", "dangerous" } } },
      text = "High Executor Darthalia mentioned your views on the Dark Lady. Rest here if you like, but I would not sleep too soundly, and I would not sleep near the window." },
    { id = "o_plague_wrong", tags = { "news" }, when = { gossip = { topic = "new_plague", stance = "wrong" } },
      text = "Apothecary Lydon tells everyone you think his plague is an abomination. He sounded almost pleased about it; you may be the first thing that's interested him in a year." },
    { id = "g_inn", text = "Rest here, if you rest. Some of my guests don't need to, but they like the chairs." },
    { id = "g_xbrill", when = { origin = "forsaken_brill_farmer" }, text = "You look out at the fields the way a farmer does, Brill-born, I'd guess. The farms below the Mill grew much the same before the plague, and now the living fight us for every furrow." },
    { id = "g_home", when = { homeInn = { "Tarren Mill" } }, text = "Back at the Mill, then. Your bed's where you left it, and nobody's slept in it, since nobody here sleeps." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and your bed's not been touched, since nobody here sleeps. Do lie in it, if only so it remembers what it's for." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "One of the deathguards came in nearly cheerful after a word with you, which I didn't think was possible any more. Whatever you said, do say it again." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone at the Mill's in a black mood over something you said. I'd sit near the door tonight, though the dead are patient, so it may keep." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of the living, I see. I keep a little food back for your kind, and don't ask where it came from; it's fine, mostly." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "The humans got a few licks in, I see. Sit down and I'll find you something, since we don't get many customers who bleed." },
  },

  start = "hello",
  nodes = {
    dd_battle = {
      lines = { { id = "dd_battle_default", text = "Half the Deathguard in this town bought apples from those farms when they were breathing, and so did I. I don't feel much about it now, which is either the Dark Lady's gift or something worse, and I haven't decided which." } },
      choices = {
        { text = "They'd have burned you without a thought. Don't mourn them.", next = "BACK", reply = "I don't, and that's the trouble. Go on, then; the Deathguard will want to buy you something you can't drink.", fx = { align = { light = -1 } } },
        { text = "It's all right to remember the apples, Shay.", next = "BACK", reply = "Is it? Then I'll remember them, quietly, and you'll keep that between us and the bar.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else, Shay.", next = "BACK" },
      },
    },

    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Most of what's left of us is habit, so I don't see why the Light should be any different. I polish the bar and you pray, and both of us do it because it was done before, and maybe because doing it keeps us from becoming the mindless things outside." } },
      choices = {
        { text = "It's more than habit. The Light answers back.", next = "BACK", reply = "Answers you, does it? Then you're luckier than the rest of us, and I'd keep listening if I were you.", fx = { align = { light = 1 } } },
        { text = "Habit, yes. It keeps me myself, and I'll not apologise for it.", next = "BACK", reply = "No need to apologise in here, love. Everyone in this room is held together by something, and habit's as good a glue as any.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The trees still grow, if that's what you mean, though they've grown strange since the plague, and the birds don't nest in them. I've no strong feelings on it myself, but the bats seem to like it." } },
      choices = {
        { text = "The land will heal, given time and care.", next = "BACK", reply = "Maybe it will, and maybe the birds will come back. I'll keep the windows open on the chance.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Strange is fine. The dead don't need songbirds.", next = "BACK", reply = "That's how I see it too, mostly. The bats are better company than sparrows ever were, and they keep the flies down.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The living ones do, mostly about Southshore, and the dead ones about whatever they did before they died. I've learned to sleep through the shouting, which is easy when you don't actually sleep." } },
      choices = {
        { text = "A warrior should master his fears, not shout at them.", next = "BACK", reply = "Tell them that yourself, warrior, and see how far you get. They've been shouting at this bar since before I died.", fx = { align = { order = 1 } } },
        { text = "Let them rage. Fury kept us alive through worse.", next = "BACK", reply = "It kept me in business, at least. Let them rage, and I'll keep pouring.", fx = { align = { order = -1 } } },
        { text = "Something else, Shay.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The scouts who go down to the Hillsbrad farms, mostly, because the farmers there keep dogs and pitchforks and the Southshore guard is never far off. They come back to my bar complaining that one spell at the right moment would have saved them a long run home." } },
      choices = {
        { text = "Then I'll go down with the scouts, by the High Executor's leave.", next = "BACK", reply = "Ask her nicely and she might give it, though she'll want something burned in return. The scouts will be glad of you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go down alone and do it my own way.", next = "BACK", reply = "Alone, is it? Then I'll keep your stool warm, as warm as anything gets here, and hope you come back to use it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they do, nobody's told me, and I'd be the first to hear, since I hear everything at this bar. The old ones say the mill wheel still turns some nights with no water behind it, but the old ones say a great many things." } },
      choices = {
        { text = "I'll go and listen at the mill, and leave the dead in peace.", next = "BACK", reply = "Then you'll find out if the old ones are right, which nobody else has bothered to do. Mind the wheel, though; it bites.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Restless spirits are useful. I'll set them against Southshore.", next = "BACK", reply = "Useful, maybe, though I'd not want to be the one to ask them. The dead don't take kindly to being told what to do, as I should know.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "All of them, really, since this is Tarren Mill and a Southshore scout could be outside any window. The rogues sit closest to the back door, which I've always considered sensible." } },
      choices = {
        { text = "I'll sit near the back door too. Old habits.", next = "BACK", reply = "Then you'll have good company, and you'll be the first one out if Southshore comes knocking. Sensible people, rogues.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll sit in the open. I've nothing to hide.", next = "BACK", reply = "Brave, or careless, and I can never tell the difference with the living. Sit where you like, then, and I'll keep the back door oiled.", fx = { align = { order = 1 } } },
        { text = "Something else, Shay.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some do, some don't, and some pretend not to so the others won't see. I still light the fire for the living who pass through, and for a few of ours who like to sit by it and remember." } },
      choices = {
        { text = "Keep the fire lit. Memory is worth keeping.", next = "BACK", reply = "I will, then, for as long as I've wood to burn. Someone has to remember, and it may as well be me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead don't need fires. Waste of wood.", next = "BACK", reply = "Waste it may be, but it's my wood and my fire. You're welcome to sit somewhere colder if it offends you.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman under my roof. The last one who stayed asked me to open the windows for the spirits, and I told him the spirits could pay for a room like everyone else." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Some of my guests used to pray before supper, and now they don't eat supper, so the praying stopped too, but you're welcome to start it up again." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "Your imp can stay, warlock, but if it sets fire to my curtains, as somebody's did last month, I'll be charging you for the curtains, and for the screaming." },
        { id = "h_default", text = "I'm Shay, and I keep the inn. When this town was alive someone else did, and the customers complain less now." },
        { id = "h_clean", when = { metBefore = true }, text = "I polished the bar today. Nobody here eats or drinks much anymore, but a clean bar is a clean bar. Habit's what's left." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night's our busy hour, though everyone's always up here, so I've stopped putting the chairs on the tables." },
        { id = "h_skulls", when = { questDone = TODO_QUEST("Souvenirs of Death") }, text = "Deathguard Samsa has hung his skulls on the wall behind my inn, thanks to you. I've asked him to at least line them up straight." },
        { id = "h_krusk", when = { heardLine = "krusk.h_default" }, text = "You've met Krusk, then. He's the only one in town who orders a hot meal, and he eats it with his back to the wall." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll find the inn makes a fine hiding place, since nobody looks twice at the corner tables anymore, and the dead don't gossip much." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. You'll want something warm, I suppose, though warmth is wasted on most of my guests, and I've stopped heating the kettle out of habit." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Leave the axe by the door, if you would, because the last one who brought his into the common room took a chunk out of my good table during a nightmare." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID", faction = "Horde" }, text = "A tauren druid in Tarren Mill. Most of the living find it hard to stay here long, so I'll not take offense if you don't take a room." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, at my bar. I polished it today, and you're welcome to lean on it, though if you start glowing I'll ask you to lean somewhere less shiny." },
        { id = "h_dd_battle", tags = { "news" }, when = { questDone = TODO_QUEST("Battle of Hillsbrad") },
          text = "The Deathguard came in after the Battle of Hillsbrad and said your name more than once, which for this lot is practically a song. The fields south of here have gone very quiet." },
        { id = "h_dd_deaths", when = { deaths = { min = 15 } },
          text = "You've been carried back to the graveyard so often I've started keeping a stool by the door for you. It's not a kindness, mind; it's just that you keep turning up." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've all night, and every night after it." },
        { id = "h_again2", text = "Go on. The bar won't polish itself... well, it might, in this town." },
      },
      choices = {
        { text = "Is there a place to stable a beast in Tarren Mill?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Do the dead of Tarren Mill trouble the spirits here?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who around Tarren Mill could use a spellcaster's help, Shay?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Tarren Mill must have been a pleasant town once.", next = "before" },
        { text = "Who stays here?", next = "guests" },
        { text = "You must miss sleeping.", next = "sleep", when = { race = "Scourge" } },
        { text = "Is there anything here a living body can eat?", next = "food", when = { race = { "Orc", "Tauren", "Troll", "Skyborne" } } },
        { text = "Do you get many visitors who prefer to stay hidden, Shay?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'd guess the Forsaken miss warmth, Shay.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do warriors have nightmares at your inn, Shay?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "The land around Tarren Mill feels half dead.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Is the Light just another habit for the dead, Shay?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Just passing through.", next = "END" },
        { text = "The Hillsbrad farms are quiet now, Shay. How does that sit with you?", next = "dd_battle", when = { questDone = TODO_QUEST("Battle of Hillsbrad") } },
      },
    },
    before = {
      lines = { { id = "b_default", text = "Quiet, the old ones say, with farms, the mill and a fair in summer. They remember all of it, but they don't feel any of it, and that's the strange part." } },
      choices = {
        { text = "Do you remember it?", next = "remember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    remember = {
      lines = { { id = "re_default", text = "I remember it the way you remember a map, where everything was, but I couldn't tell you how it smelled." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guests = {
      lines = {
        { id = "gu_default", text = "Deathguards off watch, apothecaries who forget they don't need to eat, and the living allies, who eat everything. I keep the cellar locked for them." },
      },
      choices = {
        { text = "Who's the strangest?", next = "guests_strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guests_strange = {
      lines = { { id = "gs_default", text = "Lydon's frog, who has a stool of her own by the fire, and a Deathguard called Humbert, who sat in the corner a whole week without his sword. Neither of them tips." } },
      choices = {
        { text = "The frog has a stool?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sleep = {
      big = true,
      lines = { { id = "sl_default", text = "I miss the idea of it, the way you'd miss a room in a house that burned. I lie down some nights anyway and wait for something to happen, and it never does." } },
      choices = {
        { text = "We have no need of it. Better without.", next = "BACK", reply = "Some say that, and I don't argue with them, but I notice they still lie down at night, same as me.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "I'd give much to dream again.", next = "BACK", reply = "So would I, love, so would I. Maybe one night it'll come back, and I'll have something to tell you over the bar.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "There's a stall out back that's been empty since the last owner was eaten, so it's yours if you like. Keep the beast quiet at night, because the guards are jumpy with Southshore so close." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet}? There's a stall out back that's been empty since the last owner was eaten, and it'll suit your friend well enough. Keep it quiet at night, though, because the guards are jumpy with Southshore so close." },
      },
      choices = {
        { text = "I'll keep it quiet. Thank you, Shay.", next = "BACK", reply = "You're welcome, and so is the beast. I'll leave a bucket by the stall, though I've no idea what it eats.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It'll make what noise it likes. Let Southshore hear it.", next = "BACK", reply = "Then I'll warn the guards, and you'll explain it to them when they come running. Mind they don't put an arrow in it.", fx = { align = { honor = -1 } } },
      },
    },
    food = {
      lines = { { id = "fo_default", text = "Bread from the Undercity, a little stale, and whatever the hunters bring in, which I cook the way I remember cooking. I can't taste it, so you'll have to tell me if it's good." } },
      choices = {
        { text = "It's good, Shay.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The dead don't gossip much, but the living who pass through here do. Ask, and I'll tell you what I've overheard." },
    },
    background = { { id = "tp_bg", text = "I keep the inn. What came before that I don't talk about, and nobody here does." } },
    advice = { { id = "tp_ad", text = "Don't sit by the window after dark. Southshore's scouts like windows." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are whatever's left of Lordaeron once you take away the breathing, and my inn serves both kinds. The chairs are very comfortable, though none of my regulars can tell." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady rules from the Undercity, and Tarren Mill is her front against Southshore. She's never visited my inn, and I'd not expect her to." } },
    scourge = { { id = "tp_scourge", text = "The Scourge come down from the north sometimes, and we put them back in the ground. It's a dry business, but someone has to do it." } },
    _none = { { id = "tp_none", text = "Ask the High Executor, or better, don't; she doesn't like questions." } },
  },
}
