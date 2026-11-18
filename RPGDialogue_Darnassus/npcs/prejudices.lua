-- Two Darnassians with a grudge (0.80.0). Voice: bibles/erion.md, bibles/firodren.md
-- Erion Shadewhisper, rogue trainer in the Cenarion Enclave: distrusts humans as oath-breakers.
-- Firodren Mooncaller, herbalism trainer in the Cenarion Enclave: resents dwarves as diggers.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Erion Shadewhisper. Classic: Erion's Behest (sends night elf rogues to Renzik and SI:7 in Stormwind).
P:NPC {
  key = "erion", id = TODO_NPC("Erion Shadewhisper"), name = "Erion Shadewhisper",
  title = "Rogue Trainer",
  bible = "bibles/erion.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "cold", "sharp" }, values = { "cunning", "careful" },
  notices = { "race", "stealth", "class" },

  impression = {
    first = "Erion Shadewhisper trains the rogues of Darnassus and sends his best to Stormwind, though he trusts no human further than he can see their hands. A student of his paid for that lesson, and he hasn't forgiven the whole race for it.",
    third = "{name} met Erion Shadewhisper, the Darnassian rogue trainer who sends his students to Stormwind and trusts no human he sends them among.",
  },

  greetings = {
    { id = "g_default", text = "Keep to the shade if you want a word with me; I don't care to be seen talking in the open." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and you came in the same way as last time. Vary your path, or someone will learn it." },
    { id = "g_human", when = { race = "Human" }, priority = 5,
      text = "A human in the Enclave. Stand where I can see your hands, and we'll get along well enough." },
    { id = "g_human_back", when = { race = "Human", metBefore = true }, priority = 6,
      text = "You again. I've had no word that you sold anyone since we last spoke, which puts you ahead of most of your people." },
    { id = "g_soft", when = { npcFlagBefore = "erion_soft" }, priority = 10,
      text = "Ah, the one who talked me out of my own lesson. Come into the shade; I've stopped counting your fingers, mostly." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and nobody I pay to listen heard a word of you in all that time. Either you're very good or very dull." },
    { id = "g_word_caught", when = { word = "caughtLying" },
      text = "I hear you were caught in a lie on the terraces. Being caught is the part I'd train out of you." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Humans always look at the Enclave's doors before they look at the people in it. I suppose that's where your kind keeps its sense." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Good, but your shadow fell across the moss a step before you did. Mind the moonlight next time." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You carry your blades on the left, the way they teach in Stormwind. I'd break you of that, given a month." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I am Erion Shadewhisper, and I train those who work in the dark for Darnassus. The Sentinels guard the gates, and someone must watch what comes through them smiling." },
        { id = "h_human", when = { race = "Human" },
          text = "I'll be plain with you, since your people seldom are: I've known humans who keep their word, and I've known more who sold it. Until I know which you are, you'll find me polite and nothing more." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "{g:Brother|Sister}, it's good to see a kaldorei face in here. So many in this city these days arrived on a boat from Menethil, and I can't read a single one of them." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Dwarves I don't mind. You drink, you shout, and you tell a stranger exactly what you think of him, which saves me half my work." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome. I'm told your city fell because one of your own advisers betrayed it, so perhaps humans aren't the only ones who sell their friends." },
        { id = "h_behest", tags = { "news" }, when = { questActive = TODO_QUEST("Erion's Behest") },
          text = "Go to Stormwind and find Renzik; he'll teach you what the humans have learned about working in the shadows. Trust him before any man in a uniform, and trust no one there completely." },
        { id = "h_behest_done", when = { questDone = TODO_QUEST("Erion's Behest") },
          text = "Renzik sent word that you made it to Stormwind and back with your purse and your throat both whole. The last student I sent came home with neither." },
        { id = "h_soft", when = { npcFlagBefore = "erion_soft" },
          text = "Ithrenil, my old student, asked after you, believe it or not. I told her I'd met a human who didn't fit the lesson, and she laughed at me for a full minute." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask quietly." },
        { id = "h_again2", text = "Go on. I've a student waiting, but she can practise patience." },
        { id = "h_again3", text = "What else do you want to know? I'll tell you what I can and nothing that would cost me." },
      },
      choices = {
        { text = "What is it you send your students to Stormwind for?", next = "behest" },
        { text = "You don't seem to think much of humans.", next = "humans" },
        { text = "What does a rogue do in a city of priestesses and druids?", next = "trade" },
        { text = "You've been watching my hands since I walked in.", next = "xhuman", when = { race = "Human" } },
        { text = "Between kaldorei, Erion, do you trust the humans at all?", next = "xnelf", when = { race = "NightElf" } },
        { text = "I'm here to train, not to hear about humans.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Still counting my fingers, Erion?", next = "xsoft", when = { npcFlagBefore = "erion_soft" } },
        { text = "Train me, then.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "I'll leave you to the shade.", next = "END" },
      },
    },

    behest = {
      lines = {
        { id = "b_default", text = "To Renzik, a goblin who works for SI:7, the King of Stormwind's spies. The humans have built a good school of knives in that city, and I'd be a fool to let pride keep my students out of it." },
        { id = "b_rogue", when = { class = "ROGUE", race = "NightElf" },
          text = "To Renzik in Stormwind, and one day I'll send you. He works for SI:7, the king's spies, and he'll teach you things about cities that a forest can't." },
      },
      choices = {
        { text = "Why send them to a human city, if you distrust humans?", next = "behest_why" },
        { text = "You trust a goblin more than a human?", next = "behest_goblin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    behest_why = {
      lines = {
        { id = "bw_default", text = "Because the Alliance is the humans' table, and if we don't sit at it, they'll carve the meal without us. So I send my best to sit there, and I tell each one to smile and to count the spoons." },
      },
      choices = {
        { text = "That's wise. Watch your allies as closely as your enemies.", next = "BACK", reply = "Now you're thinking like one of mine. Smile at the table, count the knives on it, and never sit with your back to the door.", fx = { align = { honor = -1 } } },
        { text = "If you can't trust your allies, you don't have an alliance.", next = "BACK", reply = "Then perhaps we don't have one, only a long truce with good manners. I would sooner know that now than learn it at Hyjal again.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    behest_goblin = {
      lines = {
        { id = "bg_default", text = "Every time. A goblin tells you his price before he sells you, so you always know where you stand with him. A human smiles, swears by his Light, and lets you find the price out afterwards." },
      },
      choices = {
        { text = "That's a strange thing to admire.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    humans = {
      lines = {
        { id = "hu_default", key = true,
          text = "Humans live a single breath and promise as if they'll keep it forever. Alterac sold their own Alliance to the orcs, Lordaeron's prince put a sword through his father, and Stormwind's lords cheated the masons who rebuilt their city, so tell me what I ought to think.",
          fx = { learn = { "alterac" } } },
        { id = "hu_human", when = { race = "Human" },
          text = "Not much, no, and you may as well hear why from me. Alterac sold the Alliance to the orcs, Lordaeron's prince murdered his own king, and Stormwind's lords robbed the masons who built their walls, and those were your best families." },
      },
      choices = {
        { text = "What made you so certain of it?", next = "humans_why" },
        { text = "Those are a few kings. Judge each person by their own deeds.", next = "BACK", reply = "A pleasant idea for someone with a lifetime to judge in. I have watched too many of their lifetimes to keep starting fresh with each one.", fx = { align = { light = 1 } } },
        { text = "You're right. Their history speaks for itself.", next = "BACK", reply = "It does, and loudly, though most of them would rather you didn't read it aloud. Remember that when they ask you for something.", fx = { align = { light = -1 } } },
      },
    },
    humans_why = {
      lines = {
        { id = "hw_default", text = "A student of mine, Ithrenil, the quickest I ever trained. I sent her to Stormwind with silver for a man in the Trade District who sold doors and names, and he took her silver and then sold her face to the Defias.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Is she alive?", next = "ithrenil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ithrenil = {
      lines = {
        { id = "it_default", text = "Alive, and back here, with a scar from her ear to her collar that she won't talk about. Later I learned a lord of the king's own court had been selling secrets to the Defias the same way, so tell me where the rot stops." },
        { id = "it_attack", when = { questDone = TODO_QUEST("The Attack!") },
          text = "Alive, and home, with a scar she won't speak of. And I hear you were the one in Stormwind who dragged Lord Lescovar's dealings with the Defias into the light, so you've seen how high their rot climbs." },
      },
      choices = {
        { text = "One traitor doesn't excuse distrusting them all.", next = "BACK", reply = "Perhaps not, but it taught me what to look for. One traitor is all it takes when he sits close enough to the king.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then lie to them first, before they lie to you.", next = "BACK", reply = "Careful, that's the kind of lesson that makes a rogue clever and a people friendless. I teach caution, not treachery, whatever they say of me.", fx = { align = { honor = -1 } } },
        { text = "I'm sorry about Ithrenil.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    trade = {
      lines = {
        { id = "tr_default", text = "The Sentinels fight in the open and the Sisterhood prays, but somebody has to listen at doors, and the night has always belonged to my people. I train the ones who listen." },
      },
      choices = {
        { text = "Who do you listen to?", next = "trade_listen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_listen = {
      lines = {
        { id = "tl_default", text = "Everyone, though I'll not pretend I give the humans on the terraces the same ear as the rest. Their envoys smile at Tyrande's Sentinels all day and write long letters home every night, and I would dearly like to read those letters." },
      },
      choices = {
        { text = "Spying on your allies breeds the very betrayal you fear.", next = "BACK", reply = "Maybe it does, and maybe I'm only reading what was already written. I'd still rather know the betrayal than be surprised by it.", fx = { align = { order = 1 } } },
        { text = "Read them. An ally's letters are worth more than an enemy's.", next = "BACK", reply = "You learn quickly, and that worries me a little. An enemy's letter tells you what he wants, but an ally's tells you what he's hiding.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xhuman = {
      lines = {
        { id = "xh_default", text = "I have, and I'll keep watching them, because a human once sold my student's name for silver and I learned to watch the hands. Don't take it to heart; you'll be gone in sixty years either way, and I'll still be here watching the next one." },
      },
      choices = {
        { text = "I've never sold anyone. Judge me by what I do.", next = "xhuman_deeds", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then I'll stop pretending to like you, too.", next = "xhuman_cold", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "You decided who I was before I opened my mouth.", tag = "Persuade", next = "xhuman_soft",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Erion's Behest") }, { origin = "human_city_guard" }, { class = "PALADIN" } } } },
          fail = { next = "xhuman_fail", fx = { affinity = -1 } } },
      },
    },
    xhuman_deeds = {
      lines = {
        { id = "xd_default", text = "Deeds, then, and I'll keep count. Do Darnassus a service without first asking what it pays, and I may stop counting your fingers when you shake my hand." },
      },
      choices = {
        { text = "Count away. I'll give you nothing to find.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_cold = {
      lines = {
        { id = "xc_default", text = "Good, honesty at last. Two people who openly distrust each other will get along far better than two who pretend, and I've no use for pretending in my own shade." },
      },
      choices = {
        { text = "Then we understand each other.", next = "BACK" },
        { text = "I'll go.", next = "END" },
      },
    },
    xhuman_soft = {
      lines = {
        { id = "xs_default", key = true, fx = { npcFlag = { set = { "erion_soft" } } },
          text = "You're right, and it galls me to say it. Ithrenil always told me I trained my students to read a stranger and then refused to do it myself, so very well: I'll read you as you are, and not as the last human who smiled at me." },
      },
      choices = {
        { text = "That's all I ask.", next = "BACK", fx = { affinity = 2 } },
        { text = "Who's Ithrenil?", next = "humans_why" },
      },
    },
    xhuman_fail = {
      lines = {
        { id = "xf_default", text = "I've heard that speech before, nearly word for word, from a man who sold my student a week later. Try another, or better yet, try deeds." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Fine. Good day.", next = "END" },
      },
    },

    xnelf = {
      lines = {
        { id = "xn_default", text = "Between us, I trust them the way a Sentinel trusts a frozen lake: I'll cross it when I must, and I'll listen for the crack. They came to Hyjal with Jaina Proudmoore and fought well, I'll grant them, but they had already lost their own kingdom to the Scourge by then." },
      },
      choices = {
        { text = "They bled beside us at Hyjal. That has earned some trust.", next = "BACK", reply = "Some, yes, and I've not forgotten those who fell beside us. But a debt paid in blood can be called in by the wrong king later.", fx = { align = { light = 1 } } },
        { text = "Keep listening for the crack. They've broken every pact so far.", next = "BACK", reply = "I always do, and it's kept my students alive longer than trust ever has. Just don't let them see you listening.", fx = { align = { light = -1 } } },
        { text = "And the Highborne, Erion? Were they so trustworthy?", next = "xnelf_highborne" },
      },
    },
    xnelf_highborne = {
      lines = {
        { id = "xnh_default", text = "That is a sharper question than I'd like from one of my own. The Highborne were kaldorei, and they opened the world to the Legion, and I have spent a long life not thinking of them whenever I think of humans.",
          fx = { learn = { "highborne" } } },
      },
      choices = {
        { text = "Perhaps you should think of them more often.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xrogue = {
      lines = {
        { id = "xr_default", text = "You'll hear it anyway, because it is the training. Trust the coin you can see, the door you've checked yourself, and the friend you've watched for a year, in that order, and humans most of all." },
      },
      choices = {
        { text = "Even a rogue needs friends he can't watch.", next = "BACK", reply = "He does, and that's the hardest lesson of all for us. Find one or two, and guard them more closely than your purse.", fx = { align = { honor = 1 } } },
        { text = "Coin, door, friend. I'll remember the order.", next = "BACK", reply = "See that you do, and in that order. The ones who forget it usually learn it in a gutter somewhere in Stormwind.", fx = { align = { honor = -1 } } },
        { text = "Train me, then.", next = "BUSINESS" },
      },
    },

    xsoft = {
      lines = {
        { id = "xso_default", text = "Out of habit, yes, but only a few of them. I told Ithrenil about you, and she said it was the first time in years she'd heard me admit I was wrong about anyone." },
        { id = "xso_human", when = { race = "Human" },
          text = "Out of habit, and only the left hand. I told Ithrenil a human had talked me out of my own lesson, and she said she'd like to meet you, which from her is no small thing." },
      },
      choices = {
        { text = "Tell her I said hello.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darnassian, by way of Ashenvale's old shadows, and longer in this trade than I'll tell you. The night has kept me well enough." } },
    advice = { { id = "tp_ad", text = "Never let the same person see you twice in the same doorway. That goes double in Stormwind." } },
    alterac = { { id = "tp_alterac", text = "Lord Perenolde sold his own allies to the Horde to keep his little crown. The humans hanged the kingdom for it, but I notice they never stopped telling me how loyal they are." } },
    defias = { { id = "tp_defias", text = "Masons turned thieves, with friends in very high places. Ithrenil could tell you more, but she won't." } },
    highborne = { { id = "tp_highborne", text = "Ours, to my shame, and the reason my people swore off the arcane. I'd rather not talk of them; they make my lessons about humans sound hollow." } },
    _none = { { id = "tp_none", text = "If I knew, I'd charge you for it, and I don't, so we'll both save the trouble." } },
  },
}

-- Firodren Mooncaller. Classic herbalism trainer in the Cenarion Enclave.
P:NPC {
  key = "firodren", id = TODO_NPC("Firodren Mooncaller"), name = "Firodren Mooncaller",
  title = "Herbalism Trainer",
  bible = "bibles/firodren.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "proud", "gruff" }, values = { "nature", "patient" },
  notices = { "race", "profession", "class" },

  impression = {
    first = "Firodren Mooncaller teaches herbalism in the Cenarion Enclave and talks to his plants more kindly than to dwarves. A dwarven dig crew cut down his grove in Darkshore, and he has blamed every dwarf since.",
    third = "{name} met Firodren Mooncaller, the Darnassian herbalist who has never forgiven the dwarves for a grove in Darkshore.",
  },

  greetings = {
    { id = "g_default", text = "Mind the moss as you come in; it took longer to grow than you've been alive, most likely." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Your boots are cleaner this time, so you may come closer." },
    { id = "g_dwarf", when = { race = "Dwarf" }, priority = 5,
      text = "A dwarf. Wipe your boots, keep your pick on your belt, and don't look at my floor as if you're wondering what's under it." },
    { id = "g_dwarf_back", when = { race = "Dwarf", metBefore = true }, priority = 6,
      text = "You again. Nothing in here has been dug up since your last visit, so I'll assume you behaved yourself." },
    { id = "g_soft", when = { npcFlagBefore = "firodren_soft" }, priority = 10,
      text = "Ah, it's you, the one who listens to hills. Come in, and mind the moss, though I suppose you always do." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the silverleaf by the door flowered twice while you were away. You missed it, which is your loss." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The Sentinels say you've been decent on the terraces. I'll judge that for myself, but it's a start." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "There's stone dust in the seams of your boots, dwarf. Not on my moss, if you please." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "You smell of oil and burnt copper, little one. The plants don't care for it, and neither do I." },
    { id = "n_herb", cat = "profession", when = { profession = { "Herbalism" } },
      text = "You've been picking peacebloom, I can tell by your hands, and you've been tearing it at the stem. Pinch it, don't tear it." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "One of the Enclave's own. You at least know what a root is for besides getting in the way of a shovel." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I am Firodren Mooncaller, and I teach the gathering of herbs to anyone with the patience to learn it properly. Most have the patience of a spring frost, and a few have none at all." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "I'll teach you, since Tyrande says I must teach any ally who asks, but I'll tell you plainly I've no love for your people. Your kind looks at a hill and sees only what's inside it." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome come to learn herbs. Your people poisoned their own city with their machines, I'm told, so perhaps you're wise to start learning what grows instead." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Ah, one of our own. It's a relief to talk to someone who knows the moss was here first, after a morning of dwarves asking whether the Enclave has a cellar." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Enclave. Then you've felt the sickness in Teldrassil's roots the same as I have, and you know it's no small thing." },
        { id = "h_prospector", when = { questDone = TODO_QUEST("The Absent Minded Prospector") },
          text = "I'm told you walked that dwarf Remtravel through the ruins of my people in Darkshore, and that he lost his own fossil on the way. That is the Explorers' League in one story." },
        { id = "h_soft", when = { npcFlagBefore = "firodren_soft" },
          text = "I've been thinking about what you said, and I've started telling the dwarves who come here where the roots run, so they can go around them. Two of them listened, which is two more than I expected." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up; the ferns don't mind." },
        { id = "h_again2", text = "Go on, then. I've a tray of seedlings that wants turning, but it can wait." },
        { id = "h_again3", text = "Something more? Ask while I'm in a patient mood." },
      },
      choices = {
        { text = "Can you teach me to gather herbs?", next = "craft" },
        { text = "What have you got against dwarves?", next = "dwarves" },
        { text = "Is something wrong with the plants on Teldrassil?", next = "tree" },
        { text = "There's a dwarf archaeologist outside the Temple of the Moon.", next = "greywhisker" },
        { text = "You've been glaring at my boots since I walked in.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Is it only dwarves, Firodren, or every race but ours?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Still minding the moss for me, Firodren?", next = "xsoft", when = { npcFlagBefore = "firodren_soft" } },
        { text = "I'd like to train.", next = "BUSINESS" },
        { text = "I'll leave you to your plants.", next = "END" },
      },
    },

    craft = {
      lines = {
        { id = "c_default", text = "I can teach anyone with steady hands. Peacebloom and silverleaf first, then earthroot, which you'll have to ease out of the soil without snapping it, because a broken earthroot is worth nothing to an alchemist." },
      },
      choices = {
        { text = "So you dig things out of the ground too.", next = "craft_dig" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_dig = {
      lines = {
        { id = "cd_default", text = "I take one root and leave the plant beside it to seed the next, and I fill the hole behind me. That is not the same as tearing open a hillside to see what my ancestors left in it, whatever you're about to say." },
      },
      choices = {
        { text = "You take only what you need. That's the difference.", next = "BACK", reply = "It is the whole difference, and I'm glad someone outside the Enclave can see it. The earth forgives a borrowing but never a theft.", fx = { align = { order = -1 } } },
        { text = "A hole is a hole, Firodren, whoever digs it.", next = "BACK", reply = "It is not, and I will not have that said in my garden. A hole you fill is a wound that heals, while theirs only ever gets deeper.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dwarves = {
      lines = {
        { id = "dw_default", text = "They dig. They look at a forest and see timber for their shoring, and at a hill and see a vault, and at the ruins of my people's houses and see crates to ship home to Ironforge.",
          fx = { learn = { "explorers_league" } } },
      },
      choices = {
        { text = "What did they do to you?", next = "dwarves_grove" },
        { text = "They're our allies. You'd do well to remember it.", next = "BACK", reply = "I remember it every time I see their lanterns in Darkshore. Remembering it does not mean I have to like what they do with their spades.", fx = { align = { order = 1 } } },
        { text = "The land should come before any alliance.", next = "BACK", reply = "Then you understand what Tyrande sometimes forgets in the war council. Alliances end, but the land is still there after them.", fx = { align = { order = -1 } } },
      },
    },
    dwarves_grove = {
      lines = {
        { id = "dg_default", text = "I kept a grove in Darkshore, south of Auberdine, old oaks over a ring of stones my grandmother's people set there. Two summers ago the Explorers' League came with their shovels, cut the oaks to shore up their trench, and dug through the roots to reach the stones." },
      },
      choices = {
        { text = "Did you ever tell them what that grove was?", next = "dwarves_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves_tell = {
      lines = {
        { id = "dt_default", text = "I told them, standing in the stumps. A young one with a lantern took his cap off and said he was sorry and hadn't known, and I didn't believe him, and I've never quite decided whether that was wise of me." },
      },
      choices = {
        { text = "He meant it. You should have believed him.", next = "BACK", reply = "Perhaps he did, and that is what keeps me up some nights. Still, sorry does not put a single tree back in the ground.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sorry costs nothing. You were right not to.", next = "BACK", reply = "That is what I told myself on the walk home, though it does not feel as righteous as it did. Leave it there, if you would.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tree = {
      lines = {
        { id = "t_default", text = "There is. The timberlings sicken, fel moss creeps up the roots, and some of the herbs I gather near Dolanaar come up with grey veins in the leaf. The tree was grown without the dragons' blessing, and some say that's why, though I'd not say it near the Arch Druid.",
          fx = { learn = { "teldrassil" } } },
        { id = "t_druid", when = { class = "DRUID" },
          text = "You know there is. The timberlings sicken and fel moss creeps up the roots, and I've pulled herbs near Dolanaar with grey veins in the leaf, though the Arch Druid would rather we spoke of it softly." },
      },
      choices = {
        { text = "Isn't that the same pride you blame the dwarves for?", next = "tree_pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tree_pride = {
      lines = {
        { id = "tp2_default", text = "That is a cruel question, and I'd like to tell you it's a foolish one. We grew a tree and the dwarves dug a hole, and I've told myself those are different things, but the tree is sick and the hole is only a hole." },
      },
      choices = {
        { text = "Every people wounds the land. Yours too.", next = "BACK", reply = "Mine too, and I hate that you are right. We grew Teldrassil in a hurry and in pride, and the roots remember it even if we would rather not.", fx = { align = { order = 1 } } },
        { text = "Your people made a living tree. Dwarves only make holes.", next = "BACK", reply = "That is what I want to believe, and you say it more kindly than it deserves. Ask the druids how whole this tree truly is before you are sure.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    greywhisker = {
      lines = {
        { id = "gw_default", text = "Greywhisker, yes. He sits outside the Temple doors and talks to anyone who'll listen about vaults and makers, and Tyrande lets him, so I've nothing to say about it except that I hold my tongue every time I pass." },
        { id = "gw_trouble", when = { questActive = TODO_QUEST("Trouble in Darkshore?") },
          text = "Greywhisker, who's sent you to find his crew in Darkshore, I'd wager. They're digging in the ruins of my people again, and if they've lost themselves in there, the ruins have a sense of humour." },
      },
      choices = {
        { text = "He seems harmless, and a little lonely.", next = "greywhisker_lonely" },
        { text = "He's a scholar, not a looter. Leave him be.", next = "BACK", reply = "I leave him be, mostly, because the High Priestess wishes it. I only wish he would stop asking the priestesses where the old walls are.", fx = { align = { light = 1 } } },
        { text = "Keep an eye on him. Scholars dig too.", next = "BACK", reply = "Oh, I do, and so do the Sentinels at the Temple doors. A scholar with a shovel is still a man with a shovel.", fx = { align = { light = -1 } } },
      },
    },
    greywhisker_lonely = {
      lines = {
        { id = "gl_default", text = "Lonely, is he? I suppose he might be, a dwarf among all these trees with no one to drink with. I've never once stopped to ask him, and I'm not sure I like what that says about me." },
      },
      choices = {
        { text = "You could start with a greeting.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdwarf = {
      lines = {
        { id = "xd_default", text = "I have, and I'll tell you why, since you asked. Dwarves cut down my grove in Darkshore to shore up a trench, and every pair of dwarven boots I've seen since looks to me like it's measuring the ground for a shovel." },
      },
      choices = {
        { text = "Dwarves farm and brew too. Barley doesn't grow in a mine.", next = "xdwarf_farm", fx = { align = { order = 1 } } },
        { text = "Some of my kin forget the earth isn't a quarry.", next = "xdwarf_kin", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Teach me, then. Let me be the dwarf who learns the hill.", tag = "Persuade", next = "xdwarf_soft",
          check = { pass = { any = { { disposition = { min = 65 } }, { origin = "dwarf_stone_listener" }, { origin = "dwarf_bear_tracker" }, { profession = { name = "Herbalism", min = 75 } } } } },
          fail = { next = "xdwarf_fail", fx = { affinity = -1 } } },
      },
    },
    xdwarf_farm = {
      lines = {
        { id = "xdf_default", text = "Barley, yes, for all that ale of yours, I've heard. A people who grow their own drink cannot hate the soil entirely, I suppose, but I've yet to see one of you plant a tree." },
      },
      choices = {
        { text = "Come to Dun Morogh. Our pines have stood for centuries, uncut.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf_kin = {
      lines = {
        { id = "xdk_default", text = "That's not something I expected to hear from a dwarf. Say it again in Ironforge sometime, loudly, and then come and tell me how it was received." },
      },
      choices = {
        { text = "I might, at that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf_soft = {
      lines = {
        { id = "xds_default", key = true, fx = { npcFlag = { set = { "firodren_soft" } } },
          text = "A dwarf who wants to learn the hill instead of open it. I could refuse you, and I'd be the same as the dig crew who wouldn't listen to me, so come closer and I'll show you how to tell a living root from a dead one." },
      },
      choices = {
        { text = "Thank you, Firodren. I'll listen.", next = "BACK", fx = { affinity = 2 } },
        { text = "What happened to your grove?", next = "dwarves_grove" },
      },
    },
    xdwarf_fail = {
      lines = {
        { id = "xdfa_default", text = "Pretty words. The young one with the lantern had pretty words too, standing in the stumps of my oaks, so I will wait to see what your hands do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Then I'll go.", next = "END" },
      },
    },

    xnelf = {
      lines = {
        { id = "xn_default", text = "Not every race, no. The humans burn forests, but mostly by accident, and the gnomes poisoned their own city before they ever touched ours. It's the dwarves who come here on purpose, with shovels, to see what we left behind." },
      },
      choices = {
        { text = "The dwarves fight beside us. That should count for something.", next = "BACK", reply = "It counts for much on the battlefield, and I will not insult their dead. It counts for less in Ameth'Aran, where their crates go out full.", fx = { align = { light = 1 } } },
        { text = "You're right. Our ruins are ours, not theirs to dig.", next = "BACK", reply = "Ours, and our dead's, and not a curiosity for the Explorers' League. It is a comfort to hear someone say it plainly.", fx = { align = { light = -1 } } },
        { text = "And Teldrassil, Firodren? Did we ask anyone before we grew it?", next = "tree_pride" },
      },
    },

    xsoft = {
      lines = {
        { id = "xso_default", text = "For you, always. I passed Greywhisker on the steps yesterday and wished him a good morning, and he looked at me as if the tree had spoken, so you see what you've started." },
        { id = "xso_dwarf", when = { race = "Dwarf" },
          text = "For you, always, dwarf. I even showed one of your kin where the roots run under the Enclave last week, so she could walk around them, and she thanked me as if I'd given her gold." },
      },
      choices = {
        { text = "That's good to hear.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darkshore born, and a gatherer since long before Hyjal burned. I came up the tree for good when my grove was gone and there was nothing left there to tend." } },
    advice = { { id = "tp_ad", text = "Pinch the stem, don't tear it, and leave the biggest plant to seed. A greedy herbalist only picks a field once." } },
    explorers_league = { { id = "tp_league", text = "Dwarves with brushes and shovels who call it scholarship. Their scholarship is in crates on a boat to Menethil." } },
    teldrassil = { { id = "tp_teldrassil", text = "Our new home, and our new worry. Something grows wrong in its roots, and I see it in the leaves before the druids admit it aloud." } },
    _none = { { id = "tp_none", text = "If it doesn't grow, I don't know it. Ask someone who spends more time indoors." } },
  },
}
