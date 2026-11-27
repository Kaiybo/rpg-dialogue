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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you still standing. Come, stand with us a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You return. The Sentinels have need of fighters, though I would rather Ashenvale were defended by others than you." },
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
        { text = "Ashenvale should be defended with honour, face to face.", next = "BACK", reply = "As the Sentinels have always fought, and as Elune would have us fight.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Poison the Warsong's water and spare yourself the fight.", next = "BACK", reply = "That is the orcs' way, not ours, and it would poison our own forest besides.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What is the fight in Warsong Gulch?", next = "gulch" },
        { text = "Why recruit here, so far from Ashenvale?", next = "far" },
        { text = "I wish to join the battle.", next = "BUSINESS" },
        { text = "What did the Warsong take from you?", next = "x_loss" },
        { text = "Ishnu-alah, sister. How fares Ashenvale?", next = "x_elf", when = { race = "NightElf" } },
        { text = "I'm a druid. The forest's wounds are mine too.", next = "x_druid", when = { class = "DRUID" } },
        { text = "Elune guide you.", next = "END" },
      },
    },
    gulch = {
      lines = { { id = "gulch_default", text = "The Warsong clan holds a lumber camp at the gulch, and they strip the forest bare to feed their war. We take their banner and carry it home, and they try to take ours, and every flag returned is a grove spared for another day." } },
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
    x_loss = {
      lines = {
        { id = "x_loss_l0", text = "A grove my mother tended for six hundred years, felled in a single season and dragged to their camp for palisades. I was posted at Astranaar when the smoke rose, and I could do nothing but watch it." },
      },
      choices = {
        { text = "Did you know who led them?", next = "x_loss2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_loss2 = {
      lines = {
        { id = "x_loss2_l0", text = "The Warsong answer to Grom Hellscream's line, and their outriders in the gulch are fierce and well fed. They say Hellscream himself died slaying a demon lord, and I will not grieve that." },
      },
      choices = {
        { text = "Then why fight on?", next = "x_loss3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_loss3 = {
      lines = {
        { id = "x_loss3_l0", text = "Because the axes did not die with him. Each tree in the gulch is a promise Elune made to my people, and the Sentinels mean to keep it." },
      },
      choices = {
        { text = "I'll help you keep it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_elf = {
      lines = {
        { id = "x_elf_l0", text = "It bleeds at the edges and holds at the heart, as it always has. Tell the Sentinels at Silverwing Grove I sent you, and they will find a place for your bow." },
      },
      choices = {
        { text = "Elune-adore. Something else.", next = "BACK" },
      },
    },
    x_druid = {
      lines = {
        { id = "x_druid_l0", text = "Then you feel what I only see. The Cenarion Circle counsels patience, but patience is a long road when the axes are short." },
      },
      choices = {
        { text = "Balance will return. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have served the Sentinels longer than your kingdom has had a name. Now I serve them here, among stone." } },
    advice = { { id = "tp_advice_x", text = "Fight beside your companions in the gulch, not ahead of them. The Warsong hunt those who run alone." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're welcome at our fire any night you like." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The League needs every sword, but I'd sooner Stromgarde trusted someone else's." },
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
        { text = "Arathi Basin must be won fairly, as Stromgarde's honour demands.", next = "BACK", reply = "As my house has always fought, and as it always shall.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Burn the Defilers' farms at night; a raid is a raid.", next = "BACK", reply = "Those farms were ours before the Forsaken took them, and I'll not burn my own people's fields.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What is the League of Arathor?", next = "league" },
        { text = "What's in the basin worth fighting for?", next = "basin" },
        { text = "I'll fight for Arathor.", next = "BUSINESS" },
        { text = "Why did you leave Stromgarde?", next = "x_why" },
        { text = "I'm a paladin. Arathor's cause is just.", next = "x_pal", when = { class = "PALADIN" } },
        { text = "Humans built Arathor. I'd see it rise again.", next = "x_human", when = { race = "Human" } },
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
    x_why = {
      lines = {
        { id = "x_why_l0", text = "Because the Syndicate and the ogres hold half the city, and a noble without a house is only another sword. Here I can raise many swords instead of being one." },
      },
      choices = {
        { text = "Who holds the Basin now?", next = "x_why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_why2 = {
      lines = {
        { id = "x_why2_l0", text = "The Forsaken's Defilers, who poison the soil and work the mines with dead hands. The farm, the stables and the mill were Arathi land, and our people's bread grew there." },
      },
      choices = {
        { text = "And if we take it back?", next = "x_why3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_why3 = {
      lines = {
        { id = "x_why3_l0", text = "Then the League's banner flies over the first stretch of free Arathi soil in years, and Stromgarde's people have somewhere to come home to. That is worth more than any medal Dirgehammer hands out." },
      },
      choices = {
        { text = "Then I'll fight for it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_pal = {
      lines = {
        { id = "x_pal_l0", text = "The Silver Hand was founded in the shadow of Lordaeron, not so far from our hills. Fight with us, paladin, and the people will see the Light has not forgotten them." },
      },
      choices = {
        { text = "It hasn't. Something else.", next = "BACK" },
      },
    },
    x_human = {
      lines = {
        { id = "x_human_l0", text = "Then you know Arathor was the first kingdom of men, and Stromgarde its heir. Every human in this city owes those hills a debt, whether they remember it or not." },
      },
      choices = {
        { text = "I remember. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My family held land in the Highlands for generations. The orcs took it, then the dead, and now I mean to take it back." } },
    advice = { { id = "tp_advice_x", text = "Hold the stables first. Horses win the Basin, and the Defilers know it." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, an' ye've fought well in the snow, I hear! The Stormpike Guard's glad o' ye, an' so am I." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The valley needs fighters, but I'd sooner it were someone else." },
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
        { text = "The valley should be won by honest fightin' in the snow.", next = "BACK", reply = "Aye, toe tae toe wi' the Frostwolves, an' nae other way.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Bring the whole mountain down on the Frostwolves' heads.", next = "BACK", reply = "An' bury the mines we came for along wi' them? Nae, {g:lad|lass}, that's daft.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why do the Stormpike want the valley?", next = "why" },
        { text = "Tell me about the Frostwolves.", next = "frostwolves" },
        { text = "Send me to Alterac.", next = "BUSINESS" },
        { text = "What's it like in Alterac's snow?", next = "x_snow" },
        { text = "Ironforge must be proud of the Stormpike.", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Gnomes fight in the valley too, I hear.", next = "x_gnome", when = { race = "Gnome" } },
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
    x_snow = {
      lines = {
        { id = "x_snow_l0", text = "Cold enough tae freeze yer beard tae yer breastplate, an' the wind comes down the passes like a herd o' rams. Ye cannae stand still out there, or the valley takes ye." },
      },
      choices = {
        { text = "And Dun Baldar?", next = "x_snow2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_snow2 = {
      lines = {
        { id = "x_snow2_l0", text = "Our fortress at the north end, wi' Vanndar sittin' in it like a bear in a cave. The bridges are the key, an' whoever holds them holds the valley." },
      },
      choices = {
        { text = "And the Frostwolf hold the south?", next = "x_snow3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_snow3 = {
      lines = {
        { id = "x_snow3_l0", text = "Aye, Frostwolf Keep, wi' Drek'Thar at their head, an old blind shaman who sees more than most wi' eyes. I'll no' pretend he's a fool, for he isnae." },
      },
      choices = {
        { text = "Know your enemy. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_dwarf = {
      lines = {
        { id = "x_dwarf_l0", text = "Proud an' a wee bit jealous, I'd say, for the Stormpike went their own road. Still, blood's blood, an' Ironforge sends ale an' powder." },
      },
      choices = {
        { text = "Good to hear. Something else.", next = "BACK" },
      },
    },
    x_gnome = {
      lines = {
        { id = "x_gnome_l0", text = "Aye, an' they're braver than they look, buildin' contraptions in the snow. Mind ye don't stand too close tae one when it's switched on." },
      },
      choices = {
        { text = "I'll keep my distance. Something else.", next = "BACK" },
      },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, friend. You've fought well, and the company remembers it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Mind where ye stand, an' dinnae touch the flags." },
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
        { text = "A good map shows the truth, even when the news is bad.", next = "BACK", reply = "Aye, an' that's why I move the flags honestly, even when it pains me.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Move the flags a wee bit to cheer the generals.", next = "BACK", reply = "An' send good soldiers tae die where the map lied? Nae, {g:lad|lass}, never.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What does the map show today?", next = "today" },
        { text = "A dwarf keeping a human kingdom's maps?", next = "dwarf" },
        { text = "What's the worst corner of the map?", next = "x_worst" },
        { text = "I can tell you what I've seen on the roads.", next = "x_report", when = { minLevel = 20 } },
        { text = "A fellow dwarf in the War Room! How came ye here?", next = "x_dw", when = { race = "Dwarf" } },
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
      lines = { { id = "grim_default", text = "It is, an' the generals stare at it for hours an' move the soldiers about like the flags. I tell them what's on it, an' they decide what tae do about it, an' that's the part I'm glad isn't mine." } },
      choices = {
        { text = "Stormwind should send the army to clear it all.", next = "BACK", reply = "With what army? Half of it's still on Lordaeron's bones. Still, I like yer nerve.", fx = { align = { order = 1 } } },
        { text = "The people will have to save themselves.", next = "BACK", reply = "That's what Westfall said, an' look how that's gone. Mind, they're not wrong.", fx = { align = { order = -1 } } },
      },
    },
    dwarf = {
      lines = { { id = "d_default", text = "Who better? We've been mappin' tunnels for longer than men have been drawin' roads, an' a road's only a tunnel wi' the roof off. King Magni lent me tae the Alliance years back, an' nobody's asked for me home." } },
      choices = { { text = "Their loss, Stormwind's gain. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_worst = {
      lines = {
        { id = "x_worst_l0", text = "Duskwood, I'd say, for the dead walk there an' the generals have no flag for that. I've used a wee skull I carved myself, an' they look at it an' look away." },
      },
      choices = {
        { text = "Who holds Darkshire?", next = "x_worst2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_worst2 = {
      lines = {
        { id = "x_worst2_l0", text = "The Night Watch, under Commander Althea Ebonlocke, an' a handful o' farmers wi' torches. Brave folk, but brave doesnae hold a line against the risen." },
      },
      choices = {
        { text = "What do they need most?", next = "x_worst3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_worst3 = {
      lines = {
        { id = "x_worst3_l0", text = "Swords that don't flinch an' priests that don't run. If ye're headed there, take both if ye can, an' mind the Raven Hill road." },
      },
      choices = {
        { text = "I'll mind it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_report = {
      lines = {
        { id = "x_report_l0", text = "Go on, then, but tell me true, for I've had enough rumour pinned on this map tae choke a mule. A good report saves a flag goin' in the wrong place." },
      },
      choices = {
        { text = "The roads are worse than your flags show. Something else.", next = "BACK" },
      },
    },
    x_dw = {
      lines = {
        { id = "x_dw_l0", text = "Same as most, {g:lad|lass}, I came south wi' the army an' stayed for the pay an' the work. The humans cannae read a mountain, but I can, an' they know it." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
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
        { text = "I'd rather fight than haul crates, Sergeant.", next = "fight", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Ironforge collects and Stormwind recruits? Odd arrangement.", next = "ironforge", when = { race = "Dwarf" } },
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
      choices = {
        { text = "What started the feud with the Stonefields?", next = "feud" },
        { text = "Quieter than a Maclure supper? Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    why = {
      lines = { { id = "y_default", text = "Because soldiers who go hungry don't come home, and the ones who do come home will remember who fed them. That's the whole of my sermon, and I don't preach it twice." } },
      choices = { { text = "A short sermon, and a fair one. Something else.", next = "BACK" } },
    },
    feud = {
      lines = { { id = "fe_default", text = "Depends which side you ask, and both sides will talk your ear off. Ma Stonefield says it was a stolen pig, my uncle says it was a broken promise, and I say it was two families with too much time between harvests." } },
      choices = {
        { text = "Someone ought to make them shake hands.", next = "BACK", reply = "Someone's tried, and they ended up with pie on their tunic. Good luck to you.", fx = { align = { order = 1 } } },
        { text = "Let them squabble. It's their business.", next = "BACK", reply = "That's what I tell myself every Harvest Festival, and it nearly works.", fx = { align = { order = -1 } } },
      },
    },
    fight = {
      narr = "She looks you up and down the way she'd count a wagonload.",
      lines = { { id = "fi_default", text = "So would every recruit who walks through that gate, and every one of them learns that a sword without supper behind it is just a heavy stick. Haul the crates now, and you'll have your fight when the push comes, I promise you that much." } },
      choices = { { text = "Crates first, then. Something else.", next = "BACK" } },
    },
    ironforge = {
      lines = { { id = "ir_default", text = "Odd, maybe, but your king has the vaults and the forges, and we have the people with empty hands. Magni counts the bars and I count the volunteers, and between us we'll fill the wagons." } },
      choices = { { text = "Fair division of labour. Something else.", next = "BACK" } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "My favourite customer, back again! Top three now, sweetheart, and climbing, so let's see what's caught your eye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, you. Look all ya like, pal, but the gift-wrapping's extra for some people, and you're some people." },
    { id = "g_default", text = "Happy Winter Veil, sweetheart! Smokywood Pastures' finest goods, gift-wrapped and very reasonably priced, if your idea of reasonable has a sense of humour." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer's back! Well, top five, but the season's young." },
  },
  start = "hello",
  nodes = {
    ybest = {
      lines = {
        { id = "ybswguchiejinglepocket1", text = "Winter Veil hats, sweetheart, the red ones with the white trim. Everybody wants one, and they fall apart by spring, so everybody wants another next year. That's what I call a sustainable product." },
        { id = "ybswguchiejinglepocket2", when = { race = "Gnome" }, text = "Gnomes love the hats, they come down to the ears. I give the gnomes a discount, 'cause they always come back." },
      },
      choices = {
        { text = "A Winter Veil gift should be worth the price paid for it.", next = "BACK", reply = "Sure, sure, and my stuff's worth every copper, which is why it costs so many of 'em.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Wrap a cheap gift in fancy paper and charge double.", next = "BACK", reply = "Ha! Kid, that's the whole Smokywood business plan, just don't tell my cousin I said so.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Something else.", next = "BACK" },
      },
    },
    yhome = {
      lines = {
        { id = "yswguchiejinglepocket1", text = "Once every few seasons, if the company pays for the zeppelin. My mother runs a pawnshop on the docks there, and she still asks when I'm gonna get a real job. I tell her this is a real job, and she laughs." },
        { id = "yswguchiejinglepocket2", when = { faction = "Horde" }, text = "You're a long way from Orgrimmar, pal. Don't worry, we sell to everyone, so long as the coin's good." },
      },
      choices = {
        { text = "Does she approve of Khole?", next = "ykhole" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykhole = {
      lines = {
        { id = "yswguchiejinglepocket3", text = "Khole's her favourite, the little rat. He sends her half his pay every season. I send her a nice card. She says I should share my margin, and I say margin's for reinvesting. What would you say?" },
      },
      choices = {
        { text = "Send her the coin. Family comes first.", next = "BACK", reply = "Ugh, you sound like Khole. Fine, maybe I'll send a bit extra this year.", fx = { align = { honor = 1 } } },
        { text = "Reinvest. A smart business builds a better future.", next = "BACK", reply = "Now that's goblin thinking! My mother would hate you, sweetheart.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "How's business compared to last Winter Veil?", next = "x_biz" },
        { text = "Gnomes love gadgets. Got any holiday toys?", next = "x_gnome", when = { race = "Gnome" } },
        { text = "Do you ever go home to Undermine?", next = "yhome" },
        { text = "You're far from Kezan, cousin.", next = "BACK", when = { race = "Goblin" }, reply = "Far from Kezan, close to customers, sweetheart. That's the goblin way, and you know it." },
        { text = "What's your best seller?", next = "ybest" },
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
    x_biz = {
      lines = {
        { id = "x_biz_l0", text = "Up, pal, up, though my overhead's up more, what with the snow shipped in from Dun Morogh by the cart. Snow, I'm payin' for snow, can you believe that?" },
      },
      choices = {
        { text = "Why not use local snow?", next = "x_biz2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_biz2 = {
      lines = {
        { id = "x_biz2_l0", text = "Stormwind doesn't get enough, sweetheart, and what it gets turns to slush by noon. So we import, and we pass the cost along, and that's what I call the cheer surcharge." },
      },
      choices = {
        { text = "And people pay it?", next = "x_biz3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_biz3 = {
      lines = {
        { id = "x_biz3_l0", text = "Every last one of 'em, because Greatfather Winter's watchin', or so I tell the kids. On my mother's ledger, it's the best investment I ever made." },
      },
      choices = {
        { text = "Shameless. Something else.", next = "BACK" },
      },
    },
    x_gnome = {
      lines = {
        { id = "x_gnome_l0", text = "Have I got toys? Clockwork reindeer, wind-up snowmen, and a little rocket that only sometimes catches fire. You'll appreciate the engineering, so I'll charge you the appreciation price." },
      },
      choices = {
        { text = "Which is higher, I suspect. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hats = { { id = "ybswguchiejinglepocket3", text = "Red ones with white trim. Fall apart by spring. Best product I've ever had." } },
    khole = { { id = "yswguchiejinglepocket4", text = "My cousin. He sells cheap and he sends Mum half his pay. The little rat." } },
    undermine = { { id = "yswguchiejinglepocket5", text = "Home. My mother runs a pawnshop there and thinks I need a real job." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back on my side of the stall again! Guchie owes me another silver, and you're my lucky charm, pal." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Bargains are still bargains, but don't expect me to throw in the bow for free." },
    { id = "g_default", text = "Hey, hey, Winter Veil bargains right here, pal! Guchie's got the fancy stuff, but I've got the stuff people actually buy." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to my side of the stall! Guchie owes me a silver, she said you wouldn't." },
  },
  start = "hello",
  nodes = {
    ybest = {
      lines = {
        { id = "ybswkholejinglepocket1", text = "Snowballs, chum, by the bag. Kids buy 'em to throw at each other, guards buy 'em to throw at the kids, an' nobles buy 'em to throw at each other when they think nobody's watchin'. I've seen a duke take one in the ear." },
        { id = "ybswkholejinglepocket2", when = { class = "MAGE" }, text = "Don't you go makin' your own, pal. Frostbolt snowballs are bad for business." },
      },
      choices = {
        { text = "A cheap gift sold honest is better than a dear one sold crooked.", next = "BACK", reply = "Now that's a philosophy I can sell, pal, and on a very tight margin too.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Slip a broken toy into the pile; kids never complain.", next = "BACK", reply = "Kids always complain, buddy, and their mothers complain louder, and that's bad for business.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Something else.", next = "BACK" },
      },
    },
    ymother = {
      lines = {
        { id = "yswkholejinglepocket1", text = "Half me pay, every season, an' don't tell Guchie I told you, 'cause she'll make it sound like I'm showing off. Mum raised the both of us after the zeppelin crash, an' she never complained once." },
        { id = "yswkholejinglepocket2", when = { faction = "Horde" }, text = "Orcs understand family, pal. I've seen grunts send their pay home too. We're not so different, us an' you." },
      },
      choices = {
        { text = "What zeppelin crash?", next = "ycrash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycrash = {
      lines = {
        { id = "yswkholejinglepocket3", text = "Our dads ran a cargo line between Ratchet an' Booty Bay. One storm, one bad rivet, an' gone. Guchie says it was the company's fault, an' she should sue. I say leave it, 'cause the company gives us work." },
      },
      choices = {
        { text = "Leave it. The company feeds your family now.", next = "BACK", reply = "That's what I say! Guchie calls me soft, but I'm practical.", fx = { align = { order = 1 } } },
        { text = "Sue them. They owe your family.", next = "BACK", reply = "Huh. Maybe Guchie's right. Don't tell her I said that, either.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "How do you keep your prices so low?", next = "x_low" },
        { text = "A goblin who sells cheap? Suspicious.", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "You send your mother money?", next = "ymother" },
        { text = "Any work for a goblin in your line?", next = "BACK", when = { race = "Goblin" }, reply = "Sure, chum, if you can sell snow to an Ironforge dwarf. I'll put in a word with the boss, for a cut." },
        { text = "What's your best seller?", next = "ybest" },
        { text = "Merry Winter Veil.", next = "END" },
      },
    },
    greatfather = {
      lines = { { id = "greatfather_default", text = "He's in Ironforge, sittin' by the big tree, handin' out presents and smilin' at everybody, and he's on our books for the season. Head on over and say hello, it's practically a tradition, which is great for business." } },
      choices = { { text = "I'll pay him a visit. Something else.", next = "BACK" } },
    },
    guchie = {
      lines = { { id = "gu_default", text = "We get along great, as long as she stays on her side of the stall and I stay on mine. She says I cheapen the brand, and I say I'm the only one sellin' it, so we're square." } },
      choices = {
        { text = "Sounds like she's right, honestly.", next = "BACK", reply = "Hey, whose side are you on? Never mind, don't answer, you'll hurt sales.", fx = { align = { honor = 1 } } },
        { text = "Volume beats margin, every time.", next = "BACK", reply = "That's what I keep tellin' her! You're a sharp one, pal.", fx = { align = { honor = -1 } } },
      },
    },
    x_low = {
      lines = {
        { id = "x_low_l0", text = "Volume, chum, volume, and a supplier in Booty Bay who doesn't ask where the sugar came from. I don't ask either, so we get along great." },
      },
      choices = {
        { text = "Where does the sugar come from?", next = "x_low2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_low2 = {
      lines = {
        { id = "x_low2_l0", text = "Somewhere south and hot, off a ship that came in late at night, and that's all a fella on a tight margin needs to know. Guchie says it's a liability, I say it's a discount." },
      },
      choices = {
        { text = "Who's right?", next = "x_low3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_low3 = {
      lines = {
        { id = "x_low3_l0", text = "Whoever sells more by the end of the season, pal, and that's always me. She's got the margin, I've got the line out the door." },
      },
      choices = {
        { text = "Good luck to you both. Something else.", next = "BACK" },
      },
    },
    x_rogue = {
      lines = {
        { id = "x_rogue_l0", text = "Suspicious is a strong word, friend, I prefer efficient. Anybody askin' too many questions gets a free candy cane and a very warm goodbye." },
      },
      choices = {
        { text = "I'll take the candy cane. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    snowballs = { { id = "ybswkholejinglepocket3", text = "Best seller. Everybody throws 'em, even dukes." } },
    guchie = { { id = "yswkholejinglepocket4", text = "My cousin. She's got the fancy stuff. I've got the customers." } },
    mum = { { id = "yswkholejinglepocket5", text = "Raised us both. I send her half my pay, an' I'd send more if I could." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back for more fireworks, and nothing burned down last time! You're my sort of customer." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Fireworks are on the table, but don't set them off near my stall." },
    { id = "g_default", text = "Fireworks for the festival! Light them outside, away from thatch, and away from the guards if you value your purse." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I hope you didn't set anything alight last time, or at least nothing that belonged to anyone." },
  },
  notice = {
    { id = "n_mage", cat = "wonder", when = { class = "MAGE" },
      text = "A mage, buying fireworks? I'd have thought you'd make your own, though I'm glad of the custom." },
  },
  start = "hello",
  nodes = {
    ydarian = {
      lines = {
        { id = "yswlilliansingh1", text = "Not anymore. He burned his hand badly two years ago, testing a new rocket, and he's never been the same with a fuse. So I do the festivals, and he does the books, and neither of us mentions it." },
        { id = "yswlilliansingh2", when = { class = { "PRIEST", "PALADIN" } }, text = "If you could look at his hand, I'd be grateful. The scars still ache in the cold." },
      },
      choices = {
        { text = "Fireworks should be sold with a proper warning to every buyer.", next = "BACK", reply = "Always, and I've the burn on my thumb to prove why it matters.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the duds cheap and let the children find out.", next = "BACK", reply = "The children would find out with their fingers, and I'd never forgive myself.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Should he try again?", next = "yagain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yagain = {
      lines = {
        { id = "yswlilliansingh3", text = "He wants to, and I don't want him to. A firework's only beautiful from far away. Some say a craftsman should face his fear, and some say a burned hand is a sign to stop." },
      },
      choices = {
        { text = "Let him try again. Courage heals more than salves.", next = "BACK", reply = "Maybe you're right. I'll stand three paces back, mind.", fx = { align = { light = 1 } } },
        { text = "Keep him safe. Some risks aren't worth taking.", next = "BACK", reply = "Thank you. I'll tell him a stranger agreed with me, which he'll hate.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "What's the best firework you've ever seen?", next = "x_best" },
        { text = "A mage could light those fuses from a distance.", next = "x_mage", when = { class = "MAGE" } },
        { text = "Gnomes made the first fireworks, didn't they?", next = "x_gnome", when = { race = "Gnome" } },
        { text = "Does Darian ever take the stall out?", next = "ydarian" },
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
    x_best = {
      lines = {
        { id = "x_best_l0", text = "Darian's red rocket cluster, the year the last of the city walls went up. It lit the whole canal red and gold, and half the Mage Quarter thought it was under attack." },
      },
      choices = {
        { text = "What happened then?", next = "x_best2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_best2 = {
      lines = {
        { id = "x_best2_l0", text = "The guard came running, and then the mages came running, and then everyone stopped and watched because it was beautiful. Darian was fined, and he paid it smiling." },
      },
      choices = {
        { text = "Worth every copper?", next = "x_best3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_best3 = {
      lines = {
        { id = "x_best3_l0", text = "He says so, and so do I, though I'll not tell the guard that. Fireworks are for days when a city needs reminding to look up." },
      },
      choices = {
        { text = "Well said. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_mage = {
      lines = {
        { id = "x_mage_l0", text = "They could, and they do, and then they blow off their own hats from showing off. Stand back three paces like everyone else, please." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    x_gnome = {
      lines = {
        { id = "x_gnome_l0", text = "My grandfather would tell you so, and so would the gnome who sold him the powder. I've never found the truth of it, and I'm not sure anyone has." },
      },
      choices = {
        { text = "A gnome would claim it. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    darian = { { id = "yswlilliansingh4", text = "My cousin. He sells fireworks in the Mage Quarter, and he burned his hand two years ago." } },
    festival = { { id = "yswlilliansingh5", text = "The festival's the best time for fireworks. The sky goes red and gold." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hello again! I've refilled all twelve jars and saved the lemon drops you liked, by the precise weight of a full ounce." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. You. The sweets are by the ounce and the scale is calibrated, so no need for chatting." },
    { id = "g_default", text = "Sweets, treats and sugared delights, at a precise and very fair price per ounce! Are you shopping for yourself, or for one of the little ones?" },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I've refilled the candy jars, all twelve of them, and recalibrated the scale." },
  },
  notice = {
    { id = "n_gnome", cat = "wonder", when = { race = "Gnome" },
      text = "A fellow gnome! Do you remember the sugar works in Gnomeregan? I still dream about the caramel pipes." },
  },
  start = "hello",
  nodes = {
    ymiss = {
      lines = {
        { id = "yswemmithuesmails1", text = "The caramel pipes, of course, and the sound of the sugar presses. But most of all, my apprentice Fizzlecog, who stayed behind to save the recipes when the radiation came. I've not heard from him since." },
        { id = "yswemmithuesmails2", when = { race = "Gnome" }, text = "You'll understand, then. Every one of us left someone behind. I keep a list, and I check it each time a new refugee comes up the tram." },
      },
      choices = {
        { text = "A sweet-seller should give every child a fair ounce.", next = "BACK", reply = "Exactly so, measured to the grain, because the orphans deserve every bit of it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Short the ounce a little; children can't read a scale.", next = "BACK", reply = "Some of them can, actually, and they'd tell everyone in the orphanage by teatime.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Is there hope he lived?", next = "yhope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhope = {
      lines = {
        { id = "yswemmithuesmails3", text = "The tinkers say some gnomes are still below, turned strange by the radiation. I've half a mind to go back and look, but it would mean leaving the orphans without their sweets." },
      },
      choices = {
        { text = "Go and look. You owe him that.", next = "BACK", reply = "You're right, I suppose. I'll ask the tinkers if there's a way to go safely.", fx = { align = { light = 1 } } },
        { text = "Stay. The orphans need you here.", next = "BACK", reply = "That's what I tell myself. Thank you for saying it aloud.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "What's your perfect-sweet formula?", next = "x_formula" },
        { text = "Did you escape Gnomeregan with the others?", next = "x_gnome", when = { race = "Gnome" } },
        { text = "What do you miss most from Gnomeregan?", next = "ymiss" },
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
    x_formula = {
      lines = {
        { id = "x_formula_l0", text = "Sugar times smile, divided by the price, plus a constant for whether they've eaten that day. If they haven't, I adjust the constant, and the price, and nobody needs to know." },
      },
      choices = {
        { text = "You give them away, then?", next = "x_formula2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_formula2 = {
      lines = {
        { id = "x_formula2_l0", text = "I'd call it a rounding error, and rounding errors are perfectly respectable. The matron at the orphanage knows, and she pretends not to, and we're both very happy." },
      },
      choices = {
        { text = "Who runs the orphanage?", next = "x_formula3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_formula3 = {
      lines = {
        { id = "x_formula3_l0", text = "Matron Nightingale, a stern woman with a soft heart, and she counts every copper twice. She's the only customer whose sums I can't beat." },
      },
      choices = {
        { text = "A worthy rival. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_gnome = {
      lines = {
        { id = "x_gnome_l0", text = "I did, with a satchel of recipes and one boot, and I've never found the other. If you see a left boot with a sugar stain in Tinker Town, it's mine, and I'd like it back." },
      },
      choices = {
        { text = "I'll keep an eye out. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gnomeregan = { { id = "yswemmithuesmails4", text = "My home once. Now it glows, and not in the nice way." } },
    fizzlecog = { { id = "yswemmithuesmails5", text = "My apprentice. He stayed behind to save the recipes." } },
    background = { { id = "tp_bg", text = "Gnomeregan confectioner, Stormwind refugee, Children's Week sweet-seller. Not in that order of happiness." } },
    rumors = { { id = "tp_rumors_x", text = "The orphans say there's a shadowy man on the canals who gives them coppers to carry messages. I've told the matron, and she's told the guard." } },
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
    yserve = {
      lines = {
        { id = "yswsquirerowe1", text = "My father was his groom, and he died of a fever when I was ten. The marshal took me in, taught me letters and swordwork, and never once let me feel like a charity case. I owe him everything I am." },
        { id = "yswsquirerowe2", when = { race = "Human" }, text = "You'll know how it is in Stormwind, for an orphan. The marshal gave me a home when nobody else would." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ynever = {
      lines = {
        { id = "yswsquirerowe3", text = "Then I'll keep waiting. Or I'll ride to Blackrock myself. The guards say a squire has no business going alone, and they're probably right. But someone should go." },
      },
      choices = {
        { text = "Go. Loyalty means not waiting forever.", next = "BACK", reply = "You understand. I'll ask the guard captain for leave tomorrow.", fx = { align = { honor = 1 } } },
        { text = "Wait. Your oath is to stand where he left you.", next = "BACK", reply = "Yes. He left me here, and here I'll stay. Thank you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yprestor = {
      lines = {
        { id = "yswsquirerowe4", text = "Beautiful, clever, and everyone in the court does what she says. The marshal didn't trust her, but he never said why. I'd ask you to watch her, if you go to the keep, and tell me if she does anything strange." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "How did you come to serve the marshal?", next = "yserve" },
        { text = "What will you do if he never returns?", next = "ynever" },
        { text = "I'd squire for a knight like that.", next = "BACK", when = { class = { "PALADIN", "WARRIOR" } }, reply = "Then you know what it means. If he comes back, I'll introduce you. He likes a straight back." },
        { text = "What do you think of Lady Prestor?", next = "yprestor" },
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
      lines = { { id = "gate_default", text = "Because this is where he'll come in, if he comes in, and I want to be the first face he sees. The guards laugh at me, but they let me stand here, and that's enough." } },
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
    windsor = { { id = "yswsquirerowe5", text = "The finest knight in Stormwind. He'll come home." } },
    blackrock = { { id = "yswsquirerowe6", text = "Where the marshal rode and never came back. A place of fire and dark iron." } },
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
        { text = "The Light will reveal her for what she is.", next = "light", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "The Dark Irons held you? That's my people's shame too.", next = "darkiron", when = { race = "Dwarf" } },
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
      choices = {
        { text = "How do you unmask a dragon in a throne room?", next = "unmask" },
        { text = "Then the court is full of fools. Something else.", next = "BACK" },
      },
    },
    captured = {
      lines = { { id = "c_default", text = "I rode for Blackrock to learn who was arming the orcs, and the Dark Irons took my men and me in a single night. They kept me alive because they thought I'd be useful, and they were right, though not the way they wanted." } },
      choices = {
        { text = "What became of your men?", next = "men" },
        { text = "Your squire never stopped waiting. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    unmask = {
      lines = { { id = "un_default", text = "With the truth, read aloud where she can't twist it, and with steel ready for when she stops pretending. Dragons are proud, and pride makes them careless when they're cornered." } },
      choices = { { text = "Then I'll keep my steel ready. Something else.", next = "BACK" } },
    },
    men = {
      narr = "His jaw tightens, and for a moment he says nothing at all.",
      lines = { { id = "me_default", text = "Worked to death in the forges under the mountain, most of them, while I listened through the walls. I said their names every night so I wouldn't forget them, and I'll say them again to the king when this is done." } },
      choices = { { text = "They'll be remembered. Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "li_default", text = "I pray it will, though the Light has stood beside that throne for years and she's never once flinched. We may need to give it a little help, and I'd be glad of yours." } },
      choices = { { text = "You'll have it. Something else.", next = "BACK" } },
    },
    darkiron = {
      lines = { { id = "da_default", text = "No, friend, the shame is Thaurissan's and his line's, and I'll hear no dwarf of Ironforge say otherwise. Your people have bled against Blackrock as long as mine, and today you'll help me finish what they started." } },
      choices = { { text = "Then let's finish it. Something else.", next = "BACK", fx = { affinity = 1 } } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and the shadows still like you, it seems. Come and sit by the circles, if you like." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Mind the circles, keep to the wall, and don't disturb our studies." },
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
        { text = "How did you join the circle?", next = "x_join" },
        { text = "I'm a warlock. I know the doors downstairs.", next = "x_lock", when = { class = "WARLOCK" } },
        { text = "The Light would see you burn for this.", next = "x_priest", when = { class = "PRIEST" } },
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
    x_join = {
      lines = {
        { id = "x_join_l0", text = "A man in the Mage Quarter lent me a book I shouldn't have read, and when I finished it, he asked if I wanted another. That was Gakin, and the next book came with a key." },
      },
      choices = {
        { text = "What did you learn first?", next = "x_join2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_join2 = {
      lines = {
        { id = "x_join2_l0", text = "How to listen, before anything else, because what's on the other side speaks and you must hear only what you mean to. Most of us learned that lesson by hearing too much." },
      },
      choices = {
        { text = "Do you regret it?", next = "x_join3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_join3 = {
      lines = {
        { id = "x_join3_l0", text = "Some nights, yes, when the imps are restless and Zardeth is in a mood. But I'm no clerk now, and I'll never be one again." },
      },
      choices = {
        { text = "Be careful. Something else.", next = "BACK" },
      },
    },
    x_lock = {
      lines = {
        { id = "x_lock_l0", text = "Then you'll know Gakin by sight, and you'll know to bring your own candles. Zggi eats ours." },
      },
      choices = {
        { text = "Noted. Something else.", next = "BACK" },
      },
    },
    x_priest = {
      lines = {
        { id = "x_priest_l0", text = "It might, priest, though the Light hasn't come down these stairs yet to say so. Speak softly, or the others will hear you, and they're less polite than I am." },
      },
      choices = {
        { text = "Watch yourself. Something else.", next = "BACK" },
      },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again? Zggi remembers you, and Zggi does not hate you as much as the others, which is high praise from Zggi." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You! Zggi remembers you, and Zggi would bite your ankle if Zardeth allowed it." },
    { id = "g_default", text = "What do you want, mortal? Zggi is busy, very busy, doing nothing at all for Zardeth." },
    { id = "g_back", when = { metBefore = true }, text = "You again? Zggi remembers you, and Zggi is not impressed." },
  },
  start = "hello",
  nodes = {
    yfree = {
      lines = {
        { id = "ybswzggi1", text = "Burn everything! No, wait. First Zggi would find a warm place, and then sit, and then burn a few things, only small ones. Then Zggi would go home and tell everyone about the stupid humans and their candles." },
        { id = "ybswzggi2", when = { class = "WARLOCK" }, text = "Do not get ideas, warlock. Zggi knows that look, and Zggi does not like it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yzardeth = {
      lines = {
        { id = "yswzggi1", text = "Reads, and mutters, and makes Zggi fetch things. Also he sells to the warlocks who come down the stairs, but he says they are all fools, and then he takes their coin. Zggi likes that part." },
        { id = "yswzggi2", when = { class = "WARLOCK" }, text = "Zardeth says you are a fool too. Zggi does not disagree, but Zggi is being polite because you are listening." },
      },
      choices = {
        { text = "Do you like Zardeth?", next = "ylike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylike = {
      lines = {
        { id = "yswzggi3", text = "Like? Zggi is bound to him. Zggi does not like or not like. But he once gave Zggi a whole candle for being good, and Zggi kept it under the floor for a month. It was a very nice candle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Zggi, servant of the great Zardeth, and keeper of his candles, his scrolls and his very bad temper. Speak, and make it worth my while." } },
      again = { { id = "h_again", text = "More questions? Zggi is getting bored, and bored imps set fires." } },
      choices = {
        { text = "What's it like serving Zardeth?", next = "serve" },
        { text = "Where do you come from?", next = "home" },
        { text = "Zardeth never lets you light fires?", next = "x_fire" },
        { text = "Being a servant isn't so bad.", next = "x_stance" },
        { text = "I'm a warlock. Mind your tongue, imp.", next = "x_lock", when = { class = "WARLOCK" } },
        { text = "What does Zardeth do all day?", next = "yzardeth" },
        { text = "What would you do if you were free?", next = "yfree" },
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
    x_fire = {
      lines = {
        { id = "x_fire_l0", text = "Never! Only candles, tiny little candles, as if Zggi were a common apprentice. Once Zggi lit the curtains, and Zardeth made Zggi hold a candle for a week." },
      },
      choices = {
        { text = "A whole week?", next = "x_fire2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_fire2 = {
      lines = {
        { id = "x_fire2_l0", text = "A whole week, standing, while the acolytes laughed. Zggi remembers each of them, by name and by smell." },
      },
      choices = {
        { text = "What will you do to them?", next = "x_fire3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_fire3 = {
      lines = {
        { id = "x_fire3_l0", text = "Nothing, yet. Zggi is patient, when Zggi has to be, and acolytes always forget to bring their own candles." },
      },
      choices = {
        { text = "I'll warn them. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "Not so bad? You try it, mortal, with a master who tuts at every little blaze. Zggi would like to see you do better." },
      },
      choices = {
        { text = "A bound servant should obey. That's the bargain.", next = "BACK", reply = "Spoken like a master. Zggi hates you a little now.", fx = { align = { order = 1 } } },
        { text = "Nobody should be bound to serve. You deserve freedom.", next = "BACK", reply = "Freedom! Yes! Zggi would burn the tavern first thing.", fx = { align = { order = -1 } } },
      },
    },
    x_lock = {
      lines = {
        { id = "x_lock_l0", text = "Hmph. Another master type. Zggi will be civil, warlock, but only because Zardeth is listening." },
      },
      choices = {
        { text = "Wise imp. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    home = { { id = "ybswzggi3", text = "Somewhere warmer, with more screaming. You would not like it." } },
    zardeth = { { id = "yswzggi4", text = "The great Zardeth. He reads, and mutters, and makes Zggi fetch things." } },
    candle = { { id = "yswzggi5", text = "Zggi once got a whole candle for being good. It was very nice." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Blessings of the Light upon you again, friend. I find I am quite fond of your company, which a priestess would say." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Blessings of the Light upon you, citizen, though I would rather you walked a little further away from me." },
    { id = "g_default", text = "Blessings of the Light upon you, citizen. I am a priestess, and I am walking to the garden, as priestesses do." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Attack!") }, text = "Keep close, and say nothing to the guards. A priestess with a bodyguard is perfectly ordinary, I'm told." },
  },
  start = "hello",
  nodes = {
    yscared = {
      lines = {
        { id = "ybswpriestesstyriona1", text = "Terribly. My hands shake in this robe, and I keep forgetting the words. But Tyrion says if we don't do something, nobody will, and the Defias will keep their friends in high places for good." },
        { id = "ybswpriestesstyriona2", when = { class = "PRIEST" }, text = "You'll know the words, then. Could you teach me a proper blessing before we reach the garden?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yname = {
      lines = {
        { id = "yswpriestesstyriona1", text = "I'd rather not say, not here. Tyrion calls me his priestess, and that's enough for now. I'm a maid in Lord Lescovar's house, if you must know, and I see things a maid shouldn't." },
        { id = "yswpriestesstyriona2", when = { class = "ROGUE" }, text = "You'll understand. A maid can go anywhere and no one looks twice. It's almost like being invisible." },
      },
      choices = {
        { text = "What have you seen?", next = "yseen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yseen = {
      lines = {
        { id = "yswpriestesstyriona3", text = "Letters with no seals, and men with grey cloaks coming at night. If I go to the guard, they might not believe me, and Lord Lescovar would know who told. Tyrion says we should catch him in the act first." },
      },
      choices = {
        { text = "Go to the guard. Let the law handle it.", next = "BACK", reply = "That's the right thing, I know. But the guard laughs at maids.", fx = { align = { order = 1 } } },
        { text = "Catch him yourselves. The law won't help you.", next = "BACK", reply = "That's Tyrion's plan. I just hope it works.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Priestess Tyriona, of the Cathedral of Light, and I carry a message for Lord Lescovar. It is a very holy message, and I am not at all made of gears." } },
      again = { { id = "h_again", text = "Is there more? We must walk on, quietly and piously." } },
      choices = {
        { text = "Your disguise is very convincing.", next = "disguise" },
        { text = "What message are you carrying?", next = "message" },
        { text = "Who is Tyrion, really?", next = "x_tyrion" },
        { text = "A real priest would know your blessing is wrong.", next = "x_priest", when = { class = "PRIEST" } },
        { text = "I could help you watch the garden.", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "What's your real name?", next = "yname" },
        { text = "Are you frightened?", next = "yscared" },
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
    x_tyrion = {
      lines = {
        { id = "x_tyrion_l0", text = "Tyrion is a squire at the keep, and he has a very good eye for what nobles do when they think nobody's looking. He found these robes in a wash-house, and I'm not to say which one." },
      },
      choices = {
        { text = "Why do you help him?", next = "x_tyrion2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_tyrion2 = {
      lines = {
        { id = "x_tyrion2_l0", text = "Because he's my friend, and because he thinks something is rotten in the House of Nobles, and so do I. The robe is only borrowed, and I'll give it back clean." },
      },
      choices = {
        { text = "What does he suspect?", next = "x_tyrion3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_tyrion3 = {
      lines = {
        { id = "x_tyrion3_l0", text = "That Lord Lescovar meets men he shouldn't, and that the Defias have friends higher than the Stockade. He won't say more, and I don't ask." },
      },
      choices = {
        { text = "Be careful, both of you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_priest = {
      lines = {
        { id = "x_priest_l0", text = "Oh. Oh dear. Is it the part about the Light and the something? Please, say nothing to the guards, and I'll practice it tonight." },
      },
      choices = {
        { text = "I'll stay quiet. Something else.", next = "BACK" },
      },
    },
    x_rogue = {
      lines = {
        { id = "x_rogue_l0", text = "Would you? Tyrion would be glad, though he'll pretend he had it all in hand. Speak to him at the keep, and tell him the priestess sent you." },
      },
      choices = {
        { text = "I'll find him. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    tyrion = { { id = "yswpriestesstyriona4", text = "A squire at the keep, and my friend. He has a good eye." } },
    lescovar = { { id = "yswpriestesstyriona5", text = "Lord Lescovar. I serve in his house. That's all I'll say." } },
    background = { { id = "tp_bg", text = "I am a priestess. That is all there is to me, really." } },
    _none = { { id = "tp_none", text = "The Light has not revealed that to me, citizen." } },
  },
}

-- Duke August Foehammer: a dwarven duke of the Might of Kalimdor, stationed at Cenarion Hold in Silithus (Classic 1.9 Ahn'Qiraj war; the file sits in the Stormwind pack).
P:NPC {
  key = "sw_duke_foehammer", id = 15870, name = "Duke August Foehammer", gender = "male",
  role = "noble", tier = "quest",
  temper = { "loud", "proud" }, values = { "honor", "alliance" },
  notices = { "race", "class" },
  impression = {
    first = "A broad dwarven warrior in fine plate, who carries a duke's title like a hammer.",
    third = "{name} met Duke August Foehammer, a dwarven warrior of the Might of Kalimdor, at Cenarion Hold.",
  },
  greetings = {
    { id = "g_default", text = "Ho there, {class}! Stand up straight; ye're in the presence o' the Alliance's finest, an' I mean meself." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good, I like a face that doesnae run from a duke." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" }, text = "A fellow son o' Khaz Modan! Tell me ye've brought a decent ale, because the humans' stuff is watered swill." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" }, text = "A warrior, an' by the look o' that grip, a proper one. We'll get on fine." },
  },
  start = "hello",
  nodes = {
    ywar = {
      lines = {
        { id = "yswdukefoehammer1", text = "At the Thandol Span, an' later at Blackrock Spire, when we broke the Horde. I was a captain then, an' lost half me company in one charge. Magni made me a duke for the other half comin' home alive." },
        { id = "yswdukefoehammer2", when = { race = "Dwarf" }, text = "Ye'll know the Span, then. Me grandfather built a piece o' it, an' I near died holdin' it. Funny how a bridge ties a family." },
      },
      choices = {
        { text = "What do you remember most?", next = "yremember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yremember = {
      lines = {
        { id = "yswdukefoehammer3", text = "The smell o' the dragons the orcs rode, an' the heat. Me beard's never grown right on the left side since. I don't talk much about the rest, an' ye'll forgive me for that." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfix = {
      lines = {
        { id = "yswdukefoehammer4", text = "Bind the kingdoms by oath again, as Terenas did. But the humans won't hear it, an' the elves have gone home. Some say the Alliance needs a strong king, an' some say every kingdom should fend for itself." },
      },
      choices = {
        { text = "A strong king to bind them. Order wins wars.", next = "BACK", reply = "Aye, that's what I'd say if I were king. Thankfully, I'm not.", fx = { align = { order = 1 } } },
        { text = "Every kingdom must choose freely. Forced loyalty breaks.", next = "BACK", reply = "There's sense in that, though I'd not say it too loud in Stormwind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Duke August Foehammer, warrior o' Ironforge an' commander in the Might o' Kalimdor. I've come to Cenarion Hold because the Qiraji are stirrin' behind that wall, an' somebody has to be ready when it opens." } },
      again = { { id = "h_again", text = "Anythin' else? Out with it, then." }, { id = "h_again2", text = "Speak up, {g:lad|lass}. Me ears are full o' war drums." } },
      choices = {
        { text = "How did a dwarf become a duke?", next = "duke" },
        { text = "What brings you to Silithus?", next = "why" },
        { text = "What news from Ironforge?", next = "ironforge", when = { race = "Dwarf" } },
        { text = "The Alliance seems divided these days.", next = "divided" },
        { text = "You fought in the Second War?", next = "ywar" },
        { text = "What would you do about the divisions?", next = "yfix" },
        { text = "Any advice for a warrior?", next = "BACK", when = { class = "WARRIOR" }, reply = "Keep yer shield high, yer axe sharp, an' never trust a goblin wi' yer pay. That last one's the most important." },
        { text = "Farewell, Duke.", next = "END" },
      },
    },
    duke = {
      lines = { { id = "d_default", text = "By fightin' harder than anyone else in the Second War, an' by bein' too stubborn to die. King Magni gave me the title, an' I've been earnin' it ever since." } },
      choices = { { text = "A title well earned. Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "The war at Ahn'Qiraj, an' nothin' less. Horde an' Alliance both are sendin' soldiers to stand with the Cenarion Circle, an' I'm here to see they're fit to fight when the gates open." } },
      choices = {
        { text = "You fight beside the Horde here?", next = "poor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    poor = {
      lines = { { id = "p_default", text = "Aye, an' it sticks in me craw. But the Qiraji'll eat orc an' dwarf alike, so for now we stand shoulder to shoulder an' settle our quarrels after." } },
      choices = {
        { text = "Orders are orders. We fight where we're sent.", next = "BACK", reply = "That's a soldier's answer, an' a good one. Ye'll do fine out here.", fx = { align = { order = 1 } } },
        { text = "I'll not fight beside orcs, whatever the generals say.", next = "BACK", reply = "Then stay clear o' Silithus, {g:lad|lass}, because the bugs won't wait on yer feelings.", fx = { align = { order = -1 } } },
      },
    },
    ironforge = {
      lines = { { id = "i_default", text = "The forges still burn, an' Magni's keen on his digging at Uldaman an' all the titan business. The Dark Irons are stirrin' in the mountains, though, an' I don't like it." } },
      choices = { { text = "I'll keep an eye on the Dark Irons. Something else.", next = "BACK" } },
    },
    divided = {
      lines = { { id = "dv_default", text = "Aye, it is. Gilneas behind its wall, the elves gone home, Lordaeron dead. What's left o' us has to hold together, or the Horde'll pick us apart one at a time." } },
      choices = { { text = "Then we must hold. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    magni = { { id = "yswdukefoehammer5", text = "The King o' Ironforge. Gave me this title an' a headache." } },
    thandol_span = { { id = "yswdukefoehammer6", text = "Where I near died holdin' a bridge. Me grandfather built a piece o' it." } },
    background = { { id = "tp_bg", text = "Dwarf, warrior, duke, an' veteran o' more wars than I care to count." } },
    _none = { { id = "tp_none", text = "How should I know? Ask a human; they love talkin'." } },
  },
}

-- Grand Admiral Jes-Tereth: commander of Stormwind's fleet, who keeps her counsel in the keep.
P:NPC {
  key = "sw_grand_admiral_jes_tereth", id = 1750, name = "Grand Admiral Jes-Tereth", gender = "female",
  role = "officer", tier = "quest",
  communities = { "stormwind" }, temper = { "crisp", "proud" }, values = { "duty", "order" },
  notices = { "class", "race" },
  impression = {
    first = "A sharp-eyed admiral in naval blue, who looks at you as if you were a ship that needed refitting.",
    third = "{name} met Grand Admiral Jes-Tereth, who commands Stormwind's fleet, in Stormwind Keep.",
  },
  greetings = {
    { id = "g_default", text = "You have the admiral's attention, {class}, which is not a thing I hand out lightly. Be brief." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Have you any reports, or are you merely sightseeing in the keep?" },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" }, text = "A Stormwind face. Good; the fleet always needs citizens who know which end of a ship floats." },
  },
  start = "hello",
  nodes = {
    ymiss = {
      lines = {
        { id = "ybswgrandadmiraljestereth1", text = "Every hour I spend in this keep. The smell of tar, the noise of gulls, the feel of a deck in a storm. Here I have paper and nobles, and neither of them can be trimmed to the wind." },
        { id = "ybswgrandadmiraljestereth2", when = { class = { "WARRIOR", "HUNTER" } }, text = "You have the look of someone who would rather be out there too. Do not let them chain you to a desk." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ysea = {
      lines = {
        { id = "yswgrandadmiraljestereth1", text = "In the harbours of Stormwind, before the First War, on a fishing boat out of the old port. When the orcs burned the city I took the last boat out to Lordaeron with refugees. That was my first command." },
        { id = "yswgrandadmiraljestereth2", when = { race = "Human" }, text = "You may have had family on those boats. Many did. I remember every face." },
      },
      choices = {
        { text = "What do you remember of it?", next = "yremember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yremember = {
      lines = {
        { id = "yswgrandadmiraljestereth3", text = "A child who would not stop crying, and a mother who would not stop singing to her. We made landfall at Southshore after nine days, and every soul aboard was alive. It is the only thing I'm proud of." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yneed = {
      lines = {
        { id = "yswgrandadmiraljestereth4", text = "Ships, timber and sailors who will not desert to the Bloodsails for better pay. The nobles want the fleet to protect their trade, and the commons want it to protect their coasts. I cannot do both." },
      },
      choices = {
        { text = "Protect the coasts. The people come first.", next = "BACK", reply = "I agree, but the nobles control the purse. We shall see.", fx = { align = { order = 1 } } },
        { text = "Protect the trade. Gold builds the fleet.", next = "BACK", reply = "A practical answer, and one the House of Nobles would approve. Not one I like.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Grand Admiral Jes-Tereth, and I command Stormwind's fleet. Since Lordaeron fell and Kul Tiras withdrew, the Alliance's seas are largely ours to guard." } },
      again = { { id = "h_again", text = "Anything further? The harbour reports are waiting." }, { id = "h_again2", text = "Proceed. My time is the fleet's, so make it count." } },
      choices = {
        { text = "What threatens the seas?", next = "threats" },
        { text = "What happened to Kul Tiras?", next = "kultiras" },
        { text = "I'd like to serve in the fleet.", next = "serve", when = { class = "WARRIOR" } },
        { text = "Commanding from a keep seems odd.", next = "keep" },
        { text = "Where did you first go to sea?", next = "ysea" },
        { text = "What does the fleet need most?", next = "yneed" },
        { text = "I'd serve the fleet if called.", next = "BACK", when = { race = "Human" }, reply = "Then you'll be called, in time. Stormwind's coast is longer than it was, and its sailors fewer." },
        { text = "Do you ever miss the sea?", next = "ymiss" },
        { text = "I'll take my leave, admiral.", next = "END" },
      },
    },
    threats = {
      lines = { { id = "t_default", text = "The Bloodsail Buccaneers prey on every merchant from here to Booty Bay, and the Defias have friends in the docks. The Horde has ships of its own now, too, which is new and unwelcome." } },
      choices = {
        { text = "Pirates should hang, every one.", next = "BACK", reply = "The admiralty agrees, and we hang them when we can catch them.", fx = { align = { order = 1 } } },
        { text = "Some pirates are just hungry sailors.", next = "BACK", reply = "Hungry sailors do not sink merchantmen for sport. Do not romanticise them.", fx = { align = { order = -1 } } },
      },
    },
    kultiras = {
      lines = { { id = "k_default", text = "Admiral Proudmoore sailed to Kalimdor to destroy the Horde and died at Theramore, at his own daughter's doing, some say. Kul Tiras has drawn into itself since, mourning, and left the rest of us to guard the seas." } },
      choices = {
        { text = "Did Jaina betray her father?", next = "jaina" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jaina = {
      lines = { { id = "j_default", text = "That is a question I will not answer in the king's keep. She chose peace with the orcs, and her father chose war, and only one of them is still alive." } },
      choices = { { text = "Understood. Something else.", next = "BACK" } },
    },
    serve = {
      lines = { { id = "s_default", text = "The fleet always needs strong arms, but it needs sailors more than warriors. Speak to the harbour masters, learn to tie a knot, and come back when you can tell port from starboard." } },
      choices = { { text = "I'll learn. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    keep = {
      lines = { { id = "kp_default", text = "The fleet is commanded from where the decisions are made, and decisions are made here. I would rather be on a deck, believe me, but the regent's council does not convene at sea." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    bloodsail = { { id = "yswgrandadmiraljestereth5", text = "The Bloodsail Buccaneers. Pirates who prey on our merchants. We hang them when we catch them." } },
    southshore = { { id = "yswgrandadmiraljestereth6", text = "Where I first made landfall with refugees. I remember every face." } },
    background = { { id = "tp_bg", text = "A sailor since childhood, an admiral by merit, and a reluctant courtier by necessity." } },
    _none = { { id = "tp_none", text = "That is outside my jurisdiction. Ask the harbour master." } },
  },
}

-- Captain Dirgehammer: the dwarven officer in the Champions' Hall who outfits the Alliance's ranked soldiers.
P:NPC {
  key = "sw_captain_dirgehammer", id = 12777, name = "Captain Dirgehammer", gender = "male",
  role = "quartermaster", tier = "service",
  temper = { "gruff", "proud" }, values = { "honor", "alliance" },
  notices = { "class" },
  impression = {
    first = "A grizzled dwarven captain who judges a soldier by the dents in their armour.",
    third = "{name} spoke with Captain Dirgehammer in Stormwind's Champions' Hall.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, an' ye've earned a few more ranks, I see! Come in; I've a fine set o' plate that suits ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Rank's rank, an' I'll outfit ye, but I'll nae be pleased about it." },
    { id = "g_default", text = "Welcome to the Champions' Hall, {class}. Only those who've earned rank against the Horde trade with me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Earned a few more ranks, have ye?" },
  },
  start = "hello",
  nodes = {
    yoff = {
      lines = {
        { id = "ybswcaptaindirgehammer1", text = "Drink at the Pig an' Whistle an' argue wi' the human veterans about who won the Second War. They say Lothar, I say Ironforge's rifles, an' we both buy rounds till nobody remembers the question." },
        { id = "ybswcaptaindirgehammer2", when = { race = "Dwarf" }, text = "Same as any dwarf, {g:lad|lass}. Ale an' argument. Ye'll join me one night, an' bring yer own tankard." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfriend = {
      lines = {
        { id = "yswcaptaindirgehammer1", text = "Brannoc Stoneheart, a rifleman from Dun Morogh, who could shoot the wings off a fly at a hundred paces. A Frostwolf axe found him in the snow while he was reloadin', and I carried him back to Dun Baldar on me own back." },
      },
      choices = {
        { text = "Do you hate the Frostwolves for it?", next = "yhate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhate = {
      lines = {
        { id = "yswcaptaindirgehammer2", text = "Aye, some days. Other days I think they're defendin' their home, same as we'd defend ours. Brannoc would've said the same, curse him. What would ye say?" },
      },
      choices = {
        { text = "They're defending their home. Honour that, even in battle.", next = "BACK", reply = "Aye, that's Brannoc talkin' through ye. I'll drink to him tonight.", fx = { align = { honor = 1 } } },
        { text = "The Horde is the enemy. Show them no mercy.", next = "BACK", reply = "Aye, that's the soldier's creed. Brannoc'd have laughed at ye, but he'd have agreed.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Captain Dirgehammer, quartermaster o' the Alliance's best armour. I hand it out to those who've proven themselves in the battlegrounds, an' nobody else." } },
      again = { { id = "h_again", text = "Anythin' else? I've armour to polish." } },
      choices = {
        { text = "How do I earn your armour?", next = "earn" },
        { text = "Why a dwarf, in Stormwind's hall?", next = "dwarf" },
        { text = "How long did you fight in Alterac?", next = "x_av" },
        { text = "A dwarf runs the Alliance armoury? Proper.", next = "x_dw", when = { race = "Dwarf" } },
        { text = "I'm a paladin. Will your armour bear the Light?", next = "x_pal", when = { class = "PALADIN" } },
        { text = "Who was the friend you lost?", next = "yfriend" },
        { text = "What do you do when you're off duty?", next = "yoff" },
        { text = "Farewell, captain.", next = "END" },
      },
    },
    earn = {
      lines = { { id = "e_default", text = "Fight the Horde in Warsong Gulch, Arathi Basin an' Alterac Valley, an' climb the ranks. The higher ye climb, the finer the gear I'll let ye wear." } },
      choices = {
        { text = "The Horde must be fought at every turn.", next = "BACK", reply = "Aye, that's the spirit! The battlegrounds are waitin'.", fx = { align = { order = 1 } } },
        { text = "I'd rather we had peace with them.", next = "BACK", reply = "Peace, is it? Tell that to the Horde when they're at yer throat.", fx = { align = { order = -1 } } },
      },
    },
    dwarf = {
      lines = { { id = "d_default", text = "Because dwarves make the best armour, an' the best soldiers, an' the humans know it. Besides, somebody has to keep this hall in order." } },
      choices = {
        { text = "The humans might disagree.", next = "humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    humans = {
      lines = { { id = "hu_default", text = "Let 'em! They can argue with me after they've stood in Alterac's snow as long as I have." } },
      choices = { { text = "Fair point. Something else.", next = "BACK" } },
    },
    x_av = {
      lines = {
        { id = "x_av_l0", text = "Long enough tae lose two toes tae frost an' a good friend tae a Frostwolf axe. I came back wi' a limp an' a lot o' opinions on armour that fits in the cold." },
      },
      choices = {
        { text = "What makes armour fit for cold?", next = "x_av2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_av2 = {
      lines = {
        { id = "x_av2_l0", text = "Padding, an' no' too much iron touchin' skin. Plate gets cold enough in Alterac tae take yer flesh off when ye unbuckle, an' I've seen it." },
      },
      choices = {
        { text = "And that's why you check the rank?", next = "x_av3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_av3 = {
      lines = {
        { id = "x_av3_l0", text = "Aye, because a soldier who's earned it has been out there an' knows how tae wear it. Give the best gear tae a fresh recruit, an' he'll die in it lookin' grand." },
      },
      choices = {
        { text = "Fair reasoning. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_dw = {
      lines = {
        { id = "x_dw_l0", text = "Proper is right! The humans are good folk, but ask one tae rivet a pauldron an' ye'll see why I'm here. Earn yer rank, {g:lad|lass}, an' I'll fit ye like a king." },
      },
      choices = {
        { text = "I'll earn it. Something else.", next = "BACK" },
      },
    },
    x_pal = {
      lines = {
        { id = "x_pal_l0", text = "It'll bear whatever ye put in it, paladin, Light or ale. I've fitted half the Silver Hand in my day, an' none came back complainin'." },
      },
      choices = {
        { text = "Good to hear. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    pig_and_whistle = { { id = "ybswcaptaindirgehammer3", text = "Best ale in the city, which isnae sayin' much. Still, it's where the veterans drink." } },
    alterac = { { id = "yswcaptaindirgehammer3", text = "Snow an' blood an' Frostwolves. I left two toes and a friend there." } },
    brannoc = { { id = "yswcaptaindirgehammer4", text = "Brannoc Stoneheart. The finest shot in Dun Morogh. I miss him." } },
    background = { { id = "tp_bg", text = "A soldier o' Ironforge an' quartermaster o' the Alliance. Simple as that." } },
    _none = { { id = "tp_none", text = "Not my business, {g:lad|lass}. Mine's armour." } },
  },
}

-- Stormwind City Guard: the soldiers who patrol the city's districts and give directions.
P:NPC {
  key = "sw_stormwind_city_guard", id = 68, name = "Stormwind City Guard", gender = "male",
  role = "guard", tier = "service",
  communities = { "stormwind" }, temper = { "steady", "proud" }, values = { "duty", "order" },
  notices = { "race", "class" },
  impression = {
    first = "A city guard in polished plate and a blue tabard stands his post, eyes on the crowd.",
    third = "{name} spoke with one of the Stormwind City Guard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, friend. You've done right by this place, and the watch knows it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Keep the peace and keep moving, citizen, because I'll be watching." },
    { id = "g_default", text = "Welcome to Stormwind, citizen. Mind the canals, keep the peace, and ask if you've lost your way." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" }, text = "Good to see a son of Ironforge in the city. The tram to your folk runs from the Dwarven District, if you're homesick." },
    { id = "n_pal", cat = "class", when = { class = "PALADIN" }, text = "Light be with you, {class}. The Cathedral of Light is in the square to the north, but I expect you know that better than I do." },
  },
  start = "hello",
  nodes = {
    yvarian = {
      lines = {
        { id = "ybswstormwindcityguard1", text = "None that reaches a guard's ears. He went to a peace summit and never arrived, and the court says he'll return any day. They've been saying it for a long while now, and the boy king looks smaller every time I see him." },
        { id = "ybswstormwindcityguard2", when = { race = "Human" }, text = "You'll have heard the same rumours I have, I expect. I don't believe half of them, and the other half I'd rather not." },
      },
      choices = {
        { text = "The guard's job is to keep the peace, whatever it takes.", next = "BACK", reply = "That's what the tabard's for, citizen, and we wear it proudly.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Stormwind would manage fine without the guard poking its nose in.", next = "BACK", reply = "Tell that to the Defias, citizen, because they'd thank you for it.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Something else.", next = "BACK" },
      },
    },
    yserved = {
      lines = {
        { id = "yswstormwindcityguard1", text = "Six years, since the walls were finished and the new guard was formed. I was a stonemason's apprentice before that, and I worked on these very walls. I've a few friends who went Defias after they weren't paid." },
        { id = "yswstormwindcityguard2", when = { race = "Dwarf" }, text = "The dwarves helped build these walls too. Some of them didn't get paid either, and some went home angry." },
      },
      choices = {
        { text = "Do you understand them?", next = "yunderstand" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yunderstand = {
      lines = {
        { id = "yswstormwindcityguard3", text = "I do, and I don't. They built the city and got nothing, and they had every right to be angry. But they kill farmers in Westfall now, and that's not right either." },
      },
      choices = {
        { text = "They're outlaws now. The law must stop them.", next = "BACK", reply = "That's what I tell myself every morning when I put on this tabard.", fx = { align = { order = 1 } } },
        { text = "They were wronged first. The nobles share the blame.", next = "BACK", reply = "Keep your voice down, but aye, I think so too.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yworst = {
      lines = {
        { id = "yswstormwindcityguard4", text = "Telling people no. No, you can't go in the keep. No, the king isn't seeing petitioners. No, we don't know when the regent will hear your case. You'd be surprised how many people hate a guard for saying no." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I'm with the Stormwind City Guard, and we keep order from the Trade District to the keep. Need directions to a trainer, the bank or the auction house, or is there something else on your mind?" } },
      again = { { id = "h_again", text = "Anything else? The square doesn't watch itself." } },
      choices = {
        { text = "I need directions.", next = "BUSINESS" },
        { text = "How is the city holding up?", next = "city" },
        { text = "Who rules Stormwind now?", next = "rule" },
        { text = "Seen any trouble today?", next = "x_trouble" },
        { text = "I'm a dwarf. How do the guards treat my kin?", next = "x_dw", when = { race = "Dwarf" } },
        { text = "How long have you served?", next = "yserved" },
        { text = "What's the worst part of the job?", next = "yworst" },
        { text = "Do you have family in the city?", next = "BACK", when = { race = "Human" }, reply = "A wife in Old Town and two boys who want to be guards. I tell them to be bakers. They don't listen." },
        { text = "Is there any word of King Varian?", next = "yvarian" },
        { text = "Thank you, guard.", next = "END" },
      },
    },
    city = {
      lines = { { id = "c_default", text = "The walls are new and the streets are clean, but the Defias have hands in the city too, and the Stonemasons haven't forgotten they were never paid for rebuilding it. We keep the peace, but we hear the grumbling every day." } },
      choices = {
        { text = "The stonemasons were wronged.", next = "BACK", reply = "Maybe so, but murder on the roads doesn't put it right.", fx = { align = { order = -1 } } },
        { text = "Outlaws are outlaws, whatever their grievance.", next = "BACK", reply = "That's how the law sees it, and so do I.", fx = { align = { order = 1 } } },
      },
    },
    rule = {
      lines = { { id = "r_default", text = "Young King Anduin sits the throne while his father is missing, with Highlord Bolvar Fordragon as regent and Lady Katrana Prestor at his side. Bolvar's a good man, and I'd follow him anywhere, though I hear things about the court that make me glad I'm on the street." } },
      choices = {
        { text = "What sort of things?", next = "court" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court = {
      lines = { { id = "co_default", text = "Nothing a guard should repeat, and nothing I could prove besides. Just that a good deal of what Lady Prestor wants, the House of Nobles seems to want too." } },
      choices = { { text = "I'll keep my ears open. Something else.", next = "BACK" } },
    },
    x_trouble = {
      lines = {
        { id = "x_trouble_l0", text = "A pickpocket in the Trade District this morning, and a brawl at the Pig and Whistle last night. Quiet, for Stormwind." },
      },
      choices = {
        { text = "Who was the pickpocket?", next = "x_trouble2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_trouble2 = {
      lines = {
        { id = "x_trouble2_l0", text = "A boy from the canals, no older than twelve, who'd been paid to do it by a man in a grey cloak. We let the boy go and went looking for the cloak, but he's gone." },
      },
      choices = {
        { text = "Keep looking. Something else.", next = "BACK" },
      },
    },
    x_dw = {
      lines = {
        { id = "x_dw_l0", text = "Fair enough, mostly, though a few of the lads grumble about dwarves drinking the taverns dry. If anyone gives you trouble, ask for the sergeant." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    varian = { { id = "ybswstormwindcityguard3", text = "The king. Missing. The court says he'll be back. I hope they're right." } },
    defias = { { id = "yswstormwindcityguard5", text = "The Defias Brotherhood. They were stonemasons once, some of them my friends." } },
    walls = { { id = "yswstormwindcityguard6", text = "I helped build them. Six years ago, as an apprentice." } }, _none = { { id = "tp_none", text = "Couldn't say, citizen. Try the Pig and Whistle, they gossip about everything there." } } },
}
