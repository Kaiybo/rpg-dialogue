-- Stonard: the Horde's fortress in the Swamp of Sorrows. Voice: bibles/swampofsorrows.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ruag", id = TODO_NPC("Dispatch Commander Ruag"), name = "Dispatch Commander Ruag",
  bible = "bibles/swampofsorrows.md", role = "soldier", tier = "major",
  communities = { "stonard" }, temper = { "methodical" }, values = { "dutiful", "practical" },
  notices = { "kit", "class" },

  impression = {
    first = "Dispatch Commander Ruag sends scouts into the swamp and counts what comes back. He keeps the old business at Thrall's Grasp close, and plainly wishes he could forget it.",
    third = "{name} met Dispatch Commander Ruag, who directs the Horde's scouts from Stonard in the Swamp of Sorrows.",
  },

  greetings = {
    { id = "g_hall", text = "Another pair of boots, good. I send them out, and the swamp sends back what's left of the maps." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and dry-ish, so report." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Mud to the knees and armor in pieces, so you've been doing real work. Get mended." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! I need eyes that read tracks in mud, and my scouts would be glad of the company." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Dispatch Commander Ruag. Stonard is the Horde's eyes in these lands; from here we scout what nobody has charted, and we send word back faster than anyone else can." },
        { id = "h_aggrogosh", when = { heardLine = "aggrogosh.h_default" },
          text = "You've come from Grom'gol? Aggro'gosh pushes his caravans through jungle and over mountains to reach us. Every one that arrives, I count too." },
        { id = "h_disgraced", tags = { "news" }, when = { questActive = TODO_QUEST("The Disgraced One") },
          text = "You've come asking about Thrall's Grasp; I can see it in your face. That story is still fresh to me, and I'd hoped it would have the decency to fade." },
        { id = "h_orders", when = { questActive = TODO_QUEST("The Missing Orders") },
          text = "I relayed those orders, whatever anyone out on that road is implying. Find Bengor if you want the rest of it, and mind where you stick your nose." },
        { id = "h_talker_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Swamp Talker"), days = 3 } },
          text = "So the orders turned up in a murloc's cave, where they'd been all along. I'll not pretend that's comfort, but at least nobody can say Stonard didn't send them." },
      },
      again = {
        { id = "h_again", text = "Next item. Keep it short; I've dispatches waiting." },
        { id = "h_again2", text = "Go on, I'm writing as you talk." },
      },
      choices = {
        { text = "Why scout a swamp?", next = "scout" },
        { text = "Tell me about Stonard.", next = "stonard" },
        { text = "What happened to Thrall's Grasp?", next = "grasp" },
        { text = "Who should I know in Stonard?", next = "people" },
        { text = "Aggro'gosh says his caravans keep getting through.", next = "caravans", when = { heardLine = "aggrogosh.h_default" } },
        { text = "I found the missing orders.", next = "orders_found", when = { questDone = TODO_QUEST("The Swamp Talker") } },
        { text = "An orc built this place? Tell me.", next = "old_horde", when = { race = "Orc" } },
        { text = "I'm a hunter. Send me where the maps go blank.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Trolls built that temple, Commander. Not my kind of troll.", next = "k_troll", when = { race = "Troll" } },
        { text = "This swamp suits my kind, Commander.", next = "k_scourge", when = { race = "Scourge" } },
        { text = "Send me out.", next = "END", fx = { affinity = 1, standing = { stonard = 1 } } },
      },
    },

    scout = {
      big = true,
      lines = {
        { id = "s_default", text = "Because the Dark Portal isn't far, and neither are the ogres or the old temple. A Horde that knows the ground wins fights before they start." },
      },
      choices = {
        { text = "How much of it is mapped?", next = "scout_maps" },
        { text = "What's beyond the swamp?", next = "scout_portal" },
        { text = "Makes sense.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
    scout_maps = {
      lines = {
        { id = "sm_default", text = "Less than I'd like. My wayfinders and cartographers go out with fresh parchment, and they come back with half of it soaked and the other half covered in crocolisk teeth." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    scout_portal = {
      lines = {
        { id = "sp_default", text = "The Blasted Lands, and the Dark Portal standing dead in the middle of them, and whatever still crawls around it. I sent a regiment down there once, and I don't send anyone lightly now." },
      },
      choices = {
        { text = "Which regiment?", next = "grasp" },
        { text = "Something else.", next = "BACK" },
      },
    },

    stonard = {
      lines = {
        { id = "st_default", text = "The old Horde raised it in the Black Morass after the Dark Portal first opened, which makes it one of the oldest orc towns in Azeroth. It fell with the old Horde, and the new Horde built it back up, great hall and all." },
      },
      choices = {
        { text = "Was it always alone out here?", next = "stonard_rockard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stonard_rockard = {
      lines = {
        { id = "sr_default", text = "No, it had a sister fortress, Rockard, to the south, built in the same days. The Dreadmaul ogres sit in it now and call it their own hold, and I'd like it back one day, though not this week." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    grasp = {
      big = true,
      lines = {
        { id = "g_default", text = "Thrall's Grasp was a regiment sent toward the Blasted Lands, and something there destroyed it. The Horde lost some of its best soldiers in that battalion, and I signed the papers that sent them." },
      },
      choices = {
        { text = "Did they ever get their orders?", next = "grasp_orders" },
        { text = "That isn't your fault.", next = "grasp_fault", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grasp_orders = {
      lines = {
        { id = "go_default", text = "What are you implying? I relayed those orders, and the soldiers who carried them were ambushed by murlocs on the road south. Only one of them lived, if you can call it living, and his name is Bengor." },
      },
      choices = {
        { text = "I'm only asking.", next = "BACK" },
        { text = "Where can I find Bengor?", next = "people" },
      },
    },
    grasp_fault = {
      lines = {
        { id = "gf_default", text = "Maybe not, but it's my desk the papers crossed. A dispatch commander who stops feeling that should hand over his seal." },
      },
      choices = {
        { text = "What keeps you at that desk at night, Commander?", tag = "Persuade", next = "grasp_night",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("The Swamp Talker") }, { trait = "kind" } } } },
          fail = { next = "grasp_dispatch", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    people = {
      lines = {
        { id = "p_default", text = "Fel'zerul watches the sunken temple for the Warchief, Helgrum carries word to Kargath and back, and Bengor is in the hall, though he doesn't say much anymore. Karakul keeps the inn and the scouts fed." },
      },
      choices = {
        { text = "What happened to Bengor?", next = "people_bengor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    people_bengor = {
      lines = {
        { id = "pb_default", text = "A murloc spear went into his skull, and he can hardly speak or walk, and the healers feed him through a tube. He's the only witness to what happened to those orders, so speak to him gently." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },

    caravans = {
      lines = {
        { id = "c_default", text = "They do, and I count every one twice, once when it's promised and once when it's unloaded. Grom'gol keeps us fed, and we keep the Horde informed, and neither of us gets thanked for it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { standing = { stonard = 1 } } } },
    },
    orders_found = {
      lines = {
        { id = "of_default", text = "Then they lay in the mud the whole time, while nineteen soldiers waited for words that never came. I'm glad my seal is clean, and I wish that made me feel better than it does." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { stonard = 2 } } } },
    },
    old_horde = {
      lines = {
        { id = "oh_default", text = "Our fathers built it when they first came through the Portal, for war and nothing else. We use it to send maps and caravans now, which is the best answer I know to what they made it for." },
      },
      choices = {
        { text = "That's a good answer.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Stonard was built for war, and it should stay ready for one.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grasp_night = {
      big = true,
      lines = {
        { id = "gn_default", text = "Not the gossip on the road, if that's what you're thinking. I've read those orders over a hundred times in my head, and I still can't tell you whether they'd have saved the regiment if they'd arrived, and that's the question no clean seal answers." },
      },
      choices = {
        { text = "Nobody could answer that, Commander.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then make sure the next orders arrive.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grasp_dispatch = {
      lines = {
        { id = "gd_default", text = "Dispatches keep me at my desk, and that's all that goes in the log. Next item." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Good, because that's most of my map. East past the Fallow Sanctuary nobody's charted the ground since the old Horde marched out of here, and my scouts keep coming back with fewer boots than they left with." },
        { id = "xhu_plains", when = { origin = "tauren_plains_runner" },
          text = "A plains runner, out of Mulgore. You'll hate the mud, and you'll be faster in it than any orc I've got, so go east past the Fallow Sanctuary and tell me what's there." },
        { id = "xhu_head", when = { origin = "troll_headhunter" },
          text = "A Darkspear headhunter. The Atal'ai have heads you might want, but I want maps first, so go east past the Fallow Sanctuary and come back with both." },
      },
      choices = {
        { text = "I'll map it and come back.", next = "BACK", fx = { align = { order = 1 }, affinity = 2, standing = { stonard = 1 } } },
        { text = "I'll go where the hunting takes me, Commander.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why scout a swamp at all?", next = "scout" },
      },
    },
    k_troll = {
      big = true,
      lines = {
        { id = "xtr_default", text = "I know that, and so does every orc in Stonard, though some of the grunts need reminding when the Atal'ai come out of the water. Tell me straight, Darkspear: do you feel anything when you look at that temple?" },
        { id = "xtr_echo", when = { origin = "troll_echo_isles" },
          text = "I know that, and I know your people were driven off the Echo Isles by worse than the Atal'ai. Tell me straight: do you feel anything when you look at that temple?" },
      },
      choices = {
        { text = "Only shame. They'd sell us all to Hakkar.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "I feel their power. I won't lie about it.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Who were the Atal'ai, to your people?", next = "k_troll_who" },
      },
    },
    k_troll_who = {
      lines = {
        { id = "xtw_default", text = "Ask Fel'zerul, he's read more of it than I'd care to. All I know is the Gurubashi threw them out for being too bloody, and when a troll empire calls you too bloody, you've earned the title." },
      },
      choices = { { text = "Something else, Commander.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_scourge = {
      lines = {
        { id = "xsc_default", text = "So I hear from the Forsaken who come through, and I'll admit it's useful having scouts who don't mind the leeches. Don't take the boats out alone, though; the crocolisks don't care what you're made of." },
        { id = "xsc_soldier", when = { origin = "forsaken_lordaeron_soldier" },
          text = "A soldier, once, by how you stand. Lordaeron's swamps were nothing like this, I'm told, but a scout's a scout, and the crocolisks don't care what you're made of." },
      },
      choices = {
        { text = "The swamp and I will get along fine.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Use me where the living can't go, Commander.", next = "BACK", fx = { affinity = 2, standing = { stonard = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every report in Stonard crosses my desk, so I know a little about most things in this swamp. Ask me about any of these, and keep it short." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "You'll get what's in the public log and nothing more, so choose one and be brief." },
    },
    background = { { id = "tp_ba", text = "I command dispatches, which means I read every report and sign every order in Stonard. My story is in those papers, and it's dull until something goes wrong.", next = "grasp" } },
    advice = { { id = "tp_ad", text = "Carry your orders against your skin, never in a pack. Packs get lost in the swamp, and so do the people carrying them." } },
    _none = { { id = "tp_none", text = "That's not charted yet, so do you want the job?" } },
  },
}

P:NPC {
  key = "felzerul", id = TODO_NPC("Fel'zerul"), name = "Fel'zerul",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "stonard" }, temper = { "grim" }, values = { "loyal", "sharp" },
  notices = { "class" },

  impression = {
    first = "Fel'zerul watches the sunken temple the way some people watch a sleeping beast. Whatever stirs beneath the Pool of Tears, he has felt it, and he doesn't like it.",
    third = "{name} met Fel'zerul, sent by the Warchief to watch the Temple of Atal'Hakkar from Stonard.",
  },

  greetings = {
    { id = "g_temple", text = "You feel it too? The swamp hums near the Pool of Tears, because something old is awake down there." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock, then, so you'll know the difference between power you hold and power that holds you. The trolls in that temple forgot it." },
    { id = "n_troll", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You hear the spirits, so you know that down by the temple they aren't speaking, they're screaming." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Fel'zerul, and the Warchief sent me to watch the Temple of Atal'Hakkar. The trolls who built it worshipped something terrible, and something there is stirring." },
        { id = "h_pool", tags = { "news" }, when = { questActive = TODO_QUEST("Pool of Tears") },
          text = "The Pool of Tears hides what's left of the temple's outer works. Bring me what the old priests left behind." },
        { id = "h_exile", when = { any = { { questActive = TODO_QUEST("The Atal'ai Exile") }, { questActive = TODO_QUEST("Return to Fel'Zerul") } } },
          text = "One of the Atal'ai was cast out by his own, and an exile knows what the faithful won't say, so find him." },
        { id = "h_temple", when = { questActive = TODO_QUEST("The Temple of Atal'Hakkar") },
          text = "Into the temple, then, and bring enough friends, and then bring more than that." },
        { id = "h_fetishes", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Temple of Atal'Hakkar"), days = 3 } },
          text = "Twenty fetishes, and every one of them hums like a hornet in a jar. They'll go to Orgrimmar under guard, and I'll sleep better once they're gone." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly; the temple doesn't wait." },
        { id = "h_again2", text = "Ask, then, but don't ask me to go down there again tonight." },
      },
      choices = {
        { text = "What's stirring?", next = "stirring" },
        { text = "Who were the Atal'ai?", next = "atalai" },
        { text = "Why did the Warchief send a warlock?", next = "warlock" },
        { text = "The exile spoke of a prophecy.", next = "prophecy", when = { any = { { questActive = TODO_QUEST("Return to Fel'Zerul") }, { questDone = TODO_QUEST("Return to Fel'Zerul") } } } },
        { text = "How do you keep your demons leashed?", next = "kin", when = { class = "WARLOCK" } },
        { text = "I'm a troll warlock. Am I the Atal'ai's heir?", next = "troll_warlock", when = { race = "Troll", class = "WARLOCK" } },
        { text = "The spirits told me what warlocks did to our people.", next = "k_shaman", when = { race = "Orc", class = "SHAMAN" } },
        { text = "I'll go.", next = "END", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },

    stirring = {
      big = true,
      lines = {
        { id = "st_default", text = "We came to look into strange happenings at the temple and found it already sunk beneath the swamp. Whatever magic the Atal'ai worked down there went horribly wrong, and it hasn't finished going wrong yet." },
      },
      choices = {
        { text = "Who's guarding it now?", next = "stirring_dragons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stirring_dragons = {
      lines = {
        { id = "sd_default", text = "Green dragons, who say they're the protectors of Azeroth and won't let anyone near. Perhaps they are, but I've never met a guard who told me the whole truth about what he was guarding." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    atalai = {
      lines = {
        { id = "a_default", text = "A tribe of troll priests and dark casters, known for forbidden magic even among their own kind. They built that temple to serve a god, and from the look of it the god served them back badly." },
      },
      choices = {
        { text = "Why study their magic at all?", next = "atalai_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    atalai_use = {
      lines = {
        { id = "au_default", text = "Because powerful spells don't vanish because you look away from them, and the Horde needs to understand them before someone uses them on us. I'd rather a spell be in Orgrimmar's books than in an enemy's hand." },
      },
      choices = {
        { text = "That's how warlocks always start.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Fair. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    warlock = {
      lines = {
        { id = "w_default", text = "Because I know dark magic when I see it, and I know where it leads. I walked the same road as the Burning Blade, and I stopped where the Warchief told us to stop, and they didn't." },
      },
      choices = {
        { text = "What made you stop?", next = "warlock_stop" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    warlock_stop = {
      lines = {
        { id = "ws_default", text = "Thrall freed us from the camps and from the demons both, and I'd not hand myself back to either. A warlock who serves the Horde has to be stronger than his own hunger, every single day." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "burning_blade" } } } },
    },

    prophecy = {
      lines = {
        { id = "pr_default", text = "Jammal'an the Prophet teaches that if Hakkar returns from the Nether, the god will grant the Atal'ai immortality. It's foolish trickery to bring on the end of the world early, if you ask me, and the exile knew it." },
      },
      choices = {
        { text = "And the fetishes?", next = "prophecy_fetish" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prophecy_fetish = {
      lines = {
        { id = "pf_default", text = "If they're the key to the ritual that sank that temple, they must be taken and understood before Jammal'an finds a use for them. That's what the Horde needs from you down there." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    kin = {
      lines = {
        { id = "k_default", text = "Short and visible, and I never let one out of my sight while I sleep. More than that, every warlock learns alone, because a teacher who tells you he has it mastered is already lost." },
      },
      choices = { { text = "I'll remember.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    troll_warlock = {
      lines = {
        { id = "tw_default", text = "No, unless you choose to be. The Atal'ai reached for a god and called it faith; you reach for demons and call it a tool, and you'd better be right about which of you is holding the leash." },
      },
      choices = {
        { text = "I'm right.", next = "BACK", fx = { align = { order = -1 }, trait = { proud = 1 } } },
        { text = "I'll watch myself.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    k_shaman = {
      big = true,
      lines = {
        { id = "xsh_default", text = "And they would know, I suppose, having been the first to leave us when the fel came. I don't ask your forgiveness, shaman; I ask you to look at that temple and tell me whether you'd rather I watched it, or nobody did." },
        { id = "xsh_thrall", when = { origin = "orc_thrall_shaman" },
          text = "Thrall's own circle taught you, so you'll have heard all the old sins listed. I don't ask your forgiveness; I ask whether you'd rather I watched that temple, or nobody did." },
      },
      choices = {
        { text = "Watch it, then. The Warchief trusts you.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Nobody should hold that power, not even you.", next = "BACK", fx = { align = { order = -1 }, affinity = -2 } },
        { text = "Why did the Warchief send a warlock?", next = "warlock" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've watched that temple longer than I care to count, and I've learned more than I wanted. Ask me about any of these." },
    },
    burning_blade = { { id = "tp_blade", text = "Fools! I walk the same road they did, and I stopped where the Warchief told us to, but they didn't." } },
    background = { { id = "tp_ba", text = "A warlock in the Warchief's service, sent to watch a temple. What I was before I served him isn't worth the telling.", next = "warlock" } },
    advice = { { id = "tp_ad", text = "If you go into the temple, count your companions on the way down and on the way back up. The Atal'ai have a way of keeping a few." } },
    _none = { { id = "tp_none", text = "Ask me about the temple instead, because that I know too much about." } },
  },
}

P:NPC {
  key = "helgrum", id = TODO_NPC("Helgrum the Swift"), name = "Helgrum the Swift",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "stonard" }, temper = { "restless" }, values = { "loyal", "brave" },
  notices = { "kit" },

  impression = {
    first = "Helgrum the Swift can't keep still and admits he's fast rather than clever. He spoke of Neeka Bloodscar with an easy pride that made me like him at once.",
    third = "{name} met Helgrum the Swift, the restless runner who carries word between Stonard and Kargath.",
  },

  greetings = {
    { id = "g_post", text = "Can't stand still in this place, because the mud's always trying to keep you." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Rough road? The roads out of here are all rough, and Neeka would laugh at your boots." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Helgrum the Swift, and they call me that because I'm fast, not because I'm clever. Neeka Bloodscar's the clever one, head scout out at Kargath in the Badlands." },
        { id = "h_neeka", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Neeka Bloodscar") }, { questActive = TODO_QUEST("Report to Helgrum") } } },
          text = "Word between Stonard and Kargath keeps getting cut, so go and see Neeka yourself. She'll have a report for me; she always does." },
        { id = "h_report_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Report to Helgrum"), days = 3 } },
          text = "Neeka's report says the Alliance has troubles of its own up north, and some of their enemies are ours too. Funny, the things you learn when a letter finally arrives." },
        { id = "h_fast", when = { metBefore = true }, text = "I ran to the edge of the swamp and back this morning, before breakfast, and don't ask me why, because I wasn't thinking. I'm the swift one, remember." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, I've got a run at noon." },
      },
      choices = {
        { text = "Why do they call you the Swift?", next = "swift" },
        { text = "Who is Neeka Bloodscar?", next = "neeka" },
        { text = "What's so hard about the road to Kargath?", next = "road" },
        { text = "What did Neeka's report say?", next = "shared", when = { questDone = TODO_QUEST("Report to Helgrum") } },
        { text = "I'm fast too. Race you to the gate?", next = "race", when = { class = { "HUNTER", "SHAMAN", "DRUID" } } },
        { text = "I ran the plains of Mulgore. Swamp's no different.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "I'll look for her.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },

    swift = {
      lines = {
        { id = "sw_default", text = "I carry word between the outposts, and I've never lost a message I was carrying. Other runners can say that too, but not as quickly." },
      },
      choices = {
        { text = "Has anyone lost one?", next = "swift_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swift_lost = {
      lines = {
        { id = "sl_default", text = "Plenty, and in this swamp a lost message usually means a lost runner too. Ask the Dispatch Commander about Thrall's Grasp sometime, if you want to see a grown orc go quiet." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    neeka = {
      lines = {
        { id = "n_default", text = "Head scout of Kargath, and the best tracker I know, though she'd tell you that herself. She's seen more fighting than half the grunts in Stonard put together, and she doesn't let you forget it." },
      },
      choices = {
        { text = "You sound fond of her.", next = "neeka_fond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neeka_fond = {
      lines = {
        { id = "nf_default", text = "Fond? She scowls at my running and I laugh at her scowling, and we both get the work done. Call it what you like, as long as you don't call it that in front of her." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    road = {
      lines = {
        { id = "r_default", text = "The Badlands are harsh, and they lie close to the Alliance's Loch Modan, so outrunners go missing between here and Kargath. The last one Neeka sent never reached me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shared = {
      lines = {
        { id = "sh_default", text = "That the Alliance isn't having an easy time in the north either. It makes you think that an enemy of theirs and an enemy of ours might be the same enemy." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    race = {
      lines = {
        { id = "ra_default", text = "Ha! On four legs or on the wind, I suppose, and that's hardly fair to a poor orc on two. Another time, when I've had my breakfast." },
      },
      choices = { { text = "Another time, then.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
    k_tauren = {
      lines = {
        { id = "xta_default", text = "No different! Wait till your hooves sink to the knee, then tell me it's no different. Tauren run like a stampede on open ground, but in Sorrows you have to step light, and I've never seen a tauren step light." },
        { id = "xta_runner", when = { origin = "tauren_plains_runner" },
          text = "A runner of the plains, are you? Then we'll race on the Kargath road where the ground's hard, because I'm not giving a tauren the start of a race in the mud." },
      },
      choices = {
        { text = "Watch me, then.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll take the road, not the mud.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a runner, and that's the whole of it. Ask Neeka for the interesting stories; she's lived them.", next = "neeka" } },
    advice = { { id = "tp_ad", text = "Run on the road, never through the reeds. The reeds are where the things that eat runners wait." } },
    _none = { { id = "tp_none", text = "Don't know, but ask Neeka when she's back, because she knows things." } },
  },
}

P:NPC {
  key = "bengor", id = TODO_NPC("Bengor"), name = "Bengor",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "stonard" }, temper = { "stoic" }, values = { "proud", "dutiful" },
  notices = { "weary" },

  impression = {
    first = "Bengor can barely walk or talk, and he insists on remembering all the same. He wears what the murlocs did to him with a soldier's stubborn pride.",
    third = "{name} met Bengor, a gravely wounded Horde soldier at Stonard who remembers what became of the lost orders.",
  },

  greetings = {
    { id = "g_cough", text = "Don't look at me like that, it's only the swamp air in my chest, and everyone here coughs." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like I feel, so sit a while with me and we'll be sick together and say nothing about it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bengor, a soldier of the Horde, or what the murlocs left of one. I can't walk and I can hardly talk, but I still remember, and remembering is my duty now." },
        { id = "h_orders", when = { questActive = TODO_QUEST("The Missing Orders") },
          text = "The orders, you want the orders, and the Commander sent you to me because I'm all that's left of the soldiers who carried them. Sit close, so I don't have to shout." },
        { id = "h_talker", tags = { "news" }, when = { questActive = TODO_QUEST("The Swamp Talker") },
          text = "The Swamp Talker, that one took the orders from my hand while a spear went into my head. East, in a cave, if your stomach is stronger than mine was." },
        { id = "h_tired", when = { metBefore = true },
          text = "You came back to sit with a broken old grunt, and few do that. The healers come with their tube and their kind words, and I would rather have your company." },
      },
      again = { { id = "h_again", text = "More? I have breath for a little more, if you speak slowly." } },
      choices = {
        { text = "What happened to you?", next = "ambush" },
        { text = "Are you ill?", next = "ill" },
        { text = "Who was with you on the road?", next = "others" },
        { text = "Let me try to heal you.", next = "heal", when = { class = { "PRIEST", "SHAMAN", "PALADIN", "DRUID" } } },
        { text = "I got the orders back, Bengor.", next = "orders_back", when = { questDone = TODO_QUEST("The Swamp Talker") } },
        { text = "I'm a soldier too, Bengor. Tell me what happened.", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },

    ambush = {
      lines = {
        { id = "a_default", text = "We took the orders from the Dispatch Commander and went south toward the Blasted Lands, and the murlocs came out of the water, many of them, too many. One of them they called the Swamp Talker, and he was the one who took the orders." },
      },
      choices = {
        { text = "Where did he take them?", next = "ambush_cave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambush_cave = {
      lines = {
        { id = "ac_default", text = "East, to a cave, I think, though I was on the ground by then with a spear in my skull. If you go, go with friends, because I went with friends and look at me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ill = {
      lines = { { id = "i_default", text = "Not ill, broken, and they feed me through a tube now like a sick wolf pup. If it's death that's coming for me, it's going to have to try harder." } },
      choices = {
        { text = "Why stay in Stonard?", next = "ill_stay" },
        { text = "Fair enough.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    ill_stay = {
      lines = {
        { id = "is_default", text = "Where else would a broken soldier go? From here I can hear the grunts drill in the morning, and on a good day that is almost the same as being among them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    others = {
      lines = {
        { id = "o_default", text = "Good orcs, every one, and none of them came home but me, and I'd trade places with any of them. Don't ask me their names today, because some days I can't find them in my head." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    heal = {
      lines = {
        { id = "h2_default", text = "Others have tried, with their hands warm on my head, and I thank them every time. It eases the ache for an hour, and an hour is a gift, so go on and try." },
      },
      choices = {
        { text = "[Lay hands on him a while]", next = "BACK", fx = { affinity = 3, align = { light = 1 } } },
        { text = "An hour won't change anything, so I'll save my strength.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    orders_back = {
      lines = {
        { id = "ob_default", text = "Then they reached him at last, the one who waited for them, though too late to save his soldiers. I can rest a little easier knowing the words didn't stay in the mud." },
      },
      choices = { { text = "Rest, Bengor.", next = "BACK", fx = { affinity = 3 } } },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Then you'll understand. We lost the road, and then we lost the light, and then the murlocs came out of the reeds all at once, and I fell with my axe still on my back. Don't ever march with your axe on your back." },
        { id = "xwa_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "A grunt out of Razor Hill. Then you were taught right, and I was taught right too, and I still fell with my axe on my back when the murlocs came out of the reeds. Don't ever march like that." },
      },
      choices = {
        { text = "I won't. I'm sorry, Bengor.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Tell me about the ambush.", next = "ambush" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A soldier who carried orders south and didn't finish the road. That's the part of my story that matters now.", next = "ambush" } },
    advice = { { id = "tp_ad", text = "Never walk beside the water in this swamp. The murlocs wait where you can't see them, under the surface, and they don't make a sound until they're on you." } },
    _none = { { id = "tp_none", text = "Before my time, or after it, but either way, not mine." } },
  },
}

P:NPC {
  key = "karakul", id = TODO_NPC("Innkeeper Karakul"), name = "Innkeeper Karakul",
  bible = "bibles/swampofsorrows.md", role = "innkeeper", tier = "service",
  communities = { "stonard" }, temper = { "gruff" }, values = { "generous" },
  notices = { "weary", "drink" },

  impression = {
    first = "Innkeeper Karakul made me take my boots off at the door before he made me eat. Gruff as he is, he plainly thinks feeding the scouts is the most important job in Stonard.",
    third = "{name} met Innkeeper Karakul, who keeps Stonard's scouts fed and dry in the Swamp of Sorrows.",
  },

  greetings = {
    { id = "g_inn", text = "Boots off by the door, because the mud stays outside, even if you don't have to." },
    { id = "g_home", when = { homeInn = { "Stonard" } }, text = "Back in Stonard, then. Your bed's dry, and that's the best thing anyone can say in this swamp." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look half-drowned and half-dead, so sit and eat, in that order." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Slow down, because if you fall in the swamp drunk, the crocolisks get supper." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Karakul. Scouts come back muddy and hungry, and I send them out fed, which isn't glory, but it keeps the Horde walking." },
        { id = "h_mud", when = { metBefore = true }, text = "The scouts track half the swamp in on their boots, so I've started charging them a bucket of water each, and they pay in mud." },
      },
      again = { { id = "h_again", text = "Something else? The stew won't keep forever, and neither will I." } },
      choices = {
        { text = "What do the scouts say?", next = "scouts" },
        { text = "Any word from the temple?", next = "temple" },
        { text = "What's in the stew?", next = "stew" },
        { text = "Our people built this town, didn't they?", next = "old", when = { race = "Orc" } },
        { text = "Just a meal, thanks.", next = "END" },
      },
    },
    scouts = {
      lines = {
        { id = "sc_default", text = "That the swamp is bigger on the inside than it looks from the wall, and that every map they draw is wrong by morning. The cartographers argue about it over my tables half the night." },
      },
      choices = {
        { text = "Do they all come back?", next = "scouts_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouts_back = {
      lines = {
        { id = "sb_default", text = "Most of them, and I keep a bowl set out for the ones who are late. When a bowl sits cold three days, I stop setting it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    temple = {
      lines = {
        { id = "t_default", text = "Fel'zerul comes in from the Pool of Tears looking like he's seen his own grave, eats nothing, and goes back out. Whatever's down there, I don't want it in my inn." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stew = {
      lines = {
        { id = "sw_default", text = "Whatever the hunters brought in, and in this swamp you're better off not knowing. It's hot and it's thick, and that's all a scout asks of a stew." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    old = {
      lines = {
        { id = "o_default", text = "Our fathers did, when they first came through the Portal, and some of these stones remember worse days than we've had. I keep the fire in the old hearth going, because it seems right." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I cook, I pour, and I make beds. Ask the Commander if you want a story; I only want to know if you're hungry." } },
    advice = { { id = "tp_ad", text = "Dry your boots by the fire every night, or the swamp will take your toes before the crocolisks get a chance." } },
    _none = { { id = "tp_none", text = "I feed scouts, and the scouts know things, so ask them." } },
  },
}
