-- Stormwind folk with no conversation yet: the battlemasters in the keep's War Room (Elfarran,
-- Lady Hoteshem, Thelman Slatefist) and Mithras Ironhill at the map, Master Sergeant Maclure of
-- the war effort, the holiday sellers in the Trade District (Guchie and Khole Jinglepocket for
-- Winter Veil, Lillian Singh for Midsummer, Emmithue Smails for Children's Week), Squire Rowe at
-- the gate, Marshal Reginald Windsor on the day of the Great Masquerade, Acolyte Porena and the imp
-- Zggi beneath the Slaughtered Lamb, and "Priestess Tyriona", the disguise Tyrion's spybot wears.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Elfarran: night elf Sentinel, Warsong Gulch battlemaster in the War Room.
P:NPC {
  key = "sw_elfarran", id = TODO_NPC("Elfarran"), name = "Elfarran", title = "Warsong Gulch Battlemaster", gender = "female",
  role = "soldier", tier = "service",
  communities = { "stormwind" }, temper = { "cold", "watchful" }, values = { "dutiful", "brave" },
  notices = { "watch", "kit" },
  impression = {
    first = "She speaks of the Warsong orcs as a debt still unpaid.",
    third = "{name} met Elfarran of the Silverwing Sentinels, who sends volunteers to Warsong Gulch.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. If you have come to defend Ashenvale, the Silverwing Sentinels have need of you." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good; the gulch has not grown any quieter since we last spoke." },
  },
  notice = {
    { id = "n_ne", cat = "watch", when = { race = "NightElf" },
      text = "A daughter or son of Teldrassil, so far from the forest. You know what the orcs are cutting, then, and why we fight." },
    { id = "n_low", cat = "kit", when = { maxLevel = 9 },
      text = "You are too young for the gulch yet, though I honour your will. Come back when you have seen more battles." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Elfarran of the Silverwing Sentinels, and I send fighters to Warsong Gulch. The Warsong orcs fell our trees for their war, and we mean to make them pay for every one.", fx = { learn = { "warsong", "sentinels" } } } },
      again = {
        { id = "h_again", text = "What else would you ask? Be brief; the Sentinels do not wait." },
        { id = "h_again2", text = "Speak, then. I am listening." },
      },
      choices = {
        { text = "What is the fight in Warsong Gulch?", next = "gulch" },
        { text = "Why recruit here, so far from Ashenvale?", next = "far" },
        { text = "I wish to join the battle.", next = "BUSINESS" },
        { text = "Elune guide you.", next = "END" },
      },
    },
    gulch = {
      lines = { { id = "g_default", text = "The Warsong clan holds a lumber camp at the gulch, and they strip the forest bare to feed their war. We take their banner and carry it home, and they try to take ours, and every flag returned is a grove spared for another day." } },
      choices = {
        { text = "Why not simply drive them out?", next = "drive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drive = {
      lines = { { id = "d_default", text = "We have tried, and each time more of them come down from the Barrens. The kaldorei are few, and so we must fight cleverly rather than with numbers, which is why we welcome humans and dwarves to the line." } },
      choices = {
        { text = "The forest deserves defending with every blade.", next = "BACK", reply = "It does, and it remembers who stood for it. Ashenvale will remember you.", fx = { align = { order = -1 } } },
        { text = "Trees grow back. Soldiers don't.", next = "BACK", reply = "Spoken like one who will live a short life. These trees saw the War of the Ancients, and they will not grow back in yours.", fx = { align = { order = 1 } } },
      },
    },
    far = {
      lines = { { id = "f_default", text = "Because Stormwind is where the Alliance gathers its strength, and the Sentinels cannot hold Ashenvale alone. Your king's city has many swords and few reasons to use them, so I give it one." } },
      choices = { { text = "A fair trade of swords. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have served the Sentinels longer than your kingdom has had a name. Now I serve them here, among stone." } },
    _none = { { id = "tp_none", text = "That is not my concern, and I will not pretend it is. Ask one of your own people." } },
  },
}

-- Lady Hoteshem: Stromgarde noblewoman, Arathi Basin battlemaster for the League of Arathor.
P:NPC {
  key = "sw_lady_hoteshem", id = TODO_NPC("Lady Hoteshem"), name = "Lady Hoteshem", title = "Arathi Basin Battlemaster", gender = "female",
  role = "soldier", tier = "service",
  communities = { "stormwind" }, temper = { "proud", "brisk" }, values = { "dutiful", "family" },
  notices = { "watch", "kit" },
  impression = {
    first = "She wants Arathi back, and asks every soldier to help take it.",
    third = "{name} met Lady Hoteshem of the League of Arathor, who sends fighters to Arathi Basin.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. The League of Arathor needs fighters, and you have the look of one." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Have you come to sign on at last, or only to admire the map?" },
  },
  notice = {
    { id = "n_warrior", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Good plate and a steady arm. The basin needs exactly that at its farms and stables." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Lady Hoteshem of the League of Arathor, and I gather fighters for Arathi Basin. The Forsaken's Defilers want the basin's farms and mines, and Stromgarde will not give up another field of its homeland.", fx = { learn = { "stromgarde" } } } },
      again = {
        { id = "h_again", text = "What else would you know? The league is waiting." },
        { id = "h_again2", text = "Ask, and then decide. Arathor has waited long enough." },
      },
      choices = {
        { text = "What is the League of Arathor?", next = "league" },
        { text = "What's in the basin worth fighting for?", next = "basin" },
        { text = "I'll fight for Arathor.", next = "BUSINESS" },
        { text = "Good day, my lady.", next = "END" },
      },
    },
    league = {
      lines = { { id = "l_default", text = "We are what remains of Stromgarde's loyal sons and daughters, along with any Alliance blade willing to stand with us. Arathor was the first kingdom of men, and we mean to hold its land against the dead." } },
      choices = {
        { text = "Stromgarde stood alone when it left the Alliance.", next = "left" },
        { text = "Something else.", next = "BACK" },
      },
    },
    left = {
      lines = { { id = "le_default", text = "Lord Thoras made his choice, and many of us paid for it. I will not speak ill of my king's house to a stranger, but I will say that Stromgarde has learned what standing alone costs, and the league is our answer." } },
      choices = {
        { text = "A kingdom should keep its oaths, whatever the cost.", next = "BACK", reply = "It should, and the league keeps ours now. Let that be enough.", fx = { align = { honor = 1 } } },
        { text = "A king must look after his own first.", next = "BACK", reply = "So Thoras said. Look where it left his people.", fx = { align = { honor = -1 } } },
      },
    },
    basin = {
      lines = { { id = "b_default", text = "The farm, the stables, the mine, the lumber mill and the blacksmith, every one of them a living for Arathi families once. Whoever holds the most of them feeds an army, and I would rather it be ours." } },
      choices = { { text = "Then I'll help you hold them. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My family held land in the Highlands for generations. The orcs took it, then the dead, and now I mean to take it back." } },
    _none = { { id = "tp_none", text = "That is a matter for others. My mind is on Arathi, and it stays there." } },
  },
}

-- Thelman Slatefist: dwarf of the Stormpike Guard, Alterac Valley battlemaster.
P:NPC {
  key = "sw_thelman_slatefist", id = TODO_NPC("Thelman Slatefist"), name = "Thelman Slatefist", title = "Alterac Valley Battlemaster", gender = "male",
  role = "soldier", tier = "service",
  communities = { "stormwind" }, temper = { "gruff", "jovial" }, values = { "brave", "family" },
  notices = { "kit", "watch" },
  impression = {
    first = "He talks of Alterac's snow like a man who misses it.",
    third = "{name} met Thelman Slatefist of the Stormpike Guard, who sends fighters to Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {g:lad|lass}! Ye've the look o' someone who'd like a proper fight in proper snow." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, eh? The valley's still there, and so are the Frostwolves, more's the pity." },
  },
  notice = {
    { id = "n_dwarf", cat = "watch", when = { race = "Dwarf" },
      text = "A dwarf! Good. Ye'll not complain about the cold like these soft-handed humans do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Thelman Slatefist o' the Stormpike Guard. We dug intae Alterac Valley for what's under it, and the Frostwolf orcs say it's theirs, so I'm here gatherin' fighters tae settle the matter.", fx = { learn = { "alterac" } } } },
      again = {
        { id = "h_again", text = "Aye, what else? Speak up, the War Room echoes." },
        { id = "h_again2", text = "Go on, ask. I've nothin' but time an' maps." },
      },
      choices = {
        { text = "Why do the Stormpike want the valley?", next = "why" },
        { text = "Tell me about the Frostwolves.", next = "frostwolves" },
        { text = "Send me to Alterac.", next = "BUSINESS" },
        { text = "Farewell, Thelman.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Ore and relics, deep in the hills, enough tae make the Stormpike clan rich for a hundred years. Vanndar Stormpike leads us there, and he says the orcs are squattin' on dwarven ground, and I'll not argue wi' him." } },
      choices = {
        { text = "So it's a fight over treasure.", next = "treasure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    treasure = {
      lines = { { id = "t_default", text = "Treasure, aye, an' pride, an' the right tae dig where yer fathers dug. Call it greed if ye like, but there's dwarves dead in that snow, an' I'll not have them dead for nothin'." } },
      choices = {
        { text = "A clan has the right to dig its own hills.", next = "BACK", reply = "That's the spirit! Ye'd make a fine Stormpike, so ye would.", fx = { align = { order = 1 } } },
        { text = "The orcs were there first. You're the invaders.", next = "BACK", reply = "Hmph. Say that in the valley an' see which side catches ye first.", fx = { align = { order = -1 } } },
      },
    },
    frostwolves = {
      lines = { { id = "f_default", text = "An orc clan that's lived in that valley since the old Horde threw them out, an' they ride great white wolves. They're tough as stone an' twice as stubborn, an' I respect them, though I'll not say so tae their faces." } },
      choices = { { text = "High praise, coming from a dwarf. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born in the hills wi' a pick in my hand, an' I'll die wi' one too, if the Frostwolves let me." } },
    _none = { { id = "tp_none", text = "Never heard o' it, an' I'm too old tae start now. Ask somebody wi' fewer maps." } },
  },
}

-- Mithras Ironhill: dwarf studying the great map in the keep's map room beside the battlemasters.
P:NPC {
  key = "sw_mithras_ironhill", id = TODO_NPC("Mithras Ironhill"), name = "Mithras Ironhill", gender = "male",
  role = "soldier", tier = "service",
  communities = { "stormwind" }, temper = { "wry", "patient" }, values = { "practical", "clever" },
  notices = { "travel", "watch" },
  impression = {
    first = "He knows every road on the map and trusts none of them.",
    third = "{name} met Mithras Ironhill, who pores over the great map in Stormwind Keep.",
  },
  greetings = {
    { id = "g_default", text = "Mind the map, {g:lad|lass}, ye're standin' on the Redridge Mountains. Step back an' look at it properly." },
    { id = "g_back", when = { metBefore = true }, text = "Back tae see the map again? It's changed since ye left, it always does." },
  },
  notice = {
    { id = "n_hunter", cat = "travel", when = { class = "HUNTER" },
      text = "A hunter knows land better than any cartographer. Come tell me if I've got the Wetlands wrong again." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mithras Ironhill. I keep this map honest for the generals, which means I move the little flags about every time a runner comes in wi' bad news." } },
      again = {
        { id = "h_again", text = "What else? I've a flag tae move in Duskwood." },
        { id = "h_again2", text = "Go on, the map'll keep while we talk." },
      },
      choices = {
        { text = "What does the map show today?", next = "today" },
        { text = "A dwarf keeping a human kingdom's maps?", next = "dwarf" },
        { text = "Good day, Mithras.", next = "END" },
      },
    },
    today = {
      lines = { { id = "t_default", text = "Defias red all over Westfall, gnolls in Redridge, the dead in Duskwood an' the Blackrock orcs crawlin' out o' the Burning Steppes. The north's fine, if ye don't count the Plaguelands, an' I've stopped countin' them.", fx = { learn = { "defias", "blackrock" } } } },
      choices = {
        { text = "That's a grim map.", next = "grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grim = {
      lines = { { id = "g_default", text = "It is, an' the generals stare at it for hours an' move the soldiers about like the flags. I tell them what's on it, an' they decide what tae do about it, an' that's the part I'm glad isn't mine." } },
      choices = {
        { text = "Stormwind should send the army to clear it all.", next = "BACK", reply = "With what army? Half of it's still on Lordaeron's bones. Still, I like yer nerve.", fx = { align = { order = 1 } } },
        { text = "The people will have to save themselves.", next = "BACK", reply = "That's what Westfall said, an' look how that's gone. Mind, they're not wrong.", fx = { align = { order = -1 } } },
      },
    },
    dwarf = {
      lines = { { id = "d_default", text = "Who better? We've been mappin' tunnels for longer than men have been drawin' roads, an' a road's only a tunnel wi' the roof off. King Magni lent me tae the Alliance years back, an' nobody's asked for me home." } },
      choices = { { text = "Their loss, Stormwind's gain. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Ironforge-born, Stormwind-kept. I've drawn more of this kingdom than most of its lords have seen." } },
    _none = { { id = "tp_none", text = "It's no' on my map, so I can't tell ye. Go an' look, then come back an' tell me." } },
  },
}

-- Master Sergeant Maclure: recruiter for the Alliance war effort in the Trade District.
P:NPC {
  key = "sw_master_sergeant_maclure", id = TODO_NPC("Master Sergeant Maclure"), name = "Master Sergeant Maclure", title = "War Effort Recruiter", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "brisk", "stern" }, values = { "dutiful", "practical" },
  notices = { "kit", "craft" },
  impression = {
    first = "She recruits with a ledger as much as a sword.",
    third = "{name} met Master Sergeant Maclure, who recruits for the Alliance war effort in Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "You there, {class}! The Alliance needs your help, and I mean that, so stop and listen a moment." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good, the war effort can use every pair of hands that comes back twice." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Alliance Needs Your Help!") }, text = "There's one who answered the call. Keep it up; the quotas don't fill themselves." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Herbalism", "Mining" } },
      text = "You've a trade, I can see that from your hands. Good, because the war effort needs bandages, leather and ore far more than speeches." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Master Sergeant Maclure, war effort recruitment. The Alliance is gathering supplies for a great push, and every citizen who can carry a crate is asked to help." } },
      again = {
        { id = "h_again", text = "What else, soldier? I've a line forming behind you." },
        { id = "h_again2", text = "Ask what you need to, then get to work." },
      },
      choices = {
        { text = "What does the war effort need?", next = "need" },
        { text = "Maclure? Any kin to the Elwynn Maclures?", next = "kin" },
        { text = "Why should I give up my goods?", next = "why" },
        { text = "I'll think about it.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Copper and iron, linen and silk, leather, herbs and food, by the wagonload. The collectors in Ironforge keep the tallies, and you'll see the piles grow as each kingdom does its share." } },
      choices = {
        { text = "Where do I bring it?", next = "where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Ironforge, to the collectors by the military ward, and they'll count every bar and bolt. Tell them Maclure sent you, so I get the credit in my report." } },
      choices = {
        { text = "Then I'll go. The Alliance comes first.", next = "BACK", reply = "That's what I like to hear. You'd have made a fine sergeant.", fx = { align = { order = 1 } } },
        { text = "I'll give what I can spare, no more.", next = "BACK", reply = "Spare, then, but spare generously. Wars run on what people can spare.", fx = { align = { order = -1 } } },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Distant, and I'll thank you not to bring up the Stonefields, because I've heard that feud argued at every wedding since I was four. I left the farm for the army, and it was the quietest choice I ever made." } },
      choices = { { text = "Quieter than a Maclure supper? Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = { { id = "y_default", text = "Because soldiers who go hungry don't come home, and the ones who do come home will remember who fed them. That's the whole of my sermon, and I don't preach it twice." } },
      choices = { { text = "A short sermon, and a fair one. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Elwynn farm girl turned Stormwind soldier. I've filled more quotas than I've fought battles, and I'm proud of both." } },
    _none = { { id = "tp_none", text = "Not my department. Ask a clerk, there's plenty of them." } },
  },
}

-- Guchie Jinglepocket: Smokywood Pastures goblin, the dear end of the Winter Veil stall.
P:NPC {
  key = "sw_guchie_jinglepocket", id = TODO_NPC("Guchie Jinglepocket"), name = "Guchie Jinglepocket", title = "Smokywood Pastures", gender = "female",
  role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "jovial", "sly" }, values = { "practical" },
  notices = { "kit" },
  impression = {
    first = "She sells holiday cheer at the top of the price list.",
    third = "{name} met Guchie Jinglepocket, who sells Smokywood Pastures' finer Winter Veil goods.",
  },
  greetings = {
    { id = "g_default", text = "Happy Winter Veil, sweetheart! Smokywood Pastures' finest goods, gift-wrapped and very reasonably priced, if your idea of reasonable has a sense of humour." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer's back! Well, top five, but the season's young." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Guchie Jinglepocket, and I sell the good stuff, while my cousin Khole over there sells the cheap stuff. You can tell the difference by the price, and the price is the point." } },
      again = {
        { id = "h_again", text = "What else, pal? Every minute you think is a minute you're not buyin'." },
        { id = "h_again2", text = "Go on, I'm all ears and both hands out." },
      },
      choices = {
        { text = "What is Smokywood Pastures?", next = "smokywood" },
        { text = "Goblins selling Winter Veil cheer?", next = "cheer" },
        { text = "Show me the good stuff.", next = "BUSINESS" },
        { text = "Merry Winter Veil, Guchie.", next = "END" },
      },
    },
    smokywood = {
      lines = { { id = "s_default", text = "Only the finest seasonal goods outfit from here to Undermine, friend, with stalls in every capital that'll have us and some that won't. We sell to the Horde too, but don't tell your king, because he'll want a discount." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    cheer = {
      lines = { { id = "c_default", text = "Cheer's a product like anythin' else, sweetheart, and this time of year everybody's buyin'. Greatfather Winter brings the presents, and somebody's gotta supply the old fella at wholesale." } },
      choices = {
        { text = "Holidays shouldn't be about money.", next = "BACK", reply = "Aw, that's sweet. Wrong, but sweet, and you can buy that sentiment on a card at the end of the counter.", fx = { align = { honor = 1 } } },
        { text = "Fair enough. Everyone's got to earn.", next = "BACK", reply = "Now you're talkin' my language! You'd do great in the Cartel, kid.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Smokywood Pastures, senior saleswoman, three seasons runnin'. The Jinglepockets have been in holidays for generations." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, unless it's for sale. Is it for sale?" } },
  },
}

-- Khole Jinglepocket: Smokywood Pastures goblin, the cheap end of the Winter Veil stall.
P:NPC {
  key = "sw_khole_jinglepocket", id = TODO_NPC("Khole Jinglepocket"), name = "Khole Jinglepocket", title = "Smokywood Pastures", gender = "male",
  role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "jovial", "harried" }, values = { "practical" },
  notices = { "kit" },
  impression = {
    first = "He sells the cheap Winter Veil goods and resents it cheerfully.",
    third = "{name} met Khole Jinglepocket, who sells Smokywood Pastures' cheaper Winter Veil goods.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, Winter Veil bargains right here, pal! Guchie's got the fancy stuff, but I've got the stuff people actually buy." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to my side of the stall! Guchie owes me a silver, she said you wouldn't." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Khole Jinglepocket, at your service and on a very tight margin. Snowballs, candy, cookie dough, the works, and all cheap enough that you'll buy two and feel clever about it." } },
      again = {
        { id = "h_again", text = "Anythin' else, friend? The line's growin'." },
        { id = "h_again2", text = "Make it quick, chum, time's money and so's snow." },
      },
      choices = {
        { text = "Have you seen Greatfather Winter?", next = "greatfather" },
        { text = "You and Guchie don't get along?", next = "guchie" },
        { text = "Let me see the bargains.", next = "BUSINESS" },
        { text = "Merry Winter Veil.", next = "END" },
      },
    },
    greatfather = {
      lines = { { id = "g_default", text = "He's in Ironforge, sittin' by the big tree, handin' out presents and smilin' at everybody, and he's on our books for the season. Head on over and say hello, it's practically a tradition, which is great for business." } },
      choices = { { text = "I'll pay him a visit. Something else.", next = "BACK" } },
    },
    guchie = {
      lines = { { id = "gu_default", text = "We get along great, as long as she stays on her side of the stall and I stay on mine. She says I cheapen the brand, and I say I'm the only one sellin' it, so we're square." } },
      choices = {
        { text = "Sounds like she's right, honestly.", next = "BACK", reply = "Hey, whose side are you on? Never mind, don't answer, you'll hurt sales.", fx = { align = { honor = 1 } } },
        { text = "Volume beats margin, every time.", next = "BACK", reply = "That's what I keep tellin' her! You're a sharp one, pal.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Jinglepocket, born and bred, which means I was sellin' tinsel before I could walk." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal. Ask Guchie, she thinks she knows everythin'." } },
  },
}

-- Lillian Singh: holiday fireworks seller in the Trade District at Midsummer; likely kin to Darian Singh.
P:NPC {
  key = "sw_lillian_singh", id = TODO_NPC("Lillian Singh"), name = "Lillian Singh", title = "Holiday Fireworks Vendor", gender = "female",
  role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "bright", "brisk" }, values = { "practical", "family" },
  notices = { "craft", "wonder" },
  impression = {
    first = "She sells fireworks and warns every buyer twice.",
    third = "{name} met Lillian Singh, who sells holiday fireworks in Stormwind's Trade District.",
  },
  greetings = {
    { id = "g_default", text = "Fireworks for the festival! Light them outside, away from thatch, and away from the guards if you value your purse." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I hope you didn't set anything alight last time, or at least nothing that belonged to anyone." },
  },
  notice = {
    { id = "n_mage", cat = "wonder", when = { class = "MAGE" },
      text = "A mage, buying fireworks? I'd have thought you'd make your own, though I'm glad of the custom." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Lillian Singh. My cousin Darian sells fireworks all year in the Mage Quarter, and I take the stall out to the Trade District when the festivals bring the crowds." } },
      again = {
        { id = "h_again", text = "Anything else? Mind your sleeve near the fuses." },
        { id = "h_again2", text = "Go on, ask. I can sell and talk at once." },
      },
      choices = {
        { text = "How did your family get into fireworks?", next = "family" },
        { text = "Are they dangerous?", next = "dangerous" },
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "Have a bright festival.", next = "END" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "My grandfather bought powder from a gnome peddler and burned off his eyebrows in the first week. He loved it so much he never stopped, and somehow every Singh since has caught the bug from him." } },
      choices = { { text = "Did his eyebrows grow back? Something else.", next = "BACK" } },
    },
    dangerous = {
      lines = { { id = "d_default", text = "Only if you're foolish, and I've met a lot of foolish customers. Light the fuse, step back three paces and don't look into the tube, and you'll keep your face the way it is." } },
      choices = {
        { text = "The guards should ban them in the city.", next = "BACK", reply = "Bite your tongue! They tried, once, and the festival was so dull the council changed its mind by the next summer.", fx = { align = { order = 1 } } },
        { text = "A little danger keeps a festival lively.", next = "BACK", reply = "That's the spirit, though say it quieter near the guards.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born in Stormwind, and I've smelled of powder since I was six. The Singhs make the sky bright when the city needs it." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask Darian, he reads more than I do." } },
  },
}

-- Emmithue Smails: gnome sweet-seller in the Trade District during Children's Week.
P:NPC {
  key = "sw_emmithue_smails", id = TODO_NPC("Emmithue Smails"), name = "Emmithue Smails", title = "Sweet Treats", gender = "male",
  role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "bright", "earnest" }, values = { "kind", "clever" },
  notices = { "wonder", "kit" },
  impression = {
    first = "He sells sweets to orphans and does the sums too kindly.",
    third = "{name} met Emmithue Smails, a gnome who sells sweets during Children's Week.",
  },
  greetings = {
    { id = "g_default", text = "Sweets, treats and sugared delights, at a precise and very fair price per ounce! Are you shopping for yourself, or for one of the little ones?" },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I've refilled the candy jars, all twelve of them, and recalibrated the scale." },
  },
  notice = {
    { id = "n_gnome", cat = "wonder", when = { race = "Gnome" },
      text = "A fellow gnome! Do you remember the sugar works in Gnomeregan? I still dream about the caramel pipes." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Emmithue Smails, confectioner, and formerly of Gnomeregan's own Sugar Works, back when Gnomeregan had sugar and works. Now I sell sweets to the orphans of Stormwind during Children's Week, and it is the best job in the world." } },
      again = {
        { id = "h_again", text = "What else would you like? I've calculated the perfect sweet for everyone." },
        { id = "h_again2", text = "Go on, ask. I've a lull between orphans." },
      },
      choices = {
        { text = "Why sell to orphans?", next = "orphans" },
        { text = "What happened to the Sugar Works?", next = "sugar" },
        { text = "Let me see the sweets.", next = "BUSINESS" },
        { text = "Good day, Emmithue.", next = "END" },
      },
    },
    orphans = {
      lines = { { id = "o_default", text = "The war left a great many children without parents, and the orphanage does its best on very little. During Children's Week, folk take an orphan out to see the city, and a sweet makes the day sweeter, which is entirely the point." } },
      choices = {
        { text = "Every child deserves a little kindness.", next = "BACK", reply = "Exactly, and with a two percent sugar margin, every child can afford some.", fx = { align = { light = 1 } } },
        { text = "They'd be better off with bread than candy.", next = "BACK", reply = "Bread for the body, candy for the heart, I always say. Though you're not wrong.", fx = { align = { light = -1 } } },
      },
    },
    sugar = {
      lines = { { id = "s_default", text = "The same thing that happened to the rest of Gnomeregan, I'm afraid, when the troggs came up and the radiation came down. I carried out my best recipe book and one spoon, and the spoon was a mistake.", fx = { learn = { "gnomeregan" } } } },
      choices = { { text = "At least you saved the recipes. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Gnomeregan confectioner, Stormwind refugee, Children's Week sweet-seller. Not in that order of happiness." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, but I'd guess it involves sugar somehow." } },
  },
}

-- Squire Rowe: Reginald Windsor's squire, waiting by the wall in the Valley of Heroes.
P:NPC {
  key = "sw_squire_rowe", id = TODO_NPC("Squire Rowe"), name = "Squire Rowe", gender = "male",
  role = "soldier", tier = "quest",
  communities = { "stormwind" }, temper = { "earnest", "watchful" }, values = { "dutiful", "brave" },
  notices = { "watch", "kit" },
  impression = {
    first = "He still waits by the gate for a knight long missing.",
    third = "{name} met Squire Rowe, Marshal Windsor's squire, at the gate of Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Good day, {class}. If you have word of Marshal Windsor, I beg you to tell me." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Any news? I ask everyone, so don't take it to heart." },
    { id = "g_rendezvous", when = { questActive = TODO_QUEST("Stormwind Rendezvous") }, text = "You've come from the marshal? Then he's alive, and he's coming, and I'll have Mercutio saddled before he reaches the bridge." },
  },
  notice = {
    { id = "n_paladin", cat = "watch", when = { class = "PALADIN" },
      text = "A paladin! The marshal used to say the Light rode with the best knights. I hope it rides with you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Squire Rowe, sworn to Marshal Reginald Windsor. He rode for Blackrock Mountain and never came home, but I keep his horse fed and his post watched, because a squire doesn't stop serving.", fx = { learn = { "windsor" } } } },
      again = {
        { id = "h_again", text = "What else? I've nowhere to be but here." },
        { id = "h_again2", text = "Ask, please. It passes the time." },
      },
      choices = {
        { text = "Tell me about Marshal Windsor.", next = "windsor" },
        { text = "Why wait here, by the gate?", next = "gate" },
        { text = "He's been gone a long time, Rowe.", next = "gone" },
        { text = "The marshal lives. He's coming home.", next = "home", when = { questActive = TODO_QUEST("Stormwind Rendezvous") } },
        { text = "Keep the faith, squire.", next = "END" },
      },
    },
    windsor = {
      lines = { { id = "w_default", text = "He's the finest knight in Stormwind, though the court doesn't love him for it. He says what he thinks to lords and ladies alike, and he never trusted the new advisors at the keep." } },
      choices = {
        { text = "Which advisors?", next = "advisors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    advisors = {
      lines = { { id = "a_default", text = "Lady Prestor, mostly, though he never said why out loud. He'd go quiet whenever her name came up, and once he said that some smiles have too many teeth in them, which I didn't understand.", fx = { learn = { "prestor" } } } },
      choices = {
        { text = "A knight should say plainly what he suspects.", next = "BACK", reply = "He would have, I think, if he'd had proof. That's why he rode for the mountain.", fx = { align = { honor = 1 } } },
        { text = "Wise of him to keep quiet in that court.", next = "BACK", reply = "Maybe so. Quiet men live longer in the keep, he used to say.", fx = { align = { honor = -1 } } },
      },
    },
    gate = {
      lines = { { id = "g_default", text = "Because this is where he'll come in, if he comes in, and I want to be the first face he sees. The guards laugh at me, but they let me stand here, and that's enough." } },
      choices = { { text = "That's loyalty. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gone = {
      lines = { { id = "go_default", text = "I know, and I know what everyone says behind their hands. But the marshal escaped the orcs once, in the Second War, and if anyone could walk out of Blackrock Mountain alive, it's him." } },
      choices = { { text = "Then I hope he does. Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "ho_default", text = "Light be praised! I knew it, I knew he'd come back, and I'll be standing right here when he does. Thank you, {class}, from the bottom of my heart." } },
      choices = { { text = "Be ready, Rowe. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've served the marshal since I was twelve. He taught me to ride, to fight and to keep my mouth shut in the keep." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. The marshal would have known." } },
  },
}

-- Reginald Windsor: Marshal of Stormwind, escaped from Blackrock Depths, at the gates on the day of the Great Masquerade.
P:NPC {
  key = "sw_reginald_windsor", id = TODO_NPC("Reginald Windsor"), name = "Reginald Windsor", title = "Marshal of Stormwind", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "stormwind", "second_war" }, temper = { "stern", "proud" }, values = { "brave", "honest" },
  notices = { "watch", "kit" },
  impression = {
    first = "He came home from Blackrock to tell the truth, whatever it cost.",
    third = "{name} stood with Marshal Reginald Windsor at the gates of Stormwind on the day of the Great Masquerade.",
  },
  greetings = {
    { id = "g_default", text = "You! You're the one who freed me from that pit, and you've come to see it through. Good, because today Stormwind learns what has been whispering in its king's ear." },
    { id = "g_back", when = { metBefore = true }, text = "Stand ready, friend. We go to the keep together, and we don't turn back." },
  },
  notice = {
    { id = "n_paladin", cat = "watch", when = { class = "PALADIN" },
      text = "The Light is with you, paladin, and we'll need it today, because the thing we face hides in plain sight." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Marshal Reginald Windsor, and I've been a prisoner of the Dark Irons longer than I care to remember. I found proof in that mountain that Lady Katrana Prestor is no lady at all, and I mean to lay it before Highlord Bolvar myself.", fx = { learn = { "prestor", "windsor" } } } },
      again = {
        { id = "h_again", text = "What else? Ask quickly, we've a city to cross." },
        { id = "h_again2", text = "Speak, but keep your hand near your blade." },
      },
      choices = {
        { text = "What did you find in Blackrock?", next = "proof" },
        { text = "What is Lady Prestor, then?", next = "prestor" },
        { text = "How did you come to be captured?", next = "captured" },
        { text = "Lead on, Marshal.", next = "END" },
      },
    },
    proof = {
      lines = { { id = "p_default", text = "Letters and orders, written in a hand I'd seen on royal decrees, sent to the Blackrock orcs. The one who wrote them sits beside the throne and calls herself the king's advisor, and she's been bleeding this kingdom for years.", fx = { learn = { "blackrock_depths" } } } },
      choices = {
        { text = "Will Bolvar believe you?", next = "bolvar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bolvar = {
      lines = { { id = "b_default", text = "Bolvar is a good man, and good men are the easiest to deceive. He'll believe the proof, I think, once he sees it, but she'll fight before she lets him read it, and that's why I wanted you beside me." } },
      choices = {
        { text = "Then we face her openly, before the whole court.", next = "BACK", reply = "Aye, in the light of day, where everyone can see what she is. That's the only way.", fx = { align = { honor = 1 } } },
        { text = "Better to strike her quietly, before she can act.", next = "BACK", reply = "And be hanged for murdering the king's advisor? No, friend, she must be unmasked, not ambushed.", fx = { align = { honor = -1 } } },
      },
    },
    prestor = {
      lines = { { id = "pr_default", text = "A dragon, of Deathwing's own black brood, wearing a woman's face like a mask at a ball. I know how it sounds, and I'd have laughed at it myself a year ago, before I saw the letters.", fx = { learn = { "onyxia" } } } },
      choices = { { text = "Then the court is full of fools. Something else.", next = "BACK" } },
    },
    captured = {
      lines = { { id = "c_default", text = "I rode for Blackrock to learn who was arming the orcs, and the Dark Irons took my men and me in a single night. They kept me alive because they thought I'd be useful, and they were right, though not the way they wanted." } },
      choices = { { text = "Your squire never stopped waiting. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fought in the Second War and served this kingdom ever since. I've never bent the knee to a liar, and I won't start today." } },
    _none = { { id = "tp_none", text = "Not now, friend. We have one task today, and it's in the keep." } },
  },
}

-- Acolyte Porena: an acolyte of the coven beneath the Slaughtered Lamb.
P:NPC {
  key = "sw_acolyte_porena", id = TODO_NPC("Acolyte Porena"), name = "Acolyte Porena", title = "Acolyte", gender = "female",
  role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "cold", "wry" }, values = { "clever" },
  notices = { "wonder", "watch" },
  impression = {
    first = "She studies shadow beneath the tavern and likes it there.",
    third = "{name} met Acolyte Porena among the warlocks beneath the Slaughtered Lamb.",
  },
  greetings = {
    { id = "g_default", text = "You've found the cellar, then. Mind the circles on the floor; they're older than you think." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. The shadows must like you." },
  },
  notice = {
    { id = "n_lock", cat = "wonder", when = { class = "WARLOCK" },
      text = "Another student of the art. Gakin and Zardeth have been waiting for you, I think, though they'd never admit it." },
    { id = "n_priest", cat = "watch", when = { class = { "PRIEST", "PALADIN" } },
      text = "The Light, down here? You're braver than most of your kind, or more foolish." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Porena, an acolyte of the circle that meets beneath the Slaughtered Lamb. We study what the Church would rather we didn't, and the guards above are kind enough to look the other way." } },
      again = {
        { id = "h_again", text = "What else would you know? Ask quietly." },
        { id = "h_again2", text = "Go on. The walls don't listen, but Zardeth might." },
      },
      choices = {
        { text = "What does the circle study?", next = "study" },
        { text = "Isn't this dangerous?", next = "danger" },
        { text = "I'll leave you to your studies.", next = "END" },
      },
    },
    study = {
      lines = { { id = "s_default", text = "Fel, shadow and the binding of things that dwell beyond the world, the same powers the orcs used to burn this city. We mean to master them for Stormwind's sake, and someone must, or we'll fall to them again." } },
      choices = {
        { text = "Power is a tool. Better ours than theirs.", next = "BACK", reply = "Exactly so. You'd fit in well down here, I think.", fx = { align = { light = -1 } } },
        { text = "That power ruined the orcs. It'll ruin you.", next = "BACK", reply = "Perhaps, but they never studied it, they only drank it. We're more careful.", fx = { align = { light = 1 } } },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "Very, which is why we keep the doors locked and the imps fed. Zardeth's imp Zggi bit me twice in my first week, and I learned more from that than from any book." } },
      choices = { { text = "A harsh teacher. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a clerk in the Mage Quarter once. The circle offered more interesting work." } },
    _none = { { id = "tp_none", text = "That isn't something we study down here. Try the library upstairs, in the Mage Quarter." } },
  },
}

-- Zggi: Zardeth's imp beneath the Slaughtered Lamb.
P:NPC {
  key = "sw_zggi", id = TODO_NPC("Zggi"), name = "Zggi", title = "Zardeth's Minion",
  role = "demon", tier = "service",
  communities = { "stormwind" }, temper = { "sly", "gruff" }, values = {},
  notices = { "wonder" },
  impression = {
    first = "It sneers at everyone, and bites the ones it likes.",
    third = "{name} met Zggi, Zardeth's imp, beneath the Slaughtered Lamb.",
  },
  greetings = {
    { id = "g_default", text = "What do you want, mortal? Zggi is busy, very busy, doing nothing at all for Zardeth." },
    { id = "g_back", when = { metBefore = true }, text = "You again? Zggi remembers you, and Zggi is not impressed." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Zggi, servant of the great Zardeth, and keeper of his candles, his scrolls and his very bad temper. Speak, and make it worth my while." } },
      again = { { id = "h_again", text = "More questions? Zggi is getting bored, and bored imps set fires." } },
      choices = {
        { text = "What's it like serving Zardeth?", next = "serve" },
        { text = "Where do you come from?", next = "home" },
        { text = "Never mind, imp.", next = "END" },
      },
    },
    serve = {
      lines = { { id = "s_default", text = "Dreadful, wonderful, and very hot, because he never lets me light the fires I want to light. One day he'll slip, and then Zggi will laugh, but for now Zggi fetches candles." } },
      choices = { { text = "I'll warn him you said that. Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "h2_default", text = "From somewhere warmer than this damp hole, with fewer humans and more screaming. You wouldn't like it, mortal, but it would like you very much." } },
      choices = { { text = "I'll take your word for it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Zggi serves Zardeth. Zggi did not choose to." } },
    _none = { { id = "tp_none", text = "Zggi doesn't know and doesn't care. Go away." } },
  },
}

-- Priestess Tyriona: the disguise Tyrion's spybot wears to carry a message to Lescovar.
P:NPC {
  key = "sw_priestess_tyriona", id = TODO_NPC("Priestess Tyriona"), name = "Priestess Tyriona", gender = "female",
  role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "earnest", "brisk" }, values = { "dutiful" },
  notices = { "watch" },
  impression = {
    first = "Her robes fit perfectly, and her blessings sound rehearsed.",
    third = "{name} walked beside \"Priestess Tyriona\", the disguise worn by Tyrion's spybot.",
  },
  greetings = {
    { id = "g_default", text = "Blessings of the Light upon you, citizen. I am a priestess, and I am walking to the garden, as priestesses do." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Attack!") }, text = "Keep close, and say nothing to the guards. A priestess with a bodyguard is perfectly ordinary, I'm told." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Priestess Tyriona, of the Cathedral of Light, and I carry a message for Lord Lescovar. It is a very holy message, and I am not at all made of gears." } },
      again = { { id = "h_again", text = "Is there more? We must walk on, quietly and piously." } },
      choices = {
        { text = "Your disguise is very convincing.", next = "disguise" },
        { text = "What message are you carrying?", next = "message" },
        { text = "Walk on, then.", next = "END" },
      },
    },
    disguise = {
      lines = { { id = "d_default", text = "Thank you. Tyrion says the guards look at the robe and never at the face, and so far he is right. Please do not mention the ticking." } },
      choices = { { text = "I hear nothing. Something else.", next = "BACK" } },
    },
    message = {
      lines = { { id = "m_default", text = "That Marzon the Silent Blade wishes to meet Lord Lescovar in the garden tonight. Tyrion wants to see who arrives, and so do the people he works for, I'm sure." } },
      choices = {
        { text = "Treachery should be exposed, however it's done.", next = "BACK", reply = "That is what Tyrion says, and I am inclined to agree with him, being built by him.", fx = { align = { order = 1 } } },
        { text = "Spying on a noble seems risky business.", next = "BACK", reply = "It is, which is why Tyrion sent me instead of going himself.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a priestess. That is all there is to me, really." } },
    _none = { { id = "tp_none", text = "The Light has not revealed that to me, citizen." } },
  },
}
