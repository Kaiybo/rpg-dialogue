-- Thatog, upstairs in Soran's Leather and Steel Armory, Valley of Strength (Forever).
-- Migi's father, who worries the boy plays all day and never eats. Quest: Meal Appeal.
-- Voice: bibles/thatog.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thatog", id = TODO_NPC("Thatog"), name = "Thatog",
  bible = "bibles/thatog.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "gruff", "warm" }, values = { "loyal", "practical" },
  notices = { "kin", "hunger", "race" },

  impression = {
    first = "He grumbles like a sergeant and worries like a mother.",
    third = "{name} met Thatog, an orc of the Valley of Strength who worries that his boy Migi forgets to eat.",
  },

  greetings = {
    { id = "g_default", text = "Mind the stairs, they creak. If you've come about armor, Soran's below, and if you've come about anything else, I'm listening." },
    { id = "g_back", when = { metBefore = true }, text = "Back up the stairs again? Good. Sit if you like, but don't touch the stack by the window, it's counted." },
    { id = "g_active", when = { questActive = TODO_QUEST("Meal Appeal") }, text = "Borstan's Firepit is down on the Drag, and it smells like it, so you can't miss it. Tell him the lunch is for Migi." },
    { id = "g_food", when = { questActive = TODO_QUEST("Favorite Food") }, text = "Borstan gave you the boy's lunch to carry himself? Then carry it fast, before it goes cold and Migi finds an excuse." },
    { id = "g_done", when = { questDone = TODO_QUEST("Favorite Food") }, text = "There's the one who fed my son! Come in, come in, and tell me again how he looked when he ate it." },
    { id = "g_away", when = { away = 10 }, text = "Gone {away}, and Migi asked about you twice, which is twice more than he asks about his supper. Come up and sit." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been helping folk around the city. Good, because that's the Horde the Warchief promised us when he opened the camps." },
  },

  notice = {
    { id = "n_young", cat = "kin", when = { maxLevel = 12, race = "Orc" }, place = "before",
      text = "Ha, look at you, barely past the trials and already walking the city alone. Did your father fret like I do, or did he have more sense?" },
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 15 },
      text = "When did you last eat, and don't lie to me, I've a son and I know the face. Go to Borstan's after this, whatever else you do." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You'll have to stoop under my beam, friend. The armory was built for orcs, and nobody told the tauren they'd be coming up these stairs." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Thatog. I keep the work upstairs in Soran's armory, and from this window I can see half the Valley of Strength, but never the one place my son actually is." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Meal Appeal"), minLevel = 5 },
          text = "You've a kind enough face, and I've a favor to ask that's beneath a warrior but not beneath a friend. My son Migi runs off to play behind Grommash Hold every morning, and I don't think he's eaten a midday meal in a week." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Meal Appeal") },
          text = "Have you been to Borstan's yet? Tell him I sent you, and that the lunch is Migi's, and that you'll put it in the boy's hands yourself." },
        { id = "h_food", tags = { "news" }, when = { questActive = TODO_QUEST("Favorite Food") },
          text = "Borstan had an idea, did he? He would, that old smoker, and if it gets food into Migi I'll forgive him for every overcooked chop he's sold me." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Favorite Food"), days = 3 } },
          text = "He came home last night and wasn't starving! He talked about sweetglaze and crumbs through the whole of supper and then ate supper too, and I didn't know where to put myself." },
        { id = "h_rocks", tags = { "news" }, when = { questDone = TODO_QUEST("Rocks to Rests") },
          text = "Migi says some great strong stranger carried a pile of boulders behind the Hold so the children have somewhere to sit and eat. I'd guess I know who, and you've my thanks for that as well." },
        { id = "h_done", when = { questDone = TODO_QUEST("Favorite Food") },
          text = "Migi goes to Borstan's every day now, and some days he takes his friends along. You did more for that boy in an afternoon than I managed in a season of shouting." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Favorite Food"), days = 14 } },
          text = "The boy's put on weight, you know, and his arms are getting thick. He'll be stronger than me one day, and he'll owe some of that to Borstan's sandwiches and to you." },
      },
      again = {
        { id = "h_again", text = "What else? The work keeps, for a little while." },
        { id = "h_again2", text = "Go on, ask. I'm only counting buckles." },
        { id = "h_again3", text = "Anything more? I'll keep one eye on the window while we talk." },
      },
      choices = {
        { text = "Tell me about Migi.", next = "migi" },
        { text = "What's the trouble with his meals?", next = "meals" },
        { text = "What keeps you up here all day?", next = "work" },
        { text = "What do the children do behind Grommash Hold?", next = "game" },
        { text = "How did Migi like the sweetglaze?", next = "after", when = { questDone = TODO_QUEST("Favorite Food") } },
        { text = "I was born in the camps too. I know that hunger.", next = "x_camps", when = { origin = "orc_camp_born" } },
        { text = "I'm young, Thatog. I hardly remember the camps.", next = "x_young", when = { race = "Orc", maxLevel = 20 } },
        { text = "My people raise children differently. Can I offer a thought?", next = "x_tauren", when = { race = "Tauren" } },
        { text = "I've a lunch to deliver, then.", next = "BUSINESS", when = { questBefore = TODO_QUEST("Meal Appeal"), minLevel = 5 } },
        { text = "Good day, Thatog.", next = "END" },
      },
    },

    -- Migi
    migi = {
      lines = {
        { id = "mg_default", text = "He's the loudest of the lot behind the Hold, and the smallest, which he makes up for by never sitting down. He has his mother's eyes and my temper, and the spirits help whoever tries to tell him a game is over." },
      },
      choices = {
        { text = "Who are his friends?", next = "migi_friends" },
        { text = "Is he a good boy?", next = "migi_good" },
        { text = "Something else, Thatog.", next = "BACK" },
      },
    },
    migi_friends = {
      lines = {
        { id = "mf_default", text = "Mogra, who bosses the rest of them, and Puk, who lets her, and Thra and Brog besides. Thra's the one with the ideas, so Thra's the one I lie awake over." },
      },
      choices = {
        { text = "They sound like a war band already.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll look in on them if I pass.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    migi_good = {
      lines = {
        { id = "mgg_default", text = "Good-hearted, yes, and he'd give his last copper to a friend. Obedient is another matter, and I go back and forth on whether I'd want him any other way." },
      },
      choices = {
        { text = "Why go back and forth?", next = "discipline" },
        { text = "Something else.", next = "BACK" },
      },
    },
    discipline = {
      big = true,
      lines = {
        { id = "dc_default", text = "Because a Horde child grows up into a Horde warrior, and warriors who don't listen get killed. But he's free, which I never was at his age, and when I see him run I can't bring myself to call him back. What would you do with him?" },
      },
      choices = {
        { text = "Teach him to obey now, and the world won't have to.", next = "BACK", reply = "Maybe you're right, and it's what my own trainers would have said. I'll try, though it'll break something in me to do it.", fx = { align = { order = 1 } } },
        { text = "Let him run. He's earned a childhood you never had.", next = "BACK", reply = "Earned it? Aye, I suppose he has, though he doesn't know it. I'll let him run a while longer, then.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "I've no children. I'd only be guessing.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- The meals
    meals = {
      lines = {
        { id = "ml_default", text = "I've told him to pick up a lunch at Borstan's every day, and I know he hardly ever does, because he comes home starving and eats like a worg. These children think their games matter more than their own bellies." },
      },
      choices = {
        { text = "Why does a skipped meal worry you so much?", next = "meals_why" },
        { text = "Can't you go and fetch him yourself?", next = "meals_fetch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meals_why = {
      lines = {
        { id = "mw_default", text = "I spent years in the human camps after the Second War, and we ate what they gave us when they remembered to give it. I swore a child of mine would never go hungry, and now he goes hungry by choice, which makes me want to laugh and shout at once." },
      },
      choices = {
        { text = "The camps are gone. He doesn't know that hunger.", next = "meals_camps" },
        { text = "Then let's make sure he eats.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    meals_camps = {
      lines = {
        { id = "mc_default", text = "No, he doesn't, and the Warchief did that for him, and I'll thank Thrall for it until I die. But I still can't watch an empty plate without my stomach turning over, and I suppose I never will." },
      },
      choices = {
        { text = "Some wounds don't close. That's no shame.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    meals_fetch = {
      lines = {
        { id = "mf2_default", text = "My duties keep me here from dawn till the lamps are lit, and I can't watch over every meal he skips. Besides, if his father marches up with a sandwich in front of all his friends, he'll never forgive me." },
      },
      choices = {
        { text = "A stranger bringing it is less embarrassing, then.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- His work
    work = {
      lines = {
        { id = "wk_default", text = "Soran sells leather and steel below, and I keep the stock and the fitting orders up here, so that every grunt who comes in gets a jerkin that closes over his chest. It's no glorious work, but the guards on the gate are wearing armor I fitted." },
      },
      choices = {
        { text = "Were you a warrior once?", next = "work_war" },
        { text = "It's honest work. That counts.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_war = {
      lines = {
        { id = "ww_default", text = "I carried an axe in the Second War, like every orc of my years, and I lost the war like every orc of my years. When the Warchief freed the camps I'd had enough of axes, and he said the Horde needs counters of buckles as much as it needs warriors." },
        { id = "ww_warrior", when = { class = "WARRIOR" }, text = "I carried an axe in the Second War, as you carry yours now, and I'd still know which end to hold. But when the Warchief freed the camps I put it down for good, and I don't miss it as much as I'd expected." },
      },
      choices = {
        { text = "The Horde needs both kinds. Thrall is right.", next = "work_horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_horde = {
      big = true,
      lines = {
        { id = "wh_default", text = "Some of the young ones on the Drag say an orc who doesn't fight is half an orc, and they say it loudly near my window. I think they've never seen what the fighting cost. Which of us is right, do you think?" },
      },
      choices = {
        { text = "You've served. Let the loud ones earn their scars first.", next = "BACK", reply = "That's what I tell myself, and it's good to hear it from someone else. Let them earn their scars, and then we'll talk.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "They're right. An orc should be ready to fight.", next = "BACK", reply = "Maybe they are, and I'll be ready if the Horde calls. But I'll pray it calls them first, and not my boy.", fx = { align = { honor = -1 } } },
        { text = "I'd rather not take sides on that.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- The game behind the Hold
    game = {
      lines = {
        { id = "gm_default", text = "Some game with little figures in the dirt that I don't understand and Migi won't explain, because he says I'd cheat. They've a clear patch behind Grommash Hold where nobody steps on their armies, and they'd stay there till moonrise if we let them." },
        { id = "gm_rocks", when = { questDone = TODO_QUEST("Rocks to Rests") }, text = "Some game with little figures in the dirt, and now they've your boulders to sit on, so they'll never come home at all. Migi says Thra has made the biggest rock the war chief's seat." },
      },
      choices = {
        { text = "Behind Grommash Hold? Under the Warchief's own walls?", next = "game_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    game_hold = {
      lines = {
        { id = "gh_default", text = "Under his walls, yes, and the guards there know all those children by name. They'd tell me if anything happened to him, and that's the only reason I let him go at all." },
      },
      choices = {
        { text = "I'd like to see that game.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- After the quests
    after = {
      lines = {
        { id = "af_default", text = "He says Borstan crumbles the crispy bits from the smoker on top, and that he can smell what's for lunch from the road to Grommash Hold. He's stopped the game at midday to eat with his friends, which I'd have said was impossible." },
      },
      choices = {
        { text = "Borstan deserves the credit.", next = "after_borstan" },
        { text = "You can stop worrying now.", next = "after_worry" },
      },
    },
    after_borstan = {
      lines = {
        { id = "ab_default", text = "He does, and I've told him so, and he told me to buy more chops, which is Borstan's idea of gratitude. Still, I'll be eating sweetglaze myself this week, out of respect." },
      },
      choices = {
        { text = "Save me some.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_worry = {
      lines = {
        { id = "aw_default", text = "Stop worrying? I'm his father, so I'll worry until one of us is in the ground. But it's a smaller worry now, and you made it smaller, and I won't forget that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    -- Who the player is
    x_camps = {
      lines = {
        { id = "xc_default", text = "Then you know why I fuss. You'll remember the thin soup and the guards who laughed, and you'll know why I can't bear an empty plate even when the plate belongs to a boy who's simply having too much fun." },
      },
      choices = {
        { text = "I remember. Let him have his fun, Thatog.", next = "BACK", fx = { affinity = 2 } },
        { text = "I try not to remember.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    x_young = {
      lines = {
        { id = "xy_default", text = "Good, and long may it stay that way. You were small when the Warchief opened the gates, so you'll have the luck my Migi has, and I'll ask only that you never take it for granted." },
      },
      choices = {
        { text = "I won't. I've heard what it cost.", next = "BACK", fx = { affinity = 1 } },
        { text = "The past is past. I'd rather look ahead.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    x_tauren = {
      lines = {
        { id = "xt_default", text = "Go on, then. Your people have raised children on the plains for longer than mine have had a home, so I'll listen, as long as the thought isn't that I should shout less." },
      },
      choices = {
        { text = "Our young eat with the herd. Make the meal a gathering.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Shout less, Thatog.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fought in the Second War, sat in the camps after it, and came here when the Warchief brought us across the sea. Now I keep the armory's stock, and I raise a son who never sits still." } },
    advice = { { id = "tp_ad", text = "Eat before you fight, and eat after it as well. I've buried better orcs than me who forgot one or the other." } },
    _none = { { id = "tp_none", text = "I wouldn't know about that. Ask Soran downstairs, or ask Migi, who'll tell you he knows everything." } },
  },
}
