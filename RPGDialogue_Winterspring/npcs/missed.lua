-- Winterspring folk an earlier pass missed. Everlook: Blixxrak and Nixxrak the armour merchants, Xizzer
-- Fizzbolt, Gogo and Jack Sterling. Starfall Village: Lyranne Feathersong and Syurana. The snows: Chal
-- Fairwind, Sar Browneye, Rilan Howard, and the imp Vi'el in Darkwhisper Gorge. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Gogo: a goblin woman in Everlook.
P:NPC {
  key = "gogo", id = TODO_NPC("Gogo"), name = "Gogo", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "everlook" }, temper = { "cheerful", "smooth" }, values = { "friendly", "cunning" },
  notices = { "purse" },
  impression = {
    first = "Gogo is a goblin who idles about Everlook in a coat too fine for the weather and knows everybody's business in town. She laughed at most of what I said, and I am not sure all of it was meant to be funny.",
    third = "{name} met Gogo, a goblin woman with an ear for gossip in Everlook.",
  },
  greetings = {
    { id = "g_default", text = "Well, hello there, sweetheart! You look half frozen and all the way lost, and I just love a new face in town." },
    { id = "g_back", when = { metBefore = true }, text = "Look who's back! I was just tellin' somebody about you, and don't worry, it was mostly nice." },
  },
  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Oh, one of us, and not from around here! Sit down, hon, and tell me what they're wearin' in the south these days." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Gogo, and I don't sell a thing, which makes me the only honest goblin in Everlook. I keep folks company, I hear what's goin' on, and I pass it along to whoever asks nice." } },
      again = {
        { id = "h_again", text = "What else, sweetheart? I got all day." },
        { id = "h_again2", text = "Ooh, go on, ask me another." },
      },
      choices = {
        { text = "So what's going on in Everlook?", next = "news" },
        { text = "How do you make a living, then?", next = "living" },
        { text = "You have an admirer, I hear.", next = "kezzig" },
        { text = "What's the biggest secret in Everlook?", next = "ysecret" },
        { text = "Who do you like best in town?", next = "ylike" },
        { text = "Do the Horde and Alliance get along here?", next = "yboth" },
        { text = "Got any gossip for a fellow goblin?", next = "ygob", when = { race = "Goblin" } },
        { text = "Keep warm, Gogo.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "The furbolgs on the road have gone mean, the yetis are worse, and Vizzie at the inn has raised her prices and blames the furbolgs. Oh, and somebody's been scarin' the daylights out of folks with a clockwork yeti, which is the best thing to happen here all winter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    living = {
      lines = { { id = "l_default", text = "Friends, hon, I got a lot of generous friends. A girl who's good company never pays for her own dinner in a town where everybody else is countin' coppers and starin' at the snow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kezzig = {
      lines = { { id = "k_default", text = "You mean Kezzig Klackwhistle, and he's just a friend who likes to stop and chat. He's meant to be courtin' Lunnix at the mining shop, so if he spends a little long over here, well, I ain't the one who ought to be watchin' the clock." } },
      choices = {
        { text = "Lunnix won't like that.", next = "lunnix" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lunnix = {
      lines = { { id = "lx_default", text = "Lunnix has a pickaxe and a temper, and I'm fond of my head where it is. So let's say you never saw him here and I never said a word, and everybody in Everlook stays friends." } },
      choices = { { text = "I saw nothing. Something else.", next = "BACK" } },
    },
    ysecret = {
      lines = {
        { id = "yysecret_d", text = "If I told you, it wouldn't be a secret, would it, sugar? I'll give you a little one for free. Somebody in town's been selling Timbermaw beads to the Deadwood furbolgs. Guess who." },
      },
      choices = {
        { text = "Tell the Timbermaw. They deserve to know.", next = "BACK", reply = "Oh, you're a do-gooder! Fine, but don't tell them you heard it from me.", fx = { align = { honor = 1 } } },
        { text = "Keep it quiet. That's how you stay alive here.", next = "BACK", reply = "Now you sound like a local. I knew there was a goblin in you somewhere.", fx = { align = { honor = -1 } } },
      },
    },
    ylike = {
      lines = {
        { id = "yylike_d", text = "Lunnix, because she's honest, and Kezzig, because he's not. You need both kinds in a town, or it gets dull. Honest folk keep you warm, and liars keep you sharp." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yboth = {
      lines = {
        { id = "yyboth_d", text = "Inside the walls, sure, because the bruisers'll put you in the snow if you start trouble. Outside, everyone's on their own. I've seen an orc and a night elf drink together in the inn and then try to kill each other at dawn." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ygob = {
      lines = {
        { id = "yygob_v0", when = { race = "Goblin" }, text = "For you, cousin, a discount. Rumour is the Cartel's sending an auditor up here, and half the shopkeepers in Everlook are sweating ice." },
        { id = "yygob_d", text = "Sugar, I've got gossip about everyone from here to Gadgetzan. For you, a discount. Rumour is the Cartel's sending someone to audit Everlook, and half the shopkeepers are sweating ice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lunnix = { { id = "ytp_lunnix", text = "Lunnix sells mining gear and doesn't gossip. I think it's a waste of a good counter." } },
    everlook = { { id = "ytp_everlook", text = "Everlook's the warmest cold town in the world. Lots of gossip, lots of fur." } },
    timbermaw = { { id = "ytp_timbermaw", text = "The Timbermaw furbolgs are friendly, if you're friendly first. I've never tried." } },
    background = { { id = "tp_bg", text = "I came up to Everlook with a friend and stayed for the company. The weather sure wasn't the draw." } },
    _none = { { id = "tp_none", text = "Ooh, that one I ain't heard yet. Come back in a day or two, hon, I'll know by then." } },
  },
}

-- Jack Sterling: a human in Everlook.
P:NPC {
  key = "jack_sterling", id = TODO_NPC("Jack Sterling"), name = "Jack Sterling", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "everlook" }, temper = { "jovial", "wry" }, values = { "friendly", "practical" },
  notices = { "drink" },
  impression = {
    first = "Jack Sterling is a human who has settled into Everlook as though it were a seaside tavern with the wrong weather. He seems to be waiting out the winter, which in Winterspring is a long wait.",
    third = "{name} met Jack Sterling, a human passing a very long winter in Everlook.",
  },
  greetings = {
    { id = "g_default", text = "Pull up to the fire, {class}. Nobody in Everlook is in a hurry, since there's nowhere to hurry to that isn't under snow." },
    { id = "g_back", when = { metBefore = true }, text = "Still in Winterspring, are you? It gets hold of a person, though I couldn't tell you why." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've found the cure for the cold, I see. Go easy on it, friend, because the snow outside is a hard bed for a man who can't find the door." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Another human, this far north of anywhere! Tell me you've news from the Eastern Kingdoms, and I'll forgive you if it's old." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Jack Sterling. I came to Everlook on a goblin's promise that there was money to be made up here, and there is, only it all seems to be made by goblins." } },
      again = {
        { id = "h_again", text = "What else is on your mind?" },
        { id = "h_again2", text = "Go on, the fire's not going anywhere and neither am I." },
      },
      choices = {
        { text = "What money did the goblin promise?", next = "money" },
        { text = "Why not go home?", next = "home" },
        { text = "What's Everlook like to live in?", next = "town" },
        { text = "Who was the goblin who promised you money?", next = "ygob" },
        { text = "Do you have family back home?", next = "yfam" },
        { text = "What do you do with your days?", next = "ydays" },
        { text = "A fellow human so far north. Where are you from?", next = "yfrom", when = { race = "Human" } },
        { text = "Stay warm, Jack.", next = "END" },
      },
    },
    money = {
      lines = { { id = "m_default", text = "Furs, thorium and rare herbs, all lying about for anyone with a strong back. What he left out was that the furs are still on the bears, the thorium is under the yetis, and the herbs grow where the furbolgs have gone mad." } },
      choices = {
        { text = "So you never made your fortune.", next = "fortune" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fortune = {
      lines = { { id = "f_default", text = "I made enough to pay Vizzie for the room, and I've counted that a victory. A man learns his measure in a place like this, and mine turned out to be a warm chair and a modest tab." } },
      choices = { { text = "There are worse measures. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    home = {
      lines = { { id = "ho_default", text = "It's a long road back through Felwood, and I liked that forest even less than I like the snow. I tell myself I'll go in the spring, though nobody here has been able to tell me when that is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    town = {
      lines = { { id = "t_default", text = "It's the only place I've lived where an orc, a dwarf and a dead man will stand in the same queue for stew without a word said. The goblins' bruisers see to the peace, and the cold sees to the rest, since nobody wants to be thrown out into it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ygob = {
      lines = {
        { id = "yygob_d", text = "A fellow in Booty Bay called Grizzle, who said Everlook was the next Gadgetzan and I'd be in on the ground floor. The ground floor turned out to be snow, and Grizzle turned out to be gone." },
      },
      choices = {
        { text = "Find him and make him pay.", next = "BACK", reply = "I'd like to. But I'd have to get warm first.", fx = { align = { order = -1 } } },
        { text = "Let it go. You chose to believe him.", next = "BACK", reply = "True enough. I was a fool, and a cold one.", fx = { align = { order = 1 } } },
      },
    },
    yfam = {
      lines = {
        { id = "yyfam_d", text = "A sister in Lakeshire who writes me letters full of disapproval. She was right, of course. She usually is, which is the most annoying thing about her." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ydays = {
      lines = {
        { id = "yydays_d", text = "I drink, I play cards with the bruisers, and I watch the Timbermaw traders come down from the hills. Some days I help Lunnix count furs, and she pays me in soup." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfrom = {
      lines = {
        { id = "yyfrom_d", text = "Lakeshire, in Redridge, where the worst cold is a wet spring. If you're headed back south, tell the Lakeshire inn I said hello, and that I'm still alive, more or less." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    everlook = { { id = "ytp_everlook", text = "Everlook's a goblin town with a goblin's prices. The ale is good, at least." } },
    lakeshire = { { id = "ytp_lakeshire", text = "Lakeshire's a pretty town on a lake. I'd give my boots to be there now." } },
    booty_bay = { { id = "ytp_booty_bay", text = "Booty Bay's where I made my first mistake. It's a good place for mistakes." } },
    background = { { id = "tp_bg", text = "I'm a southerner who came north after easy money, and found it wasn't easy and wasn't much." } },
    _none = { { id = "tp_none", text = "You've got me there. Ask one of the goblins; they'll know, and they'll charge you." } },
  },
}

-- Chal Fairwind: Wintersaber Trainers, the small camp in north-eastern Winterspring near Umbranse's house.
P:NPC {
  key = "chal_fairwind", id = TODO_NPC("Chal Fairwind"), name = "Chal Fairwind", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "calm", "watchful" }, values = { "nature", "patient" },
  notices = { "pet" },
  impression = {
    first = "Chal Fairwind of the Wintersaber Trainers keeps a small camp in the hills north-east of Everlook, close by the Spiritspeaker's house. She watches the snow for sabers and says very little about why she is posted so far from Frostsaber Rock.",
    third = "{name} met Chal Fairwind of the Wintersaber Trainers, camped in the north-eastern hills of Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "Tread quietly, {class}. There is a frostsaber on the ridge above us, and she has not yet decided what she thinks of you." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the sabers did not trouble you on the way. That speaks well of you." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = true },
      text = "{pet} walks at your heel without a leash, and watches where you watch. That is a true bond, hunter, and the trainers would respect it." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "The Horde has no friends among the Wintersaber Trainers. I will not raise a hand while you keep yours from the cats, but do not linger." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Chal Fairwind, of the Wintersaber Trainers. Rivern Frostwind keeps the Rock, where the sabers are raised, and I keep this side of the hills, where the wild ones come down to hunt." } },
      again = {
        { id = "h_again", text = "What more would you know?" },
        { id = "h_again2", text = "Ask softly, and I will answer." },
      },
      choices = {
        { text = "What do you watch for out here?", next = "watch" },
        { text = "Could you teach me to ride a frostsaber?", next = "ride" },
        { text = "A human lives in the house nearby.", next = "umbranse" },
        { text = "Why are you posted so far from the Rock?", next = "yfar" },
        { text = "Have you lost a saber to the wild?", next = "ylost" },
        { text = "What do you think of Everlook's goblins?", next = "ygob" },
        { text = "A daughter of Teldrassil, so far from home?", next = "yhome", when = { race = "NightElf" } },
        { text = "Elune watch your camp.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Which cats range where, which mothers have cubs, and who is taking pelts that are not theirs to take. The goblins' trappers know that we count, and most of them have learned to hunt bear instead." } },
      choices = {
        { text = "And those who haven't learned?", next = "poachers" },
        { text = "Another question.", next = "BACK" },
      },
    },
    poachers = {
      lines = { { id = "p_default", text = "The sabers usually teach them before I must. A frostsaber remembers a scent for years, and I have never yet had to bury a poacher that the cats did not find first." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    ride = {
      lines = { { id = "r_default", text = "That is not mine to grant. Go to Rivern Frostwind at Frostsaber Rock, north of here, and expect to labour a long while for the sabers before one of them will carry you." } },
      choices = { { text = "I'll seek Rivern out. Another question.", next = "BACK" } },
    },
    umbranse = {
      lines = { { id = "u_default", text = "Umbranse, who says he speaks with the dead. He keeps to his house and I keep to my fire, and the sabers give his door a wide berth, which tells me there is something to his claim." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    yfar = {
      lines = {
        { id = "yyfar_d", text = "Rivern says it is because I see well in snow-glare. I think it is because I argued with her about the young sabers, and she wanted me somewhere I could argue with the wind instead." },
      },
      choices = {
        { text = "What did you argue about?", next = "yargue" },
        { text = "Another question.", next = "BACK" },
      },
    },
    yargue = {
      lines = {
        { id = "yyargue_d", text = "Whether the cubs should be taken from the wild at all. Rivern says the Trainers keep the bloodlines strong. I say a saber raised on a rope forgets what snow is for. We are both a little right." },
      },
      choices = {
        { text = "The Trainers' way keeps the sabers safe. It's right.", next = "BACK", reply = "Perhaps. Rivern would be glad to hear it, and gladder that I did.", fx = { align = { order = 1 } } },
        { text = "Leave the cubs wild. The snow is their home.", next = "BACK", reply = "So I said. It is why I am out here, and not at the Rock.", fx = { align = { order = -1 } } },
      },
    },
    ylost = {
      lines = {
        { id = "yylost_d", text = "One, a young female called Ashmane, who heard the wild pack calling and followed them over the ridge. I did not stop her. I watch for her still, and twice I have seen tracks that might be hers." },
      },
      choices = {
        { text = "Another question.", next = "BACK" },
      },
    },
    ygob = {
      lines = {
        { id = "yygob_d", text = "They sell us rope and feed and pay in coin for every pelt the poachers bring, which I hate. Yet without Everlook the Trainers would have no supply road at all. Elune keeps strange company for us." },
      },
      choices = {
        { text = "Another question.", next = "BACK" },
      },
    },
    yhome = {
      lines = {
        { id = "yyhome_v0", when = { race = "NightElf" }, text = "I left before Teldrassil was finished, sister, and have not been back. The snow suits me. Here the stars are close enough to touch, as they were in the old forests." },
        { id = "yyhome_d", text = "I left Darnassus before the tree was finished, and I have not been back. The snow suits me better than the new city. Here the stars are close enough to touch." },
      },
      choices = {
        { text = "Another question.", next = "BACK" },
      },
    },
  },
  topics = {
    wintersaber_trainers = { { id = "ytp_wintersaber_trainers", text = "The Wintersaber Trainers raise the frostsabers on Frostsaber Rock. It is a slow, cold, honourable work." } },
    everlook = { { id = "ytp_everlook", text = "Everlook is loud and smells of oil. I go there only when I must." } },
    background = { { id = "tp_bg", text = "I have walked with the frostsabers since before these hills had a goblin town in them." } },
    _none = { { id = "tp_none", text = "The snow has not told me, and little else speaks out here." } },
  },
}

-- Sar Browneye: a tauren in northern Winterspring.
P:NPC {
  key = "sar_browneye", id = TODO_NPC("Sar Browneye"), name = "Sar Browneye", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "calm", "gentle" }, values = { "nature", "patient" },
  notices = { "race" },
  impression = {
    first = "Sar Browneye is a tauren who has made a camp in the northern snows of Winterspring, a long way from any grass. She watches the frostsabers hunt with a hunter's respect and has not once been heard to complain of the cold.",
    third = "{name} met Sar Browneye, a tauren hunter camped in northern Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "The winds bring you a long way north, {class}. Sit by the fire, for the Earth Mother sleeps very deeply under this snow and gives little warmth." },
    { id = "g_back", when = { metBefore = true }, text = "The snow has not kept you away. It is good to see a face I know." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the plains, here in the white country! Tell me that the grass still stands tall around Thunder Bluff, for I have begun to forget its colour." },
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "I have no quarrel with you, and the night elves on the Rock have left my fire alone. Let us both keep that peace." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Sar Browneye, of Thunder Bluff. I came north to see the great white cats that the night elves ride, because a hunter should know every beast the Earth Mother made, even the ones she hid in the snow." } },
      again = {
        { id = "h_again", text = "What else would you hear?" },
        { id = "h_again2", text = "Speak. The fire is patient, and so am I." },
      },
      choices = {
        { text = "What have you learned of the frostsabers?", next = "sabers" },
        { text = "This is hard country for a tauren.", next = "hard" },
        { text = "Who is the Forsaken who shares your camp?", next = "rilan" },
        { text = "Do you miss Mulgore?", next = "ymiss" },
        { text = "Have you hunted a frostsaber?", next = "yhunt" },
        { text = "What do you think of the night elves?", next = "yelves" },
        { text = "A tauren hunter should see this. Show me.", next = "yshow", when = { class = "HUNTER" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    sabers = {
      lines = { { id = "s_default", text = "They hunt as the plainstriders run, without wasting a step, and a mother will go hungry for days before her cubs do. I had thought to take a pelt home, and I find now that I would rather take the story." } },
      choices = {
        { text = "The night elves ride them. Could a tauren?", next = "ride" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    ride = {
      lines = { { id = "r_default", text = "No cat ever born could carry one of us far, and the elves would not allow the trying. They have earned the sabers' trust over more years than my tribe can count, and I will not take by cunning what they gained by patience." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    hard = {
      lines = { { id = "h_default2", text = "It is, and I miss the smell of rain on warm earth more than I can say. But the ancestors walked through worse than snow to find Mulgore, and I am only visiting." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    rilan = {
      lines = { { id = "ri_default", text = "Rilan Howard, of the Undercity. He does not feel the cold and I do not understand his purpose here, but he keeps the fire through the night while I sleep, and that is enough for travelling companions." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    ymiss = {
      lines = {
        { id = "yymiss_d", text = "Every morning, when I wake and there is no grass. But the Earth Mother made the snow too, and she asked me to see it. A hunter who only knows one land is a poor hunter." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhunt = {
      lines = {
        { id = "yyhunt_d", text = "No, and I will not. They are the night elves' sacred beasts, and I respect that, though the elves would gladly shoot me for watching. A hunter can learn more by watching than by killing." },
      },
      choices = {
        { text = "Respect their sacred beasts. Watching is enough.", next = "BACK", reply = "Yes. The Earth Mother smiles on that.", fx = { align = { light = 1 } } },
        { text = "A hunter should hunt. The beasts don't belong to anyone.", next = "BACK", reply = "Perhaps, but I would rather be welcome in these hills than right.", fx = { align = { light = -1 } } },
      },
    },
    yelves = {
      lines = {
        { id = "yyelves_d", text = "They are proud and fierce, and they love their land as we love ours. If they were not at war with the Horde, I think we would be friends. Perhaps we will be, one day." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yshow = {
      lines = {
        { id = "yyshow_v0", when = { race = "Tauren" }, text = "Then watch the ridge at dawn, child of the herds. The sabers come down to drink, and they move like falling snow. Only watch, and the Earth Mother will teach you." },
        { id = "yyshow_d", text = "Then watch the ridge at dawn. The sabers come down to drink at the hot springs, and they move like snow falling. Do not make a sound, and do not hunt. Only watch." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thunder_bluff = { { id = "ytp_thunder_bluff", text = "Thunder Bluff is home. I will go back when I have learned what the snow has to teach." } },
    rilan = { { id = "ytp_rilan", text = "The Forsaken is a strange friend. He does not breathe, and he does not complain, and that is restful." } },
    background = { { id = "tp_bg", text = "I am a hunter of Thunder Bluff, come to look upon beasts the plains never showed me." } },
    _none = { { id = "tp_none", text = "The wind has carried me no word of that. Perhaps they know in Everlook." } },
  },
}

-- Rilan Howard: a Forsaken in northern Winterspring.
P:NPC {
  key = "rilan_howard", id = TODO_NPC("Rilan Howard"), name = "Rilan Howard", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "dry", "cold" }, values = { "curious", "practical" },
  notices = { "race" },
  impression = {
    first = "Rilan Howard is a Forsaken standing in the northern snows of Winterspring with frost on his shoulders that he has not troubled to brush off. He says the cold preserves him nicely, and he watches the night elves' saber ground with a clerk's attention.",
    third = "{name} met Rilan Howard, a Forsaken keeping watch in northern Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "You're shivering, {class}. I'd offer sympathy, but I gave up feeling the cold some years ago, along with most other things." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the snow. You living do enjoy testing how much you can endure." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of ours, this far from the Undercity. You'll have noticed that nothing rots up here, which makes it the healthiest climate either of us is likely to find." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A night elf. You may tell your saber-keepers that I am only looking, and that I've no use at all for a cat." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Rilan Howard, late of Lordaeron and lately of the Undercity. I was sent to see what the night elves are about on that rock of theirs, and I have discovered that they are raising large cats, which I could have reported from a warmer distance." } },
      again = {
        { id = "h_again", text = "Was there more? I've nothing but time and ice." },
        { id = "h_again2", text = "Ask. It breaks up the watching." },
      },
      choices = {
        { text = "Who sent you?", next = "sent" },
        { text = "The cold doesn't trouble you at all?", next = "cold" },
        { text = "You travel with a tauren.", next = "sar" },
        { text = "What do you think of the night elves?", next = "yelves" },
        { text = "Do you remember your life before?", next = "ybefore" },
        { text = "Is it lonely, being Forsaken?", next = "ylonely" },
        { text = "I'm Forsaken too. How do you bear it?", next = "ybear", when = { race = "Scourge" } },
        { text = "I'll leave you to the snow.", next = "END" },
      },
    },
    sent = {
      lines = { { id = "s_default", text = "Someone in the Undercity who wished to know how the Alliance comes by its mounts, and whether the method might be borrowed. I shall tell them it requires several years of kindness, and I expect that to end the inquiry." } },
      choices = {
        { text = "The Forsaken can't manage kindness?", next = "kindness" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kindness = {
      lines = { { id = "k_default", text = "We can imitate it for an afternoon, as a rule. A frostsaber takes one sniff of a dead man and remembers urgent business elsewhere, and I find I can't fault the animal's judgment." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cold = {
      lines = { { id = "c_default", text = "It stiffens the joints a little in the mornings, and that is all. I'll confess there's a certain peace in a country where everything is as cold as I am." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sar = {
      lines = { { id = "sa_default", text = "Sar Browneye, who came for the cats and stays for reasons she calls reverence. She talks to the mountain and it doesn't answer, and she seems entirely content with the arrangement, which I envy more than I'd tell her." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yelves = {
      lines = {
        { id = "yyelves_d", text = "They are very old, very proud, and very fond of cats. They also hate me on sight, which is efficient of them. I admire their patience, if not their manners." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ybefore = {
      lines = {
        { id = "yybefore_d", text = "A clerk in Lordaeron's treasury, with a wife and a little garden. I remember the smell of ink and roses. I don't remember their faces, which is perhaps a mercy the Dark Lady arranged." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ylonely = {
      lines = {
        { id = "yylonely_d", text = "The tauren keeps me company, and she does not flinch, which is more than most living do. Some of my kind would say I've grown soft. Others would say I've remembered something worth keeping." },
      },
      choices = {
        { text = "Friendship is worth keeping, even dead.", next = "BACK", reply = "Yes. I suspect so too, though I'd never say it in the Undercity.", fx = { align = { light = 1 } } },
        { text = "The Forsaken stand alone. Trust nobody.", next = "BACK", reply = "That is the Dark Lady's teaching. It is also very cold advice.", fx = { align = { light = -1 } } },
      },
    },
    ybear = {
      lines = {
        { id = "yybear_v0", when = { race = "Scourge" }, text = "By keeping busy, and by not thinking about the before too often. You'll know that trick already, I suspect. The cold helps." },
        { id = "yybear_d", text = "By keeping busy, and by not thinking about the before too often. The cold helps. It numbs what little there is left to numb." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    undercity = { { id = "ytp_undercity", text = "The Undercity is warm and damp and full of plotting. I prefer the snow." } },
    frostsabers = { { id = "ytp_frostsabers", text = "Great white cats. They frighten me, and I am already dead." } },
    background = { { id = "tp_bg", text = "I kept accounts in Lordaeron before the plague. Now I keep them for the Undercity, on rather stranger subjects." } },
    _none = { { id = "tp_none", text = "I haven't been asked to look into that, and I don't volunteer." } },
  },
}

-- Vi'el: imp, Exotic Reagent Merchant, at the bottom of Darkwhisper Gorge.
P:NPC {
  key = "viel", id = TODO_NPC("Vi'el"), name = "Vi'el", title = "Exotic Reagent Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "sharp", "chatty" }, values = { "greedy", "cunning" },
  notices = { "warlock" },
  impression = {
    first = "At the bottom of Darkwhisper Gorge, past the demons, an imp called Vi'el keeps a shop of reagents I had never seen before. He was astonished that I had got in, and recovered quickly enough to try to sell me something.",
    third = "{name} met Vi'el, an imp who sells exotic reagents at the bottom of Darkwhisper Gorge in Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "What?! How did you get past the big fellow at the door? Oh, never mind, business has been dreadful, so come in and tell me which of your infernal needs I can meet." },
    { id = "g_back", when = { metBefore = true }, text = "You again, {name}! Yes, I know your name, I'm a demon, it's what we do, and I know your true one as well, so I'd buy something expensive." },
  },
  notice = {
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK" },
      text = "A warlock! Don't get ideas, I'm already spoken for, and my master's contract has very ugly penalty clauses for anyone who tries to poach the help." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Vi'el, exotic reagents, sole proprietor and, I regret to say, sole employee. I've got rods, runes and things in jars that would make your alchemist faint, and I can't stop myself buying whatever you put on the counter either, which is a curse I'd thank you not to abuse." } },
      again = {
        { id = "h_again", text = "Well? Buy, sell or ask, but do one of them!" },
        { id = "h_again2", text = "Yes, yes, what now?" },
      },
      choices = {
        { text = "Why is an imp keeping shop down here?", next = "why" },
        { text = "Who is your master?", next = "master" },
        { text = "Can you repair my armour?", next = "repair" },
        { text = "What would it cost to bind you instead?", next = "bind", when = { class = "WARLOCK" } },
        { text = "What's the strangest thing you sell?", next = "yodd" },
        { text = "Do the demons above trouble you?", next = "ydemons" },
        { text = "Would you leave if you could?", next = "yleave" },
        { text = "A warlock could use an imp like you.", next = "ylock", when = { class = "WARLOCK" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the stock keeps better near the gorge's own foulness, and because nobody robs a shop with a doomguard on the path. The drawback, which nobody thought of, is that nobody shops at one either." } },
      choices = {
        { text = "Who are your customers, then?", next = "customers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = { { id = "c_default", text = "Warlocks who want something they oughtn't to have, and the odd lunatic who fought his way down for the sport of it. You're the second kind, I'd guess, and I mean that as a compliment to your purse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    master = {
      lines = { { id = "m_default", text = "My warlock, and that's as much of a name as you're getting. Cause trouble in here and I'll call for him, and then we'll both be sorry, because he's in a foul mood whenever he's interrupted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    repair = {
      lines = { { id = "r_default", text = "Do I look like I own a hammer? Everlook's a mile or so north, and the goblins there will bang out your dents, so buy something from me first and then go and bother them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bind = {
      lines = { { id = "b_default", text = "Ooh, a new posting? It has been dull down here, and I shouldn't say that. No, no, forget I spoke, because the price would be a slice of your life, you'd never pay it, and my master reads my thoughts on alternate days." } },
      choices = { { text = "Keep your post, imp. Something else.", next = "BACK" } },
    },
    yodd = {
      lines = {
        { id = "yyodd_d", text = "A jar with a felhound's eyeball in it that still blinks when you say its name. I haven't sold it yet, mostly because nobody knows its name, and I'm not telling." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ydemons = {
      lines = {
        { id = "yydemons_d", text = "They trouble everyone. They're the Legion's leftovers, the ones who didn't get the message that the war is over. I keep the door locked and sell them nothing. Well, almost nothing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yleave = {
      lines = {
        { id = "yyleave_d", text = "Leave? And go where, a warlock's pocket? At least down here I'm my own master, mostly. Some imps dream of freedom, and some dream of a big master to serve. I dream of profit." },
      },
      choices = {
        { text = "Freedom is worth more than any master.", next = "BACK", reply = "Pfft. Says someone who's never been summoned by the ears.", fx = { align = { order = -1 } } },
        { text = "Every imp needs a master. You're no different.", next = "BACK", reply = "Oh, charming. Remind me to raise your prices.", fx = { align = { order = 1 } } },
      },
    },
    ylock = {
      lines = {
        { id = "yylock_v0", when = { class = "WARLOCK" }, text = "Oh, no, no, you put that soul shard away. I've got a shop to run. Summon your own imp, warlock, for this one is self-employed." },
        { id = "yylock_d", text = "Oh, no, no, no, you put that soul shard away right now. I've got a shop to run. If you want an imp, summon your own. I'm self-employed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    darkwhisper_gorge = { { id = "ytp_darkwhisper_gorge", text = "Darkwhisper Gorge is full of demons, ice and bad memories. Excellent location for a shop, really." } },
    burning_legion = { { id = "ytp_burning_legion", text = "The Legion lost. I didn't. That's all you need to know." } },
    background = { { id = "tp_bg", text = "Summoned, bound and put behind a counter. I've had worse masters, and far worse hours." } },
    _none = { { id = "tp_none", text = "I might know, and I might sell it to you, but not at the price you're thinking of." } },
  },
}
