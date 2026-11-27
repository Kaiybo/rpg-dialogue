-- More of Darkshire: the council's ambassador, a Carevin who sells mushrooms, and six of the Night
-- Watch who walk the town and its roads. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Ambassador Berrybuck: a member of the Council of Darkshire in the town hall.
P:NPC {
  key = "berrybuck", id = TODO_NPC("Ambassador Berrybuck"), name = "Ambassador Berrybuck", title = "Council of Darkshire", gender = "male",
  bible = "bibles/more_folk.md", role = "noble", tier = "service",
  communities = { "darkshire" }, temper = { "pompous" }, values = { "order", "status" },
  notices = { "status", "kin" },
  impression = {
    first = "He wears his best coat in a town where nobody else bothers.",
    third = "{name} met Ambassador Berrybuck of the Council of Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my friend, how good to see you! I've mentioned you in two letters to the city already, and I mean to make it three." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ah, it's you. I'll not be mentioning you in my letters to Stormwind, I'm afraid, except perhaps as a caution." },
    { id = "g_x1", when = { questDone = TODO_QUEST("The Night Watch") }, text = "The Commander tells me you have been of real service to the Watch. I shall mention you by name in my next letter, for whatever good a name does." },
    { id = "g_default", text = "Welcome to the town hall of Darkshire. If you've come from Stormwind, I have several letters I'd like you to carry back." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Any word from the city? No, I thought not." },
  },
  notice = {
    { id = "n_x1", cat = "status", when = { origin = "human_minor_noble" },
      text = "A family with a seat in the House of Nobles! Then you will know which of those gentlemen actually reads his correspondence, and I should dearly like the name." },
    { id = "n_x2", cat = "kin", when = { class = { "PRIEST", "PALADIN" } },
      text = "The Church has sent you, I hope? I asked the Cathedral for two priests in the spring and received a pamphlet on patience." },
    { id = "n_status", cat = "status", when = { minLevel = 30 },
      text = "You've the look of someone who's been places and been listened to. Perhaps Stormwind would listen to you, where it won't listen to me." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A subject of the crown! Then you'll understand the indignity of a town that pays its taxes and gets no soldiers for them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ambassador Berrybuck, of the Council of Darkshire. My office is to speak for this town to the House of Nobles, which I do, often and at length, and which they ignore with equal diligence." },
      },
      again = {
        { id = "h_x_again1", text = "Yes? I am at your disposal, between paragraphs." },
        { id = "h_again", text = "Is there anything else? I have a letter to finish." },
        { id = "h_again2", text = "Go on. The council's business can wait a moment." },
      },
      choices = {
        { text = "What do you ask Stormwind for?", next = "ask" },
        { text = "Who sits on the council?", next = "council" },
        { text = "Darkshire should look after itself.", next = "itself" },
        { text = "You write a great many letters, Ambassador.", next = "letters" },
        { text = "What does the town hall do, day to day?", next = "hall" },
        { text = "I've stood before the nobles. I could carry your letter.", next = "carry", when = { faction = "Alliance", minLevel = 25 } },
        { text = "Good day, Ambassador.", next = "END" },
      },
    },
    ask = {
      lines = { { id = "a_default", text = "Soldiers, chiefly, and lamp oil, and a priest or two for the dead who won't stay buried. What we receive is a letter thanking us for our patience, and I have a drawer full of them." } },
      choices = {
        { text = "Why won't Stormwind send help?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Defias are closer to their gates than the worgen are, and the nobles fear for their own houses first. I don't say they're wrong to, only that Darkshire's houses burn just as well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    council = {
      lines = { { id = "c_default", text = "Lord Ello presides, of course, and Councilman Millstipe keeps the grievances, which he does with great passion. I carry them to the city, and Commander Ebonlocke tells us what the Watch needs, which is everything.", fx = { learn = { "night_watch" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    itself = {
      big = true,
      lines = { { id = "i_default", text = "It does, sir, every night, with lamps and a handful of farmers in the Watch's colours. But we are subjects of the crown and we pay its taxes, and a crown that takes and gives nothing is no crown worth the name." } },
      choices = {
        { text = "You're right. The crown owes you its protection.", next = "BACK", reply = "Thank you! Would you put that in writing? I'd attach it to my next letter.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Waiting on nobles won't save anyone. Act yourselves.", next = "BACK", reply = "We do act, but a council can't hold a sword, and I can only write letters.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters = {
      lines = {
        { id = "letters_1", text = "One a week to the House of Nobles, one a fortnight to Lady Prestor's office, and one a month to the Cathedral, which is the only one that answers. Clerk Daltry copies each of them into the town record, so that somebody at least will have read them." },
      },
      choices = {
        { text = "What did the last one say?", next = "lastletter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lastletter = {
      lines = {
        { id = "lastletter_1", text = "It set out, with figures, how many lamps the Watch burns in a month and how many watchers it has buried in a year. I ended it by observing that Darkshire is nearer to Stormwind than Stormwind appears to believe." },
        { id = "lastletter_2", when = { questDone = TODO_QUEST("The Legend of Stalvan") }, text = "I have since added a page on the Mistmantle business, which you had some hand in ending. A town that must lean on passing strangers to lay its ghosts is a town the crown has forgotten." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hall = {
      lines = {
        { id = "hall_1", text = "Lord Ello hears petitions, Clerk Daltry keeps the records, and Councilman Millstipe keeps a list of everything that has gone wrong since the sky darkened. The Commander comes in from the square when she needs something signed, and she never stays to sit down." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      big = true,
      lines = {
        { id = "carry_1", text = "Would you? A letter handed over by someone the nobles have already seen is worth ten sent by courier, because a courier can be left waiting in a hall. I must warn you that they will be polite to you, and that politeness is the whole of what Darkshire has had from them." },
      },
      choices = {
        { text = "I'll make them listen. Darkshire is owed an answer.", next = "BACK", reply = "Then the council is in your debt, and I do not say that lightly.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Letters are wasted ink. Hire swords with the tax money instead.", next = "BACK", reply = "Withhold the crown's taxes? Sir, that is how a town stops being a town and becomes a camp.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "They say a goblin on the north road sells lamp oil at twice the Stormwind price. I have written to Stormwind about that, too." } },
    worgen = { { id = "tp_x_worgen", text = "The Watch calls them worgen, and nobody on the council can tell me where they came from. I put the question in every third letter." } },
    background = { { id = "tp_bg", text = "I was a clerk in Stormwind once, and I came here to speak for Darkshire. I've been speaking ever since, and nobody's been listening." } },
    night_watch = { { id = "tp_nw", text = "Brave men and women, and far too few of them. The council pays them in lamp oil and gratitude." } },
    _none = { { id = "tp_none", text = "That's not a matter for the council, I'm afraid." } },
  },
}

-- Scott Carevin: a Carevin who sells mushrooms in Darkshire.
P:NPC {
  key = "scott_carevin", id = TODO_NPC("Scott Carevin"), name = "Scott Carevin", title = "Mushroom Seller", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "cheerful" }, values = { "practical" },
  notices = { "craft" },
  impression = {
    first = "He is the only one in town pleased by dark and damp.",
    third = "{name} met Scott Carevin, who sells mushrooms in Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back for more mushrooms! I knew you'd come round, and the pale ones are in the dampest corner, just as they like it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The mushrooms don't mind you, but I do, so take what you want and leave the lamp low." },
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Mushrooms by lamplight! They look better in the dark, I always think, and so do most things in Darkshire." },
    { id = "g_default", text = "Mushrooms, fresh from the forest! Well, as fresh as anything is around here." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I knew you'd come round to mushrooms. Everyone does, eventually." },
  },
  notice = {
    { id = "n_x1", cat = "craft", when = { profession = "Herbalism" },
      text = "You've an herb-picker's fingernails, friend. If you see grave moss out by the cemeteries, leave my mushrooms beside it be, and we'll both do well." },
    { id = "n_x2", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! Don't ask me which of these go in a potion, because I only know which go in a stew, and the two lists had better not be the same." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you'll know a good mushroom when you see one, and these are good ones, I promise you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Scott Carevin, and I sell the only thing that grows well in Duskwood, which is mushrooms. The forest's dark and it's wet, and the mushrooms love it." },
      },
      again = {
        { id = "h_x_again1", text = "What else can I tell you? It will probably be about mushrooms." },
        { id = "h_again", text = "Anything else? I've a basket to sort." },
        { id = "h_again2", text = "Go on, then. Mushrooms don't mind waiting." },
      },
      choices = {
        { text = "Folk should know which of your mushrooms are poisonous.", next = "BACK", reply = "Of course they should! I label every basket, and the ones with the skull are for decoration, mostly. Nobody's died on my account yet.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Let the careless pick the wrong mushroom; it's their lookout.", next = "BACK", reply = "That's a cold thing to say, even for Darkshire. I'd rather sell a hundred safe ones than bury one fool.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your mushrooms.", next = "BUSINESS" },
        { text = "Where do you pick them?", next = "pick" },
        { text = "Carevin? Are you kin to the hunters?", next = "kin" },
        { text = "How can you be so cheerful here?", next = "cheerful" },
        { text = "Darkshire must eat a lot of mushrooms.", next = "eat" },
        { text = "You're the first cheerful face I've seen in this town.", next = "face" },
        { text = "What would you cook with these?", next = "cook", when = { profession = "Cooking" } },
        { text = "Good day.", next = "END" },
      },
    },
    pick = {
      lines = { { id = "p_default", text = "Wherever they grow, which is everywhere, though the best are near the graveyards, I'm sorry to say. I go out in the morning, when the worgen are sleeping, and I'm back by noon." } },
      choices = {
        { text = "Near the graveyards? Is that safe?", next = "safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Safe enough, in daylight, with the Watch nearby. The dead don't care much for mushrooms, as far as I can tell." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "We're all Carevins, aye, though I'm the one who sells mushrooms and leaves the hunting to the others. Somebody in the family has to do something that doesn't involve a crossbow.", fx = { learn = { "carevins" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cheerful = {
      big = true,
      lines = { { id = "c_default", text = "Because if I wasn't, I'd be like everyone else here, staring into the dark and waiting for something to come out of it. I'd rather sell mushrooms and smile." } },
      choices = {
        { text = "That's a good way to live.", next = "BACK", reply = "It's the only way I know. Thank you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Smiling won't keep the worgen away.", next = "BACK", reply = "No, but it keeps me from going mad, and that's something.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eat = {
      lines = {
        { id = "eat_1", text = "More than it would like to, with the farms gone dark and the wagons from Elwynn coming once a month if they come at all. Chef Grual at the Scarlet Raven takes a basket every morning, and he does things with them I'd never have thought of." },
      },
      choices = {
        { text = "What does Grual do with them?", next = "grual" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grual = {
      lines = {
        { id = "grual_1", text = "He stews them with whatever the hunters bring in, and lately he's been asking adventurers for spider parts, of all things. I don't ask what goes in the pot, and neither should you, but folk clean their plates." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    face = {
      lines = {
        { id = "face_1", text = "So people tell me, and Innkeeper Trelayne says it's unnatural. But the Watch walks past my baskets every night on their rounds, and I notice they slow down when I say good evening, so I keep saying it." },
        { id = "face_2", when = { class = { "PRIEST", "PALADIN" } }, text = "So people tell me, though I'd have thought one of the Light's own would be the cheerful one. I say good evening to every watcher who passes my baskets, and that's the whole of my ministry." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = {
        { id = "cook_1", text = "Slice them thin and fry them in butter, if you can find butter, and put them over anything that used to be an animal. Don't boil them, whatever Grual says, because a boiled mushroom tastes like the rain that grew it." },
      },
      choices = {
        { text = "I'll remember that. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    raven_hill = { { id = "tp_y_raven_hill", text = "The best mushrooms in Duskwood grow there, and I've not been in two years. That tells you what's become of the place." } },
    worgen = { { id = "tp_x_worgen", text = "I've seen them at the wood's edge at dawn, and that's as close as I ever mean to get. That's why I pick in the morning and I'm home by noon." } },
    carevins = { { id = "tp_x_carevins", text = "Elaine and Jonathan are out with their crossbows most nights, and I'm here with my baskets. Every family needs one member who's home for supper." } },
    advice = { { id = "tp_x_advice", text = "Never pick the ones with the red caps near Raven Hill. I don't know what they do, and I mean to keep it that way." } },
    background = { { id = "tp_bg", text = "A Carevin, and a mushroom man. That's all there is to it." } },
    _none = { { id = "tp_none", text = "I only know mushrooms, I'm afraid. Ask me about mushrooms." } },
  },
}

-- Watcher Callahan: guards the road north of Darkshire, near the goblin trader's wagon.
P:NPC {
  key = "watcher_callahan", id = TODO_NPC("Watcher Callahan"), name = "Watcher Callahan", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "wry" }, values = { "dutiful" },
  notices = { "watch" },
  impression = {
    first = "He isn't sure whether he guards the road or the goblin.",
    third = "{name} met Watcher Callahan of the Night Watch, posted on the road north of Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are, {class}! The goblin and I were just saying the road's been quieter with you walking it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Keep walking, {class}, and keep your business with the goblin, not with me." },
    { id = "g_y1", when = { race = "Human", class = "WARRIOR" }, text = "A Stormwind sword, on my road? Don't tell me they've finally sent the company we asked for, because one of you is a thin sort of company." },
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Stay on the road and keep that light up, {class}. The goblin's lantern is the only other one between here and the bend." },
    { id = "g_default", text = "Halt, {class}, and state your business. Unless it's with the goblin, in which case go on, he's expecting you." },
    { id = "g_back", when = { metBefore = true }, text = "Back on this road? It's not much of a road, but it's mine." },
  },
  notice = {
    { id = "n_x1", cat = "watch", when = { race = "Gnome" },
      text = "A gnome on the north road! Kzixx will want to sell you something with gears in it, and I'd count my fingers after shaking his hand." },
    { id = "n_x2", cat = "watch", when = { profession = "Engineering" },
      text = "You've the look of someone who buys odd parts from odd people. The goblin's wagon is right there, and he's been waiting on a customer all day." },
    { id = "n_watch", cat = "watch", when = { minLevel = 20 },
      text = "You look like you can handle yourself. The road north gets worse past the bend, so keep your eyes open." },
  },
  start = "hello",
  nodes = {
    cal_lan1 = {
      lines = {
        { id = "cal_lan1_1", text = "It's a mining lantern, bought off Kzixx, and it's the only thing I've ever bought from him that was worth the price. Watcher Jan grumbles that it eats oil like a pig eats slops, but out here the light is the whole of the job." },
      },
      choices = {
        { text = "Why is the light the whole of the job?", next = "cal_lan2" },
        { text = "A dwarf would call that a fine lantern.", next = "cal_lan3", when = { race = "Dwarf" } },
        { text = "Something else, Callahan.", next = "BACK" },
      },
    },
    cal_lan2 = {
      lines = {
        { id = "cal_lan2_1", text = "Because the worgen in these woods don't care to be looked at, and a man who can see far enough sees them first. They'll circle the lantern all night and never step into it, though I've counted the eyes more than once and lost the count." },
      },
      choices = {
        { text = "Then keep it lit, and keep counting.", next = "cal_lan3" },
        { text = "I'll leave you to your post.", next = "BACK" },
      },
    },
    cal_lan3 = {
      lines = {
        { id = "cal_lan3_1", text = "It's Ironforge make, I'm told, though how a goblin came by it I didn't ask. The glass is thick as my thumb and the wick never smokes, and if I'm honest I'd guard it before I'd guard the wagon." },
      },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    cal_bend1 = {
      lines = {
        { id = "cal_bend1_1", text = "Past the bend the trees close in over the road, and that's where the Brightwood starts, or what's left of it. Calor out of Darkshire sends folk up there after the worgen, and fewer of them come back down than went up." },
      },
      choices = {
        { text = "What happened to Brightwood?", next = "cal_bend2" },
        { text = "I've hunted the worgen up there for Calor.", next = "cal_bend3", when = { questDone = TODO_QUEST("Worgen in the Woods") } },
        { text = "That's enough of the road for now.", next = "BACK" },
      },
    },
    cal_bend2 = {
      lines = {
        { id = "cal_bend2_1", text = "It was the best timber in the kingdom, once, and the loggers had a camp in every clearing. When the dark came down the loggers left and the worgen moved in, and now the old camps are their dens." },
      },
      choices = {
        { text = "Someone should burn the dens out.", next = "cal_bend3" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    cal_bend3 = {
      lines = {
        { id = "cal_bend3_1", text = "Calor would agree with you, and he's said as much to the council. The trouble is that for every den you clear another fills, as if the woods breed them, and I've stopped believing there's an end to it." },
      },
      choices = {
        { text = "Then the Watch holds the road, and that's enough.", next = "BACK" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Callahan, Night Watch, posted on the north road. Commander Ebonlocke sent me to keep it clear, and somewhere along the way I became the goblin's guard as well." },
      },
      again = {
        { id = "h_x_again1", text = "Still here? So am I, and so is the goblin." },
        { id = "h_again", text = "Anything else? The road's quiet, for now." },
        { id = "h_again2", text = "Go on. I've nowhere to be." },
      },
      choices = {
        { text = "A watcher should guard every traveller on the road, rich or poor.", next = "BACK", reply = "Aye, and the poor ones are most of them, these days. Whatever the goblin's customers pay, they get no better guarding than the farmers.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Guard the ones who pay you, and let the rest fend.", next = "BACK", reply = "That's the goblin's way of thinking, not the Watch's. I'll pretend I misheard you, {class}.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why guard the goblin?", next = "goblin" },
        { text = "What's on the road north?", next = "road" },
        { text = "Does the Watch pay well?", next = "pay" },
        { text = "That's a long way from town for one watcher.", next = "alone" },
        { text = "What does Kzixx sell out here?", next = "wares" },
        { text = "I came down from Redridge. The road is no better there.", next = "redridge", when = { faction = "Alliance", minLevel = 20 } },
        { text = "You keep that lantern burning brighter than the town lamps.", next = "cal_lan1" },
        { text = "Tell me about the bend in the road.", next = "cal_bend1" },
        { text = "Good day.", next = "END" },
      },
    },
    goblin = {
      lines = { { id = "g_goblin", text = "Because he sells things the town needs, and if the worgen eat him, nobody else will. He also pays a little for the trouble, which the Commander says I'm not to take, and which I'm not taking." } },
      choices = { { text = "Of course not. Something else.", next = "BACK" } },
    },
    road = {
      lines = { { id = "r_default", text = "Worgen in the woods, the odd gnoll from Redridge, and the dead from the graveyards when the night's dark. Nothing good, in short, and plenty of it.", fx = { learn = { "worgen" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pay = {
      big = true,
      lines = { { id = "p_default", text = "In lamp oil, mostly, and the knowledge that we're keeping Darkshire safe. Some nights that's enough, and some nights I wonder." } },
      choices = {
        { text = "Keeping folk safe is worth more than coin.", next = "BACK", reply = "It is, most nights. Thank you for reminding me.", fx = { align = { light = 1 } } },
        { text = "Then take the goblin's coin. You've earned it.", next = "BACK", reply = "Maybe I have, but the Commander wouldn't see it that way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = {
        { id = "alone_1", text = "It is, and I've told the Commander so. She says the Watch has thirty roads' worth of trouble and a dozen watchers, and that one man who can shout is enough to give the town warning." },
      },
      choices = {
        { text = "Who hears you shout?", next = "shout" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shout = {
      lines = {
        { id = "shout_1", text = "Watchmaster Sorigal, if the wind's right, and the goblin, who'd be over the hill before I'd finished. I've only had to do it twice, and both times the town had its lamps lit before I got back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wares = {
      lines = {
        { id = "wares_1", text = "Schematics, mostly, and the odd bit of gnomish clockwork that he swears fell off a wagon. He sets up here because Darkshire won't give him a stall, and because the road from Redridge passes right by his wheels." },
        { id = "wares_2", when = { profession = "Engineering" }, text = "Schematics, which you'd understand better than I do, and parts he swears fell off a wagon. He sets up here because Darkshire won't give him a stall, and he says engineers will walk a mile for a bargain." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    redridge = {
      lines = {
        { id = "redridge_1", text = "So I hear from every traveller who comes down it. Lakeshire's got orcs in the hills and gnolls on the road, and we've got what we've got, and Stormwind's sent neither of us a single company." },
      },
      choices = {
        { text = "Then the towns should help each other.", next = "BACK", reply = "We'd like to, {class}, but neither one has a watcher to spare.", fx = { align = { light = 1 } } },
        { text = "Each town must look to its own gate first.", next = "BACK", reply = "That's what the Commander says, and she's kept us alive so far.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    morbent_fel = { { id = "tp_y_morbent_fel", text = "That's the name the west-road watchers use for whoever's raising the dead at Raven Hill. I'm glad my road goes the other way." } },
    night_watch = { { id = "tp_x_night_watch", text = "A dozen of us, and the Commander. We're farmers with lamps, but we're the only ones who came." } },
    worgen = { { id = "tp_x_worgen", text = "They keep off the road while my lantern's lit, mostly. I don't care to find out what they'd do if it went out." } },
    advice = { { id = "tp_x_advice", text = "Buy your lamp oil in town, not from the wagon. I didn't tell you that." } },
    background = { { id = "tp_bg", text = "A Darkshire farmer's son who joined the Watch when the farms went dark." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask the goblin; he claims to know everything." } },
  },
}

-- Watcher Brownell: a young watcher in Darkshire, fond of Watcher Backus.
P:NPC {
  key = "watcher_brownell", id = TODO_NPC("Watcher Brownell"), name = "Watcher Brownell", title = "The Night Watch", gender = "female",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "earnest" }, values = { "dutiful", "loyal" },
  notices = { "watch" },
  impression = {
    first = "She asks after Watcher Backus more often than duty strictly requires.",
    third = "{name} met Watcher Brownell, a young watcher of Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good evening, and it's lovely to see you again! If you passed Watcher Backus on the west road, you'd tell me, wouldn't you?" },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Good evening. The lamps are trimmed and the road is open, and that's all I've to say to you." },
    { id = "g_y1", when = { timeOfDay = "night" }, text = "Good evening, and mind the lamps, please; I've only just trimmed them. Did you come by the west road?" },
    { id = "g_x1", when = { class = { "WARRIOR", "PALADIN" } }, text = "Good evening! You'd know, wouldn't you, how long it takes before a commander trusts a soldier with a real post?" },
    { id = "g_default", text = "Good evening, {class}. Have you come in from the west road? Did you see any of the Watch out there?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you happen to pass the western road?" },
  },
  notice = {
    { id = "n_y1", cat = "watch", when = { class = "HUNTER" },
      text = "You're a hunter, aren't you? The Carevins hunt the worgen with crossbows, and I've asked Elaine to teach me, when the Commander isn't listening." },
    { id = "n_x1", cat = "watch", when = { minLevel = 30 },
      text = "You've walked the western road and come back, I can tell by your boots. Was the watcher at the crossing well, when you passed?" },
    { id = "n_x2", cat = "watch", when = { race = "Dwarf" },
      text = "A dwarf in Darkshire! Watcher Dodds says dwarves can see in the dark, and I told him that was only a story, so please don't tell me which of us is right." },
    { id = "n_watch", cat = "watch", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry a sword like you know how to use it. The Watch could use you, if you ever wanted to stay." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Brownell, of the Night Watch. I keep watch in town, though I've asked to be posted on the western road, and the Commander says I'm not ready yet." },
      },
      again = {
        { id = "h_x_again1", text = "Was there something more? I've my round to finish before the lamps need trimming." },
        { id = "h_again", text = "Anything else, {class}?" },
        { id = "h_again2", text = "Go on. I'm listening." },
      },
      choices = {
        { text = "A watcher should earn a post through service, not favour.", next = "BACK", reply = "That's what I keep telling myself, every night I'm stuck trimming lamps. I'd like to think the Commander sees it the same way.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Flatter the Commander and you'll get the post you want.", next = "BACK", reply = "Oh, I couldn't! Well, I could, but then I'd never know whether I'd earned it, and that would spoil it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why the western road?", next = "west" },
        { text = "How long have you been in the Watch?", next = "long" },
        { text = "You're too young for this.", next = "young" },
        { text = "What's a round in town like?", next = "round" },
        { text = "The Commander is right to keep you close.", next = "close" },
        { text = "I'm fighting for the Watch now, out at the cemeteries.", next = "recruit", when = { questActive = TODO_QUEST("The Night Watch") } },
        { text = "I've done the Commander's work at the cemeteries.", next = "recruit", when = { questDone = TODO_QUEST("The Night Watch") } },
        { text = "Good evening.", next = "END" },
      },
    },
    west = {
      lines = { { id = "w_default", text = "Because that's where the danger is, and that's where Watcher Backus is. He's the bravest man in the Watch, and he knows the road better than anyone." } },
      choices = {
        { text = "You admire Backus, then.", next = "backus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    backus = {
      lines = { { id = "b_default", text = "Everyone in the Watch admires him, and so do I. Not in any other way, mind; don't go telling him otherwise." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    long = {
      lines = { { id = "l_default", text = "A year, nearly, since my father's farm went dark. The Watch took me in, and I've been learning ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    young = {
      big = true,
      lines = { { id = "y_default", text = "I'm old enough to hold a lamp and a sword, and that's all the Watch needs. The worgen don't ask how old you are before they come for you." } },
      choices = {
        { text = "Fair enough. You've got courage.", next = "BACK", reply = "Thank you, {class}. I'll need it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Courage won't save you out there.", next = "BACK", reply = "Then what will? I'll take my chances.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    round = {
      lines = {
        { id = "round_1", text = "I walk from the town hall to the Scarlet Raven and back, and I check that every shutter's barred and every lamp's burning. Watcher Hartin does the far side, and you can hear him praying before you see his light." },
      },
      choices = {
        { text = "Does anything ever happen on it?", next = "happen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    happen = {
      lines = {
        { id = "happen_1", text = "Once a thing came up the road from the cemetery, stitched together out of I don't know what, and it took half the Watch and a good many strangers to put it down. I held my post by the inn the whole time, and I've never been so frightened or so proud." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    close = {
      lines = {
        { id = "close_1", text = "That's what Watcher Ladimore says too, and she lost her father to these woods, so I try to listen. It's only that every night I'm here in the lamplight, somebody else is out there in the dark instead of me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    recruit = {
      lines = {
        { id = "recruit_1", text = "Then you've seen more of Raven Hill than I have, and the Commander trusted you with it on your first day. I'm not jealous, truly, or only a little, and I'm glad the Watch has you." },
      },
      choices = {
        { text = "Your turn will come. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ladimore = { { id = "tp_y_ladimore", text = "Watcher Ladimore's the one I'd like to be, in ten years. She never says she's afraid, and she never pretends there's nothing to be afraid of." } },
    night_watch = { { id = "tp_x_night_watch", text = "Commander Ebonlocke made it out of farmers and shopkeepers when the soldiers left. I'd follow her anywhere, and I mostly follow her around the square." } },
    worgen = { { id = "tp_x_worgen", text = "I've only seen one, at the edge of the lamplight. It looked at me as if it was counting." } },
    background = { { id = "tp_bg", text = "A farmer's daughter who joined the Watch. That's most of us, really." } },
    _none = { { id = "tp_none", text = "I don't know, sorry. Ask Watcher Backus; he knows everything." } },
  },
}

-- Watcher Keefer: an old hand of the Night Watch in Darkshire.
P:NPC {
  key = "watcher_keefer", id = TODO_NPC("Watcher Keefer"), name = "Watcher Keefer", title = "The Night Watch", gender = "female",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "gruff" }, values = { "dutiful" },
  notices = { "watch" },
  impression = {
    first = "She has buried more friends than she cares to count.",
    third = "{name} met Watcher Keefer, an old hand of the Night Watch in Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Still alive, and I'm glad of it. There aren't many faces I let myself get used to, {class}, but yours is one." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Still alive, I see. Don't take that as me being pleased about it." },
    { id = "g_x1", when = { timeOfDay = "night" }, text = "It's the wrong hour to be a stranger here, {class}. Walk where the lamps are and don't answer anything that calls your name." },
    { id = "g_default", text = "Another stranger in Darkshire. Keep your lamp lit and your blade close, {class}, and you might live to leave." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, then, and that's more than most can say." },
  },
  notice = {
    { id = "n_y1", cat = "watch", when = { race = "Dwarf" },
      text = "A dwarf, this far south. Your folk shut Ironforge's gates in the last war and held them, I heard, and I've thought about that on a good many nights here." },
    { id = "n_x1", cat = "watch", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You stand like someone who's held a line. We had soldiers like you here once, before Stormwind called them home." },
    { id = "n_x2", cat = "watch", when = { minLevel = 30 },
      text = "You've the eyes of someone who's seen the dead get up. Then I needn't explain Darkshire to you." },
    { id = "n_watch", cat = "watch", when = { class = "PRIEST" },
      text = "A priest. We could use you at the graveyard; there's more dead there than prayers to go round." },
  },
  start = "hello",
  nodes = {
    kee_alt1 = {
      lines = {
        { id = "kee_alt1_1", text = "I know her better than most, which isn't saying a great deal, because she keeps herself shut like a strongbox. She came to the Watch when her father couldn't get a single soldier out of Stormwind, and she's never once asked for thanks." },
      },
      choices = {
        { text = "Does she get on with her father?", next = "kee_alt2" },
        { text = "She sounds hard to serve under.", next = "kee_alt3" },
        { text = "Something else, Keefer.", next = "BACK" },
      },
    },
    kee_alt2 = {
      lines = {
        { id = "kee_alt2_1", text = "Lord Ello writes letters and Althea lights lamps, and each one thinks the other's wasting the hour. They love each other, mind, but you'd never guess it from a council meeting." },
      },
      choices = {
        { text = "And you take her side?", next = "kee_alt3" },
        { text = "Enough about the Ebonlockes.", next = "BACK" },
      },
    },
    kee_alt3 = {
      lines = {
        { id = "kee_alt3_1", text = "I take the side of whoever's keeping the town alive, and most nights that's her. She's hard, aye, but hard is what's needed, and I'd rather a hard commander than a soft grave." },
      },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    kee_gh1 = {
      lines = {
        { id = "kee_gh1_1", text = "Quiet, mostly, with sheep in the hills and a market on the square every week. The Light shone on it same as anywhere, and you could walk to Raven Hill on a summer evening and back before supper." },
      },
      choices = {
        { text = "Why was the name changed?", next = "kee_gh2" },
        { text = "Hard to picture the sun here.", next = "kee_gh2" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    kee_gh2 = {
      lines = {
        { id = "kee_gh2_1", text = "The dark came, and nobody could call it grand after that with a straight face. Folk started calling it Darkshire as a grim sort of joke, and the joke stuck, the way they do when nobody's laughing." },
      },
      choices = {
        { text = "Do you think the sun will come back?", next = "kee_gh3" },
        { text = "Back to other matters.", next = "BACK" },
      },
    },
    kee_gh3 = {
      lines = {
        { id = "kee_gh3_1", text = "Madame Eva says it will, when whatever's behind it is put down, and Abercrombie out at the hut says it won't. I've stopped listening to either and started counting lamps, which at least gets done." },
      },
      choices = {
        { text = "A sensible way to wait. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Keefer, Night Watch, and I've walked these streets since before the Commander took charge. I've seen the worst of what Duskwood has to offer, and it keeps finding new ways to surprise me." },
      },
      again = {
        { id = "h_x_again1", text = "What else? My feet ache worse standing than walking." },
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Go on, then, but be quick about it." },
      },
      choices = {
        { text = "The families deserve the truth about how their dead fell.", next = "BACK", reply = "They do, and I've told it at more doors than I can count. It's never easier, but a lie would rot worse than the bodies.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Tell grieving folk a kind lie; it costs nothing.", next = "BACK", reply = "It costs plenty, later, when they hear it from someone else. I tried that once, {class}, and never again.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What's the worst you've seen?", next = "worst" },
        { text = "How many have you lost?", next = "lost" },
        { text = "You sound tired, Keefer.", next = "tired" },
        { text = "You were here before the Watch existed.", next = "before" },
        { text = "The young ones in the Watch look up to you.", next = "young" },
        { text = "I can say the rites for your dead, Keefer.", next = "rites", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "You know Commander Ebonlocke better than anyone.", next = "kee_alt1" },
        { text = "What was Grand Hamlet like, before?", next = "kee_gh1" },
        { text = "Good night.", next = "END" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "The dead walking out of Raven Hill, and the men I'd buried walking with them. You don't forget a face like that, not when you know it.", fx = { learn = { "raven_hill" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lost = {
      lines = { { id = "l_default", text = "Too many to count, and I've stopped counting. The Commander keeps the names; I just keep walking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tired = {
      big = true,
      lines = { { id = "t_default", text = "Tired, aye, but somebody's got to do it, and I'm still standing. The day I stop walking these streets is the day Darkshire falls." } },
      choices = {
        { text = "Then keep walking. Darkshire needs you.", next = "BACK", reply = "I will, and thank you for saying it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Darkshire should be abandoned. It's not worth dying for.", next = "BACK", reply = "Then you don't know Darkshire. Good night.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "before_1", text = "I was, when this was Grand Hamlet and the worst thing in the woods was a wolf after the sheep. Then the sky went dark and stayed dark, and Stormwind's soldiers marched off north, and the Commander asked who would carry a lamp." },
      },
      choices = {
        { text = "And you said yes.", next = "yes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yes = {
      lines = {
        { id = "yes_1", text = "I said I'd do it till the soldiers came back, which was the joke, as it turned out. The Ebonlocke girl was half my age and the only one giving orders that made sense, so I've taken them ever since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    young = {
      lines = {
        { id = "young_1", text = "Brownell and Mocarski and the rest, aye. I tell them the same thing every night, that a lamp and a loud voice have saved more watchers than a sword has, and they nod and go on wishing for the western road." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rites = {
      big = true,
      lines = {
        { id = "rites_1", text = "Would you? We bury them in Tranquil Gardens when we can reach it, and say what words we remember, and lately they've not been enough to keep the graves shut. I'd take a proper rite over a medal for any one of them." },
      },
      choices = {
        { text = "They'll have it. The Light doesn't forget the Watch.", next = "BACK", reply = "Then I'll show you where they lie, when the road's clear. Thank you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Words won't hold them down. Burn the bodies.", next = "BACK", reply = "We've started to, {class}. I only hoped somebody would tell me I was wrong.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    raven_hill = { { id = "tp_y_raven_hill", text = "It was a village with a churchyard, and decent folk in it. Now it's the churchyard that's got the village." } },
    ladimore = { { id = "tp_y_ladimore", text = "Morgan Ladimore was the best of us, before there was an us. Ask his daughter if you must, but ask her gently." } },
    night_watch = { { id = "tp_x_night_watch", text = "Farmers and shopkeepers with lamps, and the best commander we could have asked for. It's held all this while on stubbornness." } },
    worgen = { { id = "tp_x_worgen", text = "They came after the dark did. I've killed four, and I couldn't tell you what they are." } },
    advice = { { id = "tp_x_advice", text = "Carry two lights. The night here has a way of putting out the first." } },
    background = { { id = "tp_bg", text = "Night Watch since the day it was formed, and a farmer before that, though it feels like a long time ago." } },
    _none = { { id = "tp_none", text = "Don't know, and don't much care." } },
  },
}

-- Watcher Mocarski: guards the southern entrance to Darkshire.
P:NPC {
  key = "watcher_mocarski", id = TODO_NPC("Watcher Mocarski"), name = "Watcher Mocarski", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "nervous" }, values = { "dutiful" },
  notices = { "watch" },
  impression = {
    first = "Every sound from the trees startles him, and he holds his post.",
    third = "{name} met Watcher Mocarski, who guards Darkshire's southern entrance.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you, thank the Light, a friendly face! Come in, come in, and stand near me a while if you don't mind." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'd almost rather it were a worgen, {class}, and you can close the gate behind you." },
    { id = "g_y1", when = { class = { "PRIEST", "PALADIN" } }, text = "Oh, thank the Light, and I mean that as a real thanks, since you'd be the one to pass it on. Come in, come in." },
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Is that a lamp or a pair of eyes? A lamp, good, a lamp, come ahead, and mind you close the gate behind you." },
    { id = "g_default", text = "Who's there? Oh, thank the Light, you're not a worgen. Come in, come in, quickly." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and in one piece! The woods didn't get you, then." },
  },
  notice = {
    { id = "n_y1", cat = "watch", when = { minLevel = 35 },
      text = "You don't flinch at the trees at all, do you? I'd give a month's lamp oil to know how that's done." },
    { id = "n_x1", cat = "watch", when = { class = "HUNTER" },
      text = "A hunter! You'd know, then, whether wolves ever walk on their hind legs, because the ones down that road do and nobody will tell me it's normal." },
    { id = "n_x2", cat = "watch", when = { race = "NightElf" },
      text = "They say your people see in the dark as well as by day. I don't suppose you'd tell me what's standing by that third tree, or whether I'd rather not know." },
    { id = "n_watch", cat = "watch", when = { minLevel = 25 },
      text = "You look like you've seen worse than Duskwood. Have you? I'd love to hear that there's something worse." },
  },
  start = "hello",
  nodes = {
    moc_mate1 = {
      lines = {
        { id = "moc_mate1_1", text = "Watcher Dodds, mostly, when the Commander can spare him, and he talks about his pitchfork the whole shift. Sometimes Watcher Hartin comes by at dusk and says a prayer over the gate, which helps more than I'd admit to Dodds." },
      },
      choices = {
        { text = "Dodds really prefers a pitchfork to a sword?", next = "moc_mate2" },
        { text = "Hartin's prayers seem to steady you.", next = "moc_mate3" },
        { text = "Something else, Mocarski.", next = "BACK" },
      },
    },
    moc_mate2 = {
      lines = {
        { id = "moc_mate2_1", text = "He swears a ghoul can't reach you past the tines, and he's walked away from three of them to prove it. Bukouris tried to give him a proper blade, and Dodds gave it right back with a speech about farming I've never forgotten." },
      },
      choices = {
        { text = "He sounds a sound man to stand beside.", next = "moc_mate3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    moc_mate3 = {
      lines = {
        { id = "moc_mate3_1", text = "They're both steadier than me, and I think the Commander puts them by me on purpose. I don't mind it, {class}, truly, because nobody on this gate has ever been sorry to have company." },
      },
      choices = {
        { text = "Company makes the night shorter. Something else.", next = "BACK" },
      },
    },
    moc_orch1 = {
      lines = {
        { id = "moc_orch1_1", text = "Because that's where they come from, and I'd swear the trees there lean toward the town when the wind drops. There was the Yorgen farm past it, and the farmhouse still stands empty with the table set, or so Petras says." },
      },
      choices = {
        { text = "The table's still set?", next = "moc_orch2" },
        { text = "I've been past the Yorgen farm. It's worse inside.", next = "moc_orch3", when = { minLevel = 25 } },
        { text = "Enough about the orchard.", next = "BACK" },
      },
    },
    moc_orch2 = {
      lines = {
        { id = "moc_orch2_1", text = "Plates and cups, and bread gone to stone on the board, as if the family stood up from supper and walked out. Petras says the tracks go out the door and never come back, and I wish he hadn't told me that." },
      },
      choices = {
        { text = "They may have run for Darkshire and made it.", next = "moc_orch3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moc_orch3 = {
      lines = {
        { id = "moc_orch3_1", text = "I'd like to think so, and I tell myself so on the long nights. But I've never met a Yorgen in Darkshire, {class}, and I've asked everyone who comes past this gate." },
      },
      choices = {
        { text = "Then keep asking. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Mocarski, south gate. Everything that comes up from the south road comes past me, and most of it has teeth." },
      },
      again = {
        { id = "h_x_again1", text = "Yes? Sorry, I was counting the trees again, and there's still the right number." },
        { id = "h_again", text = "Anything else? I'm watching the trees, but I can listen." },
        { id = "h_again2", text = "Go on, I'm listening, only did you hear that just now? No? Then go on." },
      },
      choices = {
        { text = "A frightened watcher should say so, not hide it.", next = "BACK", reply = "Do you think so? I've been afraid every night since I was posted, and I've never once said it out loud, until now.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Never let them see you're afraid; bluff, even to your mates.", next = "BACK", reply = "I try, I really do, but my hands shake on the spear and everyone can see it. Bluffing isn't my gift, {class}.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What comes up the south road?", next = "south" },
        { text = "You seem nervous.", next = "nervous" },
        { text = "I'll keep watch with you a while.", next = "keep" },
        { text = "What's down the south road, past the trees?", next = "past" },
        { text = "You've held this gate three months. That counts.", next = "counts" },
        { text = "I've been through Deadwind Pass. Your gate is the quiet end.", next = "deadwind", when = { minLevel = 30 } },
        { text = "Who stands the gate with you, when anyone does?", next = "moc_mate1" },
        { text = "You keep glancing at the Rotting Orchard.", next = "moc_orch1" },
        { text = "Good night.", next = "END" },
      },
    },
    south = {
      lines = { { id = "s_default", text = "Worgen, mostly, from the woods, and the odd traveller from Deadwind Pass who's gone a little strange. Nobody comes from the south who doesn't have a story." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nervous = {
      lines = { { id = "n_default", text = "Wouldn't you be? I've been on this gate for three months, and I've seen things I won't sleep through. But I'm still here, and I'm not going anywhere." } },
      choices = { { text = "That's brave of you. Something else.", next = "BACK" } },
    },
    keep = {
      big = true,
      lines = { { id = "k_default", text = "Would you? That's kind of you, {class}, truly. Most folk just hurry past me to get inside." } },
      choices = {
        { text = "Nobody should stand watch alone.", next = "BACK", reply = "Thank you. I'll sleep better tonight, I think.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Only a while. I've my own business.", next = "BACK", reply = "Of course. A while is more than I usually get.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past = {
      lines = {
        { id = "past_1", text = "The Rotting Orchard, where the worgen den, and past that the old Yorgen farm, and past that the road climbs toward Deadwind Pass. I've never been further than the orchard wall, and I went that far only once, in daylight, with Watcher Dodds." },
      },
      choices = {
        { text = "What did you see at the orchard?", next = "orchard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orchard = {
      lines = {
        { id = "orchard_1", text = "Apple trees gone black and a barn with the door hanging off, and tracks in the mud that started as boots and ended as paws. Dodds said we should go back, and I'd already started." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    counts = {
      lines = {
        { id = "counts_1", text = "Do you think so? Watcher Keefer says a man who's frightened and stays is worth two who aren't and wander off, though she said it while she was telling me off for dropping my lamp." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    deadwind = {
      lines = {
        { id = "deadwind_1", text = "Have you really? Then it's true there's worse than Duskwood, and I can't decide whether that helps. The ones who come down from the pass never talk about it, and you're the first who's said as much as that." },
      },
      choices = {
        { text = "It helps to know the road ends somewhere. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    raven_hill = { { id = "tp_y_raven_hill", text = "That's the west road's trouble, and I'm glad of it, because the south road's trouble is quite enough for one gate." } },
    advice = { { id = "tp_y_advice", text = "Count the trees when you arrive anywhere. If there's one more when you leave, don't walk past it." } },
    worgen = { { id = "tp_x_worgen", text = "They walk like men and they hunt like wolves, and they come from the orchard south of my gate. I've asked for a second lamp." } },
    night_watch = { { id = "tp_x_night_watch", text = "The Commander put me on the south gate because I notice everything. I do notice everything, and I wish I didn't." } },
    background = { { id = "tp_bg", text = "A Darkshire boy who joined the Watch because there wasn't anything else to do." } },
    _none = { { id = "tp_none", text = "I don't know, sorry, and was that a worgen in the trees just now? No, it was nothing, good." } },
  },
}

-- Watcher Royce: a watcher with a sense of humour.
P:NPC {
  key = "watcher_royce", id = TODO_NPC("Watcher Royce"), name = "Watcher Royce", title = "The Night Watch", gender = "female",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "wry" }, values = { "loyal" },
  notices = { "watch" },
  impression = {
    first = "She jokes on watch because, she says, somebody has to.",
    third = "{name} met Watcher Royce, the Night Watch's joker.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Look who's back, the only visitor Darkshire hasn't scared off yet! Stay a while, {class}; I've run out of fresh jokes for the dead." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'd make a joke about it, {class}, but some things just aren't funny." },
    { id = "g_y1", when = { race = "Human", origin = "human_city_guard" }, text = "A Stormwind guardsman! Welcome to the posting they threaten you with when you've been caught asleep at the gate." },
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Evening! Or it might be morning, since nobody's been able to tell the two apart here in years." },
    { id = "g_default", text = "Welcome to Darkshire, where the nights are long and the days are longer! Mind the dead; they're grumpy." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You must like it here. Nobody likes it here." },
  },
  notice = {
    { id = "n_x1", cat = "watch", when = { race = "Dwarf" },
      text = "A dwarf! Good, you can settle a wager for me, about whether it's true you lot were born underground because you'd heard what the weather was like in Duskwood." },
    { id = "n_x2", cat = "watch", when = { class = "ROGUE" },
      text = "You walk very quietly, friend. I'd tell you a joke about a cutpurse in Darkshire, but he's got nothing to laugh about, because nobody here has a purse worth cutting." },
    { id = "n_watch", cat = "watch", when = { race = "Gnome" },
      text = "A gnome! You're the perfect height for a Duskwood night; the worgen will look right over you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Royce, at your service, and the Night Watch's only comedian, by default. Somebody's got to keep spirits up around here, and it certainly isn't the spirits." },
      },
      again = {
        { id = "h_x_again1", text = "Still here? I'm running out of jokes, so I may have to start on the true stories." },
        { id = "h_again", text = "Anything else? I've got a joke about a ghoul, if you're interested." },
        { id = "h_again2", text = "Go on, I'm all ears, unlike the worgen, who are mostly teeth." },
      },
      choices = {
        { text = "Laugh all you like, but never shirk the watch.", next = "BACK", reply = "Never have, never will, and the jokes are how I stay awake for it. Somebody's got to keep the gate and the spirits up both.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sleep at your post if nobody's checking.", next = "BACK", reply = "Ha! That's how half of us earned a posting here, {class}, so believe me, somebody's always checking.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Tell me a joke.", next = "joke" },
        { text = "How can you joke in a place like this?", next = "how" },
        { text = "This is no laughing matter.", next = "matter" },
        { text = "Who's your best audience in the Watch?", next = "audience" },
        { text = "I'd wager the Commander doesn't laugh.", next = "commander" },
        { text = "The Light could use a jester, Royce.", next = "jester", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Good day.", next = "END" },
      },
    },
    joke = {
      lines = { { id = "j_default", text = "Why don't the dead in Raven Hill ever win at cards? Because they've got no skin in the game, and Morbent Fel keeps the deck." } },
      choices = {
        { text = "That's terrible.", next = "BACK", reply = "Thank you! I've got worse." },
        { text = "Who's Morbent Fel?", next = "fel" },
      },
    },
    fel = {
      lines = { { id = "f_default", text = "A necromancer up at Raven Hill, and the reason the dead won't lie still. Less of a joke, that one, and more of a warning.", fx = { learn = { "morbent_fel" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    how = {
      lines = { { id = "h_how", text = "How can I not? If I stopped laughing, I'd start crying, and nobody wants a crying watcher." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    matter = {
      big = true,
      lines = { { id = "m_default", text = "No, it isn't, and I know that better than most. But a laugh keeps a man on his feet, and on his feet is where the Watch needs him." } },
      choices = {
        { text = "You're right. Laughter has its place.", next = "BACK", reply = "It does, and I'm glad you see it.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Discipline keeps a man on his feet, not jokes.", next = "BACK", reply = "Then you and the Commander would get along.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    audience = {
      lines = {
        { id = "audience_1", text = "Mocarski, on the south gate, because he laughs out of pure relief that it was only me coming up behind him. Keefer's the hardest, and I got a snort out of her last winter that I'm still living on." },
      },
      choices = {
        { text = "What was the joke that got Keefer?", next = "keeferjoke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keeferjoke = {
      lines = {
        { id = "keeferjoke_1", text = "I told her Stormwind had finally answered the council's letters, and they'd sent us a tax collector. It isn't funny anywhere else in the kingdom, I grant you, but here it brought the house down." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    commander = {
      lines = {
        { id = "commander_1", text = "You'd lose, though not by much. She laughed once, when the Town Crier lost his voice for a week, and then she put me on double rounds for having made her do it in front of the men." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    jester = {
      lines = {
        { id = "jester_1", text = "Then tell it I'm available, and that I work for lamp oil. Hartin says the Light's on these streets already, and if that's so, it's heard all my material and hasn't struck me down yet, which I take as a good review." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    raven_hill = { { id = "tp_y_raven_hill", text = "Lovely village, very quiet neighbours, and they do drop in unannounced. I'd not buy a house there." } },
    night_watch = { { id = "tp_x_night_watch", text = "Finest watch in the kingdom, and I can say so because the kingdom's sent no other to compare us with." } },
    worgen = { { id = "tp_x_worgen", text = "Big dogs with bad manners. I don't joke about them near the south gate, on account of Mocarski's nerves." } },
    advice = { { id = "tp_x_advice", text = "If something in the woods laughs back, stop telling jokes and walk quickly." } },
    background = { { id = "tp_bg", text = "A Darkshire girl who joined the Watch and never stopped telling jokes." } },
    _none = { { id = "tp_none", text = "No idea, but if you find out, let me know; I could use the material." } },
  },
}

-- Watcher Hartin: a devout watcher in Darkshire.
P:NPC {
  key = "watcher_hartin", id = TODO_NPC("Watcher Hartin"), name = "Watcher Hartin", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "steady" }, values = { "devout", "dutiful" },
  notices = { "light" },
  impression = {
    first = "He believes the Light walks Darkshire's streets with the Watch.",
    third = "{name} met Watcher Hartin, a devout watcher of Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "The Light brought you back to us, {class}, and I gave thanks for it on my watch tonight." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "The Light keeps everyone, {class}, even you, but I'll not pretend I'm glad to see you." },
    { id = "g_y1", when = { class = "PALADIN" }, text = "A knight of the Silver Hand in Darkshire! Then somebody's prayers were heard, and I'll allow myself to think they were mine." },
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Walk in the Light, {class}, and where there isn't any, carry your own. It's the darkest watch of the night just now." },
    { id = "g_default", text = "The Light keep you, {class}. You've come to a dark place, but you're not alone in it." },
    { id = "g_back", when = { metBefore = true }, text = "The Light brought you back, I see. I'm glad of it." },
  },
  notice = {
    { id = "n_x1", cat = "light", when = { race = "Dwarf" },
      text = "The Light keep you, master dwarf. I'm told your people's paladins learned it beside ours in the old war, and I've always thought well of you for that." },
    { id = "n_x2", cat = "light", when = { class = "WARLOCK" },
      text = "There's a shadow on you that didn't come from these woods. I'll pray for you all the same, and perhaps the harder for it." },
    { id = "n_light", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "One of the Light's own! I've prayed for someone like you to come to Darkshire, and here you are." },
  },
  start = "hello",
  nodes = {
    har_lamp1 = {
      lines = {
        { id = "har_lamp1_1", text = "I do, because a lamp is the nearest thing Darkshire has to a candle on an altar. Watcher Jan thinks I'm saying grace over his oil, and I suppose I am, though I'd never tell him so." },
      },
      choices = {
        { text = "Is that a prayer you learned in Stormwind?", next = "har_lamp2" },
        { text = "I'm a priest. That's a sound instinct you have.", next = "har_lamp3", when = { class = "PRIEST" } },
        { text = "Something else, Hartin.", next = "BACK" },
      },
    },
    har_lamp2 = {
      lines = {
        { id = "har_lamp2_1", text = "From my mother, at the chapel in Tranquil Gardens, when I was small enough to sit on the front bench. It asks the Light to keep watch through the night, and it seemed a fitting thing for a watchman to say." },
      },
      choices = {
        { text = "Then your mother would be proud of you.", next = "har_lamp3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    har_lamp3 = {
      lines = {
        { id = "har_lamp3_1", text = "I'd like to think so, though she'd scold me for saying it in the street instead of the chapel. One day we'll take the cemetery back, and I'll say it there properly, at her stone." },
      },
      choices = {
        { text = "I hope you get that day. Something else.", next = "BACK" },
      },
    },
    har_sirra1 = {
      lines = {
        { id = "har_sirra1_1", text = "I know his books are heavy and his theories are heavier, and he's written that the dark over Duskwood came from a tower to the east. I can't say he's wrong, but I'd sooner fight what I can see than worry about what I can't." },
      },
      choices = {
        { text = "The tower he means is Karazhan.", next = "har_sirra2" },
        { text = "Do you think it's a curse?", next = "har_sirra2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    har_sirra2 = {
      lines = {
        { id = "har_sirra2_1", text = "Karazhan, aye, the old magus's tower past the Deadwind road, and nobody from Darkshire goes near it. Sirra says it's empty and Madame Eva says it isn't, and I've noticed which of them people listen to." },
      },
      choices = {
        { text = "Then the Light will have to answer it in time.", next = "BACK" },
        { text = "Let's leave towers for now.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Hartin, of the Night Watch. I walk the streets and I pray, and between the two I think we keep the darkness back, a little." },
      },
      again = {
        { id = "h_x_again1", text = "Yes, {class}? I've said my prayer for this street, so I've a moment." },
        { id = "h_again", text = "Anything else, {class}?" },
        { id = "h_again2", text = "Go on. The Light has time, and so do I." },
      },
      choices = {
        { text = "The Light asks us to fight fair, even against the dead.", next = "BACK", reply = "It does, and I believe it, though the dead don't return the courtesy. We hold to it so we don't become what we fight.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Against the walking dead, any trick is righteous.", next = "BACK", reply = "Careful, {class}. I've seen men say that and then turn the same tricks on the living, and the Light went quiet for them.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Does the Light really walk here?", next = "light" },
        { text = "What do you pray for?", next = "pray" },
        { text = "Prayers won't stop the worgen.", next = "worgen" },
        { text = "Darkshire has no church of its own.", next = "church" },
        { text = "What does the Watch make of your praying?", next = "watch" },
        { text = "Show me where a blessing is most needed.", next = "bless", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "You stand closer to the lamps than the others do.", next = "har_lamp1" },
        { text = "Do you know Sirra Von'Indi's books?", next = "har_sirra1" },
        { text = "Good day.", next = "END" },
      },
    },
    light = {
      lines = { { id = "l_default", text = "It does, though you have to look for it. It's in every lamp the Watch lights, and every family that stays when they could leave.", fx = { learn = { "holy_light" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "p_default", text = "For the dead to rest, for the living to be safe, and for Stormwind to remember us. The first two I think the Light hears, and the last I'm not so sure." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worgen = {
      big = true,
      lines = { { id = "w_default", text = "No, but they steady the hand that holds the sword, and that's a start. A man who believes he's not alone fights harder than one who thinks he is." } },
      choices = {
        { text = "That's true. Faith gives strength.", next = "BACK", reply = "It does, {class}. The Light keep you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Steel stops worgen. Prayer's just comfort.", next = "BACK", reply = "Then you'll need both, I think. I'll pray for you anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    church = {
      lines = {
        { id = "church_1", text = "No, and no priest either, though the council has asked the Cathedral more than once. We've the cemetery chapel, which nobody dares open now, and we've me, saying what I remember from the abbey brothers who used to ride through." },
      },
      choices = {
        { text = "What happened to the chapel?", next = "chapel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chapel = {
      lines = {
        { id = "chapel_1", text = "It stands in Tranquil Gardens, and the dead there have been leaving their graves since the dark came down. The Commander says clearing the cemetery comes before praying in it, and I can't call her wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = {
        { id = "watch_1", text = "Royce makes jokes about it and Keefer says nothing, and both of them stand a little closer to me when the wind drops. I don't ask anyone to believe, only to let me believe near them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bless = {
      lines = {
        { id = "bless_1", text = "The south gate, where young Mocarski stands alone with everything the orchard sends up the road. I bless it every evening, but I'm a watchman saying a priest's words, and yours would be the real thing." },
        { id = "bless_2", when = { class = "PALADIN" }, text = "The south gate, where young Mocarski stands alone against whatever the orchard sends. A knight of the Silver Hand at that gate, even for an hour, would put more heart in him than a year of my prayers." },
      },
      choices = {
        { text = "I'll stand a while at the south gate. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    raven_hill = { { id = "tp_y_raven_hill", text = "Consecrated ground, once, and somebody has undone the consecration. I can't think of a worse thing for a man to spend his learning on." } },
    night_watch = { { id = "tp_x_night_watch", text = "Every one of us carries a lamp, and I think of each lamp as a small prayer. The Commander thinks of them as lamps, and we get on well." } },
    worgen = { { id = "tp_x_worgen", text = "I don't know whether they've souls to pray for. I pray for whoever they were before, in case they were anyone." } },
    background = { { id = "tp_bg", text = "I was meant for the Church, but the Watch needed me more." } },
    holy_light = { { id = "tp_hl", text = "It's here, even in Duskwood. You just have to carry it with you." } },
    _none = { { id = "tp_none", text = "I couldn't say. I'll pray on it." } },
  },
}

-- Watcher Paige: posted alone at the central crossroads of Duskwood, on the road between Darkshire and Raven Hill.
P:NPC {
  key = "watcher_paige", id = TODO_NPC("Watcher Paige"), name = "Watcher Paige", title = "The Night Watch", gender = "female",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "steady", "plain" }, values = { "dutiful" },
  notices = { "watch", "travel" },
  impression = {
    first = "Watcher Paige holds the crossroads in the middle of Duskwood with a lamp, a sword and a tally of everyone who passes. She points the way to four places and recommends none of them.",
    third = "{name} met Watcher Paige of the Night Watch at the Duskwood crossroads.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, and I'll put you down in ink, because you've earned it. Which road is it today, {class}?" },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll write you down in charcoal, {class}, and I won't trouble to keep it dry." },
    { id = "g_y1", when = { race = "Human", class = "PALADIN" }, text = "A paladin, on my crossroads. Then I'll write this one down in ink and not in charcoal." },
    { id = "g_default", text = "Hold there a moment, {class}. Tell me which road you came by and which you're taking, and then I'll let you get on." },
    { id = "g_2", when = { metBefore = true }, text = "You again. I had you down as gone west, so I'm glad to strike that line out." },
    { id = "g_3", when = { timeOfDay = "night" }, text = "Keep to the middle of the road and keep moving. I'll hold the lamp up until you're past the bend." },
  },
  notice = {
    { id = "n_1", cat = "travel", when = { minLevel = 30 },
      text = "You've come through Stranglethorn, by the mud on you. The south road's the only one I never have to warn people off, because nobody takes it twice." },
    { id = "n_2", cat = "watch", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You could hold a crossroads, by the look of you. I've asked for a second watcher out here since the spring." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Watcher Paige, Night Watch. Darkshire is east along this road, Raven Hill is west, the river and Elwynn are north, and south is the jungle, and I write down everyone who goes any of those ways." },
        { id = "hello_2", when = { faction = "Horde" }, text = "Watcher Paige, Night Watch. You're a long way from anyone who'd welcome you, so I'll write you down as passing through, and you'll make that true." },
      },
      again = {
        { id = "hello_again1", text = "Which road, then? Or was there something else?" },
        { id = "hello_again2", text = "Go on. The tally can wait a minute." },
        { id = "hello_again3", text = "Ask, but keep your voice down; sound carries strangely out here." },
      },
      choices = {
        { text = "Keep the tally true, even when the count of the lost is shameful.", next = "BACK", reply = "It's the only thing I've got that tells the truth about this crossroads. I'd sooner write a hard number than a kind one.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Round the losses down; Stormwind needn't know how bad it is.", next = "BACK", reply = "And then Stormwind sends no help, because the book says we don't need it. No, the tally stays honest, {class}.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why keep a tally of travellers?", next = "tally" },
        { text = "Which road is the worst?", next = "worst" },
        { text = "This is a lonely post for one watcher.", next = "lonely" },
        { text = "I'm bound for Raven Hill, for Jitters.", next = "jitters", when = { questActive = TODO_QUEST("Raven Hill") } },
        { text = "The tracks on your west road aren't all boots.", next = "tracks", when = { class = "HUNTER" } },
        { text = "Do you ever get relieved out here?", next = "relief" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    tally = {
      lines = {
        { id = "tally_1", text = "So that when somebody doesn't come back, the Commander knows which road took them and roughly when. It's saved four people who were only lost, and it's told us where to look for a good many who weren't." },
      },
      choices = {
        { text = "How many don't come back?", next = "count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    count = {
      lines = {
        { id = "count_1", text = "This month, eleven went west toward Raven Hill and seven came back, and two of the seven wouldn't say what they'd seen. I don't count the ones who go south, since I never expected them back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = {
        { id = "worst_1", text = "West, without question. The cemetery at Raven Hill has been emptying itself onto that road for months, and there's a hermit past it that the watchers out there don't care to discuss." },
        { id = "worst_2", when = { questDone = TODO_QUEST("Morbent Fel") }, text = "It was west, until somebody went into Raven Hill and dealt with the one raising them. The tally says that was you, and it's the best line I've written in it.", fx = { learn = { "morbent_fel" } } },
      },
      choices = {
        { text = "And the north road?", next = "north" },
        { text = "Something else.", next = "BACK" },
      },
    },
    north = {
      lines = {
        { id = "north_1", text = "Wolves, and the big spiders along the riverbank, and then the bridge into Elwynn, where the sun still comes up. Folk heading north walk faster the nearer they get, and I can't blame them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lonely = {
      big = true,
      lines = {
        { id = "lonely_1", text = "It is. Watcher Backus is further up the west road and Darkshire's an hour east, and between them there's me and this lamp. The Commander says a crossroads with nobody on it is a door left open." },
      },
      choices = {
        { text = "She's right. Somebody has to stand in the door.", next = "BACK", reply = "That's how I see it, most nights. It's good to hear it from someone else.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "One watcher can't hold a crossroads. She's wasting you.", next = "BACK", reply = "Maybe so, but I'd sooner be wasted here than missed here.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jitters = {
      lines = {
        { id = "jitters_1", text = "Then you'll pass the cemetery gate, and I'd do it in daylight if you can find any. Jitters used to come by here for news, and he'd never stand with his back to the west." },
      },
      choices = {
        { text = "I'll keep my back covered. Something else.", next = "BACK" },
      },
    },
    tracks = {
      lines = {
        { id = "tracks_1", text = "No, they're not. The ones with claws come out of Brightwood to the north and cross toward the old farms, and they've started crossing closer to my lamp. I've stopped measuring them, since the numbers only kept getting bigger.", fx = { learn = { "worgen" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    relief = {
      lines = {
        { id = "relief_1", text = "At what the town calls dawn, by whoever the Commander can spare, and some weeks that's nobody. I've stood two nights running more than once, and I've learned to sleep on my feet with the lamp hooked on my arm." },
        { id = "relief_2", when = { class = { "WARRIOR", "PALADIN" } }, text = "At dawn, by whoever can be spared. A soldier like you would know the trick of sleeping on your feet, and I've had to teach it to myself." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_y_worgen", text = "They cross my west road at night, north to south. I count them the same as I count travellers, in a different column." } },
    advice = { { id = "tp_y_advice", text = "Tell a watcher which road you're taking. It costs you a breath, and it's the only way anyone will know where to look." } },
    background = { { id = "tp_background", text = "I'm from a farm off the north road. It's empty now, like the rest, so I guard the road instead." } },
    night_watch = { { id = "tp_night_watch", text = "The Commander gives each of us a road or a gate. I got four roads, which I choose to take as a compliment." } },
    raven_hill = { { id = "tp_raven_hill", text = "West, about half an hour, and you'll smell it before you see it." } },
    _none = { { id = "tp_none", text = "That's not on any of my four roads, so I couldn't tell you." } },
  },
}

-- Watcher Jan: patrols Darkshire and keeps the Watch's lamps and its lamp oil.
P:NPC {
  key = "watcher_jan", id = TODO_NPC("Watcher Jan"), name = "Watcher Jan", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "fussy", "kind" }, values = { "dutiful", "thrifty" },
  notices = { "watch", "craft" },
  impression = {
    first = "Watcher Jan patrols Darkshire with an oil can as well as a sword, and he knows to the cupful how much light the town has left. He trims every wick he passes, including ones that aren't his.",
    third = "{name} met Watcher Jan, who keeps the lamps of the Night Watch in Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you, and every lamp on this street is lit tonight. Well, they're lit for everyone, but I thought of you while I filled them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Mind the lamp post, {class}, and mind it well, because I'll not trim a wick on your account if it goes out." },
    { id = "g_y1", when = { timeOfDay = "night" }, text = "Mind the ladder, {class}. I'm halfway through the square, and I'll not have a lamp go dark because somebody walked into me." },
    { id = "g_default", text = "Evening, {class}. Mind the lamp post, would you? I've only just filled it, and oil doesn't come cheap in Darkshire." },
    { id = "g_2", when = { metBefore = true }, text = "Ah, it's you. Every lamp on this street's still burning, in case you were wondering, which nobody ever is." },
  },
  notice = {
    { id = "n_y1", cat = "watch", when = { race = "Human", origin = "human_city_guard" },
      text = "Stormwind's lamps light themselves at dusk by some mage's trick, I'm told. I've tried not to think about that too often." },
    { id = "n_1", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Tell me there's a lamp that burns half the oil for the same light, and tell me a goblin doesn't hold the plans." },
    { id = "n_2", cat = "watch", when = { class = "MAGE" },
      text = "A mage. I don't suppose you could hang a light over the square that never needs filling? No, the last one said the same, and looked at me the same way." },
  },
  start = "hello",
  nodes = {
    jan_round1 = {
      lines = {
        { id = "jan_round1_1", text = "I don't, not alone, and I'd fall over halfway if I tried. I fill and trim them in the afternoon, what we call afternoon, and the watchers on each round light their own as they pass, so the whole town comes alight in a ring." },
      },
      choices = {
        { text = "Which lamp do you light last?", next = "jan_round2" },
        { text = "Something else, Jan.", next = "BACK" },
      },
    },
    jan_round2 = {
      lines = {
        { id = "jan_round2_1", text = "The one outside Madame Eva's door, and that's by her own request, because she says the last lamp lit is the one the dark notices least. I don't follow the reasoning, but I've never once seen her door in the shadow." },
      },
      choices = {
        { text = "She may be right about that.", next = "jan_round3" },
        { text = "Back to other matters.", next = "BACK" },
      },
    },
    jan_round3 = {
      lines = {
        { id = "jan_round3_1", text = "She's right about too much for comfort, which is why I don't argue. I'd sooner light her lamp last and sleep easy than light it first and lie awake wondering what she meant." },
      },
      choices = {
        { text = "A wise trade. Let me ask something else.", next = "BACK" },
      },
    },
    jan_tal1 = {
      lines = {
        { id = "jan_tal1_1", text = "It does, and the Scarlet Raven smells of burnt mutton for a week after. Smitts complains, but he's the first to light a tallow candle in his window when the wagon's late, so I don't listen to him." },
      },
      choices = {
        { text = "Is the wagon often late?", next = "jan_tal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jan_tal2 = {
      lines = {
        { id = "jan_tal2_1", text = "Every second time, and every time it is, the Defias on the Westfall road get the blame, whether they earned it or not. The drivers have taken to coming through Elwynn and Redridge instead, which is longer but has fewer masks on it." },
      },
      choices = {
        { text = "The Redridge road has gnolls instead.", next = "jan_tal3" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    jan_tal3 = {
      lines = {
        { id = "jan_tal3_1", text = "It does, so the drivers say, but a gnoll wants your horse and a Defias wants your cargo, and it's the cargo I care about. As long as the oil gets here, I'll leave the horses to the Lakeshire folk to worry over." },
      },
      choices = {
        { text = "Fair enough. Something else, Jan.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", text = "Watcher Jan, of the Night Watch. I walk the same round as the others, but I'm the one who fills the lamps, and in this town that makes me the most important man nobody's heard of." },
        { id = "hello_2", when = { timeOfDay = "night" }, text = "Watcher Jan, Night Watch. Forty-one lamps in Darkshire, and every one of them's lit tonight, which is the only report I ever want to give the Commander." },
      },
      again = {
        { id = "hello_again1", text = "Anything else? I've the inn side still to fill." },
        { id = "hello_again2", text = "Go on, I can pour and listen." },
        { id = "hello_again3", text = "Yes? Hold this can a moment, if you would." },
      },
      choices = {
        { text = "Oil should go to every street, not just the council's.", next = "BACK", reply = "That's what I tell the Ambassador whenever he asks for extra on the hall steps. The poor end of town is darker and needs it more.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Skim a little oil for yourself; nobody counts the cups.", next = "BACK", reply = "I count the cups, {class}, every single one. A stolen cupful is a dark doorway somewhere, and something always finds a dark doorway.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Where does the oil come from?", next = "oil" },
        { text = "How many lamps does Darkshire burn?", next = "lamps" },
        { text = "It never gets light here. Why bother counting?", next = "bother" },
        { text = "There are oils you can press from plants.", next = "press", when = { profession = { "Alchemy", "Herbalism" } } },
        { text = "You'd burn less with a proper mining lantern.", next = "lantern", when = { race = { "Dwarf", "Gnome" } } },
        { text = "The Commander must value what you do.", next = "values" },
        { text = "How do you light forty-one lamps in one round?", next = "jan_round1" },
        { text = "Chef Grual's tallow must stink the whole town.", next = "jan_tal1" },
        { text = "Good night, Watcher.", next = "END" },
      },
    },
    oil = {
      lines = {
        { id = "oil_1", text = "By wagon from Stormwind, when the wagon gets through, and from Kzixx on the north road when it doesn't. The goblin knows exactly when the wagon's late, and his price that week is something to see." },
      },
      choices = {
        { text = "And if both fail?", next = "fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fail = {
      lines = {
        { id = "fail_1", text = "Then we burn tallow from Chef Grual's kitchen, which smokes and stinks, and after that we burn fence rails. It's come to tallow twice, and I've a list of fences ready that I hope never to use." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lamps = {
      lines = {
        { id = "lamps_1", text = "Forty-one in town, six on the gates, and one each for the watchers on the roads. I've asked the council for ten more along the cemetery road, and Councilman Millstipe has written it down, which is what he does." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bother = {
      big = true,
      lines = {
        { id = "bother_1", text = "Because the dark here is patient, {class}, and it only needs one lamp to go out on one corner. I've seen what was standing on a corner when the light came back, and I've not let one go dry since." },
      },
      choices = {
        { text = "Then you're holding this town together, one lamp at a time.", next = "BACK", reply = "I wouldn't say so in front of the Commander, but thank you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Lamps only show you what's coming. They don't stop it.", next = "BACK", reply = "Seeing it coming is most of the job, friend. Ask anyone who didn't.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    press = {
      lines = {
        { id = "press_1", text = "So Alyssa Eva tells me, and she's tried a few for me at her reagent counter. The best of them burned green and smelled of swamp, and the Commander said she'd rather fight in the dark." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lantern = {
      lines = {
        { id = "lantern_1", text = "I don't doubt it, and I've seen the ones Herble Baubbletump sells. One of his costs what ten of mine do, and the council counts in lamps, so ten it is." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    values = {
      lines = {
        { id = "values_1", text = "She does, in her way. She's never once said so, but the Watch's oil is the only thing in Darkshire she won't let the council cut, and she gave me the key to the store herself." },
        { id = "values_2", when = { questDone = TODO_QUEST("The Night Watch") }, text = "She does, and she's said as much of you, which is rarer. She told the council a stranger had done a watcher's work at the cemeteries, and I filled a lamp in your honour, for what that's worth." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_y_worgen", text = "They don't like the light, or they don't like being seen in it. I've never needed to know which." } },
    rumors = { { id = "tp_y_rumors", text = "Kzixx says there's a goblin selling vials out of a dead house at Raven Hill. If that's so, he's paying nobody for lamp oil." } },
    background = { { id = "tp_background", text = "I kept the lamps at the town hall before there was a Watch. The job got bigger, and they gave me a sword to go with it." } },
    night_watch = { { id = "tp_night_watch", text = "They carry the lamps and I fill them. The Commander says that makes me a watcher, and she's the one who decides." } },
    advice = { { id = "tp_advice", text = "Trim your wick before you leave town, and carry a spare. Nobody ever regrets the spare." } },
    _none = { { id = "tp_none", text = "I couldn't say. If it doesn't burn oil, it's somebody else's business." } },
  },
}

-- Watcher Petras: patrols Darkshire's edge and keeps count of what comes out of the trees.
P:NPC {
  key = "watcher_petras", id = TODO_NPC("Watcher Petras"), name = "Watcher Petras", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "patient", "dry" }, values = { "practical" },
  notices = { "watch", "class" },
  impression = {
    first = "Watcher Petras walks the edge of Darkshire where the houses stop and the trees begin, reading the mud each morning like a ledger. He was a woodsman once and says the woods have changed more than he has.",
    third = "{name} met Watcher Petras, a woodsman turned watcher who patrols the edge of Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back by the same path, and I'm glad to read your tracks in the mud again, {class}. They're the only ones I like finding." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Your tracks are in my mud again. I'll read them, {class}, but I'll not be glad about it." },
    { id = "g_y1", when = { class = "HUNTER" }, text = "Morning. You've noticed the mud already, I see, so we'll get on." },
    { id = "g_default", text = "Morning, or near enough. Step around that patch of mud, would you? I've not finished reading it." },
    { id = "g_2", when = { metBefore = true }, text = "Back again, and by the same path as last time. You're a creature of habit, {class}, and so is everything else that walks here." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = "HUNTER" },
      text = "You read ground too, I can see you doing it. Tell me what you make of the print by the fence, and I'll tell you whether I agree." },
    { id = "n_2", cat = "class", when = { class = "DRUID" },
      text = "One of the wild's own. Then you'll feel it worse than I do, how wrong these woods have gone." },
    { id = "n_3", cat = "watch", when = { profession = "Skinning" },
      text = "A skinner's knife. Don't take a pelt off anything here that walked on two legs first, however fine the fur is." },
  },
  start = "hello",
  nodes = {
    pet_bw1 = {
      lines = {
        { id = "pet_bw1_1", text = "Fresh clawmarks on the old boundary oaks, high up, higher than a wolf could reach on its hind legs. Calor sends the hunters out to thin them, and every time they go, the marks come a few trees nearer to town." },
      },
      choices = {
        { text = "Nearer, even after a good hunt?", next = "pet_bw2" },
        { text = "I'll take a look at those oaks myself.", next = "pet_bw3", when = { class = { "HUNTER", "DRUID" } } },
        { text = "Something else, Petras.", next = "BACK" },
      },
    },
    pet_bw2 = {
      lines = {
        { id = "pet_bw2_1", text = "Aye, because you can thin a pack but you can't thin a forest. What I mark in the mud is the pack testing the line, seeing whether a hunt has left any holes in it." },
      },
      choices = {
        { text = "You make them sound almost like soldiers.", next = "pet_bw3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    pet_bw3 = {
      lines = {
        { id = "pet_bw3_1", text = "They aren't soldiers, but they're more patient than any soldier I knew. If you go up to the oaks, look at the bark on the town side, where the marks are freshest, and tell me if I'm reading it wrong." },
      },
      choices = {
        { text = "I'll look. Something else.", next = "BACK" },
      },
    },
    pet_smith1 = {
      lines = {
        { id = "pet_smith1_1", text = "It does, and Gavin and Morg are the only folk in town who leave their forge lit all night. A lit forge is a fine thing for the line, because anything that comes close to it shows up black against the glow." },
      },
      choices = {
        { text = "They keep it lit on purpose, then?", next = "pet_smith2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet_smith2 = {
      lines = {
        { id = "pet_smith2_1", text = "Morg says it's to save the fire, and Gavin says it's to save the town, and I think they're both telling the truth. Either way it's the one stretch of my line I never worry about." },
      },
      choices = {
        { text = "Then the smiths are watchers, in their way.", next = "BACK" },
        { text = "Back to the other matters.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", text = "Watcher Petras, Night Watch. I walk the line where the town ends, and every morning I look at what came up to that line in the night and how near it dared to come." },
      },
      again = {
        { id = "hello_again1", text = "What else? The mud will keep." },
        { id = "hello_again2", text = "Go on, I'm listening." },
        { id = "hello_again3", text = "Ask away. I'm only waiting for the light, and it isn't coming." },
      },
      choices = {
        { text = "Read the tracks true, even when they lead to a neighbour.", next = "BACK", reply = "The mud doesn't lie, and I don't either. If a Darkshire boot walks out to a Defias camp, I'll say so to the Commander.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Smudge a few tracks if it keeps the peace in town.", next = "BACK", reply = "Then I'd be lying to the only honest thing left in these woods. The mud's a ledger, {class}, and I keep it straight.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What came up to the line last night?", next = "night" },
        { text = "You know these woods well.", next = "woods" },
        { text = "The Watch should hunt them, not count them.", next = "hunt" },
        { text = "That print by the fence is a worgen's.", next = "print", when = { class = "HUNTER" } },
        { text = "I thinned the worgen in Brightwood for Calor.", next = "thinned", when = { questDone = TODO_QUEST("Worgen in the Woods") } },
        { text = "Do the other watchers read tracks?", next = "others" },
        { text = "What did you see at the edge of Brightwood?", next = "pet_bw1" },
        { text = "The Gnarltrees' smithy sits right on your line.", next = "pet_smith1" },
        { text = "Good day, Petras.", next = "END" },
      },
    },
    night = {
      lines = {
        { id = "night_1", text = "Two wolves, a spider the size of a calf, and something on two legs that stood by the Gnarltrees' smithy for a long while without moving. It left before the lamp came round, and I'd like to think the lamp was why." },
      },
      choices = {
        { text = "What stands that still?", next = "still" },
        { text = "Something else.", next = "BACK" },
      },
    },
    still = {
      lines = {
        { id = "still_1", text = "A worgen, when it's watching. People think they're mad dogs, but the ones I track are careful, and they've learned where our lamps are and how long the rounds take.", fx = { learn = { "worgen" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    woods = {
      lines = {
        { id = "woods_1", text = "I cut timber in them for twenty years, back when it was Brightwood and the name fitted. Every tree I knew is still standing, and I'd not walk under one of them now without a lamp and a reason." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hunt = {
      big = true,
      lines = {
        { id = "hunt_1", text = "The Carevins hunt them, and good luck to Elaine and Jonathan, because they're better shots than I am. But the Watch has a dozen lamps and a town to stand around, and a watcher off in the trees is a gap in the ring." },
      },
      choices = {
        { text = "You're right. Hold the ring and let the hunters hunt.", next = "BACK", reply = "That's the Commander's order, and I've never found the hole in it.", fx = { align = { order = 1 } } },
        { text = "A ring only waits to be broken. Go out and end it.", next = "BACK", reply = "I thought so too, the first year. I've buried the ones who went on thinking it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    print = {
      lines = {
        { id = "print_1", text = "It is, and a big one, and you've noticed it's deeper at the toe. That means it was leaning forward, looking at something, and the only thing in front of that fence is the inn's back door." },
      },
      choices = {
        { text = "Tell the innkeeper to bar it. Something else.", next = "BACK" },
      },
    },
    thinned = {
      lines = {
        { id = "thinned_1", text = "I know, because the tracks along my line dropped by half that week. They've crept back since, as they do, but you bought the town some quiet nights, and I marked them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_1", text = "Paige does, out at the crossroads, and I taught Mocarski enough to frighten him properly. The rest look at the trees, and I keep telling them the trees won't tell you a thing until it's too late." },
        { id = "others_2", when = { class = "DRUID" }, text = "Paige does, at the crossroads, and none of the rest. You'd read more from one sniff of the wind than the lot of us do from a morning's mud, I expect, and I'd not mind being told what it says." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_y_worgen", text = "Careful, patient, and they hunt in threes. Whatever else they are, they were taught by something." } },
    advice = { { id = "tp_y_advice", text = "Look down before you look up. Whatever's waiting for you had to walk there first." } },
    background = { { id = "tp_background", text = "A woodcutter, until the wood started cutting back. The Watch was the only work left that I knew the ground for." } },
    night_watch = { { id = "tp_night_watch", text = "We stand in a ring round the town and keep the lamps lit. It isn't much of a strategy, but it's kept the town standing so far." } },
    carevins = { { id = "tp_carevins", text = "The only folk in Darkshire who go into the trees on purpose. I leave marks for them where the tracks are thickest." } },
    _none = { { id = "tp_none", text = "There's no sign of that in the mud, so I can't help you." } },
  },
}

-- Watcher Bukouris: patrols Darkshire by the smithy and sees to the Watch's arms.
P:NPC {
  key = "watcher_bukouris", id = TODO_NPC("Watcher Bukouris"), name = "Watcher Bukouris", title = "The Night Watch", gender = "female",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "brisk", "blunt" }, values = { "practical", "loyal" },
  notices = { "watch", "kit" },
  impression = {
    first = "Watcher Bukouris looks at a stranger's weapons before she looks at the stranger, and she has an opinion on both. She sees to the Night Watch's arms, such as they are, and badgers the smiths on its behalf.",
    third = "{name} met Watcher Bukouris, who looks after the Night Watch's arms in Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back, and that blade's been looked after. Let's see it, {class}; it's a pleasure to inspect something that isn't rusting." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Let's see what you're carrying, {class}, and then be on your way, because I've no time for small talk with you." },
    { id = "g_y1", when = { class = "HUNTER" }, text = "A hunter. Good, somebody who strings their own weapon. Let's see the bow, then." },
    { id = "g_default", text = "Let's see what you're carrying, {class}. No, I don't want to take it; I want to know whether it'll last the night." },
    { id = "g_2", when = { metBefore = true }, text = "You're back, and that blade's seen use since I saw it last. Good." },
  },
  notice = {
    { id = "n_y1", cat = "kit", when = { profession = "Blacksmithing" },
      text = "A smith's forearms. The Gnarltrees could use a second pair of hands, and so could the Watch's rack." },
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That gear's one hard knock from falling off you. Morg Gnarltree's forge is just there, and I'd see him before I saw another sunset, so to speak." },
    { id = "n_2", cat = "watch", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Proper steel, and kept properly. I wish I could stand you in front of my recruits for an hour as an example." },
  },
  start = "hello",
  nodes = {
    buk_gn1 = {
      lines = {
        { id = "buk_gn1_1", text = "They do, and they never send the council a bill, which is just as well, because the council would only argue about it. Morg does the heavy work and Gavin does the fine work, and between them they've kept the Watch in steel two years past when it should have run out." },
      },
      choices = {
        { text = "Where do they get the iron?", next = "buk_gn2" },
        { text = "Something else, Bukouris.", next = "BACK" },
      },
    },
    buk_gn2 = {
      lines = {
        { id = "buk_gn2_1", text = "From whatever's broken, mostly, old ploughs and gate hinges and the wheels of carts that won't need them now. Every sword in that rack has a bit of somebody's farm in it, and the watchers know it." },
      },
      choices = {
        { text = "That's a fitting weapon for farmers.", next = "buk_gn3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    buk_gn3 = {
      lines = {
        { id = "buk_gn3_1", text = "That's what Dodds says, every time he refuses one, and it's the one time I can't argue with him. A man fighting with his own plough blade fights harder, I've noticed, even if he doesn't say why." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    buk_led1 = {
      lines = {
        { id = "buk_led1_1", text = "Every one, with the watcher who carries it, the day it was last sharpened, and every notch it's taken. When a watcher doesn't come home, I want to know what they were holding, because sometimes the blade comes back without them." },
      },
      choices = {
        { text = "Does it come back often?", next = "buk_led2" },
        { text = "I've seen soldiers keep worse records.", next = "buk_led3", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buk_led2 = {
      lines = {
        { id = "buk_led2_1", text = "More often than I'd like, and usually from the cemetery, where the skeletons pick up whatever's lying in the grass. I've had to take back two of our own swords from the dead, and I did not care for the feeling." },
      },
      choices = {
        { text = "Then the ledger keeps the dead honest too.", next = "buk_led3" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    buk_led3 = {
      lines = {
        { id = "buk_led3_1", text = "I learned it from a quartermaster in the old garrison, before it marched north and left us. He said a soldier who doesn't count his steel will soon have none to count, and he was right in every particular." },
      },
      choices = {
        { text = "A good lesson. Something else, Bukouris.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", text = "Watcher Bukouris. I walk the smithy side of town, and I see to it that every watcher's sword has an edge and every crossbow has a string, which is harder than fighting." },
        { id = "hello_2", when = { class = "ROGUE" }, text = "Watcher Bukouris. Those knives are well kept, I'll say that, and I'll say also that I've counted the swords in the Watch's rack and I'll count them again when you've gone." },
      },
      again = {
        { id = "hello_again1", text = "What else? I've a rack of blades to check." },
        { id = "hello_again2", text = "Go on, then." },
        { id = "hello_again3", text = "Ask. I can talk and count at once." },
      },
      choices = {
        { text = "A fighter should own their weapon's flaws, not hide them.", next = "BACK", reply = "Exactly, because a hidden crack only shows itself when a ghoul is on top of you. Tell me what's wrong, and we'll see it mended.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Swap your notched blade for a comrade's when nobody's looking.", next = "BACK", reply = "Do that in this Watch and you'll find out how fast word travels. I'd break your fingers myself, {class}, and then fix the blade.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What is the Watch armed with?", next = "arms" },
        { text = "Do the smiths here help you?", next = "smiths" },
        { text = "A sword's no use against the dead.", next = "dead" },
        { text = "I work a forge. What does the Watch need?", next = "forge", when = { profession = "Blacksmithing" } },
        { text = "The Commander sent me out against the dead.", next = "sent", when = { questActive = TODO_QUEST("The Night Watch") } },
        { text = "How do you train a farmer to fight?", next = "train" },
        { text = "Gavin and Morg Gnarltree work hard for the Watch.", next = "buk_gn1" },
        { text = "You keep a ledger of every blade.", next = "buk_led1" },
        { text = "Good day, Watcher.", next = "END" },
      },
    },
    arms = {
      lines = {
        { id = "arms_1", text = "Whatever came off the farms and whatever the garrison left behind when it marched. That's a dozen army swords, twice as many wood axes, some crossbows, and a pitchfork that's killed more ghouls than I have." },
      },
      choices = {
        { text = "Whose pitchfork is that?", next = "fork" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fork = {
      lines = {
        { id = "fork_1", text = "Watcher Dodds's, and he won't swap it for a sword. He says you can hold a ghoul off at the length of a pitchfork and you can't at the length of a blade, and I've stopped arguing with a man who's still alive." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    smiths = {
      lines = {
        { id = "smiths_1", text = "Gavin and Morg Gnarltree do what they can, and they mend the Watch's blades before any paying work. But iron comes in by the same wagon as everything else, and the wagon's late more often than it's on time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      big = true,
      lines = {
        { id = "dead_1", text = "It's some use, if you take the legs first. What matters is that a farmer holding one stands where he's told, and a farmer holding nothing runs, so I put a sword in every hand I can." },
      },
      choices = {
        { text = "Courage is the weapon. The sword just holds it steady.", next = "BACK", reply = "That's it exactly. I'll use that on the next recruit.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Then you're arming them with a comfort, not a defence.", next = "BACK", reply = "A comfort that keeps them at their post is a defence, {class}.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge = {
      lines = {
        { id = "forge_1", text = "Crossbow bolts, more than anything, and rivets for the lamp brackets. If you've an hour and Morg will lend you the anvil, the Watch would take whatever you made and not ask what it was meant to be." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sent = {
      lines = {
        { id = "sent_1", text = "Then she thinks well of you, because she doesn't send strangers to the cemeteries lightly. Aim low on the skeletons and don't let the ghouls get a hand on you, and come and show me your blade afterwards." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    train = {
      lines = {
        { id = "train_1", text = "I don't, not in the time we have. I teach them three things, which are to stand next to somebody, to aim for the legs, and to shout when they're in trouble, and the rest they learn or they don't." },
        { id = "train_2", when = { class = "WARRIOR" }, text = "The way you were trained, I'd guess, with the fine parts left off. Stand by your neighbour, strike at the legs, and shout when it's going badly, and that's the whole of the Night Watch's drill." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_y_worgen", text = "A sword does for them, same as anything else, if you get the chance to use it. The trouble is all in the getting." } },
    carevins = { { id = "tp_y_carevins", text = "Good shots, and they keep their own gear, which is more than I can say of the Watch. I've stopped offering to check it." } },
    background = { { id = "tp_background", text = "My husband was a soldier in the old garrison and left me his sword when he marched. I've kept it sharper than he ever did." } },
    night_watch = { { id = "tp_night_watch", text = "Twelve of us and thirty-odd weapons, and I know the faults of every one of both." } },
    advice = { { id = "tp_advice", text = "Oil your blade every night here. The damp's as much an enemy as anything in the trees." } },
    _none = { { id = "tp_none", text = "I don't know. Is it sharp? Then it's not my trouble." } },
  },
}

-- Watcher Keller: stands his watch by the Darkshire town hall and likes things done by the book.
P:NPC {
  key = "watcher_keller", id = TODO_NPC("Watcher Keller"), name = "Watcher Keller", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "stiff", "proper" }, values = { "order", "dutiful" },
  notices = { "watch", "status" },
  impression = {
    first = "Watcher Keller guards the town hall steps and salutes the council, the Commander and the Town Crier with equal care. He's the only watcher who has read the Watch's standing orders, having written most of them down himself.",
    third = "{name} met Watcher Keller, who keeps the Night Watch's post by Darkshire's town hall.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good day again, {class}. The standing orders permit a watcher to say he's pleased to see someone, and I find I am." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Good day. The standing orders oblige me to be courteous to you, {class}, and I am obeying them to the letter." },
    { id = "g_y1", when = { timeOfDay = "night" }, text = "The hall is closed to petitioners after dark. If your business is with the Watch, the Commander is in the square." },
    { id = "g_default", text = "Good day. The town hall is open to petitioners until the lamps are lit, and Clerk Daltry will take your name at the door." },
    { id = "g_2", when = { metBefore = true }, text = "Good day again. The standing orders haven't changed since we last spoke, and neither has my post." },
  },
  notice = {
    { id = "n_y1", cat = "status", when = { minLevel = 35 },
      text = "You've the look of somebody the council would wish to thank in person. I can see whether Lord Ello is free." },
    { id = "n_1", cat = "status", when = { origin = "human_minor_noble" },
      text = "You carry yourself like someone used to being announced. I'll tell the clerk you're here, if you wish it done properly." },
    { id = "n_2", cat = "watch", when = { origin = "human_city_guard" },
      text = "A Stormwind guard's bearing, unless I'm mistaken. It's good to see somebody else who stands up straight." },
  },
  start = "hello",
  nodes = {
    kel_mil1 = {
      lines = {
        { id = "kel_mil1_1", text = "Very nearly daily, yes, and he files them in triplicate, which I'll grant is proper of him. This week it's the cost of the Watch's lamp oil, and last week it was the cost of the Watch's lamp oil, from a different angle." },
      },
      choices = {
        { text = "Does the council ever act on them?", next = "kel_mil2" },
        { text = "Something else, Keller.", next = "BACK" },
      },
    },
    kel_mil2 = {
      lines = {
        { id = "kel_mil2_1", text = "They debate them, which Councilman Millstipe considers action, and then Deputy Mayor Dreuger quietly does whatever's needed afterwards. I've seen him sign more papers in the corridor than in the hall." },
      },
      choices = {
        { text = "So Dreuger is the one who gets things done.", next = "kel_mil3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    kel_mil3 = {
      lines = {
        { id = "kel_mil3_1", text = "I didn't say that, {class}, and I'd be grateful if you didn't repeat it in the hall. I said he signs things in the corridor, which is a matter of record, and a watcher keeps to the record." },
      },
      choices = {
        { text = "Understood. Something else.", next = "BACK" },
      },
    },
    kel_ord1 = {
      lines = {
        { id = "kel_ord1_1", text = "The Commander wrote seven and I proposed the other two, which she accepted after some discussion. The eighth is about keeping the lamps trimmed and the ninth is about reporting to the hall by name, and both were mine." },
      },
      choices = {
        { text = "Why report by name?", next = "kel_ord2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kel_ord2 = {
      lines = {
        { id = "kel_ord2_1", text = "Because a watcher who calls out \"all's well\" might be anyone, and the dead have been known to walk in Watch tabards. A name is harder to fake, and Watcher Blomberg at the crossroads keeps the same habit for the same reason." },
      },
      choices = {
        { text = "That's a grim reason for a sensible rule.", next = "BACK" },
        { text = "Back to other matters, Keller.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", text = "Watcher Keller, Night Watch, posted to the town hall. Lord Ebonlocke and the council sit inside, the Commander has the square, and I see that nothing unpleasant comes up these steps while they're at work." },
        { id = "hello_2", when = { faction = "Horde" }, text = "Watcher Keller, Night Watch. The town hall isn't open to you, and I'd be obliged if you'd go on standing exactly that far from the steps." },
      },
      again = {
        { id = "hello_again1", text = "Was there something further?" },
        { id = "hello_again2", text = "Proceed. I can spare a moment from the post." },
        { id = "hello_again3", text = "Yes? Briefly, if you would." },
      },
      choices = {
        { text = "A watcher's word should bind him as firmly as any order.", next = "BACK", reply = "Well said, and I put very nearly that line into the orders myself, in the third section. Nobody reads the third section.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Bend the rules quietly when they get in the way.", next = "BACK", reply = "Quietly bent rules have a way of snapping, {class}, usually at night. I'll keep mine straight, thank you.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What are the Watch's standing orders?", next = "orders" },
        { text = "Who comes to petition the council?", next = "petition" },
        { text = "Rules won't frighten a worgen.", next = "rules" },
        { text = "The Stormwind guard drills every dawn. Does the Watch?", next = "drill", when = { origin = "human_city_guard" } },
        { text = "I've a translation for Lord Ello.", next = "ello", when = { questActive = TODO_QUEST("Translation to Ello") } },
        { text = "What's Lord Ebonlocke like to serve?", next = "lord" },
        { text = "Councilman Millstipe seems to bring a new grievance daily.", next = "kel_mil1" },
        { text = "Who wrote these nine orders?", next = "kel_ord1" },
        { text = "Good day, Watcher.", next = "END" },
      },
    },
    orders = {
      lines = {
        { id = "orders_1", text = "There are nine. Keep your lamp lit, keep your post, call out before you strike, and never follow anything into the trees, and the other five are about who relieves whom. The Commander spoke them and I wrote them down, since nobody else had." },
      },
      choices = {
        { text = "Why \"call out before you strike\"?", next = "callout" },
        { text = "Something else.", next = "BACK" },
      },
    },
    callout = {
      lines = {
        { id = "callout_1", text = "Because in the first year a watcher put a bolt through a farmer who was only late home. The Commander gave that order the same night, and we've not buried one of our own townsfolk by mistake since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    petition = {
      lines = {
        { id = "petition_1", text = "Farmers asking for an escort to see what's left of their land, mostly, and Councilman Millstipe with a new grievance for the record. Madame Eva comes when the stars have told her something, and Lord Ello always hears her out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rules = {
      big = true,
      lines = {
        { id = "rules_1", text = "No, they're not meant to. They're meant to see that a dozen tired, frightened people do the same sensible thing at the same moment, and that's kept this town standing where braver ones have burned." },
      },
      choices = {
        { text = "Order is what holds when courage runs out.", next = "BACK", reply = "Just so. I may write that under the ninth order, with your leave.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "In the dark, a watcher should trust instinct over orders.", next = "BACK", reply = "Instinct says run, {class}. Every one of the nine is there to answer it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    drill = {
      lines = {
        { id = "drill_1", text = "At what passes for dawn, yes, in the square, though I'm the only one who's never missed it. They're farmers, and they'll hold a line well enough, but I can't get them to do it in step." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ello = {
      lines = {
        { id = "ello_1", text = "Then go straight in, and mind you give it into Lord Ello's own hand. He's waited on that page for some time, and Sirra Von'Indi doesn't part with his work for just anyone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lord = {
      lines = {
        { id = "lord_1", text = "A patient man with an impatient daughter, if I may say so. He hears every petition to its end and signs whatever the Commander puts in front of him, and between the two of them the town is governed and defended." },
        { id = "lord_2", when = { origin = "human_minor_noble" }, text = "A patient man, and a gentleman of the old sort, as you would recognise. He's written to every house in Stormwind that once dined at his table, and I've carried the letters to the courier myself." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_y_worgen", text = "The standing orders call them \"the creatures in the wood\", because the council wouldn't agree on a word. I write \"worgen\" in the margin." } },
    rumors = { { id = "tp_y_rumors", text = "I don't repeat rumours. Watcher Fraizer will, at length, if you ask him by the inn." } },
    background = { { id = "tp_background", text = "I was the town hall's doorman, and I still am. They only added a sword and a title." } },
    night_watch = { { id = "tp_night_watch", text = "Founded by Commander Ebonlocke under her father's seal, in the third month of the dark. I have the date written down." } },
    advice = { { id = "tp_advice", text = "Call out before you strike. It's the second order, and the one that matters most to whoever you were about to hit." } },
    _none = { { id = "tp_none", text = "That isn't covered in the standing orders, and I'd not care to guess." } },
  },
}

-- Watcher Fraizer: patrols the inn side of Darkshire and knows the town's talk.
P:NPC {
  key = "watcher_fraizer", id = TODO_NPC("Watcher Fraizer"), name = "Watcher Fraizer", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "talkative", "easy" }, values = { "loyal" },
  notices = { "watch", "drink" },
  impression = {
    first = "Watcher Fraizer patrols past the Scarlet Raven so often that the innkeeper has stopped offering him a chair. He hears everything said in the taproom doorway and passes on the useful half to the Commander.",
    third = "{name} met Watcher Fraizer, who patrols by the Scarlet Raven Tavern in Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are, friend! Smitts said you'd been in, and I told him you're the only stranger I'd vouch for in that taproom." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The Raven's that way, friend, and I'd just as soon you went in and stayed there." },
    { id = "g_y1", when = { drunk = true }, text = "Steady there, friend! The Raven's ale is stronger than it tastes, and Smitts never warns anybody." },
    { id = "g_default", text = "Evening, friend! You'll want the Scarlet Raven, just there. It's the only door in town that opens for strangers after the lamps are lit." },
    { id = "g_2", when = { metBefore = true }, text = "There you are. Smitts said you'd been in, and I said you'd be back out this way before long." },
  },
  notice = {
    { id = "n_y1", cat = "watch", when = { minLevel = 30 },
      text = "You've got stories, I can tell by the scars. The Raven would stand you a seat by the fire for one or two of them." },
    { id = "n_1", cat = "drink", when = { drunk = true },
      text = "You've found the tavern already, I see. Walk in the middle of the road, friend, since the edges are where the trees start." },
    { id = "n_2", cat = "watch", when = { class = "ROGUE" },
      text = "Light on your feet, aren't you? Whatever your trade is, ply it somewhere else, because there's nothing in this town worth lifting." },
  },
  start = "hello",
  nodes = {
    fra_pale1 = {
      lines = {
        { id = "fra_pale1_1", text = "Aye, and he paid for his room with old Lordaeron coin, which nobody's minted in years. He asked after the graveyards, and Raven Hill in particular, and the day after he left the dead at Raven Hill got bolder." },
      },
      choices = {
        { text = "Did you tell the Commander?", next = "fra_pale2" },
        { text = "I'm sure there's an innocent reason.", next = "fra_pale2" },
        { text = "Something else, Fraizer.", next = "BACK" },
      },
    },
    fra_pale2 = {
      lines = {
        { id = "fra_pale2_1", text = "I did, and she sent two watchers after him, and they found his bedroll on the road west with no sign of the man. She's not mentioned him since, but she's kept a watcher at the Raven every night after." },
      },
      choices = {
        { text = "Which is why your round passes the inn.", next = "fra_pale3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    fra_pale3 = {
      lines = {
        { id = "fra_pale3_1", text = "That's the very reason, though I'd thank you not to say so in there, or nobody will tell me anything again. Folk talk to a watcher who's having a drink, but they go quiet for one who's keeping an eye on them." },
      },
      choices = {
        { text = "Your secret's safe. Something else.", next = "BACK" },
      },
    },
    fra_smi1 = {
      lines = {
        { id = "fra_smi1_1", text = "Gruffer, and proud of it, though he's softer than he lets on. He keeps a pot on the fire for any watcher who comes in cold, and if you mention it he'll swear it's leftovers." },
      },
      choices = {
        { text = "Is it leftovers?", next = "fra_smi2" },
        { text = "I've heard he once fought in the war.", next = "fra_smi2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fra_smi2 = {
      lines = {
        { id = "fra_smi2_1", text = "Never once, because I've watched him cook it fresh at midnight, muttering. He was a soldier of some sort before he kept a bar, which you can tell from how he stands, but he only talks about it after his third ale." },
      },
      choices = {
        { text = "Then I'll buy him a third ale.", next = "BACK" },
        { text = "Back to other matters, Fraizer.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", text = "Watcher Fraizer, Night Watch. My round takes in the inn and the houses behind it, and since the inn's where the talk is, I suppose I'm the Watch's ears as well as its feet." },
        { id = "hello_2", when = { timeOfDay = "night" }, text = "Watcher Fraizer, Night Watch. The Raven's full tonight, because nobody wants to sit alone at home in this, and so I've a great deal to listen to." },
      },
      again = {
        { id = "hello_again1", text = "What else can I tell you? I've an hour before the next round." },
        { id = "hello_again2", text = "Go on, I like a chat." },
        { id = "hello_again3", text = "Ask! Nobody else does, they only tell me things." },
      },
      choices = {
        { text = "What's said over ale should be passed on fairly, not twisted.", next = "BACK", reply = "I only ever pass on the useful half, and I pass it on straight. The Commander can't use a rumour that's been sweetened.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Spread a rumour or two; it shakes the truth loose.", next = "BACK", reply = "Ha! You'd have the whole Raven at each other's throats by midnight. Smitts would throw you out, and then me for listening.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What's the talk at the Scarlet Raven?", next = "talk" },
        { text = "Who keeps the inn?", next = "inn" },
        { text = "Gossip isn't a watcher's business.", next = "gossip" },
        { text = "I ended the Stalvan matter. Does the town know?", next = "stalvan", when = { questDone = TODO_QUEST("The Legend of Stalvan") } },
        { text = "I came south from Lordaeron. Are there others here?", next = "refugee", when = { race = "Human", origin = "human_lordaeron_refugee" } },
        { text = "Do strangers ever cause trouble at the inn?", next = "strangers" },
        { text = "You mentioned a pale fellow who asked questions.", next = "fra_pale1" },
        { text = "Is Smitts really as gruff as they say?", next = "fra_smi1" },
        { text = "Good night, Fraizer.", next = "END" },
      },
    },
    talk = {
      lines = {
        { id = "talk_1", text = "This week it's whether the wagon from Elwynn got through, and whether the fellow drinking alone in the corner is as rich as his coat. And there's always Madame Eva, and what she's seen in the stars this time.", fx = { learn = { "night_watch" } } },
      },
      choices = {
        { text = "What has Madame Eva seen?", next = "eva" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eva = {
      lines = {
        { id = "eva_1", text = "Trouble, as ever, though she's been right too often for anyone to laugh. Folk go quiet when she walks past the Raven's door, and then they talk about nothing else for an hour." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    inn = {
      lines = {
        { id = "inn_1", text = "Innkeeper Trelayne has the rooms and Tavernkeep Smitts has the bar, and Barkeep Hann pours when Smitts is busy looking worried. Chef Grual has the kitchen, and I'd eat what he puts down without asking after it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip = {
      big = true,
      lines = {
        { id = "gossip_1", text = "The Commander thought so too, until I told her a farmer had been buying far more rope and lamp oil than a farm needs. He'd been going out to the cemetery at night, for reasons I'll not repeat, and we fetched him back in time." },
      },
      choices = {
        { text = "Then listening is part of the watch. Keep at it.", next = "BACK", reply = "That's what the Commander said, in fewer words. I do my best.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Folk have a right to their own business.", next = "BACK", reply = "They do, friend, right up to the edge of town. Past that it's ours.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stalvan = {
      lines = {
        { id = "stalvan_1", text = "Know? They've talked of nothing else. Half the Raven says Mistmantle was a monster and the other half says the town made him one, and Clerk Daltry won't have the name said in the hall at all.", fx = { learn = { "stalvan" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    refugee = {
      lines = {
        { id = "refugee_1", text = "A few, who stopped here because they'd no coin to go further, and who say Darkshire's the first place that's felt like home. I've never known whether to take that as praise." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    strangers = {
      lines = {
        { id = "strangers_1", text = "Now and then. There was a pale fellow who sat in the corner for a week and bought nothing but questions, and he left by night without paying for his room. Trelayne was cross about the room, and I was a good deal more bothered by the questions." },
        { id = "strangers_2", when = { class = "ROGUE" }, text = "Now and then, and I'd say the quiet ones are the ones to mind, present company not excepted. There was a pale fellow asking questions for a week, and he left by night without settling up." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_y_worgen", text = "Nobody at the Raven says the word after dark. They say \"the wolves\", and everyone knows which wolves." } },
    advice = { { id = "tp_y_advice", text = "If you want to know anything in this town, buy Smitts a drink and stand near him for an hour." } },
    background = { { id = "tp_background", text = "Born three doors from the Raven. I've been walking past it all my life, and now they give me lamp oil for it." } },
    rumors = { { id = "tp_rumors", text = "They say there's a hermit past Raven Hill who buys odd things from strangers. I say anyone living out there by choice is worth staying clear of." } },
    _none = { { id = "tp_none", text = "Nobody's mentioned that at the Raven, and if they haven't, I haven't heard it." } },
  },
}

-- Watcher Wollpert: keeps the east side of Darkshire, on the road toward Tranquil Gardens Cemetery.
P:NPC {
  key = "watcher_wollpert", id = TODO_NPC("Watcher Wollpert"), name = "Watcher Wollpert", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "quiet", "grim" }, values = { "dutiful" },
  notices = { "watch", "light" },
  impression = {
    first = "Watcher Wollpert stands where the road leaves Darkshire for Tranquil Gardens, and he has helped carry most of the town's dead along it. He speaks about the cemetery quietly, as if it might overhear.",
    third = "{name} met Watcher Wollpert, who keeps the Night Watch's post on the cemetery road out of Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back along my road again, {class}. I'm glad of it; I've carried too many who didn't." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You came back along my road. I'll note it, {class}, and say nothing more." },
    { id = "g_y1", when = { timeOfDay = "night" }, text = "Not east, not at this hour. Whatever you want from the cemetery will still be there in the grey of the morning." },
    { id = "g_default", text = "You're heading east? Then stop and hear me first, {class}, because that road ends at the cemetery and the cemetery isn't what it was." },
    { id = "g_2", when = { metBefore = true }, text = "You came back along my road. Not everyone has." },
  },
  notice = {
    { id = "n_y1", cat = "watch", when = { minLevel = 30 },
      text = "You've put the dead down before. It shows in how you look at the road, and I'm sorry you had to learn it." },
    { id = "n_1", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "The Light's sent somebody at last. There's a whole churchyard east of here that needs you more than the living do." },
    { id = "n_2", cat = "watch", when = { class = "WARLOCK" },
      text = "I know that smell; it's on the ones we put back in the ground. Whatever you're here for, you'll not do it on my road." },
  },
  start = "hello",
  nodes = {
    wol_carry1 = {
      lines = {
        { id = "wol_carry1_1", text = "We don't, not past the gate any more, and that's the hardest thing I've had to say to a widow. We bury them in the field behind the chapel wall, where the ground's still quiet, and mark the place so they can be moved when the rows are clean." },
      },
      choices = {
        { text = "Who decides when the rows are clean?", next = "wol_carry2" },
        { text = "I'll help clear them for you.", next = "wol_carry3", when = { faction = "Alliance", minLevel = 20 } },
        { text = "Something else, Wollpert.", next = "BACK" },
      },
    },
    wol_carry2 = {
      lines = {
        { id = "wol_carry2_1", text = "The Commander, and she's said it'll be when the skeletons stop rising, not before. The thing is, they keep rising, so I've a field full of markers and a list of names waiting for proper ground." },
      },
      choices = {
        { text = "A list like that must weigh heavy.", next = "wol_carry3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    wol_carry3 = {
      lines = {
        { id = "wol_carry3_1", text = "It does, and I keep it in my coat so it's never far. When the day comes, I mean to walk every one of them back to the rows myself, and anyone who'll help me carry is welcome." },
      },
      choices = {
        { text = "I'd carry with you. Something else.", next = "BACK" },
      },
    },
    wol_sirra1 = {
      lines = {
        { id = "wol_sirra1_1", text = "He does, with a lantern and his notebook, and he sketches the gravestones from the gate. He says the names are history and someone ought to keep them, since the stones won't last with the dead knocking them over." },
      },
      choices = {
        { text = "Does he ever go inside?", next = "wol_sirra2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wol_sirra2 = {
      lines = {
        { id = "wol_sirra2_1", text = "Once, and he came out quicker than he went in, with his notebook clutched to his chest. Now he stays at the gate like the rest of them and asks me to read him the far stones by lantern, which I do, slowly." },
      },
      choices = {
        { text = "Then you're keeping the names too, Wollpert.", next = "BACK" },
        { text = "Let's leave the cemetery for now.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", text = "Watcher Wollpert, Night Watch. This is the cemetery road, and I stand at the town end of it, to see who goes out to Tranquil Gardens and what comes back in." },
      },
      again = {
        { id = "hello_again1", text = "Something more?" },
        { id = "hello_again2", text = "Go on. It's a quiet hour." },
        { id = "hello_again3", text = "Ask. I've nothing to do but watch the road." },
      },
      choices = {
        { text = "The dead should be buried properly, whatever the danger.", next = "BACK", reply = "Aye, and I've carried them east on my own shoulders to see it done. Even now, with the cemetery as it is, we owe them that.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Leave the dead where they fall; the living matter more.", next = "BACK", reply = "Say that quietly, {class}, because the road might hear you. I've known men who left their friends, and the friends came looking for them.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What's wrong with the cemetery?", next = "cemetery" },
        { text = "You've carried the dead out there yourself.", next = "carried" },
        { text = "I heard something came up this road once.", next = "stitches" },
        { text = "The Commander wants skeletons cleared from the cemetery.", next = "clear", when = { questActive = TODO_QUEST("The Night Watch") } },
        { text = "Let me say a word over this road.", next = "word", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Does anyone still visit the graves?", next = "visit" },
        { text = "How do you carry the dead out with the cemetery like this?", next = "wol_carry1" },
        { text = "Sirra Von'Indi visits the gate, you said.", next = "wol_sirra1" },
        { text = "I'll go carefully.", next = "END" },
      },
    },
    cemetery = {
      lines = {
        { id = "cemetery_1", text = "The graves are open, the old ones first and now the new. Skeletons walk the rows as if they were on a round of their own, and they've no interest in who used to mourn them.", fx = { learn = { "night_watch" } } },
      },
      choices = {
        { text = "Who opened the graves?", next = "who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "who_1", text = "The Commander thinks the same hand's behind it as at Raven Hill, since the dead don't get up for nothing. All I know is that I buried a neighbour of mine in the spring, and in the summer I had to put him down again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    carried = {
      lines = {
        { id = "carried_1", text = "Most of them, since the dark came, as I've the back for it. We used to walk out with a priest and half the town behind, and now it's two watchers and a cart, and we don't stay for the filling in." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stitches = {
      big = true,
      lines = {
        { id = "stitches_1", text = "It did. It was a thing sewn together out of the dead, bigger than a wagon, and it walked this road toward the town as if it had been pointed here. The Watch and every stranger in the Raven met it at the gate, and it still took the fence with it.", fx = { learn = { "embalmer" } } },
      },
      choices = {
        { text = "The town held. That's what matters.", next = "BACK", reply = "It did, and I remind myself of it each night I'm posted here.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Next time it'll be two of them. You can't win this.", next = "BACK", reply = "Then we'll stand at the gate twice. I've no better answer than that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    clear = {
      lines = {
        { id = "clear_1", text = "Then you're doing what a dozen of us can't spare the hands for. Go in by the south wall, where the rows are widest, and don't let them get you between the crypts." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    word = {
      lines = {
        { id = "word_1", text = "Say it, and welcome. Every one of ours went down this road with a blessing, and I'd be easier if the road had one too." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    visit = {
      lines = {
        { id = "visit_1", text = "One or two, with a watcher beside them, to leave flowers at the gate because they can't go further. Sirra Von'Indi used to walk the rows copying the old stones for his histories, and he says half of what she copied has since been knocked down from underneath." },
        { id = "visit_2", when = { class = { "PRIEST", "PALADIN" } }, text = "One or two, with a watcher beside them, and they go no further than the gate. If you'd walk them to the graves themselves some morning, you'd give them back something I can't." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_y_worgen", text = "That's the other roads' trouble. Mine's the kind that used to have names." } },
    morbent_fel = { { id = "tp_y_morbent_fel", text = "I've heard the name from the west-road watchers. If he's the one who emptied our graves, I'd like a word with him, and it wouldn't be a long one." } },
    background = { { id = "tp_background", text = "A carter, before all this. I carried grain and then I carried the dead, and the Watch gave me a lamp for the second job." } },
    raven_hill = { { id = "tp_raven_hill", text = "Worse than ours, by every account, and older. I'm glad to have only the one cemetery to watch." } },
    advice = { { id = "tp_advice", text = "If you know the face, strike anyway. It isn't them any longer, and they'd thank you if they could." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. I only know this road, and where it goes." } },
  },
}

-- Avette Fellwood: sells bows near the Scarlet Raven in Darkshire.
P:NPC {
  key = "avette_fellwood", id = TODO_NPC("Avette Fellwood"), name = "Avette Fellwood", title = "Bowyer", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "calm", "exact" }, values = { "craft", "practical" },
  notices = { "class", "craft" },
  impression = {
    first = "Avette Fellwood sells bows by the inn in Darkshire and strings each one herself before she lets it leave. Her best customers are the town's own hunters, and she grumbles that they pay in venison.",
    third = "{name} met Avette Fellwood, the bowyer of Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! Let me see the string; you're one of the few who looks after a bow properly in this damp." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Back again. Try any bow you like, and then pay for it, and don't loose a string dry while you're about it." },
    { id = "g_y1", when = { class = "HUNTER" }, text = "Now that's a proper bow arm. Come in and try the yew, and tell me honestly what you think of the draw." },
    { id = "g_default", text = "Good day. Try the draw on any bow you like, only don't loose a string dry; I can hear it from across the square." },
    { id = "g_2", when = { metBefore = true }, text = "Welcome back. How has the string held, in this damp?" },
  },
  notice = {
    { id = "n_y1", cat = "class", when = { class = "WARRIOR" },
      text = "You'll say you've no use for a bow, and then something will stand off thirty paces and throw things at you. I've a light one that hangs across the back." },
    { id = "n_1", cat = "class", when = { class = "HUNTER" },
      text = "You hold your shoulders like an archer. I've a yew longbow on the wall that I've been keeping back for somebody who'd deserve it." },
    { id = "n_2", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You work hides? I can always use good sinew and a bit of rawhide for grips, and Darkshire's hunters bring me less than they promise." },
  },
  start = "hello",
  nodes = {
    ave_wood1 = {
      lines = {
        { id = "ave_wood1_1", text = "Yew from the old Brightwood, cut before the dark came down, and I've maybe three years' worth left in the loft. What grows in Duskwood now is grey and soft at the heart, and it twists as it dries." },
      },
      choices = {
        { text = "What happens when the yew runs out?", next = "ave_wood2" },
        { text = "Something else, Avette.", next = "BACK" },
      },
    },
    ave_wood2 = {
      lines = {
        { id = "ave_wood2_1", text = "Then I buy from Elwynn at Stormwind prices, or I learn to make bows from bad wood, and I've been practising both. The bad-wood bows shoot well enough for a season and then they start to sing when you draw them, which unsettles people." },
      },
      choices = {
        { text = "A bow that sings is a bad omen, they'd say.", next = "ave_wood3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    ave_wood3 = {
      lines = {
        { id = "ave_wood3_1", text = "Madame Eva said exactly that and bought one anyway, for reasons she didn't give. I've stopped asking what she does with half the things she buys from this town." },
      },
      choices = {
        { text = "Sensible of you. Something else.", next = "BACK" },
      },
    },
    ave_car1 = {
      lines = {
        { id = "ave_car1_1", text = "She'd better, the number she goes through, because she's the hardest shot on a bow I've ever strung for. Jonathan's steadier and Elaine's faster, and between them they bring back more worgen pelts than the rest of the town together." },
      },
      choices = {
        { text = "They bring the pelts to you?", next = "ave_car2" },
        { text = "I'd like to meet them.", next = "ave_car2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ave_car2 = {
      lines = {
        { id = "ave_car2_1", text = "Only to show off, and then they go to the tanner, since I've no use for the hides. They live out near the edge of the woods and come in for strings once a week, so you'll catch them if you wait about." },
      },
      choices = {
        { text = "Then I'll wait about. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", text = "Avette Fellwood, bowyer. I make them and I mend them, and in a town where nobody wants to get close to what they're fighting, I'm never short of work." },
        { id = "hello_2", when = { class = "HUNTER", race = "Dwarf" }, text = "Avette Fellwood, bowyer. You'll be a rifle {g:man|woman}, coming from Ironforge, but powder goes damp in Duskwood and a bowstring only wants waxing, so think on it." },
      },
      again = {
        { id = "hello_again1", text = "Anything else? I've a stave in the steam that won't wait long." },
        { id = "hello_again2", text = "Go on, I can talk while I wax." },
        { id = "hello_again3", text = "Yes, ask away, by all means." },
      },
      choices = {
        { text = "A hunter should face the beast, not poison the waterhole.", next = "BACK", reply = "Proper hunters say the same, and my regulars would string you up for a poisoned hole. Fair shots and clean kills, that's how Darkshire eats.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Bait, poison, snares; however the meat comes home is fine.", next = "BACK", reply = "It'll come home, aye, and it'll taste of whatever you poisoned it with. Don't bring meat like that to my door, friend.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see your bows.", next = "BUSINESS" },
        { text = "Who buys bows in Darkshire?", next = "buyers" },
        { text = "The damp must ruin your work.", next = "damp" },
        { text = "A bow is a coward's weapon.", next = "coward" },
        { text = "What would you carry into Brightwood?", next = "carry", when = { class = "HUNTER" } },
        { text = "Your staves are cut very like Kaldorei ones.", next = "elf", when = { race = "NightElf" } },
        { text = "Do you sell to the Night Watch?", next = "watch" },
        { text = "Where do you get your staves?", next = "ave_wood1" },
        { text = "Elaine Carevin swears by your strings.", next = "ave_car1" },
        { text = "Good day, Avette.", next = "END" },
      },
    },
    buyers = {
      lines = {
        { id = "buyers_1", text = "The Carevins, first and always, since Elaine and Jonathan go through strings faster than I can twist them. Then the Watch, who want crossbows because a farmer can learn one in a week, and then travellers like you." },
      },
      choices = {
        { text = "What do the Carevins hunt?", next = "carevins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carevins = {
      lines = {
        { id = "carevins_1", text = "Worgen, and they're the only ones in town who'll say the word without lowering their voice. Jonathan brings me the heads of his bolts to re-fletch, and some of them come back bitten clean in half.", fx = { learn = { "carevins" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    damp = {
      lines = {
        { id = "damp_1", text = "It would, if I let it. Every stave is sealed twice and every string's waxed until it shines, and I still tell my customers to unstring at night and sleep with the bow indoors." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    coward = {
      big = true,
      lines = {
        { id = "coward_1", text = "Is it? Then Darkshire's full of cowards who are still alive, and I'm glad to have armed them. I've nothing against courage, only against being within arm's reach of a ghoul when there was no need." },
      },
      choices = {
        { text = "You're right. There's no shame in killing from a distance.", next = "BACK", reply = "None at all, and less washing afterwards.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "An honourable fighter looks the enemy in the eye.", next = "BACK", reply = "The enemy here hasn't always got eyes, {class}. But as you like.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = {
        { id = "carry_1", text = "A short recurve, since the trees are too close for a longbow, and broadheads rather than bodkins. Worgen don't wear armour, and what you want is for them to bleed quickly and lose interest." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    elf = {
      lines = {
        { id = "elf_1", text = "You've a good eye. An elven hunter passed through years ago and left me a broken bow in payment for a meal, and I've been copying its lines ever since without once matching them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = {
        { id = "watch_1", text = "Crossbows, and bolts by the sheaf, and I mend them without charge when the council's behind on its bills, which is always. Watcher Bukouris comes by every week to count what I've finished and to tell me it's not enough." },
        { id = "watch_2", when = { questDone = TODO_QUEST("The Night Watch") }, text = "Crossbows and bolts, and I mend them for nothing. Bukouris says you've been out to the cemeteries on the Commander's word, so I'll tell you what I tell the Watch, that a skeleton wants a blunt head and not a sharp one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    night_watch = { { id = "tp_y_night_watch", text = "Good people with poor aim. I do what I can about the second part." } },
    rumors = { { id = "tp_y_rumors", text = "The hunters say the wolves north of the river have stopped running from arrows. I've started making heavier ones." } },
    background = { { id = "tp_background", text = "My father made bows for the garrison that used to be here. The garrison left, and the bows turned out to be needed more than ever." } },
    worgen = { { id = "tp_worgen", text = "Fast, and they don't stop for one arrow. I tell every customer to plan on three." } },
    advice = { { id = "tp_advice", text = "Unstring your bow at night in Duskwood. The damp will do in a week what a year does elsewhere." } },
    _none = { { id = "tp_none", text = "That's outside my trade, I'm afraid. Ask at the inn." } },
  },
}

-- Lohgan Eva: sells tailoring supplies in Darkshire; Madame Eva's grandson and Alyssa Eva's brother.
P:NPC {
  key = "lohgan_eva", id = TODO_NPC("Lohgan Eva"), name = "Lohgan Eva", title = "Tailoring Supplies", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "mild", "wry" }, values = { "family", "practical" },
  notices = { "craft", "arcane" },
  impression = {
    first = "Lohgan Eva sells thread and cloth in Darkshire and is the one member of his family with no interest in the stars. He says somebody has to keep the Evas in candles while the rest read the heavens.",
    third = "{name} met Lohgan Eva, who sells tailoring supplies in Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are, my best needle-hand. I've kept the silk wrapped against the damp, so come and have a look." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Thread, dye and cloth, and no prophecies, as ever. You'll find no warmer welcome in it than that." },
    { id = "g_y1", when = { profession = "Tailoring" }, text = "A needle-hand, at last! Come and look at the silk before the damp gets to it." },
    { id = "g_default", text = "Good day to you. Thread, dye and bolts of cloth, and no prophecies whatever, which you'll find sets me apart in this house." },
    { id = "g_2", when = { metBefore = true }, text = "Back for more thread? Grandmother said you would be, but then she says that about everyone." },
  },
  notice = {
    { id = "n_y1", cat = "craft", when = { race = "Gnome" },
      text = "A gnome in Darkshire! Herble Baubbletump will want to hear news of Tinker Town, and I'd be glad of somebody else for him to tell about his inventions." },
    { id = "n_1", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Then you'll know what you're looking at, and I shan't have to explain why the good silk thread costs what it does." },
    { id = "n_2", cat = "arcane", when = { class = { "MAGE", "WARLOCK" } },
      text = "You've the look of someone who'd rather talk to my grandmother or my sister. They're the ones for stars and reagents, and I only sell what holds a robe together." },
  },
  start = "hello",
  nodes = {
    loh_say1 = {
      lines = {
        { id = "loh_say1_1", text = "Grandmother's, like most of the sayings in our house, and the full version is that cloth is patient but the damp is more so. She said it to my mother and my mother said it to me, and I've said it to Alyssa until she threw a spool at me." },
      },
      choices = {
        { text = "Did your mother keep the shop before you?", next = "loh_say2" },
        { text = "Something else, Lohgan.", next = "BACK" },
      },
    },
    loh_say2 = {
      lines = {
        { id = "loh_say2_1", text = "She did, in the old days when this was Grand Hamlet and folk bought bright colours for the summer fair. She'd not know the place now, with every bolt dyed grey and every customer looking over their shoulder." },
      },
      choices = {
        { text = "Grey is practical, at least.", next = "loh_say3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    loh_say3 = {
      lines = {
        { id = "loh_say3_1", text = "That's what I tell myself, and it's even true, because a grey cloak doesn't show you up against the trees. I still keep one bolt of good red in the back for a wedding, in case anyone in Darkshire ever has one again." },
      },
      choices = {
        { text = "I hope you sell it soon. Something else.", next = "BACK" },
      },
    },
    loh_can1 = {
      lines = {
        { id = "loh_can1_1", text = "Nobody, not since the chandler went to Stormwind, so I took up the trade because somebody had to. Watcher Jan buys my tallow ends when his oil runs short, which is more often than he'd admit to the council." },
      },
      choices = {
        { text = "Tallow candles must burn dim.", next = "loh_can2" },
        { text = "I could teach you a better dip.", next = "loh_can2", when = { profession = "Tailoring" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    loh_can2 = {
      lines = {
        { id = "loh_can2_1", text = "Dim and smoky, but they last, and a candle that lasts the night is worth more here than one that shines. Grandmother wants beeswax for her readings, and I've told her the last bee in Duskwood left when the sun did." },
      },
      choices = {
        { text = "Then her readings make do. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", text = "Lohgan Eva, and I keep the family in thread and candles. My grandmother reads the stars and my sister Alyssa sells reagents, so between us we can clothe you, supply your spells and tell you how it'll all end." },
      },
      again = {
        { id = "hello_again1", text = "Something else? I've a bolt to measure." },
        { id = "hello_again2", text = "Go on, then; cloth is patient." },
        { id = "hello_again3", text = "Yes? Ask, by all means." },
      },
      choices = {
        { text = "A merchant should say when the cloth is mildewed.", next = "BACK", reply = "I do, and it costs me sales, but in this damp a hidden spot is a ruined cloak by spring. Better I lose the coin than the customer.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Fold the mildew inside and nobody finds it till they're home.", next = "BACK", reply = "And then they'd come back to the house of Eva and blame the stars for it. No, thank you; I've enough of the stars.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You don't read the stars yourself?", next = "stars" },
        { text = "Who sews in a town like this?", next = "sews" },
        { text = "Your grandmother frightens people.", next = "frightens" },
        { text = "What sells best to tailors here?", next = "best", when = { profession = "Tailoring" } },
        { text = "I helped your grandmother with her reading.", next = "helped", when = { questDone = TODO_QUEST("Look To The Stars") } },
        { text = "And your sister, Alyssa?", next = "alyssa" },
        { text = "You said cloth is patient. Is that a family saying?", next = "loh_say1" },
        { text = "Who sells candles to this town besides you?", next = "loh_can1" },
        { text = "Good day, Lohgan.", next = "END" },
      },
    },
    stars = {
      lines = {
        { id = "stars_1", text = "I can't even see them, friend, and nor can anyone else in Duskwood, which is the point I keep making. Grandmother says she doesn't need the sky clear to read it, and Viktori Prism'Antras looks through a telescope at clouds and agrees with her." },
      },
      choices = {
        { text = "And is she right?", next = "right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    right = {
      lines = {
        { id = "right_1", text = "More often than I can explain, which is why I keep my doubts for the shop. She told the Commander about the thing from the cemetery road a week before it came, and nobody's asked me my opinion of astrology since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sews = {
      lines = {
        { id = "sews_1", text = "Everyone, because nothing new comes in and what there is has to last. Sheri and Danielle Zipstitch do the fine work, and I sell to them and to every household that's patching a cloak for the third winter." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    frightens = {
      big = true,
      lines = {
        { id = "frightens_1", text = "She does, and she knows it, and I think she'd rather she didn't. But she sees what's coming for this town before anyone, and people have never been kind to whoever brings that sort of news." },
      },
      choices = {
        { text = "She warns them. They should be grateful for it.", next = "BACK", reply = "I'll tell her you said so. It will mean more than you'd think.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "People fear what they should. Nobody ought to know such things.", next = "BACK", reply = "Perhaps not. But she can't unknow them, and I'd not ask her to keep quiet.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = {
        { id = "best_1", text = "Coarse thread and grey dye, because folk here mend more than they make and nobody wants to be seen from the trees. I keep a little silk for travellers, and it's the only colour in the shop." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    helped = {
      lines = {
        { id = "helped_1", text = "So she told me, and she doesn't often speak well of anyone under sixty. Whatever she saw afterwards kept her up three nights, so I hope it was worth your trouble and hers." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    alyssa = {
      lines = {
        { id = "alyssa_1", text = "She has the reagent counter, and a sharper head for trade than I have. She believes in Grandmother's stars about half the time, which makes her the family's moderate, and she's the only one who can get the old lady to eat." },
        { id = "alyssa_2", when = { class = { "MAGE", "WARLOCK", "PRIEST" } }, text = "She has the reagent counter, so you'll have met her or you soon will. She'll sell you what your spells need and ask no questions, and she'll remember exactly what you bought." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    night_watch = { { id = "tp_y_night_watch", text = "Their cloaks are all mine, and all patched. I've offered them grey and they insist on Stormwind blue, so that they can be seen, the Commander says." } },
    worgen = { { id = "tp_y_worgen", text = "Grandmother won't say the word. For once I'm in full agreement with her." } },
    background = { { id = "tp_background", text = "An Eva, and the dull one. I was meant to learn the stars, and I learned bookkeeping, and the family's eaten better for it." } },
    rumors = { { id = "tp_rumors", text = "My sister says the reagent trade's doubled since the graves opened. I'd rather not think about who's buying." } },
    _none = { { id = "tp_none", text = "You'd want my grandmother for that, or my sister. I only know cloth." } },
  },
}

-- Bliztik: a goblin selling alchemy supplies out of an abandoned house in Raven Hill.
P:NPC {
  key = "bliztik", id = TODO_NPC("Bliztik"), name = "Bliztik", title = "Alchemy Supplies", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = {  }, temper = { "brazen", "quick" }, values = { "profit" },
  notices = { "craft", "purse" },
  impression = {
    first = "Bliztik sells vials and potions from an empty house in Raven Hill, with the dead walking past the windows. He calls it a prime location with no competition and very low rent.",
    third = "{name} met Bliztik, a goblin selling alchemy supplies in the ruins of Raven Hill.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "My favourite breathin' customer, back again, pal! Shut the door quick, and let's catch up before the neighbours shamble past." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you, pal. Vials are on the shelf, prices are on the vials, and conversation's extra, and you can't afford it." },
    { id = "g_y1", when = { profession = "Alchemy" }, text = "A fellow professional! Pal, wait till you see my Leaded Vials, they're the best you'll find anywhere the dead outnumber the living." },
    { id = "g_default", text = "Hey, hey, a live one! Step in, pal, shut the door behind ya, and let's talk vials before something outside hears the bell." },
    { id = "g_2", when = { metBefore = true }, text = "My favourite customer, on account of you're the one who keeps coming back breathing! What'll it be?" },
    { id = "g_3", when = { faction = "Horde" }, text = "Horde, Alliance, I don't check, friend, and nobody else for a mile is gonna check either. Coin's coin, so come on in." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, in Raven Hill! Pal, you are standing in the only shop between Darkshire and the sea that stocks a decent vial, so let's not pretend you've got options." },
    { id = "n_2", cat = "purse", when = { money = { min = 500000 } },
      text = "That is a heavy purse to be carrying through a graveyard, friend. Lighten it here, where it's safe, and I'll throw in my professional sympathy." },
  },
  start = "hello",
  nodes = {
    bli_kz1 = {
      lines = {
        { id = "bli_kz1_1", text = "Better spot, worse margins, pal, 'cause he's got a watcher breathing down his neck and a council sending him letters. Me, I've got no customers walking past, sure, but no letters either, and I'll take that deal every day of the week." },
      },
      choices = {
        { text = "Do you two get on?", next = "bli_kz2" },
        { text = "Something else, Bliztik.", next = "BACK" },
      },
    },
    bli_kz2 = {
      lines = {
        { id = "bli_kz2_1", text = "Like two cogs in one gear, friend, we turn opposite ways and the whole thing works. He moves the clockwork, I move the vials, and once a year we sit down and argue about who owes who for the crates, which is family for ya." },
      },
      choices = {
        { text = "Who owes who, then?", next = "bli_kz3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    bli_kz3 = {
      lines = {
        { id = "bli_kz3_1", text = "He owes me, obviously, sixty-two silver plus interest, but he'll tell you I owe him for a crate of flasks that went off the road near Raven Hill. I say the dead took it and he says the dead don't drink, and frankly we're both waitin' on an expert opinion." },
      },
      choices = {
        { text = "I'm staying out of that. Something else.", next = "BACK" },
      },
    },
    bli_wall1 = {
      lines = {
        { id = "bli_wall1_1", text = "Probably a ghoul, maybe a rat, possibly the wind, and I put a price on finding out that I'm not willing to pay. I've nailed three boards over the back window and I sell the nails too, if you're interested, at a very reasonable markup." },
      },
      choices = {
        { text = "Have you ever looked?", next = "bli_wall2" },
        { text = "I'll go and look for you.", next = "bli_wall2", when = { class = { "WARRIOR", "PALADIN", "ROGUE" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bli_wall2 = {
      lines = {
        { id = "bli_wall2_1", text = "Once, pal, just once, and there was a fella out there in a rotten tabard staring at the wall like it owed him money. I went back inside, I counted my stock, and I decided the back wall was outside my sphere of operations." },
      },
      choices = {
        { text = "A sound business decision. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", text = "Bliztik's the name, alchemy supplies, vials by the crate and a few potions on the side. The village moved out, I moved in, and the rent is nothing, pal, absolutely nothing, which you don't see every day in this business." },
        { id = "hello_2", when = { profession = "Herbalism" }, text = "Bliztik, alchemy supplies. You pick herbs, I can tell, and there's grave moss all over this village that nobody's picking, so think of me as the fella who sells you the vial to put the profit in." },
      },
      again = {
        { id = "hello_again1", text = "What else, pal? Time's money, and I'm on the clock even out here." },
        { id = "hello_again2", text = "Go on, go on, I'm listenin'." },
        { id = "hello_again3", text = "Ask quick, friend, something's scratching at the back wall again." },
      },
      choices = {
        { text = "Even out here, a trader's word should be good.", next = "BACK", reply = "Out here it's the only thing that is good, pal, 'cause the neighbours sure ain't. My word's my best stock, and I keep it polished.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the dead's belongings; they won't miss them.", next = "BACK", reply = "Whoa, whoa, I'm a vial man, not a grave robber, and the Watch would have my ears. Though I'll admit the overhead would be very low.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Why set up shop in Raven Hill, of all places?", next = "why" },
        { text = "Aren't you afraid of the dead out there?", next = "afraid" },
        { text = "You're profiting from a dead village.", next = "profit" },
        { text = "Who buys vials out here?", next = "who", when = { profession = "Alchemy" } },
        { text = "The necromancer's gone. Your neighbourhood may improve.", next = "fel", when = { questDone = TODO_QUEST("Morbent Fel") } },
        { text = "How do you get stock out here?", next = "stock" },
        { text = "Your cousin Kzixx has the better spot, on the Darkshire road.", next = "bli_kz1" },
        { text = "What's that scratching at the back wall?", next = "bli_wall1" },
        { text = "I'll be going.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "why_1", text = "Overhead, friend! No rent, no taxes, no council, no guild dues, and every adventurer who comes out here to fight the dead runs short of potions about a hundred yards from my door. I couldn't have planned it better, and I didn't, I just walked in." },
      },
      choices = {
        { text = "And Darkshire wouldn't have you?", next = "darkshire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkshire = {
      lines = {
        { id = "darkshire_1", text = "Darkshire's got a council, and a council's got fees, and they already gave my cousin Kzixx such a time he sells off a wagon on the road. So I said to myself, where's a town with no council, and here I am." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    afraid = {
      lines = {
        { id = "afraid_1", text = "Listen, the dead don't shop and they don't steal, so as neighbours go I've had worse in Booty Bay. I keep the door barred and the shutters nailed, and I've got a flask by the till that I throw first and price later." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    profit = {
      big = true,
      lines = {
        { id = "profit_1", text = "Sure I am, and so's the fella who sold you that sword. Somebody was gonna sell potions to the folks fighting out here, and it's me, and every one of 'em walks out of my door likelier to live, so you tell me who's getting cheated." },
      },
      choices = {
        { text = "Fair enough. You're doing more good here than harm.", next = "BACK", reply = "See, that's a customer with a head for the whole ledger.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You're a scavenger feeding on a grave.", next = "BACK", reply = "And you came in and bought nothing, pal, so I'll take the insult as free.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "who_1", text = "Adventurers, mostly, and now and then somebody in a hood who buys a great many vials and doesn't say what for. I don't ask, friend, because it's bad for business, and out here it might be bad for me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fel = {
      lines = {
        { id = "fel_1", text = "You got him? Well, that's good for the living, I guess, but half my trade was folks stocking up to go fight his dead, so I'll have to rethink my prices. Don't get me wrong, pal, I'm thrilled for ya." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = {
        { id = "stock_1", text = "My cousin Kzixx runs a wagon on the Darkshire road, and twice a month he sends a crate west with whoever's dumb enough, I mean brave enough, to carry it. I lose about one crate in four, which I've priced in, so don't look at me like that." },
        { id = "stock_2", when = { faction = "Horde" }, text = "Same as I get customers, friend, quietly. A crate comes up from Booty Bay by way of the Grom'gol road twice a month, and nobody on either side asks who it's for, which is the beauty of a town with no guards." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_y_worgen", text = "Not my department, pal. I've got the dead to the east and the dead to the west, and I'm not takin' on wolves as well." } },
    rumors = { { id = "tp_y_rumors", text = "Word is there's a hermit in a shack past the cemetery who buys odd parts and pays in gold. I'd go and pitch him myself if I wasn't so fond of my skin." } },
    background = { { id = "tp_background", text = "Steamwheedle born, Booty Bay raised, and here on what you'd call my own initiative. The Cartel doesn't know about this branch, and it don't need to." } },
    raven_hill = { { id = "tp_raven_hill", text = "Nice houses, good bones, very quiet. I mean the houses have good bones, pal, I don't want to discuss the other kind." } },
    advice = { { id = "tp_advice", text = "Buy two healing potions for every one you think you need. That's not a sales pitch, it's arithmetic, and also it's a sales pitch." } },
    _none = { { id = "tp_none", text = "Not my line, pal. If it don't go in a vial, I don't stock an opinion on it." } },
  },
}

-- Benjamin Carevin: the Carevin household's boy in Darkshire; wants to hunt and is not allowed past the lamps.
P:NPC {
  key = "benjamin_carevin", id = TODO_NPC("Benjamin Carevin"), name = "Benjamin Carevin", gender = "male",
  bible = "bibles/more_folk.md", role = "child", tier = "service",
  communities = { "darkshire" }, temper = { "bold", "restless" }, values = { "courage", "family" },
  notices = { "kit", "pet", "light" },
  impression = {
    first = "Benjamin Carevin is the boy of Darkshire's demon-hunting household and knows more about ghouls than most soldiers do. He is not allowed past the lamps, and he tells everyone exactly how unfair that is.",
    third = "{name} met Benjamin Carevin, the boy of the Carevin household in Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! I told everyone you'd come back, and they said I was making it up, so now I win. What did you kill?" },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'm not supposed to talk to strangers, and you're the strangest one I know, so there." },
    { id = "g_default", text = "Hello! Have you been out past the lamps? What did you see? Tell me all of it." },
    { id = "g_2", when = { metBefore = true }, text = "You're back! Did you kill anything since last time? How many?" },
    { id = "g_3", when = { timeOfDay = "night" }, text = "I'm supposed to be in bed, but nobody can sleep with the wolves going. Can you hear them?" },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Something bit your armour, and I'll bet it was a ghoul! Jonathan says a ghoul's bite goes bad by morning, so you should wash it." },
    { id = "n_2", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Is that yours? Does it bite the dead ones? Calor says a dog won't go near a ghoul, but that isn't a dog." },
    { id = "n_3", cat = "light", when = { class = { "PALADIN", "PRIEST" } },
      text = "You've got the Light! Jonathan says the Light is the only thing the dead are properly afraid of. Can you make it glow?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I'm Benjamin Carevin. My family hunts the dead things and the demons, out past the lamps where the Watch won't go. I'm going to hunt as well, when I'm big enough to draw the long crossbow, and that's nearly now." },
        { id = "hello_2", when = { class = "HUNTER" }, text = "I'm Benjamin Carevin, and you're a real hunter, aren't you? Mine are going to be demons, and yours are only animals, but I expect it's the same sort of thing." },
      },
      again = {
        { id = "hello_again1", text = "What else? Ask me about ghouls, I know lots." },
        { id = "hello_again2", text = "Go on, I'm not doing anything." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "What does your family hunt?", next = "hunt" },
        { text = "What do you know about ghouls?", next = "ghouls" },
        { text = "Who lives in your house?", next = "house" },
        { text = "It must be hard, staying behind.", next = "behind" },
        { text = "Children shouldn't be near any of this.", next = "near" },
        { text = "What's it like, growing up in Darkshire?", next = "darkshire" },
        { text = "Would the Light let you help?", next = "light", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "How would you track a worgen?", next = "worgen", when = { class = "HUNTER" } },
        { text = "Stay inside the lamps, Benjamin.", next = "END" },
      },
    },
    hunt = {
      lines = {
        { id = "hunt_1", text = "Skeletons and ghouls from the graveyard, and the worgen in the black woods. Once there was a thing with wings that Jonathan won't talk about. He came back with his sleeve burned off, and Elaine didn't shout, and that's how I knew it was bad." },
      },
      choices = {
        { text = "Does Elaine usually shout?", next = "elaine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elaine = {
      lines = {
        { id = "elaine_1", text = "Only when it's small. If you come home with mud on the floor, she shouts. If you come home with blood on you, she goes very quiet and boils water. I'd rather be shouted at." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ghouls = {
      lines = {
        { id = "ghouls_1", text = "They're faster than skeletons, and they dig. You don't let one scratch you. They come up near Raven Hill, mostly, and they don't like fire, but they don't stop for it either. Calor says you aim for the neck." },
      },
      choices = {
        { text = "Who taught you all that?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught = {
      lines = {
        { id = "taught_1", text = "Nobody did. They talk at supper and think I'm not listening. I've got it all written down in a book under my bed, with drawings. The ghoul drawing is the best one, and I'm not allowed to show it at table." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    house = {
      lines = {
        { id = "house_1", text = "Jonathan, who's in charge, and Elaine, and Calor, who used to be in the Watch and is the nicest. There's Scott too, but he only picks mushrooms. He says somebody in the family ought to do something without a crossbow." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    behind = {
      lines = {
        { id = "behind_1", text = "It's the worst thing there is. They go out at dusk and I have to sit with the lamp and count. I count to a thousand, and then I start again. They've always come back before I've done it three times." },
      },
      choices = {
        { text = "And if they didn't come back?", next = "didnt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    didnt = {
      lines = {
        { id = "didnt_1", text = "Then I'd go and get them. I know where the spare crossbow is, and I've got my book. I haven't told anyone that, so you mustn't either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    near = {
      big = true,
      lines = {
        { id = "near_1", text = "Where else would I be? There isn't anywhere in Duskwood that's not near it. The little ones in town all know to run for the inn when the bell goes. I'd rather know about ghouls than not know and meet one." },
      },
      choices = {
        { text = "Knowing the danger is the best protection there is.", next = "BACK", reply = "That's what I said! I'm going to tell Elaine a grown-up agreed with me.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You should be sent somewhere safe, away from all this.", next = "BACK", reply = "I won't go. They'd have nobody to count for them, and I'd not know if they came home.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkshire = {
      lines = {
        { id = "darkshire_1", text = "It's always dark, so you can play hide and seek at noon. You mustn't hide past the last lamp, though, that's the rule. The Watch give me the stubs of their torches, and Watcher Hartin taught me a prayer for when the wolves start." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    light = {
      lines = {
        { id = "light_1", text = "Would it? Jonathan says you don't choose the Light, it chooses you, and it hasn't said anything to me yet. I've asked it. Maybe it's waiting till I can draw the crossbow as well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    worgen = {
      lines = {
        { id = "worgen_1", text = "You don't. Calor says they track you. You have to put your back to something and wait, and not look at the eyes. Is that right? You'd know, and they never tell me if I've got it right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "Watcher Fraizer said the Commander sent a letter to Stormwind and it came back unopened. I heard him. He said a rude word after." } },
    background = { { id = "tp_background", text = "I've always lived here. I can't remember it being light, but Elaine says it was once, and there were apples." } },
    advice = { { id = "tp_advice", text = "If the bell rings, you run to the inn. Don't stop to see what it is, because that's how Tom's dog got eaten." } },
    _none = { { id = "tp_none", text = "I don't know that one. Is it a monster? I could look in my book." } },
  },
}

-- Whit Wantmal: keeps to his house beside the gryphon roost in Darkshire; writes verses nobody has asked for.
P:NPC {
  key = "whit_wantmal", id = TODO_NPC("Whit Wantmal"), name = "Whit Wantmal", gender = "male",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "darkshire" }, temper = { "wistful", "bookish" }, values = { "words", "home" },
  notices = { "travel", "arcane", "light" },
  impression = {
    first = "Whit Wantmal lives in the house beside Darkshire's gryphon roost and writes verses about the town that nobody has asked for. He is wistful and bookish, and he will not leave Duskwood, though he can give no good reason.",
    third = "{name} met Whit Wantmal, a householder and writer of verses in Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You've come back to us, and I've a verse half written about it, though I'll spare you the reading. Sit, if you like." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ah, you again. I had meant to write you a verse, but the right word for you hasn't come, and I've stopped looking for it." },
    { id = "g_default", text = "Good evening. It's always evening here, so I've stopped looking out of the window before I say it." },
    { id = "g_2", when = { metBefore = true }, text = "You've come back to us. People do, I've noticed, though they can never say why." },
    { id = "g_3", when = { timeOfDay = "night" }, text = "A true night, this one. You can tell by the gryphons, who go quiet when the dark is real." },
  },
  notice = {
    { id = "n_1", cat = "travel", when = { minLevel = 30 },
      text = "You've come a long way to stand in the dark with us. I should like to hear what the sky looks like where you were last." },
    { id = "n_2", cat = "arcane", when = { class = "MAGE" },
      text = "You've a scholar's ink on your fingers. Then you'll not laugh at a man who keeps notebooks." },
    { id = "n_3", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "You carry the Light. It shows more here than it would in Stormwind, the way a candle does in a cellar." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Whit Wantmal. That's my house, by the gryphon roost, and Felicia Maline's birds are my nearest neighbours. I write a little. It's verses, mostly, about the town. Nobody's asked me for them, and I can't seem to stop." },
      },
      again = {
        { id = "hello_again1", text = "Was there something more?" },
        { id = "hello_again2", text = "Go on. I've nowhere to be, and neither has the evening." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "What do you write about?", next = "write" },
        { text = "What's it like, living beside the gryphons?", next = "gryphons" },
        { text = "Why do you stay in Duskwood?", next = "stay" },
        { text = "Tell me about your neighbours.", next = "neighbours" },
        { text = "Verses are no use against the dead.", next = "use" },
        { text = "What was Darkshire like before the dark?", next = "before" },
        { text = "Let me hear a line of yours.", next = "line", when = { disposition = { min = 55 } } },
        { text = "I left a home behind as well.", next = "home", when = { origin = "human_lordaeron_refugee" } },
        { text = "Good evening, Whit.", next = "END" },
      },
    },
    write = {
      lines = {
        { id = "write_1", text = "I write about the lamps, and the Watch walking between them, and the sound a town makes when everyone in it is listening. I've a long piece about the name. It was Grand Hamlet once, you know, and nobody voted to change it. People only stopped saying the old one." },
      },
      choices = {
        { text = "Why did they stop?", next = "name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "name_1", text = "Because it wasn't true any longer. You can't stand in this square and say \"Grand Hamlet\" without your voice going wrong. \"Darkshire\" was a joke at first, I think, and then it was only what we were." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gryphons = {
      lines = {
        { id = "gryphons_1", text = "They smell, and they scream at dawn, such as dawn is. I'd not be without them. When they settle I know the night's ordinary. When they won't settle, I bar the door and trim the lamp, and I've not been wrong yet." },
      },
      choices = {
        { text = "What unsettles them?", next = "unsettle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    unsettle = {
      lines = {
        { id = "unsettle_1", text = "Felicia says it's whatever comes up the road from Raven Hill. The birds look west and stamp. One night last autumn they wouldn't stop, and in the morning the Watch were scrubbing the square, and nobody would tell me what they'd found." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = {
        { id = "stay_1", text = "I've asked myself that often. I've a cousin in Stormwind who writes every season to say there's a room. I pack a bag, and then the lamps come on, and the Watch call the hour, and I find I've unpacked it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = {
        { id = "neighbours_1", text = "There's Felicia, who's braver than she lets on. The gnomes have the house on the path, and they argue about lenses until all hours. Madame Eva reads the stars and frightens me a little, and Clerk Daltry at the hall has lent me paper when I'd none." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    use = {
      big = true,
      lines = {
        { id = "use_1", text = "No, they're not. I've no arm for a sword, and I faint at blood. But somebody ought to set down that we were here, and that we lit the lamps every night. If the town falls, I'd like there to be a page that says how it stood." },
      },
      choices = {
        { text = "A town that's remembered isn't wholly lost.", next = "BACK", reply = "That's the whole of why I write, and you've said it better than I have in forty pages.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Put down the pen and carry a lamp for the Watch.", next = "BACK", reply = "I did ask, once. Commander Ebonlocke looked at my hands and told me to keep writing, and she was kind about it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "before_1", text = "It was green, and there were orchards on the south road. The children swam at the bridge. I was young, and I thought it dull. I've written that down as well, as a warning to anyone who thinks their own town dull." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    line = {
      lines = {
        { id = "line_1", text = "Very well, then. \"They count the lamps at dusk, and count again, and call it morning when the count's the same.\" That's all of it that's any good. The rest is still looking for its feet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "home_1", text = "Then you know what it is for a place to change its name while you're still in it. I'm sorry. You may sit on my step whenever you like, and I'll not ask you to talk about it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "They say the old tower in the south has a light in it again. I've not written that down, for I've a feeling it would know." } },
    background = { { id = "tp_background", text = "I was born in Grand Hamlet and I live in Darkshire, and I've never moved house. I was to be a clerk, and I have a little money from my mother." } },
    advice = { { id = "tp_advice", text = "Write down what your town is like on an ordinary day. You'll want it later, and so will somebody else." } },
    darkshire = { { id = "tp_darkshire", text = "It's home. I've tried other words for it, and that's the one that stays." } },
    _none = { { id = "tp_none", text = "I don't know. I could make something up, but you'd be able to tell." } },
  },
}

-- Cog Glitzspinner: gnome inventor in Darkshire; drew the plans for Viktori's star-glass and argues lenses with Finbus and Herble.
P:NPC {
  key = "cog_glitzspinner", id = TODO_NPC("Cog Glitzspinner"), name = "Cog Glitzspinner", gender = "male",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "darkshire" }, temper = { "enthusiastic", "exacting" }, values = { "invention", "friendship" },
  notices = { "gnome", "craft", "arcane" },
  impression = {
    first = "Cog Glitzspinner is a gnome inventor who has settled in a Darkshire house with two others of his kind and argues with them about lenses all day. He drew the plans for Viktori Prism'Antras's star-glass and worries about every joint in it.",
    third = "{name} met Cog Glitzspinner, a gnome inventor living in Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! Excellent, I need a sensible witness, and you're the most sensible person who's ever walked into this argument." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, you. Please don't take a side today, because you'd pick the wrong one and I'd have to explain why at great length." },
    { id = "g_default", text = "Hello, hello! You've walked in on a disagreement about focal lengths. It's entirely amicable, and I'm entirely right." },
    { id = "g_2", when = { metBefore = true }, text = "You're back! Good, you can settle something. No, wait, you'll side with Finbus, people do." },
    { id = "g_3", when = { race = "Gnome" }, text = "A gnome, in Duskwood! Sit down, sit down, and Herble, look, there's four of us now, that's a quorum!" },
  },
  notice = {
    { id = "n_1", cat = "gnome", when = { race = "Gnome" },
      text = "You've got calluses from a number-three spanner. That's the Gnomeregan issue, isn't it? I'd know that grip anywhere." },
    { id = "n_2", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Tell me honestly, can you turn a bronze tube that's true along its whole length? Because the smith here can't, and he won't admit it." },
    { id = "n_3", cat = "arcane", when = { class = "MAGE" },
      text = "A mage! You people see far things with a scrying bowl. I'm trying to do it with glass and arithmetic, and I'd like you to know that mine doesn't need a bowl." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Cog Glitzspinner! Finbus Geargrind and Herble Baubbletump share the house, and Herble sells parts from the front of it. I draw plans. My best set at present is for a friend up the hill, Viktori, who wants a device for looking at the stars." },
      },
      again = {
        { id = "hello_again1", text = "What else? I've got the drawings right here if you want to see." },
        { id = "hello_again2", text = "Go on, I can argue with Finbus later." },
        { id = "hello_again3", text = "Yes, yes?" },
      },
      choices = {
        { text = "Tell me about the star-glass.", next = "glass" },
        { text = "Why would gnomes settle in Darkshire?", next = "why" },
        { text = "What are you three arguing about?", next = "argue" },
        { text = "How do you know Viktori?", next = "viktori" },
        { text = "Stargazing is a strange hobby for a cursed town.", next = "hobby" },
        { text = "What's the hard part of the design?", next = "hard", when = { profession = "Engineering" } },
        { text = "Did you get out of Gnomeregan?", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "I've seen Viktori's work. It's coming along.", next = "progress", when = { heardLine = "viktori.d_default" } },
        { text = "Good day, Cog.", next = "END" },
      },
    },
    glass = {
      lines = {
        { id = "glass_1", text = "There are two lenses in a long tube, a large one to gather the light and a small one to look through. That's simple, on paper. But the tube must be dead straight and the lenses ground to a curve I can only describe with an equation. Viktori is doing it by hand, bless him." },
      },
      choices = {
        { text = "Will it work?", next = "work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "work_1", text = "The arithmetic works. Whether a human stargazer and a village smith can build to my tolerances is another matter. I've revised the mount six times so it'll forgive a little wobble. Forgiving wobble goes against everything I believe in." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "why_1", text = "It's quiet, and it's cheap. Nobody here has ever told me a thing was impossible, because they've seen worse than impossible walk up the road. And the dark is excellent for testing lamps. Finbus has a lamp that I can't discuss until the patent's sorted." },
      },
      choices = {
        { text = "Aren't you afraid here?", next = "afraid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    afraid = {
      lines = {
        { id = "afraid_1", text = "Constantly! But I was afraid in Ironforge as well, of the rent. Here the Watch walks past twice an hour, and Herble has rigged the door. I'd rather not say what it does. It only did it to the postman once." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    argue = {
      lines = {
        { id = "argue_1", text = "Finbus says you grind the lens first and build the tube to suit it. I say you build the tube and grind to suit. Herble says we should buy a lens from a goblin. That's heresy, and it's also the only one of the three we could do by Friday." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    viktori = {
      lines = {
        { id = "viktori_1", text = "He wrote to me. A man who draws star-charts wrote to an engineer he'd never met and asked if the sky could be brought closer. I've had commissions from kings' quartermasters that didn't please me half so much. I promised him I'd help, and a Glitzspinner delivers." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hobby = {
      big = true,
      lines = {
        { id = "hobby_1", text = "Is it? I'd have thought it was the most sensible thing in the county. Everybody here spends their nights watching the ground for what's coming out of it. Viktori's the one man who's looking up. I think a town needs someone doing that." },
      },
      choices = {
        { text = "Looking up is how people get through the dark.", next = "BACK", reply = "Exactly! I'm putting that on the drawings, in the margin, where Finbus will see it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Clever minds should be building the Watch better weapons.", next = "BACK", reply = "We've done that as well. Ask the Commander who made her new lamp-brackets. I didn't want all my thinking to be about killing, though.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard = {
      lines = {
        { id = "hard_1", text = "The mount is the hard part. The stars move, or we do, and the tube must follow them smoothly without a shake. I've designed a worm gear with a hundred and forty-four teeth, and there isn't a file in Duskwood fine enough to cut it. If you know of one, I'll owe you a very boring favour." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomeregan = {
      lines = {
        { id = "gnomeregan_1", text = "I was in Ironforge delivering a paper when it happened, so I got out by not being in. I don't know how to feel about that. The paper was on ventilation, and I've never been able to look at it since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    progress = {
      lines = {
        { id = "progress_1", text = "Is it? Is the tube true? No, don't tell me, he'll show me at the next step, and he does so like to show me. I tell him I'm impressed, and I am. He hasn't worked out that I'm frightened for it as well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "The Watch say there's a hermit past the cemetery who buys odd parts. I sent him a price list by way of the goblin, and I got back a note that said only \"larger\"." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "We'll go home. I've a drawing for a better air-pump, for when we do, and I don't show it to people." } },
    background = { { id = "tp_background", text = "Journeyman of the Gnomeregan drafting halls, and then a lodger in Ironforge. Now I own a third of a house in the darkest town in the kingdom." } },
    advice = { { id = "tp_advice", text = "Draw it before you build it. Then draw it again, assuming whoever builds it is tired." } },
    _none = { { id = "tp_none", text = "I've no figures on that. I don't speculate without figures, or I try not to." } },
  },
}
