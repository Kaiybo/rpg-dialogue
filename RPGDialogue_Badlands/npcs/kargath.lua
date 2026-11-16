-- Kargath: the Horde's lone outpost in the Badlands, on the road to Blackrock. Voice: bibles/badlands.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "goretooth", id = TODO_NPC("Warlord Goretooth"), name = "Warlord Goretooth",
  bible = "bibles/badlands.md", role = "soldier", tier = "quest",
  communities = { "kargath" }, temper = { "boisterous" }, values = { "proud", "loyal", "brave" },
  notices = { "race", "class", "level" },

  impression = {
    first = "Warlord Goretooth holds Kargath and plainly wishes he were fighting instead of watching. He's loud, proud and lonely on that tower, and he admitted to talking to vultures.",
    third = "{name} met Warlord Goretooth, who holds the Horde outpost of Kargath in the Badlands.",
  },

  greetings = {
    { id = "g_tower", text = "Another one climbs my tower, good! I was starting to talk to the vultures." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still alive! That's more than I can say for the last three I sent up the road." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! I was one, once, before they gave me a tower and a title, so swing an axe for me while you still can." },
    { id = "n_young", cat = "level", when = { maxLevel = 45 },
      text = "You're young for the Badlands, so stay south of the Spire; the Blackrock eat young things." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Good; the spirits of this rock have been angry since before I came, and nobody here knows how to ask them why." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Not while the Spire stands, I think, for nothing grows within a day's march of it and the orcs inside like it that way. Ask me again when Blackrock has fallen, and I'll give you a better answer." } },
      choices = {
        { text = "Then we take the Spire, and the land heals after.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them rot inside it. We can wait them out.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A tauren druid at Kargath! Can you smell the Spire from here, druid? I swear I can on the hot days, and it smells of the old Horde and older lies." },
        { id = "h_default", key = true,
          text = "I am Warlord Goretooth, and Kargath is mine to hold. Up the road sits Blackrock Spire, full of orcs who call themselves the true Horde, and I sit here watching, and waiting, and getting old." },
        { id = "h_kos", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("KILL ON SIGHT: Dark Iron Dwarves") }, { questActive = TODO_QUEST("KILL ON SIGHT: High Ranking Dark Iron Officials") } } },
          text = "So you read the posting, good! Kill Dark Irons, all of them, and the officers twice over, and bring me proof." },
        { id = "h_angerforge", when = { questActive = TODO_QUEST("Operation: Death to Angerforge") },
          text = "General Angerforge is down in the depths, giving orders to Dark Irons. Take the orders away from him, permanently." },
        { id = "h_command", when = { any = { { questActive = TODO_QUEST("Warlord's Command") }, { questActive = TODO_QUEST("Eitrigg's Wisdom") } } },
          text = "Omokk, Voone and Wyrmthalak must die in their Spire, and any papers they carry come to me. If those papers say what I fear, the Warchief himself must hear it, so go to Orgrimmar and tell him Goretooth sent you." },
        { id = "h_butcher", tags = { "news" }, when = { questRecent = { TODO_QUEST("Operation: Death to Angerforge"), days = 7 } },
          text = "The Butcher of Blackrock is dead, and the 109th can rest! Wear that medallion where everyone in Kargath can see it, and let them ask you about it." },
        { id = "h_thrall", when = { heardLine = "thrall.h_default" },
          text = "You've stood before Thrall, so you know why we hold this rock. He sent us here, and here we stay." },
      },
      again = {
        { id = "h_again", text = "More? Good, talking keeps me from counting vultures." },
        { id = "h_again2", text = "Speak up, the wind on this tower steals every second word." },
      },
      choices = {
        { text = "The land here is sick, Warlord. Can it heal?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You sound like you'd rather be fighting.", next = "dream" },
        { text = "Why does the Horde hold Kargath at all?", next = "why" },
        { text = "What happened to the 109th Division?", next = "the109" },
        { text = "Who serves under you here?", next = "staff" },
        { text = "Warrior to warrior: do you miss it?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Angerforge is dead, Warlord.", next = "angerforge_dead", when = { questDone = TODO_QUEST("Operation: Death to Angerforge") } },
        { text = "Are you sweet on the Forsaken ladies, Warlord?", next = "forsaken", when = { race = "Scourge" } },
        { text = "The orcs at the Spire are my blood, Warlord.", next = "k_orc", when = { race = "Orc" } },
        { text = "The spirits here are sick with Dark Iron fire.", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "My people have no stake in Blackrock feuds.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "Point me at the Dark Irons.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { kargath = 1 } } },
      },
    },

    dream = {
      big = true,
      lines = {
        { id = "d_default", text = "Rather? I dream of it every night: me, an axe, a hundred Blackrock, and a song about it after. Instead I get a tower, reports, and two Forsaken ladies at the fire who laugh at my jokes because they're dead and nothing else is funny." },
      },
      choices = {
        { text = "The ladies at the fire?", next = "ladies" },
        { text = "You dream about dying?", next = "dream_death" },
        { text = "Maybe you'll get your fight.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    dream_death = {
      lines = {
        { id = "dd_default", text = "A thousand times, a thousand ways, and every one of them in the thick of the fighting with the enemies of the Horde falling around me like wheat. Some would call those nightmares, but I wake up smiling." },
      },
      choices = {
        { text = "I pray for such a death too.", next = "dream_young", fx = { trait = { brave = 1 } } },
        { text = "That's grim, Warlord.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "That's the only death worth dreaming of, Warlord.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    dream_young = {
      lines = {
        { id = "dy_default", text = "Ha! I knew it the moment you climbed up here; you remind me of myself when I was young and the war was still mine. I expect you'll be every bit as fierce dead as you are alive." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 3 } } },
    },
    ladies = {
      lines = {
        { id = "l_default", text = "Theodora and Vivian, the Hierophant and the Shadowmage: fine company, with sharp tongues. Don't tell them I said fine." },
      },
      choices = { { text = "Your secret is safe.", next = "BACK", fx = { affinity = 3 } } },
    },

    why = {
      lines = {
        { id = "w_default", text = "The Warchief sent the Kargath Expeditionary Force into these badlands, and we found the dwarves digging at a place called Uldaman. But the real prize is a road through the Searing Gorge to Blackrock Mountain, where Rend Blackhand hides." },
      },
      choices = {
        { text = "Who is Rend Blackhand?", next = "why_rend" },
        { text = "And the Dark Irons?", next = "why_dark" },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },
    why_rend = {
      lines = {
        { id = "wr_default", text = "Son of Blackhand, and he sits in the Spire calling himself Warchief of a Horde that died at the end of the Second War. There is one Warchief, and I would very much like to explain that to Rend in person." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },
    why_dark = {
      lines = {
        { id = "wd_default", text = "We went looking for Rend and woke the Dark Irons instead, and now they come at us out of the mountain and out of the Gorge. I didn't ask for a second war, but I'll take it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    the109 = {
      lines = {
        { id = "t_default", text = "A whole division of the Expeditionary Force, orcs and trolls, went into the Depths and was butchered by General Angerforge's men. So now every Dark Iron who wears his colors is to be killed on sight, and the postings by the road say so." },
      },
      choices = {
        { text = "And Angerforge himself?", next = "the109_op" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    the109_op = {
      lines = {
        { id = "to_default", text = "Operation: Death to Angerforge, for whoever earns it. I can't tell you every detail of what it entails, but I promise you it ends with somebody dying, and it won't be us." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    staff = {
      lines = {
        { id = "s_default", text = "Grandmaster Lexlort runs my scouts and sees everything, Theodora and Vivian study whatever the Dark Irons build, and Shul'kar feeds us all. It's a small fort, but it bites." },
      },
      choices = {
        { text = "Lexlort sees everything?", next = "staff_lexlort" },
        { text = "And your scouts in the field?", next = "staff_neeka" },
        { text = "Something else.", next = "BACK" },
      },
    },
    staff_lexlort = {
      lines = {
        { id = "sl_default", text = "He found out where Angerforge's officers train before the dwarves knew it themselves. I don't ask how he does it, because I sleep better not knowing who's watching my tower." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    staff_neeka = {
      lines = {
        { id = "sn_default", text = "Neeka Bloodscar leads them, and she's the only orc in Kargath who's told me to my face that I walk too loud. She sends her reports south to Stonard, and I've learned to read them before I read anything else." },
        { id = "sn_done", when = { questDone = TODO_QUEST("Report to Helgrum") },
          text = "Neeka Bloodscar, and you've carried her reports to Stonard yourself, so you know she writes like she talks, short and sharp. When she says the road is clear, I believe her, and when she says it isn't, I double the guard." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    warrior = {
      lines = {
        { id = "wa_default", text = "Every day. Command is a fine thing, and now I feel the glory and the bitterness of every fight through the soldiers I send, but I can still feel an axe in my hand when I sleep." },
      },
      choices = { { text = "Then I'll swing one for you.", next = "BACK", fx = { affinity = 3, trait = { brave = 1 } } } },
    },
    angerforge_dead = {
      lines = {
        { id = "ad_default", text = "I heard, and I drank to it, and then I drank to the 109th, and then I may have sung. You are a remarkable soldier, and the K.E.F. will not forget whose axe finished the job." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { kargath = 2 } } } },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "Sweet? I'm a warlord, I'm not sweet on anything! I simply enjoy good company at a good fire, and if the company happens to be dead, well, it doesn't eat much." },
      },
      choices = {
        { text = "Theodora calls you Lunk.", next = "forsaken_lunk" },
        { text = "Your secret is safe.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    forsaken_lunk = {
      lines = {
        { id = "fl_default", text = "She does, and she's the only one in Kargath who'd dare. It's my name, and a fine name, so tell her the Warlord said she may go on using it, if she likes." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_orc = {
      big = true,
      lines = {
        { id = "xor_default", text = "Blood, yes, and that is what makes it bitter. Rend's clan marched in the same Horde as mine in the Second War, and now they kneel to a Warchief they made up and call Thrall a slave's name, so tell me which of us is the true Horde." },
        { id = "xor_camp", when = { origin = "orc_camp_born" },
          text = "You were born behind the camp fences, like the young ones Thrall freed. Those orcs on the mountain never saw a fence; they kept their bloodlust and called it pride, and they would call you weak for having been a prisoner." },
      },
      choices = {
        { text = "Thrall's Horde is the true one.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Some of them fight with more honor than Orgrimmar knows.", next = "BACK", fx = { align = { order = -1 }, affinity = -2 } },
        { text = "Could any of them be brought home?", next = "k_orc_home" },
      },
    },
    k_orc_home = {
      lines = {
        { id = "xoh_default", text = "Some, maybe, if Rend were dead and the dragon gone from his ear. I have thought it on long nights, and then the Spire sends another war party down the road, and I stop thinking it." },
      },
      choices = { { text = "Something else, Warlord.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_shaman = {
      lines = {
        { id = "xsh_default", text = "Sick is a word for it. The Earthen Ring sends a shaman through here now and then, and they all leave with the same look you have now, like someone who has smelled a corpse in a stew." },
        { id = "xsh_thrall", when = { origin = "orc_thrall_shaman" },
          text = "You learned from Thrall's own circle, I hear it in how you talk. Then you know what the Dark Irons woke under that mountain was never theirs to wake, and the earth out here still feels it." },
      },
      choices = {
        { text = "The land can heal, if the fires are put out.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Then burn the Dark Irons out with their own fire.", next = "BACK", fx = { align = { light = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_tauren = {
      lines = {
        { id = "xta_default", text = "No stake, but you came all this way from Mulgore to stand on hot rock beside us, so you have one now. The Blackrock would chain your people the way they chained mine, if they ever learned where you graze." },
      },
      choices = {
        { text = "Then I'll fight for the Horde's sake.", next = "BACK", fx = { align = { order = 1 }, affinity = 2, standing = { kargath = 1 } } },
        { text = "I fight for my tribe, not for your feud.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A warlord hears every boast and every report that comes down that road. Ask me about any of these, and I'll tell you how it really went." },
    },
    blackrock = { { id = "tp_blackrock", text = "Rend Blackhand sits up there in the Spire calling himself Warchief. There's one Warchief. I'd like to remind Rend of that with an axe." } },
    dark_iron = { { id = "tp_dark_iron", text = "They swarm out of the mountain like ants out of a kicked nest. We kick back." } },
    background = { { id = "tp_ba", text = "I was a young warrior once, and I lived every dream I had. Now I command, and I live them again through the soldiers I send up that road.", next = "dream" } },
    advice = { { id = "tp_ad", text = "Read the postings by the road before you go into the mountain. They'll tell you who to kill, and that saves a great deal of thinking once you're down there." } },
    _none = { { id = "tp_none", text = "Never heard of it, but can I hit it?" } },
  },
}

P:NPC {
  key = "theodora", id = TODO_NPC("Hierophant Theodora Mulvadania"), name = "Hierophant Theodora Mulvadania",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "dramatic" }, values = { "curious", "mischievous" },
  notices = { "race" },

  impression = {
    first = "Hierophant Theodora Mulvadania calls everyone darling and gossips like a court lady at a bonfire. When she spoke of the 109th Division, though, the charm went out of her voice entirely.",
    third = "{name} met Hierophant Theodora Mulvadania of the Kargath Expeditionary Force, who mourns the slaughtered 109th Division.",
  },

  greetings = {
    { id = "g_fire", text = "Oh, a new face at the fire! Sit, sit, darling, and you simply must tell me something dreadful, because it's been a dull week in the dust." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Another of us, how refreshing! The orcs are lovely, darling, but they do keep breathing at one." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Only rumour, darling, but the rumour is very good. They say the Dark Irons called a fire lord up out of the earth centuries ago and have been his servants ever since, which would explain the heat, and the tempers, and the abysmal manners." } },
      choices = {
        { text = "Then the Horde must stand together and put that fire out.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the Dark Irons burn in their master's fire. It's their mess.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Vivian, as usual, because she has books and I have only opinions. She says the earth here was scorched by old wars long before the orcs came, and I say it simply has a sour disposition, like the Warlord." } },
      choices = {
        { text = "Any land can be mended, given time and care.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some places are better left scorched.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, darling! You must tell me whether the spirits gossip, because if they do, I'd very much like to know what they say about the Warlord." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, at Kargath? How delightful. Vivian and I have a running wager on whether the Badlands were ever green, and I suspect you could settle it." },
        { id = "h_default", key = true,
          text = "Hierophant Theodora Mulvadania, of the Undercity and the Kargath Expeditionary Force. I keep the Warlord company. Someone has to, and Vivian can't do it alone." },
        { id = "h_109th", tags = { "news" }, when = { questActive = TODO_QUEST("The 109th Division") },
          text = "The 109th Division were our people, Expeditionary Force, and they were my friends, and General Angerforge and his golem lord butchered them in the depths. I'm done being charming about it, darling: kill them both." },
        { id = "h_guzzler", when = { questActive = TODO_QUEST("The Grim Guzzler") },
          text = "The Grim Guzzler is a tavern inside Blackrock Depths, if you can believe it. Do go and see, and tell me everything, especially the parts you shouldn't." },
        { id = "h_machines", when = { questActive = TODO_QUEST("The Rise of the Machines") },
          text = "Golems, darling, which the Dark Irons build out of stone and spite. Bring me shards from the rock things in the Burning Steppes, and then we'll see who's been signing their work." },
        { id = "h_machines_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Rise of the Machines"), days = 3 } },
          text = "Initials, darling, etched into every one of those shards, and a rank beside them, as if the golems were soldiers. There's a gnome out in the Dustbowl called Lotwil who knows about such things, so do go and bother him." },
        { id = "h_goretooth", when = { heardLine = "goretooth.h_default" },
          text = "Did the Warlord tell you about his dreams, the glorious death and the hundred foes? He tells everyone, and we nod, because it's kinder." },
      },
      again = {
        { id = "h_again", text = "More? Oh, you are a treat. Go on, darling." },
        { id = "h_again2", text = "Don't stop now, I was just starting to enjoy myself." },
      },
      choices = {
        { text = "Who's winning the wager, Hierophant?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Can a warrior's steel do anything against the Dark Iron?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "The fire spirits rage under Blackrock Mountain. Do you know why?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Any gossip?", next = "gossip" },
        { text = "What are these machines?", next = "machines" },
        { text = "What does a Hierophant do?", next = "hierophant" },
        { text = "Tell me about the 109th.", next = "the109" },
        { text = "How does a Forsaken get on among orcs?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm Forsaken, and the Light still answers me.", next = "paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "You don't flinch at my demons, Hierophant.", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },

    gossip = {
      lines = {
        { id = "g_default", text = "Goretooth thinks he's charming, and Vivian thinks so too, though she'd sooner be torn apart by ghouls than say it. I say nothing, darling; I'm a Hierophant, and I simply observe." },
      },
      choices = {
        { text = "And what do you think of him?", next = "gossip_lunk" },
        { text = "Very wise.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    gossip_lunk = {
      lines = {
        { id = "gl_default", text = "Lunk? His name is Lunk, darling, Warlord Lunk Goretooth, and he struts up and down that tower like a peacock with tusks. I'd never have him, but I'd never let anyone else make fun of him either." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    machines = {
      lines = {
        { id = "m_default", text = "They showed themselves when we first pushed into the Searing Gorge, great lumbering things of rock and metal. We traced them back to the Burning Steppes, and quite possibly to Blackrock Depths itself." },
      },
      choices = {
        { text = "Who builds them?", next = "machines_marks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    machines_marks = {
      lines = {
        { id = "mm_default", text = "That's what my monocle is for, darling, the enormous one. Every fragment has a maker's initials and a rank stamped into it, and anyone who signs his golems has a very high opinion of himself." },
        { id = "mm_done", when = { questDone = TODO_QUEST("The Rise of the Machines") },
          text = "G.L.A., darling, on every shard, and the ones you smashed were only Rank IV, the lowliest sort. Lotwil went white as a sheet when he saw them, and gnomes don't go white easily." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    hierophant = {
      lines = {
        { id = "hi_default", text = "It's a title, darling, a lovely long one, and it means people expect me to know things. So I make very sure that I do, which is why I listen at every fire in Kargath." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    the109 = {
      big = true,
      lines = {
        { id = "t_default", text = "Good orcs and good trolls, a great many of them, and some of them were my friends, which is not something I say lightly in my condition. Angerforge and his golem lord, Argelmach, had them slaughtered in the Depths." },
      },
      choices = {
        { text = "Then they'll answer for it.", next = "the109_revenge", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll make them pay, but I won't fight fair doing it.", next = "the109_revenge", fx = { align = { honor = -1 } } },
        { text = "I'm sorry for your friends.", next = "the109_revenge", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    the109_revenge = {
      lines = {
        { id = "tr_default", text = "Revenge is the only gift I'd accept for them, darling, and I'd accept it with no mercy at all. Bring it to me and I'll weep, or whatever it is I do now instead." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    forsaken = {
      lines = {
        { id = "fo_default", text = "Beautifully, darling, as long as you remember that they mean well and smell of it. Lunk saves me the warmest seat by the fire, as if I could feel it, and that's sweeter than anything the Undercity ever did for me." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    paladin = {
      lines = {
        { id = "pa_default", text = "Darling, how scandalous, and how utterly delicious! Half the Undercity would burn you for it and the other half would want to study you, so do be careful which half you tell." },
      },
      choices = {
        { text = "The Light didn't ask my permission.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd trade it for something less trouble, if I could.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll be careful.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Steel against Dark Iron is like hammering an anvil with an anvil, warrior. You'll need fire and shadow too, which is why Kargath keeps people like me around." } },
      choices = {
        { text = "Then I'll be the anvil, and you be the fire.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll trust steel. Magic only fails you.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "Flinch? My dear, I've shared a corridor with abominations and a bench with the Royal Apothecaries, and an imp is the politest guest I've had all month. Do keep it away from the Warlord, though; he swings first and asks never." },
        { id = "xlk_cult", when = { origin = "forsaken_cult_remnant" },
          text = "I know where you learned it, darling, and I won't say it aloud in an orc town. We've all got something from before that we'd rather keep in the cellar." },
      },
      choices = {
        { text = "My demons are tools. Nothing more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'd rather be rid of them, if I could.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Darling, I listen at every fire in Kargath, so of course I know things. Pick one of these and I'll tell you everything, including the parts I shouldn't." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, darling, the good gossip and the true gossip, which aren't always the same thing. Here's what I can tell you." },
    },
    dark_iron = { { id = "tp_dark_iron", text = "Grim little people, though their ale is wonderful, or so I'm told." } },
    background = { { id = "tp_ba", text = "The Undercity sent me, the Expeditionary Force keeps me, and the Warlord amuses me. Before that is none of your business, darling, and most of it is buried." } },
    advice = { { id = "tp_ad", text = "Never let a Dark Iron see you're impressed by his golem, darling. They're vain about them, and vanity makes them careless." } },
    _none = { { id = "tp_none", text = "Never heard a whisper of it, darling, and I hear every whisper." } },
  },
}

P:NPC {
  key = "vivian", id = TODO_NPC("Shadowmage Vivian Lagrave"), name = "Shadowmage Vivian Lagrave",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "theatrical" }, values = { "curious", "proud" },
  notices = { "class" },

  impression = {
    first = "Shadowmage Vivian Lagrave insists she is very composed and then jumps at her own shadow. Her curiosity about the Dark Irons' secrets is almost greedy, and wholly sincere.",
    third = "{name} met Shadowmage Vivian Lagrave of the Kargath Expeditionary Force, a theatrical student of the Dark Irons' secrets.",
  },

  greetings = {
    { id = "g_fire", text = "Oh! You startled me, not that I'm easily startled, of course; I'm a Shadowmage, and we're very composed." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "A fellow practitioner! Finally someone at this fire who knows a ley line from a clothesline." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Trouble me? It thrills me, though I suppose it shouldn't. The Dark Irons trap fire and earth inside their golems to make them walk, and if I learn how, the Expeditionary Force could do it too, which I admit sounds worse when I say it to a shaman." } },
      choices = {
        { text = "Free them, Vivian. No spirit should be chained inside a golem.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Study it. If the Dark Irons can, the Horde should too.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! Oh, how fortunate, because I've been taking apart elemental cores all week and I'd love to know whether they mind." },
        { id = "h_default", key = true,
          text = "Shadowmage Vivian Lagrave, of the Kargath Expeditionary Force. I study the things in the mountain that the Dark Irons would rather we didn't, which is thrilling work, though mostly dust." },
        { id = "h_element", tags = { "news" }, when = { questActive = TODO_QUEST("The Last Element") },
          text = "The Dark Irons put something in their golems to make them move, called Essence of the Elements, and I want ten. I have projects of my own that could use a heartbeat." },
        { id = "h_recipe", when = { any = { { questActive = TODO_QUEST("Vivian Lagrave") }, { questActive = TODO_QUEST("Lost Thunderbrew Recipe") } } },
          text = "There's a Thunderbrew recipe lost somewhere in the Depths, and I want it, for research. Entirely for research!" },
        { id = "h_tablet", when = { any = { { questActive = TODO_QUEST("Vivian Lagrave and the Darkstone Tablet") }, { questActive = TODO_QUEST("The Darkstone Tablet") } } },
          text = "The Darkstone Tablet holds the secret recipes of a dwarf alchemist who's been dead for ages, and it's somewhere in Blackrock Spire. Bring it to me carefully, because I mean to read every scratch on it!" },
        { id = "h_element_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Last Element"), days = 3 } },
          text = "Your essences went off to the Undercity by courier this morning, every one of them. I do hope you spent your payment on something frivolous; it's what I'd do." },
      },
      again = {
        { id = "h_again", text = "Yes? I'm perfectly composed, so ask away." },
        { id = "h_again2", text = "Something else? Oh good, I was hoping you'd stay." },
      },
      choices = {
        { text = "My beasts could scout the Burning Steppes for you, Vivian.", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Those golem essences hold bound elementals, Vivian. Does that trouble you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The Warlord speaks well of you.", next = "flustered" },
        { text = "What are you really studying?", next = "study" },
        { text = "Why does a Shadowmage want a beer recipe?", next = "thunderbrew" },
        { text = "What's the Darkstone Tablet?", next = "tablet" },
        { text = "What do you make of my craft?", next = "practitioner", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "An orc who studies the arcane. Surprised?", next = "orc_mage", when = { race = "Orc", class = "MAGE" } },
        { text = "Do you miss the Undercity?", next = "undercity", when = { race = "Scourge" } },
        { text = "A troll who deals with demons. Does that interest you?", next = "k_troll_lock", when = { race = "Troll", class = "WARLOCK" } },
        { text = "I'll find it.", next = "END", fx = { affinity = 1 } },
      },
    },

    flustered = {
      lines = {
        { id = "f_default", text = "He does? I mean, does he, how nice, that's... hm, well. Did you need a quest? I have several, so please, take one." },
      },
      choices = {
        { text = "You're blushing, Shadowmage.", next = "flustered_blush" },
        { text = "I'll take one.", next = "BACK", fx = { affinity = 3 } },
      },
    },
    flustered_blush = {
      lines = {
        { id = "fb_default", text = "I am dead, and the dead do not blush; it's the firelight, and you'll kindly say so if anyone asks. Theodora would never let me hear the end of it." },
      },
      choices = { { text = "It's the firelight.", next = "BACK", fx = { affinity = 2 } } },
    },

    study = {
      lines = {
        { id = "s_default", text = "The Dark Irons have mastered golems of terrible power, and our spies say they use a unique source to make them go. Think what the Apothecarium could build into our abominations with a power like that!" },
      },
      choices = {
        { text = "Abominations?", next = "study_abom" },
        { text = "That's grim work.", next = "study_grim", fx = { align = { light = 1 } } },
        { text = "Power like that would serve the Apothecarium well.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    study_abom = {
      lines = {
        { id = "sa_default", text = "Stitched, strong and very loyal, though not very bright, and they'd be so much stronger with a proper heart of elemental fire. Every essence you bring goes to the Undercity by the next courier." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    study_grim = {
      lines = {
        { id = "sg_default", text = "Grim? My dear, I'm a Shadowmage in the Badlands, so grim is the only kind of work there is. I try to be cheerful about it, and that's more than the work deserves." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    thunderbrew = {
      lines = {
        { id = "th_default", text = "A Dark Iron named Hurley Blackbreath stole the recipe for Thunderbrew Lager, which is said to fill whoever drinks it with strength and courage. The Forsaken can surely find uses for that more in line with our own objectives." },
      },
      choices = {
        { text = "Such as?", next = "thunderbrew_joke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thunderbrew_joke = {
      lines = {
        { id = "tj_default", text = "Picture the dwarves of the Alliance facing their own beer's virtues on a battlefield, turned against them by people who can't even taste it! I find that terribly funny, and perhaps death does that to one's sense of humor." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    tablet = {
      lines = {
        { id = "ta_default", text = "Urheld Darkstone was a dwarf alchemist of great skill, and his fellows thought him mad, so he never shared his research. He etched it onto tablets instead, which is a terribly sensible thing for a madman to do." },
      },
      choices = {
        { text = "And one is in the Spire?", next = "tablet_spire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tablet_spire = {
      lines = {
        { id = "ts_default", text = "In a chamber once called the Hall of Fortune, though who knows what the Blackrock call it now, since few who go in come back out to tell us. Do try to be one of the few." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },

    practitioner = {
      lines = {
        { id = "pr_default", text = "Oh, I could tell the moment you sat down, you've that slightly singed look about the fingertips. Tell me you've read something forbidden lately, because nobody here reads anything at all." },
      },
      choices = {
        { text = "Nothing I'd admit to in public.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "I keep to what's safe.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    orc_mage = {
      lines = {
        { id = "om_default", text = "Surprised, and absolutely delighted! An orc who studies instead of smashing is the rarest specimen in the Badlands, so do sit somewhere I can watch you cast." },
      },
      choices = { { text = "I'm not a specimen.", next = "BACK", fx = { affinity = 1, trait = { proud = 1 } } } },
    },
    undercity = {
      lines = {
        { id = "u_default", text = "This place has a certain stark charm, I'll grant it, but it has none of the Apothecarium's amenities. I miss a proper laboratory far more than I ever missed breathing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_troll_lock = {
      big = true,
      lines = {
        { id = "xtl_default", text = "Interest me? I've only read of it, in a Kirin Tor report that described the Darkspear's spirit-talk as quaint. I don't suppose your loa have opinions about the Burning Legion?" },
        { id = "xtl_voice", when = { origin = "troll_other_voice" },
          text = "You heard a different voice in the dark than the loa, I'm told, and listened to it. That's the most interesting thing anyone has said in Kargath since I arrived, which isn't saying much, but still." },
      },
      choices = {
        { text = "The loa keep their distance from my work.", next = "BACK", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
        { text = "The loa watch me. They'd warn me if I went too far.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "What did the report say?", next = "k_troll_report" },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "They could, and they'd be less likely to be noticed than one of my apprentices. The black dragonflight has keen eyes, though, so send them low and send them at dusk." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet}? It's rather larger up close than I'd expected, and I am perfectly composed, thank you. Yes, it could scout the Steppes, but send it low and at dusk, because the black dragonflight has keen eyes." },
      },
      choices = {
        { text = "I'll send them as you say.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My beasts go where I decide, Shadowmage.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    k_troll_report = {
      lines = {
        { id = "xtr_default", text = "That trolls can't be taught the higher schools, which I always found a little rich from people who taught Kel'Thuzad. You're proof against it, and I'll be writing that down with some pleasure." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I study what the Dark Irons leave lying about, and a few other things besides. Ask me about any of these, my dear." },
    },
    dark_iron = { { id = "tp_dark_iron", text = "Their fire magic is crude but powerful, like a hammer made of lava, and I'd love to study it from a safe distance." } },
    background = { { id = "tp_ba", text = "The Apothecarium trained me, the Expeditionary Force sent me, and the Badlands bore me to tears until the Dark Irons gave me something to study." } },
    advice = { { id = "tp_ad", text = "Never touch a golem's heart with bare hands, my dear, even a broken one. I learned that one the hard way, and I don't have many fingers to spare." } },
    _none = { { id = "tp_none", text = "Hm! That's not my field, not yet." } },
  },
}

P:NPC {
  key = "lexlort", id = TODO_NPC("Lexlort"), name = "Lexlort",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "terse" }, values = { "practical", "loyal" },
  notices = { "class" },

  impression = {
    first = "Lexlort spends words as though each one might be overheard and sold. He knew which path I'd come in by, and that is meant to impress me, I think.",
    third = "{name} met Lexlort, the Kargath Expeditionary Force's watchful spy on Blackrock Spire.",
  },

  greetings = {
    { id = "g_shadow", text = "You found me, and most don't, which is either good news for you or bad news for me." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of ours, in trade if not in uniform. You'll understand why I don't say much." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they'll take orders, I'll take them on, though nothing I've met takes orders well. The earth under Blackrock Mountain shakes when something moves deep inside, so you tell me what it's saying and I'll tell you whether to worry." } },
      choices = {
        { text = "I'll report everything the earth tells me, straight to you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The spirits answer to me, not to the Expeditionary Force.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, which is useful to me, since spirits don't sell plans to the Blackrock, and that already puts them ahead of Grark." },
        { id = "h_default", key = true,
          text = "Lexlort. The Expeditionary Force needs eyes on the Spire, and I'm the eyes, but sometimes I need hands." },
        { id = "h_grark", tags = { "news" }, when = { questActive = TODO_QUEST("Grark Lorkrub") },
          text = "Grark Lorkrub sold our plans to the Blackrock. He's hiding under their wing in the Burning Steppes. Put him in thorium shackles and walk him to the Searing Gorge. My men will be waiting." },
        { id = "h_predicament", when = { questActive = TODO_QUEST("Precarious Predicament") },
          text = "You've got Grark moving. Keep him close through the mountain. If he runs, he dies, and what he knows dies with him." },
        { id = "h_bijou", when = { questActive = TODO_QUEST("Operative Bijou") },
          text = "Bijou went into Blackrock Spire and hasn't come out. Bring her back alive, and don't let her talk you into anything on the way." },
        { id = "h_report", tags = { "news" }, when = { questRecent = { TODO_QUEST("Bijou's Reconnaissance Report"), days = 3 } },
          text = "Bijou's reports are good, which annoys me more than if they'd been worthless. She's wriggled out of trouble again, and the K.E.F. is the better for it." },
        { id = "h_seen", when = { metBefore = true }, text = "You came in by the south path at noon; I know, because I always know. Don't take it personally." },
      },
      again = {
        { id = "h_again", text = "Something else. Quickly." },
        { id = "h_again2", text = "Ask, but keep your voice down; the wind carries." },
      },
      choices = {
        { text = "Could the spirits help you watch the Spire, Lexlort?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do you watch for?", next = "watch" },
        { text = "Who is Grark Lorkrub?", next = "grark" },
        { text = "Who's Bijou?", next = "bijou" },
        { text = "How did you know I was coming?", next = "seen" },
        { text = "Teach me something about the trade.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Grark's in your custody now.", next = "grark_done", when = { questDone = TODO_QUEST("Precarious Predicament") } },
        { text = "I'll be your hands.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My beast can be your eyes too.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "I'm nobody's hands, Lexlort. I work for myself.", next = "END", fx = { align = { order = -1 } } },
      },
    },

    watch = {
      lines = {
        { id = "w_default", text = "Who goes in and out of the Spire, and when, and how drunk they are when they do it. The Warlord calls me the head of reconnaissance, which means I'm the one who doesn't sleep." },
      },
      choices = {
        { text = "What have you learned?", next = "watch_learned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_learned = {
      lines = {
        { id = "wl_default", text = "Where Angerforge's officers train, behind a locked gate near the heart of the dwarves' city, and that the Blackrock and the Dark Irons share a mountain and very little else. The rest I tell the Warlord." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    grark = {
      big = true,
      lines = {
        { id = "gr_default", text = "One of ours, once, and caught red-handed giving the Blackrock our daily operations. I tracked him across the Searing Gorge, through the mountain and into the Burning Steppes, where he thinks he's safe." },
      },
      choices = {
        { text = "Why bring him back alive?", next = "grark_alive" },
        { text = "Why would an orc turn traitor?", next = "grark_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grark_alive = {
      lines = {
        { id = "ga_default", text = "A dead traitor tells you nothing. A live one in shackles tells you who else he talked to, and that list matters more than he does." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grark_why = {
      lines = {
        { id = "gw_default", text = "He'd tell you there's power in joining the Blackrock's legion, and he'd mean it. Rend still promises some orcs the old Horde back, and a few are fool enough to want it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },

    bijou = {
      lines = {
        { id = "b_default", text = "A goblin, and one of our slipperiest operatives. I found out she was working for an exotic pet dealer in the Burning Steppes called Kibler, paying her way with Horde coin." },
      },
      choices = {
        { text = "So she's a traitor too?", next = "bijou_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bijou_trust = {
      lines = {
        { id = "bt_default", text = "She's a goblin, so she's loyal to whoever paid last. Never trust one, and never let her sweet-talk you, because she will try." },
        { id = "bt_done", when = { questDone = TODO_QUEST("Bijou's Reconnaissance Report") },
          text = "She swears she only took Kibler's coin to get inside the Spire, and her reports almost make me believe it. Almost; I'm still counting the money." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    seen = {
      lines = {
        { id = "se_default", text = "Every path into Kargath has somebody on it who belongs to me. Most of them are grunts who think they're guarding a road, and that's how I like it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    rogue = {
      lines = {
        { id = "ro_default", text = "Never come back the way you went in, and never count on a door being locked twice. The Dark Irons change their locks, but they never change their habits." },
      },
      choices = { { text = "Noted.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    grark_done = {
      lines = {
        { id = "gd_default", text = "He is, and he's talking, slowly. You've earned your tribute, and the Warlord will want to see you about the last of it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "A beast doesn't gossip and doesn't get bored, which puts it ahead of half the grunts on this wall. Send it up the ridge at dusk and watch what the buzzards do; when they lift all at once, something from the Spire is moving." },
        { id = "xhu_head", when = { origin = "troll_headhunter" },
          text = "A headhunter from the jungle, by the trophies. You know how to wait in a tree for a day, so you know half my job already, and the buzzards will tell you the rest." },
      },
      choices = {
        { text = "Watching is half the hunt.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "I'd rather hunt the scouts than watch them.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I watch, I remember, and I'll talk about these if you ask me plainly." },
    },
    blackrock = { { id = "tp_blackrock", text = "I know their shift changes, their drinking songs and their names, because that's my job." } },
    background = { { id = "tp_ba", text = "I watch, I report, and I keep the rest to myself. That's the whole story." } },
    advice = { { id = "tp_ad", text = "Count the guards on your way in, and count them again on your way out. If the numbers don't match, run." } },
    _none = { { id = "tp_none", text = "Nothing I'll share." } },
  },
}

P:NPC {
  key = "shulkar", id = TODO_NPC("Innkeeper Shul'kar"), name = "Innkeeper Shul'kar",
  bible = "bibles/badlands.md", role = "innkeeper", tier = "service",
  communities = { "kargath" }, temper = { "warm" }, values = { "generous", "loyal" },
  notices = { "weary", "drink" },

  impression = {
    first = "Innkeeper Shul'kar keeps a pot on and a dry bunk ready and collects the grunts' tall tales for free. Kargath is a hard place, and his inn is the softest corner of it.",
    third = "{name} met Innkeeper Shul'kar, who keeps the inn at Kargath for the Horde's soldiers.",
  },

  greetings = {
    { id = "g_inn", text = "Come in out of the dust and sit. There's water, there's grog, and there's a bunk nobody's bled on, recently." },
    { id = "g_home", when = { homeInn = { "Kargath" } }, text = "Back from the badlands! Tell me what you killed, because the grunts like a good story with their supper." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look half dead, and I've got Forsaken guests, so I know what that looks like. Rest, friend." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy, now; the road to the Spire is hard enough sober." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "All night, every night, and my favourite is the one about the young Warchief calling the elements down on the internment camps to free his people. I know it's mostly true, which makes it better, and the grunts tell it as if they'd been standing next to him." } },
      choices = {
        { text = "Tell it true. Thrall earned it without any embellishment.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Embellish away. A good story wins more grunts than the truth.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman at my fire. The grunts swear one of yours called down a storm on the Dark Irons at the Gorge last week, and the storm gets bigger every time they tell it." },
        { id = "h_default", key = true,
          text = "I'm Shul'kar, and I keep the inn. Out here a hot meal and a dry bunk are worth more than gold, and I don't charge much more than gold for them." },
        { id = "h_story", when = { metBefore = true }, text = "A grunt told me last night he fought a Dark Iron the size of a door, and then it was two doors, and by morning it was a castle. Good story, though." },
      },
      again = { { id = "h_again", text = "Anything else, while the pot's still on?" } },
      choices = {
        { text = "Do the grunts tell many stories about shamans, Shul'kar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Want to hear a battle?", next = "story" },
        { text = "Who's the town named for?", next = "name" },
        { text = "Who passes through Kargath?", next = "travelers" },
        { text = "How do your Forsaken guests treat you?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm a soldier, Shul'kar. Tell me a battle worth hearing.", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "Who rents the room upstairs?", next = "upstairs" },
        { text = "A Darkspear needs no grog to tell a story.", next = "k_troll", when = { race = "Troll" } },
        { text = "A bunk, please.", next = "END", fx = { affinity = 1 } },
      },
    },
    story = {
      lines = { { id = "s_default", text = "Always! Lay your axe by the fire and tell it slow, and don't leave out the part where it nearly went wrong; that's the best part." } },
      choices = {
        { text = "[Tell it]", next = "story_told", fx = { affinity = 2, standing = { kargath = 1 } } },
        { text = "Maybe later.", next = "BACK" },
      },
    },
    story_told = {
      lines = {
        { id = "st_default", text = "Ha, that's a good one, and the grunts will have it by supper, with a few more Dark Irons in it. You've paid for your bunk twice over." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = {
        { id = "n_default", text = "Kargath Bladefist, chieftain of the Shattered Hand, back in the old Horde. Whether he'd be proud of a dusty tower and my stew, I couldn't say, but we keep his name standing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    travelers = {
      lines = {
        { id = "t_default", text = "Everyone, sooner or later, since the wind riders from here reach Hammerfall and the Undercity to the north and Grom'gol and Stonard to the south. Kargath is the knot that ties the Horde's roads together on this side of the sea." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = {
        { id = "f_default", text = "Theodora and Vivian? They tip well and they don't eat, which makes them my favorite guests. They do laugh at things I'd rather not understand, though." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    upstairs = {
      lines = {
        { id = "up_default", text = "Jarkal Mossmeld, the troll alchemist, and his jars, and his smells. He pays his rent in potions, which is fair, since half my grunts would be dead of the heat without them." },
        { id = "up_reagents", when = { questDone = TODO_QUEST("Badlands Reagent Run") },
          text = "Jarkal, and you've been filling his jars with gizzards, so you know the smell I'm cooking against. I put more onions in the stew every week, and it's still losing." },
      },
      choices = {
        { text = "Do you trust him?", next = "upstairs_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    upstairs_trust = {
      lines = {
        { id = "ut_default", text = "With potions, yes, and with a bargain, never, though he'd say the same of me and my grog. We get along fine, as long as neither of us tries to sell the other anything." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_troll = {
      lines = {
        { id = "xtr_default", text = "True enough, because the trolls in my common room tell the wildest tales of all, sober or not. Sit down and give me one about the jungle, and I'll tell the grunts it happened in the Badlands." },
        { id = "xtr_head", when = { origin = "troll_headhunter" },
          text = "A headhunter, by the look of your belt, so your stories come with proof. Leave the proof outside, though, because it puts the grunts off their stew." },
      },
      choices = {
        { text = "My stories are true, every word.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Mine get better each time I tell them.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Ha, every soldier says that and every soldier means 'tell me one I haven't heard.' The best I know is the night the 109th went up the mountain, and I'll tell it, but you'll buy the next round of grog for whoever cries first." },
        { id = "xwa_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "A Razor Hill grunt, this far from the sea! Then you'll like the one about the Dark Iron who mistook a goblin keg for an altar, and I've told it so often I've started to believe it." },
      },
      choices = {
        { text = "Tell it straight, no polishing.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Polish it. A good lie beats a dull truth.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "An innkeeper who followed the Expeditionary Force out here because soldiers need feeding. That's all there is to me, and it's enough." } },
    advice = { { id = "tp_ad", text = "Drink water before you drink grog, and drink both before you go near the Searing Gorge. The heat up there will have you seeing things." } },
    _none = { { id = "tp_none", text = "Don't know, but tell me about your battles instead, because I like those." } },
  },
}
