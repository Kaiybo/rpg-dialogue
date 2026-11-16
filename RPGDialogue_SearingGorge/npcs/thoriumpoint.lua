-- Thorium Point: the Thorium Brotherhood's town on the cliffs above the Cauldron. Voice: bibles/searinggorge.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "oilfist", id = TODO_NPC("Overseer Oilfist"), name = "Overseer Oilfist",
  bible = "bibles/searinggorge.md", role = "noble", tier = "quest",
  communities = { "thorium_point" }, temper = { "stern" }, values = { "proud", "practical" },
  notices = { "race", "profession" },

  impression = {
    first = "Overseer Oilfist takes responsibility for everything at Thorium Point, and he made it clear that now includes me. He is a Dark Iron who stopped serving the mountain and carries that choice like a weight.",
    third = "{name} met Overseer Oilfist, who leads the Thorium Brotherhood's outpost at Thorium Point.",
  },

  greetings = {
    { id = "g_point", text = "Welcome tae Thorium Point, where everything that happens is my responsibility, an' that includes you, now." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, good. Ye're either useful or lost, an' I'm hopin' useful." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ironforge, by yer beard. Our clans have bled each other for centuries, but up here I've no time for it; do ye?" },
    { id = "n_smith", cat = "profession", when = { profession = { "Blacksmithing", "Enchanting" } },
      text = "A craftsman, then, an' ye'll understand us better than most. We were made tae forge, an' we forged for a tyrant, but now we choose." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "If the Firelord ever stops breathin' under it, aye, maybe. Our forefathers called him up an' burned this land tae ash, so I reckon the Brotherhood owes it somethin', though I couldnae tell ye what." } },
      choices = {
        { text = "Then pay that debt by mending what you can.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The past is ash. Forge what you need.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The mountain did, an' the masters who served it, an' we stole the learnin' a scrap at a time, at night, the same way we built our road out. Every enchanted plate we sell now is a theft from Ragnaros, an' I'll no' pretend that doesnae warm me." } },
      choices = {
        { text = "Steal everything the tyrant taught you. You owe him nothing.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Craft learned under a tyrant needs careful keeping.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk of other things.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A servant, by every story we were taught, a great weapon against the Bronzebeards an' the Wildhammers. What came was a master, an' my folk served him for centuries after, so mind yer imps, warlock, because every fool thinks he's the one holdin' the leash." } },
      choices = {
        { text = "Every leash needs a strong hand, and mine is strong.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some powers should never be called at all.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Our forefathers called the Firelord up out o' the deep places tae win a war, so ye'll forgive me if I watch what ye call up in my camp." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, an' ye'll be eyein' our forges for the enchantments in 'em. We learned that work under the Firelord's eye, an' we keep it for ourselves now." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! We Dark Irons didnae have much use for trees down in the depths, ye understand, but I'll confess the lads have grown fond o' that scrubby bush by the gate." },
        { id = "h_default", key = true,
          text = "Overseer Oilfist, of the Thorium Brotherhood. We're Dark Iron, an' we served Ragnaros in the depths o' that mountain, makin' arms for his armies, until we stopped." },
        { id = "h_kids", when = { metBefore = true },
          text = "The young ones were playin' too near the lava spiders again, so I've told Hansel tae deal with it. He was restin', he says, but he's always restin'." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The forges never go cold, even now, out o' habit. Down in the mountain, cold forges meant punishment, an' we keep 'em lit for different reasons now." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "You again. The Brotherhood trades with anyone who pays, but trust's another matter, an' ye've no' bought any yet." },
      },
      again = { { id = "h_again", text = "Aye? Speak up over the forge." } },
      choices = {
        { text = "Could the Gorge ever heal, Overseer?", next = "druid_q", when = { class = "DRUID" } },
        { text = "How did you escape?", next = "escape" },
        { text = "What does the Brotherhood make?", next = "trade" },
        { text = "And your kin still in the mountain?", next = "kin" },
        { text = "A Dark Iron. I was raised to hate your kind.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Teach me something of your craft.", next = "craft", when = { profession = "Blacksmithing" } },
        { text = "The fire spirits here answer to someone, Overseer.", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "Your smiths enchant steel. Who taught them, Overseer?", next = "xmage", when = { class = "MAGE" } },
        { text = "What did Thaurissan think he was summoning, Overseer?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll work with the Brotherhood.", next = "END", fx = { affinity = 1, standing = { thorium_point = 1 } } },
      },
    },
    escape = {
      big = true,
      lines = {
        { id = "e_default", text = "We made our own way out, with enchanted gear made at night under the Firelord's own nose, piece by piece. When we had enough, we walked out o' the depths an' didnae look back, an' we settled across the gorge, close enough tae the ore an' far enough tae sleep." },
      },
      choices = {
        { text = "That took courage.", next = "BACK", fx = { affinity = 3, trait = { brave = 1 } } },
        { text = "And now you sell to anyone?", next = "anyone" },
      },
    },
    anyone = {
      lines = {
        { id = "a_default", text = "Anyone who pays, Alliance or Horde, it makes no odds. We've had one master, an' we'll no' have another." },
      },
      choices = {
        { text = "Free trade suits me better than any master.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Picking no side is still picking a side, Oilfist.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    trade = {
      lines = { { id = "t_default", text = "The best steel this side o' the mountain, an' the plans for it, tae those who've earned our trust. Trust's dear here, an' ye pay for it in deeds." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "They're still forgin' for the Firelord, still believin' he's a god. Some I knew by name, but I don't say their names now, because it's easier." } },
      choices = {
        { text = "Could they be freed?", next = "kin_free" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin_free = {
      lines = { { id = "kf_default", text = "Some might, if they wanted it, but wantin' it is the hard part. We wanted it so badly we built our own way out, an' most down there have forgotten how tae want." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    dwarf = {
      big = true,
      lines = { { id = "d_default", text = "Aye, an' I was raised tae hate yours. We've both had a long while tae think about who taught us. Stand here an' talk, an' we'll see who's the better student." } },
      choices = {
        { text = "Fair. Let's talk.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } },
        { text = "Old hates die hard.", next = "BACK", fx = { align = { light = -1 }, affinity = -1, trait = { stern = 1 } } },
      },
    },
    craft = {
      lines = { { id = "c_default", text = "Heat ye can't feel through yer gloves is too hot. Down in the mountain we learned that by the scars. Learn it by listenin' tae me instead." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    k_shaman = {
      big = true,
      lines = {
        { id = "xsh_default", text = "Aye, they do, an' we built his armies' blades in the heat o' him for longer than ye've been alive. Ragnaros doesnae ask, he burns, an' if ye go speakin' tae his spirits, ye'll find out they've forgotten how tae answer anythin' else." },
        { id = "xsh_dwarf", when = { race = "Dwarf" },
          text = "A Bronzebeard who talks tae the elements, standin' in my camp, an' askin' me about the Firelord. Aye, the spirits here answer tae him, an' my kin in the mountain answer tae him too, an' that's the whole o' the trouble." },
      },
      choices = {
        { text = "Even fire can be talked down.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Some fires you just let burn out.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "How did the Brotherhood break free?", next = "escape" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything that happens on the Point is my responsibility, an' so I make it my business tae know about it. Ask me about any o' these." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "Ye've earned yer place at the forge, so I'll answer ye like one o' the Brotherhood. Here's what I can tell ye about." },
    },
    background = { { id = "tp_ba", text = "Born in the mountain, worked in the mountain, walked out o' the mountain. The last bit's the only part worth tellin'.", next = "escape" } },
    advice = { { id = "tp_ad", text = "Never trust a forge ye didnae light yerself." } },
    dark_iron = { { id = "tp_dark_iron", text = "They're my kin, my shame an' my sorrow, an' most of them still bend the knee down there. I pray they'll stop, though I've no' much hope." } },
    _none = { { id = "tp_none", text = "If it's no' on the Point, it's no' my concern." } },
  },
}

P:NPC {
  key = "hansel", id = TODO_NPC("Hansel Heavyhands"), name = "Hansel Heavyhands",
  bible = "bibles/searinggorge.md", role = "questgiver", tier = "quest",
  communities = { "thorium_point" }, temper = { "grumbling" }, values = { "loyal", "lazy" },
  notices = { "race", "kit" },

  impression = {
    first = "Hansel Heavyhands complained about being made to stand up before he complained about anything else. Freedom, for him, mostly seems to mean a chair, and I can't say I blame him.",
    third = "{name} met Hansel Heavyhands, the weary enforcer of the Thorium Brotherhood at Thorium Point.",
  },

  greetings = {
    { id = "g_rest", text = "Och, what is it now, when I'd just sat down? Fine, fine, out with it." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good! Ye can do the thing they want me tae do, an' everyone's happy." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Tauren" } },
      text = "Big, aren't ye? Folk say I'm built like an orc, an' I take it as a compliment; do you?" },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "The fire elementals, mostly, wanderin' about an' hissin' at the walls. Then there's the Dark Iron down the hill, an' the dragons over in the Steppes, an' Lolo's singin', though I'd never tell him that last one." } },
      choices = {
        { text = "Meet them on the wall, and sleep after.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Set a few traps, and let them find those instead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Lolo cannae see me sleepin', which is the beauty of it, though the old goat smells it somehow. Ye'd be surprised what slips past a tired dwarf, an' ye'd be more surprised what doesnae, so I'd no' try anythin'." } },
      choices = {
        { text = "A sleeping guard is a gift, and I never waste gifts.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Rest, Hansel. I'll keep watch for a while.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Never mind that.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Water's kind o' ye, though I'd still rather the chair. Down in the mountain we worked till we dropped, so a mage who thinks of a tired dwarf's comfort is a rare thing, an' I'll drink tae it." } },
      choices = {
        { text = "You've earned your rest, Hansel. Drink up.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Freedom's wasted on a dwarf who only sits.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can ye conjure a chair, by any chance? I've heard yer kind make bread an' water out o' thin air, an' a chair seems the obvious next step." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, is it? Ye'll be wantin' tae sneak past me, then, an' I'll save ye the bother, for I'm only pretendin' tae watch anyway." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid. If ye've come tae talk tae the rocks, go ahead, but they'll no' answer, for I've tried on the long nights." },
        { id = "h_default", key = true,
          text = "Hansel Heavyhands. I'm the one Lolo sends when somebody needs a firm word, or a firm fist, an' I'm very firm, an' also very tired." },
        { id = "h_spiders", tags = { "news" }, when = { questActive = TODO_QUEST("Fiery Menace!") },
          text = "The Overseer says the lava spiders are frightenin' the bairns, so now twenty of 'em are my job. Ye do it, an' I'll supervise from this chair." },
        { id = "h_incendosaurs", when = { questActive = TODO_QUEST("Incendosaurs? Whateverosaur is More Like It") },
          text = "Incendosaurs, they call 'em, which is a fancy name for big burnin' lizards. Go an' put some out, permanently." },
        { id = "h_tired", when = { metBefore = true },
          text = "Ye know what the best part o' freedom is? Sittin' down whenever ye like, with nobody tellin' ye tae stand, except the Overseer, an' Lolo, an' now you." },
      },
      again = { { id = "h_again", text = "Aye? Ask quick, I've just got comfy." } },
      choices = {
        { text = "What keeps you up on those long nights?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why are you always resting?", next = "resting" },
        { text = "What's Lolo like to work for?", next = "lolo" },
        { text = "How big are these lizards?", next = "lizards" },
        { text = "Arm-wrestle me.", next = "wrestle", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "My beast could take one of those lizards.", next = "k_hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Doesn't Lolo mind that you sleep on watch?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "No chairs, Hansel, but I could conjure you some water.", next = "xmage", when = { class = "MAGE" } },
        { text = "I'll handle it.", next = "END", fx = { affinity = 2 } },
      },
    },
    resting = {
      lines = { { id = "r_default", text = "Because for a long time I couldnae. Down in the mountain ye stood till ye dropped, so now I sit when I like, an' every time I sit, it's a wee bit o' freedom." } },
      choices = {
        { text = "Then sit, Hansel.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lolo = {
      lines = { { id = "l_default", text = "Grand, though he's blind as a bat an' twice as stubborn. He always knows where I am, an' says it's the snorin', but I don't snore." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    lizards = {
      lines = { { id = "z_default", text = "Big as a cart, hot as a forge, an' stupid as a boot, an' the stupid's what makes 'em dangerous, because they don't know tae run." } },
      choices = {
        { text = "Why not deal with them yourself?", next = "lizards_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lizards_why = {
      lines = { { id = "zw_default", text = "I could, but I'd have tae stand up, walk down the cliff, fight a lizard an' walk back up the cliff, or ye could, an' that, ye see, is teamwork." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    wrestle = {
      lines = { { id = "w_default", text = "Ha! Sit, then... no, ye sit, since I'm already sittin', an' that's my advantage. Ready? ...Ye nearly had me there, nearly." } },
      choices = { { text = "Rematch, someday.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Ha! It could try, an' I'd sit here an' watch, for it's the most fun I'd have had all week. The incendosaurs are made o' fire an' temper both, so let yer beast bite an' then let it run, because they don't like bein' bitten." },
      },
      choices = {
        { text = "My beast doesn't run.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Good advice. I'll keep it back.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Big, Dark Iron, free an' tired, an' mostly the last two.", next = "resting" } },
    advice = { { id = "tp_ad", text = "Sit down whenever ye can, because ye never know when somebody'll make ye stand." } },
    dark_iron = { { id = "tp_dark_iron", text = "They're no' us, for we're nicer, an' we sit down more." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, an' couldnae be bothered either, so ask Lolo." } },
  },
}

P:NPC {
  key = "lolo", id = TODO_NPC("Lookout Captain Lolo Longstriker"), name = "Lookout Captain Lolo Longstriker",
  bible = "bibles/searinggorge.md", role = "guard", tier = "quest",
  communities = { "thorium_point" }, temper = { "jovial" }, values = { "loyal", "proud" },
  notices = { "drink", "stealth" },

  impression = {
    first = "Lookout Captain Lolo Longstriker is nearly blind and smells out trouble instead, with a little help from the bottle. Nobody has snuck up on Thorium Point yet, so perhaps he's onto something.",
    third = "{name} met Lookout Captain Lolo Longstriker, the near-blind lookout of Thorium Point.",
  },

  greetings = {
    { id = "g_who", text = "Who goes there? No, don't tell me, I'll know ye by yer step... hmm, no idea at all. Who goes there?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah! I know that step now, so welcome back, friend, for I never forget a footfall, mostly." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye've had a few, I can smell it, an' good! A wee nip sharpens the nose, an' mine's never been sharper." },
  },

  react = { { id = "r_stealth", on = "stealth", text = "Someone's sneakin', an' don't ask how I know. I've no eyes, but I've a nose like a hound an' ears like a bat." } },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Arcane leaves a smell like a storm that hasnae broken yet, an' ye're wearin' it like perfume. I've a nose for trouble, an' yer kind are trouble that usually means well, which is the worst sort." } },
      choices = {
        { text = "Meaning well counts for a great deal, Captain.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Good intentions are worth nothing. Results are.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I can smell the wee beast from the gate, an' it smells like the deep forges under the mountain, which I'd hoped never tae smell again. Keep it close, warlock, an' keep it away from the bairns, for they've seen enough fire for one lifetime." } },
      choices = {
        { text = "It obeys me. Your bairns are safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My imp goes where it likes. That's its nature.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Lolo.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Brimstone! Either there's a warlock standin' in front o' me or the Gorge has finally opened up under my boots, an' I'm hopin' it's the warlock." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "Somebody smells o' candle smoke an' cold air, which means a mage, an' a mage means somethin' in my camp is about tae catch fire or freeze." },
        { id = "h_default", key = true,
          text = "Lookout Captain Lolo Longstriker, at yer service, blind as a mole an' captain o' the lookouts. Don't laugh, for nobody's snuck up on the Point yet." },
        { id = "h_kalaran", key = true, when = { heardClaim = "kalaran_father" },
          text = "That fellow southeast o' here, with the sad story about his father? I've never once smelled grief on him; I smelled somethin', but no' grief." },
        { id = "h_maltorius", tags = { "news" }, when = { questActive = TODO_QUEST("WANTED: Overseer Maltorius") },
          text = "Maltorius is overseer o' the Dark Iron slaves in the Gorge, an' a cruel one. The poster's up, so bring me his head, an' I'll... know it when I feel it." },
        { id = "h_drink", when = { metBefore = true },
          text = "Folk say I drink too much for a lookout, an' I say I'd see nothin' at all without it. They've no answer tae that, an' neither have I, come tae think of it." },
      },
      again = { { id = "h_again", text = "Aye, aye, still here. I can hear ye fidgetin'." } },
      choices = {
        { text = "How do you keep watch, blind?", next = "watch" },
        { text = "Who's Maltorius?", next = "maltorius" },
        { text = "What did you smell on Kalaran?", next = "kalaran", when = { heardClaim = "kalaran_father" } },
        { text = "Does the drink really help?", next = "drink" },
        { text = "I could sneak up on the Point, Captain.", next = "k_rogue", when = { class = { "ROGUE", "DRUID" } } },
        { text = "How can you smell that I'm a mage?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does my imp bother you, Captain?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll hunt Maltorius.", next = "END", fx = { affinity = 1, standing = { thorium_point = 1 } } },
      },
    },
    watch = {
      lines = {
        { id = "w_default", text = "The wind on the cliff tells me what's comin' up the road, the forge tells me the time, an' Hansel's snorin' tells me where Hansel is. Between the lot of 'em, I see plenty." },
      },
      choices = {
        { text = "Impressive.", next = "BACK", fx = { affinity = 2 } },
        { text = "And what do you hear about me?", next = "watch_me" },
      },
    },
    watch_me = {
      lines = {
        { id = "wm_default", text = "Light boots an' a heavy purse, an' ye stopped tae look at the lava twice on the way up. Everyone does, the first time." },
        { id = "wm_plate", when = { class = { "WARRIOR", "PALADIN" } }, text = "Plate! I heard ye a mile off, an' don't take it personal, but ye're a walkin' bell." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    maltorius = {
      lines = { { id = "m_default", text = "He's overseer o' the slaves still workin' the Gorge for the Firelord's people, an' it's whips, mostly. Ye can hear 'em from the cliff on a still night, an' I'd like tae stop hearin' 'em." } },
      choices = {
        { text = "Then someone should stop those whips.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Slaves in the Gorge are the Firelord's business, not mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kalaran = {
      big = true,
      lines = { { id = "k_default", text = "Smoke, an' somethin' old, like a cellar that's been shut a long while. Grief smells o' salt an' sleeplessness, an' he doesnae smell of either." } },
      choices = {
        { text = "Maybe your nose is wrong.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "I'll keep my eyes open.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = 1 } },
      },
    },
    drink = {
      lines = { { id = "d_default", text = "It helps me no' mind that I cannae see, which is close enough. Don't tell the Overseer I said that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Ye could try, an' ye'd smell o' boot leather an' nerves the whole way up the cliff. Every rogue who comes through Thorium Point thinks they'll be the first, an' I keep a count o' them in my head, every one caught." },
        { id = "xro_druid", when = { class = "DRUID" },
          text = "As a cat, I suppose, all soft paws an' no scent? Ye'd still smell o' moss an' sabercat, an' I'd still hear ye breathin', an' I'd still win." },
      },
      choices = {
        { text = "Then I'll try, and you'll add me to the list.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Best not to test a captain on his own wall.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was a lookout since before I lost my eyes, an' I kept the job after, for nobody's dared take it off me." } },
    advice = { { id = "tp_ad", text = "Listen more than ye look, because eyes lie an' the wind doesnae." } },
    _none = { { id = "tp_none", text = "Never seen it, ha, never seen anything! Ask someone else." } },
  },
}

P:NPC {
  key = "kalaran", id = TODO_NPC("Kalaran Windblade"), name = "Kalaran Windblade",
  bible = "bibles/searinggorge.md", role = "questgiver", tier = "quest",
  communities = { "searing_gorge_wilds" }, temper = { "brooding" }, values = { "vengeful", "cunning" },
  notices = { "class" },

  impression = {
    first = "Kalaran Windblade speaks of his murdered father and of vengeance on the Dark Iron in the same brooding breath. He tells it like a story he has told many times before.",
    third = "{name} met Kalaran Windblade in the Searing Gorge, who seeks vengeance on the Dark Iron for his father's death.",
  },

  greetings = {
    { id = "g_vengeance", text = "Another traveler, good. I have need of someone with a strong arm and no love for the Dark Iron." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "One of the Light's own. You'll understand, then, why the guilty must answer for what they've done." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I've had years to tell it, and grief wears smooth with handling, like a stone in a river. If you doubt me, ask the Dark Iron what they did here, and then ask yourself why they're so eager to deny it." } },
      choices = {
        { text = "Vengeance is honest work. Point me at them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Revenge isn't worth my knife, Kalaran.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A flame that doesn't falter, as I said, kindled from things that burn hotter than any forge in Thorium Point. You'd know something of such fires, warlock, so don't ask me to apologise for wanting one." } },
      choices = {
        { text = "No apology needed. Fire is fire.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Fire that hot burns the hand that holds it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let's leave the fire for now.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Then you understand that some debts can only be paid in fire, and that the people who owe them rarely pay willingly." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll understand vengeance better than most, I think, since your kind deal in quiet knives and long memories." },
        { id = "h_default", key = true,
          text = "I am Kalaran Windblade, and the Dark Iron took my father from me, butchered him, here in this gorge. I mean to see them pay, and I can't do it alone.",
          fx = { hear = "kalaran_father" } },
        { id = "h_retribution", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Divine Retribution") }, { questActive = TODO_QUEST("The Flawless Flame") } } },
          text = "We'll need a flame that doesn't falter, and the means to carry it. Bring me what I ask, and I'll forge vengeance from it." },
        { id = "h_torch", when = { any = { { questActive = TODO_QUEST("The Torch of Retribution") }, { questActive = TODO_QUEST("Forging the Shaft") }, { questActive = TODO_QUEST("The Flame's Casing") } } },
          text = "The torch is nearly ready. Every piece you bring brings my father's killers closer to the reckoning they deserve." },
        { id = "h_father", when = { metBefore = true },
          text = "I dream of him, and of what they did. You'd think the dreams would fade, but they don't, and good; I don't want them to." },
      },
      again = { { id = "h_again", text = "What else? We have work to do." } },
      choices = {
        { text = "Tell me about your father.", next = "father" },
        { text = "Which Dark Iron? The Brotherhood?", next = "which" },
        { text = "What will the torch do?", next = "torch" },
        { text = "Lolo says you don't smell of grief.", next = "lolo", when = { heardLine = "lolo.h_kalaran" } },
        { text = "You tell your story very smoothly, Kalaran.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What kind of fire does your torch need?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll help you.", next = "END", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Vengeance isn't justice, Kalaran. I'm a paladin.", next = "k_paladin", when = { class = "PALADIN" } },
        { text = "Vengeance won't bring your father back, Kalaran.", next = "END", fx = { align = { light = 1 } } },
      },
    },
    father = {
      lines = {
        { id = "f_default", text = "He was... strong, and proud, and the Dark Iron cut him down without a thought. That's all you need to know, and all I'll say." },
      },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 2 } },
        { text = "That's not much of a story.", next = "father_push", fx = { trait = { skeptical = 1 } } },
      },
    },
    father_push = {
      lines = { { id = "fp_default", text = "It's the only story that matters; where, when and how change nothing about what's owed. Help me or don't, but I've no time for questions." } },
      choices = {
        { text = "Then tell me one true thing about him. Just one.", tag = "Persuade", next = "father_slip",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "skeptical" }, { heardLine = "lolo.h_kalaran" } } } },
          fail = { next = "father_wall", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    which = {
      lines = { { id = "w_default", text = "Does it matter? Dark Iron is Dark Iron, and those at the Point trade with anyone, so they'd have traded with his killers, too." } },
      choices = {
        { text = "The Brotherhood escaped the same masters.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "You're right. Dark Iron is Dark Iron.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    torch = {
      lines = { { id = "t_default", text = "Burn, as he burned. Bring me the pieces and you'll see, and you'll see a great deal, at the end." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lolo = {
      lines = { { id = "l_default", text = "A blind drunk sniffs at me and you listen? Grief has no smell; it has a cost, and I'm paying mine, so bring me what I asked for." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    father_slip = {
      big = true,
      lines = {
        { id = "fs_default", text = "You're persistent, for one so... for one so young, and very well, then: I wasn't there when he fell, and I couldn't tell you which hand held the blade. What I know is that the Dark Iron owe a debt, and I mean to collect it, with or without the details you seem to want so badly." },
      },
      choices = {
        { text = "That sounds more like a grudge than grief.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "I'm sorry. I'll stop asking.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_wall = {
      lines = {
        { id = "fw_default", text = "One true thing: he's dead, and they killed him. Bring me the pieces of the torch, and spare me the questions." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_paladin = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Then call it justice, if the word helps you sleep, and I'll call it what it is. Either way the Dark Iron who killed my father walks this gorge, and either way someone ought to stop him." },
        { id = "xpa_scourge", when = { race = "Scourge" },
          text = "A dead man with the Light in him, lecturing me on vengeance. Your own people hunt the Scourge for revenge, so forgive me if your sermon rings a little hollow." },
      },
      choices = {
        { text = "Justice has rules. Vengeance doesn't.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "You're right. Call it what you like; I'll help.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Tell me about your father.", next = "father" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've made it my business to learn what I need for my vengeance, and little else. Ask about these, if they serve it." },
    },
    background = { { id = "tp_ba", text = "I am my father's son, and that is all I am until his killers are ash.", next = "father" } },
    advice = { { id = "tp_ad", text = "Never forgive what was taken from you, because forgiveness is how they win." } },
    dark_iron = { { id = "tp_dark_iron", text = "Murderers, every one of them. Don't let the ones at Thorium Point fool you; it's in the blood." } },
    _none = { { id = "tp_none", text = "That doesn't concern my vengeance, and nothing else matters." } },
  },
}
