-- Uthek the Wise, shaman of the Gelkis clan, who only speaks to those the Gelkis call friend (0.72.0). Voice: bibles/uthek.md
-- Classic: Gelkis Alliance (Horde) and Strange Alliance (Alliance) turn-ins; Raid on the Kolkar, Stealing Supplies,
-- Ongeku, Khan Jehn, Khan Hratha (at Friendly).
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "uthek", id = TODO_NPC("Uthek the Wise"), name = "Uthek the Wise",
  bible = "bibles/uthek.md", role = "priest", tier = "quest",
  communities = { "gelkis_village" }, temper = { "proud", "devout" }, values = { "faith", "clan" },
  notices = { "race", "deeds" },
  impression = {
    first = "Uthek the Wise speaks for the Gelkis and for the earth, and she does not always distinguish between the two. She would not hear a word from me until there was Magram blood on my hands, and then she called it good.",
    third = "{name} met Uthek the Wise, shaman of the Gelkis centaur, who believes the earth mother Theradras watches over her clan.",
  },

  greetings = {
    { id = "g_hostile", when = { reputation = { faction = "Gelkis Clan Centaur", max = "neutral" } }, text = "You stand on Gelkis earth, outsider, and the earth does not know you. You are not welcome." },
    { id = "g_friend", when = { reputation = { faction = "Gelkis Clan Centaur", min = "friendly" } }, text = "The earth tells me you have returned, friend of the Gelkis. Come, and speak." },
    { id = "g_jehn", when = { questActive = TODO_QUEST("Khan Jehn") }, text = "Khan Jehn still breathes in Magram Village. The earth is waiting for his blood." },
    { id = "g_hratha", when = { questDone = TODO_QUEST("Khan Hratha") }, text = "Khan Hratha of the Maraudine is dead, and his clan wails. The earth drank deeply that day, friend." },
    { id = "g_away", when = { away = 14 }, text = "The earth did not feel your feet for {away}, outsider. Now it does again." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown heavy with strength since you first came to Gelkis earth. The ground knows your weight now." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, a child of the plains we were driven from. I smell the old war on you, but the Magram are the enemy today, and so we speak." },
    { id = "n_magram", cat = "deeds", when = { any = { { killed = { name = "Magram", min = 30 } }, { reputation = { faction = "Gelkis Clan Centaur", min = "friendly" } } } },
      text = "Much Magram blood is on your hands, and the earth has drunk it gladly. This is good." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Uthek, who speaks for the Gelkis. If you would be our friend, then the Magram must bleed for it, and you may return when the earth has tasted them." },
        { id = "h_friend", key = true, when = { reputation = { faction = "Gelkis Clan Centaur", min = "friendly" } },
          text = "Your name is whispered among the Gelkis, for you have much Magram blood on your hands. So we will speak, of what you can do for the Gelkis and what the Gelkis can do for you." },
        { id = "h_strange", tags = { "news" }, when = { questActive = TODO_QUEST("Strange Alliance"), reputation = { faction = "Gelkis Clan Centaur", min = "friendly" } },
          text = "The earth speaks to me, and it says you have killed many Magram. If you are a friend of the Gelkis, then listen, because I have more tasks for you." },
        { id = "h_gelkis", tags = { "news" }, when = { questActive = TODO_QUEST("Gelkis Alliance"), reputation = { faction = "Gelkis Clan Centaur", min = "friendly" } },
          text = "The earth speaks to me, and it says you have killed many Magram. This is good, and so you may hear what the Gelkis want." },
        { id = "h_raid", when = { questActive = TODO_QUEST("Raid on the Kolkar") },
          text = "The Kolkar are bold, and they forget the Gelkis are watching. Go among them, and remind them." },
        { id = "h_hostile", when = { reputation = { faction = "Gelkis Clan Centaur", max = "unfriendly" } },
          text = "Go from here! No Gelkis wants you near, and the earth itself turns from your feet. Return when many Magram have fallen by your hand." },
      },
      again = {
        { id = "h_again", text = "What more? Speak, and the earth will listen with me." },
        { id = "h_again2", text = "Ask, friend of the Gelkis. I am patient as stone." },
      },
      choices = {
        { text = "Why do you hate the Magram?", next = "magram", when = { reputation = { faction = "Gelkis Clan Centaur", min = "neutral" } } },
        { text = "Who do the Gelkis pray to, Uthek?", next = "theradras", when = { reputation = { faction = "Gelkis Clan Centaur", min = "friendly" } } },
        { text = "Why should the Gelkis trust outsiders?", next = "trust", when = { reputation = { faction = "Gelkis Clan Centaur", min = "friendly" } } },
        { text = "Our peoples are old enemies, Uthek.", next = "tauren_u", when = { race = "Tauren", reputation = { faction = "Gelkis Clan Centaur", min = "friendly" } } },
        { text = "What would the Gelkis have me do?", next = "BUSINESS", when = { reputation = { faction = "Gelkis Clan Centaur", min = "friendly" } } },
        { text = "I'll go.", next = "END" },
      },
    },

    magram = {
      lines = {
        { id = "ma_default", text = "The Magram spit on our mother and laugh at her, and they say the centaur need no one. Fools! Without her, we would be dust blowing over Desolace." },
      },
      choices = {
        { text = "I'd wager the Magram say the same of you.", next = "magram_say" },
        { text = "Something else.", next = "BACK" },
      },
    },
    magram_say = {
      lines = {
        { id = "ms_default", text = "They say we are weak because we pray. Let them say it; the earth hears them, and the earth remembers." },
      },
      choices = {
        { text = "Is there no peace between your clans?", next = "magram_peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    magram_peace = {
      big = true,
      lines = {
        { id = "mp_default", text = "Peace? When the Magram bow to our mother, there will be peace, and not before. You are strange, outsider, to ask it while their blood is on you." },
      },
      choices = {
        { text = "Then the Magram must break. I'll see to it.", next = "BACK", fx = { align = { light = -1 }, opinion = { centaur = "divide" } } },
        { text = "I fight for you, but I'd rather end this war.", next = "BACK", fx = { align = { light = 1 }, opinion = { centaur = "peace" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    theradras = {
      lines = {
        { id = "th_default", text = "Theradras, the earth mother, who loved Zaetar and bore the first centaur in the deep place your people call Maraudon. She protects her children, and the Gelkis are her faithful children." },
      },
      choices = {
        { text = "And the other clans?", next = "theradras_clans" },
        { text = "Why tell an outsider of her?", next = "faith_op" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faith_op = {
      lines = { { id = "fa_default", text = "Because you have walked on her ground and spilled Magram blood upon it, and she has tasted you. Now I ask you, outsider, and the earth listens: do you believe Theradras watches over her children?" } },
      choices = {
        { text = "I've felt the earth here. I believe she watches.", next = "fa_believe", fx = { affinity = 2, align = { order = 1 }, opinion = { theradras = "believe" } } },
        { text = "Your goddess is a story to make you fight.", next = "fa_doubt", fx = { affinity = -2, align = { order = -1 }, opinion = { theradras = "doubt" } } },
        { text = "Your gods are your own. The Gelkis are useful allies.", next = "fa_use", fx = { opinion = { gelkis = "useful" } } },
        { text = "The Earth Mother holds all children. Perhaps Theradras too.", next = "fa_tauren", when = { race = "Tauren" }, fx = { affinity = 1, opinion = { theradras = "kin" } } },
        { text = "I cannot say, Uthek.", next = "BACK" },
      },
    },
    fa_believe = {
      lines = { { id = "fab_default", text = "Then she will know your footsteps from the Magram's, and that is no small gift. Walk softly, and she may yet thank you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fa_doubt = {
      lines = { { id = "fad_default", text = "You speak like a Magram, outsider, and it does not suit you. The earth heard it, and the earth is patient, but it does not forget." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fa_use = {
      lines = { { id = "fau_default", text = "Honest, at least, and the Gelkis honor honesty even when it is cold. We use you, you use us, and the earth sees both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fa_tauren = {
      lines = { { id = "fat_default", text = "A strange thing for a tauren to say, and a kind one. Perhaps your mother and ours were never enemies, only their children." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    theradras_clans = {
      big = true,
      lines = {
        { id = "tc_default", text = "The Kolkar are wild and the Magram are proud, but all came from her. Only the Gelkis still remember to thank her, and so only the Gelkis will stand when the others fall." },
      },
      choices = {
        { text = "Faith like that is strength.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No god protects anyone. Strength does.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    trust = {
      lines = {
        { id = "tr_default", text = "We do not trust you; we use you, as you use us. The Magram are many and the Kolkar are more, and the Gelkis are wise enough to take a strange blade when it is offered." },
      },
      choices = {
        { text = "At least you're honest about it.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren_u = {
      lines = {
        { id = "tu_default", text = "We are, and the earth remembers that too. But the earth also knows which enemy is at the door today, and today it is the Magram." },
      },
      choices = {
        { text = "Today, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am Uthek, and I hear the earth for the Gelkis. There is nothing else you need." } },
    advice = { { id = "tp_ad", text = "Walk softly on Desolace, outsider. The ground here remembers every footstep." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar, the Gelkis, the Magram, the Maraudine and the Galak are all children of Zaetar, and only the Gelkis remember the earth that bore him. The others worship only themselves." } },
    maraudon = { { id = "tp_maraudon", text = "Maraudon is the tomb of our father, and our mother Theradras guards it still. The Maraudine fool themselves that they serve her, but she weeps, and the earth tells me so." } },
    earth_mother = { { id = "tp_earth_mother", text = "The tauren speak of an Earth Mother, and I hear something like our own faith in their words. The earth does not care what name we use, only that we listen." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The Circle calls Zaetar a son of Cenarius, and they are right, and they forget that Zaetar chose our mother over his father's forest. I do not forget." } },
    scourge = { { id = "tp_scourge", text = "The Magram raise the dead in the Valley of Bones, and they call it strength. It is a sickness, and the earth refuses it." } },
    _none = { { id = "tp_none", text = "The earth does not speak of that to me, so I do not speak of it to you." } },
  },
}
