-- Still more of Stormwind: the Dwarven District's miners, smiths, engineers and hunters, the Park's druids
-- and stable, the canal shops, the watch and a few quiet corners. Classic city only. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Brooke Stonebraid: dwarf who sells picks and mining supplies at Stonehand Mining in the Dwarven District.
P:NPC {
  key = "brooke_stonebraid", id = TODO_NPC("Brooke Stonebraid"), name = "Brooke Stonebraid", title = "Mining Supplier", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "hearty", "practical" }, values = { "craft", "kin" },
  notices = { "craft", "dwarf", "kit" },
  impression = {
    first = "Brooke Stonebraid sells picks and mining supplies in the Dwarven District, beside Gelman Stonehand's lessons, and tests every pick-handle across her knee. She is hearty and practical and thinks humans dig like badgers.",
    third = "{name} met Brooke Stonebraid, a dwarf who sells mining supplies in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Well met! Picks, lamps and flux, and every handle on that rack's been across my knee and held." },
    { id = "g_2", when = { metBefore = true }, text = "Back again! Did the pick hold, or did ye find the one bad rock in Elwynn?" },
    { id = "g_3", when = { race = "Dwarf" }, text = "Ach, a proper face at last! Come in, come in, and tell me what the mountain's saying." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Mining" },
      text = "There's stone dust in your hair, and it's nae from the street. Good. I like a customer who's used what I sell." },
    { id = "n_2", cat = "dwarf", when = { race = "Dwarf" },
      text = "Ye'll nae need telling which end of the pick to hold, then. Ye'd be surprised how often I'm asked in this city." },
    { id = "n_3", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's seen a cave-in or near enough. Sit down a moment, and tell me the roof held." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Brooke Stonebraid. Gelman Stonehand teaches the mining here and I sell what ye need to do it. Between us we've put a pick in the hand of half this city, and we've taught a fair few of them to swing it without losing a toe." },
      },
      again = {
        { id = "hello_again1", text = "What else can I do for ye?" },
        { id = "hello_again2", text = "Go on, I'm only sorting wedges." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "Let me see the mining supplies.", next = "BUSINESS" },
        { text = "What should a miner carry?", next = "carry" },
        { text = "Tell me about Gelman.", next = "gelman" },
        { text = "How do humans take to mining?", next = "humans" },
        { text = "Where's good ore near the city?", next = "ore" },
        { text = "The earth's been dug enough. Leave it be.", next = "leave" },
        { text = "I've smelted a bit. What's my flux doing wrong?", next = "flux", when = { profession = "Mining" } },
        { text = "Do ye miss the mountain?", next = "miss", when = { race = "Dwarf" } },
        { text = "Good day, Brooke.", next = "END" },
      },
    },
    carry = {
      lines = {
        { id = "carry_1", text = "A pick ye can swing all day, which means lighter than your pride wants. A lamp and spare oil, a coil of rope, and a wee bird in a cage if ye're going deep. When the bird stops singing, ye start walking." },
      },
      choices = {
        { text = "A bird?", next = "bird" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bird = {
      lines = {
        { id = "bird_1", text = "Aye, the bad air takes the bird first, and that's your warning. I'll nae sell ye the bird, mind. Ye get that from a lad on the canals, and ye'd better be kind to it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gelman = {
      lines = {
        { id = "gelman_1", text = "He can hear a seam through ten feet of rock, and he's nae patience at all for a pupil who cannae. I keep the shop because I'm the one who can explain a thing twice without throwing it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    humans = {
      lines = {
        { id = "humans_1", text = "Like badgers, bless them. They dig straight in and hope. A dwarf reads the hill for a week first. Still, I'll say this for them, they're nae afraid of the dark, and they learn quick once the roof's come down the first time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ore = {
      lines = {
        { id = "ore_1", text = "Copper in the hills round Elwynn, wherever the kobolds have nae got to it first. The wee beasts have the Fargodeep and the Jasperlode both. For tin ye'll want Redridge or Westfall, and ye'll want company." },
      },
      choices = {
        { text = "What's it like in a kobold mine?", next = "kobolds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kobolds = {
      lines = {
        { id = "kobolds_1", text = "They dig like drunken moles, with nae props and nae plan. It's a wonder the whole of Elwynn's nae fallen in. If ye go in after them, watch the roof more than the kobolds." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    leave = {
      big = true,
      lines = {
        { id = "leave_1", text = "There's an elf in the Park says the same, and she says it kindly. But every plough and every nail in this city came out of the ground first. The stone's been giving since before there were dwarves to ask. Ye take with care, and ye prop what ye open." },
      },
      choices = {
        { text = "Take what's needed, and shore up what you leave.", next = "BACK", reply = "That's a miner's creed, that is. Ye'd do well under the mountain.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Every mine is a wound that never closes.", next = "BACK", reply = "Then I'm sorry for the world, for it's a great many wounds old, and it's still turning.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flux = {
      lines = {
        { id = "flux_1", text = "Ye're adding it cold, I'd wager, or too late. It goes in as the ore starts to sweat, nae once it's running. Ask Gelman to show ye, and stand well back when ye ask." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = {
        { id = "miss_1", text = "Every morning, when I wake and there's sky where a ceiling ought to be. But there's dwarves enough in this district that I can shut my eyes at the forge and near believe it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "The lads off the tram say the Dark Irons have been seen in the Searing Gorge in numbers. That's nae rumour to a dwarf, mind, that's a weather report." } },
    background = { { id = "tp_background", text = "Stonebraids have been miners since the first shaft was sunk at Gol'Bolar. I came down on the tram to sell picks to folk who'd never held one." } },
    advice = { { id = "tp_advice", text = "Prop the roof before ye take the ore. The ore will wait for ye, and the roof will nae." } },
    _none = { { id = "tp_none", text = "That's nae down any shaft I've worked." } },
  },
}

-- Borgus Steelhand: dwarf weaponsmith in the Dwarven District; the best Therum Deepforge ever met.
P:NPC {
  key = "borgus_steelhand", id = TODO_NPC("Borgus Steelhand"), name = "Borgus Steelhand", title = "Weapon Crafter", gender = "male",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "exacting", "proud" }, values = { "craft", "honor" },
  notices = { "craft", "kit", "dwarf" },
  impression = {
    first = "Borgus Steelhand forges weapons in the Dwarven District and is counted the finest weaponsmith in the city, even by smiths who dislike saying so. He will not sell a blade he has not tried to break.",
    third = "{name} met Borgus Steelhand, a dwarf weaponsmith in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Aye? If ye want a blade made right, ye'll wait for it, and if ye will nae wait, there's shops enough." },
    { id = "g_2", when = { metBefore = true }, text = "Ye've come back. Then ye've learned what the cheap ones are worth." },
    { id = "g_3", when = { profession = "Blacksmithing" }, text = "A smith, by those forearms. Stand there, out of the sparks, and we'll talk." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Ye hold yourself like ye've stood at an anvil. Show me your hammer hand. Aye, there's the callus, and it's in the right place." },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That edge has been used as a pry-bar, or I'm a gnome. It's a crime, what ye've done to honest steel." },
    { id = "n_3", cat = "dwarf", when = { race = "Dwarf" },
      text = "Kin. Good. I'll nae have to say everything twice and slowly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Borgus Steelhand. I make weapons, and I teach them that have the smithing already and want to learn how an edge is truly made. Therum Deepforge teaches the rest, and he does it well. I've nae the patience for horseshoes." },
      },
      again = {
        { id = "hello_again1", text = "What else?" },
        { id = "hello_again2", text = "Speak, the iron's heating." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "Therum says you're the best he's met.", next = "therum" },
        { text = "What makes a weapon good?", next = "good" },
        { text = "You try to break everything you make?", next = "breaks" },
        { text = "A smith who arms killers shares the guilt.", next = "guilt" },
        { text = "Who else works the forges here?", next = "forges" },
        { text = "What's the hardest thing ye've forged?", next = "hardest", when = { profession = "Blacksmithing" } },
        { text = "Is it true the Dark Irons forge better?", next = "darkiron", when = { race = "Dwarf" } },
        { text = "Good day, Borgus.", next = "END" },
      },
    },
    therum = {
      lines = {
        { id = "therum_1", text = "Did he, now? Well, it'll have pained him to say it. He's a fine armourer, and we've argued for twenty years whether it's harder to make the thing that cuts or the thing that stops it. I'd tell him he's the best I've met as well, if I thought he could bear it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    good = {
      lines = {
        { id = "good_1", text = "Balance first, since a sharp edge is nae use on a blade that tires the arm. Then the temper, hard at the edge and soft at the spine, so it bends before it breaks. The polish is the least of it, and it's all most buyers look at." },
      },
      choices = {
        { text = "How do you get the temper right?", next = "temper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temper = {
      lines = {
        { id = "temper_1", text = "By the colour of the steel in a dark room, and thirty years of getting it wrong first. I can show ye the colour. I cannae give ye the thirty years, so ye'd best start." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    breaks = {
      lines = {
        { id = "breaks_1", text = "Every one. I put it in the vise and lean on it, and I strike it flat on the anvil's horn. One in ten fails, and that one goes back in the fire. I'd rather it failed me in the shop than some lad in Redridge." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    guilt = {
      big = true,
      lines = {
        { id = "guilt_1", text = "I've turned that one over, at night, more than ye'd think. I'll nae forge for a man I think a murderer, and I've sent a few from that door. But the orcs are nae coming with harsh words, {g:lad|lass}. Someone has to make the answer." },
      },
      choices = {
        { text = "A sword in a defender's hand is a good work.", next = "BACK", reply = "Aye. That's the only reason I can sleep, and it's reason enough.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You can't know whose hand it ends in.", next = "BACK", reply = "No, I cannae, and it's the worst part of the craft. I'd be a fool to tell ye otherwise.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forges = {
      lines = {
        { id = "forges_1", text = "Therum and his wife Kaita, who sells the stock. Young Dane Lindgren's a human, and he swings like one, but he listens. Then there's Grimand Elmore, who thinks faster than he hammers. It's a good district, loud the way a place ought to be." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = {
        { id = "hardest_1", text = "A greataxe for a Wildhammer thane, who wanted it light enough to throw from gryphon-back and heavy enough to matter when it landed. I made it four times. He took the fourth and never said a word, so I ken it was right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    darkiron = {
      lines = {
        { id = "darkiron_1", text = "Their ore's better, and I'll grant ye that through my teeth. Their smiths sold themselves to a fire-lord for it. I'd sooner make an honest blade of poor iron than a wonder I'd to kneel for." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "They say a smith in the Burning Steppes is forging in a metal that drinks light. I'd like to see it, and then I'd like to see it broken." } },
    background = { { id = "tp_background", text = "Forty years at the Great Forge under Ironforge, and then the king wanted smiths in Stormwind after the rebuilding. I came for a season, and that was a good while ago." } },
    advice = { { id = "tp_advice", text = "Buy a plain blade from a good smith before a pretty one from a poor one. Ye cannae parry with engraving." } },
    _none = { { id = "tp_none", text = "I dinnae ken, and I'll nae pretend. Ask me about steel." } },
  },
}

-- Dane Lindgren: human journeyman smith among the dwarves of the Dwarven District; teaches beginners.
P:NPC {
  key = "dane_lindgren", id = TODO_NPC("Dane Lindgren"), name = "Dane Lindgren", title = "Journeyman Blacksmith", gender = "male",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "earnest", "sturdy" }, values = { "craft", "humility" },
  notices = { "craft", "race", "kit" },
  impression = {
    first = "Dane Lindgren is a human journeyman at the forges of the Dwarven District, where he teaches beginners and is corrected by every dwarf within earshot. He takes it well and has started saying \"aye\" without noticing.",
    third = "{name} met Dane Lindgren, a journeyman blacksmith in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Hello there! Mind the quench barrel, it's deeper than it looks, and I'd know." },
    { id = "g_2", when = { metBefore = true }, text = "Aye, welcome back, and by that I mean yes. They've got me doing it now." },
    { id = "g_3", when = { profession = "Blacksmithing" }, text = "Another smith! Come and tell me I'm holding these tongs right, because Therum says I'm not." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've burns on your wrists in the same places I have. We'll get on." },
    { id = "n_2", cat = "race", when = { race = "Human" },
      text = "It's good to see a face at my own height. I've had a crick in my neck from looking down to be shouted at." },
    { id = "n_3", cat = "kit", when = { durability = { max = 0.3 } },
      text = "I could knock the worst of those dents out for you, if Therum weren't watching. He says a journeyman doesn't touch a customer's plate." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Dane Lindgren, journeyman. Therum Deepforge is my master, and I teach the beginners so that he needn't watch them hold a hammer by the wrong end. I'm the only human at these forges, and the dwarves have decided to find it funny." },
      },
      again = {
        { id = "hello_again1", text = "What else can I tell you?" },
        { id = "hello_again2", text = "Go on, this has to heat anyway." },
        { id = "hello_again3", text = "Aye? Yes, I mean." },
      },
      choices = {
        { text = "Teach me blacksmithing.", next = "BUSINESS" },
        { text = "What's it like, learning from dwarves?", next = "dwarves" },
        { text = "What do you teach a beginner?", next = "teach" },
        { text = "Why did a human choose a dwarven forge?", next = "why" },
        { text = "Humans should learn from humans.", next = "humans" },
        { text = "Tell me about the other smiths.", next = "smiths" },
        { text = "What did you get wrong at first?", next = "wrong", when = { profession = "Blacksmithing" } },
        { text = "Do they tease ye much, lad?", next = "tease", when = { race = "Dwarf" } },
        { text = "Good day, Dane.", next = "END" },
      },
    },
    dwarves = {
      lines = {
        { id = "dwarves_1", text = "Loud. They tell you you've done it wrong before you've finished doing it. But I've learned more here in two years than in five with the smith in Goldshire. And once you've been insulted by Therum, you don't mind a customer's complaint." },
      },
      choices = {
        { text = "Do they ever praise you?", next = "praise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise = {
      lines = {
        { id = "praise_1", text = "Borgus Steelhand looked at a dagger of mine last month and said, \"I've seen worse.\" Kaita told me afterward that she's known him forty years and heard him say it twice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    teach = {
      lines = {
        { id = "teach_1", text = "How to hold the heat, first of all. A beginner pulls the iron too soon because the fire frightens him, and then he beats cold metal until it cracks. After that it's copper and bronze, and a great many nails." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "why_1", text = "Because Argus at Goldshire told me he'd taught me all he had, and I knew it wasn't all there was. I walked up here and asked Therum for a place. He handed me a broom, and I swept for half a year before I touched a hammer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    humans = {
      big = true,
      lines = {
        { id = "humans_1", text = "I thought so too, once. Then I watched Therum draw out a bar in three heats that would have taken me nine. If the best in the world is a dwarf, I'd be a fool to stay away for pride's sake." },
      },
      choices = {
        { text = "Learn from whoever is best. Pride forges nothing.", next = "BACK", reply = "That's it exactly. I'll take the shouting for the sake of the lesson.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You've let them make a servant of you.", next = "BACK", reply = "I swept a floor, friend. Every apprentice under that mountain did the same, and none of them is a servant.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smiths = {
      lines = {
        { id = "smiths_1", text = "Therum's the master, and Kaita keeps the shop and the peace. Borgus makes weapons and frightens me. Grimand Elmore's kind, in a hurry, and Hank the Hammer down the lane lets me use his big anvil when Therum's is taken." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = {
        { id = "wrong_1", text = "Everything, but chiefly the quench. I plunged a blade in straight and fast, and it came out bent like a bow. Therum hung it over my bench, and it's still there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tease = {
      lines = {
        { id = "tease_1", text = "Only all day. They call me \"the tall apprentice\" and ask how the weather is up there. I've started asking how it is down there, and Therum laughed, so I think I'm allowed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "The army's order for horseshoes doubled this month. Therum says you don't shoe that many horses to stand them in a stable." } },
    background = { { id = "tp_background", text = "A farrier's son from Elwynn. I learned shoes from my father and blades from Smith Argus, and I'm learning everything else here." } },
    advice = { { id = "tp_advice", text = "Don't be afraid of the fire. Respect it, and take your time, and pull the iron when it's ready and not when you are." } },
    _none = { { id = "tp_none", text = "I wouldn't know. I'm still learning the things I'm supposed to know." } },
  },
}

-- Sprite Jumpsprocket: gnome journeyman engineer in the Dwarven District; teaches beginners under Lilliam Sparkspindle.
P:NPC {
  key = "sprite_jumpsprocket", id = TODO_NPC("Sprite Jumpsprocket"), name = "Sprite Jumpsprocket", title = "Journeyman Engineer", gender = "female",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "excitable", "precise" }, values = { "invention", "kin" },
  notices = { "craft", "gnome", "class" },
  impression = {
    first = "Sprite Jumpsprocket teaches beginning engineers in the Dwarven District and talks faster than her own inventions run. She came out of Gnomeregan with one bag of tools and counts every explosion since as progress.",
    third = "{name} met Sprite Jumpsprocket, a gnome journeyman engineer in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Hello, hello! Don't step on the blue wire, it's live, or it was a minute ago, and I haven't checked since." },
    { id = "g_2", when = { metBefore = true }, text = "You're back, and you've all your fingers! That's a ninety percent retention rate among my pupils this month." },
    { id = "g_3", when = { race = "Gnome" }, text = "Oh, a gnome! Come in, come in, mind the dwarf-sized step, and tell me which level you lived on." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Engineering" },
      text = "There's powder burn on your left eyebrow, so you're one of us. Was it the fuse length? It's always the fuse length." },
    { id = "n_2", cat = "gnome", when = { race = "Gnome" },
      text = "You've got the Gnomeregan squint, from reading gauges in bad light. I'd know it anywhere, and I miss it terribly." },
    { id = "n_3", cat = "class", when = { class = "MAGE" },
      text = "A mage! You do with a word what takes me forty parts and a week. Mine keeps working when I'm asleep, though, so I call it even." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Sprite Jumpsprocket, journeyman engineer! Lilliam Sparkspindle teaches the advanced theory, Billibub Cogspinner sells the parts, and I take the beginners, since I remember exactly what it's like to wire something backwards. I did it on Tuesday." },
      },
      again = {
        { id = "hello_again1", text = "What else? I've got at least four minutes before this needs venting." },
        { id = "hello_again2", text = "Go on, I can solder and listen at the same time, mostly." },
        { id = "hello_again3", text = "Yes, yes?" },
      },
      choices = {
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "What do you start a beginner on?", next = "start" },
        { text = "You came from Gnomeregan?", next = "gnomeregan" },
        { text = "How do gnomes and dwarves share a district?", next = "dwarves" },
        { text = "Your machines are a danger to the city.", next = "danger" },
        { text = "What are you building?", next = "building" },
        { text = "What's the best safety margin on a blasting charge?", next = "margin", when = { profession = "Engineering" } },
        { text = "Which level did you live on?", next = "level", when = { race = "Gnome" } },
        { text = "Good day, Sprite.", next = "END" },
      },
    },
    start = {
      lines = {
        { id = "start_1", text = "Blasting powder, and then a rough bomb, which sounds alarming and is. It teaches respect in a single afternoon. After that come bolts, copper tubes and a wrench, and nobody's allowed to say \"it should be fine\" in my workshop." },
      },
      choices = {
        { text = "Why not?", next = "fine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fine = {
      lines = {
        { id = "fine_1", text = "Because every engineering accident in recorded gnomish history begins with those four words. I've checked. I kept a tally in Gnomeregan, and I got to three hundred and twelve before the last one, which nobody wrote down." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomeregan = {
      lines = {
        { id = "gnomeregan_1", text = "Level four, the tinkers' dormitories. When the alarms went, I took my good spanner set and my calipers and left everything else, including a half-built mechanical squirrel that I think about more than is reasonable." },
      },
      choices = {
        { text = "What happened down there?", next = "happened" },
        { text = "Something else.", next = "BACK" },
      },
    },
    happened = {
      lines = {
        { id = "happened_1", text = "The troggs came up through the lower works, and then the radiation was released to stop them, and it didn't stop them. It stopped us. I know whose order it was, and I know the High Tinker trusted him. I'm still working out which of those facts is worse." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves = {
      lines = {
        { id = "dwarves_1", text = "Noisily! They think we over-design, and we think they under-measure. A dwarf builds a thing to last a thousand years and a gnome builds it to be improved next week. Put the two on one project and you get something that lasts and also has a self-oiling hinge." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      big = true,
      lines = {
        { id = "danger_1", text = "There was one incident, with one chimney, and I paid for the chimney! Listen, everything worth building is a little dangerous. So is a forge, and so's a horse, and nobody asks the stable master to fill in a hazard form." },
      },
      choices = {
        { text = "Progress is worth a few singed eyebrows.", next = "BACK", reply = "Yes! Eyebrows are a renewable resource. I'm putting that on the workshop wall.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A city is no place to test what explodes.", next = "BACK", reply = "That's what the watch captain said, almost word for word. I do test the big ones out by the lake now.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    building = {
      lines = {
        { id = "building_1", text = "A mechanical squirrel, mark two. It has a better spring housing, and a small bell in it so I can find it. It's not useful, exactly. I left the first one behind, you see, so I'm building it again and getting it right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    margin = {
      lines = {
        { id = "margin_1", text = "Double the fuse and halve the charge until you've done it ten times without flinching. Then you may trust your numbers, and you should stand behind something anyway. I say behind something, and not behind someone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    level = {
      lines = {
        { id = "level_1", text = "Four, east corridor, by the big ventilation fan that always rattled. I filed a maintenance request about that fan every month for six years. If we ever retake the city, I'm going to fix it myself before I do anything else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "Billibub says somebody's been buying up every gyrochronatom in the city. You only need that many for a very large clockwork, or a great many small ones that all tick together." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "We'll take it back. I have a list of what I'm going to fix, in order, and it's forty pages, and item one is a fan." } },
    background = { { id = "tp_background", text = "Tinker's apprentice, level four, and then a refugee with a spanner set. Lilliam found me mending a dwarf's rifle in Tinker Town and brought me here to teach." } },
    advice = { { id = "tp_advice", text = "Measure it twice, and then get someone else to measure it who doesn't want it to fit." } },
    _none = { { id = "tp_none", text = "I haven't any data on that! I could build something to find out, given a week and some copper." } },
  },
}

-- Einris Brightspear: dwarf hunter trainer in the Dwarven District; a mountaineer who prefers the stalk to the shot.
P:NPC {
  key = "einris_brightspear", id = TODO_NPC("Einris Brightspear"), name = "Einris Brightspear", title = "Hunter Trainer", gender = "female",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "keen", "teasing" }, values = { "patience", "skill" },
  notices = { "pet", "class", "dwarf" },
  impression = {
    first = "Einris Brightspear teaches hunters in the Dwarven District and holds that the shot is the least of the hunt. She tracked snow leopards in Dun Morogh for years, and she watches a pupil's feet before their aim.",
    third = "{name} met Einris Brightspear, a dwarf who trains hunters in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Well met. Ye walk loud for someone carrying a bow, but we can mend that." },
    { id = "g_2", when = { metBefore = true }, text = "There ye are. I heard ye coming from the tram steps, which is better than last time." },
    { id = "g_3", when = { class = "HUNTER" }, text = "A hunter, and nae a bad-looking beast at your heel, if ye've one. Come and show me how ye stand." },
  },
  notice = {
    { id = "n_1", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a well-kept animal, and it's watching me the way it ought to. Ye've done right by {pet}." },
    { id = "n_2", cat = "class", when = { class = "HUNTER" },
      text = "Your draw hand's steady, and your eyes are on the far wall and nae on me. That's a hunter's habit, and I'll nae train it out of ye." },
    { id = "n_3", cat = "dwarf", when = { race = "Dwarf" },
      text = "A dwarf with a bow and nae a rifle? Then ye're my pupil and nae Ulfir's, and I'll hear nae argument." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Einris Brightspear. There are three of us here who teach the hunt. Ulfir Ironbeard will teach ye to shoot and Thorfin Stoneshield will teach ye to stay alive. I teach ye to find the beast in the first place, and the other two forget that part." },
      },
      again = {
        { id = "hello_again1", text = "What else, hunter?" },
        { id = "hello_again2", text = "Go on, I've all day and so does the quarry." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What does a hunter learn first?", next = "first" },
        { text = "Tell me about Ulfir and Thorfin.", next = "others" },
        { text = "Where did you learn to track?", next = "track" },
        { text = "Hunting for sport is plain cruelty.", next = "sport" },
        { text = "What's worth hunting near Stormwind?", next = "near" },
        { text = "How do I keep my beast calm in a city?", next = "calm", when = { pet = { type = "Beast" } } },
        { text = "Teach me what a tracker learns along the way.", next = "hp", when = { class = "HUNTER" } },
        { text = "Not many humans take up the hunt, I'm told.", next = "hp_human", when = { race = "Human", class = "HUNTER" } },
        { text = "My people track by moonlight in Ashenvale.", next = "hp_elf", when = { race = "NightElf" } },
        { text = "Your people never had a hunting lodge in a city.", next = "hp_dwarf", when = { race = "Dwarf", class = "HUNTER" } },
        { text = "I'll be on my way, Einris.", next = "END" },
      },
    },
    hp = {
      hub = true,
      lines = {
        { id = "hp_default", text = "A tracker learns tae see the beast before it sees ye, and then tae see the man before he sees ye, which is harder. Track Beasts ye'll have from the start, Hunter's Mark comes soon after, and then ye'll learn tae track the humanoids and the undead and the giants as ye go." },
        { id = "hp_low", when = { maxLevel = 12 }, text = "Ye've only just begun, so start with Track Beasts and use it everywhere, even in the city, until ye know what every arrow on the map means. Then put a Hunter's Mark on what ye mean tae kill, and never shoot at the one ye didnae mark." },
      },
      again = { { id = "hp_again", text = "What else, hunter? The quarry's patient." } },
      choices = {
        { text = "Why mark a target before shooting?", next = "hp_mark" },
        { text = "How do I hide from what's tracking me?", next = "hp_feign", when = { minLevel = 20 } },
        { text = "Where does the trail end, for the best of us?", next = "hp_end", when = { minLevel = 50 } },
        { text = "Something else, Einris.", next = "hello" },
      },
    },
    hp_mark = {
      lines = { { id = "hpm_default", text = "Because it tells your beast and your friends which one ye want, and it shows ye the beast even when it slips intae the brush. A hunter who doesnae mark their quarry is a hunter shooting at whatever's nearest, and that's how ye end up fighting three wolves instead of one." } },
      choices = {
        { text = "Choose the quarry, then strike. Always.", next = "BACK", reply = "Aye, that's the order of it, and I'll make ye say it again until ye mean it.", fx = { align = { order = 1 } } },
        { text = "I'd rather hit what's in front of me.", next = "BACK", reply = "Then ye'll have a short, exciting life, and I'll tell your story tae the next pupil.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_feign = {
      lines = { { id = "hpf_default", text = "Ye become nothing. At thirty ye'll learn tae drop and lie still so the thing on ye loses the scent, and that's the best hiding a hunter ever learns, though a cat does it better than any of us. Until then, it's distance and the Aspect of the Cheetah." } },
      choices = {
        { text = "A hunter who can vanish never needs to fight fair.", next = "BACK", reply = "Fair's a word for duels. In the field, there's only home or no' home.", fx = { align = { honor = -1 } } },
        { text = "I'd rather face what hunts me.", next = "BACK", reply = "Then face it, but face it with your beast in front and your feet behind, if ye please.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_end = {
      big = true,
      lines = { { id = "hpe_default", text = "In the worst places in the world, and I mean that kindly. The Beaststalker mail's taken off things in Scholomance and Stratholme and the Blackrock spire, and the elves speak of an ancient in Felwood who grows a bow for a hunter who's tracked down the worst of the demons there. I've never followed that trail, but I'd like tae hear it from someone who has." } },
      choices = {
        { text = "I'll follow it, and tell you how it ends.", next = "BACK", reply = "Do, and I'll listen tae every word, which I don't say tae Ulfir.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_human = {
      lines = { { id = "hph_default", text = "No, ye're a rare sight, and I'll own I didnae expect tae teach many of ye. But humans are good at watching each other, and that's half of tracking; ye only need tae learn tae watch beasts the same way." } },
      choices = {
        { text = "Then teach me to watch like a dwarf.", next = "BACK", reply = "I'll teach ye tae watch like a snow leopard, which is better, and ye'll thank me in Duskwood.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_elf = {
      lines = { { id = "hpe2_default", text = "So I've heard, and I'll nae pretend tae teach ye what ten thousand years taught your people. But the beasts of these kingdoms are different, and the men of them more so, so I'll teach ye where tae look and ye can teach me how tae move." } },
      choices = {
        { text = "A fair trade, Einris.", next = "BACK", reply = "It is. Your feet first, then, for I heard ye on the stairs and I'm still a wee bit proud of it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_dwarf = {
      lines = { { id = "hpd_default", text = "We didnae, and I miss the Farstrider Lodge every day of my life, for there's nae better place tae smoke a pipe after a long track than its porch over the loch. But Stormwind's hunters need teaching, and the king's folk asked Ironforge for us, so here we are among the chimneys." } },
      choices = {
        { text = "Then I'll carry the Lodge's ways to Stormwind's woods.", next = "BACK", reply = "Do. The Brightspears have been tracking since before Thelsamar had a wall, and I'd like it remembered.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "first_1", text = "To sit still. I put a new pupil on a rock in Elwynn at dawn and tell them to count what passes. Most see three deer. By the end of the season they see forty, and the fox that was watching them the whole time." },
      },
      choices = {
        { text = "And after sitting still?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = {
        { id = "after_1", text = "The wind, and then tracks, and only after that the bow. Ulfir hands them a rifle on the first day, and I'll grant ye they enjoy his lessons more. Mine come home with meat." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_1", text = "Ulfir's the best shot in the district and the loudest man in it, and I've never worked out how the one survives the other. Thorfin's quiet and careful, with a scar for every lesson he gives. We share a fire and a cask, and we argue every night." },
      },
      choices = {
        { text = "What do you argue about?", next = "argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    argue = {
      lines = {
        { id = "argue_1", text = "Whether a pet's a partner or a decoy, mostly, and Karrina Mekenda comes over from her pens to shout at Ulfir about it. I hold with Karrina. Ye dinnae send a friend in to be chewed so ye can take your time aiming." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    track = {
      lines = {
        { id = "track_1", text = "In the high passes of Dun Morogh, after snow leopards. Ye can follow one for three days and never see more than a print. It taught me the animal knows the land better than I do, and that I'm a guest on its hill." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sport = {
      big = true,
      lines = {
        { id = "sport_1", text = "I'll nae quarrel with that. I've nae time for the lords who ride out from the Keep to kill a stag and leave it lying. A hunter eats what she takes, or she's taking it to guard the herd or the farm. Anything else is butchery." },
      },
      choices = {
        { text = "Take only what you'll use, and honour the beast.", next = "BACK", reply = "Aye. That's the whole of the teaching, and the rest is only practice.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A beast is a beast. Trophies harm no one.", next = "BACK", reply = "They harm the hunter, for a start. I've seen what a wall of heads does to a man's notion of himself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    near = {
      lines = {
        { id = "near_1", text = "Boar and wolf in Elwynn, to learn on. The great cats of Stranglethorn if ye want a true test, though there's a dwarf down there named Nesingwary who's made a sport of it. And the bears of Loch Modan, if ye're homesick as I am." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    calm = {
      lines = {
        { id = "calm_1", text = "Walk it by the canals at dawn, before the carts. Feed it away from the forge smoke. And dinnae take it past the Cathedral bells at noon. I've seen a boar go straight through a fruit stall at the first stroke." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A trapper told me the wolves south of the river have gone strange, and that they're bigger and they dinnae run from fire. I've a mind to go and see for myself." } },
    background = { { id = "tp_background", text = "A mountaineer's daughter from above Kharanos. I could read snow before I could read runes, and I still trust the snow more." } },
    advice = { { id = "tp_advice", text = "Hunt into the wind, and never shoot at what ye cannae carry home." } },
    _none = { { id = "tp_none", text = "Nae sign of that on any trail I've walked." } },
  },
}

-- Ulfir Ironbeard: dwarf hunter trainer in the Dwarven District; a rifleman who thinks a pet is there to hold the target still.
P:NPC {
  key = "ulfir_ironbeard", id = TODO_NPC("Ulfir Ironbeard"), name = "Ulfir Ironbeard", title = "Hunter Trainer", gender = "male",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "loud", "boastful" }, values = { "skill", "glory" },
  notices = { "class", "pet", "dwarf" },
  impression = {
    first = "Ulfir Ironbeard teaches hunters in the Dwarven District and is the best shot there, as he will tell anyone at a volume to match his rifle. He believes a pet exists to hold the target still, and Karrina Mekenda argues it with him every week.",
    third = "{name} met Ulfir Ironbeard, a dwarf rifleman who trains hunters in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Ha! Another one come to learn from the finest shot south of Ironforge. Stand there, where I can see ye." },
    { id = "g_2", when = { metBefore = true }, text = "Back again! Have ye hit anything yet, or are ye still frightening the trees?" },
    { id = "g_3", when = { class = "HUNTER" }, text = "A hunter! Good. Tell me that's a gun on your back and nae one of them bent sticks." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = "HUNTER" },
      text = "Ye've a hunter's shoulders, I'll say that. Now let's see if ye've a hunter's eye, or if ye only bought the hat." },
    { id = "n_2", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine beast. Can it hold a boar by the nose while ye reload? Because that's what it's for, whatever Karrina tells ye." },
    { id = "n_3", cat = "dwarf", when = { race = "Dwarf" },
      text = "A dwarf! Then ye were born knowing the smell of powder, and I've only to remind ye." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Ulfir Ironbeard! I teach the hunter's craft, and by that I mean shooting, because the rest is only walking about. Einris will have ye sitting on a rock, and Thorfin will have ye bandaging. Come to me when ye want to hit something." },
      },
      again = {
        { id = "hello_again1", text = "What else, eh?" },
        { id = "hello_again2", text = "Speak up, I've been near gunfire for fifty years!" },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Are you really the best shot in the city?", next = "best" },
        { text = "Gun or bow?", next = "gun" },
        { text = "Karrina says you treat pets as decoys.", next = "karrina" },
        { text = "A good shot needs no boasting.", next = "boast" },
        { text = "Tell me about the other trainers.", next = "others" },
        { text = "What's the longest shot ye've made?", next = "longest", when = { race = "Dwarf" } },
        { text = "How do I shoot with a beast in the way?", next = "beast", when = { pet = { type = "Beast" } } },
        { text = "What do the best shots learn after the first lessons?", next = "hp", when = { class = "HUNTER" } },
        { text = "A rifle's a dwarf's birthright, Ulfir.", next = "hp_dwarf", when = { race = "Dwarf", class = "HUNTER" } },
        { text = "My people never needed gunpowder to hunt.", next = "hp_elf", when = { race = "NightElf" } },
        { text = "Good day, Ulfir.", next = "END" },
      },
    },
    hp = {
      hub = true,
      lines = {
        { id = "hp_default", text = "Ha! Everythin' worth knowin'. The Aspect o' the Hawk at ten, Arcane Shot for when ye're movin', an' a good quiver or ammo pouch on yer hip so ye shoot faster than the next fellow, an' then ye spend twenty years gettin' the shot right. I've spent fifty." },
        { id = "hp_high", when = { minLevel = 40 }, text = "Ye've the mail on ye an' the look o' somebody who's put a ball through somethin' big. Ask what ye like, for I've stories enough tae answer any question twice." },
      },
      again = { { id = "hp_again", text = "Speak up! What else?" } },
      choices = {
        { text = "Quiver or ammo pouch?", next = "hp_quiver" },
        { text = "What's the Aspect of the Hawk worth?", next = "hp_hawk" },
        { text = "What should a great shot carry at the end?", next = "hp_end", when = { minLevel = 50 } },
        { text = "Something else, Ulfir.", next = "hello" },
      },
    },
    hp_quiver = {
      lines = { { id = "hpq_default", text = "Depends on what ye shoot, don't it? Arrows want a quiver an' bullets want a pouch, an' the better made it is, the quicker ye'll draw an' the more ye'll carry. Never go out with fewer than ye need, for runnin' out in a fight is the most embarrassin' way tae die I know." } },
      choices = {
        { text = "I'll carry twice what I think I'll need.", next = "BACK", reply = "Good, an' ye'll still run out one day, an' ye'll remember me sayin' this.", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_hawk = {
      lines = { { id = "hph_default", text = "Worth everythin'! Ye stand in it an' every shot lands harder, an' ye'll never take it off except tae run in the Cheetah or tae dodge in the Monkey when somethin's bitin' ye. Einris says it makes hunters careless, an' I say careless hunters were careless before they learned it." } },
      choices = {
        { text = "Hit hard and first. That's the whole game.", next = "BACK", reply = "That's my pupil! Einris will scowl at ye for a week.", fx = { align = { order = -1 } } },
        { text = "Einris has a point. Power makes people careless.", next = "BACK", reply = "Bah, she always has a point, which is the most annoyin' thing about her.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_end = {
      big = true,
      lines = { { id = "hpe_default", text = "A rifle ye'd die before ye sold, an' the Beaststalker mail if ye can find it, which means Scholomance an' Stratholme an' the spire in Blackrock. The elves'll tell ye about a bow grown by an ancient in Felwood called Rhok'delar, an' I'll believe in it when I see one fired." } },
      choices = {
        { text = "I'll bring you Rhok'delar and fire it myself.", next = "BACK", reply = "Ha! If ye do, I'll stand on Stormwind's walls an' tell everyone I taught ye.", fx = { trait = { brave = 1 } } },
        { text = "A good rifle's enough for me.", next = "BACK", reply = "Now ye're talkin' sense. Come an' have a drink sometime.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_dwarf = {
      lines = { { id = "hpd_default", text = "It is, an' don't let Einris tell ye different! Our grandfathers made the first ones in Ironforge's forges, an' there's nae sound in the world like a Bronzebeard rifle echoin' off the mountains above Kharanos." } },
      choices = {
        { text = "Then I'll make the mountains ring.", next = "BACK", reply = "That's the spirit! Mind ye don't start an avalanche, though.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_elf = {
      lines = { { id = "hpe2_default", text = "Aye, an' yer people's bows are fine things, I'll grant ye that much. But I've seen a bowstring snap in the cold, an' I've never seen powder refuse tae burn, so long as ye keep it dry." } },
      choices = {
        { text = "A bow never blew up in anyone's face.", next = "BACK", reply = "Ha! Fair point, an' I've the eyebrows tae prove it. Ye win that one.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = {
        { id = "best_1", text = "In the city, ye say? In the whole kingdom, {g:lad|lass}! I shot the pipe out of a mountaineer's mouth at eighty paces on a wager, and he's still my friend. He stands a good way off at feasts, mind." },
      },
      choices = {
        { text = "Who taught you?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught = {
      lines = {
        { id = "taught_1", text = "My mother, with a blunderbuss the size of a stovepipe, on the ice at Helm's Bed Lake. She said if I could hit a fish through a hole I could hit anything, and she was right, as she never tires of saying." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gun = {
      lines = {
        { id = "gun_1", text = "Gun! A bow's a fine thing for elves and poachers. A rifle lets the beast know it's been in a fight, and it lets everyone else in the valley know too. Thulman Flintcrag next door makes a piece that'll put a ball through a kodo, lengthwise." },
      },
      choices = {
        { text = "A gun warns every beast for a mile.", next = "quiet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = {
        { id = "quiet_1", text = "So Einris says, every night, over my ale. And I say that if the first shot's good enough ye've nae need of a second beast. We've been at it eleven years, and she's ahead on venison and I'm ahead on noise." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    karrina = {
      lines = {
        { id = "karrina_1", text = "Bah! I never said decoy, I said distraction. The beast holds the quarry's eye and I put a ball in its ear. Everybody goes home and the beast gets the liver. Karrina's boar's had more of my liver than I have." },
      },
      choices = {
        { text = "You're fond of that boar.", next = "boar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boar = {
      lines = {
        { id = "boar_1", text = "I am nae! I slip it an apple now and then, and that's only so it'll stop staring at me. Dinnae tell Karrina, or I'll never hear the end of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    boast = {
      big = true,
      lines = {
        { id = "boast_1", text = "Maybe so. But I've pupils out in Redridge and the Wetlands, and they stood their ground because some loud old dwarf told them they could. A quiet teacher makes quiet hunters. I want mine to believe they cannae miss." },
      },
      choices = {
        { text = "Confidence wins fights. Let them hear it.", next = "BACK", reply = "Ha! There's one with sense. Go on, tell Einris ye said so.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Humility keeps a hunter alive longer than pride.", next = "BACK", reply = "Ye sound like Thorfin, and he's been bitten by everything in Loch Modan. Aye, there's something in it, I suppose.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_1", text = "Einris can track a mouse over bare rock and she'll nae let ye forget it. Thorfin's sound, and slow, and he's saved my hide twice, so I'll hear nothing against him. They're the best company in this city, and dinnae tell them I said it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    longest = {
      lines = {
        { id = "longest_1", text = "Three hundred paces, across the Loch, at a threshadon that had a fisherman's boat in its teeth. I took it in the eye. The fisherman bought my ale for a year, and then he moved inland." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    beast = {
      lines = {
        { id = "beast_1", text = "Teach it to take the left, always the left, and ye shoot right. A beast that knows its side will nae cross your barrel. It takes a month of apples to teach, and I never told ye about the apples." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "They say there's a beast in the Burning Steppes with scales that'll turn a rifle ball. I've been casting a heavier ball, just in case I'm ever invited." } },
    background = { { id = "tp_background", text = "Born in Thelsamar, and raised on the Loch with a gun in my hands. I came to Stormwind because the humans were paying for teachers and there was nobody left at home that I hadnae outshot." } },
    advice = { { id = "tp_advice", text = "Squeeze the trigger, dinnae pull it, and keep both eyes open. Shut one and ye'll nae see what's coming for ye." } },
    _none = { { id = "tp_none", text = "Never shot at one, so I couldnae tell ye!" } },
  },
}

-- Thorfin Stoneshield: dwarf hunter trainer in the Dwarven District; quiet, careful, and scarred by every lesson he gives.
P:NPC {
  key = "thorfin_stoneshield", id = TODO_NPC("Thorfin Stoneshield"), name = "Thorfin Stoneshield", title = "Hunter Trainer", gender = "male",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "steady", "scarred" }, values = { "caution", "loyalty" },
  notices = { "kit", "pet", "class" },
  impression = {
    first = "Thorfin Stoneshield teaches hunters in the Dwarven District and has a scar to go with every lesson. He is slow to speak and careful, and he asks each pupil what they would do if the first shot missed.",
    third = "{name} met Thorfin Stoneshield, a dwarf who trains hunters in Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Well met. Sit, if ye like, for there's nae hurry here." },
    { id = "g_2", when = { metBefore = true }, text = "Ye've come back whole, and that's the first thing I look for." },
    { id = "g_3", when = { class = "HUNTER" }, text = "A hunter. Tell me, what's your plan when the beast doesnae fall?" },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Ye've been mauled, by the look of that jerkin. Sit down and tell me how it got close, because that's the lesson." },
    { id = "n_2", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your beast's favouring a leg. It's nae much, but look to it tonight, before it's a limp." },
    { id = "n_3", cat = "class", when = { class = "HUNTER" },
      text = "Ye stand with your back to the wall and your eye on the door. Someone's taught ye already, or something has." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Thorfin Stoneshield. Einris teaches the finding and Ulfir teaches the shooting. I teach what comes after, when the quarry turns and comes for ye. It will, sooner or later, and most hunters have never thought about it until the day." },
      },
      again = {
        { id = "hello_again1", text = "What else would ye know?" },
        { id = "hello_again2", text = "Take your time." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What do you do when the beast charges?", next = "charge" },
        { text = "You've a good many scars.", next = "scars" },
        { text = "How do you three get along?", next = "three" },
        { text = "A careful hunter never gets the great prize.", next = "careful" },
        { text = "What's the most dangerous thing you've hunted?", next = "danger" },
        { text = "What should I carry for my beast?", next = "carry", when = { pet = { type = "Beast" } } },
        { text = "Have ye hunted the Loch?", next = "loch", when = { race = "Dwarf" } },
        { text = "What will keep me alive in the years ahead, Thorfin?", next = "hp", when = { class = "HUNTER" } },
        { text = "I'm a human hunter. Folk find that odd.", next = "hp_human", when = { race = "Human", class = "HUNTER" } },
        { text = "I was raised far from these lands, beyond the sky.", next = "hp_sky", when = { race = "Skyborne", class = "HUNTER" } },
        { text = "Good day, Thorfin.", next = "END" },
      },
    },
    hp = {
      hub = true,
      lines = {
        { id = "hp_default", text = "Three things, mostly. A beast ye've kept alive long enough tae trust ye, a trap laid where the quarry will run, an' the sense tae drop and play dead when all else fails. Learn those and ye'll grow old, which is more than most of my pupils managed." },
      },
      again = { { id = "hp_again", text = "What else would ye know?" } },
      choices = {
        { text = "Tell me about traps.", next = "hp_trap", when = { minLevel = 14 } },
        { text = "Tell me about playing dead.", next = "hp_feign", when = { minLevel = 20 } },
        { text = "When should I give up leather for mail?", next = "hp_mail", when = { minLevel = 30 } },
        { text = "How do I keep my beast alive?", next = "hp_mend" },
        { text = "Something else, Thorfin.", next = "hello" },
      },
    },
    hp_trap = {
      lines = { { id = "hpt_default", text = "Lay it before the fight, not during, for a trap ye drop under yer own feet with a bear on ye does ye no good. The Freezing Trap's the best of them, and it'll hold one beast while ye deal with the other, but only if ye've put it where the second one will run." } },
      choices = {
        { text = "Plan the ground, then fight on it.", next = "BACK", reply = "Aye. Every scar I have is from forgetting that.", fx = { align = { order = 1 } } },
        { text = "Plans fall apart. I'd rather react.", next = "BACK", reply = "They do fall apart, but a broken plan's still better than none, and I'd like ye tae learn that with fewer scars than me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_feign = {
      lines = {
        { id = "hpf_default", text = "Ye'll learn it at thirty, and it's the one I'd teach first if they let me. Drop, lie still, and the thing that's killing ye will look for something else tae kill, which is usually yer beast or yer friends, so get up quickly and lay a trap where it's standing." },
        { id = "hpf_have", when = { minLevel = 30 }, text = "Ye have it by now, I hope, and I hope ye've used it. The trick's in the getting up, for ye'll want a trap down and a shot ready before the thing remembers ye." },
      },
      choices = {
        { text = "It's no shame to cheat death.", next = "BACK", reply = "None, and I've done it more times than I'll admit to Ulfir.", fx = { align = { honor = -1 } } },
        { text = "Leaving my friends to take the blow sits ill.", next = "BACK", reply = "It should, and that's why ye get up quick. A hunter who plays dead and stays down isnae a hunter.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_mail = {
      lines = { { id = "hpm_default", text = "At forty, the day ye're able, and not a day later. I wore leather too long out of pride, and this scar here's from a troll in the Hinterlands who didnae care how quick I was." } },
      choices = {
        { text = "I'll be in mail on the day.", next = "BACK", reply = "Good, and have it fitted properly, for loose mail rattles and tells the quarry where ye are.", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_mend = {
      lines = { { id = "hpme_default", text = "Mend it while it fights, not after, and stand where ye can see it. Ye'll learn Mend Pet soon enough, and Revive Pet when it fails, but a beast that's mended in time doesnae need reviving, and it trusts ye more for it." } },
      choices = {
        { text = "I'll watch it closer than the quarry.", next = "BACK", reply = "Not closer, but near as close, and that's the right instinct.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_human = {
      lines = { { id = "hph_default", text = "It's new, that's all, and new things look odd until they don't. Humans have always made good soldiers, and a hunter's mostly a soldier who listens before he shoots, so ye'll do fine if ye learn tae listen." } },
      choices = {
        { text = "I'll listen, then.", next = "BACK", reply = "Good, and start now, for ye've been tapping yer foot this whole time.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_sky = {
      lines = { { id = "hps_default", text = "So I've heard, though I'll own I didnae believe the tale till now. I'll nae ask what beasts ye hunted up there, for I'd only nod along, but the ones down here bite and claw like any beast, and the lessons I teach hold for all of them." } },
      choices = {
        { text = "Then teach me, and I'll listen.", next = "BACK", reply = "I will, and I'll start with how ye stand, for ye stand like ye expect the wind tae catch ye.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    charge = {
      lines = {
        { id = "charge_1", text = "Ye've already chosen your ground, so ye step back onto it. There's a trap laid where the beast must cross, and your pet has its flank. If ye've none of those, ye turn side-on and give it the arm ye dinnae draw with." },
      },
      choices = {
        { text = "You've given it the arm?", next = "arm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    arm = {
      lines = {
        { id = "arm_1", text = "Twice. There was a bear above Thelsamar, and a crocolisk in the Wetlands that I'd swear was waiting for me. I've the use of the arm still, and I have because I'd thought about it beforehand and didnae try to run." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    scars = {
      lines = {
        { id = "scars_1", text = "Each one's a thing I teach now, so that nobody need learn it my way. This across the brow is \"look up as well as round\". The one on my calf is \"a dead boar is nae always dead\". I've a few I dinnae show in the street." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    three = {
      lines = {
        { id = "three_1", text = "Like three hounds on one hearth. Ulfir barks, and Einris slips off and comes back with supper. I'm the old one by the fire with an eye open. They're kin to me in all but blood, and I'd nae teach anywhere else." },
      },
      choices = {
        { text = "Ulfir says you saved him twice.", next = "saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saved = {
      lines = {
        { id = "saved_1", text = "Did he say twice? It was three times, by my count. He's forgotten the ram, because he'd as soon nobody knew about the ram. I'll leave that one with him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    careful = {
      big = true,
      lines = {
        { id = "careful_1", text = "That's true enough. I've never taken the great white bear, and Ulfir tells me so at every feast. I've also buried four hunters who went after it. I'd rather teach for forty years than be a fine story told once." },
      },
      choices = {
        { text = "Coming home is the only prize that matters.", next = "BACK", reply = "Aye. I say it to every pupil, and the ones who listen come back to tell me I was right.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Better one great hunt than forty careful years.", next = "BACK", reply = "There's a kind of hunter who believes that. I've carved a good few of their names.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "danger_1", text = "A she-bear with cubs, and I'd count her above any monster. A dragon whelp will fight ye for sport. A mother fights as if the world ends behind her, and for her it does. I leave them be now, and I teach my pupils to do likewise." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = {
        { id = "carry_1", text = "Meat it likes, clean linen, and something to pack a wound that's bleeding fast. Bring water for two. Ye'd be surprised how many remember their own flask and forget the beast has a tongue." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    loch = {
      lines = {
        { id = "loch_1", text = "All my life, till I came here. I ken every cove from Thelsamar to the dam, and which ones the crocolisks sun in. If ye go home, tell the mountaineers at the Valley of Kings that Stoneshield's still breathing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "Hunters back from Duskwood tell me the wolves there stand up on their hind legs. I've told my pupils to stay north of the river until someone I trust has seen it." } },
    background = { { id = "tp_background", text = "A Loch Modan trapper, and my father before me. I started teaching the day I had to bring a friend's bow home to his wife." } },
    advice = { { id = "tp_advice", text = "Know your way out before ye take the shot. The beast already knows its own." } },
    _none = { { id = "tp_none", text = "I cannae say. I'd rather tell ye nothing than tell ye wrong." } },
  },
}

-- Maldryn: night elf druid trainer in the Park; speaks of balance inside stone walls and of the Dream to come.
P:NPC {
  key = "maldryn", id = TODO_NPC("Maldryn"), name = "Maldryn", title = "Druid Trainer", gender = "male",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "tranquil", "wry" }, values = { "balance", "patience" },
  notices = { "form", "kaldorei", "class" },
  impression = {
    first = "Maldryn teaches druids in Stormwind's Park and speaks of the Emerald Dream as a place every druid will one day be called to. He finds the city's noise restful, in the way a waterfall is, and says so with a straight face.",
    third = "{name} met Maldryn, a night elf druid who teaches in Stormwind's Park.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Sit beneath the tree, if you wish. It was here before the walls, and it does not mind them." },
    { id = "g_2", when = { metBefore = true }, text = "You return. The Park is quieter for it, or perhaps I only listen better when you are here." },
    { id = "g_3", when = { class = "DRUID" }, text = "Welcome, young druid. If you have come to learn, sit, and we will begin with your breathing before we begin with anything else." },
    { id = "dr_g_old", when = { class = "DRUID", minLevel = 40 }, text = "Ishnu-alah. You have come a long way down the road, and you still remember the way back to this tree, which is the lesson I care most about." },
  },
  notice = {
    { id = "n_1", cat = "form", when = { class = "DRUID" },
      text = "You carry the bear close beneath your skin today. Be easy. Nothing in this garden needs frightening." },
    { id = "n_form40", cat = "form", when = { class = "DRUID", minLevel = 40 },
      text = "You wear your forms easily now, and the bear no longer drags at your shoulders when you walk as yourself. That is well learned." },
    { id = "n_2", cat = "kaldorei", when = { race = "NightElf" },
      text = "Far from the boughs, {g:brother|sister}, and yet you walk as though they were overhead. Keep that." },
    { id = "n_3", cat = "class", when = { class = "MAGE" },
      text = "You draw on the arcane as one draws water from a well with no bottom. I say only that our people fell down that well once." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I am Maldryn. Even within walls of cold stone such as these, one may find tranquillity, for it is not kept in forests. Sheldras Moontree and Theridran teach here as I do, and between us this small Park holds a little of the Cenarion Circle." },
        { id = "hello_2", when = { class = "DRUID" }, text = "I am Maldryn, and I teach those the wild has called. There will come a time when the Emerald Dream takes hold of you, and you will sleep for many years and walk among the purest of forms. What I teach you now is how to wake." },
      },
      again = {
        { id = "hello_again1", text = "What else would you ask beneath this tree?" },
        { id = "hello_again2", text = "Speak. The leaves and I are listening." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "How do you find peace in a city?", next = "peace" },
        { text = "What is the Emerald Dream?", next = "dream" },
        { text = "Who else teaches in the Park?", next = "park" },
        { text = "Druids sleep while the world burns.", next = "sleep" },
        { text = "What do you make of Stormwind?", next = "city" },
        { text = "Have you walked the Dream yourself?", next = "walked", when = { class = "DRUID" } },
        { text = "Do you miss Teldrassil?", next = "teldrassil", when = { race = "NightElf" } },
        { text = "What do you teach that the others don't?", next = "teach" },
        { text = "These trees look tired to me.", next = "trees" },
        { text = "Tranquility. Is it really only stillness?", next = "d_tranq", when = { class = "DRUID", minLevel = 30 } },
        { text = "Will the Dream call me, as you said it would?", next = "d_call", when = { class = "DRUID", minLevel = 40 } },
        { text = "Elune light your path, Maldryn.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "teach_1", text = "Patience, chiefly. Theridran sends the young ones out on the road to answer the call of Moonglade, and when they return full of new shapes and new strength, I teach them to sit still inside all of it." } },
      choices = {
        { text = "Can a druid find balance inside a city?", next = "balance" },
        { text = "I'd learn that from you, Maldryn.", next = "pupil", when = { class = "DRUID" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance = {
      lines = { { id = "balance_1", text = "One may find it anywhere, for it was never in the forest to begin with. The forest only makes it easier to hear, as a quiet room makes it easier to hear your own heart." } },
      choices = {
        { text = "Then why keep a grove at all?", next = "grove" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grove = {
      lines = { { id = "grove_1", text = "Because students are young, and the young need the quiet room before they can manage without it. I was a great many years older than this city before I could keep my peace in a crowd." } },
      choices = { { text = "That gives me some hope. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    trees = {
      lines = { { id = "trees_1", text = "They are, and you have good eyes to see it. Their roots lie in soil laid over cut stone and they drink from a canal, but they grow all the same, and I count that a lesson worth more than most of mine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pupil = {
      lines = { { id = "pupil_1", text = "Then you shall, and gladly. Show me what you already know, without haste, and I will show you where your grip on it is too tight." } },
      choices = { { text = "Thank you, shan'do. Something else.", next = "BACK" } },
    },
    d_tranq = {
      lines = { { id = "dr_tranq", text = "It is stillness shared, which is much harder than stillness kept. You stand in the middle of the fight and make yourself the quietest thing in it, and everyone around you heals for it, and it is the spell I am proudest to teach and the one my students most often cast too late." } },
      choices = {
        { text = "Too late? How do I know when?", next = "d_tranq2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d_tranq2 = {
      lines = { { id = "dr_tranq2", text = "Cast it when you first think you might need it, and not when you are certain, because by then someone is already lying in the grass. Patience is not the same as waiting, and Tranquility is where most druids learn the difference." } },
      choices = { { text = "Patience isn't waiting. Something else.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },
    d_call = {
      big = true,
      lines = { { id = "dr_call", text = "It may, when you have grown strong enough that the waking world can spare you for a while, and the Circle will tell you before the Dream does. Until then, learn to wake every morning as if it mattered, because one day it will matter more than you can know." } },
      choices = {
        { text = "If the Dream calls, I'll answer it.", next = "BACK", reply = "Then you will sleep well and wake well, which is all I have ever wished for my students.", fx = { align = { order = 1 }, opinion = { druids = "dreamers" } } },
        { text = "I'll choose for myself when to sleep.", next = "BACK", reply = "Then choose wisely, and choose late. The world has had enough of druids who slept through it.", fx = { align = { order = -1 }, opinion = { druids = "slept_too_long" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = {
        { id = "peace_1", text = "I listen for what is under the noise. Beneath the carts there is the canal, and beneath the canal there is the spring that fed this hill before men came. It has not stopped. When I have found it, the bells are only weather." },
      },
      choices = {
        { text = "I can't hear anything but the carts.", next = "carts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carts = {
      lines = {
        { id = "carts_1", text = "Nor could I, for the first year. I believed I had made a mistake in coming. Then one night it rained, and I heard the hill drinking, and I have heard it ever since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = {
        { id = "dream_1", text = "It is the world as it was first shaped, green and whole, lying beside this one as a reflection lies beside a pond. Our shan'do Malfurion walks there still. Every druid who sleeps adds a little strength to the waking land." },
      },
      choices = {
        { text = "Is it safe there?", next = "safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = {
        { id = "safe_1", text = "It was. I shall say no more than that the sleepers' reports have grown troubled, and that the Circle does not speak of it before the young. Ask me again when you have earned the question." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    park = {
      lines = {
        { id = "park_1", text = "Sheldras, who is amused by humans and fond of them. Theridran watches for the young ones the wild has marked, and he sends them on to Moonglade. Shylamiir tends the herbs, and Sylista keeps the hunters' beasts under the far trees. We are a small grove, but a true one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sleep = {
      big = true,
      lines = {
        { id = "sleep_1", text = "It was said of us at Hyjal, and it was just. We slept ten thousand years while much went wrong. Yet the forests your people shelter in were held together by that sleep. Without it there would have been no world for the wakeful to defend." },
      },
      choices = {
        { text = "The quiet work matters as much as the loud.", next = "BACK", reply = "So the Circle holds. It is good to hear it from one who walks among the wakeful.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Sleep is a luxury. The living need swords now.", next = "BACK", reply = "That is why I am awake, and here, and teaching the bear to those who will use it. I have not forgotten the cost of being late.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      lines = {
        { id = "city_1", text = "It is very young, and it has been burned and built again within one of my shorter naps. I find that I admire it. Your people plant a tree knowing they will not sit in its shade, and I am not sure mine would." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    walked = {
      lines = {
        { id = "walked_1", text = "Once, for what your people would count as six hundred years. I remember it the way one remembers a colour. Waking was the harder part, for the world had moved, and I had to learn its new names like a child." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    teldrassil = {
      lines = {
        { id = "teldrassil_1", text = "I miss the height of it, and the hush. But I shall tell you something I would not say in Darnassus. That tree was grown in haste and without blessing, and there are nights I sleep easier under this plain old oak." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "The herb-gatherers say the wood to the south has darkened beyond what clouds can explain. A forest does not forget the sun unless something is teaching it to." } },
    background = { { id = "tp_background", text = "I slept through most of what your histories record. I woke for Hyjal, and I have not found it easy to lie down again." } },
    advice = { { id = "tp_advice", text = "When you are certain, wait one breath longer. The wild has never punished anyone for patience." } },
    elune = { { id = "tp_elune", text = "She shines on this city as on any other. The stone does not turn her light aside, and it only gives it more to rest on." } },
    _none = { { id = "tp_none", text = "That lies beyond what the leaves have told me." } },
  },
}

-- Theridran: night elf druid trainer in the Park; watches for the newly called and sends them on to Moonglade.
P:NPC {
  key = "theridran", id = TODO_NPC("Theridran"), name = "Theridran", title = "Druid Trainer", gender = "male",
  bible = "bibles/more_folk.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "watchful", "kindly" }, values = { "duty", "renewal" },
  notices = { "form", "kaldorei", "pet" },
  impression = {
    first = "Theridran teaches druids in Stormwind's Park and watches for the young ones the wild has lately marked, so he can send them on to Moonglade. He is kinder than he first appears, and he remembers every pupil he has pointed north.",
    third = "{name} met Theridran, a night elf druid who teaches in Stormwind's Park.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You have the look of one who is going somewhere, and I should like to know where." },
    { id = "g_2", when = { metBefore = true }, text = "You have come back, and you are changed a little. The wild does that, between visits." },
    { id = "g_3", when = { class = "DRUID" }, text = "Greetings, young druid. Let me look at you, for I can usually tell how far along the path one has come." },
    { id = "g_4", when = { questActive = TODO_QUEST("Heeding the Call") }, text = "You have heard it, then. Good. Moonglade is expecting you, and Dendrite Starblaze does not like to be kept waiting, though he will never say so." },
    { id = "dr_g_young", when = { class = "DRUID", maxLevel = 9 }, text = "Ishnu-alah, young one. There is wildness in you already, though it has no shape yet, so come to me again when it begins to press against your skin." },
  },
  notice = {
    { id = "n_1", cat = "form", when = { class = "DRUID" },
      text = "There is a bear in you that has not yet stood up. It is close. You will feel it in your shoulders first." },
    { id = "n_2", cat = "kaldorei", when = { race = "NightElf" },
      text = "Elune-adore. Tell me, when did you last stand under real boughs? You are pale for one of us." },
    { id = "n_3", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your companion trusts you, and it is not afraid of me. Both speak well of you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I am Theridran. Sheldras and Maldryn teach here as I do, but it falls to me to watch for those who are ready to be sent on. When a young druid begins to feel the great bear stir, I point them to Moonglade, where the Circle may meet them." },
        { id = "hello_done", when = { questDone = TODO_QUEST("Heeding the Call") }, text = "You have stood in Moonglade and come back, and I see it in how you carry yourself. Ask what you wish, for you have earned plainer answers now." },
        { id = "dr_hello_forty", when = { class = "DRUID", minLevel = 40 }, text = "I sent you north once with nothing but a restlessness in your shoulders, and you have come back carrying the great bear. I remember every pupil I have pointed to Moonglade, and I am glad to remember you." },
      },
      again = {
        { id = "hello_again1", text = "What else would you know?" },
        { id = "hello_again2", text = "Ask. I am not in haste." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What is Moonglade?", next = "moonglade" },
        { text = "How do you know when someone is ready?", next = "ready" },
        { text = "What do the druids do in a human city?", next = "city" },
        { text = "The Circle keeps its secrets too close.", next = "secrets" },
        { text = "What are the maple seeds for?", next = "seeds" },
        { text = "What will the bear ask of me?", next = "bear", when = { class = "DRUID" } },
        { text = "I feel the bear stirring, Theridran.", next = "stirring", when = { class = "DRUID", minLevel = 10 } },
        { text = "What is this call you speak of?", next = "call" },
        { text = "Do you remember every pupil you sent north?", next = "d_pupils", when = { class = "DRUID", minLevel = 20 } },
        { text = "Were you at Hyjal?", next = "hyjal", when = { race = "NightElf" } },
        { text = "Walk in peace, Theridran.", next = "END" },
      },
    },
    moonglade = {
      lines = {
        { id = "moonglade_1", text = "A valley between Felwood and Winterspring, where no blood is shed and every druid is welcome, of any people. Nighthaven stands by the lake there. A druid learns the way by a spell, and I am told the first journey always arrives with wet feet." },
      },
      choices = {
        { text = "Who will I meet there?", next = "meet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meet = {
      lines = {
        { id = "meet_1", text = "Dendrite Starblaze, who will speak to you of the Great Bear Spirit and will not hurry. The tauren come there too, and you will sit at one fire with them. Some of my pupils find that harder than the trial." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    call = {
      lines = { { id = "call_1", text = "Every druid hears it in time, as a restlessness that no amount of walking will settle. It is the Cenarion Circle making itself known, and it means the student is ready to be taught by greater teachers than I." } },
      choices = {
        { text = "And if a druid ignores it?", next = "ignore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ignore = {
      lines = { { id = "ignore_1", text = "Then the wildness grows with no one to shape it, and that ends badly for the druid and worse for those nearby. I have seen it only twice in all my years, and I do not mean to see it a third time among my own students." } },
      choices = {
        { text = "What became of those two?", next = "two" },
        { text = "Something else.", next = "BACK" },
      },
    },
    two = {
      lines = { { id = "two_1", text = "One was found and brought to Moonglade late, and learned at great cost what he might have learned gently. Of the other I will say only that the forest keeps her now, and that she no longer answers to her name." } },
      choices = { { text = "I'm sorry to have asked. Something else.", next = "BACK" } },
    },
    stirring = {
      lines = {
        { id = "stirring_1", text = "Then it is time. Go to Dendrite Starblaze in Nighthaven, the village of Moonglade, and tell him that Theridran judged you ready, and he will show you the rest." },
        { id = "stirring_done", when = { questDone = TODO_QUEST("Heeding the Call") }, text = "It stirred, and you answered it, and that part of your road is behind you. Whatever stirs in you now is for the Circle's elders to name, and not for me." },
      },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    d_pupils = {
      big = true,
      lines = { { id = "dr_pupils", text = "Every one, and most of them still write, though not as often as I would like. A few went to Ashenvale and did not come back, and those I remember best, because the Circle sent them where the Warsong cut and I was the one who said they were ready." } },
      choices = {
        { text = "You sent them where they were needed. That was right.", next = "BACK", reply = "So the Arch Druid tells me, and so I tell myself. On most nights it is enough.", fx = { align = { honor = 1 } } },
        { text = "Then judge the next ones more slowly.", next = "BACK", reply = "Perhaps I should, and perhaps they would hate me for it. I have not found the answer in four hundred years of asking.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ready = {
      lines = {
        { id = "ready_1", text = "They begin to stand differently, with the weight low. They grow short with fools and gentle with animals, and they sleep badly in beds. When a pupil tells me the Park feels small, I know that it is time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      lines = {
        { id = "city_1", text = "We teach, we tend the few trees, and we remind this city that it sits upon living ground. The gardeners ask us why the roses fail. The priests of the Light are courteous to us, and I think they are a little wary, which I find fair." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    secrets = {
      big = true,
      lines = {
        { id = "secrets_1", text = "We do. Some knowledge is a seed, and it rots if it is planted in cold ground. I have seen a pupil given the cat before he had learned the bear's patience, and he has not come back to himself yet." },
      },
      choices = {
        { text = "Wisdom should be given when one can carry it.", next = "BACK", reply = "That is the Circle's way, and I am glad you see the kindness in it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Knowledge hoarded by elders serves only the elders.", next = "BACK", reply = "So I said to my own shan'do, long ago, and loudly. He waited three hundred years for me to apologise.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    seeds = {
      lines = {
        { id = "seeds_1", text = "For calling a fallen friend back, when the spirit has not gone far. The seed reminds the body that things which fall may rise again. The reagent seller in the Mage Quarter looks ill whenever I explain it, so I have stopped explaining." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bear = {
      lines = {
        { id = "bear_1", text = "That you stand between the weak and what hunts them, and do not move. It is not a form for the clever. You will be struck, and you will stay. The Great Bear Spirit asks only whether you understand why." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hyjal = {
      lines = {
        { id = "hyjal_1", text = "I was, at the roots, when the wisps rose. I do not speak of it to the humans, for they lost enough there and should not have to carry our grief with theirs. Our immortality went into that tree, and I would give it again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A pupil I sent north writes that Felwood is sicker than it was last year. He was a careful boy, and he does not exaggerate." } },
    background = { { id = "tp_background", text = "I have been a watcher of the young for many centuries. I was not a great druid, but I was good at knowing who would be." } },
    advice = { { id = "tp_advice", text = "Do not seek the form. Become what the form requires, and it will come and find you." } },
    moonglade = { { id = "tp_moonglade", text = "You will go when you are called. I cannot tell you the day, and I can only promise that you will not mistake it." } },
    _none = { { id = "tp_none", text = "I do not know, and the Park has not told me." } },
  },
}

-- Sylista: night elf stable master under the trees of the Park.
P:NPC {
  key = "sylista", id = TODO_NPC("Sylista"), name = "Sylista", title = "Stable Master", gender = "female",
  bible = "bibles/more_folk.md", role = "stablemaster", tier = "service",
  communities = { "stormwind" }, temper = { "gentle", "sure" }, values = { "care", "balance" },
  notices = { "pet", "kaldorei", "class" },
  impression = {
    first = "Sylista keeps the hunters' beasts under the trees of Stormwind's Park and speaks more easily to animals than to people. She helps hunters recover lost companions, and she looks each owner over before handing one back.",
    third = "{name} met Sylista, the night elf stable master of Stormwind's Park.",
  },
  greetings = {
    { id = "g_default", text = "Greetings. I can help you recover a lost companion, or keep one safe until you return." },
    { id = "g_2", when = { metBefore = true }, text = "You are back. Your beasts knew your step before I did." },
    { id = "g_3", when = { class = "HUNTER" }, text = "Greetings, hunter. Bring your companion into the shade, and let me see how you have kept it." },
  },
  notice = {
    { id = "n_1", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} is well fed and calm. Whoever taught you taught you rightly." },
    { id = "n_2", cat = "kaldorei", when = { race = "NightElf" },
      text = "Ishnu-alah. It is good to hear a nightsaber purr at a familiar voice, even here." },
    { id = "n_3", cat = "class", when = { class = "DRUID" },
      text = "The beasts turn their heads when you pass, as they do for the wind. Sit with them a while, if you have time." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I am Sylista. Jenova Stoneshield keeps the stable in the Dwarven District, and I keep this one, for hunters who would rather their beasts slept under leaves than under a roof. Most of my charges came across the sea with their masters." },
      },
      again = {
        { id = "hello_again1", text = "What else would you ask?" },
        { id = "hello_again2", text = "Speak softly, please. The owl has only now settled." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "I need to stable my pet.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What beasts do you keep here?", next = "beasts" },
        { text = "How does a wild thing bear a city?", next = "bear" },
        { text = "Who are your neighbours in the Park?", next = "park" },
        { text = "A beast belongs in the wild, not in a stable.", next = "wild" },
        { text = "Do the city's children trouble the animals?", next = "children" },
        { text = "My companion grows restless in town.", next = "restless", when = { pet = { type = "Beast" } } },
        { text = "What became of your own saber?", next = "saber", when = { race = "NightElf" } },
        { text = "Elune keep you, Sylista.", next = "END" },
      },
    },
    beasts = {
      lines = {
        { id = "beasts_1", text = "Nightsabers and owls, for the most part, and a great bear from Ashenvale whose mistress is in Redridge. There is a boar a dwarf left with me, saying Jenova's stalls were full. It has eaten two of my baskets, and I have grown fond of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bear = {
      lines = {
        { id = "bear_1", text = "Poorly, at first. The bells are the worst, and then the smell of the forges. I walk each new one round the canal at night until it knows the place has edges. A beast can bear almost anything once it has found where the walls are." },
      },
      choices = {
        { text = "And the ones that can't?", next = "cant" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cant = {
      lines = {
        { id = "cant_1", text = "I tell the hunter so, plainly, and I do not take the coin. There was a frostsaber last winter that would not eat. Its master carried it home to Winterspring herself, and she was right to." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    park = {
      lines = {
        { id = "park_1", text = "The druids, who are quiet company, and Shylamiir among her herbs. The priestess Nara sings in the evening, and the owls answer her. The Grant girls bring apples for the bear. I have asked them to stop, and I do not mean it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wild = {
      big = true,
      lines = {
        { id = "wild_1", text = "I thought so, when I was a Sentinel and had not yet kept one. A companion beast has chosen, as surely as its hunter has. Still, I watch for the ones that were only taken, and those I will speak for." },
      },
      choices = {
        { text = "A bond freely given is no cage.", next = "BACK", reply = "So I have found. The door of every stall here is latched from the inside as much as the out.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A tamed beast is a slave that cannot say so.", next = "BACK", reply = "Some are. I have told more than one hunter so to their face, and I kept the beast until they understood.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    children = {
      lines = {
        { id = "children_1", text = "They come to stare at the sabers, and the sabers stare back, and neither has yet lost. There is a girl who reads aloud to the owl. I do not know what the owl makes of human letters, but it has not missed a reading." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    restless = {
      lines = {
        { id = "restless_1", text = "Then it needs ground that gives under the paw. Take it out of the gate to the Elwynn woods before dawn, and let it run until it turns back of its own will. One hour of that is worth a week of rest in a stall." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    saber = {
      lines = {
        { id = "saber_1", text = "She died at Hyjal, under me. I have not ridden since, and I found I would rather tend than choose again. Each one that comes through that gate has a little of her manner, and I think they all do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "Hunters from the south say their beasts will not cross a certain bridge into Duskwood after dark. I would trust the beasts." } },
    background = { { id = "tp_background", text = "I rode with the Sentinels of Ashenvale until the war. Afterward I wanted to keep things alive, and beasts were what I understood." } },
    advice = { { id = "tp_advice", text = "Feed your companion with your own hand. A beast does not forget who fed it, and it ought not to." } },
    _none = { { id = "tp_none", text = "I do not know. The animals have not mentioned it." } },
  },
}

-- Roberto Pupellyverbos: keeps the cellar at the Gallina Winery and sells merlot by the cask.
P:NPC {
  key = "roberto_pupellyverbos", id = TODO_NPC("Roberto Pupellyverbos"), name = "Roberto Pupellyverbos", title = "Merlot Connoisseur", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "passionate", "fussy" }, values = { "craft", "tradition" },
  notices = { "drink", "class", "craft" },
  impression = {
    first = "Roberto Pupellyverbos keeps the cellar of the Gallina Winery and speaks of merlot as other men speak of their children. He counts his barrels twice a day and has been known to lock himself in with the good vintage.",
    third = "{name} met Roberto Pupellyverbos, cellar-keeper and merlot connoisseur of the Gallina Winery in Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, welcome! Mind the barrels, please. I have counted them, and I shall count them again when you leave." },
    { id = "g_2", when = { metBefore = true }, text = "Ah, you return to the cellar! Then your palate is not beyond saving." },
    { id = "g_3", when = { questActive = TODO_QUEST("Dry Times") }, text = "You have come for Lakeshire's cask! It has been waiting, and I have turned it every week so that it should not sulk." },
  },
  notice = {
    { id = "n_1", cat = "drink", when = { drunk = true },
      text = "You have been drinking ale. I can smell it, and it grieves me. Sit, and let me show you what the grape can do." },
    { id = "n_2", cat = "class", when = { class = "MAGE" },
      text = "You will not chill anything in this cellar, I beg you. The last apprentice who tried is still spoken of, and not kindly." },
    { id = "n_3", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you will know never to put a great merlot in a stew. A good one, yes, but a great one would be murder." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Roberto Pupellyverbos. Suzetta keeps the books, Julia keeps the counter, Renato shouts in the square, and I keep the cellar, which is the only part that matters. I know merlot as no other man in the kingdom does, and I will tell you so at length." },
      },
      again = {
        { id = "hello_again1", text = "What more would you know? I have all day and so has the wine." },
        { id = "hello_again2", text = "Go on, the barrels do not mind." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "I'd like to buy some wine.", next = "BUSINESS" },
        { text = "What makes a merlot great?", next = "great" },
        { text = "Tell me about the vineyard.", next = "vineyard" },
        { text = "They say you lock yourself in the cellar.", next = "lock" },
        { text = "Wine is a rich man's indulgence.", next = "rich" },
        { text = "Who sends for your casks?", next = "casks" },
        { text = "I hunt. What of the boars in your vines?", next = "boars", when = { class = { "HUNTER", "DRUID" } } },
        { text = "I'm taking the cask to Lakeshire.", next = "lakeshire", when = { questActive = TODO_QUEST("Dry Times") } },
        { text = "Good day, Roberto.", next = "END" },
      },
    },
    great = {
      lines = {
        { id = "great_1", text = "Patience, and a hillside that faces the morning. The grape must struggle a little, in thin soil, or it grows fat and stupid. Then it goes into oak for five years, and you do not open it early because your sister-in-law is short of coin." },
      },
      choices = {
        { text = "Suzetta opens them early?", next = "early" },
        { text = "Something else.", next = "BACK" },
      },
    },
    early = {
      lines = {
        { id = "early_1", text = "She tried, once, with the vintage of the year the city was rebuilt. I stood in front of the cask. We did not speak for a week, and the wine is magnificent now, and she has never admitted it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    vineyard = {
      lines = {
        { id = "vineyard_1", text = "The old Maclure slopes in Elwynn supply us, and the vines there are older than I am. This year there are thieves in the rows, in red masks, and the pickers will not go out at dusk. I read each delivery note with my heart in my mouth." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lock = {
      lines = {
        { id = "lock_1", text = "Twice, perhaps three times. When Suzetta speaks of selling the reserve to pay a tax, a man must take a position, and mine is behind a locked door with a glass. Julia brings me bread, and Renato sings through the keyhole." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rich = {
      big = true,
      lines = {
        { id = "rich_1", text = "No, no, I do not allow this. The lord's cook buys my reserve, yes. But the small red I send to the taverns costs less than ale. A mason who drinks it at his daughter's wedding has had the same joy as any count." },
      },
      choices = {
        { text = "Good things should be within every man's reach.", next = "BACK", reply = "Yes! This is why I make the small red with the same care. You understand wine, my friend.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The poor need bread, not vintages.", next = "BACK", reply = "They need both. A life that is only bread is not much of one, and I say so as a man who has been hungry.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    casks = {
      lines = {
        { id = "casks_1", text = "The Gilded Rose, the Blue Recluse, the Keep when there is a banquet. Barkeep Daniels in Lakeshire has written to me for twenty years in a terrible hand. His letters have stopped coming, and I do not like to think why." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    boars = {
      lines = {
        { id = "boars_1", text = "Ah, the boars! They take the low grapes, and Suzetta wants a fence. I say the boars were on that hill before the Maclures, and the vines grew well beside them for a hundred years. I will not have them slaughtered for a few bunches." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lakeshire = {
      lines = {
        { id = "lakeshire_1", text = "Then carry it gently, on the shoulder and not under the arm. Do not let it stand in the sun at Three Corners. Tell Daniels that Roberto asks why he no longer writes, and that the next cask is already resting." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A man in a good coat offered to buy the whole reserve, unseen, for a \"private cellar in Westfall\". Nobody in Westfall has a cellar left, so I told him it was not for sale." } },
    background = { { id = "tp_background", text = "My grandfather pressed grapes for the old kings, and my father for the regent Lothar. I have pressed them for this family, which feeds me and exasperates me in equal measure." } },
    advice = { { id = "tp_advice", text = "Never drink a wine in the mood you bought it in. Let it rest, and let yourself rest also." } },
    _none = { { id = "tp_none", text = "Of that I know nothing. Ask me about the year the frost came late, and I can tell you everything." } },
  },
}

-- Bernard Gump: sells flowers at Fragrant Flowers on the canals, beside Felicia.
P:NPC {
  key = "bernard_gump", id = TODO_NPC("Bernard Gump"), name = "Bernard Gump", title = "Florist", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "gentle", "fretful" }, values = { "beauty", "peace" },
  notices = { "craft", "class", "kit" },
  impression = {
    first = "Bernard Gump sells flowers at Fragrant Flowers on the canals and frets over every stem as though it had a fever. He can tell what a bouquet is for before the customer says, and lately he sells more for graves than for weddings.",
    third = "{name} met Bernard Gump, florist at Fragrant Flowers on Stormwind's canals.",
  },
  greetings = {
    { id = "g_default", text = "Good day! Do come in, and mind the buckets. The roses have only just had their water." },
    { id = "g_2", when = { metBefore = true }, text = "Hello again. Did they like the flowers? I do worry, once they've left the shop." },
    { id = "g_3", when = { timeOfDay = "night" }, text = "We're nearly shut, but I've a few stems that won't last till morning, and they ought to go to someone." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Herbalism" },
      text = "You pick, don't you? There's green on your fingers. Felicia buys herbs for the pot, and I only envy you the fields." },
    { id = "n_2", cat = "class", when = { class = "DRUID" },
      text = "Oh, they've all turned toward you, look at them. They've never once done that for me, and I water them daily." },
    { id = "n_3", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You've come straight from somewhere dreadful, haven't you? Sit a moment among the lilies. It helps." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Bernard Gump, and this is Fragrant Flowers. Felicia sells the herbs for the alchemists and I sell the flowers for everyone else. We're the one shop on the canals that smells better than the water, and I'm rather proud of that." },
      },
      again = {
        { id = "hello_again1", text = "What else can I tell you?" },
        { id = "hello_again2", text = "Go on, I'm only trimming." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "Let me see the flowers.", next = "BUSINESS" },
        { text = "Can you guess what a bouquet is for?", next = "guess" },
        { text = "Where do your flowers come from?", next = "from" },
        { text = "You and Felicia share the shop?", next = "felicia" },
        { text = "Flowers are a waste of coin in wartime.", next = "waste" },
        { text = "What sells most these days?", next = "sells" },
        { text = "Something in your shop is wilting for want of light.", next = "wilt", when = { class = "DRUID" } },
        { text = "Why do some herbs refuse a garden?", next = "garden", when = { profession = "Herbalism" } },
        { text = "Good day, Bernard.", next = "END" },
      },
    },
    guess = {
      lines = {
        { id = "guess_1", text = "Nearly always. A young man who can't choose is courting. A woman who chooses quickly and pays without looking is going to the cemetery. And a husband who asks what's most expensive has done something he oughtn't." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    from = {
      lines = {
        { id = "from_1", text = "The roses come from our own beds outside the wall, and the wildflowers from Elwynn's meadows, which children pick for a copper a basket. The black roses I'll not tell you about. It was a single cutting from a traveller, and it likes the shade." },
      },
      choices = {
        { text = "Where had the traveller come from?", next = "black" },
        { text = "Something else.", next = "BACK" },
      },
    },
    black = {
      lines = {
        { id = "black_1", text = "From the south, from Duskwood, he said. He looked as though he hadn't slept since. I ought not to like them, and they sell better than anything in the shop. Felicia says that tells you something about the city." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    felicia = {
      lines = {
        { id = "felicia_1", text = "She has the sense and I have the watering can. She knows what every herb does, and I know what every flower means, and between the two of us a customer can be cured or consoled. I'd be lost without her, and I've told her so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    waste = {
      big = true,
      lines = {
        { id = "waste_1", text = "I've had that said to me by a sergeant, who came back the next day for a wreath. People need to mark things, friend. A flower says what can't be got out in words, and there's more of that about in a war." },
      },
      choices = {
        { text = "Beauty is a need, most of all in hard times.", next = "BACK", reply = "Thank you. I do tell myself so, when the news is bad and I'm arranging lilies.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Coin spent on petals is coin not spent on bread.", next = "BACK", reply = "That's so, and I'll not argue. I do give the day's leavings to the orphanage, for what it's worth.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = {
        { id = "sells_1", text = "White roses, and I wish it were otherwise. A year ago it was red for sweethearts and wildflowers for tables. Now it's wreaths for sons who went to Redridge. I've learned to tie them without the ribbon shaking." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wilt = {
      lines = {
        { id = "wilt_1", text = "The fern at the back, I know, I know. The canal wall takes the afternoon sun. I've moved it four times. If you'd have a word with it, I'd be more grateful than I can say." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    garden = {
      lines = {
        { id = "garden_1", text = "Felicia says some of them want to be found and not kept. Kingsblood will grow in a bed, sulking, and have no strength in it at all. The alchemists can tell at once, and they send it back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "The Keep ordered a hundred white lilies and wouldn't say for whom. There's been no funeral cried, so I've kept them in water and wondered." } },
    background = { { id = "tp_background", text = "My mother grew roses for the old Cathedral, before the war. I saved her cuttings in a wet sack when the city fell, and every rose I sell comes down from those." } },
    advice = { { id = "tp_advice", text = "Cut the stems under water, at a slant. And tell them who the flowers are for, because I think it matters." } },
    _none = { { id = "tp_none", text = "I'm afraid I wouldn't know. I spend my days with things that don't gossip." } },
  },
}

-- Rebecca Laughlin: sells and designs guild tabards at the Stormwind Visitor's Center, beside Aldwin Laughlin.
P:NPC {
  key = "rebecca_laughlin", id = TODO_NPC("Rebecca Laughlin"), name = "Rebecca Laughlin", title = "Tabard Vendor", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk", "opinionated" }, values = { "loyalty", "craft" },
  notices = { "status", "noble", "kit" },
  impression = {
    first = "Rebecca Laughlin sells tabards at the Stormwind Visitor's Center, where Aldwin registers the guilds, and has firm views on every colour a company might choose. She says she can tell how long a guild will last by its crest.",
    third = "{name} met Rebecca Laughlin, who sells guild tabards at the Stormwind Visitor's Center.",
  },
  greetings = {
    { id = "g_default", text = "Good day. If you've a guild, I've a tabard for it, and if you've no guild, Aldwin's at the next desk." },
    { id = "g_2", when = { metBefore = true }, text = "Back again? Don't tell me they've voted to change the colours, because I warned them." },
    { id = "g_3", when = { guild = true }, text = "Ah, you belong to someone already. Let me see what you've been made to wear." },
  },
  notice = {
    { id = "n_1", cat = "status", when = { guild = true },
      text = "You've a company at your back, and it shows in how you stand. Whether they dress you decently is another question." },
    { id = "n_2", cat = "noble", when = { origin = "human_minor_noble" },
      text = "You were raised with a crest, weren't you? Then you'll know better than to put a boar's head on purple." },
    { id = "n_3", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Whatever colours you march under, friend, they're mostly mud at present." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Rebecca Laughlin. Aldwin signs the charters and I dress the guilds that come of them. I've made tabards for companies that went on to great things and for some that broke up at the door, and I could tell which would be which." },
      },
      again = {
        { id = "hello_again1", text = "What else?" },
        { id = "hello_again2", text = "Go on, I'm only pinning." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "Let me see the tabards.", next = "BUSINESS" },
        { text = "You can tell a guild's future from its crest?", next = "future" },
        { text = "What's the worst design you've made?", next = "worst" },
        { text = "Tell me about Aldwin.", next = "aldwin" },
        { text = "Guilds are only sellswords with a flag.", next = "flag" },
        { text = "What do the colours mean?", next = "colours" },
        { text = "What would you put on my guild's tabard?", next = "mine", when = { guild = true } },
        { text = "Good day, Rebecca.", next = "END" },
      },
    },
    future = {
      lines = {
        { id = "future_1", text = "Near enough. A company that argues for a week over the crest will argue over everything. One that lets the founder choose alone will lose half its members by midsummer. The ones that last walk in already agreed, and they pick something plain." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = {
        { id = "worst_1", text = "Bright orange, with a pink border and a skull upon it. I asked them twice. The founder said it would strike fear into the enemy. I've heard they were seen in Westfall, and that the Defias laughed so hard two of them were captured." },
      },
      choices = {
        { text = "You made it anyway?", next = "anyway" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anyway = {
      lines = {
        { id = "anyway_1", text = "I did. I sell the tabard, and the taste is their own affair. I did charge them for the extra dye, and I'd do so again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    aldwin = {
      lines = {
        { id = "aldwin_1", text = "My husband, and the most patient man in Stormwind. He has explained a guild charter ten thousand times and never once sighed. He does his sighing at home." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    flag = {
      big = true,
      lines = {
        { id = "flag_1", text = "Some are, and I've dressed those too. But I've seen a company of strangers put on one colour and stand by each other in the Stockade riots when the watch was stretched thin. A flag changes people, if they let it." },
      },
      choices = {
        { text = "A banner makes strangers into comrades.", next = "BACK", reply = "That's what I sell, in the end. The cloth is only how I charge for it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Armed companies answer to no one but their purse.", next = "BACK", reply = "There's truth in that, and Aldwin loses sleep over it. The charter binds them to the crown's law, for what a paper's worth.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    colours = {
      lines = {
        { id = "colours_1", text = "Blue and gold say Stormwind, and half my customers want them for that. Black says they think they're dangerous. White never stays white. And red I'll not sell without a border, since the trouble in Westfall began." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mine = {
      lines = {
        { id = "mine_1", text = "Tell me first what you'd die for, and I'll tell you the colour. If you can't answer, we'll use grey for now, and you'll come back when you know." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A man ordered forty plain red tabards and no crest. I told him I'd need a charter number, and he left without a word. I've told the watch." } },
    background = { { id = "tp_background", text = "A herald's daughter, and I learned blazon before my letters. There's no call for heralds now, so I dress adventurers." } },
    advice = { { id = "tp_advice", text = "Choose a colour you can stand to see on forty people. And never let a committee draw the crest." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Aldwin might have it written down somewhere." } },
  },
}

-- Melris Malagan: captain of the city guard, posted in the Trade District square with the recruiter Justine Demalier.
P:NPC {
  key = "melris_malagan", id = TODO_NPC("Melris Malagan"), name = "Melris Malagan", title = "Captain of the Guard", gender = "male",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "stormwind" }, temper = { "stern", "weary" }, values = { "duty", "order" },
  notices = { "kit", "stealth", "rank" },
  impression = {
    first = "Melris Malagan commands the city guard from the Trade District square and reads every face that crosses it. He is courteous and tired, and he says he has half the guards he needs for a city this size.",
    third = "{name} met Captain Melris Malagan, who commands Stormwind's city guard from the Trade District square.",
  },
  greetings = {
    { id = "g_default", text = "Citizen. Keep the peace and you'll have no quarrel with my guards." },
    { id = "g_2", when = { metBefore = true }, text = "You again. No complaints against you yet, which is more than I can say for most." },
    { id = "g_3", when = { origin = "human_city_guard" }, text = "I know that stance, and you've worn the tabard. It's good to see one of ours." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You've been fighting. So long as it wasn't inside my walls, I'll not ask." },
    { id = "n_2", cat = "stealth", when = { class = "ROGUE" },
      text = "You marked every guard on this square before you reached me. I marked you doing it." },
    { id = "n_3", cat = "rank", when = { pvpRank = { min = 6 } },
      text = "An officer of the Alliance. Then I'll speak plainly to you, sir, as I can't to the merchants." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Captain Melris Malagan, of the city guard. I've this square and every street that leads off it to answer for. Justine Demalier finds me recruits, General Jonathan has the gates, and I make do with what's left between them." },
      },
      again = {
        { id = "hello_again1", text = "What else, citizen?" },
        { id = "hello_again2", text = "Go on. I can listen and watch." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "How does the city stand, Captain?", next = "stand" },
        { text = "What troubles the guard most?", next = "troubles" },
        { text = "Tell me about your officers.", next = "officers" },
        { text = "The watch protects the rich districts first.", next = "rich" },
        { text = "What's the word from the Stockade?", next = "stockade" },
        { text = "You're short of men. Where did they go?", next = "short", when = { origin = "human_city_guard" } },
        { text = "You watched me cross the square.", next = "watched", when = { class = "ROGUE" } },
        { text = "I'll leave you to it, Captain.", next = "END" },
      },
    },
    stand = {
      lines = {
        { id = "stand_1", text = "Quiet enough by day. The markets are full and the nobles are content, and that's what the Keep likes to hear. I walk Old Town and the canals after dark, and I give a different report then. Nobody at the Keep has asked for that one." },
      },
      choices = {
        { text = "What's different after dark?", next = "dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dark = {
      lines = {
        { id = "dark_1", text = "Cutpurses, which is only a city being a city. But there's red cloth found in gutters, and men who know the patrols too well. Somebody inside these walls is telling the Defias when my guards change, and I've not yet found who." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    troubles = {
      lines = {
        { id = "troubles_1", text = "Numbers. The regiments went to Redridge and the Steppes passes and took the best of my sergeants with them. I've boys of seventeen holding halberds on the bridges. They're brave enough, but nobody will be frightened of them for years yet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    officers = {
      lines = {
        { id = "officers_1", text = "Brady, Jaxon and Pomeroy walk the districts for me, and they're sound men, all three. Pomeroy knows the Mage Quarter and Jaxon knows every stallholder by name. Brady's said perhaps ten words to me in his life, and every one was worth hearing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rich = {
      big = true,
      lines = {
        { id = "rich_1", text = "That's a hard charge, and I've made it myself, to my betters. I'm ordered to keep four guards on the Keep road for each one on the canals. I move them after dark, and I've not been caught at it." },
      },
      choices = {
        { text = "Bending a bad order to guard the poor is right.", next = "BACK", reply = "I hope the Light sees it so. A court-martial wouldn't, and I've made my peace with that.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Orders are orders, Captain. Even those.", next = "BACK", reply = "So my old commander would have said. He never walked the canals at midnight, though.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stockade = {
      lines = {
        { id = "stockade_1", text = "Thelwater says it's in hand, and Thelwater's a good man who's being lied to by his own turnkeys. There are Defias in there who get news quicker than I do. I'd empty the place and start again, if it were my decision." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = {
        { id = "short_1", text = "North, east and south, in that order, and none have been replaced. You'll remember when there were two to a gate tower. It's one now, and he takes his supper standing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    watched = {
      lines = {
        { id = "watched_1", text = "I did. You don't walk like a thief, though. You walk like someone who was taught, and there's only one house in Old Town that teaches. I'll assume we serve the same crown, and say no more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "I hear the House of Nobles means to vote the guard's wages down again. I'd ask who gains by a hungry watch, but I've a fair notion." } },
    defias = { { id = "tp_defias", text = "They're inside the walls. I'll not say that to a merchant, but you asked me straight." } },
    background = { { id = "tp_background", text = "Twenty-two years in the guard, from gate-boy up. I was on the wall the night the Stonemasons rioted, and I've not thought well of the House of Nobles since." } },
    advice = { { id = "tp_advice", text = "If you see something amiss in this city, tell a guard, and then tell a second one." } },
    _none = { { id = "tp_none", text = "That's not a guard matter, citizen, or not yet." } },
  },
}

-- Caretaker Folsom: old caretaker of the murdered Flintridge family, by the canal near the Park; part of the Legend of Stalvan.
P:NPC {
  key = "caretaker_folsom", id = TODO_NPC("Caretaker Folsom"), name = "Caretaker Folsom", gender = "male",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "sorrowful", "dutiful" }, values = { "loyalty", "memory" },
  notices = { "noble", "light", "travel" },
  impression = {
    first = "Caretaker Folsom kept the Flintridge estate, as his father did, until the family was murdered and their goods went to auction. He stands by the canal near the Park with nothing left to keep, and he is still ashamed of the sale.",
    third = "{name} met Caretaker Folsom, the old servant of the murdered Flintridge family, by Stormwind's canals.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. Forgive me if I'm slow to answer. I've little cause to talk these days, and I'm out of the habit." },
    { id = "g_2", when = { metBefore = true }, text = "You've come back. Not many do, to an old servant with no house." },
    { id = "g_3", when = { questActive = TODO_QUEST("The Legend of Stalvan") }, text = "You've a look I know. You've come about the Flintridges, haven't you? I wondered if anyone ever would." },
    { id = "g_4", when = { questDone = TODO_QUEST("The Legend of Stalvan") }, text = "They say the Mistmantle matter is ended, down in Duskwood. Thank you. I didn't think I'd live to hear it." },
  },
  notice = {
    { id = "n_1", cat = "noble", when = { origin = "human_minor_noble" },
      text = "You've been raised in a house with servants. I can tell by the way you waited for me to speak first. It's kind of you, and there's no need for it now." },
    { id = "n_2", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "If you've a prayer to spare, there's a family in the Cathedral's ground that I visit every week. I'm not sure my own prayers carry." },
    { id = "n_3", cat = "travel", when = { minLevel = 25 },
      text = "You've the dust of the south road on you. If you've been through Duskwood, then you've walked near where it happened." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Folsom is my name. I was caretaker to the Flintridge family, and my father before me. They're all dead now. They were murdered in their summer house in the south by a man they had taken in. I was here in the city, minding the town house, and so I'm alive." },
        { id = "hello_2", when = { questActive = TODO_QUEST("The Legend of Stalvan") }, text = "Folsom, caretaker to the Flintridges that were. You're following the name Mistmantle, then. He was the children's tutor, and I showed him to his rooms myself. I've had a long time to think on that." },
        { id = "hello_3", when = { questDone = TODO_QUEST("The Legend of Stalvan") }, text = "Folsom, the Flintridges' caretaker. You've done what the watch and the crown never troubled to do. I told the family, at the stone, and I think it was heard." },
      },
      again = {
        { id = "hello_again1", text = "Was there more you wished to ask?" },
        { id = "hello_again2", text = "Go on. I've nothing but time." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "Tell me about the Flintridges.", next = "family" },
        { text = "Who was Stalvan Mistmantle?", next = "stalvan" },
        { text = "What became of the estate?", next = "estate" },
        { text = "You speak as if their deaths were your fault.", next = "fault" },
        { text = "Where should I look next?", next = "next", when = { questActive = TODO_QUEST("The Legend of Stalvan") } },
        { text = "I saw him ended, Folsom. He's gone.", next = "ended", when = { questDone = TODO_QUEST("The Legend of Stalvan") } },
        { text = "I know what it is to lose a household.", next = "household", when = { origin = { "human_lordaeron_refugee", "human_minor_noble" } } },
        { text = "Good day, Folsom.", next = "END" },
      },
    },
    family = {
      lines = {
        { id = "family_1", text = "They were gentle people. His lordship collected books, and her ladyship kept bees. There was a son, and a daughter of seventeen named Tilloa, who was cleverer than both her parents and kinder than either. They summered by the lake at Moonbrook, in Westfall." },
      },
      choices = {
        { text = "Tell me about Tilloa.", next = "tilloa" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tilloa = {
      lines = {
        { id = "tilloa_1", text = "She learned everything her tutor could teach in a season, and then she fell in love, with a young lord and not with the tutor. That was the whole of her offence. She was buried in her betrothal dress, and I chose the stone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stalvan = {
      lines = {
        { id = "stalvan_1", text = "He was a schoolmaster from Moonbrook, well spoken and well recommended. He was a quiet man who watched too closely. I took that for attentiveness. He came to love the girl, and when she didn't love him, he took an axe to the whole house." },
      },
      choices = {
        { text = "What happened to him after?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = {
        { id = "after_1", text = "He went into the dark wood, and nobody followed. There were no Flintridges left to demand it, and the crown had a war to mind. I wrote to the Keep eleven times. I've the replies, and each is shorter than the last." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    estate = {
      lines = {
        { id = "estate_1", text = "It lay shut up, until the family's money was gone and the creditors came. Then it fell to me to see it all to auction. There were his books and her hives, and the girl's writing desk. I packed every crate myself, so that it should be done with respect." },
      },
      choices = {
        { text = "Was anything of Stalvan's sold?", next = "crate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crate = {
      lines = {
        { id = "crate_1", text = "His things were crated with the rest, for nobody would touch them. Some went unsold, and they sit yet in the storehouse here by the canal. I never opened his papers. I couldn't bear to know how long he'd been thinking of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fault = {
      big = true,
      lines = {
        { id = "fault_1", text = "I opened the door to him. I carried his bag up the stair and told the mistress he seemed a steady sort. A servant's whole craft is in judging who comes into a house, and I judged wrong, once." },
      },
      choices = {
        { text = "You couldn't have known. The guilt is his alone.", next = "BACK", reply = "So the priests have told me. It's easier to hear it from someone who has looked into the matter. Thank you.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "You did judge wrong. Better to carry that honestly.", next = "BACK", reply = "Aye, and so I do. I'd not want it lifted off me altogether, and you're the first who hasn't tried.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    next = {
      lines = {
        { id = "next_1", text = "There's a sealed crate of his in the storehouse behind me, unsold. Whatever he wrote will be in it. And there's old Marshal Haggard, at Eastvale in Elwynn, who was at Moonbrook in those days and knew the man. He's blind now, but his memory is whole." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ended = {
      lines = {
        { id = "ended_1", text = "Then I can stop writing letters. I'll go to the stone on Sunday and tell them properly, with flowers, and after that I think I may find some small work. A house, somewhere, with living people in it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    household = {
      lines = {
        { id = "household_1", text = "Then you'll know there's nobody to tell you that you may stop. You wake and lay out a day's work for people who aren't there. I'm sorry for yours, whoever they were." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stalvan = { { id = "tp_stalvan", text = "A tutor who murdered the family that housed him, and walked off into Duskwood. That's all there is, and it's taken my whole life since." } },
    rumors = { { id = "tp_rumors", text = "They say the dead don't lie still in the south. If that's so, I pray the Flintridges were buried here, in the Cathedral's ground, for a reason." } },
    background = { { id = "tp_background", text = "Born in the Flintridge servants' hall, and I meant to die there. I've a rented room on the canal now, and I keep it very clean, from habit." } },
    advice = { { id = "tp_advice", text = "Look twice at whoever you let through your door. And then forgive yourself, if you can, for I've not managed it." } },
    _none = { { id = "tp_none", text = "I wouldn't know, I'm sorry. I knew one house, and it's gone." } },
  },
}

-- Tyrion: gnome agent in the Keep's garden with his spybot; old friend of Elling Trias; runs the trap for Lord Lescovar.
P:NPC {
  key = "tyrion", id = TODO_NPC("Tyrion"), name = "Tyrion", gender = "male",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp", "impatient" }, values = { "loyalty", "cunning" },
  notices = { "gnome", "stealth", "craft" },
  impression = {
    first = "Tyrion is a gnome who tinkers with a clockwork spy in the gardens of Stormwind Keep and does not care to say why. He is an old friend of Elling Trias, and he times everything to the second.",
    third = "{name} met Tyrion, a gnome working on a clockwork device in the gardens of Stormwind Keep.",
  },
  greetings = {
    { id = "g_default", text = "Shh! Not so loud. I'm a gardener, as far as anyone here knows, and gardeners don't get visitors." },
    { id = "g_2", when = { metBefore = true }, text = "You again. Stand behind the hedge this time, will you? You're taller than the roses." },
    { id = "g_3", when = { questActive = TODO_QUEST("Infiltrating the Castle") }, text = "Trias sent you? It's about time, because I've been pruning the same bush for three days, and it's nearly gone." },
    { id = "g_4", when = { questActive = TODO_QUEST("The Attack!") }, text = "It's now or never. Stay put, keep quiet, and don't move until I say. The spybot goes in first." },
  },
  notice = {
    { id = "n_1", cat = "gnome", when = { race = "Gnome" },
      text = "A gnome, good! You'll understand a tolerance of a tenth of a second, then, and I shan't have to explain it with my hands." },
    { id = "n_2", cat = "stealth", when = { class = "ROGUE" },
      text = "You came through the garden without setting off my tripwire. Either you're good, or it's broken, and I checked it this morning." },
    { id = "n_3", cat = "craft", when = { profession = "Engineering" },
      text = "You're an engineer? Then don't touch the spybot, please. I know that look, and the answer's no." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Tyrion. I'm an associate of Elling Trias, from before he took up cheese, and I'm here on a matter that concerns the crown and one of its lords. This contraption beside me is the cleverest thing in the Keep, and I'm including the people." },
        { id = "hello_2", when = { questActive = TODO_QUEST("Items of Some Consequence") }, text = "Tyrion. The spybot needs a disguise before it can walk past the guards, and I can't leave this garden to fetch the parts. So you're my legs. Be quick, and don't tell anyone what they're for." },
        { id = "hello_3", when = { questActive = TODO_QUEST("The Attack!") }, text = "Tyrion, and we've no time for introductions. Lescovar meets his contact in this garden today. My spybot will send the guards away, and then the two of them are yours. Wait for my signal." },
        { id = "hello_4", when = { questDone = TODO_QUEST("The Attack!") }, text = "Tyrion. Well, that was messier than my calculations, but the answer came out right. Lescovar won't be selling the kingdom's secrets to the Defias again. Trias and Shaw will want to hear it from you." },
      },
      again = {
        { id = "hello_again1", text = "What else? Keep it short, the patrol's due." },
        { id = "hello_again2", text = "Go on, quietly." },
        { id = "hello_again3", text = "Yes, yes?" },
      },
      choices = {
        { text = "What are you really doing here?", next = "doing" },
        { text = "Tell me about the spybot.", next = "spybot" },
        { text = "How do you know Elling Trias?", next = "trias" },
        { text = "What has Lord Lescovar done?", next = "lescovar", when = { any = { { questActive = TODO_QUEST("Infiltrating the Castle") }, { questActive = TODO_QUEST("Items of Some Consequence") }, { questActive = TODO_QUEST("The Attack!") } } } },
        { text = "Spying on a lord in the king's own garden is treason.", next = "treason" },
        { text = "What are its tolerances?", next = "tolerances", when = { profession = "Engineering" } },
        { text = "Did they make things like this in Gnomeregan?", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "It's done. What happens now?", next = "now", when = { questDone = TODO_QUEST("The Attack!") } },
        { text = "I'll leave you to your roses.", next = "END" },
      },
    },
    doing = {
      lines = {
        { id = "doing_1", text = "Gardening, officially. In fact I'm watching who comes and goes from the library and who a certain lord speaks to when he thinks he's alone. I've a list. It's shorter than I'd like and worse than I'd feared." },
      },
      choices = {
        { text = "Who are you working for?", next = "who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "who_1", text = "For people who'd rather the Keep didn't know it was being watched from Old Town. That's as plain as you'll get. If you know a man who misses nothing, and who's fond of Trias's cheddar, then you know already." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    spybot = {
      lines = {
        { id = "spybot_1", text = "Twelve hundred parts, and every one of them filed by hand. It walks, it listens, and it speaks in three voices. With the right disguise it'll pass for a servant at ten paces. At five paces it ticks, and I'm working on that." },
      },
      choices = {
        { text = "What's it for?", next = "purpose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    purpose = {
      lines = {
        { id = "purpose_1", text = "For going where I can't. A gnome in the Keep's inner rooms gets noticed. Nobody looks twice at a servant with a message. It'll tell the garden's guards they're wanted elsewhere, and they'll go, because nobody questions the help." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    trias = {
      lines = {
        { id = "trias_1", text = "We did the same sort of work for the same sort of people, a long time ago. He was the one who talked and I was the one who built. Then he married a cheesemaker and said he'd retired. He hasn't, and he never will." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lescovar = {
      lines = {
        { id = "lescovar_1", text = "He's been meeting a man called Marzon, who is known as the Silent Blade, and who does not work for anyone the crown would approve of. There's a diplomat missing, the Defias are far too well informed, and all of it runs back to that soft-spoken lord in the library." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    treason = {
      big = true,
      lines = {
        { id = "treason_1", text = "Is it? I'd have said treason was a lord of the realm selling the king's business to brigands. I've no warrant, I'll admit that. The warrant would have to be signed by people who dine with him." },
      },
      choices = {
        { text = "When the law is compromised, someone must act outside it.", next = "BACK", reply = "That's the whole of my trade, put in a sentence. I'll remember you said it, if this goes badly.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Without a warrant, you're only another plotter.", next = "BACK", reply = "I've thought so on bad nights. Then I count the bodies his plotting has made, and mine comes out at none so far.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tolerances = {
      lines = {
        { id = "tolerances_1", text = "A tenth of a second on the gait and a hair's width on the jaw hinge. The voice box drifts when it's cold, and that's why we're doing this in summer. And no, you may not see inside." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomeregan = {
      lines = {
        { id = "gnomeregan_1", text = "Better ones, and a hundred of them, down on the clockwork levels. I left my workshop with what I could carry, and it wasn't much. Everything in this spybot I've had to make again from memory, with dwarven files." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    now = {
      lines = {
        { id = "now_1", text = "Now I pack up, and the roses get a new gardener. Go and tell Trias. He'll pretend it's nothing to do with him and give you a piece of cheese. Take it. It's as near to a medal as our sort ever gets." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    defias = { { id = "tp_defias", text = "They've a friend among the nobles, and likely more than one. A band of brigands doesn't get into a city like this unless somebody has opened a door." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Gone, for now. I don't discuss it while I'm working, and I'm always working." } },
    rumors = { { id = "tp_rumors", text = "The library's had the same visitor at the same hour for a month, and he never takes down a book. I don't call that a rumour, because I've been counting." } },
    background = { { id = "tp_background", text = "An engineer, and then something less respectable in the crown's service. I've been a gardener for a fortnight, and I'm dreadful at it." } },
    advice = { { id = "tp_advice", text = "Time everything. People are as regular as clocks, and they've no idea of it." } },
    _none = { { id = "tp_none", text = "Not my operation. And keep your voice down." } },
  },
}

-- Nurse Lillian: tends guards and prisoners alike at the door of the Stockade.
P:NPC {
  key = "nurse_lillian", id = TODO_NPC("Nurse Lillian"), name = "Nurse Lillian", gender = "female",
  bible = "bibles/more_folk.md", role = "priest", tier = "service",
  communities = { "stormwind" }, temper = { "brisk", "compassionate" }, values = { "mercy", "duty" },
  notices = { "kit", "light", "craft" },
  impression = {
    first = "Nurse Lillian tends the wounded at the door of the Stockade, guards and prisoners alike, and will not be told which of them deserves it. She is brisk and tired, and she keeps a tally of the injuries the warden's reports leave out.",
    third = "{name} met Nurse Lillian, who tends the wounded at the Stormwind Stockade.",
  },
  greetings = {
    { id = "g_default", text = "Are you hurt at all? If not, then mind the doorway, please, they bring them out this way." },
    { id = "g_2", when = { metBefore = true }, text = "You again. You're still in one piece, I see. Good, I've no spare beds." },
    { id = "g_3", when = { class = { "PRIEST", "PALADIN" } }, text = "Light be praised, someone with healing hands. If you've a moment, I've a guard inside with a cracked skull." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You've been in a fight, and nobody's looked at you since. Sit on that crate and let me see your ribs." },
    { id = "n_2", cat = "light", when = { class = "PRIEST" },
      text = "You've the Cathedral's training. Then you'll know how little of it is about spells, and how much is clean water and sitting up at night." },
    { id = "n_3", cat = "craft", when = { profession = "First Aid" },
      text = "You roll a bandage properly, tight and flat. Shaina Fuller taught you, or somebody she taught did." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I'm Nurse Lillian. The Stockade is behind that gate, and the prisoners have had the run of it since the riot began. Warden Thelwater sends guards in, and I patch what comes out. I treat the prisoners too, when they'll let me near." },
      },
      again = {
        { id = "hello_again1", text = "What else? I can talk while I roll these." },
        { id = "hello_again2", text = "Go on." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "What's happening in the Stockade?", next = "stockade" },
        { text = "You treat the prisoners as well?", next = "prisoners" },
        { text = "What do you need most?", next = "need" },
        { text = "Tell me about the warden.", next = "warden" },
        { text = "Criminals don't deserve a healer's time.", next = "deserve" },
        { text = "What wounds are you seeing?", next = "wounds", when = { profession = "First Aid" } },
        { text = "I can lend the Light, if you'll have it.", next = "lend", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    stockade = {
      lines = {
        { id = "stockade_1", text = "The Defias prisoners took the cell blocks, and they've held them for weeks. They've a leader in there, a man called Thredd, and he keeps them in better order than the turnkeys ever did. It ought to have been over in a day, and somebody doesn't want it over." },
      },
      choices = {
        { text = "Why do you say that?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "why_1", text = "Because the men who go in come out hurt in ways that tell me the prisoners knew they were coming. I'm a nurse and no spy. But I know the difference between a brawl and an ambush when I've stitched up both." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    prisoners = {
      lines = {
        { id = "prisoners_1", text = "When I can. There's a boy in there, a mason's son, who was jailed for throwing a stone at a tax clerk. He has a fever, and nobody on either side will let me in to him. I ask at every change of the guard." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    need = {
      lines = {
        { id = "need_1", text = "Linen, and clean water. I'd have another pair of hands as well, if the Cathedral would spare one. They sent me a novice, who fainted at the first leg wound, and I sent him back with a note saying thank you all the same." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    warden = {
      lines = {
        { id = "warden_1", text = "Thelwater's a decent man who believes his own reports. He writes \"situation contained\" every evening, and I burn another basket of dressings. I don't think he lies. I think he's being told what he hopes to hear." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    deserve = {
      big = true,
      lines = {
        { id = "deserve_1", text = "I've had that from guards, with their own blood on my apron. A wound doesn't know what the man did. Half of those in there were stonemasons who were cheated of their pay, and the other half are worse. I can't tell which is which from a gash." },
      },
      choices = {
        { text = "Mercy that picks and chooses isn't mercy.", next = "BACK", reply = "No, it isn't. That's the oath, and I've kept it in worse places than this.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Save your linen for the men who guard us.", next = "BACK", reply = "When I'm down to one bandage, I'll think about that. Until then they bleed the same, and I treat them the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounds = {
      lines = {
        { id = "wounds_1", text = "Knife work, mostly low and from behind, and burns from lamp oil that was thrown. Some of the breaks were done with a cell door. Bind them firm and keep them still. You'll know that, by your hands." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lend = {
      lines = {
        { id = "lend_1", text = "I'll have it gladly. There's a guard on the second pallet whose breathing I don't like. If you can ease him, I'll be able to sit down for the first time since dawn." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "A turnkey told me the prisoners get letters. He doesn't mean visitors, he means letters, and someone has to carry those through a locked gate." } },
    defias = { { id = "tp_defias", text = "They're men, when they're on my pallet. I've learned not to ask what they were before that." } },
    background = { { id = "tp_background", text = "I trained at Northshire Abbey and nursed through the last of the Second War. I asked for the Stockade because nobody else would take it." } },
    advice = { { id = "tp_advice", text = "Wash the wound before you bind it, however much they shout. Dirt will kill a man that a blade only cut." } },
    _none = { { id = "tp_none", text = "I've not had time to hear about that. Ask me when the riot's over." } },
  },
}

-- Jenn Langston: one of the tavern Langstons; walks Old Town on the Pig and Whistle's errands.
P:NPC {
  key = "jenn_langston", id = TODO_NPC("Jenn Langston"), name = "Jenn Langston", gender = "female",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "lively", "saucy" }, values = { "family", "fun" },
  notices = { "drink", "soldier", "stealth" },
  impression = {
    first = "Jenn Langston is one of the Langstons of the Pig and Whistle and walks Old Town on the tavern's errands with a word for everyone she passes. She laughs easily, and she gives back whatever manners she is shown.",
    third = "{name} met Jenn Langston, of the Pig and Whistle's Langstons, on the streets of Stormwind's Old Town.",
  },
  greetings = {
    { id = "g_default", text = "Well, hello there! You're new on this street, or I'd remember." },
    { id = "g_2", when = { metBefore = true }, text = "Oh, it's you! I was just telling Elly about you. It was mostly good." },
    { id = "g_3", when = { drunk = true }, text = "You've been at Reese's bar, haven't you? Mind the kerb, love, it moves when you're in that state." },
  },
  notice = {
    { id = "n_1", cat = "drink", when = { drunk = true },
      text = "Look at you! Go and sit by the hearth and ask Elly for bread. Tell her Jenn sent you, and she'll go easy." },
    { id = "n_2", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You'll be one of the barracks lot, or you ought to be. First round's on the house for the new ones, if you can find the door." },
    { id = "n_3", cat = "stealth", when = { class = "ROGUE" },
      text = "You've the walk of the quiet table at the back. Don't worry, I never saw you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Jenn Langston! Reese keeps the taps at the Pig and Whistle and Elly runs the floor. I run everywhere else. There are casks to order and bills to chase, and somebody has to tell the barracks when the good stout's come in." },
      },
      again = {
        { id = "hello_again1", text = "What else, then?" },
        { id = "hello_again2", text = "Go on, I can walk and talk." },
        { id = "hello_again3", text = "Yes, love?" },
      },
      choices = {
        { text = "What's the word in Old Town?", next = "word" },
        { text = "Tell me about your family.", next = "family" },
        { text = "You seem to know everyone on this street.", next = "everyone" },
        { text = "What's a night at the Pig and Whistle like?", next = "night" },
        { text = "A tavern girl shouldn't walk Old Town alone.", next = "alone" },
        { text = "Who's the worst customer you've had?", next = "worst" },
        { text = "Which regiment drinks the most?", next = "regiment", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I grew up near these streets.", next = "grew", when = { origin = { "human_canal_pickpocket", "human_stonemason_child", "human_city_guard" } } },
        { text = "See you about, Jenn.", next = "END" },
      },
    },
    word = {
      lines = {
        { id = "word_1", text = "The barracks is half empty, the Champions' Hall's full of officers with nobody to command, and the building with no sign has had its lamps lit all night for a week. You can make of that what you like. I only deliver the ale." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = {
        { id = "family_1", text = "There's a great many of us. Reese is the head of it, and Elly's the sense, and I'm the feet. Shout \"Langston\" in the taproom and you'll get four answers and an argument." },
      },
      choices = {
        { text = "Do you get along?", next = "along" },
        { text = "Something else.", next = "BACK" },
      },
    },
    along = {
      lines = {
        { id = "along_1", text = "Like cats in a sack, and I'd not swap one of them. Reese says a family that works a tavern together either murders each other or doesn't, and we haven't yet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    everyone = {
      lines = {
        { id = "everyone_1", text = "I ought to, I've carried ale to all of them. Mayda Thane takes a half-pint at closing, Heinrich Stone takes nothing and disapproves, and the lads at the Protective Hide take a jug between them and blame Randal for the bill." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    night = {
      lines = {
        { id = "night_1", text = "It's loud till the ninth bell and louder after. There's always a recruit singing and a sergeant who wants him to stop. Dashel Stonefist sits by the door looking for an excuse. If you want quiet, go to the Blue Recluse and be bored." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      big = true,
      lines = {
        { id = "alone_1", text = "Shouldn't I? I was born on this street, love. Every guard on it has had a free pint off me and every cutpurse knows my brother. I'm safer here than a lord is in the Keep." },
      },
      choices = {
        { text = "You know your own streets best. Walk where you like.", next = "BACK", reply = "I do and I will. It's nice to meet someone who doesn't need telling.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "The streets have changed. Take an escort after dark.", next = "BACK", reply = "You sound like Reese. He's not wrong lately, I'll give you that, and I don't cut through the alley any more.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = {
        { id = "worst_1", text = "A knight-lieutenant who wouldn't pay, on the grounds that he outranked the bill. Elly sent me to the hall with it. I handed it to Lieutenant Karter in front of everyone, and it was paid within the hour, with a tip." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    regiment = {
      lines = {
        { id = "regiment_1", text = "The ones just back from Redridge, and nobody begrudges it. They drink fast and say nothing for the first hour. We've a rule at the Pig that nobody asks them anything until they've started talking by themselves." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    grew = {
      lines = {
        { id = "grew_1", text = "Did you? Then you'll know the short way from the canal to our back door, and you'll know not to use it on bin day. Come by, and I'll tell Reese you're local. He goes soft on locals." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "There's a lord been seen in Old Town after dark, hooded, by the house with no sign. Lords don't come down here for the ale." } },
    background = { { id = "tp_background", text = "Born over the taproom, the same as the rest of us. I tried a year as a seamstress and missed the noise." } },
    advice = { { id = "tp_advice", text = "Be polite to whoever carries your drink. We remember who wasn't, and we talk to each other." } },
    _none = { { id = "tp_none", text = "Haven't heard, love. Give it a day and I will have." } },
  },
}

-- Lenny "Fingers" McCoy: loiters in Old Town; says he used to teach locks and now only gives advice.
P:NPC {
  key = "lenny_mccoy", id = TODO_NPC("Lenny \"Fingers\" McCoy"), name = "Lenny \"Fingers\" McCoy", gender = "male",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "sly", "friendly" }, values = { "luck", "freedom" },
  notices = { "stealth", "purse", "watch" },
  impression = {
    first = "Lenny McCoy, called Fingers, loiters in Old Town and says he is retired from a trade he never quite names. He is friendly and sly, and he talks about locks the way other men talk about fishing.",
    third = "{name} met Lenny \"Fingers\" McCoy, an idler with a knowing manner, in Stormwind's Old Town.",
  },
  greetings = {
    { id = "g_default", text = "Afternoon, friend. Lovely day to stand about doing nothing unlawful." },
    { id = "g_2", when = { metBefore = true }, text = "There's a familiar face. I'd say I've been keeping busy, and you'd know I was lying." },
    { id = "g_3", when = { class = "ROGUE" }, text = "Well, well. You've the hands for it, haven't you? I can always tell by the fingers." },
  },
  notice = {
    { id = "n_1", cat = "stealth", when = { class = "ROGUE" },
      text = "You've a pick in your sleeve. I can see the line of it. It's a nice touch, but it wants to sit a finger higher, or it'll rattle." },
    { id = "n_2", cat = "purse", when = { money = { min = 1000000 } },
      text = "That's a heavy purse to wear on the outside in Old Town, friend. I'm only saying so because I like you." },
    { id = "n_3", cat = "watch", when = { origin = "human_city_guard" },
      text = "You've got a watchman's eyes. I'm only standing here, officer, as is every citizen's right." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Lenny McCoy. They call me Fingers, on account of how many I've still got. I used to be in the business of opening things, and I taught it for a while, in the old days. I'm retired now, and I stand here for the air." },
      },
      again = {
        { id = "hello_again1", text = "What else is on your mind?" },
        { id = "hello_again2", text = "Go on, I'm not going anywhere." },
        { id = "hello_again3", text = "Yeah?" },
      },
      choices = {
        { text = "What did you teach, exactly?", next = "teach" },
        { text = "Why \"Fingers\"?", next = "fingers" },
        { text = "What do you see, standing here all day?", next = "see" },
        { text = "You know the building with no sign.", next = "si7" },
        { text = "A thief is a thief, retired or not.", next = "thief" },
        { text = "Any relation to Sloan McCoy?", next = "sloan" },
        { text = "What lock in this city can't be picked?", next = "lock", when = { class = "ROGUE" } },
        { text = "I ran the canals as a child.", next = "canals", when = { origin = "human_canal_pickpocket" } },
        { text = "Be seeing you, Lenny.", next = "END" },
      },
    },
    teach = {
      lines = {
        { id = "teach_1", text = "Locks, friend. I taught how they think, and what they want, and how to talk one round to your point of view. A lock's only a small argument made of brass. I had pupils once. The house round the corner does its own teaching now, and I wasn't asked." },
      },
      choices = {
        { text = "Do you miss it?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = {
        { id = "miss_1", text = "Every time I walk past a good door. There's one on the Canal side with a dwarf-made tumbler I'd give a tooth to try. I've not touched it. I only go and look at it now and then." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fingers = {
      lines = {
        { id = "fingers_1", text = "Because I've kept all ten of them, and that's rare enough in my line that it earned me the name. The traps take them, you see. A needle in the keyhole or a spring in the hasp will have one off. I've never once hurried a lock, and so here they all are." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    see = {
      lines = {
        { id = "see_1", text = "Everything. I see the barracks changing shifts, and who goes into the Honest Blade and comes out without a blade. I see which of Reese's customers leave by the back. A man standing still is invisible, friend, and it's the best trick I know." },
      },
      choices = {
        { text = "Seen anything worth telling?", next = "telling" },
        { text = "Something else.", next = "BACK" },
      },
    },
    telling = {
      lines = {
        { id = "telling_1", text = "A gentleman in good boots walks through here every third night, and he's no business in Old Town. He goes toward the canals and comes back lighter. I don't know what he's carrying, and I've worked hard at not finding out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    si7 = {
      lines = {
        { id = "si7_1", text = "I know it's got no sign, and I know why. I know better than to say the name of it in the street as well. Master Shaw and I have an understanding. I don't work in his city, and he doesn't ask where I learned what I know." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    thief = {
      big = true,
      lines = {
        { id = "thief_1", text = "I'll not argue the word. But I only ever opened what belonged to folk with three of everything, and I never once carried a blade. There's lords in the Keep took more from this city with a pen than I did in thirty years with a pick." },
      },
      choices = {
        { text = "Stealing from thieves in velvet is rough justice.", next = "BACK", reply = "I always thought so. It's nice to hear it from somebody who's not after a lesson.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Theft is theft, whoever the victim is.", next = "BACK", reply = "So the magistrate told me, twice. He had a lovely lock on his own strongbox, as I recall.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sloan = {
      lines = {
        { id = "sloan_1", text = "A cousin, on the respectable side of the family, if you can credit that. She went into the crown's service, and I didn't. We nod to each other. She's never offered me a drink, and I've never accepted one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lock = {
      lines = {
        { id = "lock_1", text = "The Stockade's main gate, from the inside. That's why the lads in there are still in there. The vault under the counting house has three keys, and they're held by three men who hate each other. A pick's no use against that, and you'd have to be a diplomat." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    canals = {
      lines = {
        { id = "canals_1", text = "Did you, now? Then we've met, likely, with me a good deal younger and you a good deal shorter. I'll have told you to keep your elbows in and never work a crowd you can't leave. You're still breathing, so you must have listened." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "Word is the Stockade lads are getting messages out. There's only two ways through that gate, and neither one's a pick." } },
    background = { { id = "tp_background", text = "Canal born, and self-taught on my mother's larder. I did my years, learned my trade properly inside, and came out a careful man." } },
    advice = { { id = "tp_advice", text = "Never hurry a lock, and never trust an easy one." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend, since I only stand here." } },
  },
}

-- Caledra Dawnbreeze: high elf tracker waiting in the Petitioner's Chamber of Stormwind Keep.
P:NPC {
  key = "caledra_dawnbreeze", id = TODO_NPC("Caledra Dawnbreeze"), name = "Caledra Dawnbreeze", gender = "female",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "reserved", "proud" }, values = { "memory", "vigilance" },
  notices = { "pet", "kaldorei", "arcane" },
  impression = {
    first = "Caledra Dawnbreeze is a high elf tracker who waits in the Petitioner's Chamber of Stormwind Keep with a patience that is wearing thin. She has lost a homeland, and she watches the court's comings and goings the way she would watch a trail.",
    third = "{name} met Caledra Dawnbreeze, a high elf tracker waiting in the Petitioner's Chamber of Stormwind Keep.",
  },
  greetings = {
    { id = "g_default", text = "Good day. If you are waiting to be heard, the line begins behind me, and it has not moved since the spring." },
    { id = "g_2", when = { metBefore = true }, text = "You are back, and I am still here. You may draw your own conclusions about the court." },
    { id = "g_3", when = { class = "HUNTER" }, text = "You carry yourself like one who reads ground. It is pleasant to meet someone in this hall who looks at the floor for a reason." },
  },
  notice = {
    { id = "n_1", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your companion has been watching the doors since you entered. It has better sense than most of the petitioners." },
    { id = "n_2", cat = "kaldorei", when = { race = "NightElf" },
      text = "Kaldorei. Our peoples have not spoken kindly in ten thousand years, and I find that I am too tired to continue the tradition." },
    { id = "n_3", cat = "arcane", when = { class = "MAGE" },
      text = "You carry the arcane lightly. My people did not, and you know how that ended, if your masters taught you honestly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I am Caledra Dawnbreeze, of Quel'Thalas, when there was such a place. I was a tracker in the Farstriders' service. I have come to ask the crown of Stormwind for a thing it is slow to grant, and so I wait, as you see." },
      },
      again = {
        { id = "hello_again1", text = "Is there more you would ask?" },
        { id = "hello_again2", text = "Speak. I have nothing but time in this room." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "What are you petitioning for?", next = "petition" },
        { text = "What became of Quel'Thalas?", next = "quel" },
        { text = "What does a tracker see at court?", next = "court" },
        { text = "You don't think much of this place.", next = "place" },
        { text = "Your people abandoned the Alliance once.", next = "abandoned" },
        { text = "Who else waits in this chamber?", next = "others" },
        { text = "What did the Farstriders teach about tracking?", next = "farstriders", when = { class = "HUNTER" } },
        { text = "I fled Lordaeron too.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "Good day, Caledra.", next = "END" },
      },
    },
    petition = {
      lines = {
        { id = "petition_1", text = "For leave to serve, and for a place for those of my people who have come south. There are perhaps a few dozen of us in the city. We are neither citizens nor guests, and no clerk can find the right form for what we are." },
      },
      choices = {
        { text = "Who must decide?", next = "decide" },
        { text = "Something else.", next = "BACK" },
      },
    },
    decide = {
      lines = {
        { id = "decide_1", text = "The Lady Prestor advises the boy king on such things, I am told, and she advises patience. She has advised it to every petitioner in this room. I have begun to wonder who gains from so much waiting." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    quel = {
      lines = {
        { id = "quel_1", text = "The Scourge came through the forest in a straight line, and they did not stop for anything. The Sunwell was fouled, and the city fell. I was on the southern marches and came back to ash. I will not describe it further." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    court = {
      lines = {
        { id = "court_1", text = "The same lords use the same doors at the same hours, and one of them walks more softly than a lord has cause to. The guards watch the petitioners and never the nobles. If this were a forest, I would say something was hunting here and the deer had not noticed." },
      },
      choices = {
        { text = "Which lord?", next = "lord" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lord = {
      lines = {
        { id = "lord_1", text = "I do not know your court's names well enough to accuse anyone. He is a quiet man who goes often to the library. I have tracked wolves that had less patience than he has." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    place = {
      lines = {
        { id = "place_1", text = "I think it is brave and badly served. Your soldiers are scattered, and your regent is honest. Your nobles speak of taxes while the south goes dark. I say it with some sympathy, for my own people's lords did the same before the end." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    abandoned = {
      big = true,
      lines = {
        { id = "abandoned_1", text = "We did. Our king judged that the Alliance had cost us much and given us little, and he closed the borders. Then the dead came, and there was nobody to call upon. I was a loyal ranger and I agreed with him then. I do not now." },
      },
      choices = {
        { text = "Old quarrels shouldn't bar those who come to help.", next = "BACK", reply = "That is more generous than I expected in this hall. I shall remember that it was said.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Stormwind owes nothing to those who left it.", next = "BACK", reply = "No, it does not, and I have not said that it does. I ask for a bow and a post, and I do not ask it as a debt.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_1", text = "There are farmers from Westfall, asking for soldiers, and a merchant asking for his taxes back. A count stands here every day asking for nothing at all, so far as I can tell. The farmers have been here longer than I have, and they are answered last." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    farstriders = {
      lines = {
        { id = "farstriders_1", text = "That the quarry is never where the tracks are, because the tracks are where it was. You read what it wanted, and then you go to where it will want that again. I have found that it works on courtiers as well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lordaeron = {
      lines = {
        { id = "lordaeron_1", text = "Then we walked the same road south, some months apart. You will know the silence of it, when all the villages were standing and all of them were empty. I am sorry. I have not said that to a human before." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "It is said the regent wishes to send soldiers south and is overruled each time. I have watched who stands nearest the throne when that is done." } },
    background = { { id = "tp_background", text = "I was a tracker of the southern marches of Quel'Thalas. I hunted trolls for two hundred years, and I was hunting them on the day the kingdom died behind me." } },
    advice = { { id = "tp_advice", text = "Watch the one that the others do not watch. In a forest or a court, that is where the danger is." } },
    _none = { { id = "tp_none", text = "I do not know your kingdom well enough to say." } },
  },
}

-- Officer Jaxon: city guard officer who patrols the Trade District and knows every stallholder.
P:NPC {
  key = "officer_jaxon", id = TODO_NPC("Officer Jaxon"), name = "Officer Jaxon", gender = "male",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "stormwind" }, temper = { "genial", "observant" }, values = { "duty", "community" },
  notices = { "purse", "stealth", "kit" },
  impression = {
    first = "Officer Jaxon patrols the Trade District for the city guard and knows every stallholder by name and by what they owe. He prefers a quiet word to an arrest, and he usually gets his way with it.",
    third = "{name} met Officer Jaxon of the Stormwind city guard, on patrol in the Trade District.",
  },
  greetings = {
    { id = "g_default", text = "Good day, citizen. Mind your purse near the fountain, it's crowded today." },
    { id = "g_2", when = { metBefore = true }, text = "Hello again. Still keeping out of trouble? Good, that saves me the paperwork." },
    { id = "g_3", when = { origin = "human_city_guard" }, text = "Well, here's one of ours! Which gate were you on?" },
  },
  notice = {
    { id = "n_1", cat = "purse", when = { money = { min = 1000000 } },
      text = "That's a great deal of coin to carry through a market, friend. The bank's just there, and the Burnsides are honest." },
    { id = "n_2", cat = "stealth", when = { class = "ROGUE" },
      text = "I'd know that walk anywhere. Keep your hands where the stallholders can see them, and we'll get along." },
    { id = "n_3", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You've been somewhere rough. The smiths are north, in the Dwarven District, and the inn's behind you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Officer Jaxon, city guard. The Trade District's my round. I walk it from the gate to the canals and back, a dozen times a day. Captain Malagan has the square, and I've got everything round the edges of it." },
      },
      again = {
        { id = "hello_again1", text = "Anything else, citizen?" },
        { id = "hello_again2", text = "Go on, I can walk and listen." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "What's your round like?", next = "round" },
        { text = "You know the merchants well?", next = "merchants" },
        { text = "What trouble does the Trade District see?", next = "trouble" },
        { text = "A guard who's friendly with merchants can't police them.", next = "friendly" },
        { text = "Where can I find things in the district?", next = "find" },
        { text = "Who do you report to these days?", next = "report", when = { origin = "human_city_guard" } },
        { text = "How many pickpockets work the fountain?", next = "pick", when = { origin = "human_canal_pickpocket" } },
        { text = "Good day, Officer.", next = "END" },
      },
    },
    round = {
      lines = {
        { id = "round_1", text = "It's the same stones every hour, and I like it for that. I know which shutter sticks and which dog barks at nothing. When something's out of place, I feel it before I see it, the way you'd know a stranger's hand had been in your pocket." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    merchants = {
      lines = {
        { id = "merchants_1", text = "All of them. The Mullbys argue with their door open. Renato Gallina hands out wine tickets to anyone who stands still. I hear the auctioneers, and I can tell you what every one of them sounds like when the bidding's gone sour." },
      },
      choices = {
        { text = "Who do you worry about?", next = "worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry = {
      lines = {
        { id = "worry_1", text = "The small ones. A stallholder who's paid a tax he can't afford and a \"fee\" to someone who isn't the crown. They won't tell me who collects the second one. They look at their boots, and I know what that means." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = {
        { id = "trouble_1", text = "It's cutpurses and short weights, with a brawl at the auction house once a week. That's the honest trouble. The other kind is quiet. Now and then a stall changes hands overnight, and the old owner's gone to \"family in Westfall\"." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    friendly = {
      big = true,
      lines = {
        { id = "friendly_1", text = "I've heard it said. But a guard nobody talks to finds out about the fire when he smells it. They tell me things because I ask after their children. I've stopped more trouble with a cup of tea than I ever have with a halberd." },
      },
      choices = {
        { text = "A guard should belong to the streets he walks.", next = "BACK", reply = "That's how I was taught, by a sergeant who knew every door in Old Town. It still works.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Friendship is how a guard gets bought.", next = "BACK", reply = "It can be. I've turned down a few gifts that weren't gifts. I'll grant you it's a thing worth watching in yourself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    find = {
      lines = {
        { id = "find_1", text = "The bank's on the east side, and the auction house is north of the square. The inn's the Gilded Rose. For armour you want the Lionheart, and for odds and ends the Mullbys. If it's cheese you want, follow your nose, and mind you buy some." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    report = {
      lines = {
        { id = "report_1", text = "To Malagan, and he reports to whoever at the Keep will listen. It's a shorter list than when you served. He walks the canals himself at night now. A captain shouldn't have to do that." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pick = {
      lines = {
        { id = "pick_1", text = "Four regulars, and a new lad who's dreadful at it. You'd know two of the regulars, I expect. I'll not ask you to name anyone, friend. I only mention it so you'll know I can count." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "Three stalls on the canal side have new owners this month, and none of the old ones said goodbye. I've put it in my report, twice." } },
    background = { { id = "tp_background", text = "City born, and I've been a guard since I was old enough for the tabard. I've walked this same round for nine years and turned down two promotions to keep it." } },
    advice = { { id = "tp_advice", text = "Keep your coin inside your shirt and your wits outside it." } },
    _none = { { id = "tp_none", text = "Not on my round, citizen. Try the Captain." } },
  },
}

-- Officer Pomeroy: city guard officer whose round takes in the Trade District and the Mage Quarter.
P:NPC {
  key = "officer_pomeroy", id = TODO_NPC("Officer Pomeroy"), name = "Officer Pomeroy", gender = "male",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "stormwind" }, temper = { "wary", "dry" }, values = { "duty", "caution" },
  notices = { "arcane", "warlock", "kit" },
  impression = {
    first = "Officer Pomeroy walks the Trade District and the Mage Quarter for the city guard and trusts neither merchants nor mages. He has been singed, frosted and once briefly turned into a sheep, and he has a report on file for each.",
    third = "{name} met Officer Pomeroy of the Stormwind city guard, on his round between the Trade District and the Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Citizen. Nothing is on fire at present, and I'd like to keep it so." },
    { id = "g_2", when = { metBefore = true }, text = "You again. I'll assume you've not broken anything since we last spoke." },
    { id = "g_3", when = { class = { "MAGE", "WARLOCK" } }, text = "A caster. Then I'll ask you kindly not to practise in the street, and I'll ask you only the once." },
  },
  notice = {
    { id = "n_1", cat = "arcane", when = { class = "MAGE" },
      text = "You've singed cuffs. I've a ledger of every scorch mark in the Quarter, and I'd be obliged if you didn't add to it." },
    { id = "n_2", cat = "warlock", when = { class = "WARLOCK" },
      text = "I know where you people meet, and so does the Captain. As long as it stays in the cellar, I walk past." },
    { id = "n_3", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You've been knocked about. I trust it happened outside the walls, or I'll need to write it up." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Officer Pomeroy, city guard. I've the round from the Trade District down through the Mage Quarter. So my morning is short weights and cutpurses, and my afternoon is whatever the apprentices have set loose. I'd take the cutpurses, given the choice." },
      },
      again = {
        { id = "hello_again1", text = "Was there more, citizen?" },
        { id = "hello_again2", text = "Go on." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "What's it like, policing mages?", next = "mages" },
        { text = "Were you really turned into a sheep?", next = "sheep" },
        { text = "What do you know about the Slaughtered Lamb?", next = "lamb" },
        { text = "Mages should answer to the same law as anyone.", next = "law" },
        { text = "What's the worst the Quarter's given you?", next = "worst" },
        { text = "I trained in the tower. We weren't that bad.", next = "tower", when = { class = "MAGE" } },
        { text = "You know what's under that tavern, Officer. Keep knowing it quietly.", next = "cellar", when = { class = "WARLOCK" } },
        { text = "Good day, Officer.", next = "END" },
      },
    },
    mages = {
      lines = {
        { id = "mages_1", text = "It's like herding cats that can set you alight. They're not wicked, most of them, only careless. An apprentice will open a window to let the smoke out and never ask himself where the fire went. I've a standing arrangement with the fountain." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sheep = {
      lines = {
        { id = "sheep_1", text = "For the quarter of an hour, by a second-year who was aiming at a friend. I remember all of it. The grass in the Quarter is quite good. She apologised, and High Sorcerer Andromath had her sweep the tower stairs for a month, and I think of that when I'm low." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lamb = {
      lines = {
        { id = "lamb_1", text = "It's a tavern with a bad name and a cellar with a worse one. I'm told to leave it be, by people a good way above the Captain. So I count who goes in and who comes out, and I notice when the two numbers don't match." },
      },
      choices = {
        { text = "Do they often not match?", next = "match" },
        { text = "Something else.", next = "BACK" },
      },
    },
    match = {
      lines = {
        { id = "match_1", text = "More often than I like. I write it down every time. Nobody reads it. But the day somebody at the Keep finally asks what goes on down there, I'll have nine years of numbers for him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    law = {
      big = true,
      lines = {
        { id = "law_1", text = "They should, and on paper they do. In practice the tower disciplines its own. I'm told a guardsman can't judge whether a thing was an accident of the Art. I've a notion a burned stall is a burned stall." },
      },
      choices = {
        { text = "One law for all, robe or no robe.", next = "BACK", reply = "That's what I put in my reports. I'll underline it next time and say a citizen agreed.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Only mages can judge mages. Leave it to the tower.", next = "BACK", reply = "So the tower says, and it may be right about the judging. I'd still like to be let in to watch.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = {
        { id = "worst_1", text = "An elemental, loose in the canal, the size of a cart. Some student had called it up to wash his robes. It was Archmage Malin who put it down in the end, and he was courteous about it. Nobody was hurt, but there are fish in that canal that still won't come near the Quarter." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tower = {
      lines = {
        { id = "tower_1", text = "None of you ever think you were. You're very likely in my ledger. I'll not look, as a kindness, if you'll promise to keep your experiments indoors." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cellar = {
      lines = {
        { id = "cellar_1", text = "I know what I'm allowed to know, and I guess the rest. You people keep it quiet and nobody's gone missing who'd be missed. That's a low bar, and I'd thank you to keep clearing it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "The tower's lamps were lit all night three times this week, and no apprentice will say why. When mages go quiet, I check the buckets." } },
    background = { { id = "tp_background", text = "A cooper's son from the canals. I joined the guard to get away from barrels, and I was given a round where things explode." } },
    advice = { { id = "tp_advice", text = "If a mage tells you to stand back, do it, and don't wait to be told why." } },
    _none = { { id = "tp_none", text = "That's outside my round, and I'm glad of it." } },
  },
}

-- Officer Brady: city guard officer who walks the city's streets and says very little.
P:NPC {
  key = "officer_brady", id = TODO_NPC("Officer Brady"), name = "Officer Brady", gender = "male",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "stormwind" }, temper = { "taciturn", "steady" }, values = { "duty", "vigilance" },
  notices = { "stealth", "kit", "drink" },
  impression = {
    first = "Officer Brady walks Stormwind's streets for the city guard and has made a discipline of saying as little as possible. He notices everything, and what he does say is worth the wait.",
    third = "{name} met Officer Brady of the Stormwind city guard, a man of few words, on patrol in the city.",
  },
  greetings = {
    { id = "g_default", text = "Citizen." },
    { id = "g_2", when = { metBefore = true }, text = "You again. Good day." },
    { id = "g_3", when = { origin = "human_city_guard" }, text = "You've served, and I can see it. Well met." },
  },
  notice = {
    { id = "n_1", cat = "stealth", when = { class = "ROGUE" },
      text = "I saw you before you saw me. Remember that, and we'll have no trouble." },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You're hurt, or your armour is. The Cathedral's north-west, and the smiths are north." },
    { id = "n_3", cat = "drink", when = { drunk = true },
      text = "You've had enough. Go home by the lit streets, and I'll be walking behind you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Brady, city guard. I walk the streets, and I keep to no one district. Captain Malagan sends me where it's been too quiet. I don't talk much, citizen, so ask what you came to ask." },
      },
      again = {
        { id = "hello_again1", text = "Anything else?" },
        { id = "hello_again2", text = "Go on." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "Why does the Captain send you where it's quiet?", next = "quiet" },
        { text = "You don't say much.", next = "words" },
        { text = "What have you noticed lately?", next = "noticed" },
        { text = "Tell me about the other officers.", next = "officers" },
        { text = "A guard should reassure people, not loom over them.", next = "loom" },
        { text = "What do you watch for?", next = "watch", when = { origin = "human_city_guard" } },
        { text = "What gave me away?", next = "gave", when = { class = "ROGUE" } },
        { text = "Good day, Officer.", next = "END" },
      },
    },
    quiet = {
      lines = {
        { id = "quiet_1", text = "When a street's noisy, it's only living. When it goes quiet, the people on it are afraid to speak. The Captain sends me there to stand about, and after a while someone tells me why." },
      },
      choices = {
        { text = "Do they always tell you?", next = "always" },
        { text = "Something else.", next = "BACK" },
      },
    },
    always = {
      lines = {
        { id = "always_1", text = "They do in the end. I don't ask them anything. I come back the next day and the day after. On the fourth day there's usually an old woman with a cup of tea, and she's got something to say." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    words = {
      lines = {
        { id = "words_1", text = "I talked a lot as a recruit, and I missed things. My sergeant made me walk a month's rounds without a word. I heard more in that month than in the year before it, so I kept the habit." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    noticed = {
      lines = {
        { id = "noticed_1", text = "There are new faces on the canals who don't look at the water. Carts leave by the west gate lighter than they came in. And there's a house in the Cathedral quarter with its shutters closed in daylight. I've reported all three." },
      },
      choices = {
        { text = "What came of the reports?", next = "reports" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reports = {
      lines = {
        { id = "reports_1", text = "Nothing has yet. I'll go on reporting them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    officers = {
      lines = {
        { id = "officers_1", text = "Jaxon knows everyone on his round, and Pomeroy trusts no one on his. The Captain needs one of each. I'm the one he sends when he can't tell which sort of trouble it is." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    loom = {
      big = true,
      lines = {
        { id = "loom_1", text = "Some people are reassured by a guard who smiles, and others by one who's plainly paying attention. I can't do the first, so I do the second properly." },
      },
      choices = {
        { text = "A watchful guard is comfort enough.", next = "BACK", reply = "That's my view of it. Thank you, citizen.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "People fear a silent guard. That helps no one.", next = "BACK", reply = "Maybe so. I'll try nodding at them more.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = {
        { id = "watch_1", text = "I watch people's hands first, and then the doors. After that I look for whoever's watching me. You were taught the same, I expect, and in the same order." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gave = {
      lines = {
        { id = "gave_1", text = "You looked at the rooftops, and honest folk never look up. You're good at it, mind. I've only been at this longer than you have." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_rumors", text = "I don't repeat rumours, citizen. I write them down and give them to the Captain." } },
    background = { { id = "tp_background", text = "Stormwind born. I've been in the guard since the rebuilding, and that's all there is to tell." } },
    advice = { { id = "tp_advice", text = "Stand still a while and watch before you do anything. You'll learn most of what you need that way." } },
    _none = { { id = "tp_none", text = "Couldn't say." } },
  },
}
