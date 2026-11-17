-- Rhag Garmason: Longbraid's man at Dun Modr, counting the dead of the Thandol Span. Voice: bibles/dunmodr.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "wl_rhag", id = TODO_NPC("Rhag Garmason"), name = "Rhag Garmason",
  bible = "bibles/dunmodr.md", role = "soldier", tier = "quest",
  communities = { "menethil" }, temper = { "steady", "earnest" }, values = { "loyal", "dutiful", "kind" },
  notices = { "soldier", "kit" },

  impression = {
    first = "Rhag Garmason holds the edge of Dun Modr with Longbraid's few dwarves and speaks of the Thandol Span as if the explosion still rings in his ears. He hopes for reinforcements more than he expects them.",
    third = "{name} met Rhag Garmason, one of Longbraid's dwarves clinging to the edge of fallen Dun Modr.",
  },

  greetings = {
    { id = "g_default", text = "Keep yer head down, friend, for the Dark Irons have archers on the walls. What brings ye tae Dun Modr?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' in one piece. That's more than most manage on this road." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' Dun Modr's still standin', just about. Any word o' reinforcements on yer travels?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown fierce since I sent ye out tae look for Rustlocke. Longbraid could use a hundred like ye." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Menethil's talkin' about ye, an' even out here we hear it. Good deeds travel faster than reinforcements, it seems." },
    { id = "g_span", when = { questActive = TODO_QUEST("The Thandol Span") }, text = "The Span business is still open, then. Whatever ye find out there, bring it straight back tae me." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, faction = "Alliance" },
      text = "A soldier, by the look o' ye! Forgive me for starin', but I've been waitin' tae see one come up that road for weeks." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye've met the Dark Irons, I see, for they leave that sort o' mark. There's no smith out here, so mind how ye go." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rhag Garmason, one o' Longbraid's. A tremendous explosion roared through these hills when the Dark Irons hit the Thandol Span, an' good soldiers died defendin' it, so now we hold what's left o' Dun Modr an' wait." },
        { id = "h_found", tags = { "news" }, when = { questReady = TODO_QUEST("The Thandol Span") },
          text = "Ye've found somethin', I can see it on yer face. Tell me straight, for I've had enough o' waitin'." },
        { id = "h_plea_back", tags = { "news" }, when = { questRecent = { TODO_QUEST("Plea To The Alliance"), days = 5 } },
          text = "Ye're back from Refuge Pointe, then. Whatever Nials said, I can see from yer face it wasnae the answer we wanted." },
        { id = "h_plea", when = { questActive = TODO_QUEST("Plea To The Alliance") },
          text = "Refuge Pointe, north in the Highlands, an' ask for Captain Nials. Tell him Longbraid would take any soldiers he can spare, an' tell him we said please." },
        { id = "h_span_done", when = { questDone = TODO_QUEST("Plea To The Alliance") },
          text = "Nials has his own fallen city tae weep over, an' I cannae blame him for it. So it's us an' the reserves o' Ironforge, whenever they come." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf o' Khaz Modan! Ye'll understand what it means tae see the Span broken, for that bridge was older than my grandfather's grandfather." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin. Say a word for the lads we lost on the Span, if ye would; they died wi' their faces tae the enemy." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, this far south? Ye've no business wi' us, an' we've none wi' ye, so pass by quiet an' I'll do the same." },
      },
      again = {
        { id = "h_again", text = "What else? The archers are quiet for now." },
        { id = "h_again2", text = "Ask what ye like, friend, for there's little else tae do but wait." },
      },
      choices = {
        { text = "What happened at the Thandol Span?", next = "span" },
        { text = "Who was Ol' Rustlocke?", next = "rustlocke" },
        { text = "Tell me about Longbraid.", next = "longbraid" },
        { text = "Why hasn't Ironforge sent help?", next = "help" },
        { text = "How long has the Span stood?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Hold fast, Rhag.", next = "END" },
      },
    },

    span = {
      lines = {
        { id = "sp_default", text = "The Dark Irons packed the bridge wi' powder an' blew the near span intae the gorge. 'Twas horrible, I tell ye, for half o' the guard was standin' on it when it went." },
      },
      choices = {
        { text = "Who planned it?", next = "span_who" },
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
        { id = "sf_default", text = "Then Khaz Modan's cut off from the north, an' every caravan for Arathi an' Lordaeron goes by sea or no' at all. The Dark Irons know it, too, which is why they're still out there." },
      },
      choices = {
        { text = "Then the Dark Irons must be crushed, every one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Guard the bridge first. Vengeance can wait.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rustlocke = {
      lines = {
        { id = "ru_default", text = "Ebenezer Rustlocke, though no one called him anythin' but Ol' Rustlocke. Longbraid sent him tae scout the eastern bridge, for he had the best eyes o' any o' us an' the oldest knees." },
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
        { id = "rm_default", text = "Kind o' ye. We cannae spare the dwarves tae bring him home, so he lies where he fell for now, an' that sits worse wi' me than the dyin'." },
      },
      choices = {
        { text = "A soldier's body matters less than the bridge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "When the bridge is safe, bring him home.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Rhag.", next = "BACK" },
      },
    },

    longbraid = {
      lines = {
        { id = "lb_default", text = "Longbraid the Grim, an' he's earned the name twice over this year. He says we'll take revenge on the Dark Irons before all's said an' done, an' I believe him, for he's never said a thing he didnae mean." },
      },
      choices = {
        { text = "Can he hold Dun Modr?", next = "longbraid_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    longbraid_hold = {
      lines = {
        { id = "lh_default", text = "The edge of it, aye, for a while yet. The fortress itself is lost tae the Dark Irons, an' Motley up by the Span would tell ye it was lost the day the bridge went." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    help = {
      lines = {
        { id = "he_default", text = "Ironforge's sendin' reserves, they say, an' we believe them because we must. Roggo knew o' an Alliance camp north at Refuge Pointe, so we've asked there as well." },
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
      choices = { { text = "Something else, Rhag.", next = "BACK", fx = { learn = { "thandol_span" } } } },
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
  },
}
