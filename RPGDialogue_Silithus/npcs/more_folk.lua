-- More of Silithus: the two faction runners at Cenarion Hold who send recruits to the war camps (Rifleman Torrig for
-- the Ironforge Brigade, Scout Bloodfist for the Orgrimmar Legion), and Ralo'shan the Eternal Watcher at Staghelm
-- Point. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Rifleman Torrig
---------------------------------------------------------------------------
P:NPC {
  key = "torrig", id = TODO_NPC("Rifleman Torrig"), name = "Rifleman Torrig",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest",
  communities = { "cenarion_hold", "ironforge_brigade" }, temper = { "dry", "gruff" }, values = { "duty", "loyal" },
  notices = { "race", "soldier" },
  impression = {
    first = "His encouragement is counting the good soldiers the desert has eaten.",
    third = "{name} met Rifleman Torrig, the dwarf who sends Alliance recruits from Cenarion Hold to the Ironforge Brigade's camp.",
  },
  greetings = {
    { id = "g_default", text = "Are ye Marshal Bluewall's new recruits? Of course ye are, so what are ye waiting for?" },
    { id = "g_back", when = { metBefore = true }, text = "Still here? The marshal's camp hasn't moved, and it won't come to you." },
    { id = "g_active", when = { questActive = TODO_QUEST("Report to Marshal Bluewall") }, text = "Go on, then, down past the hives to the camp, and don't dry out on the way." },
    { id = "g_done", when = { questDone = TODO_QUEST("Report to Marshal Bluewall") }, text = "Ye made it to the marshal and back, did ye? Ye're tougher than ye look, and I mean that kindly." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Good, at least ye'll not complain about the heat, being used to a forge. Well, ye'll complain less, anyway." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR", faction = "Alliance" },
      text = "Ye've a soldier's shoulders. The marshal will be glad of ye, and the sand will be glad of yer boots." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rifleman Torrig, Ironforge Brigade. I stand here in the shade, such as it is, and send good soldiers out into the desert to die, and aren't ye excited to join them?" },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Report to Marshal Bluewall") },
          text = "The marshal says ye've been carrying silithyst for the Brigade. Good, because the Horde's been carrying it for a season longer than we have, and we need every pair of arms." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde. This is the Circle's ground, so I'll keep my rifle on my shoulder, but I'll not pretend I'm pleased to see ye." },
      },
      again = {
        { id = "h_again", text = "What else? I've recruits to count, when they come." },
        { id = "h_again2", text = "Ask, then, but quick. The shade's moving." },
      },
      choices = {
        { text = "Where do I find Marshal Bluewall?", next = "camp", when = { faction = "Alliance" } },
        { text = "Why is the Brigade in Silithus at all?", next = "why" },
        { text = "How many recruits actually come back?", next = "back" },
        { text = "You make the desert sound like a grave.", next = "grave" },
        { text = "I'll be off.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "Out near Hive'Zora, where the bugs are thickest and the marshal is crossest. Look for the Brigade's banners, and if ye find yerself walking into a great nest of bugs instead, ye've gone too far." } },
      choices = {
        { text = "I'll go now.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Silithyst, the crystals in the sand. The Horde started gathering it a good while before Ironforge noticed, and now we're running to catch up, and every crystal we bring in is one they don't." } },
      choices = {
        { text = "What's silithyst actually for?", next = "silithyst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithyst = {
      big = true,
      lines = { { id = "si_default", text = "Ask the marshal, or better, ask someone clever, because I'm only a rifleman. All I know is the Horde wants it, and that's reason enough for Ironforge to want it more." } },
      choices = {
        { text = "If the Horde wants it, we take it first. Simple as that.", next = "BACK", reply = "That's the spirit, and that's what the marshal will tell ye too, only louder.", fx = { align = { order = 1 } } },
        { text = "Fighting over a thing nobody understands sounds daft.", next = "BACK", reply = "Daft it may be, but it's orders, and I'll leave the thinking to the generals. Ye might want to keep that opinion off Bluewall's ears.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "ba_default", text = "Most of them, if I'm honest, though ye'd not know it from the way I talk. The sun gets more of them than the Horde does, and the bugs get more than both." } },
      choices = {
        { text = "Then why frighten them?", next = "frighten" },
        { text = "Something else.", next = "BACK" },
      },
    },
    frighten = {
      lines = { { id = "fr_default", text = "Because a frightened recruit carries water, and a brave one doesn't. I'd rather they think me a grim old fool and come home than think me cheerful and die of thirst on the road." } },
      choices = {
        { text = "That's kinder than it sounds.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grave = {
      lines = { { id = "gr_default", text = "Aye, well, it's buried a few kingdoms already, from what the Circle says. I'm a dwarf, so I'm fond of things underground, but I'd sooner they were ale cellars than whatever's under these dunes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Rifleman, Ironforge Brigade, and too long in the sun. That's all ye need to know." } },
    advice = { { id = "tp_ad", text = "Carry twice the water ye think ye need. Then a bit more." } },
    _none = { { id = "tp_none", text = "I've no idea, and it's too hot to guess, so ye'd best ask the marshal." } },
  },
}

---------------------------------------------------------------------------
-- Scout Bloodfist
---------------------------------------------------------------------------
P:NPC {
  key = "bloodfist", id = TODO_NPC("Scout Bloodfist"), name = "Scout Bloodfist",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest",
  communities = { "cenarion_hold", "orgrimmar_legion" }, temper = { "blunt", "fierce" }, values = { "duty", "proud" },
  notices = { "race", "soldier" },
  impression = {
    first = "He doesn't waste words, and he doesn't waste water either.",
    third = "{name} met Scout Bloodfist, the orc who sends Horde recruits from Cenarion Hold to the Orgrimmar Legion's camp.",
  },
  greetings = {
    { id = "g_default", text = "You are here for the Legion? Good. General Kirika needs blades and backs, and you look like you have both." },
    { id = "g_back", when = { metBefore = true }, text = "You are still at the Hold. The general does not wait, grunt." },
    { id = "g_active", when = { questActive = TODO_QUEST("Report to General Kirika") }, text = "South to the Legion's camp by Hive'Regal. Do not stop to look at the bugs; they will look back." },
    { id = "g_done", when = { questDone = TODO_QUEST("Report to General Kirika") }, text = "Kirika says you carry well and fight better. Lok'tar, warrior." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "One of the clans! Good, the desert will not frighten you after the camps. Nothing out there is worse than that." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR", faction = "Horde" },
      text = "A warrior. Kirika will put you where the fighting is, so keep your axe sharp and your waterskin full." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Scout Bloodfist, Orgrimmar Legion. I scout the sands for the general and send her what fighters come through the Hold, and lately the fighters are fewer than the sand." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Report to General Kirika") },
          text = "You have been to the general and gathered for the Legion. Good, because the dwarves are finally waking up, and we need to keep our lead." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance. This is the Circle's ground, and I will honour that, but do not mistake my patience for friendship." },
      },
      again = {
        { id = "h_again", text = "Speak. I am listening, and watching the dunes." },
        { id = "h_again2", text = "What else? Be quick." },
      },
      choices = {
        { text = "Where is General Kirika's camp?", next = "camp", when = { faction = "Horde" } },
        { text = "What does the Legion want in this desert?", next = "why" },
        { text = "What have you seen out on the sands?", next = "seen" },
        { text = "The Alliance is gathering too, now.", next = "rivals" },
        { text = "Lok'tar.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "South, near Hive'Regal, where the sand turns red. Follow the road and look for our banners, and if the bugs start chasing you, run toward the banners, not away from them." } },
      choices = {
        { text = "I go now.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Silithyst, the crystals in the sand. Orgrimmar wants it gathered, and the Legion gathers it. I do not ask why the Warchief wants a thing; I ask where it is and how many enemies stand around it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    seen = {
      lines = { { id = "se_default", text = "Bugs the size of kodo, cultists in robes who think the sand loves them, and dwarves who march too loudly. The hives are the worst, because they hum at night, and the hum gets into your bones." } },
      choices = {
        { text = "The cultists. Who are they?", next = "cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = { { id = "cu_default", text = "Twilight's Hammer, the Circle calls them. They wear robes and talk of an end to the world, and they fight like fools. I kill them when they cross my path, and they cross it often." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rivals = {
      big = true,
      lines = { { id = "ri_default", text = "I know. I have watched their camp grow by Hive'Zora, and I tell Kirika every new tent. They are late, but they are many, and dwarves do not stop once they start." } },
      choices = {
        { text = "Then we strike their gatherers before they catch up.", next = "BACK", reply = "Ha! Kirika will like you. But we strike in the open, where the Circle cannot say we broke their peace.", fx = { align = { honor = -1 } } },
        { text = "We beat them by gathering more, not by ambush.", next = "BACK", reply = "Honourable, and the Circle would agree. Gather fast, then, and let the dwarves eat our dust.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have scouted for the Horde since Thrall freed us from the camps, and that is all you need to know." } },
    advice = { { id = "tp_ad", text = "Move at dawn and dusk. The sun kills more fools than the bugs do." } },
    _none = { { id = "tp_none", text = "I do not know that. I know the sands, and who walks them." } },
  },
}

---------------------------------------------------------------------------
-- Ralo'shan the Eternal Watcher
---------------------------------------------------------------------------
P:NPC {
  key = "raloshan", id = TODO_NPC("Ralo'shan the Eternal Watcher"), name = "Ralo'shan the Eternal Watcher",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest",
  communities = { "silithus_wilds" }, temper = { "grave", "calm" }, values = { "duty", "wise" },
  notices = { "race", "priest" , "class" },
  impression = {
    first = "She has been slain a hundred times and always wakes here.",
    third = "{name} met Ralo'shan the Eternal Watcher, the night elf bound to Staghelm Point.",
  },
  greetings = {
    { id = "g_default", text = "It was here, nearly a thousand years past, that the Qiraji began their march. I remember it, and I am still here." },
    { id = "g_back", when = { metBefore = true }, text = "You return to this place. Few do, unless they are bound to it, as I am." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah, child of the kaldorei. You will know the name Staghelm, and perhaps the name of the young one who fell before the Wall." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "You tend the dead and the dying, I think. Then perhaps you understand a little of what it is to be denied rest." },
    { id = "n_b1", cat = "class", when = { class = "DRUID" },
      text = "A druid. It was your order's elders who raised the Wall, and it was their grief I watched from this very sand." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Ralo'shan, and I watch. Thousands died in this desert during the war, most of them here in the first days of the invasion, and I am one of the few who remain, chained to the past and the present both." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A child of the Earth Mother. Your people did not walk this land when the swarm came, but the land remembers, and so do I." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. I have nothing but time." },
        { id = "h_again2", text = "Speak. The sand listens, and so do I." },
        { id = "h_again_b1", text = "Ask again, if you wish. I have answered the wind for a thousand years, and it asks less well than you." },
      },
      choices = {
        { text = "Chained? How do you know?", next = "chained" },
        { text = "Tell me of the war.", next = "war" },
        { text = "Why do you stay here?", next = "stay" },
        { text = "You speak like a ghost, not a sentinel.", next = "ghost" },
        { text = "These ruins were a kaldorei post once.", next = "post" },
        { text = "Tell me of Staghelm's son.", next = "valstann", when = { race = "NightElf" } },
        { text = "What did the druids call upon in that war?", next = "dragons", when = { class = "DRUID" } },
        { text = "Rest well, watcher.", next = "END" },
      },
    },
    chained = {
      lines = { { id = "ch_default", text = "I have been slain a hundred times, and I always wake here, alive. Some say I am cursed, and others say otherwise." } },
      choices = {
        { text = "What do the others say?", next = "blessed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blessed = {
      lines = { { id = "bl_default", text = "They say I am blessed, a herald kept here to see a new age arrive. I do not know which of them is right, and I have stopped asking." } },
      choices = {
        { text = "And what do you say?", next = "stir" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stir = {
      big = true,
      lines = { { id = "st_default", text = "I say that ancient forces stir, forces unseen for thousands of years, and that the world feels it. Even the Dream is troubled, and its nightmares seep into waking hours. Whether I am cursed or blessed, I am here to watch it come." } },
      choices = {
        { text = "Then we stand against it, whatever it is.", next = "BACK", reply = "Brave words. Many spoke them here a thousand years ago, and some of them meant it. I hope you are among those.", fx = { align = { light = 1 } } },
        { text = "Some things are too old to fight. Better to survive them.", next = "BACK", reply = "Perhaps. I have survived a hundred deaths, and I cannot tell you it is better. It is only longer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "wa_default", text = "The swarm came out of the south like a sandstorm with teeth. The Sentinels held where they could, and the druids called upon powers no one has dared since, and at the end the Bronze Flight and its kin bound the swarm behind the Wall." } },
      choices = {
        { text = "And the Wall still holds?", next = "wall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wall = {
      lines = { { id = "wl_default", text = "It holds. The Circle watches it from the Hold, and I watch from here, and the sand watches us all. Do not go near it lightly, young one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stay = {
      lines = { { id = "sa_default", text = "I do not know why I must remain, only that I must. When I have tried to walk away, the desert brings me back, and so I have stopped trying." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ghost = {
      lines = { { id = "gh_default", text = "Perhaps I am both. A ghost would not feel the sun, and I feel it every day, so I suppose I am still a sentinel, for all the good it does me." } },
      choices = {
        { text = "It does good. Someone must remember.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    post = {
      lines = {
        { id = "b_post_default", text = "Southwind Village stood where you see broken stone, and it was a living place, with lamps and children and a moonwell. The swarm took it in a night, and I have listened to the silence there ever since." },
      },
      choices = {
        { text = "Did anyone escape that night?", next = "post_escape" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_escape = {
      lines = {
        { id = "b_post_escape_default", text = "A few, who ran north while the Sentinels held the paths. I was among those who held, and so I can tell you who lived only by counting the ones I did not see fall." },
      },
      choices = {
        { text = "You bought their lives with your own.", next = "post_bought" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_bought = {
      lines = {
        { id = "b_post_bought_default", text = "So I believed as the sand closed over me. Then I woke, and the village was gone, and I have never learned whether the bargain was honoured or merely forgotten." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    valstann = {
      lines = {
        { id = "b_valstann_default", text = "Valstann Staghelm was brave and young, and he begged his father to let him hold Southwind. The Qiraji took him alive, and they brought him before our lines so that the Archdruid might watch what they did." },
      },
      choices = {
        { text = "I'm sorry. No father should see that.", next = "valstann_after" },
        { text = "That is why Staghelm is as he is.", next = "valstann_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valstann_after = {
      lines = {
        { id = "b_valstann_after_default", text = "Fandral was a different elf after that day. He shattered the Scepter of the Shifting Sands in his rage and walked away from all who had fought beside him, and I do not think he has ever walked back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons = {
      lines = {
        { id = "b_dragons_default", text = "They called upon the dragons, child, when every other hope had failed. The bronze flight came, and then the others, and the sky burned for days above the gates of Ahn'Qiraj." },
      },
      choices = {
        { text = "And then the Wall was raised.", next = "dragons_wall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons_wall = {
      lines = {
        { id = "b_dragons_wall_default", text = "With roots and stone and the power of the Aspects' children, some of whom never came out from behind it. The Scarab Wall is a wound sewn shut, {class}, and it has never been a victory." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a sentinel when the swarm came. I am a sentinel still, though no one has relieved me in a thousand years." } },
    advice = { { id = "tp_ad", text = "Remember the dead of this place. They held so that you could live." } },
    ahn_qiraj = { { id = "tp_b_ahn_qiraj", text = "The city lies beyond the Wall, and what dwells in it has had a thousand years to mend. I feel it at night, like a pulse under the sand." } },
    southwind = { { id = "tp_b_southwind", text = "It was my post and my home. Now the silithid crawl over its stones, and the spirits of those who fell there know no more rest than I do." } },
    bronze_dragonflight = { { id = "tp_b_bronze_dragonflight", text = "Anachronos led them when the kaldorei begged for aid. I saw him once, against the sun, and I have not forgotten the size of his shadow." } },
    _none = { { id = "tp_none", text = "That is not a thing I have watched. I watch this place, and nothing else." } },
  },
}
