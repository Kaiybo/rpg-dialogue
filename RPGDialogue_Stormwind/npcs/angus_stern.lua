-- Angus Stern, head chef of the Blue Recluse in the Mage Quarter. Voice: bibles/angus_stern.md
-- Perfectionist, theatrical, always one banquet from disaster; nephew Morgan gathers recipes in Theramore,
-- nephew Henry went off to Kalimdor (Razorfen Downs, Goldthorn Tea).
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local QH = TODO_QUEST("A Meal Served Cold")
local QM = TODO_QUEST("Morgan Stern")

P:NPC {
  key = "angus_stern", id = TODO_NPC("Angus Stern"), name = "Angus Stern",
  title = "Head Chef",
  bible = "bibles/angus_stern.md", role = "vendor", tier = "quest",
  communities = { "stormwind" }, temper = { "fussy" }, values = { "craft", "proud" },
  notices = { "craft", "hunger", "race" },

  impression = {
    first = "He's vain, anxious and very good, and he knows I know it.",
    third = "{name} met Angus Stern, the perfectionist head chef of the Blue Recluse in Stormwind's Mage Quarter.",
  },

  greetings = {
    { id = "g_kitchen", text = "Not now, not now! Unless you're bringing me something fresh, in which case, yes, now." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and just in time! Taste this and tell me it needs nothing." },
    { id = "g_haunch", when = { questActive = QH }, text = "Do you have the haunch? I must start the marinade, or the banquet is ruined!" },
    { id = "g_morgan", when = { questActive = QM }, text = "Have you reached Theramore yet? My nephew is a dear boy, but he writes no letters." },
    { id = "g_haunch_done", when = { questDone = QH }, text = "My saviour of the banquet! Come in, come in, and mind the scullion; he's carrying something hot and he's never once looked where he was going." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I've reinvented the menu twice in that time. Neither time was it appreciated." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've become rather formidable since you first wandered into my kitchen. Formidable people eat well, you know; I should know." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Your name has been mentioned at my tables, and kindly! That's the finest seasoning there is." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear you've upset someone in the Quarter. I don't care to know whom, only please don't do it near the soufflés." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook? I can smell it on you, smoke and onion. Never mind what the guild says; good cooking is half instinct." },
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 15 },
      text = "You look like you've lived on hard bread and river water. I can't feed you from the banquet, but heavens, eat something." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf in my kitchen, and I can already hear you thinking the portions are small. They are meant to be small, my dear; they are meant to be admired." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Angus Stern, head chef of the Blue Recluse, the finest table in the Mage Quarter, which is to say the finest in the kingdom. If you've come to complain, the door is behind you." },
        { id = "h_menu", when = { questBefore = QM, minLevel = 30 },
          text = "I'm writing a new menu, all rural dishes with a bayou flavour, and my clientele will adore it. My nephew Morgan went to Theramore to gather recipes, and I simply must know what he's found." },
        { id = "h_haunch_before", when = { questBefore = QH, minLevel = 35 },
          text = "Chilled Basilisk in Lime Vinaigrette, one of my most famous dishes, and the meat won't keep! I need a fresh haunch from a Cold Eye Basilisk tonight, for a noble's birthday." },
        { id = "h_haunch_done", tags = { "news" }, when = { questRecent = { QH, days = 3 } },
          text = "The haunch arrived in time, chopped, marinated and garnished, and the noble cried. Happily, I'm told, though with nobles it's hard to be sure." },
        { id = "h_noble", when = { origin = "human_minor_noble" },
          text = "I know that face; you've dined here, or your family has, and someone at your table sent back the trout. I've forgiven them, very nearly." },
        { id = "h_farmhand", when = { origin = "human_westfall_farmhand" },
          text = "You've Westfall dust in the seams of your boots, and I'd know it anywhere, because my best onions used to come from there before the bandits took the farms." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, the sauce is turning." },
        { id = "h_again2", text = "Go on. I can listen and whisk." },
        { id = "h_again3", text = "Yes, yes, I'm still here, and so is the stock, which wants stirring every minute of its wretched life." },
      },
      choices = {
        { text = "I've heard the Blue Recluse is a special place.", next = "recluse" },
        { text = "Do you have family in the trade, Chef?", next = "morgan" },
        { text = "Do you really go to such lengths for your dishes?", next = "lengths" },
        { text = "You look like a man who hasn't slept in a week.", next = "sleep" },
        { text = "Who does all the chopping back there?", next = "kitchen" },
        { text = "Where does a kitchen like this get its food?", next = "larder" },
        { text = "I cook as well. Have you any secrets to share?", next = "cook", when = { profession = "Cooking" } },
        { text = "My family dined here often. You'll remember us.", next = "xnoble", when = { origin = "human_minor_noble" } },
        { text = "I grew up on a Westfall farm, Chef.", next = "xfarm", when = { origin = "human_westfall_farmhand" } },
        { text = "A dwarf likes a proper plate, not a painting of one.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I hunt my own meat. What would you want from me?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I could conjure you all the bread and water you need.", next = "xmage", when = { class = "MAGE" } },
        { text = "The haunch reached you in time, then?", next = "xdone", when = { questDone = QH } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "I'll leave you to the sauce.", next = "END" },
      },
    },

    -- The Blue Recluse
    recluse = {
      lines = { { id = "r_default", text = "Wizards, my dear, who have travelled everywhere and eaten everything, and are therefore impossible to please. If I can please them, I can please anyone." },
      },
      choices = {
        { text = "And can you?", next = "recluse_please" },
        { text = "Who else eats here, besides wizards?", next = "recluse_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recluse_please = {
      lines = { { id = "rp_default", text = "Most nights. The rest of the nights they talk about magic through the whole meal and don't notice what they've eaten, which is a kind of tragedy." },
      },
      choices = {
        { text = "Has a wizard ever complained about a dish?", next = "recluse_complaint" },
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    recluse_complaint = {
      lines = { { id = "rc_default", text = "Once, a gentleman from the Sanctum said my consommé tasted of nothing, and then he waved his hand over it and it tasted of strawberries. I asked him to leave, and I'd do it again, because a man who enchants another man's soup has no manners at all." },
      },
      choices = {
        { text = "Strawberry consommé sounds rather nice, actually.", next = "BACK" },
        { text = "Quite right. A cook's plate is his own.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    recluse_who = {
      lines = { { id = "rw_default", text = "Nobles from the Keep when they want to be seen dining with clever people, and clever people when they want to be seen dining with nobles. Now and then a captain home from the front, who eats everything in sight and thanks me properly, and those are the nights I remember." },
      },
      choices = {
        { text = "The soldiers deserve the best table more than the nobles.", next = "recluse_soldiers", fx = { align = { order = -1 } } },
        { text = "The nobles keep the city running. They've earned a good meal.", next = "recluse_soldiers", fx = { align = { order = 1 } } },
        { text = "Which of them do you prefer to cook for?", next = "recluse_soldiers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recluse_soldiers = {
      lines = { { id = "rs_default", text = "I've no opinion on who deserves it, only on who appreciates it, and those aren't always the same people. A soldier eats as though he mightn't eat again, and there's no higher compliment a chef can be paid." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Family
    morgan = {
      lines = { { id = "m_default", text = "My nephew Morgan, my sister's boy, and a good cook, though he'd rather taste his way across the world than stand at a stove. Theramore suits him; it's damp and full of strange food." },
        { id = "m_active", when = { questActive = QM },
          text = "Morgan's in Theramore, gathering recipes from the marsh folk, and you're to fetch them for me. He'll tell you he's nearly finished; he's been nearly finished since spring." },
      },
      choices = {
        { text = "What sort of recipes is he after?", next = "morgan_menu" },
        { text = "Morgan's the only nephew, then?", next = "henry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morgan_menu = {
      lines = { { id = "mm_default", text = "Rural dishes from the Dustwallow bayou, the sort of thing the marsh settlers cook in one pot over a smoky fire. My clientele has never eaten anything humble in their lives, and I mean to serve them humble at ten times the price.",
          fx = { learn = { "theramore" } } },
      },
      choices = {
        { text = "Charging nobles a fortune for peasant stew? That's brilliant.", next = "morgan_stew", fx = { align = { honor = -1 } } },
        { text = "That seems a bit dishonest, Chef.", next = "morgan_stew", fx = { align = { honor = 1 } } },
        { text = "Will they really pay that much for stew?", next = "morgan_stew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morgan_stew = {
      lines = { { id = "ms_default", text = "It isn't the stew they're paying for, my dear, it's the hand that made it, and the linen, and the candles, and the knowledge that their neighbour couldn't get a table. The marsh folk get their recipe back on a silver plate, garnished, which is more ceremony than the marsh ever gave it." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    henry = {
      lines = { { id = "hn_default", text = "There's Henry, Morgan's brother, who took it into his head to go to Kalimdor and find a tea brewed from some golden thorn root that only grows in the Barrens. His last letter came from somewhere near the quilboar's great thorn mounds, and I've been chewing my apron ever since.",
          fx = { learn = { "razorfen" } } },
      },
      choices = {
        { text = "The quilboar mounds? He's in real danger there.", next = "henry_danger" },
        { text = "Goldthorn tea? I've heard of it, I think.", next = "henry_tea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    henry_danger = {
      big = true,
      lines = { { id = "hd_default", text = "Don't, please; I've imagined it every way there is, and most of them end with Henry in a pot, which is not how a Stern should end. His mother blames me, because I told him once that a cook should go where the flavour is." },
      },
      choices = {
        { text = "Young folk should chase what they love. You were right.", next = "henry_blame", fx = { align = { order = -1 } } },
        { text = "A cook belongs at his stove. You shouldn't have encouraged him.", next = "henry_blame", fx = { align = { order = 1 } } },
        { text = "Does his mother really blame you?", next = "henry_blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    henry_blame = {
      lines = { { id = "hb_default", text = "Perhaps, perhaps not; I say both things to myself, usually at three in the morning over a cold pot. If you're ever down that way, and you see a young man in an apron among the pig-men, tell him his uncle wants a letter." },
      },
      choices = {
        { text = "If I see him, I'll tell him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    henry_tea = {
      lines = { { id = "ht_default", text = "Then you've heard more than I have, because he won't write down how it's made. He says it would steady a man's nerves through anything, and if he ever comes home with a pot of it, I mean to drink the lot before the next banquet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    -- His lengths and the haunch
    lengths = {
      lines = { { id = "l_default", text = "Because the dish is the thing! A noble remembers a meal longer than a speech, and the kitchen that served it longer still." },
      },
      choices = {
        { text = "All that for the nobles, though?", next = "lengths_nobles" },
        { text = "What's the farthest you've sent for an ingredient?", next = "lengths_far" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lengths_nobles = {
      big = true,
      lines = { { id = "ln_default", text = "The nobles pay for this kitchen, and the guards eat stew at the barracks. I don't make the world, I only cook in it. Does that bother you?" },
      },
      choices = {
        { text = "It does. Good food should feed everyone.", next = "BACK", reply = "And what would you have me do, ladle my truffle velouté out of a cart in Old Town? I'd be bankrupt by Tuesday and the stew would still be better.", fx = { align = { light = 1 } } },
        { text = "Not at all. Excellence goes where the coin is.", next = "BACK", reply = "Ha! At last, someone who understands that a soufflé cannot be made for everyone or it isn't a soufflé, it's porridge.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lengths_far = {
      lines = { { id = "lf_default", text = "Stranglethorn, for the basilisk, because the Cold Eye basilisks there have a firmness to the haunch that nothing in the north can match. The meat turns in hours, so it has to come quickly and it has to come cold, and that's why the dish is famous and why I'm grey." },
        { id = "lf_active", when = { questActive = QH },
          text = "Stranglethorn, as you well know, since you're the one who's meant to be fetching it! The Cold Eye basilisks, and quickly, before the haunch turns and my reputation turns with it." },
      },
      choices = {
        { text = "Why not serve something that keeps?", next = "lengths_keeps" },
        { text = "Who's the banquet for this time?", next = "lengths_birthday" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lengths_keeps = {
      lines = { { id = "lk_default", text = "Because anyone can serve something that keeps! Salt pork keeps, my dear, and so does hardtack, and you won't find either on my menu. The whole art is in serving what can't wait, at the moment it's perfect, and not a minute after." },
      },
      choices = {
        { text = "That's a hard way to live, Chef.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lengths_birthday = {
      lines = { { id = "lb_default", text = "A noble's birthday, and I'll say no more than that, because discretion is the second ingredient in every dish I make. Let's say the gentleman has a long name, a short temper and very particular feelings about lime." },
      },
      choices = {
        { text = "Then I'd better not get the lime wrong.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- An observation
    sleep = {
      lines = { { id = "sl_default", text = "I haven't, and how kind of you to point it out in my own kitchen. A banquet is a battle, my dear, and I'm the general, the quartermaster and the poor fool in the front rank all at once." },
      },
      choices = {
        { text = "Then let someone else carry part of it.", next = "sleep_help" },
        { text = "What happens if a banquet goes wrong?", next = "sleep_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sleep_help = {
      big = true,
      lines = { { id = "sh_default", text = "Let someone else? And when the sauce splits, whose name do they say at the table? Mine, always mine, and so every plate passes under my nose before it leaves the pass." },
      },
      choices = {
        { text = "A master who trusts no one trains no one.", next = "BACK", reply = "Morgan tells me the same thing, and look at him, gathering recipes in Theramore instead of standing at my side. Perhaps I've proved your point, curse you.", fx = { align = { order = -1 } } },
        { text = "Quite right. A kitchen needs one firm hand.", next = "BACK", reply = "Thank you! Write that on a card and pin it above the scullery door, because my staff seem to believe a kitchen runs itself.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sleep_wrong = {
      lines = { { id = "sw_default", text = "Then the noble tells his friends, and his friends tell theirs, and by the end of the week the House of Nobles is dining at the Keep instead. I've seen better chefs than me ruined by one cold pie, and I don't intend to be the next." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The kitchen
    kitchen = {
      lines = { { id = "k_default", text = "Two scullions, a pastry cook who cries when it rains, and a boy who peels potatoes as though they'd wronged his family. They're good, I'd never tell them so, and I'd hire none of them away from me for all the gold in the bank." },
      },
      choices = {
        { text = "You'd never tell them? Why not?", next = "kitchen_praise" },
        { text = "Has anything ever caught fire back there?", next = "kitchen_fire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kitchen_praise = {
      lines = { { id = "kp_default", text = "Because praise in a kitchen is like salt; a pinch brings everything up, and a handful ruins the dish. I say well done once a year, at Winter Veil, and they talk about it until spring." },
      },
      choices = {
        { text = "That's a bit stingy, Chef.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kitchen_fire = {
      lines = { { id = "kf_default", text = "Not the kitchen, but the dining room, twice, both times a guest showing off a spell to the lady across the table. This is the Mage Quarter, my dear; I keep a bucket of sand beside every third chair and nobody thinks it's strange." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Supplies
    larder = {
      lines = { { id = "la_default", text = "Elwynn for the greens and the pork, the lakes for the fish, the dwarves for cheese and a stout I braise with, and Booty Bay for the spices, at a price that would make a priest swear. Westfall used to give me onions and wheat, before it gave me bandits instead.",
          fx = { learn = { "booty_bay", "westfall" } } },
      },
      choices = {
        { text = "The bandits have hurt your supplies?", next = "larder_westfall" },
        { text = "The goblins overcharge you for spice?", next = "larder_goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    larder_westfall = {
      big = true,
      lines = { { id = "lw_default", text = "The Defias have, and the farms they've burned, and the farmers who've walked off to Stormwind with nothing. My onions cost three times what they did, and I hear the bread in Old Town has gone dear too, which is a good deal worse than my onions.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "The crown should send soldiers and clear Westfall.", next = "BACK", reply = "They ought to have done it a year ago, before my onions became a luxury. Tell that to the Keep, would you? They don't listen to cooks.", fx = { align = { order = 1 } } },
        { text = "The crown cheated those farmers first. No wonder they turned.", next = "BACK", reply = "Hush, not so loud in my dining room, the nobles eat here! Though I'll grant you, a man doesn't burn a farm he was paid fairly for.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    larder_goblins = {
      lines = { { id = "lg_default", text = "Robbed blind, smiling all the while, and they send a little card with every crate that says thank you for your custom. I keep the cards; I mean to frame them one day as a warning to young chefs." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Cooks
    cook = {
      lines = { { id = "c_default", text = "Salt early, taste often, and never trust a recipe you haven't burned once. And never serve a dish you wouldn't eat yourself; that one cost me a week of the runs." },
      },
      choices = {
        { text = "Thank you, Chef.", next = "BACK", fx = { affinity = 2 } },
        { text = "What's the one dish you can't master?", next = "cook_pie" },
      },
    },
    cook_pie = {
      lines = { { id = "cp_default", text = "Gilnean mutton pie, and I've failed at it every way a man can fail. The Gilneans took their recipes behind that wall of theirs, and all I have is the memory of one slice I ate as a boy, which grows more perfect every year I can't match it.",
          fx = { learn = { "gilneas" } } },
      },
      choices = {
        { text = "Maybe the memory's better than the pie ever was.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    xnoble = {
      lines = { { id = "xn_default", text = "Remember you? My dear, I remember every table in this room and what was sent back from it, and your family once returned a pheasant because it was looking at them. I'll not hold it against you, provided you're not the one who sent it." },
      },
      choices = {
        { text = "That was my uncle. He sends everything back.", next = "BACK", fx = { affinity = 1 } },
        { text = "It was me, and the pheasant was overcooked.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    xfarm = {
      big = true,
      lines = { { id = "xf_default", text = "Then you know what good soil tastes like, and half my guests think it comes out of a sack. Tell me plainly, are the farms finished out there, or will there be a harvest worth buying again?" },
      },
      choices = {
        { text = "Westfall will come back. Farmers don't give up their land.", next = "BACK", reply = "From your mouth to the Light's ear, because I've a menu built on Westfall corn and I'm not rewriting it for anyone's barley.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's finished. The People's Militia can't save it alone.", next = "BACK", reply = "Then I'll be buying my onions from Lakeshire at bandit prices for the rest of my days. You've ruined my evening, but thank you for the truth.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = { { id = "xd_default", text = "A painting is precisely what it is, and I'll thank you not to say so to the wizards. Still, I braise my short rib in Thunderbrew stout from Ironforge, and I'd wager no dwarf ever complained about a plate of that." },
      },
      choices = {
        { text = "Thunderbrew in a stew? That's a waste of good ale.", next = "BACK" },
        { text = "Now you're talking, Chef.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xhunter = {
      lines = { { id = "xh_default", text = "Bring me game killed clean and bled properly, cooled in the shade and not slung across a saddle for three days. Most hunters bring me meat that's been dragged through every bog between here and Duskwood, and I've had to bury more than one haunch with honours." },
        { id = "xh_pet", when = { pet = { type = "Beast" } }, text = "Bring me game killed clean, and please keep your {pet} out of my larder; the last hunter's wolf ate a wheel of cheese meant for a duke." },
      },
      choices = {
        { text = "I'll bring you something worth cooking, Chef.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xm_default", text = "Conjured bread! My dear, I've tasted it, and it's like chewing a cloud that has given up on life. Keep it for your travels and leave the baking to people who use flour." },
      },
      choices = {
        { text = "It keeps me alive on the road, Chef.", next = "BACK" },
        { text = "Fair. It is terrible bread.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdone = {
      lines = { { id = "xdo_default", text = "In time, and cold, and firm, and the lime was right, and the noble wept into his napkin. I told everyone the haunch came from a hero, and they assumed I meant myself, which I didn't correct." },
      },
      choices = {
        { text = "You're welcome to the credit, Chef.", next = "BACK", fx = { affinity = 1 } },
        { text = "Next time, mention my name.", next = "BACK" },
      },
    },
  },

  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "The spices that come up from Booty Bay are the only reason my kitchen can compete with the Keep's. The goblins rob me blind for them, and I pay gladly, because a dull sauce is a sin." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire sells food on sticks to people who've never tasted a proper sauce. I visited once, and I've never recovered." } },
    dalaran = { { id = "tp_dalaran", text = "The mages of Dalaran used to dine here when they came south, and they had the most refined palates in the world. I'm told the city's being rebuilt, and I've written to them twice to say my table's ready." } },
    gilneas = { { id = "tp_gilneas", text = "Gilnean cooks were the best in the Seven Kingdoms, and they took every one of their recipes behind that wall. I've spent ten years trying to make their mutton pie, and I've failed every time." } },
    theramore = { { id = "tp_theramore", text = "Theramore is all marsh and soldiers and a lady wizard at the top of a tower, and Morgan says the fish stew there would make you weep. I'll believe it when it's in front of me." } },
    razorfen = { { id = "tp_razorfen", text = "The quilboar live in thorns the size of houses, Henry wrote, and they cook nothing properly. He sounded rather pleased about it, and that is my nephew all over." } },
    westfall = { { id = "tp_westfall", text = "Westfall gave this city its bread for generations, and now it gives us refugees and bad news. I pay for my onions and I try not to think about why they cost so much." } },
    defias = { { id = "tp_defias", text = "Bandits in red masks, they say, and they've taken the farms that fed my kitchen. I've never met one, and I'd like to keep it that way, unless he's bringing onions." } },
    background = { { id = "tp_bg", text = "Head chef of the Blue Recluse. Before that, a great many kitchens, and before that, a boy who burned things." } },
    advice = { { id = "tp_ad", text = "Fresh, fresh, fresh. Everything else can be forgiven, but stale meat cannot." } },
    _none = { { id = "tp_none", text = "Does it go in a pot? No? Then I couldn't tell you, my dear." } },
  },
}
