-- Ruins of Ahn'Qiraj: the outer city beyond the Scarab Wall, where the Cenarion Circle's
-- Lieutenant General Andorov leads his Kaldorei Elite against General Rajaxx, and Ossirian
-- the Unscarred waits among the crystals.
-- Voices: bibles/dg_andorov.md, bibles/dg_ossirian.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Lieutenant General Andorov: night elf commander of the Kaldorei Elite inside the Ruins.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_andorov", id = TODO_NPC("Lieutenant General Andorov"), name = "Lieutenant General Andorov",
  title = "Cenarion Circle",
  bible = "bibles/dg_andorov.md", role = "vendor", tier = "quest",
  temper = { "stern", "weary" }, values = { "dutiful", "loyal" },
  notices = { "race", "class" },
  impression = {
    first = "A veteran of the war who expected to die here, and still might.",
    third = "{name} fought beside Lieutenant General Andorov in the Ruins of Ahn'Qiraj.",
  },

  greetings = {
    { id = "g_default", text = "Keep your blade up and your eyes on the sand. The qiraji don't announce themselves." },
    { id = "g_rajaxx", when = { killed = { name = "General Rajaxx", min = 1 } }, text = "Rajaxx is dead. I've waited a thousand years to say that, and it sounds no less sweet than I hoped." },
    { id = "g_back", when = { metBefore = true }, text = "You came back into this pit. Good. My elite and I could use soldiers who don't flinch." },
  },

  notice = {
    { id = "n_ne", cat = "race", when = { race = "NightElf" },
      text = "One of our own. Ishnu-alah, sister or brother. Your grandmothers' grandmothers fought on this very sand." },
    { id = "n_horde", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "The Circle says Horde and Alliance stand together here, and I will honor that. The qiraji do not care which banner you fly." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Fandral's people or Cenarius's, it hardly matters in here. We need every claw." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Andorov, Lieutenant General, and these are the last of the Kaldorei Elite who held the line at the Scarab Wall. We were sealed in with the enemy for longer than you can imagine. Now the gong has rung, and we fight again." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick." },
        { id = "h_again2", text = "Speak, but keep watch while you do." },
      },
      choices = {
        { text = "How did you survive in here?", next = "survive" },
        { text = "Tell me about General Rajaxx.", next = "rajaxx" },
        { text = "What lies deeper in the Ruins?", next = "ossirian" },
        { text = "What did the War of the Shifting Sands cost you?", next = "war" },
        { text = "The Sentinels still tell of the Scarab Wall in Darnassus.", next = "sentinels", when = { race = "NightElf" } },
        { text = "Cenarion Hold watches Silithus now. Did you know?", next = "hold", when = { class = "DRUID" } },
        { text = "I'd like to see what you have to trade.", next = "BUSINESS" },
        { text = "I'll keep moving.", next = "END" },
      },
    },
    survive = {
      lines = { { id = "s_default", text = "Not all of us did. When Fandral raised the wall, those of us trapped on the wrong side retreated into the ruins and fought for every hand of ground. The bronze dragons kept time strangely here, and I still cannot say whether it has been years or centuries." } },
      choices = {
        { text = "Fandral sealed you in to die?", next = "fandral" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fandral = {
      lines = { { id = "f_default", text = "He sealed the qiraji in, and we were on the wrong side of the stone when it rose. I have had a long time to decide whether to hate him for it, and I find I am too tired to." } },
      choices = {
        { text = "He made the right choice. The wall saved Kalimdor.", next = "BACK", reply = "Spoken like a soldier, and perhaps you're right. I only wish someone had asked the ones left behind.", fx = { align = { order = 1 } } },
        { text = "He abandoned his own people. That's unforgivable.", next = "BACK", reply = "Careful. Those are dangerous words in Darnassus, though I'll not pretend I haven't thought them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rajaxx = {
      lines = { { id = "r_default", text = "Rajaxx commands the qiraji army in the outer city, wave upon wave of them. He killed more of my soldiers in the old war than any other, and he has been waiting here as long as we have. When you face him, my elite and I will be at your side." } },
      choices = {
        { text = "Then we'll end him together.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ossirian = {
      lines = { { id = "o_default", text = "Ossirian the Unscarred, whom no blade has ever marked. The scholars say the crystals scattered through his chamber weaken him to one element or another. Drag him past them, or you'll die bouncing steel off his hide." } },
      choices = {
        { text = "And beyond him, the Temple.", next = "temple" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple = {
      lines = { { id = "t_default", text = "Where the Old God sleeps beneath the qiraji emperors. I don't pretend to know what waits there. I only know we bled a thousand years ago to keep it buried, and I'll not see that undone." } },
      choices = {
        { text = "Some things are better destroyed than buried.", next = "BACK", fx = { learn = { "cthun" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels = {
      lines = { { id = "se_default", text = "Do they? Then some of us are remembered, at least. Tell me, {g:brother|sister}, does Tyrande still lead them, or has a thousand years carried her off too?" } },
      choices = {
        { text = "Tyrande still leads, from Darnassus atop Teldrassil.", next = "sentinels_teld" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels_teld = {
      lines = { { id = "st_default", text = "A city in a tree, across the sea? Fandral's doing, I'd wager, for he always wanted a world-tree of his own. I'll see it when this war is over, if the sands let me go." } },
      choices = {
        { text = "You'll see it. I'll make sure of that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      lines = { { id = "ho_default", text = "Arch Druid Staghelm's Circle, keeping a camp at the edge of the desert? Good, for someone ought to have been watching the wall all this time. I only hope they watched it closer than they watched us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    war = {
      lines = { { id = "w_default", text = "It cost me everything, my friends and my name in the histories and whatever youth I had left. We fought beside the bronze, red and green dragons and still could not win, only hold. You are fighting the war we could not finish." } },
      choices = {
        { text = "I'll finish it for them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    rajaxx = { { id = "tp_rajaxx", text = "General Rajaxx, the qiraji warlord of the outer city.", next = "rajaxx" } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle has always guarded this border. It is why we were here when the wall rose." } },
    _none = { { id = "tp_none", text = "I've been sealed in a ruin for a very long time. I know nothing of that." } },
  },
}
