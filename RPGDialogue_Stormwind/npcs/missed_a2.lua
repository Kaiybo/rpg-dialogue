-- Stormwind folk the roster scan found missing (part 2 of 3): the Dwarven District's weaponsmith, a
-- journeyman at the forge, the mining supplier and a hunter trainer; two boys fishing the canals;
-- the Flintridge caretaker; the Blue Recluse's apprentice chef and its crier; the canal tailor's
-- husband; and the owner of Duncan's Textiles. Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Borgus Steelhand: blacksmithing trainer at the weapon shop in the Dwarven District.
P:NPC {
  key = "borgus_steelhand", id = TODO_NPC("Borgus Steelhand"), name = "Borgus Steelhand", gender = "male",
  bible = "bibles/missed_a.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "gruff", "exacting" }, values = { "craft", "honesty" },
  notices = { "weapons", "craft" },
  impression = {
    first = "Borgus Steelhand teaches the hammer from a weapon shop in the Dwarven District, and he tests an edge on his own thumbnail before he'll let it leave. Other smiths speak of his blades with a kind of grudging pain.",
    third = "{name} met Borgus Steelhand, a dwarven weaponsmith who teaches blacksmithing in the Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Aye, come in, an' mind the rack by the door, for every edge on it is live." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are ye? Show me yer hands, an' I'll know if ye've been at the anvil or only talkin' about it." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Ye've burn scars on yer forearm in all the right places. Good, then I'll no' have tae explain which end o' the tongs tae hold." },
    { id = "n_warrior", cat = "weapons", when = { class = "WARRIOR" },
      text = "Ye carry that blade like ye've trusted yer life tae it. I'd like a look at who made it, if ye'll let me." },
    { id = "n_worn", cat = "weapons", when = { durability = { max = 0.25 } },
      text = "By my beard, look at the state o' that gear! Ye'd no' treat a mule that way, an' a mule never saved yer neck." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Borgus Steelhand, an' it's good tae hear a proper accent in this city. I make weapons an' I teach the makin' o' them, an' I'll no' go easy on ye for bein' kin." },
        { id = "h_default", text = "Borgus Steelhand, weaponsmith. Therum has the armour an' the royal seal, an' I've the blades, an' between us there's no' a guard in Stormwind who goes out badly dressed or badly armed." },
      },
      again = {
        { id = "h_again", text = "What else, then? The iron's coolin'." },
        { id = "h_again2", text = "Aye, ask, but ask quick." },
      },
      choices = {
        { text = "What makes a blade worth carrying?", next = "blade" },
        { text = "They say you're the best weaponsmith in the city.", next = "best" },
        { text = "Why work in Stormwind and not Ironforge?", next = "city" },
        { text = "I'll let you work, Borgus.", next = "END" },
      },
    },
    blade = {
      lines = { { id = "b_default", text = "Balance first, temper second, an' the edge last of all, though the edge is all a buyer ever looks at. Any fool can grind a thing sharp, but it takes a smith tae make it stay true after it's struck bone." } },
      choices = {
        { text = "How does a smith learn that?", next = "learn", when = { profession = "Blacksmithing" } },
        { text = "And an axe?", next = "axe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "l_default", text = "By breakin' a hundred o' yer own blades on the test block an' weepin' over none o' them. Start wi' Dane at the forge if ye're green, an' come tae me when ye can draw a bar out even." } },
      choices = { { text = "I'll do that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    axe = {
      lines = { { id = "a_default", text = "An axe forgives more, which is why we dwarves love them an' why Kathrum across the way sells so many. A sword tells ye every mistake ye made in the forgin' of it, an' that's the reason I prefer tae make swords." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "be_default", text = "Who's they? If it's Therum, he says it tae be polite, an' if it's a customer, he's after a kinder price an' he'll no' get one. I'm a fair smith who's been at it a long while, an' that's the whole truth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city = {
      lines = { { id = "c_default", text = "Because Ironforge has a smith on every step o' the Great Forge, an' Stormwind had hardly a one after the wars. King Magni sent us south tae help our allies stand on their own feet, an' I found I liked bein' needed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Ironforge born an' Ironforge trained, an' in Stormwind since the district was built. I've made blades for three wars now, an' I'd be glad never tae see a fourth." } },
    _none = { { id = "tp_none", text = "I couldn't tell ye, {g:lad|lass}. If it can't be hammered, I've likely no opinion on it." } },
  },
}

-- Dane Lindgren: journeyman blacksmith who teaches beginners in the Dwarven District.
P:NPC {
  key = "dane_lindgren", id = TODO_NPC("Dane Lindgren"), name = "Dane Lindgren", gender = "male",
  bible = "bibles/missed_a.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "earnest", "hardworking" }, values = { "craft", "patience" },
  notices = { "craft" },
  impression = {
    first = "Dane Lindgren is one of the few humans working the forges of the Dwarven District, and he has the soot and the squint to prove it. He teaches beginners the basics and counts himself still a student of the dwarves.",
    third = "{name} met Dane Lindgren, a journeyman blacksmith in the Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Good day! Mind the quench barrel, because I've only just filled it and it spits." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. I've a batch of nails cooling, so I can spare you a minute." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've been at an anvil yourself, I can tell by how you look at the fire before anything else in the room." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Is that ore dust on your boots? If you've copper to sell, half the forges on this street will thank you for it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Dane Lindgren, a journeyman smith, and I teach the first steps to anyone willing to sweat for them. Master Therum takes the experienced hands, and I take the ones who haven't yet learned which end of the bar is hot." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you?" },
        { id = "h_again2", text = "Go on, I can talk and work the bellows at once." },
      },
      choices = {
        { text = "A human, working among the dwarven forges?", next = "human" },
        { text = "What do you teach a beginner first?", next = "first" },
        { text = "This district never stops hammering, does it?", next = "noise" },
        { text = "Good day, Dane.", next = "END" },
      },
    },
    human = {
      lines = { { id = "hu_default", text = "I'm about the only one, and I had to ask three times before they'd let me carry coal. The dwarves don't much care where you were born once you've shown them you'll stay at the fire as long as they do." } },
      choices = {
        { text = "What have they taught you?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught = {
      lines = { { id = "t_default", text = "That I'd been hitting too hard and thinking too little, for a start. Master Therum made me draw out the same bar every morning for a season, and Borgus Steelhand still won't look at a blade of mine until I've broken it on his block myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "How to read the colour of the steel, because the fire tells you everything if you'll watch it. After that it's sharpening stones and copper buckles, and nobody enjoys those, but nobody skips them either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    noise = {
      lines = { { id = "n_default", text = "Not since the trouble in Redridge and Westfall began, no. The army wants swords and the farmers want ploughshares, and there's more of both on order than there are smiths to make them." } },
      choices = { { text = "Honest work, at least. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father shod horses in the Trade District, and I wanted to make more than horseshoes. So I walked up here and asked the dwarves, and I've not left." } },
    _none = { { id = "tp_none", text = "I'm not the one to ask, I'm afraid. Master Therum has been in this city longer than I've been alive, so try him." } },
  },
}

-- Brooke Stonebraid: mining supplies, Stonehand Mining, Dwarven District.
P:NPC {
  key = "brooke_stonebraid", id = TODO_NPC("Brooke Stonebraid"), name = "Brooke Stonebraid", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful", "practical" }, values = { "stone", "thrift" },
  notices = { "craft" },
  impression = {
    first = "Brooke Stonebraid sells picks and supplies at Stonehand Mining, and she swings each pick once before she'll hand it over. She says a miner without a good pick is only someone standing in a hole.",
    third = "{name} met Brooke Stonebraid, who sells mining supplies at Stonehand Mining.",
  },
  greetings = {
    { id = "g_default", text = "Welcome tae Stonehand Mining! If ye're goin' underground, ye'll want tae stop here first." },
    { id = "g_back", when = { metBefore = true }, text = "Well, ye came back up in one piece! What did ye find down there?" },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "There's rock dust in the creases o' yer knuckles, so I'll no' have tae sell ye on the trade. How's yer pick holdin' its point?" },
    { id = "n_gnome", cat = "craft", when = { race = "Gnome" },
      text = "A gnome! Ye'll be wantin' the short-hafted picks, an' don't let anyone tell ye they bite the stone any softer." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Brooke Stonebraid, an' I keep the picks, the flux an' the coal while Gelman does the teachin'. He'll show ye where tae strike, an' I'll make sure ye've somethin' worth strikin' with." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye?" },
        { id = "h_again2", text = "Aye, go on, {g:lad|lass}." },
      },
      choices = {
        { text = "What does a new miner need?", next = "need" },
        { text = "Where's the good ore near Stormwind?", next = "ore" },
        { text = "You sound fond of the work.", next = "fond" },
        { text = "Thank you, Brooke.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "A pick wi' a haft that fits yer hand, a stout pair o' boots, an' the sense tae listen tae the roof before ye swing. The first two I can sell ye, an' the third Gelman will shout intae ye soon enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ore = {
      lines = { { id = "o_default", text = "There's copper all through the hills o' Elwynn, an' tin once ye get tae Westfall or Redridge. The best o' the Elwynn veins are in the Fargodeep an' the Jasperlode, though, an' those are crawlin' wi' kobolds these days." } },
      choices = {
        { text = "Kobolds, in the kingdom's own mines?", next = "kobolds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kobolds = {
      lines = { { id = "k_default", text = "Aye, an' it's a disgrace, for a mine left empty a season fills up wi' vermin like a cellar wi' rats. They'd rather have yer candle than yer coin, so keep yer lantern close an' yer pick closer." } },
      choices = { { text = "I'll keep hold of both. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    fond = {
      lines = { { id = "f_default", text = "I'm a dwarf, {g:lad|lass}, an' the stone's in the blood! I sell from a counter now, but I broke my first vein under Dun Morogh before I could braid my own hair, an' I still miss the sound of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came south from Dun Morogh wi' the first crews tae settle this district. Gelman needed someone tae keep his stores, an' I'd a head for numbers as well as rock." } },
    _none = { { id = "tp_none", text = "I've no idea, {g:lad|lass}. If it's no' under the ground, I've likely never given it a thought." } },
  },
}

-- Einris Brightspear: hunter trainer, Dwarven District.
P:NPC {
  key = "einris_brightspear", id = TODO_NPC("Einris Brightspear"), name = "Einris Brightspear", gender = "female",
  bible = "bibles/missed_a.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "sharp", "patient" }, values = { "the hunt", "self-reliance" },
  notices = { "hunt", "pet" },
  impression = {
    first = "Einris Brightspear trains hunters in the Dwarven District and looks at every visitor as if judging the range. She is patient with a beast and a good deal less so with a careless shot.",
    third = "{name} met Einris Brightspear, a dwarven hunter trainer in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Well met. Stand easy, for I only look at folk this way out o' habit." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' still in one piece, so ye've been listenin' tae somebody." },
  },
  notice = {
    { id = "n_hunter", cat = "hunt", when = { class = "HUNTER" },
      text = "A hunter, an' one who's walked a fair way by the wear on yer quiver strap. Good, we'll skip the part where I tell ye which end the shot comes out." },
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "That's a fine beast ye have there, an' {pet} looks well fed. A hunter who feeds the animal before himself is one I'll make time for." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_nelf", when = { race = "NightElf", class = "HUNTER" },
          text = "Einris Brightspear. Yer folk hunt wi' the bow an' mine wi' the rifle, an' I've learned there's less between the two than either side likes tae admit." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "Einris Brightspear, an' I train those who live by the shot an' the beast at their side. If ye've come tae learn, I'll teach ye, an' if ye've come tae boast, Thorfin has more patience for it than I do." },
        { id = "h_default", text = "Einris Brightspear, hunter. I train the trackers an' marksmen o' this city alongside Thorfin an' Ulfir, so unless ye mean tae take up the trade, I've little tae sell ye but advice." },
      },
      again = {
        { id = "h_again", text = "What else would ye know?" },
        { id = "h_again2", text = "Aye, ask." },
      },
      choices = {
        { text = "What makes a good hunter?", next = "good" },
        { text = "Rifle or bow?", next = "rifle" },
        { text = "A dwarven hunter must find Stormwind tame.", next = "tame" },
        { text = "Good hunting, Einris.", next = "END" },
      },
    },
    good = {
      lines = { { id = "g_default2", text = "Patience, {g:lad|lass}, an' more of it than ye think ye have. Any fool can loose a shot, but a hunter waits in the cold till the one shot that matters, an' then doesn't miss it." } },
      choices = {
        { text = "And the beast at a hunter's side?", next = "beast" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beast = {
      lines = { { id = "b_default", text = "It's a partner, never a tool, an' it knows the difference before ye do. Karrina Mekenda here in the district will teach ye how tae train one properly, an' I'd go tae her before ye pick up any bad habits." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rifle = {
      lines = { { id = "r_default", text = "A rifle for the punch an' a bow for the quiet, an' a wise hunter learns both. I was raised on Dun Morogh powder myself, so ye can guess which I reach for when a bear's already seen me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tame = {
      lines = { { id = "t_default", text = "The city is, aye, but ye needn't walk far from the walls. There are wolves an' boars enough in Elwynn tae teach a beginner, an' the big cats o' Stranglethorn will finish the lesson if ye live that long." } },
      choices = { { text = "I mean to live that long. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunted the snows o' Dun Morogh from the day I could lift my father's rifle. Stormwind asked Ironforge for teachers, an' I was fool enough tae say I'd go." } },
    _none = { { id = "tp_none", text = "That's no' a trail I've walked. Ask someone who has, for I'll no' guess at it." } },
  },
}

-- Brandon: a boy fishing the Canals with Justin and Roman.
P:NPC {
  key = "brandon_canals", id = TODO_NPC("Brandon"), name = "Brandon", gender = "male",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "doubtful", "good-natured" }, values = { "friends" },
  notices = { "fishing" },
  impression = {
    first = "Brandon fishes the canals with Justin and Roman and spends most of his time telling Justin that can't be true. He wants very much for some of it to be true anyway.",
    third = "{name} met Brandon, a boy who fishes the canals with Justin and Roman.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Are you here to fish too? You can, there's lots of room." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Justin's told three more stories since you left." },
  },
  notice = {
    { id = "n_fish", cat = "fishing", when = { profession = "Fishing" },
      text = "Do you know how to fish properly? Roman says you have to spit on the hook, and I think he made that up." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Brandon, and that's Justin and that's Roman, and we fish here nearly every day. Justin knows a lot of stories, but I don't think all of them really happened." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not catching anything anyway." },
        { id = "h_again2", text = "You can ask another one." },
      },
      choices = {
        { text = "Which of Justin's stories don't you believe?", next = "stories" },
        { text = "Are there really crocolisks in the canals?", next = "crocs" },
        { text = "Do you ever catch anything?", next = "catch" },
        { text = "Good fishing, Brandon.", next = "END" },
      },
    },
    stories = {
      lines = { { id = "s_default", text = "He said a wizard can turn into a raven, and he said Lord Lothar beat thirty-six orcs with just his hands. I said nobody could count that high in a fight, and he said Lothar could." } },
      choices = {
        { text = "Mages can do stranger things than that.", next = "mage", when = { class = { "MAGE", "DRUID" } } },
        { text = "Lothar was a great hero, whatever the count. Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "m_default", text = "They can? Really and truly? Oh no, now I'll have to tell Justin he was right, and he'll never ever stop talking about it." } },
      choices = { { text = "You could keep it a secret. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    crocs = {
      lines = { { id = "c_default", text = "Justin says somebody brought them from the swamp for pets and threw them in when they got big. I don't believe it, but I keep my feet out of the water, just in case." } },
      choices = { { text = "That's wise. Something else.", next = "BACK" } },
    },
    catch = {
      lines = { { id = "ca_default", text = "Little ones, sometimes, and we throw them back because my mum won't cook anything out of the canal. Roman caught a hat once, and he wore it all day even though it was wet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live near the canals, and Justin and Roman are my best friends. We're going to get a boat one day, when we've saved up." } },
    _none = { { id = "tp_none", text = "I don't know. Justin would say he knows, but he'd be making it up." } },
  },
}

-- Justin: the storyteller of the three boys fishing the Canals.
P:NPC {
  key = "justin_canals", id = TODO_NPC("Justin"), name = "Justin", gender = "male",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "boastful", "imaginative" }, values = { "stories" },
  notices = { "magic", "soldier" },
  impression = {
    first = "Justin fishes the canals with Brandon and Roman and knows a thrilling fact about everything, most of them from his cousin. He tells each one as though he had been standing there when it happened.",
    third = "{name} met Justin, a boy on the canals with a story about everything.",
  },
  greetings = {
    { id = "g_default", text = "Hey, do you want to know a secret? I know loads, and they're all true." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! I've got a new one, and it's the best one yet." },
  },
  notice = {
    { id = "n_mage", cat = "magic", when = { class = "MAGE" },
      text = "You're a wizard! Can you turn into a raven? Brandon says nobody can, so do it now, quick, while he's looking!" },
    { id = "n_warrior", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Have you fought orcs? How many at once? Was it more than thirty-six?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Justin, and I know everything about Stormwind, because my cousin's in the guard and he tells me. Did you know there are crocolisks in this canal, right under where we're sitting?" },
      },
      again = {
        { id = "h_again", text = "Do you want to hear another one?" },
        { id = "h_again2", text = "I know more, loads more. Ask me!" },
      },
      choices = {
        { text = "Crocolisks, in the canal?", next = "crocs" },
        { text = "Tell me about Lothar and the orcs.", next = "lothar" },
        { text = "Your friend Brandon doesn't seem convinced.", next = "brandon" },
        { text = "Keep fishing, Justin.", next = "END" },
      },
    },
    crocs = {
      lines = { { id = "c_default", text = "Yes! Rich people got them from the swamp when they were babies, and then they got too big and bitey, so they threw them in here. My cousin's friend saw one eat a whole duck." } },
      choices = {
        { text = "Have you seen one yourself?", next = "seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "Well, I saw a log that moved, and it had eyes, sort of. Roman says it was only a log, but logs don't go against the water, do they?" } },
      choices = { { text = "Not often, no. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    lothar = {
      lines = { { id = "l_default", text = "Lord Lothar killed thirty-six orcs with his bare hands, all in one go, because his sword was stuck in the thirty-seventh! That's why he's got the biggest statue, and it's all true." } },
      choices = { { text = "He was a great man. Something else.", next = "BACK" } },
    },
    brandon = {
      lines = { { id = "b_default", text = "Brandon never believes anything, not even the one about the old wizard who could turn into a raven. He'll be sorry when a crocolisk comes up and I'm the only one who's ready for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live by the canals, and my cousin's in the guard, so I hear about everything first. I'm going to be in the guard too, and then I'll know even more." } },
    _none = { { id = "tp_none", text = "I know about that, I just can't remember it right now. I'll ask my cousin and then I'll tell you." } },
  },
}

-- Caretaker Folsom: the Flintridge family's last caretaker, on the Canals by the Park.
P:NPC {
  key = "caretaker_folsom", id = TODO_NPC("Caretaker Folsom"), name = "Caretaker Folsom", gender = "male",
  bible = "bibles/missed_a.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "weary", "dutiful" }, values = { "loyalty", "discretion" },
  notices = { "noble" },
  impression = {
    first = "Caretaker Folsom stands on the canal side among the last crates of a dead family's belongings, with a ledger under his arm. He served the Flintridges as his father did, and now his work is selling off what remains.",
    third = "{name} met Caretaker Folsom, who is seeing the Flintridge estate to auction.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. If you've come about the Flintridge lots, I must tell you that most have already gone under the hammer." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. I'm still here, as you see, and so are the last of the crates." },
  },
  notice = {
    { id = "n_duskwood", cat = "noble", when = { questDone = TODO_QUEST("The Legend of Stalvan") },
      text = "You're the one who went looking into the tutor, aren't you? I've slept poorly since you came, and I'd guess you have too." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quest", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "You've come asking after the Flintridges, and after the tutor, I think. Nobody has spoken that name to me in years, and I had rather hoped nobody would again." },
        { id = "h_default", text = "I am Folsom, caretaker to the Flintridge estate, as my father was before me. There is no family left to take care of, so I look after their things instead, until the last of them is sold." },
      },
      again = {
        { id = "h_again", text = "Was there something more you wished to know?" },
        { id = "h_again2", text = "Ask, then. I've little else to do but wait on the auctioneer." },
      },
      choices = {
        { text = "I'm looking for something of Stalvan Mistmantle's.", next = "stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") } },
        { text = "What happened to the Flintridges?", next = "family" },
        { text = "Why is the estate being sold?", next = "auction" },
        { text = "This is sad work for a loyal man.", next = "work" },
        { text = "I'll leave you to it, Folsom.", next = "END" },
      },
    },
    stalvan = {
      big = true,
      lines = { { id = "st_default", text = "He was tutor to the young lady of the house, a quiet and scholarly man, or so we all believed. Whatever he left behind went into the crates with everything else, for I had no heart to sort his things from theirs.", fx = { learn = { "stalvan" } } } },
      choices = {
        { text = "May I look through the crates?", next = "crate" },
        { text = "What was he like, in the house?", next = "tutor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crate = {
      lines = { { id = "cr_default", text = "The unsold lots are stacked just here beside me, and you may search them, since no buyer wanted a tutor's papers. I ask only that you leave the family's own things as you find them." } },
      choices = { { text = "I'll be careful with them. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tutor = {
      lines = { { id = "tu_default", text = "He was courteous, and exact, and he watched Miss Tilloa rather more closely than a teacher should. I noticed it and said nothing, because it was not a servant's place to speak, and I have had a good many years to regret that." } },
      choices = {
        { text = "You couldn't have known what he'd do.", next = "regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regret = {
      lines = { { id = "re_default", text = "That is kind of you, and I have told myself the same on better nights. If you learn the whole of it out in Duskwood, I think I would rather not be told." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "f_default", text = "They were killed, all of them, at their summer house near the Eastvale camp, many years ago now. It was done in a single night by someone they had welcomed at their own table, and the kingdom has mostly forgotten it." } },
      choices = {
        { text = "Was the killer ever caught?", next = "caught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught = {
      lines = { { id = "ca_default", text = "He was gone before morning, and no magistrate ever laid a hand on him. Travellers from Darkshire tell stories of a madman on the road there, and I try not to listen to them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    auction = {
      lines = { { id = "a_default", text = "The house stood shut and untouched for years, paid for out of what the family left. That money ran dry at last, and the creditors will have their due, so every chair and candlestick goes to whoever bids." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "w_default", text = "It is, but I would rather it were done by someone who knew which chair the old lord favoured. When the last lot is gone I shall lock a door that has nothing behind it, and then I suppose I shall be free." } },
      choices = { { text = "You've served them well. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father kept the Flintridge house, and I after him. I have known no other work, and I am too old now to learn any." } },
    stalvan = { { id = "tp_stalvan", text = "Stalvan Mistmantle taught the Flintridge girl her letters. I will say no more of him than that, if you'll forgive me." } },
    _none = { { id = "tp_none", text = "I'm afraid I know little beyond one family's household, and that household is gone." } },
  },
}

-- Connor Rivers: apprentice chef at the Blue Recluse, Mage Quarter.
P:NPC {
  key = "connor_rivers", id = TODO_NPC("Connor Rivers"), name = "Connor Rivers", gender = "male",
  bible = "bibles/missed_a.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "eager", "grateful" }, values = { "craft", "gratitude" },
  notices = { "food", "travel" },
  impression = {
    first = "Connor Rivers is the apprentice chef at the Blue Recluse, with flour to the elbows and a burn on every other finger. He talks about the man who first taught him the way some people talk about their fathers.",
    third = "{name} met Connor Rivers, the apprentice chef at the Blue Recluse.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Blue Recluse! Mind the pot behind me, because it's Angus's stock and he'll have my hide if it's jostled." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I've not burned anything since you were last in, which is a record for the week." },
    { id = "g_hyal", when = { questDone = TODO_QUEST("James Hyal") },
      text = "It's you! I still think about what you found out in Menethil, and I thank you for going." },
  },
  notice = {
    { id = "n_cook", cat = "food", when = { profession = "Cooking" },
      text = "You cook, don't you? Nobody but a cook checks how the fire's banked before they look at the menu." },
    { id = "n_menethil", cat = "travel", when = { minLevel = 20 },
      text = "You look like someone who gets about. Have you ever been as far as the Wetlands, to Menethil Harbor?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quest", when = { questActive = TODO_QUEST("James Hyal") },
          text = "Have you been to Menethil yet? Vincent Hyal keeps the tavern there, and he'll know how his brother James is getting on." },
        { id = "h_default", text = "I'm Connor Rivers, apprentice to Angus Stern, who's the finest cook in the Mage Quarter and won't let me forget it. I chop, I stir and I scrub, and once in a while he lets me season something." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk while I peel." },
        { id = "h_again2", text = "Go on, but quickly, before Angus looks round." },
      },
      choices = {
        { text = "Who taught you before Angus?", next = "hyal" },
        { text = "What's it like, working under Angus Stern?", next = "angus" },
        { text = "The Blue Recluse draws an odd crowd.", next = "crowd" },
        { text = "What would you cook for a fellow cook?", next = "cook", when = { profession = "Cooking" } },
        { text = "Back to your pots, Connor.", next = "END" },
      },
    },
    hyal = {
      big = true,
      lines = { { id = "hy_default", text = "A man named James Hyal, who was the best chef and innkeeper I ever met. I was a pot boy with no prospects when he took me in, and everything I have, I owe to what he taught me.", fx = { learn = { "menethil" } } } },
      choices = {
        { text = "Where is he now?", next = "where" },
        { text = "What did he teach you?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "wh_default", text = "He went north with his brother Vincent to work a tavern in Menethil Harbor, on the Wetlands coast. He used to write, but I've had no letter in a long while now, and it worries me more than I let on." } },
      choices = {
        { text = "If I'm in Menethil, I'll ask after him.", next = "ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask = {
      lines = { { id = "as_default", text = "Would you? Vincent is the one to speak to, at the inn by the harbor, and you need only tell him that Connor at the Blue Recluse sends his regards. I'd go myself, but Angus would have a new apprentice by the time I got back." } },
      choices = { { text = "I'll remember it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    taught = {
      lines = { { id = "t_default", text = "That a kitchen runs on kindness as much as salt, and that you taste everything twice. He never shouted, not once, and I didn't know until I came here how rare that is in a cook." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    angus = {
      lines = { { id = "an_default", text = "He's hard, and he's fair, and he can tell from across the room when I've rushed a sauce. I've learned more from him in a year than I'd have believed, though most of it was learned while being shouted at." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowd = {
      lines = { { id = "c_default", text = "Mages, mostly, who argue about things I can't follow and forget to eat until the plate's gone cold. Then there are the quiet ones who drift up from the Slaughtered Lamb, and Joachim serves those himself and tells me to stay by the stove." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "ck_default", text = "Something plain, because another cook can't be fooled by sauce. I'd roast you a good fowl with nothing but salt and thyme, and then I'd watch your face and be terrified." } },
      choices = { { text = "That's how a cook should think. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I started as a pot boy under James Hyal and came to the Blue Recluse when he went north. One day I'd like a kitchen of my own, though don't tell Angus." } },
    menethil = { { id = "tp_menethil", text = "It's a harbor town in the Wetlands, north of the dwarven lands. James and Vincent Hyal went there to keep a tavern." } },
    _none = { { id = "tp_none", text = "I couldn't say. I hear a lot through the kitchen door, but I only ever catch half of it." } },
  },
}

-- Corbett Schneider: husband of Rema, the canal tailor; walks to Lionheart Armory and Trias' Cheese.
P:NPC {
  key = "corbett_schneider", id = TODO_NPC("Corbett Schneider"), name = "Corbett Schneider", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful", "unhurried" }, values = { "family", "cheese" },
  notices = { "trade" },
  impression = {
    first = "Corbett Schneider carries parcels for his wife Rema's tailor shop and never passes the cheese shop without stopping. He is a contented man who gives every neighbour a good day by name.",
    third = "{name} met Corbett Schneider, who runs deliveries for the Canal Tailor and Fit Shop.",
  },
  greetings = {
    { id = "g_default", text = "Good day, good day! Forgive me if I keep walking, for I've a parcel for Harlan Bagley and a wife who counts the minutes." },
    { id = "g_back", when = { metBefore = true }, text = "Hullo again! I'm on my way home this time, with any luck." },
  },
  notice = {
    { id = "n_tailor", cat = "trade", when = { profession = "Tailoring" },
      text = "You've a tailor's pricked fingers, I see. My Rema has the same, and so do two of our children, and I count myself lucky to be the one who carries the boxes." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Corbett Schneider, of the Canal Tailor and Fit Shop, though it's my Rema who does the sewing. I do the carrying and the bookkeeping, and I reward myself with a little cheese on the way back." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I can spare a moment more." },
        { id = "h_again2", text = "Go on, but don't tell Rema I dawdled." },
      },
      choices = {
        { text = "What are you delivering?", next = "delivery" },
        { text = "Tell me about your family.", next = "family" },
        { text = "You have the look of a man headed for cheese.", next = "cheese" },
        { text = "Good day, Corbett.", next = "END" },
      },
    },
    delivery = {
      lines = { { id = "d_default", text = "Padded shirts and linings for Lionheart Armory, because Harlan's sellers need something soft to go under all that mail and leather. He orders by the crate now, and Rema's been sewing by candlelight to keep up." } },
      choices = {
        { text = "Business is good, then.", next = "business" },
        { text = "Something else.", next = "BACK" },
      },
    },
    business = {
      lines = { { id = "b_default", text = "Brisk, friend, very brisk! Rema frets about why so many folk want sturdy clothes all of a sudden, and I tell her to let the Keep do the worrying while we do the hemming." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "f_default", text = "Rema, and our three, who are all grown and all at the needle one way or another. Lawrence teaches the beginners at Duncan's Textiles in the Mage Quarter, and his mother is prouder of that than she'll ever say to his face." } },
      choices = { { text = "A family trade is a fine thing. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    cheese = {
      lines = { { id = "c_default", text = "You've found me out! Elling Trias makes a bleu that's fresh every morning, and his Elaine always asks after the shop. A wheel of that and a quiet walk home is all the luxury I need." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I married a tailor and I've carried her parcels ever since, and I've never regretted a step of it. We've had the shop by the bridge since the canals were dug anew." } },
    _none = { { id = "tp_none", text = "I'm not sure, friend. Rema hears more than I do, since half the Trade District's wives sit in her fitting room." } },
  },
}

-- Erich Lohan: walks the Mage Quarter calling people to the Blue Recluse.
P:NPC {
  key = "erich_lohan", id = TODO_NPC("Erich Lohan"), name = "Erich Lohan", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "loud", "jovial" }, values = { "family", "a full house" },
  notices = { "drink" },
  impression = {
    first = "Erich Lohan strolls the lawns of the Mage Quarter shouting the praises of the Blue Recluse to anyone with ears. His promises grow grander with every lap, and nobody at the tavern has ever agreed to honour them.",
    third = "{name} met Erich Lohan, who drums up custom for the Blue Recluse.",
  },
  greetings = {
    { id = "g_default", text = "You there, {class}! You look thirsty, and the Blue Recluse is just up the lane with the best cellar in the quarter!" },
    { id = "g_back", when = { metBefore = true }, text = "My friend, you've come back! Have you been to the Recluse yet, or must I walk you there myself?" },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "I see you've started already! A wise beginning, and the Recluse is the proper place to finish it." },
    { id = "n_dwarf", cat = "drink", when = { race = "Dwarf" },
      text = "A dwarf! Then you'll know good ale from bad, and I dare you to find fault with ours." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Erich Lohan, friend to the thirsty! I walk the quarter and tell good people about the Blue Recluse, because a tavern that hides behind a tower needs somebody with lungs." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you on the way to the Recluse?" },
        { id = "h_again2", text = "Ask, ask, and then go and drink!" },
      },
      choices = {
        { text = "I heard you shouting about free drinks.", next = "free" },
        { text = "Why do you do this?", next = "why" },
        { text = "What's good at the Blue Recluse?", next = "good" },
        { text = "Perhaps later, Erich.", next = "END" },
      },
    },
    free = {
      lines = { { id = "f_default", text = "Ah, well, I do shout that, and it does turn heads. Between ourselves, Joachim has never once agreed to it, so you'd best bring your purse and take the word as an invitation." } },
      choices = {
        { text = "So it isn't true at all.", next = "true" },
        { text = "At least you admit it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    ["true"] = {
      lines = { { id = "t_default", text = "The company is free, and so is the fire, and so is my conversation, which some would pay to avoid. Steven tells me I'll be the ruin of the family name, but the benches are full every night, so who's to say?" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because Steven Lohan is my kin and he works inside, and I've no patience for standing behind a counter. He pours and I shout, and each of us thinks he has the better half of the arrangement." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    good = {
      lines = { { id = "g_default2", text = "Angus Stern's kitchen, first and last, for the man cooks as if the King were coming. After that I'd point you to Joachim's wines, and to a corner seat where you can hear mages argue about things that might set the roof alight." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Lohan, and the Lohans have always been near a tavern, on one side of the bar or the other. I've found my calling out here in the fresh air." } },
    _none = { { id = "tp_none", text = "I've no idea, friend, but somebody at the Blue Recluse will, so that's one more reason to go!" } },
  },
}

-- Duncan Cullen: light armor merchant and owner of Duncan's Textiles, Mage Quarter.
P:NPC {
  key = "duncan_cullen", id = TODO_NPC("Duncan Cullen"), name = "Duncan Cullen", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "genial", "shrewd" }, values = { "craft", "his shop" },
  notices = { "armor", "trade" },
  impression = {
    first = "Duncan Cullen owns Duncan's Textiles and sells the finished cloth and leather from its front room. He keeps teachers and suppliers under the same roof, and he is quietly pleased with himself for thinking of it.",
    third = "{name} met Duncan Cullen, owner of Duncan's Textiles in the Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Duncan's Textiles! You'll find the finished goods with me and the bolts and thread with Alexandra." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to the shop. Has the stitching held up for you?" },
  },
  notice = {
    { id = "n_tailor", cat = "trade", when = { profession = "Tailoring" },
      text = "You sew, I think, from the way you turned that cuff over to see the inside. Georgio is through there if you want teaching, and tell him I sent you." },
    { id = "n_light", cat = "armor", when = { class = { "MAGE", "PRIEST", "WARLOCK", "ROGUE", "DRUID" } },
      text = "Now you're exactly who this shop was opened for. Have a look at the rack by the window, because that's this month's work." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Duncan Cullen, and the name over the door is mine. I sell light armor, cloth and leather both, and every piece of it was cut and sewn by somebody I can call across the room." },
      },
      again = {
        { id = "h_again", text = "What else can I help you with?" },
        { id = "h_again2", text = "Yes, go on." },
      },
      choices = {
        { text = "You keep trainers in your own shop?", next = "trainers" },
        { text = "Why set up in the Mage Quarter?", next = "quarter" },
        { text = "Lionheart Armory sells cloth and leather too.", next = "rival" },
        { text = "Good day, Duncan.", next = "END" },
      },
    },
    trainers = {
      lines = { { id = "t_default", text = "I do, and it's the cleverest thing I ever did. Georgio Bolero teaches the trade here and young Lawrence Schneider takes the beginners, so half the tailors in Stormwind learned at my tables and still buy their thread from Alexandra." } },
      choices = {
        { text = "And what do you get from it?", next = "get" },
        { text = "Something else.", next = "BACK" },
      },
    },
    get = {
      lines = { { id = "g_default2", text = "First look at the best work that comes off those tables, and a shop that's never empty. A customer who walks in on a lesson can see how the goods are made, and that sells better than any sign." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    quarter = {
      lines = { { id = "q_default", text = "Because mages wear out robes faster than anyone alive, what with the scorch marks and the acid. I'm by the gate from the Trade District as well, so I catch everybody else on their way through." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rival = {
      lines = { { id = "r_default", text = "So they do, and good luck to Harlan Bagley, who's a decent man. He sells to soldiers in a hurry, and I sell to people who'll stand and feel the weave, so there's custom enough in this city for both of us." } },
      choices = { { text = "A generous view. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I opened this shop when the quarter was rebuilt, with one table and a borrowed sign. It's grown a little since." } },
    _none = { { id = "tp_none", text = "That's not something I know about, I'm afraid. I know cloth and I know customers, and you've found the edge of both." } },
  },
}
