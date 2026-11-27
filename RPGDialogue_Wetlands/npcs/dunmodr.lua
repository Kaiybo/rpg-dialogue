-- Rhag Garmason: Longbraid's man at Dun Modr, counting the dead of the Thandol Span. Voice: bibles/dunmodr.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "wl_rhag", id = TODO_NPC("Rhag Garmason"), name = "Rhag Garmason",
  bible = "bibles/dunmodr.md", role = "soldier", tier = "quest",
  communities = { "menethil" }, temper = { "steady", "earnest" }, values = { "loyal", "dutiful", "kind" },
  notices = { "soldier", "kit" },

  impression = {
    first = "He hopes for reinforcements more than he expects them.",
    third = "{name} met Rhag Garmason, one of Longbraid's dwarves clinging to the edge of fallen Dun Modr.",
  },

  greetings = {
    { id = "g_default", text = "Keep yer head down, friend, for the Dark Irons have archers on the walls. What brings ye tae Dun Modr, besides bad luck an' a bad map?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' in one piece, which on this road is a feat worth a toast." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' Dun Modr's still standin', just about. Any word o' reinforcements on yer travels?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown fierce since we last spoke. Longbraid could use a hundred like ye." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Menethil's talkin' about ye, an' even out here we hear it. Good deeds travel faster than reinforcements, it seems." },
    { id = "g_span", when = { questActive = TODO_QUEST("The Thandol Span") }, text = "Ye're still lookin' intae what happened at the Span, then. Whatever ye find out there, bring it straight back tae me." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, faction = "Alliance" },
      text = "A soldier, by the look o' ye! Forgive me for starin', but I've been waitin' tae see one come up that road for weeks." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye've met the Dark Irons, I see, for they leave that sort o' mark. There's no smith out here, so mind how ye go." },
  },

  start = "hello",
  nodes = {
    opn_stromgarde = {
      lines = {
        { id = "opn_stromgarde_q", text = "Worth it? I'd say aye, but then I'm holdin' the edge o' a fortress that's already lost, so ye'd expect me tae. The Highlands are full o' ogres an' worse, an' Stromgarde's half rubble. Ye've walked further than me; what d'ye think o' it?" },
      },
      choices = {
        { text = "A kingdom's worth fighting for, even in rubble.", next = "opn_stromgarde_r_retake", fx = { affinity = 1, align = { honor = 1 }, opinion = { stromgarde = "retake" } } },
        { text = "It's gone. They should save the living instead.", next = "opn_stromgarde_r_lost", fx = { align = { honor = -1 }, trait = { practical = 1 }, opinion = { stromgarde = "lost" } } },
        { text = "Pride got Stromgarde out of the Alliance. Pride won't save it.", next = "opn_stromgarde_r_proud", fx = { trait = { skeptical = 1 }, opinion = { stromgarde = "proud" } } },
        { text = "I fled the north myself. Every kingdom left standing matters.", next = "opn_stromgarde_r_retake", when = { race = "Human", origin = "human_lordaeron_refugee" }, fx = { affinity = 2, opinion = { stromgarde = "retake" } } },
        { text = "I haven't been to the Highlands.", next = "BACK" },
      },
    },
    opn_stromgarde_r = {
      lines = {
        { id = "opn_stromgarde_r_default", text = "Nor have I, an' at this rate I never will, so I'll take yer silence for a kindness." },
      },
      choices = {
        { text = "Something else, Rhag.", next = "BACK" },
      },
    },
    opn_stromgarde_r_retake = {
      lines = {
        { id = "opn_stromgarde_r_retake", text = "Aye, an' I'll drink tae it, if I ever get leave tae drink. Tell Captain Nials that if ye pass Refuge Pointe; she'll like hearin' it from someone who isnae under her command." },
      },
      choices = {
        { text = "Something else, Rhag.", next = "BACK" },
      },
    },
    opn_stromgarde_r_lost = {
      lines = {
        { id = "opn_stromgarde_r_lost", text = "Ye might be right, an' that's a hard thing tae hear on a wall like this one, for they'd say the same about us. Don't say it tae Longbraid, I beg ye." },
      },
      choices = {
        { text = "Something else, Rhag.", next = "BACK" },
      },
    },
    opn_stromgarde_r_proud = {
      lines = {
        { id = "opn_stromgarde_r_proud", text = "They did leave, aye, after the Second War, an' we never understood it. But a proud man still bleeds the same as a humble one, an' they've bled plenty." },
      },
      choices = {
        { text = "Something else, Rhag.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rhag Garmason, one o' Longbraid the Grim's soldiers. A tremendous explosion roared through these hills when the Dark Irons hit the Thandol Span, an' good soldiers died defendin' it, so now we hold what's left o' Dun Modr an' wait." },
        { id = "h_found", tags = { "news" }, when = { questReady = TODO_QUEST("The Thandol Span") },
          text = "Ye've found somethin', I can see it on yer face. Tell me straight, for I've had enough o' waitin'." },
        { id = "h_plea_back", tags = { "news" }, when = { questRecent = { TODO_QUEST("Plea To The Alliance"), days = 5 } },
          text = "Ye're back from Refuge Pointe, then. Whatever Nials said, I can see from yer face it wasnae the answer we wanted." },
        { id = "h_plea", when = { questActive = TODO_QUEST("Plea To The Alliance") },
          text = "Refuge Pointe, north in the Highlands, an' ask for Captain Nials. Tell him Longbraid would take any soldiers he can spare, an' tell him we said please." },
        { id = "h_span_done", when = { questDone = TODO_QUEST("Plea To The Alliance") },
          text = "Nials has her own fallen city tae weep over, an' I cannae blame her for it. So it's us an' the reserves o' Ironforge, whenever they come." },
        { id = "h_dad_resolved", tags = { "news" }, when = { thread = { id = "dwarves_and_dark_iron", state = "resolved" } },
          text = "I told the lads what ye said the King told ye, an' one o' them's carved it intae the stone by the gate. It's no' an army, but they stand straighter on the wall for it." },
        { id = "h_dad_soured", when = { thread = { id = "dwarves_and_dark_iron", state = "soured" } },
          text = "I've stopped askin' travellers about reinforcements. We hold Dun Modr because we're standin' in it, an' that'll have tae do." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf o' Khaz Modan! Ye'll understand what it means tae see the Span broken, for that bridge was older than my grandfather's grandfather." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin. Say a word for the lads we lost on the Span, if ye would; they died wi' their faces tae the enemy." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, this far south? Ye've no business wi' us, an' we've none wi' ye, so pass by quiet an' I'll do the same." },
        { id = "dd_nekrosh", tags = { "news" }, when = { questDone = TODO_QUEST("Defeat Nek'rosh") },
          text = "Word reached us up here that Nek'rosh is dead. Longbraid didnae smile, for he never does, but he sharpened his axe a long while after, an' that's near enough." },
      },
      again = {
        { id = "h_again", text = "What else? The archers are quiet for now." },
        { id = "h_again2", text = "Ask what ye like, friend, for there's little else tae do but wait." },
      },
      choices = {
        { text = "The Thandol Span looks badly broken.", next = "span" },
        { text = "Is anyone missing from your company?", next = "rustlocke" },
        { text = "Tell me about Longbraid.", next = "longbraid" },
        { text = "Ironforge seems slow to send help.", next = "help" },
        { text = "I've spoken with King Magni about Dun Modr.", next = "king_word",
          when = { thread = { id = "dwarves_and_dark_iron", beat = "b4_magni", state = { "stirring", "unfolding" } } } },
        { text = "How long has the Span stood?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Hold fast, Rhag.", next = "END" },
      },
    },

    span = {
      lines = {
        { id = "sp_default", text = "The Dark Irons packed the bridge wi' powder an' blew the near span intae the gorge. 'Twas horrible, I tell ye, for half o' the guard was standin' on it when it went." },
      },
      choices = {
        { text = "Somebody must have planned it.", next = "span_who" },
        { text = "Something else, Rhag.", next = "BACK" },
      },
    },
    span_who = {
      lines = {
        { id = "sw_default", text = "We didnae know till ye found the orders on Rustlocke's body. Kam Deepfury, they're signed, an' he stashed a cache o' explosives across the Span tae finish what he started." },
        { id = "sw_before", when = { questBefore = TODO_QUEST("Plea To The Alliance") },
          text = "Some Dark Iron wi' a grudge an' a head for powder, that's all we know. Rustlocke went tae find out more, an' he hasnae come back." },
      },
      choices = {
        { text = "What happens if the rest of the Span falls?", next = "span_fall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    span_fall = {
      big = true,
      lines = {
        { id = "sf_default", text = "Then Khaz Modan's cut off from the north, an' every caravan for Arathi an' Lordaeron goes by sea or no' at all. The Dark Irons know it too, so they're still squattin' on it." },
      },
      choices = {
        { text = "Then the Dark Irons must be crushed, every one.", next = "BACK", reply = "Aye, an' I'd swing the hammer maself if I had the dwarves for it. But crushin' takes an army, an' all Longbraid's got is the few o' us left standin' here.", fx = { align = { order = -1 } } },
        { text = "Guard the bridge first. Vengeance can wait.", next = "BACK", reply = "Spoken like ye've stood a watch or two. The Span's the throat o' Khaz Modan, an' I'll no' leave it open just tae feel better about the dead.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rustlocke = {
      lines = {
        { id = "ru_default", text = "Ebenezer Rustlocke, though no one called him anythin' but Ol' Rustlocke. Longbraid sent him tae scout the eastern bridge, for he had the best eyes o' any o' us, an' he's no' come back." },
        { id = "ru_dead", when = { any = { { questReady = TODO_QUEST("The Thandol Span") }, { questDone = TODO_QUEST("Plea To The Alliance") } } },
          text = "He walked straight intae a Dark Iron ambush, an' he died wi' the enemy's orders in his fist. That's Rustlocke for ye, stubborn tae the very end." },
      },
      choices = {
        { text = "I'm sorry for your loss.", next = "rustlocke_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rustlocke_more = {
      big = true,
      lines = {
        { id = "rm_default", text = "Kind o' ye. If he's fallen, we cannae spare the dwarves tae bring him home, an' that sits worse wi' me than the dyin'." },
      },
      choices = {
        { text = "A soldier's body matters less than the bridge.", next = "BACK", reply = "Ye're right, an' that's the worst o' it. Rustlocke would've said the same, the stubborn fool, an' it doesnae make it any easier tae hear.", fx = { align = { light = -1 } } },
        { text = "When the bridge is safe, bring him home.", next = "BACK", reply = "That's a promise I made him over his own cairn o' stones, an' I'll keep it. Thank ye for sayin' it, for there's few here who'll speak his name.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Rhag.", next = "BACK" },
      },
    },

    longbraid = {
      lines = {
        { id = "lb_default", text = "Longbraid the Grim, an' he's earned the name twice over this year. He says we'll take revenge on the Dark Irons before all's said an' done, an' I believe him, for he's never said a thing he didnae mean." },
      },
      choices = {
        { text = "He can't hold Dun Modr for long.", next = "longbraid_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    longbraid_hold = {
      lines = {
        { id = "lh_default", text = "The edge of it, aye, for a while yet. The fortress itself is lost tae the Dark Irons, an' Motley Garmason up by the Span would tell ye it was lost the day the bridge went." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    help = {
      lines = {
        { id = "he_default", text = "Ironforge's sendin' reserves, they say, an' we believe them because we must. One o' the lads knew o' an Alliance camp north at Refuge Pointe, so we've asked there as well." },
      },
      choices = {
        { text = "What did Refuge Pointe say?", next = "help_nials", when = { questDone = TODO_QUEST("Plea To The Alliance") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    help_nials = {
      lines = {
        { id = "hn_default", text = "That Stromgarde's fallen, an' they'll no' leave the Highlands till its banner flies again. I understand him, for I'd say the same o' Dun Modr, but it doesnae put a single axe on our wall." },
      },
      choices = {
        { text = "Is Stromgarde worth Nials's stubbornness?", next = "opn_stromgarde" },
        { text = "Something else, Rhag.", next = "BACK", fx = { learn = { "thandol_span" } } },
      },
    },

    king_word = {
      big = true,
      lines = { { id = "kw_default", text = "Ye've stood before the King himself? Then tell me straight what he said, an' I'll decide what the lads get tae hear." } },
      choices = {
        { text = "He reads every letter. Ironforge hasn't forgotten you, so hold.", next = "king_hope",
          fx = { thread = { id = "dwarves_and_dark_iron", state = "resolved" }, affinity = 3, align = { light = 1 } },
          journal = { first = "Told Rhag Garmason that King Magni reads every letter from Dun Modr. He went straight to the wall to tell his dwarves.",
                      third = "{name} told Rhag Garmason that Ironforge hadn't forgotten Dun Modr, and he went to tell his dwarves." } },
        { text = "Stop waiting on Ironforge, Rhag. Dun Modr is on its own.", next = "king_alone",
          fx = { thread = { id = "dwarves_and_dark_iron", state = "soured" }, affinity = -2, align = { light = -1 }, trait = { stern = 1 } },
          journal = { first = "Told Rhag Garmason to stop waiting on Ironforge. He nodded as if he'd known it all along, and looked older for it.",
                      third = "{name} told Rhag Garmason to stop waiting on Ironforge, and he took it without a word." } },
      },
    },
    king_hope = {
      lines = { { id = "kh_default", text = "He reads them, does he? Then the lads will hear it from me tonight, word for word, an' I'll make ye no promises about my voice holdin' steady while I say it." } },
      choices = { { text = "Hold fast, Rhag.", next = "END" } },
    },
    king_alone = {
      lines = { { id = "ka_default", text = "Aye, well. I think I knew it, an' I think the lads know it too, so I'll no' insult them by sayin' it out loud. Off ye go, friend, an' keep yer head down on the road." } },
      choices = { { text = "...", next = "END" } },
    },

    dwarf = {
      lines = {
        { id = "dw_default", text = "Built by dwarven hands long before I was born, an' never once closed till now. My grandfather crossed it tae trade in Stromgarde an' I crossed it tae fight the orcs, an' now I cannae cross it at all." },
      },
      choices = {
        { text = "We'll rebuild it, Rhag.", next = "BACK", fx = { affinity = 2, standing = { menethil = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've stood on this wall long enough tae hear everythin' worth knowin' between here an' the Span. Ask." } },
    background = { { id = "tp_bg", text = "I'm a soldier o' Ironforge under Longbraid, an' I've been one since I was old enough tae lift a shield." } },
    advice = { { id = "tp_ad", text = "Keep off the skyline near Dun Modr, for the Dark Irons have good archers an' little else tae do." } },
    thandol_span = { { id = "tp_span", text = "Broken on the near side an' hangin' by a thread on the far. I pray it holds.", next = "span" } },
    dark_iron = { { id = "tp_di", text = "They took Dun Modr an' broke the Span, an' they'll want more. They always do." } },
    dragonmaw = { { id = "tp_dm", text = "Orcs on the hills tae the east, wi' red dragons over Grim Batol. As if we hadnae enough trouble." } },
    _none = { { id = "tp_none", text = "Cannae say, friend. Out here we hear about the Dark Irons an' little else." } },
    grim_batol = { { id = "tp_grim_batol", text = "Grim Batol's east o' here over the hills, an' no dwarf wi' sense goes near it. It was the Wildhammer's hold once, the Dark Irons cursed it, an' then the orcs filled it wi' dragons, so that's three good reasons." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer were Ironforge's kin before the War o' the Three Hammers, an' they're kin still, if ye squint. They fly over the Span now an' then, an' I'll admit it's a fine sight." } },
    magni = { { id = "tp_magni", text = "King Magni sent us tae hold Dun Modr's edge, an' we'll hold it till he says otherwise. He's a king who remembers his soldiers' names, an' a soldier will stand a long while for a king like that." } },
    stromgarde = { { id = "tp_stromgarde", text = "Stromgarde's men held the north end o' the Span once, an' now Stromgarde itself is half ogres an' half ruins. They were good allies, an' I'd like them back." } },
    scourge = { { id = "tp_scourge", text = "There are dead men walkin' in Lordaeron, I hear, an' the Span's the only dry road south for them. That's another reason we cannae let it fall." } },
  },
}

---------------------------------------------------------------------------
-- Captive Fire Elemental: bound by the Dark Iron dwarves at Dun Modr; the player leads it out
-- during "Spark of Freedom" (Roggo Harlbarrow, missed2.lua). It speaks only in crackle and heat,
-- so its lines are narration in asterisks.
---------------------------------------------------------------------------
P:NPC {
  key = "wl_captive_fire_elemental", id = TODO_NPC("Captive Fire Elemental"), name = "Captive Fire Elemental",
  role = "citizen", tier = "quest", temper = { "fierce" }, values = { "freedom" },
  impression = {
    first = "A fire elemental the Dark Irons have chained at Dun Modr, guttering low in its bonds.",
    third = "{name} met a captive fire elemental, chained by the Dark Iron dwarves at Dun Modr.",
  },
  greetings = {
    { id = "g_default", text = "*The chained fire elemental gutters low and blue at your approach, then flares up red, as if it cannot decide whether you are another jailer.*" },
    { id = "g_quest", when = { questActive = TODO_QUEST("Spark of Freedom") }, text = "*The elemental leans toward you against its chains, and the heat of it presses on your face like an open forge.*" },
    { id = "g_done", when = { questDone = TODO_QUEST("Spark of Freedom") }, text = "*Only a scorched ring on the stones remains where the fire elemental was chained, still warm to the touch.*" },
  },
  start = "hello",
  nodes = {
    w8_rune = {
      lines = { { id = "w8_rune_a", text = "*The chains are etched with Dark Iron runes, and where your eyes follow them the elemental's fire shrinks away, as though the marks themselves are cold against it.*" } },
      choices = {
        { text = "Touch one of the runes.", next = "w8_rune2" },
        { text = "I know these sigils. Dark Iron binding-craft.", next = "w8_rune2", when = { class = "MAGE" } },
        { text = "Step back from the chains.", next = "BACK" },
      },
    },
    w8_rune2 = {
      lines = {
        { id = "w8_rune2_a", text = "*The iron is bitterly cold under your fingers despite the blaze beside it. The elemental flares, and for a moment the rune dulls, as if your touch has loosened something.*" },
        { id = "w8_rune2_mage", when = { class = "MAGE" }, text = "*Your eyes trace the binding script, and the elemental watches you do it, its flames held very still. Where you read, the runes dim a little, and the fire leans hungrily toward the weakness you have found.*" },
      },
      choices = {
        { text = "Soon you'll be free.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", text = "*The fire within it roars and hisses in a voice like a bellows, with no words in it, only want.*" },
      },
      again = { { id = "a_again", text = "*The elemental crackles impatiently in its bonds.*" } },
      choices = {
        { text = "The Dark Irons won't hold you much longer.", next = "BACK", reply = "*Its flames leap high and white, and the chains glow cherry-red where they bind it.*" },
        { text = "Who chained you here?", next = "xwho" },
        { text = "Do you understand me?", next = "xunderstand" },
        { text = "What will you do when you're free?", next = "xfree" },
        { text = "I'm a shaman. I hear the fire in you.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I'm a mage. Your fire is pure and wild.", next = "xmage", when = { class = "MAGE" } },
        { text = "Were you a forge fire before this?", next = "yforge" },
        { text = "Do you remember the Firelands?", next = "yhome" },
        { text = "Look at the runes carved into its chains.", next = "w8_rune" },
        { text = "Stay close and follow me. We're leaving.", next = "END", reply = "*The elemental drifts after you, scorching the grass with every step it takes toward the marsh.*" },
      },
    },
    xwho = {
      narr = "The elemental twists toward the ruins of Dun Modr, and its flames flare a sullen red.",
      lines = { { id = "xwh_default", text = "*It crackles low, and the chains rattle as it strains in the direction of the Dark Iron camp, scattering sparks across the stones.*" } },
      choices = {
        { text = "The Dark Irons, then. They bind fire for their forges.", next = "xbind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbind = {
      lines = { { id = "xbi_default", text = "*The flames gutter blue and thin, as if the very word chains has drawn the heat out of it, and then roar back angrier than before.*" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xunderstand = {
      lines = { { id = "xun_default", text = "*The elemental stills, and for a moment its fire burns steady and bright, like a lamp held up for you to see by.*" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfree = {
      lines = { { id = "xfr_default", text = "*Its flames climb high and white, and the grass at its feet blackens and curls in a wide ring that it does not seem to notice.*" } },
      choices = {
        { text = "Burn the Dark Irons' camp to the ground.", next = "BACK", reply = "*The fire leaps with a sound like a forge-bellows laughing.*", fx = { align = { light = -1 } } },
        { text = "Go home. Leave the marsh unscorched.", next = "BACK", reply = "*The flames settle, dimmer, and the elemental bows low against its chains.*", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = { { id = "xsh_default", text = "*The elemental turns its whole burning face toward you, and the heat softens to the warmth of a hearth, as if it has found a voice it knows.*" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmage = {
      lines = { { id = "xma_default", text = "*The flames recoil from you, wary and hissing, and the elemental draws back as far as its chains allow.*" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  
    yforge = {
      lines = {
        { id = "ycaptiv_yforge_d", text = "*The elemental's flames bend low and red, the colour of banked coals, and for a moment it looks almost like the fire under a smith's bellows.*" },
        { id = "ycaptiv_yforge_v0", when = { class = "SHAMAN" }, text = "*Its fire flickers into a dull, hammered rhythm, steady as a forge beat, and you feel in it a weariness older than the chains.*" },
      },
      choices = {
        { text = "They've made you work their forges.", next = "ywork" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywork = {
      lines = {
        { id = "ycaptiv_ywork_d", text = "*The fire gutters, then flares in a long hiss that sounds almost like a sigh. The iron links glow orange where its heat presses against them.*" },
      },
      choices = {
        { text = "I'll free you. No fire should be chained.", next = "BACK", reply = "*The flames brighten and lean toward you, warm as a hand held out.*", fx = { align = { light = 1 } } },
        { text = "Your fire is a weapon. Better it serve Ironforge than Thaurissan.", next = "BACK", reply = "*The elemental recoils, hissing, and sparks scatter angrily across the stones at your feet.*", fx = { align = { light = -1 } } },
      },
    },
    yhome = {
      lines = {
        { id = "ycaptiv_yhome_d", text = "*For an instant the elemental's heart burns white, and the air around it ripples with a heat that does not belong to the marsh. Then it dims, and the chains rattle.*" },
        { id = "ycaptiv_yhome_v0", when = { class = "MAGE" }, text = "*Its core flares white, and you sense in it a homesickness for a place of pure fire, far from any mortal land. Then the chains rattle, and the heat dims.*" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dark_iron = { { id = "ycaptiv_tp_dark_iron", text = "*At the name, the flames roar up angrily and the chains clatter against the stones.*" } },
    fire = { { id = "ycaptiv_tp_fire", text = "*The elemental pulses brighter, as though the word were an old song it recognised.*" } },
  },
}
