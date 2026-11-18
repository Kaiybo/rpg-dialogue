-- Desolace's Forever-only quest givers: Aka'rai of Shadowprey Village, who wants the Hatefury
-- satyrs of Sargeron culled, and Umarak, an old Kolkar who wants the Maraudine khan dead.
-- Voices: bibles/desolace_forever.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local QAK = TODO_QUEST("Hate the Hatefury")
local QUM = TODO_QUEST("Khan Hratha")

---------------------------------------------------------------------------
-- Shadowprey Village
---------------------------------------------------------------------------

-- Aka'rai: Darkspear at Shadowprey Village; Hate the Hatefury.
P:NPC {
  key = "akarai", id = TODO_NPC("Aka'rai"), name = "Aka'rai",
  bible = "bibles/desolace_forever.md", role = "questgiver", tier = "quest",
  temper = { "fierce" }, values = { "loyal", "vengeful" },
  notices = { "class", "fel", "race" },
  impression = {
    first = "Aka'rai is a big Darkspear at Shadowprey Village who has learned to hate the Hatefury satyrs with a patience I didn't expect. He talks about the elves who became them as a lesson in what power costs.",
    third = "{name} met Aka'rai, a Darkspear of Shadowprey Village who wants the Hatefury satyrs of Sargeron destroyed.",
  },
  greetings = {
    { id = "g_default", text = "You come to Shadowprey, mon, you come for a reason. Tell me yours." },
    { id = "g_active", when = { questActive = QAK }, text = "The Hatefury still dance up at Sargeron, mon. Go and stop the music." },
    { id = "g_ready", when = { questReady = QAK }, text = "You stink of satyr, mon, and that's the best smell I've had all week. Come, tell me." },
    { id = "g_done", when = { questDone = QAK }, text = "The satyr-killer comes back to Shadowprey! Sit, mon, the fire is yours." },
    { id = "g_away", when = { away = 14, questDone = QAK }, text = "Gone {away}, mon, and the Hatefury are breeding again up north. They always do." },
  },
  notice = {
    { id = "n_warlock", cat = "fel", when = { class = "WARLOCK" },
      text = "I smell the fel on you, mon, same as the satyrs. You keep a leash on your demons, or one day you'll grow horns too." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "An elf, here? The satyrs were your people once, mon, before they sold themselves. Look at them well, and remember." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The spirits around Sargeron are sick, mon, and you'll feel it the moment you get close." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Aka'rai of the Darkspear. Shadowprey is quiet, mon, quiet like a blade in the dark, but up north at Sargeron the Hatefury satyrs play with demons, and I hate them more than I hate the centaur." },
        { id = "h_before", when = { questBefore = QAK },
          text = "You have the look of somebody who can kill, mon. The Hatefury satyrs at Sargeron serve the demons and the Burning Blade both, and I want their numbers cut so deep that they never grow back." },
        { id = "h_active", tags = { "news" }, when = { questActive = QAK },
          text = "Sargeron's in the northeast, mon, north past the Kodo Graveyard and up into the ruins. The Hatefury are thick there, so take care, because they like to play tricks before they kill." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { QAK, days = 3 } },
          text = "Word comes down from Ghost Walker that the satyrs have been quiet these past nights. That's your doing, mon, and I drank to it, twice." },
        { id = "h_done", when = { questDone = QAK },
          text = "They'll come back, mon, because demons always find new fools. But they'll come back fewer and slower, and every one you killed is one less whispering to the Burning Blade." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Speak." },
        { id = "h_again2", text = "Ask, ask. I've got nothing but time and hate in this place." },
      },
      choices = {
        { text = "Who are the Hatefury?", next = "hatefury" },
        { text = "Why do you hate them so much?", next = "hate" },
        { text = "What's Shadowprey Village like?", next = "shadowprey" },
        { text = "What do you think of Desolace?", next = "desolace" },
        { text = "I deal with demons too. Is that a problem?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "The satyrs were my people's kin, long ago.", next = "xnelf", when = { race = "NightElf" } },
        { text = "I'll hunt them.", next = "BUSINESS" },
        { text = "Farewell, Aka'rai.", next = "END" },
      },
    },
    hatefury = {
      lines = {
        { id = "hf_default", text = "Satyrs, mon, horned and hoofed and rotten through. They hold the ruins of Sargeron in the north, and they've made friends with the Burning Blade, and dat be all you need to know about either of dem.",
          fx = { learn = { "satyrs", "burning_blade" } } },
      },
      choices = {
        { text = "What were they, before?", next = "before" },
        { text = "What's the Burning Blade doing with them?", next = "blade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "bf_default", text = "Elves, mon, the high and proud ones, a long time ago before the world broke. They gave themselves to the demons for power, and the demons twisted them into what you see now, horns and all." },
      },
      choices = {
        { text = "So the elves made them.", next = "elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      big = true,
      lines = {
        { id = "el_default", text = "The elves made them, mon, and then left everyone else to clean up the mess, which is very like the elves. But that's how power goes, isn't it? You reach for it, and it reaches back. Do you think they deserved what happened?" },
      },
      choices = {
        { text = "They chose demons. They deserve every horn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Nobody deserves that. They were fools, but they were people.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade = {
      lines = {
        { id = "bl_default", text = "Orcs who went back to the old ways, mon, the warlock ways that the Warchief threw out. They squat in Thunder Axe Fortress, and they trade with the satyrs for demon-tricks, and between them they poison the land." },
      },
      choices = {
        { text = "I've heard of them in Durotar.", next = "durotar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    durotar = {
      lines = {
        { id = "du_default", text = "Then you know they're everywhere, mon, like rot under a log. Every one you kill here is one fewer there, and maybe one less knife at Thrall's back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hate = {
      lines = {
        { id = "ha_default", text = "Because the Darkspear know what it costs to bargain with dark things, mon. We've seen our own witch doctors go bad, and we've seen what's left after, and the satyrs are what happens when a whole people goes bad together." },
      },
      choices = {
        { text = "You mean Zalazane?", next = "zalazane" },
        { text = "Hate isn't a plan.", next = "plan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zalazane = {
      lines = {
        { id = "za_default", text = "Zalazane, yes, mon, and others before him. He holds the Echo Isles now with his hexed slaves, and I left Sen'jin to come here because I couldn't stand to look at the islands every morning.",
          fx = { learn = { "echo_isles" } } },
      },
      choices = {
        { text = "So you came here to fight something you could.", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = {
        { id = "fi_default", text = "Maybe so, mon. You're sharper than you look. A troll needs an enemy he can reach, or the hate eats him from the inside instead." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    plan = {
      big = true,
      lines = {
        { id = "pl_default", text = "No, mon, it isn't, but it's a good fire to cook a plan on. Hate keeps me awake at night, and awake is where you need to be in Desolace. Or do you think a troll should let it go?" },
      },
      choices = {
        { text = "Let it go. Hate makes you careless.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep it burning. It keeps you sharp.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadowprey = {
      lines = {
        { id = "sp_default", text = "A good little village on the coast, mon, all trolls and tauren and the sea at our backs. The fishing is good and the centaur mostly stay away, which is all a troll can ask of Desolace." },
      },
      choices = {
        { text = "Do the centaur trouble you?", next = "centaur" },
        { text = "Something else.", next = "BACK" },
      },
    },
    centaur = {
      lines = {
        { id = "ce_default", text = "Sometimes, mon, but they're too busy killing each other to bother us much. Kolkar, Gelkis, Magram, they fight like crabs in a bucket, and that suits Shadowprey fine." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    desolace = {
      lines = {
        { id = "de_default", text = "It's a dead land, mon, all bones and ash and grey sky. Something happened here a long time ago, something with demons, and the land never forgot it." },
      },
      choices = {
        { text = "Why stay, then?", next = "stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = {
        { id = "st_default", text = "Because somebody has to, mon. If the Horde leaves Desolace to the satyrs and the Blade, then the rot spreads, and one day it's at Orgrimmar's gates." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      lines = {
        { id = "xw_default", text = "It's a problem if you let them lead you, mon. The satyrs thought they held the leash too, once, and look at them now. Keep your demons on a short chain, and use them to kill other demons, and maybe the loa forgive you." },
      },
      choices = {
        { text = "I am the master, not them.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xn_default", text = "Kin, mon? Then you know better than anybody what they gave up. I don't hold it against you, but if you're going to Sargeron, you'd best not hesitate when they speak your old tongue." },
      },
      choices = {
        { text = "I won't hesitate.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Darkspear, born on the Echo Isles, come to Desolace to hunt satyrs. That's enough story for anybody, mon." } },
    advice = { { id = "tp_ad", text = "When a satyr laughs, mon, duck. It means something's coming." } },
    satyrs = { { id = "tp_satyrs", text = "Elves that sold themselves to demons, mon, and got horns for the trouble. Kill them where you find them." } },
    _none = { { id = "tp_none", text = "I don't know that one, mon. Ask the tauren up at Ghost Walker, they know this land better than me." } },
  },
}

---------------------------------------------------------------------------
-- West of Mannoroc Coven
---------------------------------------------------------------------------

-- Umarak: an old Kolkar who wants Khan Hratha of the Maraudine dead.
P:NPC {
  key = "umarak", id = TODO_NPC("Umarak"), name = "Umarak", title = "Kolkar Clan",
  bible = "bibles/desolace_forever.md", role = "questgiver", tier = "quest",
  temper = { "proud", "bitter" }, values = { "clan", "vengeful" },
  notices = { "race", "trophy" },
  impression = {
    first = "Umarak is an old Kolkar centaur who stands alone west of the Mannoroc Coven and will talk to an outsider only because he needs one. He hates the Maraudine khan more than he despises me, which is saying something.",
    third = "{name} met Umarak, an old Kolkar centaur who wants Khan Hratha of the Maraudine dead.",
  },
  greetings = {
    { id = "g_default", text = "An outsider approaches me? I doubt we have much to discuss, unless you are here to aid an old Kolkar." },
    { id = "g_active", when = { questActive = QUM }, text = "Hratha still breathes. I can feel it in my bones, outsider, so go and change that." },
    { id = "g_ready", when = { questReady = QUM }, text = "You smell of the Valley of Spears. Tell me it is done." },
    { id = "g_done", when = { questDone = QUM }, text = "You again. Hratha is dead, and whoever you killed him for, outsider, I am glad of it. Speak, and I will listen." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren comes to me for work. My grandsires hunted your kind across the plains, and now I must ask you for help, which is a bitter thing to swallow." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Your Warchief drove my clan from the red land by the sea, and I have not forgotten it, but Hratha is worse than any orc." },
    { id = "n_trophy", cat = "trophy", when = { killed = { name = "Maraudine", min = 20 } },
      text = "You carry the smell of dead Maraudine. Good, outsider, good. That is a smell I could grow to like." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Umarak of the Kolkar, and I am old, older than most centaur ever become. My legs can no longer carry me to war, so I stand here, and I wait for something with strong arms to wander past." },
        { id = "h_before", when = { questBefore = QUM },
          text = "You have strong arms, outsider. In the Valley of Spears there is a khan called Hratha, of the Maraudine, and I want him dead before I am, and I have very little time left." },
        { id = "h_active", tags = { "news" }, when = { questActive = QUM },
          text = "Hratha keeps to the Valley of Spears, with his guards and his advisors about him. He is strong and he is proud, and he will call you out himself if you make enough noise, so make plenty of it." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { QUM, days = 3 } },
          text = "Hratha is dead. I have waited a long time to say those words, outsider, and I find they taste better than I imagined." },
        { id = "h_done", when = { questDone = QUM },
          text = "The Maraudine have a new khan already, I hear, a young one who is frightened of his own shadow. That is good, because a frightened khan makes mistakes." },
      },
      again = {
        { id = "h_again", text = "What else? Speak quickly, outsider, I am old." },
        { id = "h_again2", text = "Ask, then. I have answered worse questions from worse creatures." },
      },
      choices = {
        { text = "Who is Khan Hratha?", next = "hratha" },
        { text = "Why do you hate him?", next = "why" },
        { text = "Why are you out here alone?", next = "alone" },
        { text = "Tell me about the centaur clans.", next = "clans" },
        { text = "My people have no love for the centaur.", next = "xtauren", when = { race = "Tauren" } },
        { text = "You have no love for the Horde, do you?", next = "xhorde", when = { faction = "Horde" } },
        { text = "Hratha is dead. Was it worth it?", next = "worth", when = { questDone = QUM } },
        { text = "I'll kill Hratha for you.", next = "BUSINESS" },
        { text = "I'll leave you to wait.", next = "END" },
      },
    },
    hratha = {
      lines = {
        { id = "hr_default", text = "The khan of the Maraudine, outsider, and a great brute with a cleaving blade. The Maraudine keep the old caverns in the south, and they think that makes them better than the rest of us, and Hratha thinks it makes him better than everyone." },
      },
      choices = {
        { text = "What are the old caverns?", next = "caverns" },
        { text = "How do I fight him?", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caverns = {
      lines = {
        { id = "ca_default", text = "A holy place, outsider, or so the Maraudine say, and they will kill anyone who goes near it. I will not speak of what lies inside, because I do not know, and the ones who know do not come back to tell." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = {
        { id = "fi_default", text = "Bring friends, outsider, because Hratha does not fight alone. His guard is strong and his advisor is clever, and Hratha himself roars to make his warriors braver, so silence him first if you can." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "wy_default", text = "Because his riders came for Kolkar herds when I was still strong enough to stop them, and I could not. My sons died in that raid, and Hratha laughed, and I have heard that laugh every night since." },
      },
      choices = {
        { text = "I'm sorry about your sons.", next = "sons" },
        { text = "What will you do, once he's dead?", next = "after" },
        { text = "Vengeance won't bring them back.", next = "vengeance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = {
        { id = "af_default", text = "Lie down in the grass, outsider, and let it have me. I have nothing else left to wait for, and a Kolkar should not stand forever." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    worth = {
      big = true,
      lines = {
        { id = "wo_default", text = "I have slept two nights without hearing him laugh. Whether that is worth a khan's life, you must judge, outsider, because you are the one who took it." },
      },
      choices = {
        { text = "It was worth it. He earned his end.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I did it, but I take no joy in killing for a grudge.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sons = {
      lines = {
        { id = "so_default", text = "Sorry. You outsiders always say sorry, as though it were worth something. Keep it, and bring me the khan's death instead." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    vengeance = {
      big = true,
      lines = {
        { id = "ve_default", text = "No, it will not. But it will let me die without hearing that laugh, which is all I want now. Or do you think an old centaur should forgive?" },
      },
      choices = {
        { text = "Some debts must be paid in blood. I'll pay it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Forgiving would free you more than his death will.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = {
        { id = "al_default", text = "Because the Kolkar have no use for a centaur who cannot ride, outsider, and the young khans do not listen to old voices. So I stand apart and I talk to outsiders, which is a shame no Kolkar should have to bear." },
      },
      choices = {
        { text = "Your clan abandoned you?", next = "abandoned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    abandoned = {
      big = true,
      lines = {
        { id = "ab_default", text = "Abandoned is your word. We say the herd moves on, and the old ones stay behind, and that is how it has always been. It is not cruel, it is the way of things." },
      },
      choices = {
        { text = "The strong lead. That's the way of the world.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A clan that leaves its elders isn't worth much.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    clans = {
      lines = {
        { id = "cl_default", text = "The Kolkar, the Gelkis, the Magram, and the Maraudine above them all, or so they believe. We fight each other more than we fight anyone, outsider, and the Alliance and the Horde have learned to use that against us." },
      },
      choices = {
        { text = "Why do the clans fight?", next = "clans_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clans_why = {
      lines = {
        { id = "cw_default", text = "Over land, over water, over which of us is truest to our ancestors. Every clan has its own story of where the centaur came from, and every story says the others are wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      lines = {
        { id = "xt_default", text = "No, and mine have none for yours. We drove you from the plains once, before the orcs came, and now the orcs and the tauren drive us. The wheel turns, outsider, and today I need you." },
      },
      choices = {
        { text = "Today, then. Not tomorrow.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhorde = {
      lines = {
        { id = "xh_default", text = "No. Your Warchief and his orcs drove the Kolkar out of Durotar and the Barrens, and his tauren friends dance on our graves. But Hratha is a closer enemy, and a Kolkar does not waste a weapon because he dislikes the hand that holds it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I rode with the Kolkar for longer than you have been alive. Now I stand." } },
    advice = { { id = "tp_ad", text = "Never trust a centaur who smiles, outsider. Except me, perhaps." } },
    _none = { { id = "tp_none", text = "I do not know, and I do not care to. Go and ask some other outsider." } },
  },
}
