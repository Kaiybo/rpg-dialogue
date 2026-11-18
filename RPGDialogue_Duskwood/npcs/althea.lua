-- Commander Althea Ebonlocke, the Night Watch, Darkshire. Voice: bibles/althea.md
-- Holds the town with a militia, adventurers and very little sleep.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "althea", id = TODO_NPC("Commander Althea Ebonlocke"), name = "Commander Althea Ebonlocke",
  prejudice = { class = "ROGUE", amount = 8, why = "A smooth-tongued rogue sold the Watch's payroll and a patrol route to bandits; three watchmen died." },
  rivals = { "ello" },
  bible = "bibles/althea.md", role = "soldier", tier = "major",
  communities = { "darkshire" }, temper = { "steady" }, values = { "brave", "lawful", "stern" },
  notices = { "soldier", "night" },

  impression = {
    first = "She speaks to everyone as if they were already on her roster.",
    third = "{name} reported to Commander Althea Ebonlocke of the Night Watch, sworn to keep the people of Darkshire alive.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "A rogue in Darkshire. My watchmen already jump at shadows, {class}, so keep to the lamplight while you're in town and we'll get along." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You again, and in the lamplight, as I asked. I don't care much for your trade, but I've come to trust the one practising it." },
    { id = "g_op_dead_fel", when = { opinion = { topic = "duskwood_dead", stance = "kill_fel" } }, text = "There's the one who wants Fel dead before we argue about funerals. Have you been up Forlorn Rowe yet, or are you still sharpening?" },
    { id = "g_watch", text = "Night Watch. State your business, {class}, and then make yourself useful." },
    { id = "g_recruit", when = { questDone = TODO_QUEST("The Night Watch") }, text = "You're one of mine now, or near enough, so report." },
    { id = "g_hero", when = { townStanding = { town = "darkshire", min = 55 } }, text = "There's the reason half my watchers are still alive. Sit down, if only for a moment." },
    { id = "g_ladim", when = { questActive = TODO_QUEST("Mor'Ladim") }, text = "If you're going after Mor'Ladim, take friends with you, and I mean that." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the woods haven't got any quieter. Report, then, and tell me what you saw on the road." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come a long way since I first put your name near the roster. I'd trust you with a watch post now, and I trust very few with those." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "One of my watchers says you've been putting the fear into folk in town. They're frightened enough of what's in the woods, so leave that work to the woods." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told someone in Darkshire caught you in a lie. The Watch lives on honest reports, so mind you give me nothing else." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN", "HUNTER" }, minLevel = 20 },
      text = "You'd make a decent watcher. We don't pay, we don't sleep, and the woods want to eat us, so are you interested?" },
    { id = "n_night", cat = "night", when = { timeOfDay = "night" },
      text = "Out after dark, in Duskwood? Either you're very brave or you haven't been here long, so stay in the lamplight." },
  },

  start = "hello",
  nodes = {
    prej = {
      big = true,
      lines = { { id = "prej_default", text = "I trust what I can see, and your trade is built on not being seen. Most of the knives in Duskwood belong to bandits who'd sell a Night Watch patrol to the worgen for a pair of boots, and they learned the same tricks you did." } },
      choices = {
        { text = "Shadows hide me from worgen too. That makes me useful to you.", next = "prej_a", fx = { align = { honor = -1 } } },
        { text = "Then I'll walk openly while I'm in Darkshire.", next = "prej_b", fx = { align = { honor = 1 } } },
        { text = "What happened to make you so wary, Commander?", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "Useful, yes, I suppose you are, and I've never turned down a useful blade. I'll still have Watchmaster Sorigal count the strongbox when you leave." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "That's more than I usually get from your sort. Walk openly, then, and the Watch will treat you as one of its own." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "A man came to us two winters ago with a fine tongue and a rogue's hands, and he sold the payroll and a patrol route to bandits on the Westfall road in the same night. Three of my watchmen died on that road." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    op_dead = {
      lines = {
        { id = "op_dead_a", text = "Now you've found the argument that splits this town down the middle. Some on the council want every body burned before it's cold, while the rest say we're Darkshire, not the Scourge, and we bury our own with the proper words. You've seen what walks out of Raven Hill, so you tell me who's right." },
      },
      choices = {
        { text = "Burn them. A pyre is kinder than waking up in Fel's army.", next = "op_dead_1", fx = { opinion = { duskwood_dead = "burn", necromancy = "fight_hard" }, align = { light = -1 }, trait = { practical = 1 }, affinity = 1 } },
        { text = "Bury them with the rites. Fel doesn't get to take that too.", next = "op_dead_2", fx = { opinion = { duskwood_dead = "bury", the_light = "faith" }, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Neither works while Fel lives. Kill the necromancer first.", next = "op_dead_3", fx = { opinion = { duskwood_dead = "kill_fel", necromancy = "fight_hard" }, trait = { brave = 1 }, affinity = 2 } },
        { text = "I saw Lordaeron's dead rise. Burn them, every one.", next = "op_dead_4", when = { origin = "human_lordaeron_refugee" }, fx = { opinion = { duskwood_dead = "burn", scourge = "hate" }, affinity = 1 } },
        { text = "That's for the families to decide, Commander.", next = "BACK" },
      },
    },
    op_dead_1 = {
      lines = { { id = "op_dead_r1", text = "That's my vote, though I'd not say so in front of the widows. I've put down too many watchers who used to be watchers, and I'll not do it to the same man twice." } },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },
    op_dead_2 = {
      lines = { { id = "op_dead_r2", text = "That's what the burying side says, and I can't say it's wrong, only that it's harder on my watchers. Go and say it at Raven Hill, then, and see if the graves agree." } },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },
    op_dead_3 = {
      lines = { { id = "op_dead_r3", text = "Now that's an answer I can act on. Sven Yorgen, out at his camp in the western woods, has been saying the same for years; go and find him, and then go up Forlorn Rowe with a good blade." } },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },
    op_dead_4 = {
      lines = { { id = "op_dead_r4", text = "Then you know better than any of us what Fel is building up there. I'll tell the council a northerner said it, and for once they might listen." } },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },
    xcl_scholo = {
      big = true,
      lines = { { id = "xcl_scholo_default", text = "Good, though schools outlive their masters, and every necromancer who passed through that place is still out there with what he learned. Men like Morbent Fel don't find their trade in a book lying in a ditch, and I'd wager the road from Raven Hill runs north to Caer Darrow sooner or later." } },
      choices = {
        { text = "Burn every book they left. Necromancy has no place among the living.", next = "BACK", reply = "Burn them, and gladly, though I'd want a watchman standing over the fire to make sure the ash stays ash. I've seen too much come back up out of Raven Hill.", fx = { align = { light = 1 } } },
        { text = "Study their books instead. You can't fight what you don't understand.", next = "BACK", reply = "Understand them, and then what, become them? I'll leave the reading to someone with a stronger stomach and a smaller conscience.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "How do your watchers fight the dead, Commander?", next = "xcl_scholo2" },
      },
    },
    xcl_scholo2 = {
      lines = { { id = "xcl_scholo2_default", text = "With fire and steel, and lanterns at every crossroads, because the dead are slow and stupid until somebody clever stands behind them. Kill the clever one and the rest fall down, and that's the only lesson my watchers ever need to learn." } },
      choices = {
        { text = "Then I'll go after the clever ones, Commander.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Listen. My watchmen hear too late, and the dead don't make much noise until they're on you. If your spirits can give us a moment's warning, that's worth a dozen swords." } },
      choices = {
        { text = "Put me on the roster, Commander. I'll keep the watch properly.", next = "BACK", reply = "You're on it, then, from dusk tonight. Keep your eyes on the cemetery road and your ears on whatever you listen to.", fx = { align = { order = 1 } } },
        { text = "I'll listen my own way and report when I choose.", next = "BACK", reply = "Then you'll report to me all the same, whatever you choose, because this is my town. I don't keep anyone who doesn't.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "My watch is loud because the wolves hear us coming and some of them run, {class}, and that's saved more lives than any blade. But a quiet pair of eyes out past the Darkened Bank? I'd take that, gladly." } },
      choices = {
        { text = "I'll scout and strike before they see me.", next = "BACK", reply = "Strike if you must, but make it quick and make it quiet, and come back to tell me. Dead heroes don't help my roster.", fx = { align = { honor = -1 } } },
        { text = "I'll scout and report, and leave the fighting to your watch.", next = "BACK", reply = "Good, that's exactly what I need. My watchmen will be glad of fewer surprises in the dark.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What's out in the woods?", next = "woods" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Wards cost silver and mages, and Stormwind sends me neither, so we make do with lamps and loud men. If you can light a lamp that won't go out when the fog rolls in, I'll take that over any ward." } },
      choices = {
        { text = "Lamps and good order, then. I'll help.", next = "BACK", reply = "Then you're more useful than half the mages Stormwind's ever promised me. Report to the south gate at dusk, and bring your own oil, because Stormwind never sends any.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your watch needs fire, not lamps.", next = "BACK", reply = "Fire is what the fog swallows first, mage, and then my men are blind and burnt. Lamps and order, or nothing at all.", fx = { align = { order = -1 } } },
        { text = "What's the worst thing your watch faces?", next = "morladim" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "The Scythe of Elune broke something here when the Worgen came, and the undead from Raven Hill have done the rest. I am a soldier; I can only hold the line. If there is a cure, it will come from your Circle, not my Watch." } },
      choices = {
        { text = "Then I'll find what poisoned it and root it out.", next = "BACK", reply = "Then the Watch will hold the line while you look. Find it soon, druid, because the line isn't as long as it used to be.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some wounds are better burned clean than healed.", next = "BACK", reply = "Burned clean, you say, and a forest full of farms and graves along with it. I'll keep my line, and you keep your torches out of Duskwood.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Your armour in front of my farmers when the dead come up the cemetery road, and the Light at your back so they've something worth standing behind. I can't give you a title or a wage, only a post at the gate and my thanks." } },
      choices = {
        { text = "Give me the post. I don't need a title to do my duty.", next = "BACK", reply = "Then it's yours, and the gate is the worst one in the town. Thank you, paladin, and I don't say that lightly.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Duty's one thing, Commander. I'll want proper pay for it.", next = "BACK", reply = "Then you'll be waiting a long time, because Stormwind pays me in letters. If you stay anyway, I'll not forget it.", fx = { align = { honor = -1 } } },
        { text = "Let's talk of something else, Commander.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_scholo", tags = { "news" }, when = { cleared = "Scholomance" },
          text = "My watchers tell me you've come back from the Scholomance, the school in Caer Darrow where the Scourge teaches men to raise the dead. If you learned anything there about how they do it, I'd like to hear it before the next night on Raven Hill." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "I hear the mayor has found a new admirer for his letters. Write all you like, but when the worgen come over the wall, it will be farmers with pikes who answer them." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "Ello was sour with you, I hear. Don't let it trouble you; he'd be sour with Lothar himself if the man didn't write back in triplicate." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Stormwind hasn't sent me one of you in years, so I'll not ask who did; I'll just put you to work." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid. Good. This forest was green once, and I'd like to hear from someone who can tell me if it can be again." },
        { id = "h_default", text = "I'm Commander Ebonlocke of the Night Watch. We're sworn to keep Darkshire's people alive, and some nights that's the whole of the oath, and plenty." },
        { id = "h_watch", tags = { "news" }, when = { questActive = TODO_QUEST("The Night Watch") },
          text = "The dead don't stay in the cemeteries out here, so thin them for me. Every skeleton you put down is one less at our gate." },
        { id = "h_watch_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Night Watch"), days = 3 } },
          text = "My watchers slept a full night, and two of them didn't know what to do with themselves." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "The Stalvan business is an old murder of some visiting nobles, years ago. Smitts never let it go, and now it seems neither will you, so follow it to the end." },
        { id = "h_morgan", when = { questActive = TODO_QUEST("Morgan Ladimore") },
          text = "Sirra Von'Indi sent you with a name, did he? Ladimore. Most of us stopped using it; we call what's left of him Mor'Ladim, when we call him anything at all." },
        { id = "h_ladim", tags = { "news" }, when = { questActive = TODO_QUEST("Mor'Ladim") },
          text = "Mor'Ladim walks the cemetery in a slow, crooked circle and always ends at his own grave. He's killed some of my strongest, so don't go alone." },
        { id = "h_ello", text = "The mayor writes to Stormwind while I train farmers to hold a pike. One of us will save this town, and it won't be the letters." },
        { id = "h_new", when = { maxLevel = 22 },
          text = "You're green for Duskwood. Keep to the road, keep a torch lit, and don't follow lights into the trees." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Can your people see through this fog any better than mine? No? Then you're as welcome as anyone else holding a sword." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, good. My watchers bleed, and all I have for them is bandages and bad jokes, so stay a night if you can stand the howling." },
        { id = "h_roll", when = { metBefore = true }, text = "We lost no one last night. Write that down somewhere, because it doesn't happen often enough." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Good, it's you. My watchers stand a little straighter when you're in town, and I'll take every bit of that I can get." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I'll put you on the watch roster like everyone else, but tell me first: can your spirits see the things in the trees before they reach my men?" },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it, because the lamps won't light themselves." },
        { id = "h_again2", text = "Go on. I've a shift change in an hour and nothing better to do until then." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask, then, and keep half an eye on the gate while you do." },
      },
      choices = {
        { text = "You don't trust rogues, Commander.", next = "prej", when = { prejudiced = true } },
        { text = "Can Duskwood still be healed?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What's out in the woods?", next = "woods" },
        { text = "I'd like to help the Watch.", next = "help" },
        { text = "Your watchers don't look like soldiers.", next = "watchers" },
        { text = "Who's been killing your watchers on patrol?", next = "morladim" },
        { text = "You and the mayor are kin?", next = "ello" },
        { text = "Let me tend your wounded watchers.", next = "priest", when = { class = "PRIEST" } },
        { text = "Did Stalvan Mistmantle murder those nobles, Commander?", next = "stalvan", when = { topicKnown = "stalvan" } },
        { text = "That stitched thing on the road...", next = "stitches", when = { questDone = TODO_QUEST("Translation to Ello") } },
        { text = "Put me on the roster, Commander. I'll stand a night watch.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I've been tracking the wolves out past the lamps.", next = "hunter", when = { class = "HUNTER" } },
        { text = "You're staring at me, Commander. Say it.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Your watch is loud, Commander. I could scout ahead of them.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A few wards around Darkshire would help your watch.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does the Night Watch need from a paladin, Commander?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you have a shaman do for the Night Watch, Commander?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Gandling is dead, Commander. The Scholomance has lost its headmaster.", next = "xcl_scholo", when = { cleared = "Scholomance" } },
        { text = "I stood your wall before the Cathedral took me, Commander.", next = "xorig_nightwatch", when = { origin = "human_darkshire_watch" } },
        { text = "I'll keep to the lamplight.", next = "END" },
      },
    },
    xorig_nightwatch = {
      lines = {
        { id = "xonightwatch_default", text = "I remember. You were the one who'd swing a hammer with the torch still lit in your other hand, and Watcher Ladimore swore you'd burn the gatehouse down before you ever hit a ghoul. Now you come back wearing the Light, so tell me, will you stand a night with us again?" },
      },
      choices = {
        { text = "Any night you need me, Commander.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } },
        { text = "I've other oaths now, but I'll do what I can.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    woods = {
      big = true,
      lines = {
        { id = "w_default", text = "Worgen, the walking dead, and ogres down from the pass. Then there's the fog, which isn't a creature but behaves like one, so pick your poison." },
      },
      choices = {
        { text = "I'll take them all.", next = "BACK", fx = { trait = { brave = 1 }, affinity = 1, learn = { "worgen" } } },
        { text = "I don't know how anyone lives like this.", next = "live" },
        { text = "Where do the dead come from?", next = "woods_dead" },
      },
    },
    live = {
      lines = { { id = "l_default", text = "Badly, and together, and with more lamp oil than the council ever budgeted for." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    woods_dead = {
      lines = {
        { id = "wd_default", text = "From the cemeteries, and Raven Hill's has swallowed the village it served. The scouts say something in a house above it keeps the dead walking, and that it's a man, not a monster." },
      },
      choices = {
        { text = "Who is he?", next = "woods_fel" },
        { text = "Something else.", next = "BACK", fx = { learn = { "raven_hill" } } },
      },
    },
    woods_fel = {
      lines = {
        { id = "wf_default", text = "Morbent Fel, a necromancer on Forlorn Rowe, above the graves. Sven Yorgen, out by the western river, has made him the whole of his life, so ask Sven.",
          fx = { learn = { "morbent_fel" } } },
      },
      choices = {
        { text = "Could Darkshire burn its dead, so Fel can't raise them?", next = "op_dead" },
        { text = "Then I'll leave Fel to Sven, for now.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    help = {
      lines = {
        { id = "hp_default", text = "Talk to my watchers at the posts, because they know what needs killing this week. It changes every week, and the list hasn't once got shorter." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { learn = { "night_watch" }, standing = { darkshire = 1 } } },
        { text = "What needs killing this week?", next = "help_week" },
      },
    },
    help_week = {
      lines = {
        { id = "hw_default", text = "Skeletons in Tranquil Gardens, south of town. Live through that and there's Raven Hill's graveyard, and if you live through that, I'll find you something worse." },
      },
      choices = {
        { text = "You make it sound inviting.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Point me at them.", next = "BUSINESS", fx = { affinity = 1, standing = { darkshire = 1 } } },
      },
    },

    watchers = {
      lines = {
        { id = "wa_default", text = "Farmers, bakers, a tanner, and two brothers who never agree on anything. Stormwind pulled its guards out, so we trained our own, and they're good." },
      },
      choices = {
        { text = "I'd guess the pay is poor.", next = "watchers_pay" },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    watchers_pay = {
      lines = {
        { id = "wp_default", text = "In lamp oil and gratitude. The council gives what it has, which is the lamp oil, and the gratitude is mine." },
      },
      choices = {
        { text = "They're lucky to have you.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's a hard way to keep an army.", next = "BACK", fx = { opinion = { stormwind = "abandoned_its_own" } } },
        { text = "How many names have you lost this year, Commander?", tag = "Persuade", next = "watchers_names",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PRIEST", "WARRIOR" } }, { townStanding = { town = "darkshire", min = 30 } } } } },
          fail = { next = "watchers_roster", fx = { affinity = -1 } } },
      },
    },

    morladim = {
      big = true,
      lines = {
        { id = "ml_default", text = "He's a dead knight who won't lie down. He walks Raven Hill's cemetery and kills my watchers on patrol, some of my strongest among them, and I'd like him gone." },
      },
      choices = {
        { text = "Who was he, alive?", next = "morladim_who" },
        { text = "Then he needs putting down.", next = "BACK", fx = { trait = { brave = 1 }, affinity = 1 } },
      },
    },
    morladim_who = {
      lines = {
        { id = "mw_default", text = "Morgan Ladimore. Sirra Von'Indi, our historian, knew him before the war and keeps the whole sorry tale on a shelf, so read it, then come back and ask me for the hard part.",
          fx = { learn = { "ladimore" } } },
      },
      choices = {
        { text = "Does it make him easier to kill, knowing?", next = "morladim_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morladim_know = {
      lines = {
        { id = "mk_default", text = "No, it always makes it harder, but know it anyway. Watchers who go in ignorant end up swinging at shadows, and he's no shadow." },
      },
      choices = {
        { text = "I understand.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ello = {
      lines = {
        { id = "el_default", text = "Kin, yes. He talks to Stormwind and I talk to the dead, mostly with a pike, and we each think the other is wasting their time. We're both right." },
      },
      choices = {
        { text = "I'd wager he knows you think that.", next = "ello_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ello_know = {
      lines = {
        { id = "ek_default", text = "He's a politician, so he knows exactly what everyone thinks, and he writes the letters anyway. I respect that more than I'd ever tell him." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", reply = "Good, because if he ever heard me say it, he'd never let me hear the end of it. Keep it that way.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll make no promises; he might like to hear it.", next = "BACK", reply = "Don't you dare, unless you want to stand the dawn watch for a month. He's insufferable enough as it is.", fx = { align = { honor = -1 } } },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Then you're welcome here. The ones back from Raven Hill don't sleep, and some of them ask whether the dead up there feel anything. I've no answer for them, but you might." },
      },
      choices = {
        { text = "I'll sit with them tonight.", next = "BACK", reply = "Thank you, truly, because they've had nobody but me, and I've run out of things to say to them. Bring a candle, for the dark seems to sit heavier on them after midnight.", fx = { affinity = 3, standing = { darkshire = 2 }, align = { light = 1 } },
          journal = { first = "Sat a night with the Night Watch's wounded in Darkshire, at Commander Ebonlocke's welcome.",
                      third = "{name} sat a night with the Night Watch's wounded in Darkshire." } },
        { text = "The dead feel nothing now, and they should hear that plainly.", next = "BACK", reply = "Then tell them, priest, and tell them kindly, because it'll be the first plain answer they've had. Some of them might sleep.", fx = { align = { light = -1 } } },
        { text = "What do I tell them?", next = "priest_answer" },
      },
    },
    priest_answer = {
      lines = {
        { id = "pa_default", text = "Tell them whatever's true, because they'll know if it isn't. Watchers can smell a lie; Stormwind's been feeding them comfortable ones for years." },
      },
      choices = {
        { text = "Then they'll get the truth.", next = "BACK", reply = "Good, and they'll thank you for it in their own way, which is mostly silence. Watchers don't say much anymore.", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Sometimes a kind lie is what lets a man sleep.", next = "BACK", reply = "It might, for a night, and then it'd cost him every night after. Tell them the truth, priest, or tell them nothing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stalvan = {
      lines = {
        { id = "st_default", text = "I've had my eye on that tutor for years, but proof's the trouble. Smitts has pages and Daltry has the town's signatures, so lay them side by side and I'll do the rest." },
      },
      choices = {
        { text = "And if they match?", next = "stalvan_match" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stalvan_match = {
      lines = {
        { id = "sm_default", text = "Then someone walks up to that manor north of town with a sword and my order. I'd go myself, but Darkshire won't let me leave the gate." },
      },
      choices = {
        { text = "Send me.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, learn = { "stalvan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stitches = {
      big = true,
      lines = {
        { id = "sc_default", text = "It came down the road from Raven Hill bellowing for Darkshire and went through two of my camps. Don't tell me who made it, because I already know." },
      },
      choices = {
        { text = "I fetched his supplies. I didn't know.", next = "stitches_guilt" },
        { text = "It's done now.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    stitches_guilt = {
      lines = {
        { id = "sg_default", text = "Nobody did, because old Abercrombie was sweet to half this town. Next time a hermit wants thread, ask him what he's sewing." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 }, learn = { "embalmer" } } } },
    },
    watchers_names = {
      big = true,
      lines = {
        { id = "wn_default", text = "Nine since the thaw, and I can name each one and where they fell, because I'm the one who knocks on the door afterwards. I don't let the council do it; they make speeches." },
        { id = "wn_after", text = "I keep the roster with the dead names still on it, crossed through but not scratched out. Ello thinks it's morbid, and maybe it is, but I'll not have anyone in this town forget they stood a watch." },
        { id = "wn_priest", when = { class = "PRIEST" }, text = "If you're staying the night, there are two mothers on the Raven Hill road who'd take a priest at the door better than they took me. I'd count it a kindness." },
      },
      choices = {
        { text = "They won't be forgotten.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then let's keep the tenth off that list.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    watchers_roster = {
      lines = {
        { id = "wr_default", text = "Enough that I don't talk about it with strangers on the road. Ask me how to keep the rest alive instead; that's the question I can use." },
        { id = "wr_default2", text = "The roster's my business, and the Watch's. The count stays with me." },
      },
      choices = {
        { text = "Fair, Commander.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "cw_default", text = "Careful what you offer; I've had volunteers last one night and leave on the morning cart. The Watch stands from dusk to dawn, and the dawn is the worst of it, because that's when you start to believe you've made it." },
        { id = "cw_dwarf", when = { race = "Dwarf" },
          text = "A dwarf on my roster would steady the young ones, since they think anything short and armoured is too stubborn to die. Stand from dusk to dawn, and don't let them see you yawn." },
      },
      choices = {
        { text = "I'd have thought dawn was the safest hour.", next = "warrior_dawn" },
        { text = "Orders are orders. Tell me where to stand.", next = "BACK", reply = "Good, that's what I like to hear from a warrior. The south gate at dusk, and don't leave it till I send someone.", fx = { affinity = 2, align = { order = 1 }, standing = { darkshire = 1 } } },
        { text = "I'd rather hunt them in the woods than wait at a wall.", next = "BACK", reply = "Then go and hunt them, but don't come running back to the wall when the woods hunt you. Plenty have.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    warrior_dawn = {
      lines = { { id = "cwd_default", text = "Everyone thinks so, and the worgen know it too. We lost two watchers last spring in the grey hour, men who'd lowered their shields because the sky was turning pink." } },
      choices = {
        { text = "I'll keep my shield up.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", fx = { learn = { "worgen" } },
          text = "Then you've learned the first lesson faster than my watchers did: the grey wolves are hungry and the worgen are clever, and you can't track one the way you track the other. What did you find?" },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "Then you've learned faster than my watchers did: the grey wolves are hungry and the worgen are clever, and you can't track one like the other. Keep {pet} on a short leash past the lamps, though, because the worgen have been known to call a beast away from its master." },
      },
      choices = {
        { text = "Prints that walk on two legs, then four.", next = "hunter_prints" },
        { text = "Nothing yet, Commander. I'll go deeper in.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    hunter_prints = {
      lines = { { id = "chp_default", text = "Then you've been near Brightwood Grove or the old mill road, and you were lucky to come back. Mark the place on Daltry's map, and don't go there again alone." } },
      choices = {
        { text = "I'll mark it.", next = "BACK", fx = { affinity = 1, standing = { darkshire = 1 } } },
        { text = "Alone is how I hunt.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", fx = { learn = { "morbent_fel" } },
          text = "You want to know why I'm staring? Morbent Fel walks the hills with the dead at his back, and the last stranger who came to Darkshire with a voice like yours asked a lot of questions about him. So I'm staring, and I'll keep staring until you've given me a reason to stop." },
      },
      choices = {
        { text = "I'll give you that reason. Point me at Fel.", next = "BACK", reply = "Follow his dead, because where they walk thickest, he isn't far behind. Bring me word he's finished, and I'll stop staring.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Stare all you like. I don't answer to the Watch.", next = "BACK", reply = "You don't, and that's exactly why I'm watching you. In my town, strangers who don't answer to the Watch end up answering to me.", fx = { affinity = -2, align = { order = -1 } } },
        { text = "Who was the stranger?", next = "warlock_stranger" },
      },
    },
    warlock_stranger = {
      lines = { { id = "ws_default", text = "Nobody gave a name, which is the point. Smitts poured for him three nights running, and on the fourth there were Dark Riders on the Raven Hill road for the first time in a year." } },
      choices = {
        { text = "I'm not him.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "My watchers bring me every report from the woods, and none of them are pleasant. Ask me about any of this, and I'll tell you plainly." },
    },
    background = { { id = "tp_bg", text = "I command the Night Watch. I don't have a story so much as a roster, and every name on it matters more than mine." } },
    advice = { { id = "tp_ad", text = "Keep to the roads by day and the lamps by night, and never follow a light into the trees, whoever seems to be holding it." } },
    night_watch = { { id = "tp_watch", text = "Volunteers, mostly: farmers, bakers, and a tanner who swears he's killed forty ghouls, though he's killed six." } },
    worgen = { { id = "tp_worgen", text = "Don't ask me where they came from; ask how many there are, because that's the useful question." } },
    stalvan = { { id = "tp_stalvan", text = "A tutor who killed the girl he taught and the man she was to marry, and maybe more besides. That's the short version, and the long one keeps Smitts up at night." } },
    westfall = { { id = "tp_westfall", text = "Stoutmantle runs a militia too. I'd like to meet him some day and compare notes on being forgotten." } },
    ladimore = {
      { id = "tp_ladimore_next", text = "Mor'Ladim is my watchers' worst night, most weeks. Ask me what you want to know.", next = "morladim" },
      { id = "tp_ladimore", text = "He was one of ours once, a knight of this town, and now he's the thing my patrols walk around." },
    },
    morbent_fel = { { id = "tp_morbent", text = "He's a necromancer up on Forlorn Rowe. The dead he raises are my watchers' business, but the man himself is Sven Yorgen's." } },
    embalmer = { { id = "tp_embalmer", text = "That was a children's story until it walked down my road, and I've doubled the lamps on the Raven Hill side since." } },
    _none = { { id = "tp_none", text = "That's not a Watch matter, and if it ever becomes one, it'll find me." } },
    raven_hill = { { id = "tp_raven_hill", text = "Raven Hill's cemetery has more walking dead than buried ones now, and I can't spare the Watch to hold it. I send adventurers, and I count them when they come back." } },
    dark_riders = { { id = "tp_dark_riders", text = "The Dark Riders come out of Deadwind Pass and go wherever they like, and my watchers have yet to catch one. Somebody sends them, and I mean to learn who before the year's out." } },
    scourge = { { id = "tp_scourge", text = "The dead in Duskwood aren't the Scourge's, as far as anyone can tell; they're our own, and somebody is raising them here. I'd almost sooner it were the Scourge, because then Stormwind might send an army." } },
    varian = { { id = "tp_varian", text = "Lord Ello writes to the Crown every week asking for soldiers, and the answer is always that the army is stretched. With the king gone, I doubt anybody in the Keep is reading those letters at all." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord is a good soldier, and I believe he'd help us if he could. I also believe somebody between him and Darkshire is making sure he can't." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor is said to advise the Highlord on everything, and Darkshire has had nothing from the Keep since she came to court. I'll draw no conclusions; a commander doesn't, not out loud." } },
    holy_light = { { id = "tp_holy_light", text = "Half my watchers pray to the Light before every patrol and the other half pray during it. I don't stop either kind." } },
    green_dragons = { { id = "tp_green_dragons", text = "Hunters near Twilight Grove swear there are great green dragons sleeping among the trees, and I've no reason to doubt them. So long as they keep sleeping, they aren't my concern." } },
    second_war = { { id = "tp_second_war", text = "The Watch is mostly farmers and their sons, and the few veterans among them fought orcs in the Second War. They all say the same thing: they'd rather face orcs than what's in our woods." } },
  },
}
