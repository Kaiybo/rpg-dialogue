-- Naxxramas: Kel'Thuzad, archlich of the Scourge, who speaks from his necropolis long before
-- he fights; and Highlord Mograine, once the Ashbringer, now one of the Four Horsemen.
-- Voices: bibles/dg_kelthuzad.md, bibles/dg_mograine.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kel'Thuzad: founder of the Cult of the Damned, archlich, lord of Naxxramas.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_kelthuzad", id = TODO_NPC("Kel'Thuzad"), name = "Kel'Thuzad",
  bible = "bibles/dg_kelthuzad.md", role = "boss", tier = "major", gender = "male",
  temper = { "mocking", "patient" }, values = { "ambitious", "devoted" },
  notices = { "class", "race" },
  impression = {
    first = "Every word is courteous, and every word is a threat.",
    third = "{name} heard the voice of Kel'Thuzad, archlich of Naxxramas, echo through the halls of the necropolis.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to my necropolis. You have come a long way to die, and I would hate for you to be disappointed." },
    { id = "g_saph", when = { killed = { name = "Sapphiron" } }, text = "So, my frost wyrm is dead. A great loss. You will replace her nicely, once I am finished with you." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. I sat on the Council of Six once, before Dalaran's fools cast me out for daring to look where they would not. You look like one of them." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Ah, one of Sylvanas's strays. You belonged to us once. Come home, and all will be forgiven." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Lordaeron's children. I fed your grandparents to the plague, and now I will add you to my collection." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Kel'Thuzad, servant of the Lich King and master of this citadel. I was a magus of Dalaran, and I chose immortality over the slow decay your kind calls life." },
        { id = "h_mage", when = { class = "MAGE" }, text = "Another student of the arcane, crawling through my halls. Dalaran taught you to fear the things I mastered. Let us see who was right." },
      },
      again = {
        { id = "h_again", text = "Speak on. I have eternity; you have very little." },
        { id = "h_again2", text = "Yes? I am listening, as I always am." },
      },
      choices = {
        { text = "Why did you betray Dalaran?", next = "dalaran" },
        { text = "How did you come back after Arthas killed you?", next = "return" },
        { text = "What is Naxxramas?", next = "naxx" },
        { text = "Who do you really serve?", next = "lichking" },
        { text = "Your Horsemen were heroes once.", next = "horsemen" },
        { text = "Come down and face us.", next = "END" },
      },
    },
    dalaran = {
      lines = { { id = "d_default", text = "Betray it? Dalaran betrayed knowledge. The council forbade necromancy because it frightened them, not because it was wrong. I went north, and I found a master who rewarded curiosity." } },
      choices = {
        { text = "Some knowledge is forbidden for good reason.", next = "dalaran2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran2 = {
      lines = { { id = "d2_default", text = "Name one. And do not say the plague; the plague was simply knowledge put to work. The council would have used it too, if they had found it first." } },
      choices = {
        { text = "Limits are what separate us from monsters.", next = "BACK", reply = "Limits are what keep you small. When you are lying cold in my halls, you may ask your limits to warm you.", fx = { align = { light = 1 } } },
        { text = "You may have a point about the council.", next = "BACK", reply = "Of course I do. Antonidas is dead and I am not. History favours the curious.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ["return"] = {
      lines = { { id = "r_default", text = "Arthas carried my remains to the Sunwell and bathed them in its power. I rose as a lich, stronger than I ever was in flesh. Death is merely a door, and I have been through it twice." } },
      choices = {
        { text = "Then the Sunwell paid for your return.", next = "sunwell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sunwell = {
      lines = { { id = "s_default", text = "The elves paid, yes. Quel'Thalas burned to give me this body. I have never once felt guilty about it, and I find that very freeing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    naxx = {
      lines = { { id = "n_default", text = "A crypt-lord's citadel, carried from Northrend and raised over the Plaguelands. From here I command the Scourge, and from here the plague will spread until there is no one left to resist it." } },
      choices = {
        { text = "The Argent Dawn will stop you.", next = "argent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    argent = {
      lines = { { id = "a_default", text = "The Argent Dawn hands out trinkets to farmers and calls it a crusade. Every one of them who falls becomes mine. They are the most generous enemy I have ever had." } },
      choices = {
        { text = "Together they're stronger than you think.", next = "BACK", reply = "Unity. How touching. I will remember it fondly when they are all marching for me.", fx = { align = { order = 1 } } },
        { text = "I don't need anyone to bring you down.", next = "BACK", reply = "Spoken like every hero I have buried. Arrogance is my favourite reagent.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lichking = {
      lines = { { id = "l_default", text = "The Lich King, who sits on the Frozen Throne in the far north. I am his voice in these lands, and his will is my will. Loyalty is easy when your master is never wrong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    horsemen = {
      lines = { { id = "hm_default", text = "Heroes, yes. The Ashbringer himself rides for me now. The bravest of your kind make the finest servants, because they never stop trying to do what they are told." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Highlord Mograine: the Ashbringer, betrayed and slain, raised as one of the Four Horsemen.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_mograine", id = TODO_NPC("Highlord Mograine"), name = "Highlord Mograine", title = "The Four Horsemen",
  bible = "bibles/dg_mograine.md", role = "boss", tier = "quest", gender = "male",
  temper = { "grim", "anguished" }, values = { "bound", "honorable" },
  notices = { "class" },
  impression = {
    first = "A great man's voice, coming out of a thing that hates every word it says.",
    third = "{name} faced Highlord Mograine, the fallen Ashbringer, among the Four Horsemen of Naxxramas.",
  },

  greetings = {
    { id = "g_default", text = "Turn back. I am bound to kill you, and I would rather not add your name to the list." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I wore that oath once, and the Light still burns somewhere in me. It hurts, more than you know." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I was Alexandros Mograine, called the Ashbringer. I was betrayed and slain, and Kel'Thuzad raised me to ride for the Scourge. My will is not my own, but my memory is." },
      },
      again = { { id = "h_again", text = "Ask quickly, while I can still answer you." } },
      choices = {
        { text = "Who betrayed you?", next = "betrayal" },
        { text = "What became of the Ashbringer?", next = "blade" },
        { text = "Can you be freed?", next = "freed" },
        { text = "Then we fight.", next = "END" },
      },
    },
    betrayal = {
      lines = { { id = "b_default", text = "My own son, Renault. He led me into an ambush for the Scourge's gold. I would forgive him even now, if I could still choose anything." } },
      choices = {
        { text = "He doesn't deserve forgiveness.", next = "BACK", reply = "No one does. That is rather the point of it.", fx = { align = { light = -1 } } },
        { text = "Forgiveness would still mean something.", next = "BACK", reply = "Then remember it for me, if you survive this room.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade = {
      lines = { { id = "bl_default", text = "My sword was taken and corrupted, the last I knew. A blade forged against the dead, turned to serve them. It is the cruellest thing they have done to me, and they have done much." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    freed = {
      lines = { { id = "f_default", text = "Destroy this body. That is all the freedom left to me. Do not hesitate because of who I was; hesitation is what the Scourge feeds on." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
