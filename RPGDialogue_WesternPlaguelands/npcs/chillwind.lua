-- Chillwind Camp: Stormwind's foothold at the southern edge of the Plaguelands. Voice: bibles/westernplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "valorfist", id = TODO_NPC("Commander Ashlam Valorfist"), name = "Commander Ashlam Valorfist",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "major",
  communities = { "chillwind_camp" }, temper = { "steady", "proud" }, values = { "dutiful", "brave" },
  notices = { "class", "kit" },

  impression = {
    first = "Commander Valorfist counts his soldiers out of the gate and counts them back in, and he writes the letters himself on days the numbers don't match. He has very little, and spends it carefully.",
    third = "{name} met Commander Ashlam Valorfist, who holds Chillwind Camp for Stormwind against the dead of Andorhal.",
  },

  greetings = {
    { id = "g_camp", text = "On your feet or on your way, soldier, for Chillwind hasn't room for anyone sitting down." },
    { id = "g_back", when = { metBefore = true }, text = "Back in one piece, good. I counted you out of that gate, and I'm glad to count you in again." },
    { id = "g_hero", when = { questDone = TODO_QUEST("Mission Accomplished!") }, text = "There's the hero of the cauldrons! Somebody find this soldier a stool, and don't let anyone tell you it isn't earned." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Shadowbreaker's sending me paladins again, and good. I asked him for twenty, but I'll gladly take one who doesn't flinch at a ghoul." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in worse shape than my palisade, {class}. Get it mended before Sorrow Hill finishes the job for you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Commander Ashlam Valorfist. Stormwind sent me to hold this camp and break Andorhal with a handful of soldiers, a priestess, an alchemist and whoever walks through that gate, and today that's you." },
        { id = "h_paladin_call", tags = { "news" }, when = { questActive = TODO_QUEST("Chillwind Camp") },
          text = "Lord Shadowbreaker's letter said you'd come, and it also said you'd be steady. We'll find out soon enough which part of his letter was true." },
        { id = "h_clear", tags = { "news" }, when = { questActive = TODO_QUEST("Clear the Way") },
          text = "Andorhal's west and north roads are walls of the dead, but the east road runs through Sorrow Hill, where it's only skeletons and ghouls. Thin them out for me, and we'll have ourselves a door." },
        { id = "h_cleared", when = { questRecent = { TODO_QUEST("Clear the Way"), days = 3 } },
          text = "Sorrow Hill's quieter, though it won't stay that way, since the dead never tire. Still, quieter is a start, and I've learned to be grateful for starts out here." },
        { id = "h_towers", tags = { "news" }, when = { questActive = TODO_QUEST("All Along the Watchtowers") },
          text = "The Scourge moves its troops by four towers in Andorhal, so mark every one of them with the beacon torch. And bring that torch back to me, mind, as it's the only one we have." },
        { id = "h_araj", tags = { "news" }, when = { questActive = TODO_QUEST("Alas, Andorhal") },
          text = "Araj the Summoner is a lich, and he sits at the heart of the city. Don't go in alone, and I mean that, because I've written enough letters to mothers this year." },
        { id = "h_araj_dead", when = { questDone = TODO_QUEST("Alas, Andorhal") },
          text = "The lich of Andorhal is dust, and I said it aloud three times this morning before I believed it. The dead still walk there, mind you, and without a master they walk worse." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "At night you can hear Andorhal from here, and it isn't the dead you hear but the bells. Nobody living has rung them in years." },
        { id = "h_back", when = { metBefore = true },
          text = "I count the camp every morning and every night, and most days it's the same number. On the days it isn't, I write the letters myself." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There's the soldier I'd pick first, if Stormwind ever let me pick anyone. Come in by the fire and tell me what the farms looked like today." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "You again. Say your business and get on the road, because I've no time for anyone I can't count on." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it, the dead don't wait on our conversations." },
        { id = "h_again2", text = "Out with it, then, while the scouts are still on the road." },
      },
      choices = {
        { text = "What do you need?", next = "need" },
        { text = "Why is Stormwind fighting here?", next = "why" },
        { text = "Tell me about Andorhal.", next = "andorhal" },
        { text = "Who serves here with you?", next = "camp" },
        { text = "Lord Shadowbreaker sent me to you.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I'm a priest. Where do you need me?", next = "priest", when = { class = "PRIEST" } },
        { text = "I was born in Lordaeron, before the plague.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Point me at the dead.", next = "END", fx = { affinity = 1, standing = { chillwind_camp = 1 }, trait = { brave = 1 } } },
      },
    },
    need = {
      lines = {
        { id = "nd_default", text = "I need soldiers I don't have, and people like you who'll go where soldiers can't. MacDonnell has the cauldrons in hand, and Arbington has the rest, if you can stand him." },
      },
      choices = {
        { text = "I'll find them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Why not more soldiers?", next = "need_men" },
      },
    },
    need_men = {
      lines = {
        { id = "nm_default", text = "Because Stormwind has a great many walls to man and this is the farthest of them. So I hire who I can, I strike where it hurts, and I make every sword count twice." },
      },
      choices = {
        { text = "Do you honestly expect to take Andorhal with this?", tag = "Persuade", next = "need_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Clear the Way") }, { trait = "brave" } } } },
          fail = { next = "need_shut", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { practical = 1 } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "These were Lordaeron's farmers and millers, and now they march in the enemy's army. If the plague isn't stopped here, it walks south to Southshore and the Wetlands, and then home, so I'd rather fight it here." },
      },
      choices = {
        { text = "Then we stop it here.", next = "BACK", fx = { affinity = 2, align = { honor = 1, order = 1 } } },
        { text = "Lordaeron's lost, so better to hold the line at Southshore.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Stormwind's generous with other people's lands.", next = "why_push", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    why_push = {
      lines = {
        { id = "wp_default", text = "Say that to the folk who fled south with nothing but the clothes on their backs, and see how they take it. Lordaeron's people are Stormwind's cousins, and nobody else is coming for them." },
      },
      choices = {
        { text = "Fair. I spoke too quickly.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll fight. I just won't salute.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    andorhal = {
      lines = {
        { id = "a_default", text = "It was the granary of the northern provinces once, which is how Kel'Thuzad's plague got into every village along the roads. Now it's the Scourge's fortress in the west, with a lich at its heart, and it's the reason this camp exists.", fx = { learn = { "andorhal" } } },
      },
      choices = {
        { text = "How do you mean to break it?", next = "andorhal_plan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    andorhal_plan = {
      lines = {
        { id = "ap_default", text = "Piece by piece, the way you'd take down a wall. First we clear the east road past Sorrow Hill, then we mark the towers they command from, and then someone brave and well-armed goes in after Araj the Summoner." },
      },
      choices = {
        { text = "Count me among the brave.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "c_default", text = "High Priestess MacDonnell is my second, and the best I could ask for. Arbington does our alchemy and complains about his wages, Pureheart keeps the Argent Dawn's people in line, and the gryphon master keeps us in touch with the world." },
      },
      choices = {
        { text = "And the nobleman by the cliff?", next = "camp_barov" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_barov = {
      lines = {
        { id = "cb_default", text = "Weldon Barov is a guest of the kingdom, not of mine, and he'll tell you so himself. Whatever business you have with him is your own affair, so long as it doesn't bring trouble to my gate." },
      },
      choices = { { text = "Understood, Commander.", next = "BACK" } },
    },
    paladin = {
      big = true,
      lines = {
        { id = "pa_default", text = "Then you're one of his best, for he doesn't waste a paladin on a trip this long. Out here the Light isn't a sermon, it's a weapon, and I'll ask you to use it every day you're under my command." },
      },
      choices = {
        { text = "It's what I'm for.", next = "BACK", fx = { affinity = 2, align = { light = 1, order = 1 }, standing = { chillwind_camp = 1 } } },
        { text = "The Light's no weapon, Commander, whatever your orders say.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "And the Silver Hand's teaching?", next = "BACK", fx = { trait = { devout = 1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Everywhere, and all at once, I'm afraid. MacDonnell could use another pair of hands that know the Light, and the wounded who come back from Andorhal need more than bandages and a kind word." },
      },
      choices = {
        { text = "Then I'll stay a while and help.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { chillwind_camp = 1 } } },
        { text = "I'm more use out in the field.", next = "BACK", fx = { trait = { brave = 1 }, align = { light = -1 } } },
      },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Then this is your home we're fighting over, and I won't pretend it isn't hard to look at. If you've family buried up here, tell me where, and my patrols will mind the place when they pass." },
      },
      choices = {
        { text = "Thank you, Commander.", next = "BACK", fx = { affinity = 3, standing = { chillwind_camp = 1 } } },
        { text = "I'd rather not speak of it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    need_truth = {
      big = true,
      lines = {
        { id = "nt_default", text = "Between us, and not a word of it past that palisade: Stormwind sent me here to keep the plague off Southshore, not to win. If Andorhal falls, it'll be because people like you walked through my gate, not because the kingdom ever sent me the regiment I asked for." },
        { id = "nt_priest", when = { class = "PRIEST" },
          text = "You'll keep this the way you keep a confession, so I'll say it straight. I don't expect to take Andorhal with what I've got, and I count the camp twice a day because I'm afraid of the morning the number stops making sense." },
      },
      choices = {
        { text = "Then we'll make every sword count twice.", next = "BACK", fx = { affinity = 2, standing = { chillwind_camp = 1 } } },
        { text = "Does MacDonnell know you think that?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    need_shut = {
      lines = {
        { id = "ns_default", text = "I expect to do my duty, soldier, and so should you. Whatever else I think stays in my tent, where it can't frighten anyone." },
      },
      choices = { { text = "Understood, Commander.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A commander hears everything that comes through his gate, whether he wants to or not. Ask me about any of this and you'll get it straight." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll give you what any soldier at this camp would know, and no more. Pick one and be quick." },
    },
    background = { { id = "tp_ba", text = "I'm a soldier of Stormwind, and Stormwind sent me north to fight the Scourge. That's all the story you need, and all I've time to tell." } },
    advice = { { id = "tp_ad", text = "Never go out past the farms alone, and always come back before your water runs out. The wells up here will kill you slower than a ghoul, but they'll kill you." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "There are eight of them across Lordaeron and four in the west, breathing the plague over the farms. MacDonnell means to make them breathe something worse, and I've stopped asking her what." } },
    andorhal = { { id = "tp_andorhal", text = "It was a city once, and now it's a fortress for the dead with a lich at its heart. It's the whole reason this camp exists.", next = "andorhal" }, { id = "tp_andorhal2", text = "Andorhal's north of here, and nobody goes in without my say-so or a very good reason." } },
    scholomance = { { id = "tp_scholomance", text = "That's the Barovs' old home on Caer Darrow, where the necromancers learn their trade. Arbington knows more about it than any sane man should." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They're holding Hearthglen and they don't want our help, which is fine by me. They don't get to shoot at my scouts either, though, and they do." } },
    argent_dawn = { { id = "tp_dawn", text = "They're Pureheart's people, and they'll fight beside anyone at all. I don't care for all the company they keep, but I've never turned down a sword." } },
    _none = { { id = "tp_none", text = "If it isn't a threat to this camp, it isn't on my desk. Try Pureheart, who has more patience than I do." } },
  },
}

P:NPC {
  key = "macdonnell", id = TODO_NPC("High Priestess MacDonnell"), name = "High Priestess MacDonnell",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "sharp" }, values = { "devout", "fierce" },
  notices = { "class", "race" },

  impression = {
    first = "High Priestess MacDonnell speaks of the plague cauldrons with real appetite, as if each one were a personal insult. Her Light is the kind that burns, and she said so cheerfully.",
    third = "{name} met High Priestess MacDonnell at Chillwind Camp, who means to give the Scourge a dose of its own plague.",
  },

  greetings = {
    { id = "g_light", text = "The Light keep you, friend, and keep you upwind of the farms while it's at it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Tell me a cauldron coughed and choked out there, and you'll have made my whole day." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "One of the Light's own, good. Out here you'll learn it isn't only for healing. It burns too, if you ask it the right way." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Banshee's... no, forgive me, that's the old soldier in me talking. The Dawn would have me welcome you and I'll try, but I'd stand clear of the holy water if I were you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm High Priestess MacDonnell. The commander handles the war and I handle the cauldrons, those great pots breathing plague on every farm in the west, and I mean to give the Scourge a dose of its own brew." },
        { id = "h_brief", tags = { "news" }, when = { questActive = TODO_QUEST("The Scourge Cauldrons") },
          text = "There are four cauldrons, each one guarded by a cauldron lord who keeps the key on his belt. Kill him, take the key, fill a bottle with the muck, and I'll do the rest." },
        { id = "h_felstone", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Felstone Field") },
          text = "Felstone Field comes first, and the farm's crawling with skeletons, with something worse sitting by the cauldron with the key. Bring me a sample, and the fouler it is, the better." },
        { id = "h_dalson", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Dalson's Tears") },
          text = "Next is Dalson's Tears, named for the family who wept there, and I don't much care to learn why. Just get me that sample." },
        { id = "h_haunt", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Writhing Haunt") },
          text = "The Writhing Haunt has a tauren in the house there, they tell me, a druid, and he's dying. Be kind to him if you pass, and then get me my sample." },
        { id = "h_gahrron", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Gahrron's Withering") },
          text = "Gahrron's Withering is the last of the four and the worst of them, full of ghosts and wraiths. You'll want the Light close by when you go." },
        { id = "h_returned", when = { questRecent = { TODO_QUEST("Return to Chillwind Camp"), days = 2 } },
          text = "Arbington's been up all night with your sample, and he smells like a crypt, but he's happier than I've seen him in months. Well done, friend." },
        { id = "h_jars", when = { metBefore = true },
          text = "I label every sample jar myself, Felstone and Dalson's and the Haunt and Gahrron's. Arbington says my handwriting's worse than the plague, and Arbington is welcome to write his own labels." },
      },
      again = {
        { id = "h_again", text = "Something else on your mind? Ask away, I've a jar or two to label while you talk." },
        { id = "h_again2", text = "Go on, I'm listening, so long as you don't mind me working." },
      },
      choices = {
        { text = "What happens when you dose a cauldron?", next = "dose" },
        { text = "Where are the cauldrons?", next = "cauldrons" },
        { text = "What's the commander like to serve under?", next = "commander" },
        { text = "Teach me how the Light burns.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'll get your samples.", next = "END", fx = { affinity = 1, standing = { chillwind_camp = 1 }, learn = { "plague_cauldrons" } } },
      },
    },
    dose = {
      lines = {
        { id = "d_default", text = "We change the brew, so the plague from the pot eats the Scourge instead of the farmers. It lasts a day or two before someone has to do it all again, and that's the war out here, I'm afraid.", fx = { learn = { "plague_cauldrons" } } },
      },
      choices = {
        { text = "Poison against poison.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "It's a tidy answer, and it keeps the farmers alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Is that the Light's way?", next = "light" },
      },
    },
    light = {
      big = true,
      lines = {
        { id = "l_default", text = "The Light's way is to protect the living, and if that means stirring a necromancer's soup until it chokes him, then I'll stir. I'll pray first, mind you, and stir after." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd rather it burned clean.", next = "BACK", fx = { affinity = 1, align = { light = 1, order = 1 } } },
      },
    },
    cauldrons = {
      lines = {
        { id = "ca_default", text = "Four farms in the west, each with a pot of its own: Felstone Field, Dalson's Tears, the Writhing Haunt and Gahrron's Withering. They're good farms, or they were, and the people who worked them deserved better." },
      },
      choices = {
        { text = "Which is the worst?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = {
        { id = "wo_default", text = "Gahrron's Withering, without a doubt, where the dead aren't content to stay in their bones. Go to that one last, when you know the work, and take a friend who can heal." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll go there first, then.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    commander = {
      lines = {
        { id = "co_default", text = "He's hard, and he's fair, and he writes every letter home himself, which is more than most commanders bother with. I'd follow him into Andorhal, and I may yet have to." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "You ask it the way you'd ask for healing, but you hold the dead in your mind instead of the wounded. The Light knows the difference, and it answers hard when it finds something that oughtn't to be walking." },
      },
      choices = {
        { text = "I'll try it at Felstone Field.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "That sounds like anger, not faith.", next = "BACK", fx = { trait = { skeptical = 1 }, align = { light = -1 } } },
        { text = "Does the burning ever frighten you, Priestess?", tag = "Persuade", next = "priest_fear",
          check = { pass = { any = { { disposition = { min = 60 } }, { trait = "pious" }, { questDone = TODO_QUEST("Target: Felstone Field") } } } },
          fail = { next = "priest_brush", fx = { affinity = -1 } } },
      },
    },
    priest_fear = {
      lines = {
        { id = "pf_default", text = "Since you ask me as one of the Light's own, I'll tell you what I don't tell the soldiers. When I curse the dead, the Light answers me hot and quick, and when I pray for the living it comes soft as a whisper, and some nights I'm not sure I like what that says about me." },
      },
      choices = {
        { text = "It says the dead need burning more than the living need you.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll pray for you, Priestess.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_brush = {
      lines = {
        { id = "pb_default", text = "Frighten me? Bless you, I've no time to be frightened, not with four cauldrons to spoil. Ask me again when the pots are cold." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Between the commander's reports and Arbington's grumbling, I hear most of what goes on in this camp. Ask me about any of these, friend." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you I'll put the jars down a moment, and that's a rare honour. Here's what I can tell you about, and gladly." },
    },
    background = { { id = "tp_ba", text = "I'm a priestess of the Light and the commander's second, and that's enough of a life for anybody up here." } },
    advice = { { id = "tp_ad", text = "Keep a clean cloth over your mouth near the cauldrons, and say a prayer before you open any jar I give you." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "They're Kel'Thuzad's work, or his servants', eight pots across Lordaeron keeping the land sick. We can't break them, but we can spoil the recipe." } },
    andorhal = { { id = "tp_andorhal", text = "Andorhal's dead were people once, and I keep that in my prayers. I keep the rest of me for burning them." } },
    _none = { { id = "tp_none", text = "Unless it's in a jar, I'm afraid I don't know it. Try the commander." } },
  },
}

P:NPC {
  key = "arbington", id = TODO_NPC("Alchemist Arbington"), name = "Alchemist Arbington",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "cowardly" }, values = { "curious", "honest" },
  notices = { "craft", "greenness" },

  impression = {
    first = "Alchemist Arbington asked me to stand still, keep my elbows in and touch nothing, all in one anxious breath. Frightened as he is, he keeps working, and I respect that more than I expected.",
    third = "{name} met Alchemist Arbington, Chillwind Camp's nervous alchemist and reluctant student of the Scholomance.",
  },

  greetings = {
    { id = "g_busy", text = "Mind the cauldron, and mind the bottles, and actually, if you'd just stand right there and not move, I'd be ever so grateful." },
    { id = "g_back", when = { metBefore = true }, text = "You again! You're a terrible influence, you know. Every time you visit I end up doing something brave by proxy." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, how wonderful! Please don't touch the quickener, though, because it's thirty minutes from useless and about thirty seconds from my eyebrows." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 50 },
      text = "You're rather young for the Plaguelands, aren't you? I'm not judging, mind, since I'm rather old for them, and look how that's going." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Arbington, alchemist, at your service. I make the counter agent for MacDonnell's cauldrons and the quickener, and I've done more reading about the Scholomance than anyone ever should, so please don't ask me what I've read." },
        { id = "h_fragments", tags = { "news" }, when = { questActive = TODO_QUEST("Skeletal Fragments") },
          text = "Yes, a skeleton key made from skeletons, I hear it, and everyone says it. Just bring me the fragments, and the ones from Andorhal hold up best." },
        { id = "h_mold", tags = { "news" }, when = { questActive = TODO_QUEST("Mold Rhymes With...") },
          text = "Krinkle Goodsteel in Gadgetzan makes molds for nasty things and charges accordingly. I'd pay him myself, but if I had any gold of my own, would I be living here?" },
        { id = "h_scarab", tags = { "news" }, when = { questActive = TODO_QUEST("Araj's Scarab") },
          text = "The key needs a head, and that's Araj's scarab, his signet. He ran the Scholomance before he took Andorhal, so it ought to open his old door, and I'm fairly confident of that, or at least moderately." },
        { id = "h_key", when = { questDone = TODO_QUEST("The Key to Scholomance") },
          text = "You have the key, and you'll go in, won't you? I'd ask you to write and tell me what's inside, but I already know, and I'd rather not read it in your handwriting." },
        { id = "h_pay", when = { metBefore = true },
          text = "Stormwind pays me in coin, mud and the occasional ghoul through the tent wall. I did the sums once, and then I stopped doing sums altogether." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I don't mind, really, it's nice to talk to someone who isn't a bone." },
        { id = "h_again2", text = "Yes, yes, ask away, only keep your elbows in." },
      },
      choices = {
        { text = "Tell me about the Scholomance.", next = "scholo" },
        { text = "What's this key you're making?", next = "key" },
        { text = "Is the pay really that bad?", next = "pay" },
        { text = "Could the Light help with your work?", next = "priest", when = { class = "PRIEST" } },
        { text = "How does the focuser work?", next = "alch", when = { profession = "Alchemy" } },
        { text = "I'll get what you need.", next = "END", fx = { affinity = 1 } },
      },
    },
    scholo = {
      lines = {
        { id = "s_default", text = "It was the Barovs' keep on Caer Darrow, and they gave it to Kel'Thuzad, who made it a school for necromancers. Its door doesn't open for the likes of us, hence the key, and hence my nightmares.", fx = { learn = { "scholomance" } } },
      },
      choices = {
        { text = "How do you know so much?", next = "know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    know = {
      lines = {
        { id = "k_default", text = "Somebody had to study it, and better me, who'll never set foot inside, than someone who might. I read and I take notes, and afterwards I wash my hands for a very long time." },
      },
      choices = {
        { text = "That sounds hard.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    key = {
      lines = {
        { id = "ke_default", text = "It's a skeleton key in the most literal sense, I'm sorry to say. Bone fragments for the body, a mold to shape it, a fire hot enough to set it, and Araj's scarab for the head, and every one of those is somebody else's errand, which is to say yours." },
      },
      choices = {
        { text = "Why a mold from Gadgetzan?", next = "key_krinkle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    key_krinkle = {
      lines = {
        { id = "kk_default", text = "Because Krinkle Goodsteel will make a mold for anything if the gold is right, and nobody this side of the sea will touch the job. I don't ask how he sleeps at night, and I expect he doesn't ask how I do." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pay = {
      lines = {
        { id = "pa_default", text = "It's not that it's bad, exactly, only that it's the same as it would be in a nice warm shop in Stormwind, and nobody in Stormwind has ever had a ghoul come through the tent wall." },
      },
      choices = {
        { text = "You could always go home.", next = "BACK", fx = { trait = { blunt = 1 } } },
        { text = "The camp's lucky to have you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Oh, I'd love it to, but the Light and alchemy don't mix in a bottle, I've tried. Bless the people carrying my potions instead, and that'll do more good than blessing the potions." },
      },
      choices = {
        { text = "Then I'll bless the carriers.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A good potion does more than any blessing.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    alch = {
      lines = {
        { id = "al_default", text = "You carry it with you while you fight, and it catches what the creatures leave behind when they come apart. Leave it in your tent and you'll be bringing me plain bones, and I'll have to be polite about it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know a great deal more than anyone ought to about some very unpleasant subjects. These, specifically, if you can bear to hear about them." },
    },
    background = { { id = "tp_ba", text = "I'm an alchemist who studied the wrong school for too many years, and now Stormwind finds that useful, which I suppose is a sort of compliment." } },
    advice = { { id = "tp_ad", text = "Use the quickener the moment you get it, since it spoils in half an hour, and don't carry it in a pocket you're fond of." } },
    scholomance = { { id = "tp_scholomance", text = "Don't go in without a key and don't go in without friends, and if you can possibly manage it, don't go in at all." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "Bring me what the creatures carry, with the focuser on you, or it's just bones. Osseous, somatic and ectoplasmic sound terribly grand, but I promise you they aren't." } },
    _none = { { id = "tp_none", text = "That's out of my field, I'm afraid, as most things are out here. My field is very small and rather full of bones." } },
  },
}

P:NPC {
  key = "weldon", id = TODO_NPC("Weldon Barov"), name = "Weldon Barov",
  bible = "bibles/westernplaguelands.md", role = "noble", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "cowardly", "proud" }, values = { "greedy", "vengeful" },
  notices = { "race", "kit" },

  impression = {
    first = "Weldon Barov sleeps with a sword under his blanket and talks about his brother's death as an inheritance matter. Fear and greed have been sharing his face for a long time.",
    third = "{name} met Weldon Barov, the last living Barov, hiding from his brother's assassins at Chillwind Camp.",
  },

  greetings = {
    { id = "g_who", text = "Who sent you, and what's your business? Say it slowly, and keep your hands where I can see them." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the hired help returns. Any news of my brother? Good news, I mean, the kind where he's finally dead." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Stay back, guards, guards! Oh, a Forsaken, wearing the Alliance's colors? No, you're not, are you, and how you got past the sentries I don't care to know, so stay right there." },
    { id = "n_fine", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look dreadful, all rags and dents. Find the family fortune for me and you'll never have to dress like a peasant again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Weldon Barov, the last living Barov and the rightful heir to Caer Darrow, Brill, Tarren Mill and Southshore. My brother disagrees, but my brother is also dead, he simply refuses to lie down.",
          fx = { hear = "barov_heir" } },
        { id = "h_fortune", tags = { "news" }, when = { questActive = TODO_QUEST("Barov Family Fortune") },
          text = "There are four deeds somewhere in the Scholomance, and you must find them before Alexi's hired cutthroats do. I spared his life once, because that corpse wore my brother's face, and I won't make that mistake again." },
        { id = "h_last", tags = { "news" }, when = { questActive = TODO_QUEST("The Last Barov") },
          text = "The deeds are mine, and now only one thing stands between me and the fortune, sitting at the Bulwark like a vulture on a fence. End him for me." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Last Barov") },
          text = "So Alexi's gone, truly gone at last. I thought I'd feel something about it, but I find I mostly feel rich, and that will have to do." },
        { id = "h_sleep", when = { metBefore = true },
          text = "I sleep with my back to the cliff and a sword under my blanket, because of the assassins, you understand. He sends them, and in his place I'd do the same." },
      },
      again = {
        { id = "h_again", text = "Well? You're still here, so you must want something else." },
        { id = "h_again2", text = "Go on, then, but keep your voice down, the soldiers listen." },
      },
      choices = {
        { text = "What happened at Caer Darrow?", next = "darrow" },
        { text = "Your brother has a claim too.", next = "claim" },
        { text = "What's in these deeds?", next = "deeds" },
        { text = "My family lost everything in Lordaeron too.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Was it worth it, now he's gone?", next = "worth", when = { questDone = TODO_QUEST("The Last Barov") } },
        { text = "I'll see what I can find.", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I won't help a man who'd murder his own brother.", next = "END", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    darrow = {
      big = true,
      lines = {
        { id = "d_default", text = "My father bargained with Kel'Thuzad for immortality, and the whole house got it, after a fashion. I ran, being the only one of us with the sense to run." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You ran and left your family to it.", next = "darrow_ran", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "Running was the sensible thing to do.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    darrow_ran = {
      lines = {
        { id = "dr_default", text = "Left them to what, a wedding? They'd already signed, and there was nothing to save but my own neck, so I saved it. Judge me from inside a Barov's house some evening and see how brave you feel." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK" },
        { text = "I'd have stayed.", next = "BACK", fx = { affinity = -1, trait = { brave = 1 } } },
      },
    },
    claim = {
      lines = {
        { id = "c_default", text = "A claim? He's a corpse, and corpses don't inherit, they get buried. I'd have done him the courtesy myself, if I'd had a shovel and a little more spine." },
      },
      choices = {
        { text = "You spared him once, though.", next = "claim_spared" },
        { text = "Whose name is on those deeds, Weldon? Don't lie to me.", tag = "Intimidate", next = "claim_truth",
          check = { pass = { any = { { power = { "above", "far_above" } }, { trait = "stern" }, { class = { "WARRIOR", "PALADIN" } } } } },
          fail = { next = "claim_guards", fx = { affinity = -1 } } },
        { text = "Noted.", next = "BACK" },
      },
    },
    claim_spared = {
      lines = {
        { id = "cs_default", text = "I had him at my mercy and he looked at me with my brother's eyes, and I couldn't do it. It's the greatest regret of my life, and I've a long list to choose from." },
      },
      choices = {
        { text = "That was mercy, not weakness.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then let's correct it.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
      },
    },
    deeds = {
      lines = {
        { id = "de_default", text = "The family's deeds to Caer Darrow, to Brill, to Tarren Mill and to Southshore. Half of those places are full of the dead or of the Horde now, but paper outlasts armies, and I intend to be holding it when the armies are gone." },
      },
      choices = {
        { text = "Southshore's people may disagree.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Did you, now? Then you know what it is to lose a house, though I doubt yours had a ballroom. I'll say this much, it's rare I meet anyone up here who understands what was taken from us." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    worth = {
      big = true,
      lines = {
        { id = "wo_default", text = "Worth it? I have my deeds and my brother is ash, so by any honest accounting, yes. Ask me again in a year, when I've had time to miss him, and I'll tell you the same thing." },
      },
      choices = {
        { text = "I hope you find some peace.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, align = { honor = 1 } } },
        { text = "Enjoy the money.", next = "END", fx = { align = { honor = -1 } } },
      },
    },
    claim_truth = {
      big = true,
      lines = {
        { id = "ct_default", text = "Keep your voice down! Nobody's read those deeds since the Scourge came to the keep, so I don't know whose name is on them, and that's exactly why I need them before he does. He'll swear Father meant it all for him, I'll swear the opposite, and Father is in no state to settle it." },
      },
      choices = {
        { text = "So your claim is only as good as his.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Then whoever holds the paper wins.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    claim_guards = {
      lines = {
        { id = "cg_default", text = "Don't you dare raise your voice to me, I am a Barov and there are soldiers within shouting distance! The deeds are mine, and that's all you need to know, hireling." },
      },
      choices = {
        { text = "Calm down, Weldon.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know my family's business better than anyone living, which isn't a large field these days. Ask me about any of this, quietly." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll tell you only what anyone in this mud camp could, and keep your hands where I can see them while I do." },
    },
    background = { { id = "tp_ba", text = "I'm a Barov of Caer Darrow, and the only one of us still breathing. Whatever else you've heard was put about by my brother.", next = "darrow" } },
    advice = { { id = "tp_ad", text = "Never sign anything a necromancer hands you, however good the terms look. It's the only family wisdom I have left." } },
    scholomance = { { id = "tp_scholomance", text = "It was my home, and a beautiful one once. Now they teach the dead to walk in my mother's ballroom." } },
    _none = { { id = "tp_none", text = "Does it concern my inheritance? If not, it doesn't concern me." } },
  },
}

P:NPC {
  key = "pureheart", id = TODO_NPC("Argent Officer Pureheart"), name = "Argent Officer Pureheart",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp", "argent_dawn" }, temper = { "steady" }, values = { "devout", "fair" },
  notices = { "race", "class" },

  impression = {
    first = "Argent Officer Pureheart keeps a table where nobody draws steel, whatever colors they wear. There's an easy warmth to her that seems to have been earned the hard way.",
    third = "{name} met Argent Officer Pureheart, who speaks for the Argent Dawn at Chillwind Camp.",
  },

  greetings = {
    { id = "g_dawn", text = "For the Dawn, friend, and whatever else you fight for, add that to it." },
    { id = "g_back", when = { metBefore = true }, text = "Well met again. Have you any scourgestones in your pack? The Dawn will always take them off your hands." },
  },

  notice = {
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "Horde, in an Alliance camp, so easy, everyone, because nobody draws steel at my table. The Dawn doesn't ask what colors you wear, only whether you'll fight the dead." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Silver Hand? I was too, until Mograine fell and the order went red. Tyrosus and I walked out the same day, and don't let anyone tell you which side the Light chose." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Argent Officer Pureheart, of the Argent Dawn. We're no kingdom, only people who fight the Scourge, and anyone who fights it is our friend. Alliance and Horde are all one to the dead." },
        { id = "h_commission", tags = { "news" }, when = { questActive = TODO_QUEST("Argent Dawn Commission") },
          text = "Wear the commission, and you'll find the Scourge carry stones, the dark power that binds them made solid. Bring those stones to me, and the Dawn will remember who helped." },
        { id = "h_everlook", tags = { "news" }, when = { questActive = TODO_QUEST("The Everlook Report") },
          text = "Gregor's report? He's a good man, and I sent him to Everlook to keep the Dawn's ear among the goblins. Let me read it while it's still warm." },
        { id = "h_gregor", when = { heardLine = "gregor.h_default" },
          text = "You've been to Everlook, then you've met Gregor Greystone, who's one of mine. Tell me he's eating properly, because he forgets." },
        { id = "h_tyrosus", when = { heardLine = "tyrosus.h_default" },
          text = "You've spoken with Lord Tyrosus? Then you've had more of his time than I have this year. Is he well? He'd never say if he wasn't." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? The Dawn has no secrets worth keeping from a friend." },
        { id = "h_again2", text = "Ask what you like, friend; the Dawn's work keeps till you're done." },
      },
      choices = {
        { text = "Why did you leave the Silver Hand?", next = "left" },
        { text = "What does the Dawn ask of me?", next = "commission" },
        { text = "Who is Gregor, in Everlook?", next = "gregor" },
        { text = "I serve the Light too. Where do priests stand?", next = "priest", when = { class = "PRIEST" } },
        { text = "I was raised in the Silver Hand's teachings.", next = "paladin", when = { class = "PALADIN" } },
        { text = "Your soldiers don't look pleased to see me.", next = "horde", when = { faction = "Horde" } },
        { text = "I'll bring you stones.", next = "END", fx = { affinity = 1, learn = { "argent_dawn" } } },
      },
    },
    left = {
      big = true,
      lines = {
        { id = "l_default", text = "When Mograine died, the order's grief turned to hate, and the hate turned on anyone who wasn't them, and that's the Scarlet Crusade. Some of us wanted to fight the plague, not every face that looked different.", fx = { learn = { "argent_dawn", "scarlet_crusade" } } },
      },
      choices = {
        { text = "You chose rightly.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Hate or not, the Crusade gets results against the dead.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "The Crusade still fights the Scourge.", next = "crusade" },
      },
    },
    crusade = {
      lines = {
        { id = "c_default", text = "They do, and bravely, but they'd also burn half the people in this camp for being the wrong sort of alive. I'll pray for them gladly, but I won't march with them." },
      },
      choices = { { text = "Understood.", next = "BACK", fx = { affinity = 1 } } },
    },
    commission = {
      lines = {
        { id = "cm_default", text = "Carry the Dawn's commission and fight the dead, and bring me the scourgestones they drop. That's the whole of it, and it's honest work, whoever you are." },
      },
      choices = {
        { text = "What becomes of the stones?", next = "stones" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones = {
      lines = {
        { id = "st_default", text = "Every stone is a binding that won't hold a corpse upright again, and the Dawn keeps careful count of who brings them in. Bring enough and you'll find our quartermasters know your name." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } } },
    },
    gregor = {
      lines = {
        { id = "gr_default", text = "Gregor Greystone keeps the Dawn's post in Everlook, up in Winterspring, where every traveler bound for the north passes through. He writes a fine report and forgets to eat, and I worry about the second more than the first." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Right beside the paladins, and some days in front of them. A wounded defender who walks home is worth three who don't. If you've the Light in your hands, the Dawn has more use for it than you can imagine." },
      },
      choices = {
        { text = "Then put me to work.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { chillwind_camp = 1 } } },
        { text = "I'll keep my Light for my own fights, thank you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin = {
      lines = {
        { id = "pa_default", text = "Then hold on to the teaching and let go of the banner, which hangs in Hearthglen now, and it's gone red. The Light was never in the cloth, and the Dawn can show you that." },
      },
      choices = {
        { text = "I'll think on it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The banner meant something, and I won't let go of it.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    horde = {
      lines = {
        { id = "ho_default", text = "Some of them fought the Horde in the last war, or lost family to it, so give them time, and give them no excuse. If anyone here lays a hand on you, it'll be me they answer to." },
      },
      choices = { { text = "Fair. I'll keep my head down.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Dawn keeps careful records, and a good few of them cross my table. Ask me about any of these, friend." },
    },
    background = { { id = "tp_ba", text = "I was a paladin of the Silver Hand, and now I'm an officer of the Argent Dawn. The second was the harder choice, and the better one.", next = "left" } },
    advice = { { id = "tp_ad", text = "Fight beside whoever's fighting the dead, and argue about the rest when the dead are gone." } },
    argent_dawn = { { id = "tp_dawn", text = "Lord Tyrosus leads us from Light's Hope, but out here it's me, a few defenders and whoever answers the call, and more answer every month." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They were my brothers and sisters, and I miss who they were, but I'm afraid of who they've become." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend. If it has to do with the Scourge, ask me again, and for anything else, try the commander." } },
  },
}

P:NPC {
  key = "dumah", id = TODO_NPC("Nathaniel Dumah"), name = "Nathaniel Dumah",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "steady" }, values = { "loyal", "stubborn" },
  notices = { "race", "craft" },

  impression = {
    first = "Nathaniel Dumah came back to the Plaguelands for his father's mill, which says a good deal about him. He talks easily, and asks after Northridge like a man asking after family.",
    third = "{name} met Nathaniel Dumah at Chillwind Camp, who wants his family's Northridge mill back from the Scarlet Crusade.",
  },

  greetings = {
    { id = "g_mill", text = "Good afternoon, or whatever this is, since the sky never seems to decide up here." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Any word from Northridge? Bad news counts too, for I'd rather know than wonder." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You've a northern look about you, from Lordaeron before the war, maybe? Don't tell me if it hurts, because most of us who got out don't talk about it." },
    { id = "n_lumber", cat = "craft", when = { profession = { "Engineering", "Blacksmithing" } },
      text = "You work with your hands, I can tell, and my father would have liked you for it. He always judged a man by his calluses." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nathaniel Dumah. My father ran the Northridge Lumber Mill before the plague, and we fled to Stormwind with what we could carry, but now the Scarlet Crusade's sitting in our mill, so I've come back." },
        { id = "h_termites", tags = { "news" }, when = { questActive = TODO_QUEST("A Plague Upon Thee") },
          text = "Swords didn't work, so I'm trying termites, a Plaguewood breed that lived through the plague and the Scourge both. Fill this jar for me, and let's see the Crusade hold a mill that's being eaten out from under them." },
        { id = "h_done", when = { questDone = TODO_QUEST("A Plague Upon Thee") },
          text = "I almost feel sorry for them, sitting in a mill that's falling down around their ears. Almost, but it was never their mill to begin with." },
        { id = "h_father", when = { metBefore = true },
          text = "Father used to say a mill's only as good as its river, and the river's still there, sick as it is. That's more than I can say for most of Northridge." },
      },
      again = {
        { id = "h_again", text = "Something else you wanted to ask? Go ahead, I don't mind talking." },
        { id = "h_again2", text = "Still here? Good, it's nice to have someone to talk to who isn't a soldier." },
      },
      choices = {
        { text = "What happened to your family?", next = "family" },
        { text = "Why termites?", next = "termites" },
        { text = "Tell me about the mill.", next = "mill" },
        { text = "I fled Lordaeron too, when I was young.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "I'll help you take it back.", next = "END", fx = { affinity = 2, standing = { chillwind_camp = 1 } } },
      },
    },
    family = {
      lines = {
        { id = "f_default", text = "We lost friends and cousins, some we buried and some we never got the chance to. Father made it to Stormwind and never stopped talking about the mill, so you see, I'm not really here for the wood." },
      },
      choices = {
        { text = "You're here for him.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Revenge, then.", next = "revenge", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    revenge = {
      lines = {
        { id = "rv_default", text = "Call it what you like, I won't argue with you. I only know I couldn't sit in Stormwind any longer while men in red tabards sat in my father's mill and called it theirs." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    termites = {
      lines = {
        { id = "te_default", text = "Because I'm one man with a jar and they're a whole garrison with swords. A mill is wood from top to bottom, and the Plaguewood termites will eat through it faster than any carpenter could mend it." },
      },
      choices = {
        { text = "You'd ruin your own mill?", next = "termites_ruin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    termites_ruin = {
      lines = {
        { id = "tr_default", text = "I'd rather it fell down than stood up for them. We can always build another mill on the same river, but we can't build it while the Crusade's living in it." },
      },
      choices = {
        { text = "That's a hard choice.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Clever. Cruel, but clever.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'd rather we took the mill back whole, and properly.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    mill = {
      lines = {
        { id = "mi_default", text = "It's up in Northridge, north of the farms, and it was my father's pride. The Crusade holds it now and works it for their own, and I'd wager they've never once thanked the river." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Then you know, and I don't need to explain anything to you. It's strange coming back, isn't it, seeing the roads you walked as a child and nobody left on them to say hello to." },
      },
      choices = {
        { text = "It is. I'm glad you came back.", next = "BACK", fx = { affinity = 3 } },
        { text = "I try not to look.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've not been back long, but I've asked about everything that touches my father's mill. Ask me about any of these and I'll tell you what I've learned." },
    },
    background = { { id = "tp_ba", text = "I'm a miller's son from Northridge who grew up in Stormwind, and now I've come home to a place that doesn't want me back.", next = "family" } },
    advice = { { id = "tp_ad", text = "Don't drink from the rivers up here, however clear they look. The plague's in the water as much as the soil." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They fight the Scourge, and I'll grant them that, but they also took a family's home and called it holy work." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, I'm afraid. I know timber, and I know grief, so pick one of those." } },
  },
}

P:NPC {
  key = "bibilfaz", id = TODO_NPC("Bibilfaz Featherwhistle"), name = "Bibilfaz Featherwhistle", title = "Gryphon Master",
  bible = "bibles/westernplaguelands.md", role = "flightmaster", tier = "service",
  communities = { "chillwind_camp" }, temper = { "jovial" }, values = { "cheerful" },
  notices = { "race" },

  impression = {
    first = "Bibilfaz Featherwhistle chatters to his gryphons at night about Ironforge pastries. He is the cheeriest thing in the Plaguelands, and I suspect he's working very hard at it.",
    third = "{name} met Bibilfaz Featherwhistle, the gnomish gryphon master at Chillwind Camp.",
  },

  greetings = {
    { id = "g_fly", text = "Wings ready! Well, their wings are ready, anyway, since mine are purely theoretical." },
    { id = "g_back", when = { metBefore = true }, text = "Back for a ride? Good timing, too, since Snowtail's in a mood today, so I'll give you the nice one." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, out here, of all places! I've been talking to gryphons for weeks, and they're lovely creatures, but they really aren't much for conversation." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bibilfaz Featherwhistle, gryphon master! I can take you to Ironforge, or Aerie Peak, or Light's Hope if you're feeling brave, and the birds hate the smell up here as much as you do, so they fly fast." },
        { id = "h_home", when = { metBefore = true },
          text = "I tell the gryphons about Ironforge at night, the forges and the tram and the pastries in the Commons. I think they're homesick too, or possibly just hungry, it's hard to tell with gryphons." },
      },
      again = { { id = "h_again", text = "Anything else? The birds aren't going anywhere without me, so take your time." } },
      choices = {
        { text = "Where's safest to fly?", next = "routes" },
        { text = "How do the gryphons cope up here?", next = "gryphons" },
        { text = "Let's fly.", next = "BUSINESS" },
      },
    },
    routes = {
      lines = {
        { id = "r_default", text = "Aerie Peak, every time, since the Wildhammer keep their skies clean and their ale cold. Light's Hope is the brave one, as you fly right over the worst of the Plaguelands to get there, so hold on tight and don't look down." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Let's fly.", next = "BUSINESS" },
      },
    },
    gryphons = {
      lines = {
        { id = "gy_default", text = "Better than you'd think, honestly, though they won't land anywhere near Andorhal however nicely I ask. I give them extra feed when the wind blows from the north, and they forgive me for bringing them here." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let's fly.", next = "BUSINESS" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Never feed a gryphon from your hand unless you're fond of only having nine fingers!" } },
    _none = { { id = "tp_none", text = "No idea at all, I'm afraid! But I can fly you to someone who might know." } },
  },
}
