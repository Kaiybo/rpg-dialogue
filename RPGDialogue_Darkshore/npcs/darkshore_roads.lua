-- Darkshore off the road: Balthule Shadowstrike watching the Tower of Althalaxx for Delgren the Purifier,
-- and Sentinel Tysha Moonblade on the road west of Ameth'Aran. Classic only.
-- Voice: bibles/darkshore_roads.md
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Balthule Shadowstrike
---------------------------------------------------------------------------
P:NPC {
  key = "balthule", id = TODO_NPC("Balthule Shadowstrike"), name = "Balthule Shadowstrike",
  bible = "bibles/darkshore_roads.md", role = "questgiver", tier = "quest",
  communities = { "darkshore_wilds" }, temper = { "watchful", "earnest" }, values = { "dutiful", "devout" },
  notices = { "class", "stealth" },

  impression = {
    first = "Balthule Shadowstrike crouches in the brush below the Tower of Althalaxx and has not gone home because he's afraid of missing something. He speaks of a human paladin, Delgren, as his master, and of the Light with the shy pride of a new convert.",
    third = "{name} met Balthule Shadowstrike, a night elf scout watching the Dark Strand cult at the Tower of Althalaxx for Delgren the Purifier.",
  },

  greetings = {
    { id = "g_hello", text = "Down, quickly, before they see you from the tower! Good. Now, who sent you?" },
    { id = "g_back", when = { metBefore = true }, text = "Keep your head low, friend. They've doubled the watch on the tower since you were last here." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Tower of Althalaxx") },
      text = "Elissa sent you after me, didn't she? I owe her an apology for my silence, and you a thank-you for the walk." },
  },

  notice = {
    { id = "n_pala", cat = "class", when = { class = "PALADIN" },
      text = "A paladin! Then you're one of Delgren's sort, and I could weep for the help. Light be with you, as he taught me to say." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I didn't hear you come, and I've been listening for days. The cultists won't hear you either, which is the best news I've had all week." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Balthule Shadowstrike, and I'm watching the Tower of Althalaxx for my master, Delgren the Purifier. A company of warlocks has taken the tower and the ground around it, and I don't yet know what they want." },
        { id = "h_parch", tags = { "news" }, when = { questActive = TODO_QUEST("The Tower of Althalaxx") },
          text = "The warlocks carry scraps of parchment, orders or notes, I can't tell, and I've collected a few already. Bring me more, but don't go into the tower itself, because what's inside is beyond the two of us." },
        { id = "h_pala", when = { class = "PALADIN" },
          text = "A paladin of the Light, here at the tower! Delgren told me his order would send more of you one day, and I confess I didn't believe him." },
        { id = "h_nelf_pri", when = { race = "NightElf", class = "PRIEST" },
          text = "A priestess of Elune, or a priest, forgive me, the light's poor here. You may think me strange, a kaldorei learning a human faith, but I've found the two don't argue as much as you'd expect." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down when you ask it." },
        { id = "h_again2", text = "Go on. The tower isn't going anywhere, more's the pity." },
      },
      choices = {
        { text = "Who are these warlocks?", next = "cult" },
        { text = "A night elf serving a human paladin?", next = "delgren" },
        { text = "Why not go back to Auberdine and report?", next = "stay" },
        { text = "What does the Light mean to you?", next = "light" },
        { text = "What did the parchments say?", next = "parchment", when = { questDone = TODO_QUEST("The Tower of Althalaxx") } },
        { text = "I'll keep my head down.", next = "END" },
      },
    },

    cult = {
      lines = { { id = "cu_default", text = "They call themselves the Dark Strand, and they've the look of Highborne leftovers about them, robed and proud and far too fond of fel fire. The tower was a Highborne place once, so perhaps they think it owes them something." } },
      choices = {
        { text = "Kaldorei, practising fel magic again?", next = "cult_kal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult_kal = {
      lines = { { id = "ck_default", text = "Some of them, yes, and that's what frightens me most. We swore off the arcane ten thousand years ago because of what it did to us, and here they are, a day's walk from Auberdine, lighting the old fires again." } },
      choices = {
        { text = "Then they must be stopped, whatever it costs.", next = "BACK", reply = "It may cost a great deal, {class}, and I would rather it cost them than us. Still, I hope it does not come to blades.", fx = { align = { order = 1 }, learn = { "dark_strand" } } },
        { text = "They chose their path. Watch them, but don't start a war.", next = "BACK", reply = "That is wise, and probably what Delgren would say too. I will keep watching, and you keep listening.", fx = { align = { order = -1 }, learn = { "dark_strand" } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    delgren = {
      lines = { { id = "de_default", text = "He came to Ashenvale with a company of paladins to fight demons and undead, and he asked the Sentinels for a scout who knew the northern woods. They sent me, mostly to be rid of me, I think, and I've learned more from him in a season than in a century of patrols." } },
      choices = {
        { text = "What has he taught you?", next = "light" },
        { text = "Do the Sentinels mind?", next = "delgren_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    delgren_mind = {
      lines = { { id = "dm_default", text = "Some of the elder ones think I've forgotten Elune, and they say so, usually when I'm in earshot. I haven't forgotten her at all, but Delgren speaks to me as an equal, and the elders never once have." } },
      choices = {
        { text = "Good teachers earn loyalty. You chose well.", next = "BACK", reply = "They do, and I would choose him again a hundred times. He taught me to read a trail by moonlight when I could barely hold a bow.", fx = { align = { honor = 1 } } },
        { text = "Your elders have a point. Remember who you are.", next = "BACK", reply = "They do, I suppose, and I have never truly forgotten. But my elders never sat up with me through a fever, and he did.", fx = { align = { honor = -1 } } },
      },
    },

    stay = {
      lines = { { id = "st_default", text = "Because the day I leave will be the day they do something worth seeing, and I'll have missed it. Elissa will be cross, I know, and she'll be right to be." } },
      choices = {
        { text = "Duty first. A report late is a report wasted.", next = "BACK", reply = "You are probably right, and Elissa would agree with you. I will send the report, and stay a little longer anyway.", fx = { align = { order = 1 } } },
        { text = "You're right to stay. Trust your instincts.", next = "BACK", reply = "Thank you, though Elissa will be cross with both of us. I want to see what they do when they think no one is watching.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    light = {
      lines = { { id = "li_default", text = "That there's something in us that can stand against the dark without needing the moon to be up. Delgren says the Light and Elune may be two faces of the same thing, and I've no idea if that's true, but I like that he wonders about it." } },
      choices = {
        { text = "Faith is faith. The name matters less.", next = "BACK", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    parchment = {
      lines = { { id = "pa_default", text = "Pieces of a ritual, and names, and a place far to the south where they meant to gather. Delgren will make more sense of it than I can, so my letter goes to him at Maestra's Post, far south in Ashenvale, and the sooner the better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Sentinel Tysha Moonblade
---------------------------------------------------------------------------
P:NPC {
  key = "tysha", id = TODO_NPC("Sentinel Tysha Moonblade"), name = "Sentinel Tysha Moonblade",
  bible = "bibles/darkshore_roads.md", role = "soldier", tier = "quest",
  communities = { "darkshore_wilds" }, temper = { "steady", "dry" }, values = { "dutiful", "curious" },
  notices = { "class", "race" },

  impression = {
    first = "Sentinel Tysha Moonblade stands guard on the road west of Ameth'Aran and admits, with a soldier's honesty, that the ruin's ghosts drove her off. She'd rather you read its tablets than she did.",
    third = "{name} met Sentinel Tysha Moonblade by the road near Ameth'Aran, who sent them to read the tablets of the haunted ruin.",
  },

  greetings = {
    { id = "g_hello", text = "Hold a moment on the road, {class}. You're headed toward Ameth'Aran, and I'd like a word before you go." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the ruins, or still working up the nerve? I'll not judge either way." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Fall of Ameth'Aran") },
      text = "You read both tablets and came back with your wits. That's more than I managed." },
  },

  notice = {
    { id = "n_pri", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You've a blessed look about you. The spirits in Ameth'Aran may not care for it, though, so don't count on it to keep them off." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "The ruins are our people's, sister or brother, and the dead in them were kaldorei once. Remember that, even when they're trying to kill you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Sentinel Tysha Moonblade. To the east lie the ruins of Ameth'Aran, where Azshara's servants once worked their magic freely, and where their restless spirits still walk." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Fall of Ameth'Aran") },
          text = "There are two great tablets in the ruins, one telling the Lay of Ameth'Aran and one telling of its fall. Read them both and tell me what they say, because the spirits came for me before I'd finished either." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Fall of Ameth'Aran") },
          text = "A city that wanted more magic than the world could give it, and was given more than it could hold. I'll be thinking on that through a long watch, I suspect." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage, walking toward Ameth'Aran. I hope you're going there to learn what not to do, {class}, because the ruins teach that lesson very well." },
      },
      again = {
        { id = "h_again", text = "Anything else before you go east?" },
        { id = "h_again2", text = "Ask, then. The road is quiet today, for once." },
      },
      choices = {
        { text = "What happened at Ameth'Aran?", next = "ruin" },
        { text = "The spirits drove you off?", next = "spirits" },
        { text = "Why does it matter what the tablets say?", next = "why" },
        { text = "What did the tablets tell you, in the end?", next = "after", when = { questDone = TODO_QUEST("The Fall of Ameth'Aran") } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    ruin = {
      lines = { { id = "ru_default", text = "It was a Highborne town, before the Sundering, full of Azshara's favourites and their arts. When the Well was destroyed, the magic they'd built their lives on tore loose, and the ones who died there never found their way to rest." } },
      choices = {
        { text = "Do you pity them?", next = "pity" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pity = {
      lines = { { id = "pi_default", text = "Some days I do, because plenty of them were only servants and scribes who never chose anything. Other days I remember what Azshara's court did to the rest of us and I can't find much pity at all." } },
      choices = {
        { text = "Servants or not, they shared the blame.", next = "BACK", reply = "Perhaps they did, and the Sentinels would agree with you. Still, I cannot help pitying the scribes.", fx = { align = { light = -1 }, learn = { "highborne" } } },
        { text = "The dead deserve rest, whatever they did.", next = "BACK", reply = "They do, I suppose, though the ruins will not let them have it. Some nights I hear them weeping from the road.", fx = { align = { light = 1 }, learn = { "highborne" } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    spirits = {
      lines = { { id = "sp_default", text = "They came up out of the stones while I was reading, cold and angry, and I ran. I'm a Sentinel, not a priestess, and I'd sooner face a dozen furbolgs than one thing my arrows go straight through." } },
      choices = {
        { text = "No shame in running from that.", next = "BACK", fx = { affinity = 1 } },
        { text = "A Sentinel shouldn't run from anything.", next = "spirits_run" },
      },
    },
    spirits_run = {
      lines = { { id = "sr_default", text = "A dead Sentinel guards nothing, {class}, and I've a road to watch. If you think yourself braver, the ruins are just east of here and they'll be glad of the company." } },
      choices = {
        { text = "Courage means standing your ground.", next = "BACK", reply = "It does, and I will stand mine, but on this road and not in those ruins. Someone has to warn the travellers.", fx = { align = { honor = 1 } } },
        { text = "You're right. Living to fight again is smarter.", next = "BACK", reply = "It is, and I am glad you understand. My sisters already have too many names to sing at the shrine.", fx = { align = { honor = -1 } } },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "Because the Sentinels keep the memory of these ruins for Darnassus, and we've lost so much of it already. If a tablet says why a city fell, it's worth a few bruises to have it read before the moss eats the words." } },
      choices = {
        { text = "I'll read them carefully, then.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    after = {
      lines = { { id = "af_default", text = "That they sang of their city's beauty right up until the day it drowned in its own power, and that the singing didn't stop when the walls did. I think that's why the spirits are angry, because nobody ever told them the song was over." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
