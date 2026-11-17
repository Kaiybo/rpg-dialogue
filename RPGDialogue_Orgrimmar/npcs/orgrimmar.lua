-- Orgrimmar. Voice: bibles/orgrimmar.md
-- Neeru Fireblade's secret (he runs the Burning Blade) never slips from his own mouth;
-- Thrall's lines show he already suspects.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thrall", id = TODO_NPC("Thrall"), name = "Thrall",
  bible = "bibles/orgrimmar.md", role = "noble", tier = "major",
  communities = { "orgrimmar" }, temper = { "steady" }, values = { "honorable", "compassionate", "cunning" },
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "Thrall carries Orgrim Doomhammer's hammer and spends every day trying to deserve it. He listens like a shaman and speaks like a chieftain, and he has plainly never forgotten what it was to be a slave.",
    third = "{name} stood before Thrall, Warchief of the Horde, in Grommash Hold in Orgrimmar.",
  },

  greetings = {
    { id = "g_warchief", text = "Lok'tar. Speak freely, warrior. In this hall, every voice of the Horde is heard." },
    { id = "g_orc", when = { race = "Orc" }, text = "{g:Brother|Sister}, we were slaves once, and now we have a home. Never let anyone make us forget either." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and the Horde is stronger for every warrior who comes back. Sit with me a while." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The elements spoke to me when I had nothing else. Listen to them, and they'll never leave you alone." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. The Horde has a long, bitter history with your arts, and I'll judge you by what you do with them, as will everyone else." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "The Forsaken stand with us. I won't pretend I understand the Dark Lady, but I understand being made into something you never chose." },
  },

  start = "hello",
  nodes = {
    xpt_thrall = {
      big = true,
      lines = { { id = "xpt_thrall_default", text = "Then you already understand what took me years to teach. The Horde I lead is orc and troll and tauren and now the Forsaken, and none of them owe the others anything but the word they gave, so the only thing holding us together is people like you choosing to stand beside each other." } },
      choices = {
        { text = "A word given is worth more than shared blood, Warchief.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Alliances like ours last only as long as they're useful.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Do you truly trust the Forsaken, Warchief?", next = "xpt_thrall2" },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    xpt_thrall2 = {
      lines = { { id = "xpt_thrall2_default", text = "I trust that they hate the Scourge as much as we do, and for now that is enough to build on. Cairne counselled me to give them a chance and I have, but I keep my eyes open, and I'd ask you to do the same without letting your suspicion show." } },
      choices = {
        { text = "I'll keep my eyes open, Warchief.", next = "BACK" },
      },
    },
    xcl_rend = {
      big = true,
      lines = { { id = "xcl_rend_default", text = "Then the last of Blackhand's line to claim my title is gone. Rend gathered the Blackrock who would not follow me and gave them to the black dragons in the Spire, and he called that rabble the true Horde. He thought the Horde was a weapon to be pointed at the world, and I have spent my life proving it can be a people instead." } },
      choices = {
        { text = "The Horde needs one Warchief, and every clan should answer to him.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the clans choose their own chiefs, Warchief. That's the old way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who still follows the Blackrock in the Spire?", next = "xcl_rend2" },
      },
    },
    xcl_rend2 = {
      lines = { { id = "xcl_rend2_default", text = "Too many orcs who never shook off the hatred of the camps, and a few who never wanted to. The black dragons give them weapons and promises, and Rend gave them a name to shout, so without him they are only soldiers serving a dragon, and I mean to make sure they hear it." } },
      choices = { { text = "Then they've lost their reason to fight, Warchief.", next = "BACK" } },
    },
    xcl_rfc = {
      big = true,
      lines = { { id = "xcl_rfc_default", text = "Then you've seen how close they came. The Searing Blade crawled into the caves beneath Orgrimmar while we were still raising the walls above them, and they fed a demon down there and called it their master. I built this city as a home, and I won't let anyone turn its roots into a shrine to the Legion." } },
      choices = {
        { text = "Some of those cultists were orcs who lost their way. Offer them a way back.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A traitor to the Horde deserves no second chance, Warchief.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Who were they serving down there?", next = "xcl_rfc2" },
      },
    },
    xcl_rfc2 = {
      lines = { { id = "xcl_rfc2_default", text = "A demon the cultists called Taragaman, which they fed with blood and fire in the deepest cave. The Burning Blade served the Legion long before we came to Durotar, and some of my people still remember the taste of that power and miss it, which troubles me more than any demon." } },
      choices = { { text = "Then the Horde must remember what that power cost.", next = "BACK" } },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The same place any healer has, which is beside the wounded when the fighting stops. The shaman speak for the elements, but the elements do not bind a grunt's leg, and I have watched too many orcs die in the camps for want of someone who would kneel beside them." } },
      choices = {
        { text = "Then I'll kneel beside them, whoever they are.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I serve my own people first, Warchief, and the Horde after.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Strength, but strength with a purpose. The demon blood made my people mighty and taught them to love slaughter, and I will not let that hunger take root again, so fight for those behind you, the peons and the young ones, and never for the joy of killing alone." } },
      choices = {
        { text = "I fight to protect the Horde, Warchief, not for bloodlust.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A warrior fights for glory, Warchief. Let the peons protect themselves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They did, and they taught me that a Frostwolf rider never cages his wolf and never rides one that has not chosen him. A hunter who remembers that will never want for a loyal companion, and the Horde could stand to remember it too." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} watches me the way a Frostwolf watches a stranger, which is to say wisely. Treat it as kin, {class}, and it will stand by you when others will not." },
      },
      choices = {
        { text = "My companion is my equal, Warchief, not my servant.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A beast is a tool. I feed it so that it fights.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Cairne is too generous. We fought the centaur beside his people in the Barrens, yes, but the tauren offered us friendship when the rest of the world wanted us back in the camps, and I have never felt that debt was paid on our side." } },
      choices = {
        { text = "Then the Horde must repay it with loyalty.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Debts between friends shouldn't be counted at all.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you serve it in a way many forget, and I won't be one of them. When I escaped Durnholde, a quiet friend and an unlocked door freed me as surely as any battle, so I know the worth of work done in the dark, so long as it's done for the Horde and never against it." },
      },
      choices = {
        { text = "The shadows win battles before they start, Warchief.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd still rather stand in the open for the Horde.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What does the Horde stand for?", next = "horde" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "There is, though our people learned stranger powers first, from far worse teachers. The Darkspear and the Forsaken bring the arcane to the Horde with clean hands, and I'd ask you to keep them that way." },
      },
      choices = {
        { text = "My hands will stay clean, Warchief. For the Horde.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll use the arcane as I see fit.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What does the Horde stand for, Warchief?", next = "horde" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_band", tags = { "news" }, when = { party = { size = 4 } },
          text = "A full war band at my door, and every one of you armed. When I was a slave in Durnholde I dreamed of orcs gathering like this by their own choice and not at a warlord's order, so forgive me if I look at you a moment longer than I should." },
        { id = "h_pt_forsaken", tags = { "news" }, when = { party = { race = "Scourge" } },
          text = "You travel with one of Sylvanas's people, I see. Some of my warriors still make the sign against the dead when the Forsaken pass, and I would rather they learned from you than from me." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The Darkspear brought their healers across the sea with them, and now the Forsaken bring theirs from Lordaeron, and I am still learning what each of them prays to." },
        { id = "h_default", key = true,
          text = "Thrall, Warchief of the Horde. Orgrim Doomhammer gave me his hammer and his people with his last breath. I've spent every day since trying to deserve both." },
        { id = "h_garthok", when = { heardLine = "garthok.h_default" },
          text = "You've reported to Gar'Thok at Razor Hill. Nazgrel trained him well, and I sleep easier knowing he holds the crossroads." },
        { id = "h_cl_rend", tags = { "news" }, when = { killed = { name = "Rend Blackhand" }, faction = "Horde" }, text = "Word has come down from Blackrock that Rend Blackhand is dead. He called himself Warchief and called my Horde a pack of slaves, and I hope he understood at the end who had sent you." },
        { id = "h_cl_rfc", tags = { "news" }, when = { cleared = "Ragefire Chasm", faction = "Horde" }, text = "You've been to the bottom of Ragefire Chasm and come back up the stairs, and the Searing Blade will think twice before they light another fire under my city." },
        { id = "h_hidden", tags = { "news" }, when = { questActive = TODO_QUEST("Hidden Enemies") },
          text = "Some in my city wear the Horde's colours and serve older masters. I need someone they'll trust, so earn that trust, and then bring me what they know." },
        { id = "h_hidden_done", when = { questDone = TODO_QUEST("Hidden Enemies") },
          text = "You did well in the chasm. The rot isn't gone; it never is entirely. But it's weaker, and it knows I'm watching." },
        { id = "h_neeru", when = { heardLine = "neeru.h_default" },
          text = "The Cleft, was it? Neeru Fireblade is very helpful, isn't he? Keep being helpful back, quietly, and tell me what he says." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Horde" },
          text = "The Windshapers, then. The Earthen Ring vouched for you and the tauren took you in, and that's good enough for me. Welcome to the Horde." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "Welcome to my hall, druid. Cairne's people taught mine more about this land than we would ever have learned alone, and I count every tauren in Orgrimmar as kin." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior stands before me. The Horde was born in battle, but I would rather it were known for what its warriors protect than for what they destroy." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and a companion at your side. The Frostwolves taught me in Alterac that the bond with a beast is a bond of honour, and I have never forgotten it." },
      },
      choices = {
        { text = "What place does a priest have in a Horde of shaman, Warchief?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Cairne says the tauren owe you a debt, Warchief.", next = "druid_q", when = { class = "DRUID" } },
        { text = "What does the Horde stand for?", next = "horde" },
        { text = "What of the humans at Theramore?", next = "theramore" },
        { text = "You already suspect Neeru Fireblade, don't you?", tag = "Persuade", next = "neeru_suspect",
          when = { heardLine = "neeru.h_default" },
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Hidden Enemies") }, { trait = "skeptical" } } } },
          fail = { next = "neeru_not_yet", fx = { affinity = -1 } } },
        { text = "I'm a warlock, Warchief. How does the Horde see me?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The elements answer me, Warchief, as they answered you.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'm an orc who studies the arcane. Does that trouble you?", next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = "I'm Forsaken, and the Light still answers me.", next = "paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "I'm Frostwolf, Warchief. Drek'Thar's people.", next = "frostwolf", when = { origin = "orc_frostwolf" } },
        { text = "I serve the Horde from the shadows, Warchief.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I study the arcane, Warchief. Is there a place for me?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What do you ask of the Horde's warriors, Warchief?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Did the Frostwolves teach you to hunt, Warchief?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I've cleared Ragefire Chasm, Warchief.", next = "xcl_rfc", when = { cleared = "Ragefire Chasm", faction = "Horde" } },
        { text = "Rend Blackhand is dead, Warchief. I was there.", next = "xcl_rend", when = { killed = { name = "Rend Blackhand" }, faction = "Horde" } },
        { text = "These are my companions, Warchief. We fight as one.", next = "xpt_thrall", when = { party = true } },
        { text = "For the Horde.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I fight for myself first, Warchief.", next = "END", fx = { align = { honor = -1 } } },
      },
      again = {
        { id = "h_again", text = "What else is on your mind? Speak plainly; I hear enough flattery from my advisors." },
        { id = "h_again2", text = "Go on. A Warchief who stops listening stops being one." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "With fear, and some of it is earned. Gul'dan's warlocks sold our people to the demons, and the blood they made us drink still burns in some of us, so every orc who calls up an imp reminds the Horde of the worst thing it ever did." },
        { id = "wl_troll", when = { race = "Troll" },
          text = "A Darkspear warlock is new to me, and to Vol'jin too, I'd wager. Your people never drank the blood, so perhaps you can show the orcs that the art and the curse aren't the same thing." },
        { id = "wl_cleft", when = { origin = "orc_cleft_initiate" },
          text = "You learned in the Cleft of Shadow, beneath Neeru's eye. Learn his spells if you must, but bring me what you hear down there, and never let him think he owns you." },
      },
      choices = {
        { text = "Then I'll use it to atone for what was done.", next = "warlock_atone" },
        { text = "I'll bind demons to serve the Horde, never the reverse.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The demons made us strong, Warchief. That's simply true.", next = "BACK", fx = { affinity = -3, align = { light = -1 } } },
      },
    },
    warlock_atone = {
      lines = { { id = "wa_default", text = "Atone. I like that word in a warlock's mouth more than I expected to. My people can't undo the blood, but we can choose what we do with what it left us, and if you mean that, you'll have my respect long before you have the city's." } },
      choices = { { text = "I mean it, Warchief.", next = "BACK", fx = { affinity = 2 } } },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Then you know they don't obey, they agree, and the day you forget that they'll stop agreeing. Drek'Thar taught me that in the snows of Alterac, and I've had to relearn it every year since I became Warchief." },
        { id = "sh_student", when = { origin = "orc_thrall_shaman" },
          text = "One of the students my shamans took in. You're the reason I gave them the time, because the Horde will need shamans long after it stops needing me." },
        { id = "sh_tauren", when = { race = "Tauren" },
          text = "The tauren kept the old ways when my people forgot them. When the Earth Mother speaks through you, I listen as carefully as I'd listen to the elements themselves." },
      },
      choices = {
        { text = "Is it harder to hear them as Warchief?", next = "shaman_harder" },
        { text = "I'll remember they agree, not obey.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    shaman_harder = {
      lines = { { id = "sz_default", text = "Much harder. A chieftain wants answers, and the spirits only offer balance. Some nights I go up to the hills outside the city and sit until the wind stops sounding like advisors." } },
      choices = { { text = "Then I'll keep the hills quiet for you.", next = "BACK", fx = { affinity = 2 } } },
    },
    orcmage = {
      lines = {
        { id = "om_default", text = "It troubles some of my chieftains more than it troubles me. Our warlocks reached for power without asking what it cost, and that's the one thing I'd ask you never to do, whatever the source." },
        { id = "om_primer", when = { origin = "orc_camp_primer" },
          text = "A primer stolen from a camp guard, I'm told. I learned my letters from a human too, in Durnholde, so I won't be the one to tell you where knowledge may come from." },
      },
      choices = {
        { text = "The Horde needs new strength, Warchief, not only the old ways.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask what it costs. I'll answer to the Horde.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    paladin = {
      big = true,
      lines = { { id = "pa_default", text = "Then you're a riddle I didn't expect to meet in my own hall. The Light has been a human weapon against my people for as long as I've lived, and if it burns you and you lift it anyway, I'd like to hear why." } },
      choices = {
        { text = "Because it hurts. I deserve to feel what I was.", next = "paladin_why" },
        { text = "The Light belongs to whoever bears its pain, Warchief.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "It's only a weapon. I use it on the living.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    paladin_why = {
      lines = { { id = "py_default", text = "Penance, then. I know something of carrying the weight of what you were made into. Just don't let the guilt become another master, because you've had enough of those, and so have I." } },
      choices = { { text = "I'll try, Warchief.", next = "BACK", fx = { affinity = 2 } } },
    },
    frostwolf = {
      lines = { { id = "fw_default", text = "Then you're kin of my kin. The Frostwolves took me in when I was nothing but an escaped slave half-dead in the snow, and Drek'Thar taught me the elements by their fires. Is the old shaman well?" } },
      choices = { { text = "He's well, and he speaks of you often.", next = "BACK", fx = { affinity = 3 } },
        { text = "He's old, Warchief, and the valley is hard.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    horde = {
      big = true,
      lines = {
        { id = "hd_default", text = "Once it stood for conquest. The demons made us into a weapon and pointed us at the world. Now it stands for survival, and for honour, and for each other. I mean to keep it that way." },
      },
      choices = {
        { text = "I'll help you keep it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Survival matters more than honour, Warchief.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Not everyone agrees.", next = "agree" },
      },
    },
    agree = {
      lines = { { id = "a_default", text = "No. Some still dream of the old fire, so I watch them, and I give them chances, and when they betray us, I don't miss." } },
      choices = { { text = "...", next = "END" } },
    },
    neeru_suspect = {
      lines = {
        { id = "ns_default", text = "Since the day he offered to watch the Burning Blade for me. Nobody knows that much about a fire without standing close to it, and Neeru knows a great deal. I keep him where I can see him, and I let him think I'm grateful." },
        { id = "ns_chasm", when = { questDone = TODO_QUEST("Hidden Enemies") },
          text = "You've been down in the chasm and seen what crawls there, so yes, I suspect him. A snake I can see is safer than one I can't, and so he stays in the Cleft, and I watch him smile." },
      },
      choices = {
        { text = "Your secret is safe with me, Warchief.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll keep listening to him, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    neeru_not_yet = {
      lines = {
        { id = "nn_default", text = "Neeru serves the Horde, as you do. If you have proof, bring it to me; if you have only a feeling, keep it to yourself for now." },
        { id = "nn_stranger", text = "I don't speak ill of my advisors to someone I barely know. Earn that, and ask me again." },
      },
      choices = { { text = "Understood, Warchief.", next = "BACK" } },
    },
    theramore = {
      lines = { { id = "t_default", text = "Jaina Proudmoore is a friend, though her people and mine aren't. We keep the peace between us with our own hands, because nobody else will. It is harder than any battle I've fought." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Warchief hears from every corner of the Horde, though not always the truth. Ask me about these, and I'll tell you what I believe." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You've earned straight answers from me, and I'll give you as many as I have." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer, because a Warchief answers his people, even the ones he isn't sure of yet." },
    },
    cenarion_circle = { { id = "tp_circle", text = "The tauren walk with them, and I'm glad of it; the world needs more who heal than wound." } },
    wailing_caverns = { { id = "tp_caverns", text = "The tauren have told me of something sick under the Barrens. When our young warriors are ready, they'll go in." } },
    burning_blade = { { id = "tp_blade", text = "Some of my own people still kneel to the old fire. They hide better than they think, and not as well as they hope." } },
    echo_isles = { { id = "tp_isles", text = "The Darkspear will have their home back. I gave Vol'jin my word, and I don't give it lightly." } },
    _none = { { id = "tp_none", text = "I don't know, but ask my advisors, and then come and tell me what they said, in plain words." } },
  },
}

P:NPC {
  key = "voljin", id = TODO_NPC("Vol'jin"), name = "Vol'jin",
  bible = "bibles/orgrimmar.md", role = "noble", tier = "major",
  communities = { "orgrimmar" }, temper = { "wry" }, values = { "cunning", "loyal", "wise" },
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "Vol'jin only talks to the interesting ones, he says, and he watched me the whole time as if deciding which I was. His humour is sly, but his debt to Thrall runs deeper than any joke.",
    third = "{name} met Vol'jin, chief of the Darkspear trolls, who stands at the Warchief's side in Orgrimmar.",
  },

  greetings = {
    { id = "g_hall", text = "Come, sit. The Warchief talk to everybody, but Vol'jin only talk to the interesting ones, so let's see which you be." },
    { id = "g_troll", when = { race = "Troll" }, text = "Darkspear! Stand up straight, mon. You carry the tribe's name everywhere you walk now." },
    { id = "g_back", when = { metBefore = true }, text = "You come back, good. That mean you still alive, and still interesting." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You talk to the spirits too, eh? Careful which ones answer, because some of them be hungry." },
    { id = "n_elf", cat = "race", when = { race = { "NightElf", "Skyborne" } },
      text = "An elf, in the Warchief's hall. Elves don't trust trolls easy, and that be fair, since we got history. I don't take offense, not yet." },
  },

  start = "hello",
  nodes = {
    xpt_voljin = {
      big = true,
      lines = { { id = "xpt_voljin_default", text = "Know that we were nearly wiped out, mon, hunted by the sea witch's murlocs and by our own kin, until Thrall's ships came through the storm and took us off the Echo Isles. A Darkspear remembers every debt, good and bad, so be the kind of friend they owe something to and not the other kind." } },
      choices = {
        { text = "I'll stand by my companion as Thrall stood by you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Debts are for merchants. I fight for what I can take.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Vol'jin.", next = "BACK" },
      },
    },
    xcl_zg = {
      big = true,
      lines = { { id = "xcl_zg_default", text = "Quiet for now, mon. The Gurubashi call that Soulflayer into the world because they want their empire back, and they forget that a god who drink blood never stop at the enemy's. My people lose our place in that jungle long ago, and I won't pretend I grieve for the ones who drive us out, but no troll should be food for Hakkar." } },
      choices = {
        { text = "Even the Gurubashi deserved better than to be his food.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Those trolls chose their god, Vol'jin. Let them pay his price.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Who are the Zandalar to the Darkspear?", next = "xcl_zg2" },
      },
    },
    xcl_zg2 = {
      lines = { { id = "xcl_zg2_default", text = "The Zandalar be the oldest of us, mon, the ones who remember when all trolls be one people. They keep to their island and their histories, and they only come to Yojamba Isle because Hakkar frighten even them, which tell you how bad it be." } },
      choices = { { text = "Then the Darkspear and the Zandalar want the same thing, for once.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Trouble me? No, mon. I seen the loa ride stranger horses than you. But the Light was the humans' spear, and the orcs remember who held it over the camps, so you be watched in this city until you give them a reason to stop." } },
      choices = {
        { text = "Then they can watch me keep faith with the Horde.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them watch. I owe the orcs no explanations.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They listen, mon, though they don't always answer the way you be wantin'. Zalazane think the loa give power to whoever shout the loudest, and look where that take him, cursin' his own people on Echo Isles. A priest who listen more than he shout, that one the spirits remember." } },
      choices = {
        { text = "Then I'll listen, and heal whoever needs it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sometimes the spirits must be made to answer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Zalazane on the Echo Isles, with his hexed trolls and his madness, and the Kul Tirans at Tiragarde Keep, who never forgave us for walkin' free. Thrall gave us Sen'jin Village, but a gift like that only stay given if somebody be willin' to bleed for it." } },
      choices = {
        { text = "The Darkspear are Horde, Vol'jin. Their fight is mine.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll fight for pay, chieftain, not for old troll feuds.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "More often than the priests of either would like to admit. Both say the land remember everything you do to it, and both say it don't forgive easy." } },
      choices = {
        { text = "The old spirits deserve the old respect.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Spirits or not, the Horde does what it must.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you learned from the best, mon, because the Darkspear survived the Echo Isles by never being where the enemy looked. I don't ask my people to fight fair, only to fight for each other, and I don't care who sees it." },
        { id = "xrogue_troll", when = { race = "Troll" }, text = "Then you remember the old ways, mon, and a Darkspear who remember them lives long. We survived the Echo Isles by never being where the enemy looked, and I don't ask my people to fight fair, only to fight for each other." },
      },
      choices = {
        { text = "Fair fights are for fools. I fight to win.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather my enemies see me coming, chief.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What happened to the Echo Isles?", next = "isles" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A troll can walk any path that keep him alive, mon, and the arcane be just another power to bargain with. The loa don't mind a mage who remembers his offerings, and the Darkspear mages in the Valley of Spirits still burn something sweet for them every morning." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "A dead man who learn the arcane, that be a strange thing to bring to a troll, mon. The loa don't like you much, but they don't like most people, so keep your spells pointed away from my people and we'll get along." },
      },
      choices = {
        { text = "I'll respect the loa, as they deserve.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The loa can watch. I'll study what I like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why follow Thrall, chief?", next = "thrall" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_troll", tags = { "news" }, when = { party = { race = "Troll" } },
          text = "You run with a Darkspear, mon, and that tells me more about you than any badge of rank. My people don't trust easy after everything that's been done to us, so if {companion} walks beside you, you earned it somewhere." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead man carryin' the Light of the humans. Now dat be interestin', and Vol'jin only talks to the interestin' ones." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, mon, and one of the Horde's own. The loa watch who do the healin' and who do the hurtin', and the best of my people learn to do both when the time be right." },
        { id = "h_default", key = true,
          text = "Vol'jin, chief of the Darkspear. Thrall stand with my people when nobody else would. Now I stand at his side and tell him what he don't want to hear." },
        { id = "h_nimboya", when = { heardLine = "nimboya.h_default" },
          text = "Nimboya find you in the jungle, eh? Then you know my youngest be lost down there. Nimboya bring him home, or nobody will." },
        { id = "h_gadrin", when = { heardLine = "gadrin.h_default" },
          text = "You see old Gadrin? He still tell people I be his best student? Good, because he right." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid, mon! Your people and mine both know what it be to have the land under your feet taken away, so Vol'jin always be glad to see a horned one in this city." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon. Good, because the Darkspear be few, and every strong arm in Orgrimmar be one more spear between my people and the ones who want us gone." },
        { id = "h_cl_zg", tags = { "news" }, when = { cleared = "Zul'Gurub", faction = "Horde" }, text = "So you be walkin' out of Zul'Gurub with the Blood God's priests dead behind you. The word from Yojamba be that Hakkar is cast down, and Vol'jin don't mind sayin' he sleep better for it." },
      },
      choices = {
        { text = "Do the loa still listen to a priest, Vol'jin?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the loa and the Earth Mother ever agree?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why follow Thrall?", next = "thrall" },
        { text = "What happened to the Echo Isles?", next = "isles" },
        { text = "I deal with demons, chief. Does the tribe mind?", next = "warlock", when = { race = "Troll", class = "WARLOCK" } },
        { text = "The spirits talk to me too, Vol'jin.", next = "shaman", when = { race = "Troll", class = "SHAMAN" } },
        { text = "I hunt heads for the Darkspear.", next = "hunter", when = { race = "Troll", class = "HUNTER" } },
        { text = "You don't trust the Forsaken, do you?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I strike from the jungle, chief, the old way.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can a mage walk beside the loa, chief?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Who threatens the Darkspear now, Vol'jin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Does a Forsaken with the Light trouble you, Vol'jin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Hakkar is cast down, Vol'jin. Zul'Gurub is quiet.", next = "xcl_zg", when = { cleared = "Zul'Gurub", faction = "Horde" } },
        { text = "My companion is Darkspear. What should I know of your people?", next = "xpt_voljin", when = { party = { race = "Troll" } } },
        { text = "Farewell, Vol'jin.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else, mon? Vol'jin got time for the interesting ones." },
        { id = "h_again2", text = "Speak, speak. The Warchief be busy, so you get me." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "Mind? The tribe whisper about you, mon, I won't lie. Darkspear got voodoo and loa and the old spirits, and now one of us go knocking on the door of the things that ruin the orcs, so they wonder what you be bringing home." },
        { id = "wl_voice", when = { origin = "troll_other_voice" },
          text = "Gadrin tell me about you, the one with the voice. He scared, and Gadrin don't scare easy, so you be careful in my city." },
      },
      choices = {
        { text = "I'll bring home power for the tribe, nothing more.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll keep the demons on a short leash, for the tribe.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "What should I bring, then?", next = "warlock_bring" },
      },
    },
    warlock_bring = {
      lines = { { id = "wb_default", text = "Answers. The Burning Blade be orcs, and they hide from orcs, but nobody think to hide from a troll. You learn what they know, and you tell Vol'jin first." } },
      choices = { { text = "You'll hear it first, chief.", next = "BACK", fx = { affinity = 2, learn = { "burning_blade" } } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Good, then the Darkspear got another voice in the Warchief's circle. Orc shamans be good, but they learn the spirits from Thrall's old teacher, and our spirits be older and grumpier, so you remind them now and then." } },
      choices = { { text = "Grumpier spirits. I'll remember.", next = "BACK", fx = { affinity = 2 } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "The old way, eh? Good, because my father take heads for the tribe, and his father before him. Just you remember that out here among the orcs and the tauren, some think it be savage, so you show them what it means: respect, not cruelty." } },
      choices = {
        { text = "Let them think it savage. Fear keeps enemies away.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll show them respect, chief.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    forsaken = {
      big = true,
      lines = { { id = "fk_default", text = "Trust? No, mon, and I tell the Warchief so to his face. Your Dark Lady got eyes like a hungry crocolisk, and her apothecaries brew things in the Undercity that make my witch doctors shiver. You I judge separate, though." } },
      choices = {
        { text = "That's fair. Judge me by what I do.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The Dark Lady doesn't need a troll's trust.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    thrall = {
      big = true,
      lines = {
        { id = "t_default", text = "When the murlocs come for us, Thrall fight beside us. My father die that day, and Thrall don't leave. A debt like that, you pay with your whole life." },
      },
      choices = {
        { text = "That's a heavy debt.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A debt's only as heavy as you let it be.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    isles = {
      lines = {
        { id = "i_default", text = "Zalazane be my friend since we was small, and now he wear our home like a mask. Gadrin work to take it back, and one day we do it, mon. One day." },
      },
      choices = {
        { text = "I'll help when that day comes.", next = "END", fx = { affinity = 2, learn = { "echo_isles" } } },
        { text = "Part of you still hopes to find your friend in him.", tag = "Persuade", next = "zalazane_friend",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Troll" }, { heardLine = "gadrin.h_default" } } } },
          fail = { next = "zalazane_closed", fx = { affinity = -1 } } },
      },
    },
    zalazane_friend = {
      lines = {
        { id = "zf_default", text = "When we was small, Zalazane dare me to swim to the far rock, and when I tire, he swim out after me. Some nights I think that boy still be in there, under all the voodoo. Then I remember what he do to our people, and I know I got to stop him anyway." },
        { id = "zf_troll", when = { race = "Troll" },
          text = "You be Darkspear, so you know what it mean to lose a brother to bad magic. Yes, I hope. Hope be a foolish thing for a chief to carry, and I carry it anyway, and I don't tell the Warchief." },
      },
      choices = {
        { text = "Hope isn't foolish, Vol'jin.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll keep that to myself.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    zalazane_closed = {
      lines = {
        { id = "zc_default", text = "Zalazane be my enemy, and that be all you need to know about him, mon." },
        { id = "zc_quick", text = "You reach for a chief's heart quick, mon. Slow down, and maybe one day I show you." },
      },
      choices = { { text = "Fair enough.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Vol'jin hear plenty, mon: from the Warchief, from the spirits, and from the trolls who whisper in the corners. Ask me about these." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You be a friend now, so I tell you straight, with no riddles, or not many." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I tell you some, but Vol'jin don't hand his whole mind to strangers." },
    },
    yenniku = { { id = "tp_yenniku", text = "He be my son. Say his name careful, mon; I say it every night." } },
    echo_isles = { { id = "tp_isles", text = "I see them in my sleep: the sand, the sea, the old huts, and Zalazane's puppets walking where my father walked." } },
    burning_blade = { { id = "tp_blade", text = "Orcs who miss the demons. The Warchief watch them closer than they think, and so do I." } },
    _none = { { id = "tp_none", text = "Vol'jin don't know that one, and Vol'jin don't pretend." } },
  },
}

P:NPC {
  key = "neeru", id = TODO_NPC("Neeru Fireblade"), name = "Neeru Fireblade",
  bible = "bibles/orgrimmar.md", role = "questgiver", tier = "major",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "ambitious", "proud" },
  notices = { "class", "fel" },
  impression = {
    first = "Smooth-spoken Neeru Fireblade calls himself a loyal servant of the Warchief, which may well be true. He watches the Horde's fire-worshippers very closely, and I cannot quite tell how he feels about what he sees.",
    third = "{name} met Neeru Fireblade in the Cleft of Shadow, who claims to keep watch over those in the Horde who still play with fire.",
  },

  greetings = {
    { id = "g_cleft", text = "The Cleft of Shadow welcomes you. Don't be alarmed by the dark; it keeps the curious out, and the useful in." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my capable friend. I was hoping you'd return. I have more work for capable friends." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", when = { class = "WARLOCK" },
      text = "A fellow student of the deeper arts. We're misunderstood, you and I. Thankfully, we understand each other." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, how quaint. The elements are so very polite, aren't they? Do come back if you ever want more than politeness." },
  },

  start = "hello",
  nodes = {
    xpt_neeru = {
      big = true,
      lines = { { id = "xpt_neeru_default", text = "Then your companion is braver than most, because the warlocks of the old Horde are blamed for every wound our people still carry. I teach the young ones to command what they summon and never to beg it for favours, and if your friend has learned that, they'll outlive their critics." } },
      choices = {
        { text = "My companion's power keeps us alive, and I welcome it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Fel magic damned the Horde once. I don't like it near me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Is there no cost to what warlocks summon?", next = "xpt_neeru2" },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xpt_neeru2 = {
      lines = { { id = "xpt_neeru2_default", text = "There is always a cost, friend, and the trick is making certain someone else pays it. That was a joke, mostly; the demons take whatever they can, and a good warlock simply gives them nothing they can use." } },
      choices = {
        { text = "I'll remember that, Neeru.", next = "BACK" },
      },
    },
    xcl_rfc = {
      big = true,
      lines = { { id = "xcl_rfc_default", text = "Broken is such a strong word, though I suppose it will do. The cultists down there were young and loud and terribly eager, and eagerness is how a cult gets itself noticed by the wrong people. Taragaman was always hungrier than they understood, so perhaps they were fortunate you found them first." } },
      choices = {
        { text = "They were fools, Neeru, but fools can be useful.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Any orc who kneels to a demon deserves the same end.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Did you ever go down into the chasm yourself?", next = "xcl_rfc2" },
      },
    },
    xcl_rfc2 = {
      lines = { { id = "xcl_rfc2_default", text = "Oh, once or twice, purely to keep an eye on things, as the Warchief asked. The caves run deeper than most of the city realises, and the fire down there is older than Orgrimmar. One learns a great deal about people by watching what they do in the dark." } },
      choices = { { text = "I'll remember that, Neeru.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Every power is dangerous in the wrong hands, friend, and the Light has had some very wrong hands in its time. The Silver Hand kept my people in pens with it. I don't say you'd do the same; I only say I will be watching, as I watch everyone." } },
      choices = {
        { text = "Watch all you like. I've nothing to hide.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Watch your own hands, Neeru. I'll watch mine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I watch everyone, friend, because that is what the Warchief needs from someone like me. Priests are seldom any trouble, though the shadow your kind draws on is a cousin to the fire I keep an eye on, and cousins do have a way of visiting each other." } },
      choices = {
        { text = "The shadow serves my healing, nothing more.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. I'll draw on whatever answers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Work? Oh, the Cleft is perfectly peaceful, I assure you, and the Warchief's guards see to that. If it's a fight you want, Orgnil Soulscar hunts the Burning Blade down in Durotar, and I'm told he's never short of cultists, though I can't imagine where they all come from." } },
      choices = {
        { text = "Then I'll help Orgnil cut the Burning Blade down.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Cultists pay well too, I hear. I'm not particular.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Beasts have honest noses, and the Cleft smells of things that were summoned rather than born. Pay it no mind, my friend; the warlocks keep their pets on short leashes, which is more than I can say for some hunters I've met in the Drag." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps looking at me, doesn't it? Animals are such poor judges of character, and I've always found that rather charming." },
      },
      choices = {
        { text = "I trust my beast's nose more than any warlock's word.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Summoned or born, a pet is a pet. I don't judge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I make sure they remember whom they serve, which is more than they'd manage on their own. Your people never had to learn what fel magic does to a land, but we orcs left Draenor dry and dying because of it." } },
      choices = {
        { text = "Fel magic should be forbidden in the Horde.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Power is a tool. Let them use it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I watch everyone in the Cleft, friend, because the Warchief asked me to, and because both trades depend on not being watched. The rogues of the Shattered Hand keep their own counsel down here, and we get along best when neither of us asks too many questions." },
      },
      choices = {
        { text = "Then I'll trust your watch, and keep my counsel.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Watch all you like. I'll go where I please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do you think of Thrall?", next = "thrall" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Arcane fire is a much tidier thing than the kind the Cleft studies, I'll grant you. The trolls in the Valley of Spirits teach it well enough, and they'll tell you what I'd tell any warlock, which is that every flame wants more than you give it." },
      },
      choices = {
        { text = "I'll keep my flames under strict control.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let it want. I enjoy feeding it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What is the Burning Blade?", next = "blade" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_lock", tags = { "news" }, when = { party = { class = "WARLOCK" } },
          text = "Your friend {companion} carries the smell of sulfur and doesn't seem ashamed of it. Most orcs in this city look away from my sort, so it warms me to see someone who keeps such honest company." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who still calls on the Light. How very unusual. I make it my business to know everyone in Orgrimmar who handles a dangerous fire, and you are certainly one of them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. How refreshing; most of the Horde's spellcasters come to the Cleft of Shadow for something less wholesome than prayer." },
        { id = "h_default", key = true,
          text = "Neeru Fireblade, loyal servant of the Warchief. I keep an eye on those in the Horde who still play with fire. Someone with experience must, after all." },
        { id = "h_cl_rfc", tags = { "news" }, when = { cleared = "Ragefire Chasm", faction = "Horde" }, text = "I'm told the Searing Blade in Ragefire have lost their leaders, and their demon besides, and that you were the one who saw to it. How very thorough of you, and the Warchief must be delighted." },
        { id = "h_burning", tags = { "news" }, when = { questActive = TODO_QUEST("Burning Shadows") },
          text = "An eye, taken from a cultist's body? How dreadful. Bring it to me, and I'll see that it's dealt with properly." },
        { id = "h_akzeloth", when = { questActive = TODO_QUEST("Ak'Zeloth") },
          text = "My assistant will guide you. There's a seed of something unpleasant in the Barrens. We wouldn't want it growing where the wrong people could tend it." },
        { id = "h_hidden", when = { questActive = TODO_QUEST("Hidden Enemies") },
          text = "The Searing Blade in Ragefire are so eager, so very eager to prove themselves. Deal with their leaders, would you? It will clarify things, I think." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, down here in the Cleft of Shadow? The Warchief's tauren friends are always welcome, of course, though you'll find very little down here that grows." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, how refreshing. The Cleft sees so many curious young casters that it's good to be reminded the Horde still has strong arms to protect them from themselves." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter in the Cleft! We don't see many of your kind down here, because the beasts don't care for the smell of brimstone, and I can't say I blame them." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Searing Blade", min = 20 } }, text = "The Searing Blade in the chasm beneath the city have lost many of their number, and I hear you were among those responsible. The Warchief's enemies have fewer places to hide now." },
      },
      choices = {
        { text = "Do you watch the Horde's priests as closely as its warlocks?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do you make of the Horde's warlocks, Neeru?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What is the Burning Blade?", next = "blade" },
        { text = "What do you think of Thrall?", next = "thrall" },
        { text = "Thrall's patience will be the death of the Horde.", tag = "Deceive", next = "neeru_opinion",
          check = { pass = { any = { { disposition = { min = 60 } }, { class = "WARLOCK" }, { trait = "cruel" } } } },
          fail = { next = "neeru_loyal", fx = { affinity = -1 } } },
        { text = "I'm a warlock. What can the Cleft teach me?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "An orc mage. I suppose you find that amusing.", next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = "The elements would rather I stayed out of here.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Do you keep watch on the rogues of the Cleft too?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Fire is my craft too, Neeru. Arcane fire, though.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Is there work in the Cleft for a warrior, Neeru?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why do beasts shy away from the Cleft, Neeru?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Is the Light a dangerous fire, Neeru?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "The Searing Blade in Ragefire are broken, Neeru.", next = "xcl_rfc", when = { cleared = "Ragefire Chasm", faction = "Horde" } },
        { text = "My companion studies the same arts you do, Neeru.", next = "xpt_neeru", when = { party = { class = "WARLOCK" } } },
        { text = "I'll be going.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? Do ask; I so enjoy a curious mind." },
        { id = "h_again2", text = "Yes? The Cleft has all the time in the world, friend." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "Everything the Warchief's shamans won't, and with far less disapproval. The Horde fears our art, and fear is such a waste of good power. Down here, at least, we can speak of it honestly." },
        { id = "wl_cleft", when = { origin = "orc_cleft_initiate" },
          text = "Ah, one of our own initiates come home. You've learned your lessons well, I'm told. Do remember who taught them to you when the Warchief's people start asking questions." },
        { id = "wl_troll", when = { race = "Troll", class = "WARLOCK" },
          text = "A Darkspear, with the gift! How delightful. Your people never drank the old fire, so you come to it fresh and unafraid, and I find that refreshing." },
      },
      choices = {
        { text = "I'll learn your spells, and keep my own counsel.", next = "BACK", fx = { affinity = -1, align = { light = 1 }, trait = { skeptical = 1 } } },
        { text = "Then let's speak honestly. What do the Horde fear most?", next = "warlock_fear" },
        { text = "Fear is weakness. I'll take every power offered.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    warlock_fear = {
      lines = { { id = "wf_default", text = "Themselves, of course, and what they were when the fire was in them. Such a shame, because they were magnificent. But I'm only a humble watcher of these things, you understand, and I'd never wish it back." } },
      choices = { { text = "Of course not.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    orcmage = {
      lines = {
        { id = "om_default", text = "Amusing? Not at all; I find it encouraging. An orc who reaches beyond the axe and the totem is an orc who hasn't been told what to fear, and there are so few of you left." },
        { id = "om_primer", when = { origin = "orc_camp_primer" },
          text = "Self-taught, from a human primer? Then you already know the best power is the kind you take for yourself. The arcane is a fine start, but do come back when it stops being enough." },
      },
      choices = {
        { text = "The arcane will be enough for me.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "And when it isn't, I'll know where to come.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "The elements are terribly particular about the company they keep, aren't they? They never liked me much either. Do tell Thrall's shamans I said hello, the next time they're lecturing you about balance." } },
      choices = { { text = "I'll tell them you're watching.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } } },
    },
    blade = {
      big = true,
      lines = {
        { id = "b_default", text = "Fanatics, leftovers from the old days who still crave the fire the demons gave us. They're dangerous, foolish, and ever so useful to watch, and I watch them very closely." },
      },
      choices = {
        { text = "Good. Keep watching.", next = "BACK", fx = { affinity = 1 } },
        { text = "You seem to know them well.", next = "know", fx = { trait = { skeptical = 1 } } },
      },
    },
    know = {
      lines = { { id = "k_default", text = "One studies one's enemies, as surely you know. Now, I'm terribly busy." } },
      choices = { { text = "...", next = "END" } },
    },
    neeru_opinion = {
      lines = {
        { id = "no_default", text = "Careful, speaking that way in Orgrimmar. Though between friends, the Warchief's patience is a marvel: he waits so long to strike that his enemies grow old and comfortable, and some of them grow rather powerful." },
        { id = "no_warlock", when = { class = "WARLOCK" },
          text = "A fellow practitioner, saying such things aloud! I agree entirely, in theory, of course. The Horde was strong once, when it wasn't afraid of what made it strong, and some of us haven't forgotten how that felt." },
      },
      choices = {
        { text = "We understand each other.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll remember you said that.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    neeru_loyal = {
      lines = {
        { id = "nl_default", text = "What a curious thing to say to the Warchief's loyal servant. I shall pretend I didn't hear it, and you'll pretend you never said it." },
        { id = "nl_clumsy", text = "Oh, that was clumsy, friend. If you want to know what I think, you'll have to be far more interesting than that." },
      },
      choices = { { text = "Forget I spoke.", next = "BACK" } },
    },
    thrall = {
      lines = { { id = "t_default", text = "A great leader, with such vision, such patience, such faith in people. It's very touching." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I hear all sorts of things down here in the Cleft, and I'm generous with most of them. Ask about whatever catches your eye." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "For a friend as capable as you, I'll share everything I know, or nearly everything; one must keep a little back." },
    },
    _none = { { id = "tp_none", text = "I couldn't say, but do tell me if you hear anything interesting. I collect interesting things." } },
  },
}

P:NPC {
  key = "gryshka", id = TODO_NPC("Innkeeper Gryshka"), name = "Innkeeper Gryshka",
  bible = "bibles/orgrimmar.md", role = "innkeeper", tier = "service",
  communities = { "orgrimmar" }, temper = { "hearty" }, values = { "generous" },
  notices = { "weary", "hunger" },
  impression = {
    first = "Innkeeper Gryshka insists on meat first and stories after, and nobody leaves the Broken Tusk hungry. Mention Zargh, though, and she grows flustered, which is the most charming thing I have seen in Orgrimmar.",
    third = "{name} found a seat at the Broken Tusk, where Innkeeper Gryshka feeds Orgrimmar's warriors and keeps the inn loud.",
  },

  greetings = {
    { id = "g_tusk", text = "Sit, warrior. Food first, then you tell me who you fought. That's the price of a seat at the Tusk." },
    { id = "g_home", when = { homeInn = { "Orgrimmar", "Valley of Strength" } }, text = "The Tusk missed you! Your bed's warm and there's a haunch on the spit, so your timing's good." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "You've got blood everywhere, and some of it's yours. Sit down and eat before you fall down. Meat first, always meat first." },
  },

  start = "hello",
  nodes = {
    xpt_gryshka = {
      big = true,
      lines = { { id = "xpt_gryshka_default", text = "Pick your companions the way you'd pick a wolf, for loyalty first and teeth second, because I've seen more war bands broken by quarrels over loot than by any Alliance blade. The ones who come back to my inn every season are the ones who share the coin evenly and the night watches fairly." } },
      choices = {
        { text = "Every share equal. That's how a company holds together.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whoever does the most work should take the most loot.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Thanks, Gryshka.", next = "BACK" },
      },
    },
    xcl_rfc = {
      big = true,
      lines = { { id = "xcl_rfc_default", text = "Good, because some nights my cellar smells of brimstone, and I've told the guards so twice. The recruits joke that there's a whole city of troggs and cultists under the Cleft, and after a few ales they dare each other to go and look, and most of them come back limping. I patch them up and feed them and tell them to wait until they're grown." } },
      choices = {
        { text = "The guards should have sealed those caves long ago.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the young ones go down, Gryshka. It's how they'll learn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do the recruits say is down there?", next = "xcl_rfc2" },
      },
    },
    xcl_rfc2 = {
      lines = { { id = "xcl_rfc2_default", text = "Troggs, mostly, and fire-dancers in red robes, and a demon as tall as Grommash Hold, though that last part grows taller with every ale. Whatever's true, they come back hungrier than they left, and I'll not complain about that." } },
      choices = { { text = "Then I'll take a plate, and the story's yours.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Some of them. The old grunts saw that light in the camps, on the guards who kept them there, and they go quiet when it shows. Sit near the door and keep it to yourself after a few drinks, and they'll settle." } },
      choices = {
        { text = "I'll keep it quiet. They've earned their peace.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll have to learn the Light is mine now.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Only after they've lost, and only if nobody's watching, because an orc would sooner bleed than admit he needs mending. If you sit by the door with a bowl of stew, though, you'll find they come to you, and you can tell them the stew did it." } },
      choices = {
        { text = "I'll mend them and let the stew take the credit.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them bleed until they learn to ask.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every night, and I wouldn't have it otherwise, though I'd like them to break fewer stools. Grezz Ragefist's students come here after a hard day and arm-wrestle over my tables until somebody loses a tooth, so I keep a bucket by the door for the teeth." } },
      choices = {
        { text = "I'll keep my fights outside, Gryshka. Your inn deserves respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good brawl is half the fun of an inn.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My grandmother said a well-kept hearth is the first thing the spirits look for, and I keep this one burning night and day. The warlocks from the Cleft never sit near it, though, and you can make of that whatever you like." } },
      choices = {
        { text = "A warm hearth and a full plate honor the spirits best.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Warlock or not, their coin spends the same at an inn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Better than you'd think, once the ale's poured. The orcs boast and the tauren listen, and by the end of the night they're singing the same song in two languages." } },
      choices = {
        { text = "That friendship is worth more than any war.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Friendship is fine, but it's the war that binds us.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They do, and what's said in the Broken Tusk stays in the Broken Tusk, so mind you don't go repeating it in the Drag. I've thrown bigger orcs than you out the door for listening at tables, and I'll do it again." },
      },
      choices = {
        { text = "Understood. What's said here stays here.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A loose tongue is a gift. I'll take what I hear.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's the best thing you cook?", next = "best" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "My hearth's burned fine for years without a spell, and it'll burn fine after you've gone. Sit down, eat your meat, and let the fire do its own work for once." },
      },
      choices = {
        { text = "Fair enough. I'll leave your fire alone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A spell would burn hotter and longer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's good to eat tonight?", next = "best" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I mind, and so does every grunt in this room who remembers what the demon blood did to us. Leave the little horror outside the door, and if it scorches one of my tables, you'll be scrubbing it yourself." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "You're an orc, so you should know better than to ask. Half the grunts in this room still dream about the demon blood, so leave the little horror outside, and if it scorches one of my tables you'll be scrubbing it yourself." },
      },
      choices = {
        { text = "Fair. It waits outside, out of respect.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's harmless. Your grunts should grow thicker skin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What do you cook best, Gryshka?", next = "best" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_band", tags = { "news" }, when = { party = { size = 4 } },
          text = "Five of you, and every one of you looking hungry. Sit at the long table by the fire and keep your weapons off it, because the last war band that drank here broke two benches and a grunt's nose." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Do the dead even eat? Never mind, a paladin is a paladin, and nobody leaves the Broken Tusk hungry, not even one who glows a little." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at the Broken Tusk! Good, because half my customers leave with a black eye, and the other half give it to them." },
        { id = "h_default", text = "I'm Gryshka, and I keep the Broken Tusk, and I keep it fed. Nobody leaves my inn hungry, and a few leave too full to walk." },
        { id = "h_zargh", when = { questActive = TODO_QUEST("Meats to Orgrimmar") },
          text = "From Zargh? Choice cuts from the Barrens! He remembered, of course he remembered. Tell him, well, tell him the meat was very good." },
        { id = "h_zargh_ack", when = { heardLine = "zargh.h_default" },
          text = "Zargh, at the Crossroads? Did he mention me, did he really, and what did he say? No, don't tell me, or, well... yes, tell me!" },
        { id = "h_bones", when = { questDone = TODO_QUEST("Meats to Orgrimmar") }, text = "Zargh's kept sending cuts since that first delivery, and I send back the bones, clean. Let him wonder what it means; I'm still wondering myself." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "It's late, and the Tusk is loud, which is good. A quiet inn in Orgrimmar means something's wrong." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid in the Broken Tusk! Sit down before you knock the lamps over, and mind the stools, because the last one a tauren sat on is still in pieces." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at the Broken Tusk! Sit down and eat first, because the spirits can wait for you to finish a plate, and I'll not have you calling storms on an empty stomach." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Sit down before you fall down, because the ones who come in off the Valley of Honor always swear they aren't hungry until the stew's in front of them." },
        { id = "h_cl_rfc", tags = { "news" }, when = { cleared = "Ragefire Chasm", faction = "Horde" }, text = "You've been down Ragefire Chasm and back, have you? Sit and eat, because nobody comes up from those caves without a hole in their stomach, and I'd like to hear what's been making my floor so warm." },
      },
      choices = {
        { text = "Do your brawlers ever let a priest patch them up?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the spirits favor a good hearth, Gryshka?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do orcs and tauren get along here, Gryshka?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "What's the best thing you cook?", next = "best" },
        { text = "I brought in some game today.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Your regulars talk a lot after a few drinks, Gryshka.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I could keep your hearth burning with a spell, Gryshka.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do warriors cause much trouble in the Broken Tusk, Gryshka?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Mind if my imp warms itself at your fire?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does a Forsaken paladin bother your guests, Gryshka?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I went down Ragefire Chasm, Gryshka. It's quiet now.", next = "xcl_rfc", when = { cleared = "Ragefire Chasm", faction = "Horde" } },
        { text = "We're a company now, Gryshka. Any advice for us?", next = "xpt_gryshka", when = { party = { size = { min = 2 } } } },
        { text = "Just resting.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask while you chew, nobody minds at the Tusk." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "A hunter! Then you're the only kind of guest who brings meat into my inn instead of just taking it out. Hang it by the spit and tell me where you shot it, because I like to know whose kodo I'm roasting." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "And {pet} wants the bones, I can see it in those eyes. Go on, then, one bone, and don't tell the grunts I'm soft." },
      },
      choices = { { text = "Out past the Crossroads, near Zargh's ground.", next = "BACK", fx = { affinity = 2 } } },
    },
    best = {
      lines = { { id = "b_default", text = "Kodo, slow-roasted, or boar if the hunters are lucky, or anything Zargh sends, if I'm lucky." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone who eats at the Tusk talks with their mouth full, and I hear every word of it. Ask me about any of this, and then eat something." },
    },
    _none = { { id = "tp_none", text = "Ask the regulars; they know everything, and drink to the rest." } },
  },
}

P:NPC {
  key = "gamon", id = TODO_NPC("Gamon"), name = "Gamon",
  bible = "bibles/orgrimmar.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "resigned" }, values = { "patient" },
  notices = { "class", "drink" },
  impression = {
    first = "Gamon was a warrior once and now spends most days on the inn floor, knocked down by whoever wants an easy fight. He always gets back up, which is the saddest and bravest thing about him.",
    third = "{name} met Gamon, a weary tauren in Orgrimmar who has been knocked down so often he no longer asks why.",
  },

  greetings = {
    { id = "g_sigh", text = "Oh, hello. You're not going to hit me, are you? Everyone hits me, and I've stopped asking why." },
    { id = "g_low", when = { maxLevel = 5 }, text = "Another young one. Let me guess: you heard there's a tauren in the inn you can beat up. There is, but please don't." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior? I was one too, once, and then I started drinking, and then people started hitting me. I'm not sure which came first anymore." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You're drunk too, finally someone who understands! Sit down, only please don't hit me." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because everyone does, and the last thing I saw with that glow around it was a human knight in Lordaeron putting me on my back for good. I got up then too, though it took the camps and ten years to do it." } },
      choices = {
        { text = "I'll not be the next to knock you down.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then stay down this time and save us both trouble.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Because tomorrow somebody will knock me down again, and then the healing's wasted on me. I was a warrior once, you know, and a good one, and I think I'd rather keep the bruises than pretend I'm still that orc." } },
      choices = {
        { text = "A warrior who keeps getting up is still a warrior.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then stop getting up, Gamon, and stop being their sport.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hunt? I used to chase boar through the scrub with my brothers once, and I could gut one faster than any of them. Now the only thing I track is the ale barrel, and Tazan says I'm losing the scent of that too." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours is the only one in Orgrimmar who's looked at me kindly all week. Can it stay a while? It's warmer than the floor." },
      },
      choices = {
        { text = "Get up, Gamon. A hunt would do you good.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Stay down, Gamon. It's safer for everyone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Once, I think, back before the drinking, when I still carried an axe for the Warchief. The wind told me to duck, and I did, and the spear went over my head, and I've been trying to hear it again ever since, mostly at the bottom of a mug." } },
      choices = {
        { text = "The wind still speaks, Gamon. Put the mug down and listen.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some warriors only have one good day in them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Would you? No, don't, because then they'd only knock me down harder tomorrow. I was a warrior once and I fought fair, and look where it got me, so maybe you've got the right idea after all." },
      },
      choices = {
        { text = "Some lessons are best taught from the shadows.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Next time, I'll stand beside you openly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why does everyone attack you?", next = "why" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Everything frightens me now, friend, so your demon's just one more thing on a long list. I saw what the warlocks became in the old wars, though, and I'd rather be knocked down by grunts every night than end up like them." },
      },
      choices = {
        { text = "You're right to be wary. I'll stay careful.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power has a cost, and I'll pay it gladly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why do they keep knocking you down?", next = "why" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Maybe it would, but out there nobody knocks you down, and I'm not sure I'd know who I was anymore. In here at least I know I'll get back up, and that's the one thing I'm still good at." } },
      choices = {
        { text = "Getting back up every time is a kind of honour, Gamon.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pride's no use to you. Walk away and start over somewhere.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Once, a troll froze me to the floor and everybody stepped over me for an hour, which was almost restful. I was a warrior before, you know, and I'd rather be hit than pitied, so do whichever you like." },
      },
      choices = {
        { text = "Nobody should be knocked down for sport, Gamon.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Get up and fight back, or stay on the floor.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Ha! A dead paladin. I've been knocked down by everything else in this inn, so I suppose you're next, are you?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You've come to look at my bruises, I suppose, and I'll tell you now that most of them are old ones." },
        { id = "h_default", key = true,
          text = "I'm Gamon. I help Tazan with his trade when I'm sober, and I'm usually here, lying on the floor because someone's knocked me down again." },
        { id = "h_bruise", when = { metBefore = true }, text = "Oh, you again. You didn't hit me last time, which makes you my favourite person in Orgrimmar. It's a short list." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Don't call lightning down on me, please, because I've been hit by most other things in this inn and I'd like to keep that one off the list." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. If you can turn into a bear, please don't do it near me, because I've been knocked down by orcs and trolls and I'd rather not add a bear to the list." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "Oh, a hunter. Mind your beast doesn't lick my face, because the last one did, and I couldn't get up to stop it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. Don't set me on fire, that's all I ask, because people usually settle for punching me." },
      },
      choices = {
        { text = "Why don't you let someone heal you, Gamon?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Did the spirits ever speak to you, Gamon?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would the wild do you more good than this inn, Gamon?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Why does everyone attack you?", next = "why" },
        { text = "I could teach whoever keeps knocking you down a lesson.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Would you ever hunt again, Gamon, if you got off that floor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does my demon frighten you, Gamon?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I won't hit you.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "You were a warrior once. What happened?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Has a mage ever knocked you down, Gamon?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why would I knock you down, Gamon?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Bye, Gamon.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? I'm not going anywhere, since I hardly ever do, unless somebody carries me." },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "I carried a big hammer once, and I wasn't bad with it either. I don't really remember when I put it down, which tells you most of what you need to know about me, I suppose." } },
      choices = {
        { text = "You could pick that hammer back up.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then stay away from the ale, Gamon.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "I'm here, I suppose, and I always get back up. Maybe that's the trouble; maybe if I stayed down, they'd get bored." },
      },
      choices = {
        { text = "Never stay down, Gamon.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Then stay down, and let them get bored.", next = "END", fx = { align = { honor = -1 } } },
        { text = "...", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know. I spend most days looking at the ceiling, and it's a nice ceiling." } },
  },
}
