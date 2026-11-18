-- Yojamba Isle (patch 1.7): the Zandalar Tribe's camp off the northern coast, gathering heroes against Hakkar.
-- Molthor (Hand of Rastakhan), Exzhal (Servitor of Rastakhan), Vinchaxa (Servitor of Zanza), Jin'rokh the Breaker.
-- Kept consistent with the Zandalarian Emissary in booty_bay_visitors.lua. Voice: bibles/yojamba.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local ZT = "Zandalar Tribe"

---------------------------------------------------------------------------
-- Molthor, Hand of Rastakhan
---------------------------------------------------------------------------
P:NPC {
  key = "molthor", id = TODO_NPC("Molthor"), name = "Molthor",
  title = "Hand of Rastakhan",
  bible = "bibles/yojamba.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "proud", "grave" }, values = { "devout", "duty" },
  notices = { "race", "rep" },

  impression = {
    first = "Molthor leads the Zandalari on Yojamba Isle, and he looked at me the way a general looks at a new recruit he has already decided to spend. He spoke of Hakkar as a thing his people have fought before and expect to fight again.",
    third = "{name} met Molthor, the Hand of King Rastakhan, who gathers heroes on Yojamba Isle to drive the Soulflayer from the world.",
  },

  greetings = {
    { id = "g_default", text = "You stand on Zandalari ground, stranger, so stand straight. De blood god has returned to dis world, and I have no time for anyone who has come only to look." },
    { id = "g_back", when = { metBefore = true }, text = "You return to Yojamba. Good, for every blade dat comes back to dis island is one de Soulflayer has not taken." },
    { id = "g_hero", when = { questDone = TODO_QUEST("The Heart of Hakkar") }, text = "Slayer of de Soulflayer, you are welcome at my fire for as long as de Zandalar keep one on dis shore." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" }, place = "before",
      text = "Darkspear. Your people left de old ways long ago, but your blood has not forgotten whose children you are." },
    { id = "n_rep", cat = "rep", when = { reputation = { faction = ZT, min = "revered" } },
      text = "De tribe speaks your name at de evening fires now, and dey do not speak outsiders' names lightly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Molthor, de Hand of King Rastakhan, and I speak for de Zandalar on dis shore. De Gurubashi priests have called Hakkar de Soulflayer back into Zul'Gurub, and if he grows strong enough to leave it, every troll and every outsider in dis world will bleed to feed him." },
        { id = "h_hand", tags = { "news" }, when = { questActive = TODO_QUEST("The Hand of Rastakhan") },
          text = "You were sent by Ironboot, de dwarf prospector? He was wise to send you here. Speak with all of my people on dis isle, and heed dem, for de task before you is soaked in blood." },
        { id = "h_low", when = { maxLevel = 55 },
          text = "You are young yet, and Zul'Gurub would swallow you whole. Go, grow strong, and come back when de jungle has stopped frightening you, for I will still be here." },
        { id = "h_heart_ready", tags = { "news" }, when = { questActive = TODO_QUEST("The Heart of Hakkar") },
          text = "You carry de heart of Hakkar. I can feel it from here, beating where no heart should beat. Give it to me, quickly, before it learns your name." },
        { id = "h_heart_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Heart of Hakkar"), days = 3 } },
          text = "De Soulflayer's heart is in Zandalari hands, and de Spirit of Zandalar has been called down over dis whole coast. You did dat, and every troll who remembers de old empire will know it." },
        { id = "h_cleared", when = { cleared = "Zul'Gurub" },
          text = "Hakkar is cast out of dis world, for now. My people will sing of it, but de Zandalar have long memories, and we remember dat gods do not stay dead." },
      },
      again = {
        { id = "h_again", text = "Ask what you must. De priests in Zul'Gurub are not waiting for us to finish talking." },
        { id = "h_again2", text = "What else? Speak plainly, for I have little patience for riddles dat are not mine." },
        { id = "h_again3", text = "Go on. I am listening, and I am counting de hours." },
      },
      choices = {
        { text = "Who is Hakkar the Soulflayer?", next = "hakkar" },
        { text = "Why have the Zandalar come here?", next = "why" },
        { text = "What must be done in Zul'Gurub?", next = "zg" },
        { text = "Tell me about your people on this isle.", next = "isle" },
        { text = "Do you trust outsiders with this, Molthor?", next = "outsiders" },
        { text = "My people were Gurubashi once, Molthor.", next = "darkspear", when = { race = "Troll" } },
        { text = "Hakkar's heart is in your hands now.", next = "heart", when = { questDone = TODO_QUEST("The Heart of Hakkar") } },
        { text = "I will return when I am ready.", next = "END" },
      },
    },

    hakkar = {
      lines = { { id = "hk_default", text = "A god of blood, worshipped by de Gurubashi when deir empire ruled dis jungle. He fed on deir sacrifices and grew fat on dem, and when he began to eat his own priests, de Gurubashi rose up and cast him out, and deir empire broke apart in de doing." } },
      choices = {
        { text = "And now his priests have brought him back.", next = "hakkar_back" },
        { text = "Something else, Molthor.", next = "BACK" },
      },
    },
    hakkar_back = {
      lines = { { id = "hb_default", text = "De Atal'ai began it, and de Gurubashi of Zul'Gurub finished it. Dey have bound de power of our own gods, de loa of de bat, de snake, de tiger and de rest, through deir high priests, and dey pour it into Hakkar like water into a cracked jar." } },
      choices = {
        { text = "Then the priests must die first.", next = "priests" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests = {
      big = true,
      lines = { { id = "pr_default", text = "Yes, every one of dem, and when dey fall de power dey stole goes back to de loa, and Hakkar grows weaker. Some of my people would rather capture de priests and free dem of de god's grip, but I have seen what a man becomes when Hakkar has held him, and dere is nothing left to save." } },
      choices = {
        { text = "Then kill them cleanly. Mercy is wasted on them now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "If any can be saved, they should be. Try first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "Because de Zandalar are de eldest of all trolls, and every troll empire dat ever rose remembers us as deir first teachers. If a troll god is loosed upon de world, it is our shame, and so it is our war, whether de other tribes thank us for it or not." } },
      choices = {
        { text = "And yet you need outsiders to fight it.", next = "outsiders" },
        { text = "Something else.", next = "BACK" },
      },
    },

    zg = {
      hub = true,
      lines = { { id = "zg_default", text = "Zul'Gurub is a city of temples, and each temple holds a high priest who channels a loa into de Soulflayer. Kill de priests, break de bindings, and go up de great stair to Hakkar himself, and if you live, bring me his heart." } },
      again = {
        { id = "zg_again", text = "What else of Zul'Gurub? Ask, for de more you know, de longer you live dere." },
      },
      choices = {
        { text = "How many should go?", next = "zg_many" },
        { text = "What should I bring back besides the heart?", next = "zg_spoils" },
        { text = "Enough about the city.", next = "hello" },
      },
    },
    zg_many = {
      lines = { { id = "zm_default", text = "Many, and all of dem seasoned, twenty at de least. De Gurubashi were an empire, and what is left of dem in dat city could still hold off an army, so do not go in with a handful and expect a song." } },
      choices = {
        { text = "Twenty it is.", next = "BACK" },
      },
    },
    zg_spoils = {
      lines = { { id = "zs_default", text = "De coins and de bijous of de old empire, which my people here on de isle will trade for. Speak with dem, and with Exzhal, for each of my people has a part in dis, and dey will tell you dat part better dan I can." } },
      choices = {
        { text = "I'll speak with them.", next = "BACK" },
      },
    },

    isle = {
      lines = { { id = "is_default", text = "Exzhal speaks for de king, Vinchaxa tends de altar of Zanza, and Jin'rokh deals with warriors because he is one. Al'tabim, Maywiki and Falthir trade with dose who walk other paths, and Rin'wosho sells to any friend of de tribe, and does not let you forget it." } },
      choices = {
        { text = "Why this island, of all places?", next = "isle_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isle_why = {
      lines = { { id = "iw_default", text = "Because de water is between us and Zul'Gurub, and Hakkar's servants do not swim well. And because de orcs at Grom'gol and de goblins at Booty Bay are near enough to send heroes, and far enough dat deir quarrels do not land on my beach." } },
      choices = {
        { text = "A wise choice.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    outsiders = {
      big = true,
      lines = { { id = "ou_default", text = "I trust what you do, not what you are. Orc, human, dwarf or elf, I do not care, so long as de priests die. Some of my elders think it a disgrace dat Zandalari must beg help from strangers, and dey are not entirely wrong." } },
      choices = {
        { text = "Pride is a poor weapon. You were right to ask.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then pay us well, and keep your pride.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    darkspear = {
      lines = { { id = "dk_default", text = "Dey were, long ago, before dey were driven to de islands and found deir orc chieftain. Dat is no shame. De Gurubashi of today would sacrifice you on deir altars, so you owe dem nothing, and de Zandalar ask only dat you remember your blood when you go up dat stair." } },
      choices = {
        { text = "I'll remember.", next = "BACK", fx = { affinity = 1, learn = { "echo_isles" } } },
        { text = "My blood is Horde now.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    heart = {
      lines = { { id = "he_default", text = "It is, and it will never beat in dis world again if de Zandalar can help it. We will take it home to Zandalar, where it will be watched by people who have watched such things for longer dan your kingdoms have had names." } },
      choices = {
        { text = "And what will you do now?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "af_default", text = "Wait, and watch, and go home when de king calls us home. De jungle will be quieter for a time, and I have learned to be grateful for a time." } },
      choices = {
        { text = "May it be a long one.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Dat is not my concern while Hakkar lives. Ask me again when he is gone." } },
  },
}

---------------------------------------------------------------------------
-- Exzhal, Servitor of Rastakhan
---------------------------------------------------------------------------
P:NPC {
  key = "exzhal", id = TODO_NPC("Exzhal"), name = "Exzhal",
  title = "Servitor of Rastakhan",
  bible = "bibles/yojamba.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "pompous", "ruthless" }, values = { "proud", "devout" },
  notices = { "class" },

  impression = {
    first = "Exzhal, the Servitor of Rastakhan, spoke to me as though the king himself might be listening through his mouth, and he kept a Hakkari prisoner kneeling in a circle at his feet the whole time.",
    third = "{name} met Exzhal on Yojamba Isle, who speaks for King Rastakhan and collects the heads of Hakkar's high priests.",
  },

  greetings = {
    { id = "g_default", text = "Greetings, {class}. I am Exzhal, Servitor of Rastakhan, and when I speak, de king of de Zandalar has spoken first." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I hope you have brought me something heavier dan your excuses." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "SHAMAN" } },
      text = "You serve a power yourself, I see. Then you understand what it means to speak for someone greater, though I doubt yours wears a crown." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hakkar now dwells in Zul'Gurub, bathing in de power of our gods, and his high priests feed it to him. I want deir heads, all of dem, strung on one cord, so dat de king may see what his servants have done in his name." },
        { id = "h_heads", tags = { "news" }, when = { questActive = TODO_QUEST("A Collection of Heads") },
          text = "You have de sacred cord. Do not tie anything else to it, and do not let any of de heads touch de ground, for dey were priests once, however far dey fell." },
        { id = "h_heads_done", tags = { "news" }, when = { questDone = TODO_QUEST("A Collection of Heads") },
          text = "De heads hang where de king's envoys will see dem when dey come. You will be remembered in my report, {class}, which is more dan most outsiders can say." },
      },
      again = {
        { id = "h_again", text = "Speak. De king's servant has a moment for you." },
        { id = "h_again2", text = "What else? De prisoner is not going anywhere, and neither am I." },
      },
      choices = {
        { text = "Who is the prisoner in the circle?", next = "prisoner" },
        { text = "Why collect the heads?", next = "heads" },
        { text = "What is King Rastakhan like?", next = "king" },
        { text = "You speak very highly of yourself.", next = "pride" },
        { text = "Do the Zandalar look down on the Darkspear?", next = "darkspear", when = { race = "Troll" } },
        { text = "I will go.", next = "END" },
      },
    },

    prisoner = {
      lines = { { id = "pr_default", text = "A Hakkari zealot, taken on de road to Zul'Gurub. He is bound in de Circle of Binding, and every day he tells us a little more about de temples, whether he means to or not." } },
      choices = {
        { text = "How do you make him talk?", next = "prisoner_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prisoner_how = {
      big = true,
      lines = { { id = "ph_default", text = "De circle does most of it, and fear does de rest. Molthor says I am too hard on him, and I say dat a man who would feed his own children to de Soulflayer has given up any claim to gentleness." } },
      choices = {
        { text = "Whatever he did, torture shames the one who does it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Wring every word out of him. He's earned it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    heads = {
      lines = { { id = "hd_default", text = "Because de king must see proof, and because de priests must be seen to fall. A head on a cord is a message every troll understands, from de Gurubashi to de Amani in de north, and de message is dat de Zandalar still rule de old ways." } },
      choices = {
        { text = "That sounds more like politics than war.", next = "heads_politics" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heads_politics = {
      lines = { { id = "hp_default", text = "War is politics with blood on it, outsider, and de Zandalar have practised both for longer dan your people have had walls. When dis is done, every tribe will know who came to de jungle when de god returned, and who did not." } },
      choices = {
        { text = "You think far ahead.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    king = {
      lines = { { id = "ki_default", text = "Rastakhan is old, and wise, and he does not leave Zandalar for anything less dan de end of de world, which is why he sent me. He chose me because I do not forget a word he says, and I will not forget yours either." } },
      choices = {
        { text = "Then I'll choose my words carefully.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    darkspear = {
      lines = { { id = "dk_default", text = "Look down? De Zandalar look down on every tribe, young one, because every tribe stands lower dan de first. But your Darkspear chose deir own road and walked it without begging, and de king has said dat is worth something, so I say it too." } },
      choices = {
        { text = "We need no king's approval.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Then tell your king we remember.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pride = {
      lines = { { id = "pd_default", text = "I speak highly of de king, because his voice is de one you hear when I speak. If you hear pride in dat, you are hearing de king's, not mine, and you would be wise not to mock it." } },
      choices = {
        { text = "No mockery meant, Servitor.", next = "BACK", fx = { affinity = 1 } },
        { text = "I hear a little of yours too.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I do not concern myself with dat. De king's business is Hakkar, and so is mine." } },
  },
}

---------------------------------------------------------------------------
-- Vinchaxa, Servitor of Zanza
---------------------------------------------------------------------------
P:NPC {
  key = "vinchaxa", id = TODO_NPC("Vinchaxa"), name = "Vinchaxa",
  title = "Servitor of Zanza",
  bible = "bibles/yojamba.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "calm", "devout" }, values = { "devout", "tradition" },
  notices = { "class", "rep" },

  impression = {
    first = "Vinchaxa tends the Altar of Zanza on Yojamba Isle and speaks of the old Gurubashi coins as if each one were a prayer someone forgot to finish.",
    third = "{name} met Vinchaxa, servitor of the loa Zanza, who trades the Zandalar's honor tokens for the coins of the old troll empire.",
  },

  greetings = {
    { id = "g_default", text = "Peace, traveller. Behind me is de Altar of Zanza, and you stand close enough to it now dat de loa can hear you, so speak gently." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to de altar. Zanza remembers dose who come back." },
  },

  notice = {
    { id = "n_rep", cat = "rep", when = { reputation = { faction = ZT, min = "honored" } },
      text = "De tribe has grown fond of you, I can tell, for even de enforcers nod when you pass. Dat is rare enough dat I mention it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest of de outsiders. Your Light is a strange thing to us, but dere is room at an altar for more dan one kind of prayer." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Vinchaxa, servitor of Zanza. We pray here to bolster our resolve before de war with de Blood God, and any who destroy a Hakkari bijou upon dis altar prove demselves to de tribe. Bring me de old empire's coins, too, in de sets I seek, and I will trade you de honor tokens of de Zandalar." },
        { id = "h_bijou", tags = { "news" }, when = { questActive = TODO_QUEST("A Bijou for Zanza") },
          text = "You carry a bijou, I can feel its mojo from here. Place it on de altar and let Zanza unmake it, and de tribe will know what you have done." },
        { id = "h_rep", when = { reputation = { faction = ZT, min = "revered" } },
          text = "Revered of de tribe, and you still come to de altar yourself instead of sending a servant. Zanza notices such things, and so do I." },
      },
      again = {
        { id = "h_again", text = "What else would you know? De altar is patient, and so am I." },
        { id = "h_again2", text = "Ask. Dere is time, here, even with de god stirring." },
      },
      choices = {
        { text = "Who is Zanza?", next = "zanza" },
        { text = "Why do you want the old coins?", next = "coins" },
        { text = "What happens to a bijou on the altar?", next = "bijou" },
        { text = "May an outsider pray at your altar?", next = "pray", when = { class = { "PRIEST", "SHAMAN", "DRUID" } } },
        { text = "I'll come back with coins.", next = "END" },
      },
    },

    zanza = {
      lines = { { id = "za_default", text = "A loa of de Zandalar, de keeper of elixirs and of de spirit's strength. De potions Rin'wosho sells carry Zanza's blessing, and dey are why some of your heroes walk into Zul'Gurub laughing and walk out again." } },
      choices = {
        { text = "Do your loa answer outsiders too?", next = "zanza_out" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zanza_out = {
      big = true,
      lines = { { id = "zo_default", text = "Dey answer whoever feeds dem, and dat is de danger, for it is how de Gurubashi priests came to bind our gods to Hakkar. Some of my people say outsiders should never be taught de loa's names at all, and I am not sure dey are wrong." } },
      choices = {
        { text = "Keep your gods' names to yourselves. It's safer.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Knowledge hidden is knowledge stolen. Teach whoever asks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    coins = {
      lines = { { id = "co_default", text = "Gurubashi, Vilebranch and Witherbark; Sandfury, Skullsplitter and Bloodscalp; Zulian, Razzashi and Hakkari. Each set is a piece of de empire dat broke apart when Hakkar was first cast out, and bringing dem together again here is a kind of prayer." } },
      choices = {
        { text = "The Bloodscalp and Skullsplitter are here in this jungle.", next = "coins_tribes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coins_tribes = {
      lines = { { id = "ct_default", text = "Yes, and dey would kill you for asking about deir grandfathers' coins, and dey would be right to be angry. But deir grandfathers' coins lie in Zul'Gurub's vaults, and dey have no more claim to dem dan de dead do." } },
      choices = {
        { text = "I'll see what I can find.", next = "BACK", fx = { affinity = 1, learn = { "yenniku" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    pray = {
      lines = { { id = "py_default", text = "You may kneel, and Zanza may listen, but do not ask de loa for anything. A loa who grants an outsider a favor will one day come to collect, and you will not like de price." } },
      choices = {
        { text = "Then I'll only give thanks.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bijou = {
      lines = { { id = "bi_default", text = "It breaks, and de mojo in it goes back to de loa it was stolen from, which is why de bijou screams a little when it dies. Do not listen too closely, and do not try to keep one, for dey whisper to dose who carry dem too long." } },
      choices = {
        { text = "I'll be quick about it.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I do not know, traveller. Ask de loa, and see if dey answer you more kindly dan I can." } },
  },
}

---------------------------------------------------------------------------
-- Jin'rokh the Breaker
---------------------------------------------------------------------------
P:NPC {
  key = "jinrokh", id = TODO_NPC("Jin'rokh the Breaker"), name = "Jin'rokh the Breaker",
  bible = "bibles/yojamba.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "blunt", "fierce" }, values = { "strength", "proud" },
  notices = { "class", "race" },

  impression = {
    first = "Jin'rokh the Breaker is a dire troll of the Zandalar, huge and patient, and he told me straight out that his dealings were with warriors and that I had better be one.",
    third = "{name} met Jin'rokh the Breaker on Yojamba Isle, envoy of Mugamba, the Fist of Rastakhan, who arms warriors and paladins for Zul'Gurub.",
  },

  greetings = {
    { id = "g_default", text = "I am Jin'rokh de Breaker, envoy of Mugamba, de Fist of Rastakhan. My dealings are with warriors and paladins, so tell me which you are." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did you kill anything since I last saw you, or only talk?" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Good, you carry heavy steel and you carry it well. De gear of de tribe will sit right on shoulders like dose." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Ha, a big one! You and I could stand on de great stair of Zul'Gurub and block it between us." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Paragons of Power are de old mojo of de Gurubashi Empire, and de Zandalar will take dat mojo for our own, so de Blood God cannot. Seek de coins, de bijous and de primal things in Zul'Gurub, bring dem to de tribe, and earn our respect and our battle gear." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior, finally, someone worth my time. De tribe makes armor for fighters like you, and I give it out, and I do not give it to anyone soft." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "One of de Light's warriors, a paladin. You heal and you hit, which I do not understand, but de tribe makes armor for you too, if you earn it." },
        { id = "h_rep", when = { reputation = { faction = ZT, min = "honored" } },
          text = "De tribe trusts you now, and so do I, a little. Bring me de pieces and I will see you armored like a Zandalari champion." },
      },
      again = {
        { id = "h_again", text = "Speak quick. Talking is not fighting." },
        { id = "h_again2", text = "What else? I am listening, but I am not sitting down." },
      },
      choices = {
        { text = "What are the Paragons of Power?", next = "paragons" },
        { text = "Who is Mugamba?", next = "mugamba" },
        { text = "What is a dire troll?", next = "dire" },
        { text = "What armor does the tribe make for my kind?", next = "armor", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I'll bring you what you want.", next = "END" },
      },
    },

    paragons = {
      lines = { { id = "pa_default", text = "Powerful mojo from de old empire, coins and bijous and primal things, and each holds a trace of de magic de Gurubashi used when dey ruled. We take dem, we make armor from deir strength, and we give dat armor to dose who fought for it." } },
      choices = {
        { text = "Why give it away at all?", next = "paragons_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    paragons_why = {
      big = true,
      lines = { { id = "pw_default", text = "Because armor on a shelf kills nobody. Exzhal says de tribe's craft should stay with de tribe, and I say a dead hero takes nothing to his grave, so let dem wear it." } },
      choices = {
        { text = "Gear belongs on whoever fights hardest. You're right.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A tribe's craft is its own. Exzhal has a point.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mugamba = {
      lines = { { id = "mu_default", text = "De Fist of Rastakhan, de greatest warrior of de Zandalar, and my master. He would have come himself, but de king keeps his fist close, and so he sent me, which he says is like sending a smaller fist." } },
      choices = {
        { text = "Is that a compliment?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    armor = {
      lines = {
        { id = "ar_default", text = "Bracers first, when de tribe calls you friend, den a belt when it honors you, and de breastplate when it reveres you. Nothing comes free, and nothing comes early, so do not ask me twice." },
        { id = "ar_paladin", when = { class = "PALADIN" }, text = "For you, de Freethinker's pieces, bracers and belt and breastplate, one at a time as de tribe trusts you more. De name was not my idea, so do not ask me what it means." },
        { id = "ar_warrior", when = { class = "WARRIOR" }, text = "For you, de Vindicator's pieces, armguards, belt and breastplate, one at a time as de tribe trusts you more. Each one is heavy, and each one is worth it." },
      },
      choices = {
        { text = "I'll earn every piece.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dire = {
      lines = { { id = "di_default", text = "A troll who has grown big and hard because de loa made him so. Small trolls laugh at us until we stand up, and den dey stop laughing, and dat is all you need to know." } },
      choices = {
        { text = "I'll remember not to laugh.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I do not know. Go and hit something, and maybe it will tell you." } },
  },
}
