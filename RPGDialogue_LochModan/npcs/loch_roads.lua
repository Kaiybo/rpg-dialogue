-- Loch Modan between the towns: the towers, Algaz Station, the loch shore. Voice: bibles/loch_roads.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "stormpike_mtn", id = TODO_NPC("Mountaineer Stormpike"), name = "Mountaineer Stormpike",
  bible = "bibles/loch_roads.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "gruff" }, values = { "dutiful" },
  notices = { "class" },

  impression = {
    first = "Mountaineer Stormpike guards the Loch with a scowl and a long memory, and he'll tell you about his exploits before you ask.",
    third = "{name} met Mountaineer Stormpike, a grumpy but able Mountaineer of Loch Modan.",
  },

  greetings = {
    { id = "g_post", text = "State yer business, and be quick about it. The kobolds don't wait for pleasantries." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, I've work, and you've the look of someone who finishes it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mountaineer Stormpike, and I've held this valley against worse than kobolds in my day. Still, the vermin in the Silver Stream Mine have got to go, and I've only two hands." },
        { id = "h_paws", when = { questActive = TODO_QUEST("Filthy Paws") },
          text = "The kobolds took our mining gear into the Silver Stream Mine, up north. Get it back before they dull every pick we own." },
        { id = "h_order", when = { questActive = TODO_QUEST("Stormpike's Order") },
          text = "My orders are sealed, so don't go reading them on the road. Get them where they need to go, and fast." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up." },
        { id = "h_again2", text = "Ask yer question, but keep it short; the Loch road needs watchin'." },
      },
      choices = {
        { text = "What's happening at the Silver Stream Mine?", next = "mine" },
        { text = "Kadrell says you have stories.", next = "stories" },
        { text = "How do you see the Loch these days?", next = "loch" },
        { text = "A warrior reporting, Mountaineer. Where do you want me?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    mine = {
      lines = { { id = "m_default", text = "Kobolds drove the miners out and took the tools with them, the filthy little thieves. Every day that mine sits idle, Ironforge's forges go a bit hungrier." } },
      choices = {
        { text = "Why not send the Mountaineers in?", next = "mine_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine_why = {
      lines = { { id = "mw_default", text = "Because the troggs keep us busy at every gate, and Dun Algaz eats men like bread. So I hire strangers, and I don't apologise for it." } },
      choices = {
        { text = "Hiring strangers is how the Loch stays free. Good.", next = "mine_end", fx = { align = { order = -1 } } },
        { text = "The King should send more soldiers, not rely on strays.", next = "mine_end", fx = { align = { order = 1 } } },
        { text = "What happens when the mine's clear?", next = "mine_end" },
      },
    },
    mine_end = {
      lines = { { id = "me_default", text = "Then the miners go back, the ore flows, and I find somethin' else to grumble about. That's how it goes in the Loch." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    stories = {
      lines = { { id = "s_default", text = "Kadrell talks too much, but he's no' wrong. I fought orcs in this valley in the Second War, when they held the dam and we took it back stone by stone." } },
      choices = {
        { text = "What was that like?", next = "stories_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stories_war = {
      lines = { { id = "sw_default", text = "Cold, loud and long, and I'll no' dress it up for ye. The Loch remembers it, though, if ye look at the broken catapults on the bottom." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    loch = {
      lines = { { id = "l_default", text = "Troggs to the south, kobolds to the north and Dark Irons sniffin' round the dam. It's a fine place, mind, and that's why it's worth the trouble." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "w_default", text = "At the mine's mouth, with yer shield up and yer mouth shut. I like ye already." } },
      choices = { { text = "Understood, Mountaineer.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not my concern. Ask someone with less to do." } },
  },
}

P:NPC {
  key = "cobbleflint", id = TODO_NPC("Mountaineer Cobbleflint"), name = "Mountaineer Cobbleflint",
  bible = "bibles/loch_roads.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Mountaineer Cobbleflint holds the south tower over the Badlands road, and he wants the troggs thinned out before they come over the wall.",
    third = "{name} met Mountaineer Cobbleflint at the south gate of Loch Modan.",
  },

  greetings = {
    { id = "g_tower", text = "Welcome to the south gate, friend. Keep yer weapon handy, for the troggs don't knock." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the gate, are ye? Good. The troggs have been busy, and so should you be." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mountaineer Cobbleflint, and this tower watches the pass south to the Badlands. The troggs swarm the hills round here like ants on a dropped pie." },
        { id = "h_def", when = { questActive = TODO_QUEST("In Defense of the King's Lands") },
          text = "Stonesplinter troggs, out in the hills round the gate. Thin them out for me, and the King's Lands will be a bit safer tonight." },
        { id = "h_done", when = { questDone = TODO_QUEST("In Defense of the King's Lands") },
          text = "The hills are quieter since ye went through them, and my lads are sleepin' sound for once." },
      },
      again = {
        { id = "h_again", text = "Somethin' else, friend?" },
        { id = "h_again2", text = "Ask away. The gate's no' goin' anywhere." },
      },
      choices = {
        { text = "Where do the troggs come from?", next = "troggs" },
        { text = "What's south of here?", next = "south" },
        { text = "Who else holds this gate?", next = "people" },
        { text = "The troggs took my home too.", next = "gnome", when = { race = "Gnome" } },
        { text = "Stay safe, Mountaineer.", next = "END" },
      },
    },
    troggs = {
      lines = { { id = "t_default", text = "From under the earth, and the Explorers' League says from somewhere older still. All I know is they keep comin', and they don't stop to talk." } },
      choices = {
        { text = "What does the League know about them?", next = "troggs_league" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs_league = {
      lines = { { id = "tl_default", text = "Ironband's dig near the dam turned up more of them than old stones, so ask him. He'll talk yer ear off about Titans, but there's sense in it somewhere." } },
      choices = {
        { text = "They're beasts. Kill them and be done with it.", next = "troggs_end", fx = { align = { light = -1 } } },
        { text = "If they're kin to us somehow, we should learn why.", next = "troggs_end", fx = { align = { light = 1 } } },
        { text = "And what do you think?", next = "troggs_end" },
      },
    },
    troggs_end = {
      lines = { { id = "te_default", text = "I think a Mountaineer's job is to hold the gate, and the scholars can argue over the bodies. That's enough philosophy for one day." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } } },
    },
    south = {
      lines = { { id = "s_default", text = "The Badlands, dry as an old beard and full of ogres and worse. Prospectors go down there lookin' for riches, and most come back lookin' for water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    people = {
      lines = { { id = "p_default", text = "Captain Rugelfuss commands here, and he's sharper than he looks. The rest of us are just good dwarves with long watches." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Aye, and I'm sorry for it. Gnomeregan's troggs and ours might be the same brood, so every one ye put down here is a bit of payback." } },
      choices = { { text = "Then I'll put down plenty.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Can't help ye there. Ask in Thelsamar." } },
  },
}

P:NPC {
  key = "rockgar", id = TODO_NPC("Mountaineer Rockgar"), name = "Mountaineer Rockgar",
  bible = "bibles/loch_roads.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "sharp" }, values = { "dutiful" },
  notices = { "class" },

  impression = {
    first = "Mountaineer Rockgar holds Algaz Station at the north pass, where Loch Modan gives way to the Wetlands and the Dragonmaw.",
    third = "{name} met Mountaineer Rockgar, who commands the pass at Algaz Station.",
  },

  greetings = {
    { id = "g_pass", text = "Halt, and let me see yer face. Right, ye're no' an orc, so come in." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. Still in one piece, I see, which is more than I can say for the last runner." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mountaineer Rockgar, and this is Algaz Station, the last friendly roof before the Wetlands. North of here there's trolls in the hills, orcs in the marsh and mud up to yer knees." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Mountaineer Rockgar") },
          text = "Kadrell sent ye, did he? Good, I've been short of able hands since the pass got busy." },
      },
      again = {
        { id = "h_again", text = "Anythin' else before ye head north?" },
        { id = "h_again2", text = "Speak up. The wind takes half of what ye say up here." },
      },
      choices = {
        { text = "What's the danger in the pass?", next = "pass" },
        { text = "What's in the Wetlands?", next = "wetlands" },
        { text = "How long have you held this station?", next = "station" },
        { text = "I'm a hunter. I can scout the pass.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Farewell, Rockgar.", next = "END" },
      },
    },
    pass = {
      lines = { { id = "p_default", text = "Mosshide gnolls and troggs crawl up from the Wetlands side, and they pick off travellers who come through alone. I keep the gate, but I can't watch every rock." } },
      choices = {
        { text = "How do you hold it with so few?", next = "pass_few" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pass_few = {
      lines = { { id = "pf_default", text = "Stubbornness, mostly, and a good wall. Ironforge sends what it can, but Gnomeregan and the Dark Irons take the rest." } },
      choices = {
        { text = "Ironforge should hold its borders before anything else.", next = "pass_end", fx = { align = { honor = 1 } } },
        { text = "Then cut what corners you must to survive.", next = "pass_end", fx = { align = { honor = -1 } } },
        { text = "What do you need most?", next = "pass_end" },
      },
    },
    pass_end = {
      lines = { { id = "pe_default", text = "Hands, and ye've got two of them. Travel the pass in pairs if ye can, and keep to the road." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wetlands = {
      lines = { { id = "w_default", text = "Menethil Harbor on the far coast, and the Dragonmaw orcs at Grim Batol behind it. Between them, there's crocolisks the size of rowboats." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    station = {
      lines = { { id = "s_default", text = "Long enough to know every stone on that wall by its first name. It's a cold post, but it's an honest one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Do that and I'll owe ye a pint in Thelsamar. Watch the ridges, for that's where they wait." } },
      choices = { { text = "I'll keep to the high ground.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Can't say I know. I've been up this pass too long to keep up with gossip." } },
  },
}

P:NPC {
  key = "bingles", id = TODO_NPC("Bingles Blastenheimer"), name = "Bingles Blastenheimer",
  bible = "bibles/loch_roads.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "eager" }, values = { "curious" },
  notices = { "race" },

  impression = {
    first = "Bingles Blastenheimer is a gnome camped by the loch who has managed to lose almost every one of his tools at once.",
    third = "{name} met Bingles Blastenheimer, a scattered gnome tinkerer camped by the waters of Loch Modan.",
  },

  greetings = {
    { id = "g_camp", text = "Oh! Oh, hello! Have you seen a wrench? Or a hammer? Or anything at all, really?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Splendid, and I've only lost two more things since you left." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bingles Blastenheimer, inventor, and I'm on a very important expedition for Gnoarn. Unfortunately, my supplies have wandered off around the loch, and I can't do a thing without them." },
        { id = "h_find", when = { questActive = TODO_QUEST("Find Bingles") },
          text = "Gnoarn sent you? Oh, wonderful, he does worry so, and I'm perfectly fine apart from the tools." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Bingles' Missing Supplies") },
          text = "My wrench, my hammer, my screwdriver and my blastencapper, scattered all over the loch! Find them and you'll be a hero of science." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm listening, mostly." },
        { id = "h_again2", text = "Yes, yes, what is it? I've a theory brewing." },
      },
      choices = {
        { text = "How did you lose everything?", next = "lost" },
        { text = "What are you researching?", next = "research" },
        { text = "Who is Gnoarn?", next = "gnoarn" },
        { text = "A gnome on an expedition? Where's your escort?", next = "gnome", when = { race = "Gnome" } },
        { text = "Good luck, Bingles.", next = "END" },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "A small incident with an explosive and a very loud noise, and then a lot of murlocs were involved. I'd rather not talk about the murlocs." } },
      choices = {
        { text = "Murlocs took your tools?", next = "lost_murlocs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_murlocs = {
      lines = { { id = "lm_default", text = "Some of them, and the rest are lying about the shore where the blast threw them. Murlocs love shiny things, you see, and my tools are very shiny." } },
      choices = {
        { text = "Then the murlocs are thieves. They'll answer for it.", next = "lost_end", fx = { align = { order = 1 } } },
        { text = "You blew up their shore first. Fair's fair.", next = "lost_end", fx = { align = { order = -1 } } },
        { text = "Where should I start looking?", next = "lost_end" },
      },
    },
    lost_end = {
      lines = { { id = "le_default", text = "Along the water to the south, I think, though I wasn't paying close attention while I was flying through the air. Bring back whatever you can find." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    research = {
      lines = { { id = "r_default", text = "The loch, the dam, the troggs, the water pressure, everything! When you've lost a city, you start studying the ground very closely." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },
    gnoarn = {
      lines = { { id = "g_default", text = "My colleague in Tinker Town, and he's convinced I'll blow myself up one day. He's very nearly right, which is why I don't tell him things." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Escort? Oh, cousin, the budget barely covered the explosives. You'll be my escort now, if you like." } },
      choices = { { text = "I suppose I will.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Hmm, fascinating, but I have no idea. Ask me again after I've found my notes." } },
  },
}
