-- Ironforge folk the first passes missed, part three: Goldfury's bowyer, a wandering meat seller, the Berryfizz
-- shop's supplies and apprentice, the three thief catchers who walk the halls, the Forlorn Cavern's warlock
-- trainer and shady dealer, the Arcanery's apprentice and supplies, a human at Bruuk's bar, and the tailor's apprentice.
-- Voices: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Skolmin Goldfury: bow merchant at Goldfury's Hunting Supplies, Military Ward. Bretta sells the guns.
P:NPC {
  key = "if_skolmin", id = TODO_NPC("Skolmin Goldfury"), name = "Skolmin Goldfury", title = "Bow Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "mild", "wry" }, values = { "craft", "family" },
  notices = { "class" },
  impression = {
    first = "Skolmin Goldfury sells bows, arrows and shot at Goldfury's Hunting Supplies, and he strings a bow with the patience of a dwarf who has long been outnumbered. He speaks quietly, mostly because Bretta's rifles do the shouting.",
    third = "{name} met Skolmin Goldfury, who sells bows at Goldfury's Hunting Supplies in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome tae Goldfury's. The bows are on my wall an' the rifles are on Bretta's, an' ye'll notice which wall the dwarves crowd round." },
    { id = "g_elf", when = { race = "NightElf" }, text = "A night elf! Come in, come in, for it's no' often I get a customer who looks at the bows first." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Tell me the string held, for I waxed that one myself." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", race = "Dwarf" },
      text = "A dwarf hunter, so ye'll be wantin' Bretta an' her guns. I'll only say that a bow has never yet woken the whole mountainside." },
    { id = "n_hunter2", cat = "class", when = { class = "HUNTER", ["not"] = { race = "Dwarf" } },
      text = "A hunter, an' one wi' the shoulders for a bow. Try the draw on the yew over there, an' mind the lamp." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Skolmin Goldfury, bowyer, which is a lonely thing tae be in a city in love wi' gunpowder. Bretta has the rifles an' I've the bows an' the arrows, an' I keep the shop's books besides, since she'd sooner be shootin'." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye?" },
        { id = "h_again2", text = "Go on, it's quiet on my side." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Why would a dwarf choose bows over guns?", next = "bows" },
        { text = "How do you and Bretta share one shop?", next = "bretta" },
        { text = "Good day, Skolmin.", next = "END" },
      },
    },
    bows = {
      lines = { { id = "b_default", text = "Because a bow is quiet, an' it works in the wet, an' it's never once blown up in a dwarf's face. I learned on one as a lad when powder was dear, an' by the time powder was cheap I'd grown fond o' still havin' my hearin'." } },
      choices = {
        { text = "Who buys them, in Ironforge?", next = "bows2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bows2 = {
      lines = { { id = "b2_default", text = "The elves who've come over the sea, mostly, an' a few human scouts up from Stormwind. Now an' again a mountaineer buys one on the quiet, for stalkin' where a shot would bring the troggs down on him, an' asks me no' tae tell Bretta." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bretta = {
      lines = { { id = "br_default", text = "By keepin' tae our own walls, an' by me agreein' wi' her before noon. She's kin, an' she's the best judge of a rifle in the ward, an' if she tells ye a dwarf wi' a gun is the equal of anythin' alive, just nod, for it's quicker." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Goldfurys have outfitted hunters for three generations. I'm the first tae prefer a string tae a trigger, an' I hear about it at every family supper." } },
    _none = { { id = "tp_none", text = "I couldnae say, friend. Ask Bretta, though ye'll get the answer at some volume." } },
  },
}

-- Sognar Cliffbeard: wandering meat vendor in the Military Ward.
P:NPC {
  key = "if_sognar", id = TODO_NPC("Sognar Cliffbeard"), name = "Sognar Cliffbeard", title = "Meat Vendor", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "hearty", "talkative" }, values = { "good food", "soldiers" },
  notices = { "hunger", "pet" },
  impression = {
    first = "Sognar Cliffbeard walks the Military Ward with a tray of smoked and roasted meat, calling his wares up at the barracks windows. The smell arrives a good ten paces before he does.",
    third = "{name} met Sognar Cliffbeard, who carries his meat tray round the Military Ward of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hot meat, friend, smoked this mornin'! Walk wi' me if ye want tae talk, for I've the whole ward tae get round before it cools." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again, an' lookin' hungry. I know the face, for I see it on every recruit at noon." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Yer beast's had its nose on my tray since ye came round the corner. Buy {pet} a haunch before it helps itself." },
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 15 },
      text = "Ye've the look of someone livin' on trail bread. That's nae way tae fight, {g:lad|lass}, for ye cannae swing an axe on crumbs." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sognar Cliffbeard, an' I feed the Military Ward on foot. A soldier willnae leave his post for a meal, so I bring the meal past the post, an' they've been known tae cheer when they hear me comin'." },
      },
      again = {
        { id = "h_again", text = "What else? Keep up, I'm headed for the Hall of Arms." },
        { id = "h_again2", text = "Aye, go on, talk while I walk." },
      },
      choices = {
        { text = "What have you got today?", next = "BUSINESS" },
        { text = "Where does the meat come from?", next = "meat" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "I'll let you finish your round.", next = "END" },
      },
    },
    meat = {
      lines = { { id = "m_default", text = "Boar an' bear from the Dun Morogh hunters, an' ram when a herder's had a bad winter an' needs the coin. I smoke it myself over pine in a wee room off the Forge, where the heat costs me nothin'." } },
      choices = {
        { text = "Which is best?", next = "meat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat2 = {
      lines = { { id = "m2_default", text = "The boar ribs, an' I'll fight any dwarf who says otherwise. Bear's richer but it sits heavy, an' ye dinnae want a recruit fallin' asleep on the afternoon watch because o' my cookin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    customers = {
      lines = { { id = "c_default", text = "The hunters' beasts in the Hall of Arms, if I'm honest, for they eat more than their masters an' never haggle. After them it's Kelv Sternhammer's recruits, who come off the sand so hungry they'd eat the tray." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a camp cook for the mountaineers before I got the tray. The walkin's the same, only warmer." } },
    _none = { { id = "tp_none", text = "Nae idea, friend. If it cannae be smoked or roasted, I've no' looked intae it." } },
  },
}

-- Soolie Berryfizz: alchemy supplies at Berryfizz's Potions and Mixed Drinks, Tinker Town. Kin to Tally.
P:NPC {
  key = "if_soolie", id = TODO_NPC("Soolie Berryfizz"), name = "Soolie Berryfizz", title = "Alchemy Supplies", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "bubbly", "organised" }, values = { "family", "order" },
  notices = { "craft" },
  impression = {
    first = "Soolie Berryfizz sells vials and reagents at Berryfizz's Potions and Mixed Drinks, and she has labelled every shelf, drawer and jar in the shop in three colours of ink. She laughs easily and counts stock while she does it.",
    third = "{name} met Soolie Berryfizz, who sells alchemy supplies at the Berryfizz shop in Tinker Town.",
  },
  greetings = {
    { id = "g_default", text = "Hello, and welcome to Berryfizz's! Potions are on the red labels and drinks are on the blue, and please do check, because we've only mixed them up twice." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! You bought vials last time, and you've come back, so nothing dissolved that shouldn't have." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You've got an alchemist's sleeves, with all those little burnt holes. Tally's the same, and I've stopped mending hers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Soolie Berryfizz, and I keep the shop stocked while my sister Tally teaches. She does the clever part with the retorts, and I make sure there's a clean vial to put it in, which she agrees is at least forty percent of alchemy." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm only counting stoppers." },
        { id = "h_again2", text = "Yes? Ask away, I've lost count anyway." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Potions and mixed drinks, in one shop?", next = "drinks" },
        { text = "How does a dwarf come to be Tally's apprentice?", next = "vosur" },
        { text = "Thanks, Soolie.", next = "END" },
      },
    },
    drinks = {
      lines = { { id = "d_default", text = "It's the same equipment, when you think about it, and Tinker Town hadn't a single place to get a decent fizzy cordial after the evacuation. The dwarves thought it was very funny until they tried one, and now we sell more drinks than potions." } },
      choices = {
        { text = "And the two times they got mixed up?", next = "drinks2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drinks2 = {
      lines = { { id = "d2_default", text = "One gentleman ordered a berry cordial and could see in the dark for an hour, which he rather enjoyed. The other time was the other way round, and a mountaineer went on patrol very cheerful and not at all healed, so that's when I started the labels." } },
      choices = { { text = "The labels seem wise. Something else.", next = "BACK" } },
    },
    vosur = {
      lines = { { id = "v_default", text = "He walked in one day and said he was tired of ale being the only thing dwarves brewed. Tally took him on at once, and he's very careful and very slow, and he's the only one of us who can reach the top shelf." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Tally and I ran a little stall on the second level back home. This one's bigger, and it has dwarves in it." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry! If it were on a shelf, I'd have labelled it." } },
  },
}

-- Vosur Brakthel: dwarf apprentice alchemist under Tally Berryfizz, Tinker Town.
P:NPC {
  key = "if_vosur", id = TODO_NPC("Vosur Brakthel"), name = "Vosur Brakthel", title = "Apprentice Alchemist", gender = "male",
  bible = "bibles/missed_b.md", role = "worker", tier = "service",
  communities = { "ironforge" }, temper = { "careful", "earnest" }, values = { "learning", "loyalty" },
  notices = { "craft", "race" },
  impression = {
    first = "Vosur Brakthel is a dwarf apprentice in a gnome's alchemy shop, bent nearly double over a bench built for someone half his height. He pours with both hands and holds his breath while he does it.",
    third = "{name} met Vosur Brakthel, a dwarf learning alchemy from the gnomes at Berryfizz's in Tinker Town.",
  },
  greetings = {
    { id = "g_default", text = "A moment, friend, till I've set this down. There, now I can breathe, an' so can you." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. I've no' broken a single flask since ye were last here, an' I'd like that written down somewhere." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Aye, I know, a dwarf in Tinker Town wi' his beard tucked in his belt. It's tae keep it out o' the burner, an' I'll thank ye no' tae laugh." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Ye've the craft yerself, I see. Then tell me, does the swiftthistle go in before the boil or after, for Mistress Tally says before an' my nose says after." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Vosur Brakthel, apprentice tae Mistress Tally Berryfizz. I measure what she tells me tae measure an' I wash a great many bottles, an' one day I'll make a healin' draught that doesnae taste o' boots." },
      },
      again = {
        { id = "h_again", text = "What else? This has tae steep a while yet." },
        { id = "h_again2", text = "Go on, I'm listenin'." },
      },
      choices = {
        { text = "Why alchemy, and why from gnomes?", next = "why" },
        { text = "That bench is too small for you.", next = "bench" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "My brother came back from the Wetlands wi' a fever the priests were slow tae shift, an' a gnome's wee bottle broke it in a night. I went tae find out what was in the bottle, an' I've no' left the shop since." } },
      choices = {
        { text = "What does your family think?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "My father thinks brewin' anythin' but ale is unnatural, an' he says so every feast day. Then he asks if I've brought any o' that draught for his knees, so I reckon he's comin' round." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bench = {
      lines = { { id = "b_default", text = "It is, an' my back tells me so nightly. Soolie's offered tae have the legs raised, but then Mistress Tally couldnae see over it, an' it's her shop, so I bend." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Brakthels are quarrymen, every one but me. I traded the pick for a pestle two winters back." } },
    _none = { { id = "tp_none", text = "I've no' been taught that yet. Ask Mistress Tally, for she knows near everythin' that'll fit in a flask." } },
  },
}

-- Thief Catcher Farmountain: patrols the halls of Ironforge. Brisk.
P:NPC {
  key = "if_tc_farmountain", id = TODO_NPC("Thief Catcher Farmountain"), name = "Thief Catcher Farmountain", gender = "male",
  bible = "bibles/missed_b.md", role = "guard", tier = "service",
  communities = { "ironforge" }, temper = { "brisk", "sharp-eyed" }, values = { "dutiful" },
  notices = { "stealth", "purse" },
  impression = {
    first = "Thief Catcher Farmountain walks the halls of Ironforge at a steady pace, looking at hands instead of faces. He has the air of a dwarf who has heard every excuse and kept a list.",
    third = "{name} met Thief Catcher Farmountain, who walks the halls of Ironforge looking for light fingers.",
  },
  greetings = {
    { id = "g_default", text = "Keep movin', citizen, an' keep a hand on yer coin. I've a round tae walk, so make it quick." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "I know that walk. Whatever ye're thinkin' o' doin', do it in some other city, an' we'll get on fine." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Yer purse is still on yer belt, so my day's goin' well enough." },
  },
  notice = {
    { id = "n_purse", cat = "purse", when = { minLevel = 30 },
      text = "That's a heavy purse tae carry on the outside o' yer belt. Tuck it in, for I cannae watch every pocket in the Commons." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thief Catcher Farmountain. The guards on the gates watch for armies, an' I watch for the one wee hand in a crowd that's where it shouldnae be." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I'm fallin' behind." },
        { id = "h_again2", text = "Quickly, then." },
      },
      choices = {
        { text = "Are there many thieves in Ironforge?", next = "thieves" },
        { text = "How do you spot one?", next = "spot" },
        { text = "Carry on, thief catcher.", next = "END" },
      },
    },
    thieves = {
      lines = { { id = "t_default", text = "Fewer than Stormwind an' more than the Senate admits. It's a rich city wi' crowded bridges, an' since the refugees an' the adventurers came, there are a good many strange faces tae hide among." } },
      choices = {
        { text = "Where is it worst?", next = "thieves2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thieves2 = {
      lines = { { id = "t2_default", text = "The auction house steps in the Commons, where folk stand countin' their coin in the open like bairns. After that it's the tram platform, an' I'll say nothin' o' the Forlorn Cavern, for that's where we find them afterwards." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    spot = {
      lines = { { id = "s_default", text = "An honest dwarf looks where he's goin', an' a thief looks where everyone else is lookin' an' then goes the other way. That, an' they're always in a hurry tae be somewhere they've nae reason tae be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Eleven years on the halls. I've caught the same cutpurse four times, an' we're on first-name terms." } },
    _none = { { id = "tp_none", text = "No' my round. Ask a gate guard." } },
  },
}

-- Thief Catcher Shadowdelve: patrols the halls of Ironforge. Quiet, moves like the people he hunts.
P:NPC {
  key = "if_tc_shadow", id = TODO_NPC("Thief Catcher Shadowdelve"), name = "Thief Catcher Shadowdelve", gender = "male",
  bible = "bibles/missed_b.md", role = "guard", tier = "service",
  communities = { "ironforge" }, temper = { "quiet", "dry" }, values = { "dutiful" },
  notices = { "stealth" },
  impression = {
    first = "This thief catcher makes less noise on Ironforge's flagstones than a dwarf in mail has any right to. He stops in the shadow of each pillar for a breath before moving on, and he speaks just above a murmur.",
    third = "{name} met one of Ironforge's thief catchers, a soft-footed dwarf who hunts thieves by walking the way they do.",
  },
  greetings = {
    { id = "g_default", text = "Ye didnae see me till I spoke, did ye? Good, for that's how it's meant tae work." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Evenin'. Ye check the corners when ye walk intae a hall, the same as I do, so we understand each other." },
    { id = "g_back", when = { metBefore = true }, text = "I saw ye two halls back. Ye've a way o' walkin' I'd know anywhere now." },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { class = { "ROGUE", "DRUID" }, minLevel = 20 },
      text = "Ye can go unseen when ye've a mind tae, I'd wager. I'll tell ye plainly that I look for the shadow that's a wee bit too dark, an' I usually find it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm a thief catcher, an' the name on my warrant doesnae matter much, for the folk I'm after never ask it. The others walk the middle o' the hall tae be seen, an' I walk the edge tae see." },
      },
      again = {
        { id = "h_again", text = "If there's somethin' more, say it softly." },
        { id = "h_again2", text = "Go on, I'm watchin' the bridge while ye talk." },
      },
      choices = {
        { text = "How do you catch someone you can't see?", next = "unseen" },
        { text = "You walk like a thief yourself.", next = "walk" },
        { text = "I'll leave you to the shadows.", next = "END" },
      },
    },
    unseen = {
      lines = { { id = "u_default", text = "Ye dinnae look for them, ye look for what they do tae the room. A lamp flickers wi' nae draught, or a merchant pats his pocket an' frowns, an' ye follow the frown back the way it came." } },
      choices = {
        { text = "And when you find them?", next = "unseen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    unseen2 = {
      lines = { { id = "u2_default", text = "A hand on the collar an' a quiet word, an' most o' them come along, for they're no' fighters. The ones who run always run for the Forlorn Cavern, so I've learned tae be standin' at the tunnel before they get there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    walk = {
      lines = { { id = "w_default", text = "Aye, an' I'll no' say where I learned it. King Magni's law has room for a dwarf who changes his trade, an' there's nae better catcher than one who knows where he'd have hidden himself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've walked these halls a long while, on one side o' the law or the other. This side pays steadier." } },
    _none = { { id = "tp_none", text = "I've no' heard, an' I hear most things." } },
  },
}

-- Thief Catcher Thunderbrew: patrols the halls of Ironforge. Cheerful, a Thunderbrew off the family trade.
P:NPC {
  key = "if_tc_thunderbrew", id = TODO_NPC("Thief Catcher Thunderbrew"), name = "Thief Catcher Thunderbrew", gender = "male",
  bible = "bibles/missed_b.md", role = "guard", tier = "service",
  communities = { "ironforge" }, temper = { "cheerful", "brisk" }, values = { "dutiful", "family" },
  notices = { "drink", "kin" },
  impression = {
    first = "Thief Catcher Thunderbrew walks his round through Ironforge whistling, and nods to half the shopkeepers by name. He looks too friendly for the work, which is very likely how he's so good at it.",
    third = "{name} met Thief Catcher Thunderbrew, a cheerful dwarf who patrols Ironforge for pickpockets.",
  },
  greetings = {
    { id = "g_default", text = "Mornin', citizen! Purse still where ye left it? Grand, then I've done my job an' we can both be on our way." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Still no' robbed, I hope, for it'd reflect badly on me." },
    { id = "g_drunk", when = { drunk = true }, text = "Ho, ye've been at the ale, an' good ale by the smell. Mind yer pockets, friend, for a merry dwarf is a cutpurse's favourite customer." },
  },
  notice = {
    { id = "n_dwarf", cat = "kin", when = { race = "Dwarf" },
      text = "Aye, I'm one o' those Thunderbrews, before ye ask. Nae, I cannae get ye a barrel, an' aye, everybody asks." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thief Catcher Thunderbrew, at yer service. I walk the wards an' keep the light-fingered honest, an' I do it wi' a smile, for a thief relaxes round a smilin' dwarf an' that's when I have him." },
      },
      again = {
        { id = "h_again", text = "What else? I've the Mystic Ward still tae walk." },
        { id = "h_again2", text = "Go on, but walk wi' me." },
      },
      choices = {
        { text = "A Thunderbrew who doesn't brew?", next = "brew" },
        { text = "What's the cleverest theft you've seen?", next = "clever" },
        { text = "Good day, thief catcher.", next = "END" },
      },
    },
    brew = {
      lines = { { id = "b_default", text = "There's enough o' my cousins in Kharanos tae drown the mountain in ale, an' they didnae need another pair o' hands at the vats. Besides, it was thieves after the family recipes that first got me interested in catchin' them." } },
      choices = {
        { text = "The Barleybrews, you mean?", next = "brew2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew2 = {
      lines = { { id = "b2_default", text = "Ha! I'll no' name names while I'm wearin' the King's badge. I'll only say that if a certain family from Brewnall ever sets foot in a certain cellar, I'd dearly love tae be the one on duty." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    clever = {
      lines = { { id = "c_default", text = "A gnome who walked out o' the bank wi' a sack an' a cheery wave, an' it was an hour before anyone thought tae ask what was in it. It turned out tae be his own washin', mind, but I admired the nerve, an' I've watched him ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born in Kharanos wi' malt in my nose. I came up the hill for the city watch an' never went back down." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, friend. Try the innkeeper in the Commons, for he hears more than I do." } },
  },
}

-- Thistleheart: gnome warlock trainer in Bonegrip's Runes and Dooms, Forlorn Cavern.
P:NPC {
  key = "if_thistleheart", id = TODO_NPC("Thistleheart"), name = "Thistleheart", title = "Warlock Trainer", gender = "male",
  bible = "bibles/missed_b.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "clinical", "courteous" }, values = { "control", "knowledge" },
  notices = { "class" },
  impression = {
    first = "Thistleheart teaches warlocks at the back of Bonegrip's Runes and Dooms, with his sleeves rolled to the elbow like a gnome about to service an engine. He is unfailingly polite, and his imp is unfailingly not.",
    third = "{name} met Thistleheart, a gnome warlock trainer in the Forlorn Cavern of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Good day. Please don't touch the circle on the floor, because it's holding something, and I'd rather it went on doing so." },
    { id = "g_lock", when = { class = "WARLOCK", faction = "Alliance" }, text = "Good day, colleague. You've kept your minion on a short leash, I see, which already tells me you've been taught properly." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Nothing has escaped since your last visit, which I mention only because people ask." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You're one of the Light's people, and you've come down here anyway. I shan't keep you long, and I promise the imp only bites when told." },
    { id = "n_gnome", cat = "class", when = { class = "WARLOCK", race = "Gnome" },
      text = "A gnome, and one of ours! Lago Blackwrench in the tunnel will have looked you over on your way in, and he worries, so do humour him." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Thistleheart, and I instruct warlocks, here in Master Bonegrip's shop, where the neighbours don't complain. Demonology is a discipline of control, and I teach it as one, with procedures and with consequences for skipping them." },
      },
      again = {
        { id = "h_again", text = "Was there anything further?" },
        { id = "h_again2", text = "Do go on; the circle will hold." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What procedures?", next = "procedures" },
        { text = "How do the dwarves take to having you here?", next = "dwarves" },
        { text = "Good day, Thistleheart.", next = "END" },
      },
    },
    procedures = {
      lines = { { id = "p_default", text = "One, draw the circle before you need it and not during. Two, never summon anything larger than you can dismiss while frightened. Three, write the true name down nowhere at all, because paper travels." } },
      choices = {
        { text = "And the consequences?", next = "procedures2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    procedures2 = {
      lines = { { id = "p2_default", text = "The demon supplies those, promptly and without my help. I've trained forty-one warlocks in this cavern and lost none, and I attribute that entirely to making them recite the list until they're sick of my voice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      lines = { { id = "d_default", text = "They tolerate us in the way one tolerates a furnace, as something useful that mustn't be left unattended. Master Bonegrip rents us the back room, Calder teaches the humans beside me, and the thief catchers look the other way so long as nothing gets out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a safety warden on the reactor level in Gnomeregan. I have always worked beside things that would kill me if I were careless." } },
    _none = { { id = "tp_none", text = "I'm afraid that lies outside my discipline. Master Bonegrip may have a book on it, at a price." } },
  },
}

-- Thonys Pillarstone: apprentice enchanter at Thistlefuzz Arcanery, Great Forge. Gimble's apprentice.
P:NPC {
  key = "if_thonys", id = TODO_NPC("Thonys Pillarstone"), name = "Thonys Pillarstone", title = "Apprentice Enchanter", gender = "male",
  bible = "bibles/missed_b.md", role = "worker", tier = "service",
  communities = { "ironforge" }, temper = { "curious", "plain-spoken" }, values = { "learning", "craft" },
  notices = { "craft" },
  impression = {
    first = "Thonys Pillarstone is a dwarf learning enchanting from gnomes at Thistlefuzz Arcanery, and he holds a runed rod as if it were a hammer he hasn't worked out how to swing. A faint glow clings to his beard and he keeps trying to brush it off.",
    third = "{name} met Thonys Pillarstone, a dwarf apprentice enchanter at Thistlefuzz Arcanery in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hello, friend. If my beard's glowin', dinnae tell me, for I've only just got it tae stop." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. Master Gimble's upstairs, an' he heard ye on the steps, so he'll be hidin' his notes." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "Ye've the craft, I can tell by the dust on yer cuffs. Does it get easier tae break a good axe down for the shards, or do ye wince every time?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thonys Pillarstone, apprentice enchanter. I came tae Master Gimble because I wanted tae know why a runed blade bites deeper, an' I've learned that the answer is long an' mostly in gnomish." },
      },
      again = {
        { id = "h_again", text = "What else? I'm only grindin' dust." },
        { id = "h_again2", text = "Aye, go on." },
      },
      choices = {
        { text = "What have you learned so far?", next = "learned" },
        { text = "Gimble seems a nervous sort of master.", next = "gimble" },
        { text = "I'll let you get back to it.", next = "END" },
      },
    },
    learned = {
      lines = { { id = "l_default", text = "That ye have tae unmake a thing before ye can make another thing better, which sits hard wi' a dwarf. I broke down a fine wee dagger last week for a pinch o' dust, an' I apologised tae it first." } },
      choices = {
        { text = "Is that so different from runecraft?", next = "learned2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned2 = {
      lines = { { id = "l2_default", text = "My grandfather cut runes intae stone an' said they held because the stone agreed tae it. The gnomes say it's all resonance an' quantities, an' I'm beginnin' tae think both are true an' neither side will admit it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gimble = {
      lines = { { id = "g_default", text = "He thinks half o' Ironforge is after his formulas, an' he may be right about a quarter o' it. He's a fine teacher once he's sure ye're no' a spy, which in my case took about two months. Tilli downstairs is easier, an' she sells me my rods." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Pillarstones are masons an' rune-cutters. I'm the first tae learn the gnomish way, an' the first whose beard lights up." } },
    _none = { { id = "tp_none", text = "I've no' got that far in the book. Ask Master Gimble, if ye can get him tae answer the door." } },
  },
}

-- Tilli Thistlefuzz: enchanting supplies at Thistlefuzz Arcanery, Great Forge. Kin to Gimble.
P:NPC {
  key = "if_tilli", id = TODO_NPC("Tilli Thistlefuzz"), name = "Tilli Thistlefuzz", title = "Enchanting Supplies", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "sensible", "amused" }, values = { "family", "plain dealing" },
  notices = { "craft" },
  impression = {
    first = "Tilli Thistlefuzz sells rods, vellum and reagents at Thistlefuzz Arcanery, and she is the calm half of the family business. She rolls her eyes at the ceiling whenever something thumps upstairs.",
    third = "{name} met Tilli Thistlefuzz, who sells enchanting supplies at Thistlefuzz Arcanery in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Yes, this is the Arcanery, and yes, we are open, whatever my cousin may have shouted down the stairs at you." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back! Gimble has decided you're probably not a spy, which is as warm as he gets." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "An enchanter, and one who's nearly out of dust, judging by how you're eyeing my shelves. I know the look, because I see it in the mirror at every month's end." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Tilli Thistlefuzz, and I run the shop floor, which means I sell the rods and reagents and tell people that Gimble will see them shortly. He does the teaching upstairs, once he's finished checking the stairs for eavesdroppers." },
      },
      again = {
        { id = "h_again", text = "Anything else I can help with?" },
        { id = "h_again2", text = "Yes? Don't mind the thumping, that's only him moving the desk again." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why is Gimble so suspicious?", next = "gimble" },
        { text = "How does an enchanter's shop fare beside the Forge?", next = "forge" },
        { text = "Thanks, Tilli.", next = "END" },
      },
    },
    gimble = {
      lines = { { id = "g_default", text = "He lost eleven years of notes when Gnomeregan fell, and he's convinced himself that someone took them and didn't simply leave them to the troggs. I think it's easier for him than believing they're just gone, so I let him check the stairs." } },
      choices = {
        { text = "That's kind of you.", next = "gimble2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gimble2 = {
      lines = { { id = "g2_default", text = "It's family, which is kindness with more sighing. He rewrote four of those years from memory in this very building, and I sold enough rods to keep us both fed while he did it, so we're about even." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    forge = {
      lines = { { id = "f_default", text = "Better than you'd think! Every smith on the ring wants his best piece to glow, and they're far too proud to climb our stairs themselves, so they send an apprentice with a list. Young Thonys came up with one of those lists and never went back down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept the accounts for a workshop in Gnomeregan. Now I keep them for Gimble, who believes numbers can be stolen too." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid. Gimble might, but he'd want to know why you're asking." } },
  },
}

-- Tisa Martine: a human woman by the bar in Bruuk's Corner, Military Ward.
P:NPC {
  key = "if_tisa", id = TODO_NPC("Tisa Martine"), name = "Tisa Martine", gender = "female",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "ironforge" }, temper = { "easygoing", "wry" }, values = { "good company", "plain talk" },
  notices = { "race", "drink" },
  impression = {
    first = "Tisa Martine is a human woman who stands at the bar in Bruuk's Corner as if she had always stood there, a head taller than everyone around her. She drinks dwarven ale without flinching and seems to know the regulars by their songs.",
    third = "{name} met Tisa Martine, a human who has made herself at home in Bruuk's Corner in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Pull up to the bar, there's room. Mind the beam on your way in, though I suppose that's only a worry for some of us." },
    { id = "g_human", when = { race = "Human" }, text = "Another tall one! Come and stand by me, and for once I won't be the only person in here who can see over the bar." },
    { id = "g_back", when = { metBefore = true }, text = "Back at Bruuk's? I knew you would be. Nobody comes here only once." },
    { id = "g_drunk", when = { drunk = true }, text = "Oh, you're well ahead of me, I see. Lean on the bar, it's what it's for." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Before you ask, yes, I can hold my ale, and no, I won't prove it again. Ask Bruuk how the last contest ended." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A night elf in a dwarven tavern, and I thought I stood out. Try the dark ale, and sip it, whatever the soldiers tell you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tisa Martine. I came up from Stormwind on the tram meaning to stay a week, and that was some while ago. The ale is better here, the beds are shorter, and nobody in Bruuk's has ever once asked me about the House of Nobles." },
      },
      again = {
        { id = "h_again", text = "What else? My mug's still half full." },
        { id = "h_again2", text = "Go on, I'm in no hurry tonight." },
      },
      choices = {
        { text = "What keeps a human in Ironforge?", next = "stay" },
        { text = "Tell me about Bruuk's Corner.", next = "bruuk" },
        { text = "You seem to know everyone here.", next = "regulars" },
        { text = "Enjoy your ale, Tisa.", next = "END" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "Dwarves say what they mean, and after Stormwind that's as good as a holiday. If a dwarf doesn't like you he tells you so over a drink, and by the end of the drink he's usually changed his mind." } },
      choices = {
        { text = "And Stormwind isn't like that?", next = "stay2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay2 = {
      lines = { { id = "s2_default", text = "In Stormwind people smile at you and then you hear about it from your landlord. I don't miss it, though I do miss the sun now and then, so I walk out to the gates at noon and stand in the snow like a fool." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bruuk = {
      lines = { { id = "b_default", text = "It's a soldiers' tavern, so it's loud by sundown and it's sung itself hoarse by midnight. Bruuk Barleybeard owns it and pours, and he could throw any man in here out of the door, which is why he so rarely has to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    regulars = {
      lines = { { id = "r_default", text = "You learn them fast when you're the one everybody stares at. The riflemen take the long table, the recruits from the Hall of Arms take whatever's left, and there's a meat seller called Sognar who comes by late and sells the last of his tray for a song." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm from Stormwind, Old Town side. I do a bit of letter writing for soldiers who'd rather not hold a pen." } },
    _none = { { id = "tp_none", text = "You've got me there. Ask Bruuk; a barkeep hears it all, sooner or later." } },
  },
}

-- Tynnus Venomsprout: shady dealer in the Forlorn Cavern (vials, a plain dagger, no questions).
P:NPC {
  key = "if_tynnus", id = TODO_NPC("Tynnus Venomsprout"), name = "Tynnus Venomsprout", title = "Shady Dealer", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "smooth", "evasive" }, values = { "discretion", "profit" },
  notices = { "class", "stealth" },
  impression = {
    first = "Tynnus Venomsprout does his business in a dim corner of the Forlorn Cavern, from a case he can close with one hand. He smiles a great deal and answers every question with a slightly different question.",
    third = "{name} met Tynnus Venomsprout, a gnome in the Forlorn Cavern who sells vials and asks nothing.",
  },
  greetings = {
    { id = "g_default", text = "Well, hello. You look like someone with a need and no wish to explain it, and those are exactly the customers I prefer." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, a professional. Come round to this side of the case, where the light's worse and the selection's better." },
    { id = "g_back", when = { metBefore = true }, text = "We've met, haven't we? Or we haven't, if anyone asks." },
  },
  notice = {
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, in the Forlorn Cavern. I sell empty vials, good sir, and what could be more innocent than an empty vial?" },
    { id = "n_alch", cat = "class", when = { profession = "Alchemy" },
      text = "You brew, I think. Then you know that glass is glass, and what goes into it afterwards is entirely the customer's affair." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tynnus Venomsprout, purveyor of containers. I sell vials of several grades and one very plain dagger, and I've found that people rarely buy the one without eventually wanting the other." },
      },
      again = {
        { id = "h_again", text = "Was there something else, quietly?" },
        { id = "h_again2", text = "Go on. I didn't hear the last thing you said, either." },
      },
      choices = {
        { text = "Show me what's in the case.", next = "BUSINESS" },
        { text = "Why 'shady', if it's only vials?", next = "shady" },
        { text = "Don't the thief catchers bother you?", next = "catchers" },
        { text = "We never spoke.", next = "END" },
      },
    },
    shady = {
      lines = { { id = "s_default", text = "A fair question! A leaded vial has precisely one use, and it isn't cough syrup. I don't make what goes in it and I don't ask who it's for, and that small distance is the whole of my business and all of my defence." } },
      choices = {
        { text = "And that distance lets you sleep?", next = "shady2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shady2 = {
      lines = { { id = "s2_default", text = "Like an infant, thank you. I lost a workshop, a street and most of a family to Thermaplugg's gas, and after that a gnome either worries about everything or about nothing. I chose the one that was cheaper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    catchers = {
      lines = { { id = "c_default", text = "They walk past twice a day and look at my case very hard. I have a licence for glassware with the Senate's seal on it, and I keep it where they can see it, and so far a hard look has never cost me a copper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I blew laboratory glass in Gnomeregan, perfectly respectably. The respectable market didn't survive the move." } },
    _none = { { id = "tp_none", text = "I wouldn't know anything about that, and I'd say the same if I did." } },
  },
}

-- Uthrar Threx: apprentice tailor at Stonebrow's Clothier, Great Forge. (Forever: ends Camping 101: Tailoring.)
P:NPC {
  key = "if_uthrar", id = TODO_NPC("Uthrar Threx"), name = "Uthrar Threx", title = "Apprentice Tailor", gender = "male",
  bible = "bibles/missed_b.md", role = "worker", tier = "quest",
  communities = { "ironforge" }, temper = { "earnest", "flustered" }, values = { "learning", "pride in work" },
  notices = { "craft", "kit" },
  impression = {
    first = "Uthrar Threx is the apprentice at Stonebrow's Clothier, a young dwarf with pins stuck in his sleeve and a length of blue thread caught in his beard. He works slowly and unpicks half of it, with his tongue between his teeth.",
    third = "{name} met Uthrar Threx, the apprentice tailor at Stonebrow's Clothier in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Oh! Hello. Give me a moment, for if I lose count o' these stitches Poranna will have somethin' tae say about it." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I've finished a whole shirt since ye were here, an' both sleeves are the same length this time." },
    { id = "g_camp", when = { questActive = TODO_QUEST("Camping 101: Tailoring") }, text = "Ye're here for the camp lesson? Master Jormund said I could teach that one myself, so sit down an' I'll try no' tae prick ye." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Ye sew as well? Tell me truly, how long before yer seams ran straight, for Master Jormund says a year an' it's been near two." },
    { id = "n_torn", cat = "kit", when = { maxLevel = 15 },
      text = "Yer cloak's torn at the shoulder, did ye know? I could tell ye how tae mend it, if ye've a needle." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Uthrar Threx, apprentice tae Master Jormund Stonebrow. I cut the linen, sew the plain seams an' sweep up the soot, an' when I've done all three right in one day, he lets me try a buttonhole." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Tailoring") },
          text = "A tailor's the one who keeps a camp dry, for somebody has tae stitch the canvas an' patch the bedrolls. Show me ye can sew a seam that holds, an' I'll show ye what tae make for yer fire." },
      },
      again = {
        { id = "h_again", text = "What else? I'm glad o' the rest, honestly." },
        { id = "h_again2", text = "Go on, I can listen an' pin." },
      },
      choices = {
        { text = "What's Jormund like as a master?", next = "master" },
        { text = "Poranna seems to keep you on your toes.", next = "poranna" },
        { text = "Why tailoring, for a dwarf?", next = "why" },
        { text = "What does a tailor bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Tailoring") } },
        { text = "Mind your stitches, Uthrar.", next = "END" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "He's hard tae please an' he's fair, an' he's never once shouted, though he sighs in a way that's worse. He'll hold my seam up tae the Forge light an' say nothin' at all, an' I know tae unpick it." } },
      choices = {
        { text = "Has he ever praised your work?", next = "master2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master2 = {
      lines = { { id = "m2_default", text = "Once. I hemmed a smith's apron, an' he looked at it a long while an' said, 'That'll do.' I've been tryin' tae earn another 'That'll do' ever since, an' I think the next one's a year off." } },
      choices = {
        { text = "What happened to the apron?", next = "master3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master3 = {
      lines = { { id = "m3_default", text = "A smith on the ring bought it, an' he's wearin' it still, burn holes an' all. I walk past his anvil the long way round some mornin's, only tae see that my hem's holdin'." } },
      choices = { { text = "That's a good thing to check on. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    poranna = {
      lines = { { id = "p_default", text = "She says I've ten thumbs, an' she's said it every day for two years. But she slips me the good needles when Master Jormund's no' lookin', so I've decided she likes me, an' I'll thank ye no' tae tell her I know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "I tried the forge first, like every lad, an' I was frightened o' the fire, which is a sore thing for a dwarf tae admit. Cloth doesnae burn ye an' it forgives a mistake, an' I found I liked makin' a thing that keeps somebody warm." } },
      choices = { { text = "There's no shame in that. Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "c_default", text = "Canvas for the lean-to, a patch kit for the bedrolls, an' a spare length o' linen, which is a bandage or a sling or a strainer for the tea, dependin' on the night. Ye'd be amazed what a camp asks of a bit o' cloth." } },
      choices = { { text = "I'll pack some linen. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Threxes are Dun Morogh herders. I grew up shearin' rams, so I suppose I've only followed the wool indoors." } },
    _none = { { id = "tp_none", text = "I dinnae ken, sorry. Master Jormund might, or Poranna, an' she'll tell ye whether ye ask or no'." } },
  },
}
