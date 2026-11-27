-- Fray Island, off the Barrens coast south of Ratchet: Klannoc Macleod's fighting grate and Twiggy Flathead's book. Voices: bibles/<key>.md
-- Neutral ground: warriors of both factions come here to be tested, never on the same day.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "klannoc", id = TODO_NPC("Klannoc Macleod"), name = "Klannoc Macleod",
  bible = "bibles/klannoc.md", role = "questgiver", tier = "quest",
  temper = { "gruff" }, values = { "proud", "honest" },
  notices = { "class", "kit" },
  impression = {
    first = "He asked why I fight and seemed to care about the answer.",
    third = "{name} met Klannoc Macleod, who tests warriors on the fighting grate of Fray Island off the Barrens coast.",
  },

  greetings = {
    { id = "g_island", text = "Fray Island. If you came for the view, the boat leaves when the tide turns." },
    { id = "g_affray", when = { questActive = TODO_QUEST("The Affray") }, text = "The grate's waiting, and so are the challengers. Step on when you're ready, and not before." },
    { id = "g_won", when = { questDone = TODO_QUEST("The Affray") }, text = "You walked off my grate on your own feet. Most don't, so I remember the ones who do." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've hardened since you first stood on my island. I can see it in how you carry the blade." },
    { id = "g_windwatcher", when = { questActive = TODO_QUEST("The Windwatcher") }, text = "Still here? Bath'rah's a long way north, in the Alterac hills, and he's been waiting for a champion longer than you've been alive." },
    { id = "g_harlan_others", when = { class = "WARRIOR", thread = { id = "war_harlan", state = "resolved" } }, text = "There's the one who fights for the people behind them. The grate's open whenever you want it." },
    { id = "g_harlan_good", when = { class = "WARRIOR", thread = { id = "war_harlan", state = "soured" } }, text = "Back again, and still good at it, I see. I hope you've found something worth the fighting since we spoke." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You stand like somebody who was taught to, which is a start. The challengers will teach you the rest, and they're not gentle about it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Go out on that grate in that armor and you'll be fighting in your skin by the third challenger. Get it mended in Ratchet first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Klannoc Macleod. This is Fray Island, and the only thing that happens here is fighting, so if you came for anything else, you've wasted a boat ride. Warriors come to me to find out whether they're as good as their trainers told them." },
        { id = "h_before", when = { class = "WARRIOR", questBefore = TODO_QUEST("The Affray") },
          text = "Your trainer sent you, I expect, because they think you're ready to be tested by someone who isn't on your side. On my grate you'll face challengers one after another, and Big Will last of all." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Affray"), days = 3 } },
          text = "You beat Big Will! I've watched a lot of warriors walk onto that grate, and most of them were carried off it, so hold your head up, {name}." },
        { id = "h_islander", tags = { "news" }, when = { questActive = TODO_QUEST("The Islander") },
          text = "Your trainer's sent you across the water, then, and you found the island without drowning, which is the first test and the easiest. Sit a moment, and I'll tell you what the rest of it is." },
        { id = "h_young", when = { class = "WARRIOR", maxLevel = 27 },
          text = "You're keen, I'll give you that, but you're green yet, and the challengers would make a meal of you. Come back when you've thirty winters of fighting behind you, and we'll talk about the grate." },
        { id = "h_orcwar", when = { class = "WARRIOR", race = "Orc" },
          text = "An orc warrior on my island. I fought against your people in the Second War and beside a few of them for pay since, so I know exactly how hard you hit, and so will Big Will." },
        { id = "h_taurwar", when = { class = "WARRIOR", race = "Tauren" },
          text = "A tauren warrior! The crowd will love you, and Twiggy will shorten your odds the moment you step off the boat, so don't let it go to your head." },
        { id = "h_deadwar", when = { class = "WARRIOR", race = "Scourge" },
          text = "One of the Forsaken. I won't pretend you don't make my skin crawl, but I've never cared what a fighter is, only how he fights, so the grate will judge you like anyone else." },
        { id = "h_trollwar", when = { class = "WARRIOR", race = "Troll" },
          text = "A troll on Fray Island, grinning like he's already won. The Darkspear I've seen fight are fast and mean, and I'll be interested to see if the grate takes the grin off you." },
        { id = "h_affray_done", when = { class = "WARRIOR", questDone = TODO_QUEST("The Affray") },
          text = "You've the berserker's stance now, and you won it here, which nobody can take from you. If you want a weapon to go with it, I know a troll in the north who'll make you one, if you'll fight a storm for it." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
          text = "A spellcaster on Fray Island. We don't get many of your kind, because the challengers here don't wait for you to finish chanting, but you're welcome to watch from the rail." },
      },
      again = {
        { id = "h_again", text = "What else? The tide waits for nobody, and neither do I." },
        { id = "h_again2", text = "Ask, then. Twiggy's warming up the crowd, so we've a little time." },
      },
      choices = {
        { text = "Why fight out here on an island?", next = "island" },
        { text = "Who's the last fight on this island?", next = "will" },
        { text = "Who's the goblin shouting by the grate?", next = "twiggy" },
        { text = "So Horde and Alliance both fight here.", next = "factions" },
        { text = "I'm a warrior, Klannoc. Put me to the test.", next = "test", when = { class = "WARRIOR" } },
        { text = "What does winning here teach me?", next = "w_berserk", when = { class = "WARRIOR", minLevel = 26 } },
        { text = "Tell me about this troll in the north.", next = "w_windwatcher", when = { class = "WARRIOR", questDone = TODO_QUEST("The Affray") } },
        { text = "I'm ready for the grate.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Bath'rah says Harlan went north to find something worth his axe.", next = "harlan_end",
          when = { class = "WARRIOR", thread = { id = "war_harlan", beat = "b3_bathrah", state = "unfolding" } } },
        { text = "I'll leave you to it, Klannoc.", next = "END" },
      },
    },
    harlan_end = {
      big = true,
      narr = "He looks past you, out over the rail toward the open sea.",
      lines = { { id = "harlan_end_default", key = true,
        text = "Then he's still looking, or he's dead, and I'd bet on the second. I asked him why he fought and he had no answer but the fighting itself, so I'll ask you the same and hope you've done better: why do you fight?" } },
      again = { { id = "harlan_end_again", text = "You've answered me already, and I remember answers." } },
      choices = {
        { text = "For the people standing behind me. That's the whole of it.", next = "harlan_others",
          fx = { thread = { id = "war_harlan", state = "resolved" }, align = { order = 1 }, affinity = 1 },
          journal = { first = "I told Klannoc I fight for the people behind me. Harlan Vey never had an answer like that.", third = "{name} told Klannoc Macleod that {name} fought for the people behind them." } },
        { text = "Because I'm good at it, the same as Harlan was.", next = "harlan_good",
          fx = { thread = { id = "war_harlan", state = "soured" }, align = { order = -1 } },
          journal = { first = "I told Klannoc I fight because I'm good at it. He said that's what Harlan said.", third = "{name} told Klannoc Macleod that {name} fought because {name} was good at it." } },
        { text = "I'm still working that out, Klannoc.", next = "BACK" },
      },
    },
    harlan_others = {
      lines = { { id = "harlan_others_default",
        text = "That's an answer a warrior can stand on when the fighting's done, and Harlan never had one. Come back to my grate whenever you like, because I'd like to see what somebody with a reason does on it." } },
      choices = { { text = "Something else.", next = "BACK" }, { text = "I'll be back, Klannoc.", next = "END" } },
    },
    harlan_good = {
      lines = { { id = "harlan_good_default",
        text = "That's what he said, near enough word for word, and he said it smiling. I'll keep an eye on the sea for you, then, the way I still keep one on it for him." } },
      choices = { { text = "Something else.", next = "BACK" }, { text = "I'll go.", next = "END" } },
    },
    island = {
      lines = { { id = "is_default", text = "Because nobody bothers us out here, and nobody can run. An island tells you the truth about a fighter, because the only way off is through the challengers or into the sea." } },
      choices = {
        { text = "Someone must have tried swimming for it.", next = "island2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    island2 = {
      lines = { { id = "is2_default", text = "Three that I know of. Two made it back to Ratchet, and the third we don't talk about, because the sharks off this coast are bigger than any challenger I've got." } },
      choices = { { text = "Something else, Klannoc.", next = "BACK" } },
    },
    will = {
      lines = { { id = "wi_default", text = "Big Will is the last fight and the worst, a brute who's been on this island longer than I have and won't leave it. Nobody's sure what he was before he came here, but he hits like a falling wall and he enjoys it." } },
      choices = {
        { text = "How do I beat him?", next = "will2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    will2 = {
      lines = {
        { id = "wi2_default", text = "Don't stand in front of him, and don't trade blows while he's fresh. Wear him down and make him chase you round the grate, because a big man who's tired is just a heavy one." },
        { id = "wi2_tauren", when = { race = "Tauren" }, text = "You're one of the few who could stand toe to toe with him, but don't, because he's counting on it. Wear him down first, and then put him on his back." },
      },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } } },
    },
    w_berserk = {
      lines = {
        { id = "wb_default", text = "The berserker's stance, if you win, which means fighting with your guard thrown away and your rage running hot. Most trainers teach warriors to hold the rage in; I teach them to let it out on purpose, and then to put it back." },
        { id = "wb_done", when = { questDone = TODO_QUEST("The Affray") }, text = "You learned it already, out on my grate with Big Will's fists coming at you. Now learn when not to use it, because the berserker who can't step back out of the rage dies the first time he's outnumbered." },
      },
      choices = {
        { text = "Rage on purpose sounds like the old Horde's mistake.", next = "w_berserk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_berserk2 = {
      big = true,
      lines = {
        { id = "wb2_default", text = "The old Horde's rage was poured into them by demons, and they couldn't put it down. Rage you choose, and put down when you're done, is just another stance, and I'd trust a fighter who knows the difference over one who's never felt it." },
        { id = "wb2_orc", when = { race = "Orc" }, text = "Your elders' rage was poured into them by demons, and they couldn't put it down, and I watched what it made of them. Rage you choose and put down again is another thing altogether, and I think you know that better than I do." },
      },
      choices = {
        { text = "Rage chosen and controlled is a weapon like any other.", next = "BACK", reply = "That's it exactly. Now go and prove you can put it down again.", fx = { align = { order = 1 } } },
        { text = "If the rage wins the fight, I see no reason to put it down.", next = "BACK", reply = "Because one day the fight will end and the rage won't, and then you're the thing someone else has to stop.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_windwatcher = {
      lines = {
        { id = "ww_default", text = "Bath'rah, they call him the Windwatcher, a troll hermit at Chillwind Point in the Alterac Mountains. He makes weapons from the heart of a wind lord called Cyclonian, if you can face the thing when it's summoned, and every warrior I've sent him came back with something worth the cold." },
      },
      choices = {
        { text = "Why send me so far for a weapon?", next = "w_windwatcher2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_windwatcher2 = {
      lines = { { id = "ww2_default", text = "Because a berserker needs a weapon that can keep up with his rage, and nothing Ratchet sells will do it. And because the walk from here to Alterac will teach you as much about yourself as my grate did, if you pay attention on the way." } },
      choices = { { text = "Then I'll make the walk. Something else.", next = "BACK" } },
    },
    twiggy = {
      lines = { { id = "tw_default", text = "That's Twiggy Flathead, who calls the fights and keeps the betting, and he'd sell tickets to his own funeral if the crowd were big enough. He's a goblin, so he cheats, but these days he cheats in ways I can live with." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    factions = {
      big = true,
      lines = { { id = "fa_default", text = "Both, on the same grate, though never on the same day, because Twiggy says the crowd turns ugly. A good fighter is a good fighter whatever banner they march under, and the sea doesn't care either way." } },
      choices = {
        { text = "A fighter's worth has nothing to do with banners.", next = "BACK", reply = "That's the spirit this grate was built for, and it's rarer than you'd think on this island. Step up when you're ready, and the crowd will judge you by your blade alone.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "My banner comes first, arena or no arena.", next = "BACK", reply = "Then fight for your banner, and fight hard, but leave the grudges outside the ring. In there, the only side you're on is your own, and the other fellow's swinging just as hard.", fx = { align = { order = 1 } } },
        { text = "Something else, Klannoc.", next = "BACK" },
      },
    },
    test = {
      big = true,
      lines = { { id = "te_default", text = "Good, but before I test you, tell me why you fight. Every warrior who comes to me has a reason, and the reason tells me how long they'll last out there." } },
      choices = {
        { text = "To protect people who can't protect themselves.", next = "test2", fx = { align = { honor = 1 } } },
        { text = "For the coin and the kill, nothing more.", next = "test2", fx = { align = { honor = -1 } } },
        { text = "I haven't decided yet.", next = "test2" },
      },
    },
    test2 = {
      lines = {
        { id = "te2_default", text = "Then I've learned what I needed to, and the challengers will teach you the rest. Go and stand on the grate when you're ready, and not a moment before." },
        { id = "te2_orc", when = { race = "Orc" }, text = "Then I've learned what I needed to. Your people fought for a long time for reasons that weren't their own, so it's good to hear an orc answer for himself." },
      },
      choices = {
        { text = "I'm ready now.", next = "BUSINESS" },
        { text = "Something else first.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fought for pay and for causes, and I found I liked testing fighters better than burying them. Fray Island suited me, so I stayed." } },
    advice = { { id = "tp_ad", text = "Never stop moving in a fight, and never stop to admire a hit. The one you admired is the one that gets back up." } },
    _none = { { id = "tp_none", text = "I know fighting and I know this island. Anything else, ask in Ratchet." } },
  },
}

P:NPC {
  key = "twiggy", id = TODO_NPC("Twiggy Flathead"), name = "Twiggy Flathead",
  bible = "bibles/twiggy.md", role = "questgiver", tier = "quest",
  temper = { "jovial" }, values = { "greedy", "cunning" },
  notices = { "class", "kit" },
  impression = {
    first = "The book is clean, he swears, since Klannoc drowned his bookstand.",
    third = "{name} met Twiggy Flathead, the goblin who calls the fights and keeps the odds on Fray Island.",
  },

  greetings = {
    { id = "g_hi", text = "Step right up, pal, fighters to the left and gamblers to the right, and everybody pays Twiggy!" },
    { id = "g_affray", when = { questActive = TODO_QUEST("The Affray") }, text = "There's our fighter! The crowd's warm, the odds are long, so get out there and lose slowly, pal, because slow losses sell drinks." },
    { id = "g_won", when = { questDone = TODO_QUEST("The Affray") }, text = "The one who beat Big Will! You cost me a fortune, pal, and I've never been prouder of a customer." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've got quick hands, pal, I can always tell, so keep 'em off my ledger, because I count it twice a day." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of you, pal! Somebody already lost money on you today, and I hope it was me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Twiggy Flathead, master of ceremonies, keeper of the book and the only goblin on Fray Island, so I'm also the only one you can blame for the odds! Are you fighting, pal, or betting? Because either way, I'm taking a cut." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Affray"), days = 3 } },
          text = "You beat Big Will, pal, and I had the whole book on him, so you've cost me a fortune! I'm not even mad, though, because next season I'm selling the story to every sailor in Ratchet." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance today, is it? Wonderful, pal, because the Horde fighters went on Tuesday, and nothing fills a crowd like a grudge from the week before." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talk fast, because I've got a crowd to lie to." },
        { id = "h_again2", text = "More questions? Every one of 'em's free, which is a terrible business model, so make 'em count." },
      },
      choices = {
        { text = "How do your odds work?", next = "odds" },
        { text = "Who are the challengers?", next = "challengers" },
        { text = "I'd guess you came to Fray Island for the money.", next = "how" },
        { text = "What are my odds, Twiggy?", next = "myodds", when = { class = "WARRIOR" } },
        { text = "I'd bet some of these fights get fixed, Twiggy.", next = "fixed", when = { class = "ROGUE" } },
        { text = "Klannoc seems to run the fighting, not you.", next = "klannoc" },
        { text = "Who comes all this way to watch?", next = "crowd" },
        { text = "What's the biggest upset you've ever seen on Fray Island?", next = "w5_upset" },
        { text = "See you at ringside, Twiggy.", next = "END" },
      },
    },
    w5_upset = {
      lines = { { id = "w5_upset_l", text = "Skinny Darkspear kid, pal, with a stick and a bad attitude. The book had him at forty to one against a challenger twice his size, and he knocked the big fella flat in the third round. I paid out more that afternoon than I took all season." } },
      choices = {
        { text = "Did you pay out in full?", next = "w5_upset2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w5_upset2 = {
      lines = { { id = "w5_upset2_l", text = "Every copper, and it about killed me. Half the island was waitin' to see if Twiggy would welsh, and Klannoc was standin' right there with his arms folded. The book's only worth something if people believe it pays." } },
      choices = {
        { text = "Always pay out. The book's word is all you've got.", next = "BACK", reply = "That's what I told myself while I was cryin' into the cash box. Still true.", fx = { align = { honor = 1 } } },
        { text = "The house always wins, one way or another.", next = "BACK", reply = "Usually, sure. That day the house lost its shirt, and I'm still wearin' a cheaper one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    odds = {
      lines = { { id = "od_default", text = "Simple, pal: I look at you, I look at the challenger, and I write down whatever number makes me the most money. Klannoc thinks it's a science, and I let him think so." } },
      choices = {
        { text = "Do the fights ever get fixed?", next = "fixed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fixed = {
      lines = { { id = "fi_default", text = "Fixed? On my island? Never, pal, never, not since the last time, and the last time was an accident, and the accident paid beautifully. Klannoc found out and threw my bookstand into the sea, so now I run a clean book and a bitter one." } },
      choices = {
        { text = "What did Klannoc say to you?", next = "fixed2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fixed2 = {
      big = true,
      lines = { { id = "fi2_default", text = "He said a fighter who steps on that grate is risking his neck, and a goblin who fixes the fight is stealing the neck right off him. He's a sentimental man, pal, and he's bigger than me, so I listened." } },
      choices = {
        { text = "He's right. A fixed fight insults every fighter.", next = "BACK", reply = "You sound just like him, and I'll tell you what I told him, which is that I'm reformed now. Mostly reformed, anyway, and entirely reformed while Klannoc's watching, pal.", fx = { align = { honor = 1 } } },
        { text = "Shame he caught you. A little fixing hurts nobody.", next = "BACK", reply = "Ha! Now you're talkin' my language, friend, but keep your voice down because Klannoc has ears like a bat. A little fixing never hurt anybody who wasn't standing on the grate.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Twiggy.", next = "BACK" },
      },
    },
    challengers = {
      lines = { { id = "ch_default", text = "Sellswords, brawlers, a few old fighters who never got off the island, and Big Will, who's the main event and the main reason I can afford a boat. They each get a cut if they win, pal, so they don't hold back." } },
      choices = {
        { text = "Nobody seems to know where Big Will came from.", next = "will" },
        { text = "Something else.", next = "BACK" },
      },
    },
    will = {
      lines = { { id = "wi_default", text = "Nobody knows, pal, and I've stopped asking, because the last fella who asked him is still picking teeth out of his beard. I've got three stories on the book about where he came from, and I sell all three at the same price." } },
      choices = { { text = "Something else, Twiggy.", next = "BACK" } },
    },
    how = {
      lines = { { id = "ho_default", text = "Same way every goblin ends up anywhere, chum: I saw a crowd with nothing to bet on, and I fixed that. The Cartel took a little convincing, but blood sport has wonderful margins and nobody ever asks for a refund." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    myodds = {
      lines = {
        { id = "my_default", text = "You? Let me look at you, pal, and squint a little, and I'd put you at four to one against, which is generous, because you've still got all your teeth. Win and I'll shorten your odds, and lose and I'll write you a lovely eulogy." },
        { id = "my_tauren", when = { race = "Tauren" }, text = "A tauren? Even money, pal, and I hate it, because nobody bets against a tauren and nobody gets rich betting on one." },
      },
      choices = {
        { text = "Put me down to win, Twiggy.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    klannoc = {
      lines = { { id = "kl_default", text = "Klannoc runs the fightin', pal, and I run the money, and that's a partnership made in heaven or somewhere warmer. He's an old pit fighter himself, with more scars than sense, and he thinks blood sport is about honour, bless him." } },
      choices = {
        { text = "Maybe it is, to the fighters.", next = "klannoc2" },
        { text = "And to you it's about margins.", next = "klannoc2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    klannoc2 = {
      lines = { { id = "kl2_default", text = "To the fighters, sure, and that's why they come back! A fighter who thinks he's fightin' for honour bleeds longer and the crowd drinks more, so Klannoc's honour is the best thing that ever happened to my margins. Don't tell him I said so." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    crowd = {
      lines = { { id = "cw_default", text = "Sailors off the Ratchet boats, grunts on leave, Northwatch soldiers out of uniform who think I don't recognise 'em, and a few rich folks from Booty Bay who like their blood with a view of the sea. They all bet, pal, and they all lose, eventually." } },
      choices = {
        { text = "Horde and Alliance at the same ringside?", next = "crowd2" },
        { text = "Northwatch soldiers betting on blood sport. Interesting.", next = "crowd2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crowd2 = {
      lines = { { id = "cw2_default", text = "Same ringside, opposite sides of it, and nobody starts anything, 'cause the only thing they hate more than each other is missin' the main event. Neutral ground, pal. Fray Island's the most peaceful place in the Barrens, apart from the fightin'." } },
      choices = {
        { text = "I'm a rogue. I'd watch the crowd more than the fights.", next = "BACK", reply = "Then you're my kinda customer, and also don't. The bruisers watch the folks who watch the crowd.", when = { class = "ROGUE" } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I ran a dice table on the Booty Bay docks till the Bloodsail started playing, pal, and then I figured an island with one way off was a safer place to take people's money." } },
    advice = { { id = "tp_ad", text = "Never bet on a fighter who's still talking about how he'll win, pal, because the quiet ones are the ones who do." } },
    _none = { { id = "tp_none", text = "Can I take bets on it? No? Then I don't care, pal." } },
  },
}
