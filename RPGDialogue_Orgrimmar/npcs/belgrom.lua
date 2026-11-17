-- Belgrom Rockmaul, outside the warriors' hall in the Valley of Honor. Voice: bibles/belgrom.md
-- A boastful orc commander with agents all over Kalimdor, one very expensive mistake, and no gift for admitting it.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "belgrom", id = TODO_NPC("Belgrom Rockmaul"), name = "Belgrom Rockmaul",
  bible = "bibles/belgrom.md", role = "soldier", tier = "quest",
  communities = { "orgrimmar" }, temper = { "proud" }, values = { "proud", "ambitious" },
  notices = { "kit", "class" },
  impression = {
    first = "Belgrom Rockmaul talks about the Warchief's ear and his agents across Kalimdor as though he holds the Horde together himself. An elf mage played him for a fool in Azshara, and it is still eating at him.",
    third = "{name} met Belgrom Rockmaul in the Valley of Honor, a boastful orc commander who sends agents across Kalimdor and was betrayed by an elf mage.",
  },

  greetings = {
    { id = "g_valley", text = "Make it quick, {class}. Thrall may want my counsel at any moment, and I don't keep the Warchief waiting." },
    { id = "g_betrayed", when = { questActive = TODO_QUEST("Betrayed") }, text = "Ag'tor is waiting for you at Valormok. Go, and don't come back with excuses." },
    { id = "g_swarm", when = { questActive = TODO_QUEST("The Swarm Grows") }, text = "Is that Korran's seal I see? Hand it over, then, and let's see what the troll has to say." },
    { id = "g_away", when = { away = 14 }, text = "{away} away, and you come back looking for work, I suppose. Everyone does, sooner or later." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 10 }, text = "You've grown since I last saw you, and I suppose I've had a hand in that. Most of the strong ones in this city have passed through my errands once." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "Word is you've been throwing your weight around the city. Throw it at the Horde's enemies, not at its shopkeepers." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at that armor, it's held together by grime. Get it to a smith before you embarrass me in front of the Warchief's guard." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Good, because the warriors' hall behind me is where the Horde's real work begins, whatever the shamans tell you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Belgrom Rockmaul. I'd travel in the Warchief's name, but Thrall needs me here in the city, and he asks my opinion often. My agents watch half of Kalimdor for him, from the Barrens to the coast of Azshara." },
        { id = "h_betrayed_before", when = { questBefore = TODO_QUEST("Betrayed") },
          text = "That thieving elf! I may have made a grave mistake, {name}. She promised riches from the ruins of Azshara if I sent warriors to guard her diggers, and now she's killed them, every one, and I can't afford to send more." },
        { id = "h_betrayed_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Betrayed"), days = 5 } },
          text = "Ag'tor sends word you've been a help at Valormok. Good, because I want that elf's head before anyone in the Valley of Strength starts calling me a fool to my face." },
        { id = "h_swarm_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Swarm Grows"), days = 5 } },
          text = "Korran's insects are worse than I thought, and I don't say that often. I'll see the Warchief hears of it, and he'll hear it was my troll who found them." },
        { id = "h_kolkar", when = { questActive = TODO_QUEST("Regthar Deathgate") },
          text = "Regthar Deathgate holds the line against the Kolkar west of the Crossroads. Go to him, and tell him Belgrom sent you, because he'll want to know." },
      },
      again = {
        { id = "h_again", text = "Well? What else?" },
        { id = "h_again2", text = "Go on, I'm listening, but not for long." },
      },
      choices = {
        { text = "What happened with the elf?", next = "elf" },
        { text = "Who are these agents of yours?", next = "agents" },
        { text = "Does the Warchief really ask your opinion?", next = "warchief" },
        { text = "I'm a warrior. What does the hall behind you teach?", next = "hall", when = { class = "WARRIOR" } },
        { text = "I've seen the insects Korran writes about.", next = "silithid", when = { questDone = TODO_QUEST("The Swarm Grows") } },
        { text = "What work do you have?", next = "BUSINESS" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    elf = {
      lines = { { id = "e_default", text = "Magus Rimtori, she called herself, and she said the old elf ruins in Azshara were full of treasure and power. All I had to do was lend her a few warriors to guard her diggers, and I'd share in what they found." } },
      choices = {
        { text = "And you believed her?", next = "elf_believed" },
        { text = "What happened to the warriors?", next = "elf_dead" },
      },
    },
    elf_believed = {
      lines = { { id = "eb_default", text = "Anyone would have! She had papers and maps and a voice like warm honey, and the Horde could use a little treasure. I'm not the first orc fooled by an elf, and I won't be the last." } },
      choices = {
        { text = "What happened to the warriors?", next = "elf_dead" },
        { text = "Something else, Belgrom.", next = "BACK" },
      },
    },
    elf_dead = {
      big = true,
      lines = { { id = "ed_default", text = "Once her diggers had what they wanted, she turned her spells on my warriors, and the survivors at Valormok are counting graves. I want her dead, {name}, and I want it before the whole Valley knows how badly she played me." } },
      choices = {
        { text = "Those warriors deserve justice, not your reputation.", next = "BACK", fx = { affinity = -1, align = { honor = 1 }, learn = { "rimtori" } } },
        { text = "Vengeance is vengeance. I'll see her dead.", next = "BACK", fx = { affinity = 1, align = { honor = -1 }, learn = { "rimtori" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "rimtori" } } },
      },
    },
    agents = {
      lines = { { id = "ag_default", text = "Korran at the Crossroads watches the Barrens for me, Moktar Krin hunts dwarves and bugs in the Needles, and Rok Orhan is breaking ogres in Feralas. If something stirs in Kalimdor, one of mine sees it first, and then I see it." } },
      choices = {
        { text = "Korran? What's he watching for?", next = "korran" },
        { text = "That's a lot of eyes for one orc.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    korran = {
      lines = { { id = "ko_default", text = "Insects, if you can believe it, big ones crawling up out of the ground at the Field of Giants. I thought he was chasing beetles, but his letters keep getting more worried, and Korran isn't a troll who frightens easily." } },
      choices = {
        { text = "Then perhaps you should listen to him.", next = "BACK", fx = { learn = { "silithid" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warchief = {
      lines = { { id = "w_default", text = "Often! He'd have me out in the field, but he needs me here, where I can tell him what my agents see before it reaches the rest of his advisers. Thrall values a commander who gets things done." } },
      choices = {
        { text = "Then tell him about the elf, before someone else does.", next = "tell" },
        { text = "I'm sure he values you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    tell = {
      lines = { { id = "te_default", text = "And have him think I can't judge a mage from a merchant? No. When the elf's dead, I'll tell him the whole story, and it'll end with her head, which makes it a much better story." } },
      choices = {
        { text = "Hiding a mistake from your Warchief isn't honest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wise. Tell him when it's finished, not before.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall = {
      lines = { { id = "ha_default", text = "How to hold a line when everything says run, and how to swing an axe so the grunt behind you doesn't lose an ear. The rest you learn by bleeding, and the Barrens will teach you plenty of that." } },
      choices = { { text = "I'll do my bleeding gladly.", next = "BACK", fx = { affinity = 1 } } },
    },
    silithid = {
      lines = { { id = "si_default", text = "Then you know Korran wasn't exaggerating, and I'm glad I trusted him. Keep your eyes open in the south, because if there are more of these things under the earth, the Warchief will need to know it quickly." } },
      choices = { { text = "I'll keep watch.", next = "BACK", fx = { affinity = 1, learn = { "silithid" } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've served the Horde since before this city had walls, and now I serve the Warchief at his ear. That's all the story you need." } },
    advice = { { id = "tp_ad", text = "Have agents everywhere, and make sure they write often. Half my letters already arrive chewed by the wind riders, so I need the other half." } },
    rimtori = { { id = "tp_rim", text = "Don't say that name too loudly in this valley. When she's dead, I'll say it myself, and gladly." } },
    silithid = { { id = "tp_sil", text = "Korran's bugs. I thought it was nothing, and I've been told it's something, and I'm not too proud to change my mind about bugs." } },
    thrall = { { id = "tp_thrall", text = "The Warchief relies on me to know what's happening across Kalimdor, and I don't intend to disappoint him again. I won't make the same mistake twice, I'll tell you that." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar and the Galak and their cousins in Desolace are all the same breed, and they're all trouble. My agents watch them, and I watch my agents." } },
    onyxia = { { id = "tp_onyxia", text = "There's a black dragon in Dustwallow Marsh, and my agents say she's got her claws in more than her own swamp. I don't know what that means yet, and I don't like not knowing." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages are rebuilding their city, and they're not letting anyone through the gates. If an elf mage could fool me in Azshara, I can only guess what the Kirin Tor are hiding." } },
    _none = { { id = "tp_none", text = "Not my concern. If it mattered, one of my agents would have told me already." } },
  },
}
