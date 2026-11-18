-- Loch Modan folk the first passes missed, part 3: the Mountaineers of Algaz Station and the Wetlands
-- tunnels, and those of the Valley of Kings and the South Gate road. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Mountaineer Hammerfall: Algaz Station gate guard; stern, tired of jokes about his name.
P:NPC {
  key = "lm_mtn_hammerfall", id = TODO_NPC("Mountaineer Hammerfall"), name = "Mountaineer Hammerfall", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "stern", "proud" }, values = { "dutiful", "family" },
  notices = { "soldier", "race" },
  impression = {
    first = "Mountaineer Hammerfall holds the gate at Algaz Station and asks every traveller their business before they reach the tunnel. He shares a name with an orc outpost in Arathi and has heard every joke there is about it.",
    third = "{name} met Mountaineer Hammerfall, who guards the gate at Algaz Station.",
  },
  greetings = {
    { id = "g_default", text = "Hold there. This is Algaz Station, an' beyond it the road belongs tae the orcs as much as tae us, so tell me where ye're bound." },
    { id = "g_back", when = { metBefore = true }, text = "I know ye. Pass, an' mind yerself in the tunnels." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Before ye say it, human: aye, like the orc town in the Highlands, an' nae, we're no' related. My family had the name three hundred years before the orcs had a word for hammer." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Hammerfall, gate watch. Naebody goes north through Dun Algaz wi'out me seein' their face first, so that somebody can say who they were if they dinnae come back.", fx = { learn = { "dragonmaw" } } } },
      again = {
        { id = "h_again", text = "What else? The gate's no' goin' tae watch itself." },
        { id = "h_again2", text = "Speak." },
      },
      choices = {
        { text = "Do many fail to come back?", next = "fail" },
        { text = "Hammerfall. Like the place in Arathi?", next = "name" },
        { text = "I'm bound for the Wetlands.", next = "bound" },
        { text = "Carry on, Mountaineer.", next = "END" },
      },
    },
    fail = {
      lines = { { id = "f_default", text = "Fewer than ye'd fear an' more than I'd like. The Dragonmaw dinnae hold the road, but they hold the side tunnels, an' a traveller alone at dusk is a gift tae them." } },
      choices = {
        { text = "Why hasn't the garrison cleared them?", next = "clear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clear = {
      lines = { { id = "c_default", text = "Wi' five rifles an' a smith? Rockgar's asked Ironforge for a company every season since I was posted here, an' every season the company's needed somewhere worse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "n_default", text = "Like it, an' older than it, an' I'll thank ye tae remember which came first. The orcs named their camp for where their warchief fell, so I'm told, an' my forebears were named for the way they worked a forge." } },
      choices = { { text = "The better reason by far. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    bound = {
      lines = { { id = "b_default", text = "Then keep tae the main tunnel, carry a light, an' dinnae stop for anythin' that calls tae ye from a side passage. Menethil's at the far end o' the marsh road, an' ye'll want tae reach the bridges before night." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Hammerfall o' Dun Morogh, smiths an' soldiers both. I keep the gate here." } },
    dragonmaw = { { id = "tp_dm", text = "Orcs in the side tunnels o' Dun Algaz. Keep tae the main way an' keep movin'." } },
    _none = { { id = "tp_none", text = "That's no' gate business. Ask Rockgar." } },
  },
}

-- Mountaineer Luxst: Algaz Station; the garrison's marksman, quiet and exact.
P:NPC {
  key = "lm_mtn_luxst", id = TODO_NPC("Mountaineer Luxst"), name = "Mountaineer Luxst", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "quiet", "exact" }, values = { "craft", "patient" },
  notices = { "class" },
  impression = {
    first = "Mountaineer Luxst is the long rifle of Algaz Station, a still, narrow-eyed dwarf who measures distance while he listens. He says little and does not seem to blink as often as other people.",
    third = "{name} met Mountaineer Luxst, the marksman of Algaz Station.",
  },
  greetings = {
    { id = "g_default", text = "Ye were a hundred an' forty paces off when I first marked ye. Welcome tae Algaz Station." },
    { id = "g_back", when = { metBefore = true }, text = "I knew yer walk at two hundred paces this time. Welcome back." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye judge range wi' yer eyes half shut, the way it should be done. What d'ye reckon tae that dead pine on the ridge?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Luxst. The others guard the gate, an' I guard the ground in front of it, out as far as a ball will carry true." } },
      again = {
        { id = "h_again", text = "Aye? I'm listenin', though I'll no' look round." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "How far does a ball carry true?", next = "far" },
        { text = "What do you shoot at, out here?", next = "shoot" },
        { text = "I'd call that pine two hundred and ten paces.", next = "pine", when = { class = "HUNTER" } },
        { text = "Good shooting, Mountaineer.", next = "END" },
      },
    },
    far = {
      lines = { { id = "f_default", text = "For most o' the garrison, a hundred paces on a still day. For me, on this rifle, wi' my own powder, near three hundred, though I'd no' wager a life on anythin' past two-fifty." } },
      choices = {
        { text = "What makes the difference?", next = "diff" },
        { text = "Something else.", next = "BACK" },
      },
    },
    diff = {
      lines = { { id = "d_default", text = "Patience, mostly, an' weighin' every charge on a scale instead o' pourin' by eye. The wind in this pass turns twice between the gate an' the bend, an' it took me a year o' misses tae learn where." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shoot = {
      lines = { { id = "s_default", text = "Dragonmaw scouts, when they show a head over the rocks tae count us. I've never let one finish countin', which is why they still think there's more of us than there are.", fx = { learn = { "dragonmaw" } } } },
      choices = { { text = "A useful lie to keep alive. Something else.", next = "BACK" } },
    },
    pine = {
      lines = { { id = "p_default", text = "Two hundred an' eighteen, but ye're closer than Zwarn's ever got, an' he's stood beside it. Ye've the eye, {g:lad|lass}, an' it only wants practice." } },
      choices = { { text = "I'll take that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I shoot for the station. There's little else tae tell, an' I'd sooner no' tell it." } },
    dragonmaw = { { id = "tp_dm", text = "Their scouts come tae count us. I see tae it they lose their place." } },
    _none = { { id = "tp_none", text = "I dinnae know. It's out o' my range, ye might say." } },
  },
}

-- Mountaineer Morran: Algaz Station; counts what goes up the road to the front.
P:NPC {
  key = "lm_mtn_morran", id = TODO_NPC("Mountaineer Morran"), name = "Mountaineer Morran", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "brisk", "practical" }, values = { "order", "dutiful" },
  notices = { "purse", "travel" },
  impression = {
    first = "Mountaineer Morran keeps the tally at Algaz Station of every cart, crate and traveller that goes north. She has a quartermaster's eye and can tell at a glance what a pack is missing.",
    third = "{name} met Mountaineer Morran, who keeps the tally of the road at Algaz Station.",
  },
  greetings = {
    { id = "g_default", text = "One traveller, on foot, northbound or stayin'? I'll need tae know which for the tally." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're in my book already. I'll mark ye returned, an' glad tae." },
  },
  notice = {
    { id = "n_pack", cat = "travel", when = { maxLevel = 19 },
      text = "Yer pack's light for the Wetlands, friend. Ye'll want twice the water ye think, for there's plenty o' it in that marsh an' none ye'd dare drink." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Morran. I stand my watch like the rest, an' I keep the station's count besides, for somebody has tae know what went up that road an' what came back." } },
      again = {
        { id = "h_again", text = "What else? I've a column tae finish." },
        { id = "h_again2", text = "Aye, go on." },
      },
      choices = {
        { text = "What goes up the road these days?", next = "goes" },
        { text = "And what comes back?", next = "back" },
        { text = "Mark me down as passing through.", next = "END" },
      },
    },
    goes = {
      lines = { { id = "g_default2", text = "Powder, shot, salt meat an' bandage linen, bound for Menethil an' for Longbraid's dwarves at Dun Modr beyond it. There's more goin' north every month, an' I take that tae mean it's goin' badly up there.", fx = { learn = { "dark_iron" } } } },
      choices = {
        { text = "What's happening at Dun Modr?", next = "modr" },
        { text = "Something else.", next = "BACK" },
      },
    },
    modr = {
      lines = { { id = "m_default", text = "The Dark Irons took the town an' broke the Thandol Span, an' what's left o' the garrison is camped outside its own walls. I only know what the carters tell me, but I know what they ask for, an' it's never less than last time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    back = {
      lines = { { id = "b_default", text = "Empty carts, mostly, an' carters who've aged a year in a fortnight. Now an' then a cart doesnae come back at all, an' I leave the line open in the book a full month before I close it." } },
      choices = { { text = "That's a hard line to rule. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Mountaineer who can add, which makes me the station's clerk whether I like it or no'." } },
    dark_iron = { { id = "tp_di", text = "They've Dun Modr, by all accounts. I see it in what the north keeps askin' for." } },
    _none = { { id = "tp_none", text = "It's no' in my book, so I couldnae tell ye." } },
  },
}

-- Mountaineer Yuttha: Algaz Station; cheerful, the first friendly face after the Wetlands.
P:NPC {
  key = "lm_mtn_yuttha", id = TODO_NPC("Mountaineer Yuttha"), name = "Mountaineer Yuttha", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "cheerful", "homesick" }, values = { "kind", "dutiful" },
  notices = { "weary", "race" },
  impression = {
    first = "Mountaineer Yuttha greets travellers at Algaz Station as if each one were a cousin home from a long trip. She is the first friendly face on the road out of the Wetlands, and she takes the duty seriously.",
    third = "{name} met Mountaineer Yuttha, the cheerful guard at Algaz Station.",
  },
  greetings = {
    { id = "g_default", text = "Welcome tae Loch Modan! Ye're on dry ground now, an' among friends, an' there's ale in Thelsamar if ye've the legs for the road." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! I'd wondered how ye fared, an' here ye are, lookin' fine." },
  },
  notice = {
    { id = "n_tired", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Oh, ye poor thing, look at the state o' yer gear. Gothor's forge is just there, an' he grumbles, but he'll put ye right." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "An elf from over the sea! Ye'll have come by the Menethil boat an' walked the whole marsh, an' I think that's the bravest thing I've heard all week." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Mountaineer Yuttha. Hammerfall asks folk where they're goin', an' I ask how they are, an' between us we cover the matter." } },
      again = {
        { id = "h_again", text = "What else can I tell ye, friend?" },
        { id = "h_again2", text = "Aye, go on, I like a chat." },
      },
      choices = {
        { text = "Where should I go from here?", next = "where" },
        { text = "You seem happy, for such a grim post.", next = "happy" },
        { text = "Thank you for the welcome.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "South along the road tae Thelsamar, an' ye cannae miss it, for it's the only town we've got. The Stoutlager Inn's on the square, an' ye're tae tell Innkeeper Hearthstove that Yuttha at the station still wants her old chair kept." } },
      choices = {
        { text = "Your old chair?", next = "chair" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chair = {
      lines = { { id = "c_default", text = "By the fire, on the left, wi' the wobbly leg. I was Thelsamar garrison till they sent me up here tae make up the numbers, an' I mean tae sit in that chair again the day they send me home." } },
      choices = { { text = "I'll pass it on. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    happy = {
      lines = { { id = "ha_default", text = "Somebody has tae be, wi' Zwarn sighin' on one side o' me an' Luxst sayin' nothin' on the other. Folk come out o' that tunnel wet an' frightened, an' a smile costs me less than it's worth tae them." } },
      choices = { { text = "It was worth a good deal. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Thelsamar born, an' posted tae Algaz for my sins. I'll be home by the fire again one day." } },
    _none = { { id = "tp_none", text = "Oh, I dinnae know that one, I'm sorry! Rockgar might, if ye catch him in a good mood." } },
  },
}

-- Mountaineer Zwarn: Algaz Station; gloomy, sure the Dragonmaw are coming tonight.
P:NPC {
  key = "lm_mtn_zwarn", id = TODO_NPC("Mountaineer Zwarn"), name = "Mountaineer Zwarn", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "gloomy", "dry" }, values = { "dutiful", "vigilant" },
  notices = { "soldier" },
  impression = {
    first = "Mountaineer Zwarn stands at Algaz Station with his collar turned up against the wind from the pass and the settled gloom of a dwarf who expects the worst nightly. He has been wrong every night so far and takes no comfort in it.",
    third = "{name} met Mountaineer Zwarn, a gloomy guard at Algaz Station.",
  },
  greetings = {
    { id = "g_default", text = "So ye've come tae Algaz. I hope ye've said yer farewells somewhere, for it'll be tonight, I can feel it in the wind." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're still alive, then. So am I, which I didnae expect." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's dark, an' the wind's from the north. If they're comin', it's now, so stand where I can see ye." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye look handy. Stay the night, why don't ye, for one more sword might mean one more of us sees the mornin'." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Zwarn. I've the cold corner o' the station, where the wind comes straight down from Dun Algaz carryin' the smell o' orc fires, an' it's told me nothin' good yet." } },
      again = {
        { id = "h_again", text = "What else? Ask while there's time." },
        { id = "h_again2", text = "Go on, it'll pass the hour." },
      },
      choices = {
        { text = "What will be tonight?", next = "tonight" },
        { text = "You've said that before, I'd guess.", next = "before" },
        { text = "Keep your chin up, Zwarn.", next = "END" },
      },
    },
    tonight = {
      lines = { { id = "t_default", text = "The Dragonmaw, down the pass in force. There's enough o' them in those tunnels tae roll over five Mountaineers an' be in Thelsamar by breakfast, an' one o' these nights their chieftain will work that out.", fx = { learn = { "dragonmaw" } } } },
      choices = {
        { text = "Why haven't they, in all these years?", next = "years" },
        { text = "Something else.", next = "BACK" },
      },
    },
    years = {
      lines = { { id = "y_default", text = "Luxst says it's because they're a beaten clan wi' nae dragons left an' nae heart for it. I say a beaten orc is only one that's restin', but I'll grant ye he's been right longer than I have." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "Every night for four years, an' Yuttha keeps a tally on the wall tae mock me wi'. But a watchman only has tae be right the once, an' I'd rather be laughed at than surprised." } },
      choices = { { text = "There's sense in that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Four years at Algaz Station, an' I've expected tae die on every night o' them. It's wearin'." } },
    dragonmaw = { { id = "tp_dm", text = "Up the pass, in the tunnels. It'll be tonight, mark me." } },
    _none = { { id = "tp_none", text = "I dinnae know, an' I doubt it'll matter by mornin'." } },
  },
}

-- Mountaineer Ganin: patrols the road between Algaz Station and the North Gate Pass.
P:NPC {
  key = "lm_mtn_ganin", id = TODO_NPC("Mountaineer Ganin"), name = "Mountaineer Ganin", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "easy", "gossipy" }, values = { "dutiful", "curious" },
  notices = { "travel", "race" },
  impression = {
    first = "Mountaineer Ganin patrols between Algaz Station and the North Gate Pass and collects news from every traveller he meets on the way. He trades what he hears at one end for what he hears at the other and considers it part of the job.",
    third = "{name} met Mountaineer Ganin, who patrols between Algaz Station and the North Gate Pass.",
  },
  greetings = {
    { id = "g_default", text = "Well met on the road! Which way have ye come, an' what's the word from there?" },
    { id = "g_back", when = { metBefore = true }, text = "It's yerself! Ye'll have fresh news by now, I hope, for I've used up the last lot." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome on the pass road! Is there any word from Gnomeregan, friend? The lads at the outpost ask me every week an' I've never anythin' tae tell them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Ganin. I walk from Algaz Station up tae the North Gate Pass an' back, which makes me the nearest thing tae a town crier these hills have got." } },
      again = {
        { id = "h_again", text = "What else d'ye want tae hear? Or tell, I'm no' fussy." },
        { id = "h_again2", text = "Aye, go on!" },
      },
      choices = {
        { text = "What's the news from the station?", next = "station" },
        { text = "And from the North Gate?", next = "gate" },
        { text = "I've come from Ironforge, and it stands.", next = "ironforge", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Safe walking, Ganin.", next = "END" },
      },
    },
    station = {
      lines = { { id = "s_default", text = "Rockgar's asked Ironforge for more rifles again, Gothor's run short o' rivets, an' Zwarn says the orcs are comin' tonight. That last one isnae news, mind, for he's said it every night since he was posted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gate = {
      lines = { { id = "g_default2", text = "Pilot Hammerfoot at the outpost is still watchin' the hills for a flyin' machine that went down out there. He'll no' rest till he knows what brought it down, an' the Mountaineers up there have learned tae walk soft around him." } },
      choices = {
        { text = "What do you think brought it down?", next = "down" },
        { text = "Something else.", next = "BACK" },
      },
    },
    down = {
      lines = { { id = "d_default", text = "I've heard a buzzard, an' I've heard an ogre wi' a boulder, an' I've heard the pilot fell asleep, dependin' on who's had how many. I pass them all on evenly, for it's no' a crier's place tae pick." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ironforge = {
      lines = { { id = "i_default", text = "It does? Well, o' course it does, but it's good tae hear it said by somebody who's seen the gates this season. I'll have that at both ends o' the road by nightfall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I walk the pass road an' carry the talk along it. Ye'd be surprised how much a garrison needs that." } },
    _none = { { id = "tp_none", text = "I've heard nothin' on that, an' it pains me tae say so. If ye learn it, tell me first." } },
  },
}

-- Mountaineer Brokk: patrols from Dun Algaz to Algaz Station.
P:NPC {
  key = "lm_mtn_brokk", id = TODO_NPC("Mountaineer Brokk"), name = "Mountaineer Brokk", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "fierce", "blunt" }, values = { "dutiful", "courage" },
  notices = { "soldier", "greenness" },
  impression = {
    first = "Mountaineer Brokk walks from Algaz Station to the mouth of Dun Algaz and back, closer to the Dragonmaw than any other dwarf in Loch Modan. He seems to regard the patrol as a daily invitation the orcs keep declining.",
    third = "{name} met Mountaineer Brokk, who patrols between Algaz Station and Dun Algaz.",
  },
  greetings = {
    { id = "g_default", text = "Ye're a long way up the pass, {class}. Either ye're bound for the Wetlands or ye're lookin' for a fight, an' I can help wi' the second." },
    { id = "g_back", when = { metBefore = true }, text = "Back on my road! Did the orcs give ye any sport?" },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 15 },
      text = "Ye're green for this end o' the road, {g:lad|lass}. Walk behind me as far as the tunnel mouth if ye're set on goin', an' run the rest." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "Now there's an arm that's swung an axe. Come up tae the tunnel mouth wi' me an' we'll see if the Dragonmaw are feelin' brave today." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Brokk. My patrol ends at the mouth o' Dun Algaz, where I stand a minute so the orcs can see I'm no' afraid o' them, an' then I walk back.", fx = { learn = { "dragonmaw" } } } },
      again = {
        { id = "h_again", text = "What else? Speak up, I've a pass tae walk." },
        { id = "h_again2", text = "Aye, out wi' it." },
      },
      choices = {
        { text = "You stand there on purpose?", next = "stand" },
        { text = "What are the Dragonmaw doing in Dun Algaz?", next = "orcs" },
        { text = "Give them my regards.", next = "END" },
      },
    },
    stand = {
      lines = { { id = "s_default", text = "Every day, in plain sight, wi' my rifle grounded. An orc respects nothin' but nerve, an' the day a Mountaineer stops showin' his face at that tunnel is the day they start wonderin' what else we've stopped doin'." } },
      choices = {
        { text = "Has one ever come out to meet you?", next = "meet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meet = {
      lines = { { id = "m_default", text = "Two, last winter, an' I came home wi' one o' their axes an' a new part in my beard. Gothor hung the axe over his forge, an' I let him, for he mended the helmet that saved me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "o_default", text = "Sulkin', mostly. They were the terror o' Khaz Modan when they'd dragons tae ride, an' now they squat in dwarven tunnels they didnae dig an' raid the marsh road for scraps." } },
      choices = { { text = "A long fall for them. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've the Dun Algaz patrol, an' I asked for it. Somebody ought tae look those orcs in the eye." } },
    dragonmaw = { { id = "tp_dm", text = "Dragon riders wi' nae dragons, hidin' in our tunnels. I show them my face every day." } },
    _none = { { id = "tp_none", text = "I've nae idea. If I cannae shoot it or shout at it, I leave it tae Rockgar." } },
  },
}

-- Mountaineer Dokkin: patrols the tunnel leading to the Wetlands.
P:NPC {
  key = "lm_mtn_dokkin", id = TODO_NPC("Mountaineer Dokkin"), name = "Mountaineer Dokkin", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "hushed", "steady" }, values = { "dutiful", "tradition" },
  notices = { "craft", "race" },
  impression = {
    first = "Mountaineer Dokkin patrols the tunnel toward the Wetlands with a hooded lantern, and he keeps his voice low out of long habit. He knows the passage by its echoes and stops mid-sentence to listen to them.",
    third = "{name} met Mountaineer Dokkin, who patrols the tunnel to the Wetlands.",
  },
  greetings = {
    { id = "g_default", text = "Softly, friend, softly. Sound carries a long way in here, an' no' only tae dwarven ears." },
    { id = "g_back", when = { metBefore = true }, text = "I know that step. Welcome back tae the dark." },
  },
  notice = {
    { id = "n_mine", cat = "craft", when = { profession = "Mining" },
      text = "Ye're a miner, so ye'll see it: look at the dressin' on that wall, every block true after all these years. They knew their trade, the dwarves who cut Dun Algaz." },
    { id = "n_tall", cat = "race", when = { race = { "Human", "NightElf" } },
      text = "Mind yer head on the lintels further in, tall one. They were cut for dwarves an' they've nae mercy." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Dokkin. I walk the tunnel, an' I listen while I walk, for in here ye'll hear trouble long before a lantern shows it tae ye." } },
      again = {
        { id = "h_again", text = "What else? Keep it low." },
        { id = "h_again2", text = "Hush a moment. Nae, it's only water. Go on." },
      },
      choices = {
        { text = "What do you listen for?", next = "listen" },
        { text = "These tunnels are dwarven work.", next = "work" },
        { text = "I'll go quietly.", next = "END" },
      },
    },
    listen = {
      lines = { { id = "l_default", text = "Iron on stone, for an orc cannae help draggin' his axe when the roof's low. Drippin' water keeps a steady time, so when the time's broken, somethin's standin' under the drip.", fx = { learn = { "dragonmaw" } } } },
      choices = {
        { text = "And what do you do then?", next = "then" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ["then"] = {
      lines = { { id = "t_default", text = "I shutter the lantern an' stand still till it moves or I'm sure. I've stood an hour that way wi' an orc breathin' round the next bend, an' I think he was doin' the same as me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "w_default", text = "Aye, every yard, an' fine work it is. It shames me that orcs sleep in the side halls, for it was built as a road between dwarven lands an' it's a road we can barely keep open now." } },
      choices = { { text = "It'll be yours again one day. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've walked this tunnel six years. I could do it blind, an' some nights I near enough do." } },
    dragonmaw = { { id = "tp_dm", text = "They keep tae the side halls. Listen for iron draggin' on stone." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. Little news finds its way in here." } },
  },
}

-- Mountaineer Naarh: Valley of Kings guard; stands beneath the statues.
P:NPC {
  key = "lm_mtn_naarh", id = TODO_NPC("Mountaineer Naarh"), name = "Mountaineer Naarh", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "solemn", "proud" }, values = { "tradition", "dutiful" },
  notices = { "race", "lore" },
  impression = {
    first = "Mountaineer Naarh stands guard in the Valley of Kings beneath the two great statues and holds himself as if he were a third. He speaks of the stone kings by name and lowers his voice when he does.",
    third = "{name} met Mountaineer Naarh, who guards the Valley of Kings beneath its statues.",
  },
  greetings = {
    { id = "g_default", text = "Ye stand in the Valley o' Kings, traveller. Look up before ye go on, for they've earned that much from everyone who passes." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've returned tae the valley. They've no' moved, an' neither have I." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Welcome, {g:brother|sister}. Ye'll have been told o' this place as a bairn, as we all were, but it's another thing tae stand under them." },
    { id = "n_wild", cat = "lore", when = { origin = "dwarf_wildhammer_kin" },
      text = "Ye've Wildhammer blood, by yer look. Then one o' these is yer own thane's likeness, an' ye're twice welcome in the valley." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Naarh. Other guards keep a gate or a road, an' I keep the feet o' kings, which I hold tae be the highest post in Loch Modan." } },
      again = {
        { id = "h_again", text = "Ask what else ye will." },
        { id = "h_again2", text = "Aye, go on, traveller." },
      },
      choices = {
        { text = "Who are the statues?", next = "who" },
        { text = "What do you guard them from?", next = "from" },
        { text = "I'll pay my respects.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Madoran Bronzebeard an' Khardros Wildhammer, the two thanes who stood together when the clans broke an' the Dark Irons turned on their own kin. Their sons raised them here, facin' the pass, so that nae dwarf would forget what that war cost.", fx = { learn = { "dark_iron" } } } },
      choices = {
        { text = "A warning to the Dark Irons, then.", next = "warning" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warning = {
      lines = { { id = "wa_default", text = "A warnin' tae them an' a reminder tae us, an' I think the second matters more. Bronzebeard an' Wildhammer havenae always been easy neighbours, an' it does nae harm tae see them shoulder tae shoulder in stone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    from = {
      lines = { { id = "f_default", text = "From troggs, who've nae more reverence than the rocks they crawled from, an' who'd foul the plinths if we let them near. Captain Rugelfuss holds them west o' the valley, an' I stand here in case he cannae.", fx = { learn = { "troggs" } } } },
      choices = { { text = "May it never come to that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I asked for this post an' I've held it nine years. I'd ask for nae other." } },
    dark_iron = { { id = "tp_di", text = "The kings above us stood against them once. We stand here still." } },
    troggs = { { id = "tp_tr", text = "Beasts wi' nae respect for stone that's been worked. They'll no' touch the kings while I draw breath." } },
    _none = { { id = "tp_none", text = "That's beyond my post, traveller. Ask in Thelsamar." } },
  },
}

-- Mountaineer Tyraw: Valley of Kings; bored gate hand, hungry for word of Ironforge.
P:NPC {
  key = "lm_mtn_tyraw", id = TODO_NPC("Mountaineer Tyraw"), name = "Mountaineer Tyraw", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "bored", "friendly" }, values = { "dutiful", "comfort" },
  notices = { "race", "greenness" },
  impression = {
    first = "Mountaineer Tyraw stands his watch in the Valley of Kings and is plainly bored by it. He brightens at anyone coming up from Dun Morogh and wants to know what is being served in Ironforge's taverns.",
    third = "{name} met Mountaineer Tyraw, a guard in the Valley of Kings who misses Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Somebody new, thank the stone! Ye've come up from Dun Morogh, I hope, wi' a bit o' news on ye?" },
    { id = "g_back", when = { metBefore = true }, text = "It's yerself! Sit a moment, or stand a moment anyway, an' tell me somethin'." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Ye'll be lodgin' in Tinker Town, then. Is it true ye've a machine in there that toasts bread on both sides at once?" },
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 },
      text = "First time through the gate, is it? Ye'll do fine, an' ye've picked a bonny day tae see the loch." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Tyraw. I was Ironforge garrison till the spring, an' now I guard a valley where the liveliest thing is two statues, an' they dinnae say much." } },
      again = {
        { id = "h_again", text = "What else? Dinnae rush off." },
        { id = "h_again2", text = "Aye, go on, I've all day, more's the pity." },
      },
      choices = {
        { text = "What do you miss about Ironforge?", next = "miss" },
        { text = "Is the valley really so dull?", next = "dull" },
        { text = "The Great Forge was burning bright when I left.", next = "forge", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Bear up, Tyraw.", next = "END" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "The noise, would ye believe, an' the heat o' the Great Forge on yer face when ye come in from the snow. Out here it's wind an' birdsong, an' a dwarf wasnae made for birdsong." } },
      choices = {
        { text = "Why were you sent out here?", next = "sent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sent = {
      lines = { { id = "s_default", text = "Tae fill a gap, when Loch Modan's own Mountaineers were sent tae the front. I didnae complain, for it was the King's order, but I count the days, an' I'm up tae a hundred an' six." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dull = {
      lines = { { id = "d_default", text = "It's dull till it isnae, {g:lad|lass}. A pack o' troggs came down the west slope a fortnight back, an' for a quarter hour I'd have given a month's pay tae be bored again.", fx = { learn = { "troggs" } } } },
      choices = { { text = "Careful what you wish for. Something else.", next = "BACK" } },
    },
    forge = {
      lines = { { id = "f_default", text = "Was it? Ah, ye've done me good just sayin' so. I can near enough feel it, an' I'll thank ye for that when the wind gets up tonight." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Ironforge garrison, on loan tae the valley. A hundred an' six days, an' countin'." } },
    troggs = { { id = "tp_tr", text = "They liven the place up, I'll say that, an' I'd sooner they didnae." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, I'm new here myself. Ask Naarh, he's been stood under those statues for years." } },
  },
}

-- Mountaineer Kalmir: patrols the Valley of Kings; a tracker.
P:NPC {
  key = "lm_mtn_kalmir", id = TODO_NPC("Mountaineer Kalmir"), name = "Mountaineer Kalmir", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "keen", "terse" }, values = { "dutiful", "nature" },
  notices = { "class", "pet" },
  impression = {
    first = "Mountaineer Kalmir patrols the Valley of Kings with her eyes on the ground more than the hills. She reads tracks the way a clerk reads a ledger and reports what she finds to the Captain without decoration.",
    third = "{name} met Mountaineer Kalmir, who tracks trogg sign through the Valley of Kings.",
  },
  greetings = {
    { id = "g_default", text = "Mind where ye put yer feet, {class}. There's a set o' prints by that rock I've no' finished wi' yet." },
    { id = "g_back", when = { metBefore = true }, text = "I saw yer tracks by the gate an' thought it was ye. Ye favour the right leg." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye've been lookin' at the same prints I have. Tell me what ye make o' them before I say, for I'd like a second opinion." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} off the west verge, if ye would. One good set o' paw prints over the top an' I've lost a mornin's readin'." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Kalmir. I walk the valley floor an' read what's crossed it in the night, an' the Captain decides what tae do about it." } },
      again = {
        { id = "h_again", text = "What else? I'm losin' the light on these." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "What crossed it last night?", next = "last" },
        { text = "How do you tell a trogg's track?", next = "track" },
        { text = "Three troggs, one limping, heading west.", next = "read", when = { class = "HUNTER" } },
        { text = "Good hunting, Mountaineer.", next = "END" },
      },
    },
    last = {
      lines = { { id = "l_default", text = "Five troggs, down from the western slope tae within a stone's throw o' the south tower, an' then back the way they came. They didnae take anythin' an' they didnae fight, which means they came tae look.", fx = { learn = { "troggs" } } } },
      choices = {
        { text = "To look at what?", next = "look" },
        { text = "Something else.", next = "BACK" },
      },
    },
    look = {
      lines = { { id = "lo_default", text = "At how many of us there are, I'd say, an' where we stand after dark. I've told Captain Rugelfuss, an' he's moved the night watch about, so that they'll count a different number next time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    track = {
      lines = { { id = "t_default", text = "Wide, flat an' turned in at the toe, wi' the knuckle marks beside it where they lean on their hands. A trogg carryin' somethin' heavy leaves the knuckles off, an' those are the tracks I follow first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    read = {
      lines = { { id = "r_default", text = "Four, for one's steppin' in another's prints, but ye've the limp an' the headin' right, an' that's better than most Mountaineers manage. Ye'd be wasted anywhere but on a trail." } },
      choices = { { text = "Four. I'll look closer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I tracked boar in Dun Morogh before I took the green. Troggs are easier, an' I like them less." } },
    troggs = { { id = "tp_tr", text = "They've started scoutin' us. That's new, an' I dinnae like new in a trogg." } },
    _none = { { id = "tp_none", text = "Cannae say. It's left nae tracks where I walk." } },
  },
}

-- Mountaineer Zaren: patrols from the Valley of Kings to the crossroad to the north.
P:NPC {
  key = "lm_mtn_zaren", id = TODO_NPC("Mountaineer Zaren"), name = "Mountaineer Zaren", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "lively", "competitive" }, values = { "dutiful", "strong" },
  notices = { "travel", "race" },
  impression = {
    first = "Mountaineer Zaren patrols from the Valley of Kings to the crossroad north of it and seems to be racing someone only she can see. She is quick, cheerful and a little out of breath, and she keeps her best times scratched on her rifle stock.",
    third = "{name} met Mountaineer Zaren, who patrols from the Valley of Kings to the northern crossroad.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Talk fast, friend, for I'm a hundred paces ahead o' yesterday an' I mean tae keep it." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again! I beat my best tae the crossroad since I saw ye, by a good forty breaths." },
  },
  notice = {
    { id = "n_nelf", cat = "travel", when = { race = "NightElf" },
      text = "Look at the legs on ye! I'd no' race ye for money, elf, but I'd dearly like tae see ye take the hill tae the crossroad." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Zaren. I've the road from the valley up tae the crossroad, an' I walk it against the sun, tae see if I can be there an' back before the shadow leaves the west tower." } },
      again = {
        { id = "h_again", text = "What else? Quick now!" },
        { id = "h_again2", text = "Aye, go on, I can spare ye a breath." },
      },
      choices = {
        { text = "Why race your own patrol?", next = "race" },
        { text = "What's at the crossroad?", next = "cross" },
        { text = "Don't let me slow you.", next = "END" },
      },
    },
    race = {
      lines = { { id = "r_default", text = "Because a patrol that comes by at the same hour every day is a patrol the troggs can set their supper by. If I'm early one day an' earlier the next, they never know when I'm due, an' it keeps my legs from goin' tae sleep." } },
      choices = {
        { text = "Has it ever caught them out?", next = "caught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught = {
      lines = { { id = "c_default", text = "Twice! I came round the bend a quarter hour early an' found three o' them rollin' a boulder ontae the road, an' ye've never seen troggs look so put out. Greishan Ironstove was just behind me wi' his bread, an' he's called me his escort ever since.", fx = { learn = { "troggs" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cross = {
      lines = { { id = "x_default", text = "A signpost an' a choice: north tae Thelsamar, or east round the south shore toward the dig an' the lodge. Droken has the Thelsamar road from there, an' I hand folk on tae him like a parcel." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've the valley road, an' the best time on it, an' I'll race any Mountaineer who says otherwise." } },
    troggs = { { id = "tp_tr", text = "They watch for regular habits. So I havenae any." } },
    _none = { { id = "tp_none", text = "Dinnae know, an' I cannae stop tae wonder! Ask Droken up the road." } },
  },
}

-- Mountaineer Veek: patrols from the Valley of Kings to the South Gate Pass.
P:NPC {
  key = "lm_mtn_veek", id = TODO_NPC("Mountaineer Veek"), name = "Mountaineer Veek", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "unhurried", "kindly" }, values = { "dutiful", "patient" },
  notices = { "greenness", "race" },
  impression = {
    first = "Mountaineer Veek walks the road between the Valley of Kings and the South Gate Pass with a pipe in his teeth and no visible hurry. He has seen a great many young dwarves and gnomes come through that pass for the first time and remembers a surprising number of them.",
    third = "{name} met Mountaineer Veek, who patrols between the Valley of Kings and the South Gate Pass.",
  },
  greetings = {
    { id = "g_default", text = "Good day tae ye. Take yer time on this stretch, for the view o' the valley's the best ye'll get, an' it's only once ye see it for the first time." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I remember ye. Ye've a few more miles on ye than when I saw ye last, an' they suit ye." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Well now, look at ye! Ye came up this road a pup, an' ye've grown intae somethin' the troggs ought tae worry about." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 },
      text = "First time out o' Dun Morogh, unless I miss my guess. Ye'll be wantin' Thelsamar, straight on past the statues, an' ye'll want tae be there before dark." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another o' the wee folk headin' out intae the world. I've seen a good many o' ye pass since Gnomeregan, an' ye all walk like ye've somethin' tae prove." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Veek. I've the road from the valley back tae the South Gate Pass, where the tunnel comes through from Dun Morogh, an' I've had it longer than some o' the stones have been laid." } },
      again = {
        { id = "h_again", text = "What else, then? There's nae rush." },
        { id = "h_again2", text = "Aye, go on, I've a pipe tae finish anyway." },
      },
      choices = {
        { text = "You must see everyone who comes through.", next = "everyone" },
        { text = "Is there trouble on this stretch?", next = "trouble" },
        { text = "Good day, Mountaineer.", next = "END" },
      },
    },
    everyone = {
      lines = { { id = "e_default", text = "Every one, an' most o' them at a run, wi' their kit all new an' their eyes on the statues instead o' the road. I tell them all the same thing, tae look down now an' then, an' I think perhaps one in ten hears me." } },
      choices = {
        { text = "Do you remember the ones who come back?", next = "back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "I do, an' I remember the ones who dinnae, which is the harder list. It's why I stop them a moment on their way through, for a word costs me nothin' an' it's saved a life or two." } },
      choices = { { text = "It's a good custom. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    trouble = {
      lines = { { id = "t_default", text = "Little enough, this close tae the pass. A wolf follows the tunnel through from the snow now an' then, an' the troggs keep further north, where Kalmir an' the Captain have their hands full.", fx = { learn = { "troggs" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've walked the South Gate road since before the last war. I mean tae walk it till my pipe goes out for good." } },
    troggs = { { id = "tp_tr", text = "North an' west o' my stretch, thank the stone. Ask the Captain." } },
    _none = { { id = "tp_none", text = "I couldnae say, {g:lad|lass}. I know my road, an' the faces on it, an' that's my lot." } },
  },
}
