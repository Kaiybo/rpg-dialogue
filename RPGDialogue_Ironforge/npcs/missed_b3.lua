-- Ironforge folk the first passes missed, part three: Goldfury's bowyer, a wandering meat seller, the Berryfizz
-- shop's supplies and apprentice, the three thief catchers who walk the halls, the Forlorn Cavern's warlock
-- trainer and shady dealer, the Arcanery's apprentice and supplies, a human at Bruuk's bar, and the tailor's apprentice.
-- Voices: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hello again, friend! Mistress Berryfizz says I'm improvin', an' I'd like ye tae be the first tae hear it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ah, it's you. I'll keep my flasks well back from ye, if ye dinnae mind, for I've a feelin' it's safer." },
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
        { id = "h_again_x0", when = { profession = "Alchemy" }, text = "Back again? Come an' smell this, an' tell me if it's ready." },
      },
      choices = {
        { text = "Why alchemy, and why from gnomes?", next = "why" },
        { text = "That bench is too small for you.", next = "bench" },
        { text = "Is your brother well now?", next = "brother" },
        { text = "What's Mistress Tally like to work for?", next = "tally" },
        { text = "Swiftthistle goes in after the boil.", next = "BACK", when = { profession = "Alchemy" }, reply = "That's what my nose said! I'll tell Mistress Tally a fellow alchemist agrees wi' me, an' then I'll duck.", fx = { affinity = 1 } },
        { text = "Do the gnomes treat you well?", next = "gnomes", when = { race = "Dwarf" } },
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
    brother = {
      lines = { { id = "xbrother_default", text = "Hale as a ram, an' back wi' the quarrymen, swingin' a pick as if he'd never been sick a day. He jokes that I owe him a trade, since his fever's what sent me here." } },
      choices = {
        { text = "Does he thank you?", next = "thanks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thanks = {
      lines = { { id = "xthanks_default", text = "In his way, which is tae send me every odd root an' leaf he finds in the hills an' ask if it'll make him rich. Most o' them are weeds, but one was a fine bit o' mageroyal, so I've stopped laughin'." } },
      choices = {
        { text = "Could alchemy replace the priests' healing?", next = "priests" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests = {
      narr = "He holds a flask up to the lamp and watches it settle.",
      lines = { { id = "xpriests_default", text = "My father says trust the Light an' leave the bottles tae gnomes, an' Mistress Tally says a flask works whether ye pray or no'. I've seen both save a life. Which would ye trust first?" } },
      choices = {
        { text = "The Light first. Faith heals more than the body.", next = "BACK", reply = "Aye, the priests would bless ye for that, an' my father would buy ye a drink. I'll keep my flasks handy all the same.", fx = { align = { light = 1 } } },
        { text = "The flask. It works without anyone's blessing.", next = "BACK", reply = "Mistress Tally would hire ye on the spot. Dinnae tell the Hall of Mysteries I nodded.", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    tally = {
      lines = { { id = "xtally_default", text = "Sharp, quick an' never wrong about a measure, which is maddenin' when ye're a dwarf who's been pourin' ale by eye all his life. She's patient wi' me, though, an' she's never once laughed at my beard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomes = {
      lines = { { id = "xgnomes_default", text = "Better than some dwarves treat them, I'll say that. They teased me for a week about my size, an' then they built me a stool so I wouldnae stoop, an' I've had nae complaints since." } },
      choices = { { text = "That was kind of them.", next = "BACK", reply = "It was, an' I'll no' forget it. Tinker Town looks after its own, even when its own is a dwarf." } },
    },
  },
  topics = {
    tinker_town = { { id = "tp_xtinker_town", text = "I work in Tinker Town, among the gnomes. It's loud an' it smells o' sulphur, an' I'd no' trade it." } },
    hall_of_mysteries = { { id = "tp_xhall_of_mysteries", text = "The priests in the Hall o' Mysteries heal wi' prayer, an' we heal wi' bottles. There's room for both." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, a citizen I dinnae have tae watch! Walk wi' me a step, then, for it makes a change from the pickpockets." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I know that walk, an' I know yer name now as well. One step out o' line an' ye'll be explainin' yerself tae the guard." },
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
        { id = "h_again_x0", when = { class = "ROGUE" }, text = "Back again? Keep yer hands where I can see them while we talk." },
      },
      choices = {
        { text = "The law keeps Ironforge safe, and every citizen should obey it.", next = "BACK", reply = "That's the right o' it, an' it's why I walk this round twice a night.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws protect the rich. Breaking those is no crime to me.", next = "BACK", reply = "Then ye'll be breakin' them where I cannae see ye, for I'll haul ye in all the same.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Are there many thieves in Ironforge?", next = "thieves" },
        { text = "How do you spot one?", next = "spot" },
        { text = "You've caught the same cutpurse four times?", next = "cutpurse" },
        { text = "What happens when you catch one?", next = "catch" },
        { text = "I'm no thief, I'll have you know.", next = "BACK", when = { class = "ROGUE" }, reply = "Then ye'll no' mind me watchin' yer hands while we talk. An honest dwarf has naethin' tae fear from a look." },
        { text = "Do you watch gnomes closer than dwarves?", next = "gnomes", when = { race = "Gnome" } },
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
    cutpurse = {
      lines = { { id = "xcutpurse_default", text = "Aye, a lad from the Forlorn Cavern wi' quick hands an' nae sense. He's no' wicked, only hungry an' bored, an' every time I catch him he swears it's the last." } },
      choices = {
        { text = "What's his name?", next = "name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      narr = "He rubs the back of his neck and looks away down the hall.",
      lines = { { id = "xname_default", text = "I'll no' say it, for he's got a mother in the Commons who thinks he works for a jeweller. She'd die o' shame, an' it's no' her fault he's daft." } },
      choices = {
        { text = "Why not lock him up for good?", next = "lock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lock = {
      lines = { { id = "xlock_default", text = "The guard captain says the same, every time I bring him in. Lock him up an' he learns from worse thieves, or find him a trade an' maybe he stops. What would ye do?" } },
      choices = {
        { text = "Find him a trade. A cell only teaches worse.", next = "BACK", reply = "Aye, that's my thinkin', an' I've a smith in mind who needs an apprentice. I'll see what I can do.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Lock him up. Four chances is enough.", next = "BACK", reply = "That's what the captain says, an' I cannae say he's wrong. Next time, maybe, I'll let him have his way.", fx = { align = { light = -1 } } },
      },
    },
    catch = {
      lines = { { id = "xcatch_default", text = "A hand on the collar, a walk tae the guard captain, an' a night in the cells tae think it over. Most o' them are back on the halls in a week, an' I catch them again in a month." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomes = {
      lines = { { id = "xgnomes_default", text = "No' closer, but no' less either, for since the refugees came, some o' the Senate blame every lost purse on yer folk. I've caught more dwarves than gnomes, an' I tell them so." } },
      choices = { { text = "Thank you for that.", next = "BACK", reply = "I'm only tellin' the truth. A thief's a thief, whatever height he stands." } },
    },
  },
  topics = {
    commons = { { id = "tp_xcommons", text = "The Commons is the worst for pickpockets. Too many folk countin' coin in the open." } },
    background = { { id = "tp_bg", text = "Eleven years on the halls. I've caught the same cutpurse four times, an' we're on first-name terms." } },
    _none = { { id = "tp_none", text = "That's no' on my round, friend, so ye'd best ask one o' the gate guards." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye saw me this time, an' before I spoke. That's twice now, an' I'm startin' tae think ye'd make a fine catcher yerself." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've been watchin' ye since the Commons, an' ye didnae notice. Keep it that way, an' keep yer hands still." },
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
        { id = "h_again_x0", when = { class = "ROGUE" }, text = "Ye again. I saw ye coming two halls back, so dinnae try it." },
      },
      choices = {
        { text = "A thief caught should face the king's justice, not a back alley.", next = "BACK", reply = "Aye, for justice in the dark is just another crime, an' I'll no' have it on my hands.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Sometimes a thief deserves to get away with it.", next = "BACK", reply = "Some do, an' I've let none o' them, for I cannae read hearts an' neither can ye.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "How do you catch someone you can't see?", next = "unseen" },
        { text = "You walk like a thief yourself.", next = "walk" },
        { text = "What's the worst you've ever caught?", next = "worst" },
        { text = "What does the King think of your past?", next = "king" },
        { text = "Teach me how you spot the darker shadow.", next = "BACK", when = { class = "ROGUE" }, reply = "It's no' a thing ye teach, it's a thing ye learn by bein' caught. Get caught a few times, an' ye'll see it too." },
        { text = "Night elves walk quieter still.", next = "BACK", when = { race = "NightElf" }, reply = "Aye, an' I've chased one or two through the Mystic Ward. They're quiet, but they're tall, an' tall shows." },
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
    worst = {
      narr = "He goes very still, and his voice drops even lower.",
      lines = { { id = "xworst_default", text = "A Dark Iron, in the Mystic Ward, wi' soot rubbed off his skin an' a Bronzebeard cloak over his shoulders. He was countin' the guards on the bridge, an' writin' it down in their script." } },
      choices = {
        { text = "What happened to him?", next = "spy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spy = {
      lines = { { id = "xspy_default", text = "The King's guard took him, an' I never heard what became o' him, which tells me enough. The notes went tae the Senate, an' some o' the senators started takin' the Dark Iron threat a wee bit more seriously." } },
      choices = {
        { text = "Are all Dark Irons enemies?", next = "darkiron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkiron = {
      lines = { { id = "xdarkiron_default", text = "Most o' them serve Thaurissan an' his fire lord, but there's the Thorium Brotherhood, who'll trade wi' anyone. Some in the city say every Dark Iron is an enemy, an' some say no' every one. Where do ye stand?" } },
      choices = {
        { text = "Not every Dark Iron serves Thaurissan.", next = "BACK", reply = "Aye, an' I'd like tae believe that, though I've never met one who didnae. Keep yer eyes open, all the same.", fx = { align = { light = 1 } } },
        { text = "Every Dark Iron is an enemy. Trust none.", next = "BACK", reply = "That's the safe view, an' most o' the city holds it. I'll no' argue, for I've seen what they do.", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    king = {
      lines = { { id = "xking_default", text = "King Magni's law has room for a dwarf who changes his trade, an' I've changed mine. I dinnae know if the King knows my past, an' I've never asked. Some things are better left in the shadow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dark_iron = { { id = "tp_xdark_iron", text = "I caught a Dark Iron spy in the Mystic Ward once. There are more, I'm sure o' it." } },
    blackrock_depths = { { id = "tp_xblackrock_depths", text = "Thaurissan's city lies under Blackrock. I'd no' go there for all the gold in Ironforge." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Mornin', mornin'! Ye're my favourite sort o' citizen, for ye never get robbed an' ye always stop tae chat." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Mornin'. I'll keep half an eye on the purses near ye, if it's all the same, for no reason I'd care tae say aloud." },
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
        { id = "h_again_x0", when = { race = "Dwarf" }, text = "Back again? Still nae barrel, before ye ask." },
      },
      choices = {
        { text = "The rules are the rules, even in the Commons on market day.", next = "BACK", reply = "Grand, that's my view exactly, an' it saves a deal o' arguin'.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "A hungry lad pinching bread shouldn't be locked up for it.", next = "BACK", reply = "Ach, I'd buy the lad a loaf myself, but I'd still have tae take him in, more's the pity.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "A Thunderbrew who doesn't brew?", next = "brew" },
        { text = "What's the cleverest theft you've seen?", next = "clever" },
        { text = "Tell me about your cousins in Kharanos.", next = "cousins" },
        { text = "Walk me through your round.", next = "round" },
        { text = "You smile at thieves?", next = "smile", when = { class = "ROGUE" } },
        { text = "Can you get me a Thunderbrew barrel?", next = "BACK", when = { race = "Dwarf" }, reply = "Nae, I cannae, an' if I could, I'd have one under my own bed. Ask Ragnar in Kharanos, an' tell him I said nae." },
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
    cousins = {
      lines = { { id = "xcousins_default", text = "There's a dozen o' them at the distillery, an' Ragnar's the eldest, so he runs the place. They're good folk, an' they make the best ale in Khaz Modan, an' they never stop tellin' me so." } },
      choices = {
        { text = "Do you visit home often?", next = "home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      narr = "He stops whistling for the first time.",
      lines = { { id = "xhome_default", text = "Once a season, for a feast an' a fight wi' my uncle about my trade. He thinks a Thunderbrew should be brewin', an' I think a Thunderbrew should be wherever he's most use." } },
      choices = {
        { text = "Would you ever look the other way for kin?", next = "kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "xkin_default", text = "I've thought on it, I'll admit, for my cousins have been known tae sell a cask or two wi'out payin' the King's tax. The law's the law, but kin's kin. Which would ye choose?" } },
      choices = {
        { text = "The law's the law, kin or no kin.", next = "BACK", reply = "Aye, that's what the badge says, an' that's what I'll do. I'll just hope they never make me.", fx = { align = { order = 1 } } },
        { text = "Family first. The King has plenty of tax already.", next = "BACK", reply = "Shh! Dinnae say that where a senator might hear. But aye, I've thought the same.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    round = {
      lines = { { id = "xround_default", text = "The Commons first, then the Great Forge, then the Mystic Ward an' back by the Military Ward, an' a stop at the inn for a pint between. It takes most o' a day, an' I see half the city doin' it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smile = {
      lines = { { id = "xsmile_default", text = "Aye, for a thief who thinks ye're friendly gets careless. I've caught more cutpurses wi' a smile than wi' a hand on the collar, an' the smile's cheaper." } },
      choices = { { text = "That's clever.", next = "BACK", reply = "It's no' clever, it's just knowin' folk. A frown makes a thief run." } },
    },
  },
  topics = {
    kharanos = { { id = "tp_xkharanos", text = "My kin run the distillery in Kharanos. I visit once a season an' argue wi' my uncle." } },
    belm = { { id = "tp_xbelm", text = "Belm in Kharanos keeps a fine inn, an' he pours my cousins' ale. I'd no' have it any other way." } },
    background = { { id = "tp_bg", text = "Born in Kharanos wi' malt in my nose. I came up the hill for the city watch an' never went back down." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, friend. Try the innkeeper in the Commons, for he hears more than I do." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you! My beard's no' glowin' today, which means I can shake yer hand without worryin' about it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ah, it's you. Master Gimble's locked his notes away again, an' I cannae say I blame him this time." },
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
        { id = "h_again_x0", when = { profession = "Enchanting" }, text = "Back again? Come an' see what I've broken down today." },
      },
      choices = {
        { text = "What have you learned so far?", next = "learned" },
        { text = "Gimble seems a nervous sort of master.", next = "gimble" },
        { text = "Your grandfather cut runes into stone?", next = "grandpa" },
        { text = "What's Thistlefuzz Arcanery like?", next = "arcanery" },
        { text = "I wince every time I break down a good axe.", next = "BACK", when = { profession = "Enchanting" }, reply = "Aye, so do I, an' I'm glad tae hear it's no' only me. Master Gimble says we'll grow out o' it.", fx = { affinity = 1 } },
        { text = "Enchanting is just arcane bookkeeping.", next = "BACK", when = { class = "MAGE" }, reply = "That's what Master Gimble says, more or less. I'd only add that the books keep tryin' tae set my beard on fire." },
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
      lines = { { id = "gimble_default", text = "He thinks half o' Ironforge is after his formulas, an' he may be right about a quarter o' it. He's a fine teacher once he's sure ye're no' a spy, which in my case took about two months. Tilli downstairs is easier, an' she sells me my rods." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grandpa = {
      lines = { { id = "xgrandpa_default", text = "Aye, he was a rune-cutter for the masons, an' his work's on half the old doors in the Hall of Explorers. He said a rune held because the stone agreed tae hold it, an' he'd never heard o' resonance." } },
      choices = {
        { text = "Do his runes still hold?", next = "hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      narr = "He turns the runed rod in his hand like a hammer he's weighing.",
      lines = { { id = "xhold_default", text = "Every one, an' some are older than me. The gnomes come an' measure them wi' their wee gadgets an' shake their heads, for by their numbers they shouldnae work at all." } },
      choices = {
        { text = "So which way is right?", next = "right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    right = {
      lines = { { id = "xright_default", text = "That's what keeps me up at night. My grandfather would say the old rune-lore is enough, an' Master Gimble says the gnomish way is the future. What do ye think?" } },
      choices = {
        { text = "Your grandfather's lore has held for centuries. Trust it.", next = "BACK", reply = "Aye, it has, an' I'll no' forget it. But I'll keep learnin' the gnomish way, just in case.", fx = { align = { order = 1 } } },
        { text = "Learn the new way. Old lore can't explain everything.", next = "BACK", reply = "Master Gimble would hug ye, if he wasnae so shy. I'll tell him ye said it.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    arcanery = {
      lines = { { id = "xarcanery_default", text = "Small, bright an' full o' things that hum when ye walk past them. Master Gimble keeps the good formulas upstairs, an' he keeps the door locked even when he's inside." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    tinker_town = { { id = "tp_xtinker_town", text = "I study in Tinker Town, at the Arcanery. It's the only place in Ironforge where my beard glows an' naebody stares." } },
    hall_of_mysteries = { { id = "tp_xhall_of_mysteries", text = "The priests in the Hall o' Mysteries dinnae trust enchanters much. I cannae blame them." } },
    background = { { id = "tp_bg", text = "Pillarstones are masons an' rune-cutters. I'm the first tae learn the gnomish way, an' the first whose beard lights up." } },
    _none = { { id = "tp_none", text = "I've no' got that far in the book. Ask Master Gimble, if ye can get him tae answer the door." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my fellow tall one! Come and lean on the bar with me, for the company's improved the moment you walked in." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. There's room at the bar, I suppose, though I'd rather you took the far end of it." },
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
        { id = "h_again_x0", when = { race = "Human" }, text = "Back again? Stand by me, and let's be tall together." },
      },
      choices = {
        { text = "What keeps a human in Ironforge?", next = "stay" },
        { text = "Tell me about Bruuk's Corner.", next = "bruuk" },
        { text = "You seem to know everyone here.", next = "regulars" },
        { text = "You write letters for soldiers?", next = "letters" },
        { text = "What's the news from Stormwind?", next = "news" },
        { text = "How did Bruuk's drinking contest end?", next = "contest", when = { race = "Dwarf" } },
        { text = "Do you pray to the Light up here?", next = "BACK", when = { class = "PRIEST" }, reply = "When I remember, and the Mystic Ward's a fine place for it. The dwarves pray louder than we do in Stormwind, but the Light hears them just the same." },
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
    letters = {
      lines = { { id = "xletters_default", text = "For the riflemen who'd rather face an orc than a pen, and there are more of those than you'd think. They tell me what to say, and I make it sound like they meant it." } },
      choices = {
        { text = "What do they write?", next = "write" },
        { text = "Something else.", next = "BACK" },
      },
    },
    write = {
      narr = "She turns her mug slowly on the bar and doesn't drink.",
      lines = { { id = "xwrite_default", text = "To mothers, mostly, and wives, and once to a ram breeder who'd sold a lad a bad ram. Some of them want to sound brave, and some just want to say they're cold and they miss the food." } },
      choices = {
        { text = "Do you ever soften bad news?", next = "soften" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soften = {
      lines = { { id = "xsoften_default", text = "I had to write to a widow last winter, and the sergeant wanted me to say her husband died quick and brave. I didn't know if he had. Should I have written it anyway?" } },
      choices = {
        { text = "Write it plain. The truth is kinder in the end.", next = "BACK", reply = "That's what I did, more or less, and she wrote back to thank me. I think you're right, though it didn't feel right at the time.", fx = { align = { honor = 1 } } },
        { text = "Soften it. Let her keep some comfort.", next = "BACK", reply = "That's what the sergeant wanted, and maybe he was right. I still think about it.", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    news = {
      lines = { { id = "xnews_default", text = "Bolvar Fordragon still sits as regent for the young prince, and the nobles still whisper, and the taxes are still too high. Nothing ever changes in Stormwind except the price of bread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    contest = {
      lines = { { id = "xcontest_default", text = "He drank until he fell asleep on the bar, and I kept drinking till I couldn't see straight. We both claimed victory, and the riflemen still argue about it." } },
      choices = { { text = "So who won?", next = "BACK", reply = "I did, of course. Bruuk says otherwise, but Bruuk was asleep." } },
    },
  },
  topics = {
    commons = { { id = "tp_xcommons", text = "The Commons is too loud for me. I'll take Bruuk's Corner, where it's only the soldiers shouting." } },
    background = { { id = "tp_bg", text = "I'm from Stormwind, Old Town side. I do a bit of letter writing for soldiers who'd rather not hold a pen." } },
    _none = { { id = "tp_none", text = "You've got me there. Ask Bruuk; a barkeep hears it all, sooner or later." } },
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
