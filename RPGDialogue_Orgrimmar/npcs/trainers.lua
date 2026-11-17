-- Orgrimmar's trainers, from the Valley of Honor to the Cleft of Shadow. Voice: bibles/orgrimmar.md
-- Zevrost never names Neeru; the Cleft keeps its own secrets.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "grezz", id = TODO_NPC("Grezz Ragefist"), name = "Grezz Ragefist",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "fierce" }, values = { "brave", "proud" },
  notices = { "class" },
  impression = {
    first = "Grezz Ragefist trains the warriors of Orgrimmar in the Valley of Honor, a loud, scarred orc who believes every lesson should leave a bruise.",
    third = "{name} met Grezz Ragefist, the warrior trainer in Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_hi", text = "Into the Valley of Honor, are you? Then stand like you mean it." },
  },
  start = "hello",
  nodes = {
    xpt_grezz = {
      big = true,
      lines = { { id = "xpt_grezz_default", text = "One of you holds the line and the other breaks it, and you take turns, because nobody can do either all day. The best pair I ever trained were a brother and sister from the Frostwolf clan, and they never once argued over glory, which is why they're both still alive." } },
      choices = {
        { text = "Glory can be shared. We fight as one shield.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The stronger warrior leads, and glory goes to whoever earns it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Grezz.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I train anyone who can take a bruise and get back up. The humans' paladins never fought fair with my people; they fought us chained and starving. Show me you can fight fair for the Horde, and I'll call you a warrior like any other." } },
      choices = {
        { text = "I'll fight fair, and for the Horde.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fairness is for training yards. War is different.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They respect whoever puts them back on their feet, and they'll pretend otherwise until they need you. A warrior who's been healed mid-fight learns two things at once, that he was about to die and that someone cared enough to stop it." } },
      choices = {
        { text = "Then I'll stand behind the line and keep them standing.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they won't respect me, they can heal themselves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not the axe, and not the rage, though the Horde has plenty of both. The demon blood gave our fathers rage without end and it nearly killed us all, so I teach control first, and the warriors who learn it live long enough to teach the next ones." } },
      choices = {
        { text = "Control first. Rage is a tool, not a master.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rage won the old wars. I'll let it run free.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Should a hunter learn to breathe? Your beast will hold most things off, but one day a raptor will get past it, and on that day you'll want to know how to block with an axe rather than how to run, so spend a week sparring with my recruits and you'll thank me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has better footwork than half my students, and it doesn't talk back. I might start charging it for lessons." },
      },
      choices = {
        { text = "I'll learn the axe. A hunter shouldn't hide behind a beast.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My beast takes the blows. That's what it's for.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If you call it to your hand and look your enemy in the eye, yes, and I'll fight anyone who says otherwise. What I won't have is a shaman hiding behind a totem while the grunts bleed for him, because that isn't a fight, it's a hiding place." } },
      choices = {
        { text = "I'll call the storm face to face, never from cover.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A wise shaman fights from wherever he's safest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Strength used for the Horde is always honorable, whatever shape it comes in. I only ask that you don't turn into a cat halfway through a duel, because my warriors find that insulting." } },
      choices = {
        { text = "A fair fight is fought face to face.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Victory matters more than how it's won.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Results, is it? I've buried better orcs than you who thought the same thing, and the honorable ones still won more fights than they lost, so hit me from behind and I'll forgive you once, but do it twice and I'll stop teaching you anything." },
      },
      choices = {
        { text = "Results win wars. Honor fills graves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Perhaps you're right. Honor counts for something.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What does honor mean to you?", next = "honor" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Some do, and I'll fight beside one if the Warchief asks it of me. But the warlocks of the Shadow Council sold our people to demons, and every orc who fought in the old Horde gets that taste in his mouth whenever he sees an imp." },
      },
      choices = {
        { text = "I'll earn your respect openly, in battle.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I don't need respect. I need results.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who else trains in the valley?", next = "valley" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They think you hide behind them, and they're right, but a good mage makes it worth their while. Burn whatever's hitting them, and they'll stand in front of you until they drop, because that's what warriors are for." },
      },
      choices = {
        { text = "I'll guard their backs as they guard mine.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They're there to bleed. I'm there to win.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_pair", tags = { "news" }, when = { class = "WARRIOR", party = { sameClass = true } },
          text = "Two warriors in one company, and both still standing. Most bands I've seen with two of you end up arguing over who goes through the door first, so settle that now, before it gets one of you killed." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin in the Valley of Honor. The last knight of the Silver Hand I saw was guarding a camp, recruit, so you'll forgive me if I hit you twice as hard." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest in the Valley of Honor! Good, because my warriors bleed faster than they learn, and I'm tired of carrying them to the Valley of Spirits." },
        { id = "h_default", key = true, text = "I'm Grezz Ragefist, and I train the Warchief's warriors. The Valley of Honor is named for what we earn here, so don't waste my time with anything less." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Another warrior come for lessons? Good, because the Horde can never have enough strong arms." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid on my training ground? Fine, because a tauren in bear form hits harder than most of my students, and I'm not too proud to say so." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman on my training ground! The Warchief swings the Doomhammer and calls the storm with the same arm, so don't tell me your kind are too soft for real fighting." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "Back again, warrior? Show me your stance before you say a word, because your feet tell me more than your mouth ever will." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter in the Valley of Honor? Ormak's lot are over by the range, but stay if you like, because a hunter who can hold a blade survives longer." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! You won't need my lessons, but you'll need my warriors in front of you, so treat them well." },
      },
      choices = {
        { text = "Do your warriors respect a priest who never swings an axe?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is it honorable to strike with lightning, Grezz?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is a druid's strength honorable, Grezz?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What does honor mean to you?", next = "honor" },
        { text = "Who else trains in the valley?", next = "valley" },
        { text = "Honor doesn't win wars, Grezz. Results do.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What makes a warrior of the Horde, Grezz?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should a hunter learn to fight up close, Grezz?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do warlocks have any honor, Grezz?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do your warriors think of mages, Grezz?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Will you train beside a paladin, Grezz?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Two warriors in one band. How should we fight together?", next = "xpt_grezz", when = { class = "WARRIOR", party = { sameClass = true } } },
        { text = "Farewell, Grezz.", next = "END" },
      },
      again = { { id = "h_again", text = "Still standing there? Then ask, and ask loudly." } },
    },
    honor = {
      lines = { { id = "o_default", text = "It means you face your enemy and you don't strike his back, even when he'd strike yours. The Warchief taught us that our fathers forgot it, and I won't let my students forget it twice." } },
      choices = {
        { text = "Honor is what makes us more than beasts.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Honor is fine until it gets you killed.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    valley = {
      lines = { { id = "v_default", text = "Ormak teaches the hunters across the way, and the smiths work the forges behind us. Every one of them answers to the Warchief, and every one of them thinks his trade matters most." } },
      choices = { { text = "And which matters most?", next = "valley_best" } },
    },
    valley_best = {
      lines = { { id = "vb_default", text = "Mine, of course, because a smith's blade is just iron until a warrior swings it. Don't tell the smiths I said so, though." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know steel and I know sweat. Anything else, ask Gryshka at the inn." } },
  },
}

P:NPC {
  key = "ormak", id = TODO_NPC("Ormak Grimshot"), name = "Ormak Grimshot",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Ormak Grimshot trains Orgrimmar's hunters in the Valley of Honor, a dry, patient orc who would rather watch a student's pet than the student.",
    third = "{name} met Ormak Grimshot, the hunter trainer in Orgrimmar.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the beasts. Most of them bite, and the rest are thinking about it." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Most of us don't think of it at all. The Light came to Durotar on the armour of men who caged orcs, and my students would rather trust their beasts than any glow. You'll have to show them it's yours and not theirs." } },
      choices = {
        { text = "I'll show them. It's mine to use for the Horde.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I've nothing to prove to anyone's students.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I'd trust anyone with steady hands and a calm voice, and most priests have both. The beasts can tell who means them well, which is more than I can say for most of the hunters I train." } },
      choices = {
        { text = "A wounded beast deserves the same care as any grunt.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I heal the Horde first, Ormak, and beasts after.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Patience, and how to read the ground before you charge across it. I've seen grunts run straight into a scorpid nest in the Barrens because they never looked down, so watch the tracks and the wind, and you'll pick your fights instead of falling into them." } },
      choices = {
        { text = "I'll learn to read the ground before I charge.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A fast charge beats any amount of tracking.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "With food, with patience and with your own voice, every day, until it knows yours from any other. Durotar's beasts stay half wild even when they're tamed, so start with a boar if you're nervous, and move to the raptors only when you've learned to read a temper." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks well kept. Good, because I judge my students by their beasts more than by their aim." },
      },
      choices = {
        { text = "A beast is my partner. I'll earn its trust.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A beast obeys, or it goes back to the wild.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "You hear its spirits and I read its tracks, and most days we come to the same answer. The difference is that when the earth's angry you ask it why, and I just pack up and hunt somewhere else." } },
      choices = {
        { text = "Facing the land's anger is the honest path.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "There's no shame in leaving a fight you can't win.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "A hunter tracks prey to feed someone and a rogue tracks prey to rob it, so I'd say the hunter's better, though I've seen rogues track as well as any of mine. Durotar is hard ground, and anyone who can follow a trail across it has my respect." },
      },
      choices = {
        { text = "Then I'll track to protect, not to rob.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Prey is prey, whatever the reason.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Where's the best hunting near Orgrimmar?", next = "hunt" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Turning a boar into a sheep isn't taming it, friend, it's only confusing it. A tamed beast chooses to stay at your side, and no spell ever made a creature choose anything." },
      },
      choices = {
        { text = "Fair. Trust is earned, not forced.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Choice is overrated. A spell works faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How do you choose a companion?", next = "pet" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "We both want it to go on feeding us, which is more than most of this city thinks about. But I take the beast and you become it, so I suspect you feel every kill a little more than I do." } },
      choices = {
        { text = "A clean kill honours the beast. That's what matters to me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Prey is prey. I don't spare it a thought once it's down.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "The same way I judge a hunter's beast, by whether it fights well and whether it trusts you, though I doubt any demon trusts anyone. Keep it fed and keep it leashed, and never let it near my students' pets, because they can smell it." },
      },
      choices = {
        { text = "I'll keep it leashed and away from your pets.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My demon goes wherever I send it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. Not my students, but I'll watch you anyway, because I watch everything that moves in this valley." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. I've no lessons for you, but if a hunter's pet comes back torn, I'd rather send it to you than to anyone in this valley." },
        { id = "h_default", key = true, text = "I'm Ormak Grimshot, and I teach the hunters of the Horde. Durotar is a hard land for game, so a hunter here learns to track things that would rather not be found." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Your companion is with you, good. Now let's see if you've been worthy of it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You've come to the wrong trainer, but stay a while, because your kind and mine both learned long ago that the land watches us back." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid at the hunters' range. You hunt with your own teeth instead of a bow, which I respect, though I'd like to see you tame a boar that way." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior at the hunters' range? Stay a while, because you could do worse than learn to throw an axe straight." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "One of mine, and with a beast in tow. Show me how it heels, because a pet that doesn't heel is a pet that gets you killed." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your companion's a demon, so I won't ask to see it, but I'll ask how you treat it." },
      },
      choices = {
        { text = "Would you really trust a priest with a hunter's pet?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do shamans and hunters see the land differently?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do hunters and druids want the same things from the wild, Ormak?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "How do you choose a companion?", next = "pet" },
        { text = "Where's the best hunting near Orgrimmar?", next = "hunt" },
        { text = "Hunters and rogues both track prey. Which is better?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My polymorph tames a beast faster than you can.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What can a warrior learn from a hunter, Ormak?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How should I train my companion, Ormak?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "How would you judge a warlock's demon, Ormak?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do hunters think of the Light, Ormak?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Ormak.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? Make it quick, the wolves need feeding." } },
    },
    pet = {
      lines = { { id = "p_default", text = "You don't choose it, not truly, because the beast chooses whether to follow you. Feed it well, fight beside it, and never leave it behind in a fight." } },
      choices = {
        { text = "A companion is family.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A companion is a tool, a good one.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    hunt = {
      lines = { { id = "h1_default", text = "The Barrens, past the Crossroads, where the zhevra and the lions run. Durotar's scorpids make poor sport and worse eating." } },
      choices = { { text = "And further than that?", next = "hunt_far" } },
    },
    hunt_far = {
      lines = { { id = "h2_default", text = "Ashenvale, if you dare the night elves, and Stonetalon beyond it. A hunter goes where the game is, whatever the warlords say about borders." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Unless it leaves tracks or wears fur, I've nothing to teach you about it." } },
  },
}

P:NPC {
  key = "kardris", id = TODO_NPC("Kardris Dreamseeker"), name = "Kardris Dreamseeker",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "wise", "devout" },
  notices = { "class" },
  impression = {
    first = "Kardris Dreamseeker trains the shaman of Orgrimmar in the Valley of Wisdom, near the Warchief's own teachers, and speaks of the spirits with quiet certainty.",
    third = "{name} met Kardris Dreamseeker, a shaman trainer in Orgrimmar's Valley of Wisdom.",
  },
  greetings = {
    { id = "g_hi", text = "The spirits are restless in the city today. Come, sit where they are quieter." },
  },
  start = "hello",
  nodes = {
    xpt_kardris = {
      big = true,
      lines = { { id = "xpt_kardris_default", text = "Respect, first and always, because the elements answer a shaman's call as a favour and never as a duty. A shaman who must heal a careless war band again and again begins to wonder whom the spirits are really serving, so be a companion worth the trouble." } },
      choices = {
        { text = "We'll honour the spirits and the one who speaks to them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The spirits answer strength. That's the way of things.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kardris.", next = "BACK" },
      },
    },
    xcl_mc = {
      big = true,
      lines = { { id = "xcl_mc_default", text = "Then you did not kill him, because nobody can kill an elemental lord, but you sent him back to the realm of fire where he belongs, and that is a great thing. The Dark Iron dwarves tore him into this world centuries ago, and he has burned in the mountain ever since, angry and hungry and out of his place. The elements are not evil, but fire torn from its place goes mad, and that is what you faced." } },
      choices = {
        { text = "Every element has its place, and his isn't here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Places change, Kardris. Let the strong elements take what they can.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Will Ragnaros return?", next = "xcl_mc2" },
      },
    },
    xcl_mc2 = {
      lines = { { id = "xcl_mc2_default", text = "In time, perhaps, because an elemental lord is patient in a way we cannot imagine. But the spirits of the mountain can breathe again for a while, and the Dark Irons who served him will have to learn what they are without a master. I'll be listening for him either way." } },
      choices = { { text = "Then I'll listen too, Kardris.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They do not reject you; they only do not know you. The Light came to my people in the camps, on the hammers of the Silver Hand, and the elements came back to us when we were freed. Perhaps you are walking the same road from the other end." } },
      choices = {
        { text = "Then I'll walk it with respect for the spirits.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My road is the Light. The spirits may keep theirs.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The spirits are not jealous, as the demons were; they ask only that we listen and give back what we take. Your prayers may go to the loa or to something in the shadow, but if they mend what was broken, the elements will not think less of you for it." } },
      choices = {
        { text = "Then the spirits and I want the same thing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers answer to me, not the elements.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The earth holds up the warrior's feet and the fire fills his blood, so yes, though most warriors never stop to listen. Before the demons came, our warriors went to the shaman before every battle to ask the spirits' blessing, and I would see that custom return." } },
      choices = {
        { text = "Then I'll seek the spirits' blessing before I fight.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My axe needs no spirit's blessing, Kardris.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every beast has a spirit, and the spirits of the wild watch over those who walk with them honestly. Our ancestors hunted Draenor with wolves at their side long before the demons taught them to hunt their own kind, and the spirits remember that better than we do." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a calm spirit. That comes from you, {class}, so keep it that way." },
      },
      choices = {
        { text = "I'll honour my companion's spirit in all I do.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast's spirit is its own concern, not mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The same land, I think, but different voices in it. The elements speak to us as they rage and settle, and you hear the slower voice beneath them, the one that grows things." } },
      choices = {
        { text = "Each path should keep to its own ways.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The two paths should learn from each other freely.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Our shamans listened to the elements and never needed the arcane, and the first orcs to grasp at stranger powers became Gul'dan's warlocks. The trolls teach you a cleaner kind of magic, I'm told, but I'd ask you never to forget there's more to the world than what you can grasp." },
      },
      choices = {
        { text = "I'll remember. The world is more than power.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What I can grasp is what I'll use.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What were the orcs before the demons?", next = "before" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They don't hate you, but they turn away from you, and that's worse. When our people began bargaining with demons, the spirits of Draenor went silent, and it took Thrall years to coax them back, so I'll ask you not to walk too near my students." },
      },
      choices = {
        { text = "I understand. I'll keep my distance from them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them turn away. I don't need the spirits.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why are the spirits restless?", next = "restless" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The elements care about balance, and a blade in the dark can tip the balance either way. Use yours for the Horde and against those who poison the land, and the spirits won't trouble you, but use it for your own greed and they'll remember." },
      },
      choices = {
        { text = "My blade serves the Horde, not my purse.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Greed's an honest reason, Kardris.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_sham", tags = { "news" }, when = { party = { class = "SHAMAN" } },
          text = "The spirits sit easier around you, and I think it's because you travel with a shaman. {companion} has a steady way about them, so listen when they tell you the land is uneasy, because they'll hear it long before you do." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who wields the Light. The spirits around you are quiet and uneasy, as though they cannot decide what you are. I find I cannot decide either." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The spirits speak to me, and something else speaks to you, and I would very much like to hear what it says." },
        { id = "h_default", key = true, text = "I am Kardris Dreamseeker, and I guide the shaman of the Horde. The Valley of Wisdom is where the orcs came to remember what they were before the demons." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "Welcome, shaman. Tell me, have the elements spoken to you clearly since we last met?" },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the tauren, welcome to the Valley of Wisdom. Your people kept faith with the Earth Mother while mine forgot the spirits entirely, and we have learned a great deal at your elders' fires." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior in the Valley of Wisdom. Good, because the elements respect a strong spirit as much as a wise one, and you may have more of the first than you think." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and a beast who walks with you. The spirits of the wild are close to the elements, and I can feel them gathered around you both." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue in the Valley of Wisdom. The spirits see you, even when nobody else does." },
        { id = "h_cl_mc", tags = { "news" }, when = { cleared = "Molten Core", faction = "Horde" }, text = "The fire spirits have been quieter these past days, as if something in Blackrock Mountain stopped burning so hot. I think you know why, because you carry the smell of the Firelord's hall on you." },
      },
      choices = {
        { text = "Do the spirits mind that a priest prays to something else?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do shaman and druid hear the same voices?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What were the orcs before the demons?", next = "before" },
        { text = "Why are the spirits restless?", next = "restless" },
        { text = "Did the orc shamans ever study the arcane?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the elements care for warriors, Kardris?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the spirits watch over my companion, Kardris?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The spirits must hate me, Kardris.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the elements care what a rogue does?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the spirits reject a Forsaken paladin, Kardris?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I faced Ragnaros in the Molten Core, Kardris.", next = "xcl_mc", when = { cleared = "Molten Core", faction = "Horde" } },
        { text = "Our shaman keeps us alive. What do they owe the spirits?", next = "xpt_kardris", when = { party = { class = "SHAMAN" } } },
        { text = "Farewell.", next = "END" },
      },
      again = { { id = "h_again", text = "Ask what you wish. Wisdom grows by sharing it." } },
    },
    before = {
      lines = { { id = "b_default", text = "Clans who honored the land and its spirits, and shaman who listened rather than commanded. The warlocks taught us to take, and the Warchief is teaching us again to ask." } },
      choices = { { text = "Can the old ways truly return?", next = "before_return" } },
    },
    before_return = {
      lines = { { id = "br_default", text = "They already have, in every shaman who answers the elements' call. It is slow, and some orcs still long for the fel, but the spirits are patient with us." } },
      choices = {
        { text = "Then those who cling to the fel must be stopped.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Each orc must find his own way back.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    restless = {
      lines = { { id = "r_default", text = "A city is many voices, and some of them are angry. The spirits feel every grudge in Orgrimmar, and there are a great many of those." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The spirits have not shown me that. Perhaps they will, in time." } },
  },
}

P:NPC {
  key = "zevrost", id = TODO_NPC("Zevrost"), name = "Zevrost",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "ambitious", "cunning" },
  notices = { "class" },
  impression = {
    first = "Zevrost trains warlocks in the Cleft of Shadow, smooth-voiced and careful, and he insists that the power he teaches is a tool and nothing more.",
    third = "{name} met Zevrost, the warlock trainer in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the Cleft. The shadows here are friendlier than the faces above, I promise you." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Threaten? It despises them, which is not the same. But you are dead, and the Light answers you anyway, so I suspect you understand better than most that power doesn't care who holds it, only how firmly." } },
      choices = {
        { text = "The Light is no mere tool, Zevrost.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. Power is power, however it shines.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Closer than either of us would say aloud in the Valley of Wisdom. You draw on the dark to mend and to hurt, and I draw on it to bind, and the difference is mostly in who holds the leash, which is a thing the Warchief's shaman never quite understand." } },
      choices = {
        { text = "The difference is that I don't bind anyone, Zevrost.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Perhaps we're not so different. I'll remember that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every use, I assure you, though most warriors don't care for the answer. A demon guards the front of a fight well enough, but a warrior beside us keeps the enemy's eyes off the caster, and a warlock who isn't being stabbed is a warlock who wins." } },
      choices = {
        { text = "I'd never fight beside a demon. The Horde learned that lesson.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If a demon wins the fight, I'll fight beside it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Your beast loves you, and mine would devour me the moment I faltered, so I suppose the difference is trust. A hunter tames by patience and a warlock binds by will, and only one of us sleeps soundly at night, though I'll leave you to guess which." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} doesn't care for me, I see. Animals never do; they can smell the Twisting Nether on our robes." },
      },
      choices = {
        { text = "Trust is stronger than any binding, warlock.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Binding by will sounds more reliable than trust.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It burned a world and carried us through the Dark Portal, and it cost us everything else, so I suppose that depends on how you count. The Warchief keeps us on a short chain, and I teach my students to remember why, which is more than the Shadow Council ever did." } },
      choices = {
        { text = "Nothing the demons gave was worth what it cost us.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power, and only fools refuse a weapon.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Friendly is a strong word, but we understand one another, which is rarer. The rogues keep their secrets and we keep ours, and the Warchief's guards watch us both, so we all behave impeccably." },
      },
      choices = {
        { text = "Good. The Warchief's watch keeps us all honest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Secrets are what keep the Cleft alive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What is the Cleft of Shadow?", next = "cleft" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Cleaner, you say, and yet it was the arcane that first drew the Legion's eye to this world. I'll grant your craft has a better name in Orgrimmar, but power is power, and both of us study it because we want more of it." },
      },
      choices = {
        { text = "I want power to protect, not to hold.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "True enough. We both want more, and that's fine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Isn't this the magic that ruined the orcs?", next = "ruin" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The same way you call claws and fangs a tool, druid, because power belongs to whoever has the will to hold it. The difference is only that my tools must be watched, and I watch them more closely than any guard up those stairs." } },
      choices = {
        { text = "The Warchief permits you, and I'll watch you as closely as he does.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Power is power. I won't judge how you choose to hold yours.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin, here in the Cleft. How interesting. The Light and my arts rarely share a room, and yet here we both are, serving the same Warchief." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest in the Cleft of Shadow. You'll find the shadows here darker than the ones you pray in, but you'll find we have that much in common." },
        { id = "h_default", key = true, text = "I am Zevrost, and I teach those with the will to command what others fear. The Warchief permits us, so long as we remember who serves whom." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "Ah, one of mine. Your demon is well leashed, I hope, because the guards above notice when it isn't." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Cleft of Shadow. Your path and mine both began with the shamans of Draenor, though you'd rather forget it, so do try not to glare at my students." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, in the Cleft of Shadow. You change your own flesh and call it nature, and I bind demons and call it discipline, so perhaps we're less different than your kind would like." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, here among the warlocks? How brave of you, or how lost. The Valley of Honor is up the stairs and well away from us." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, with a pet of flesh and fur. We warlocks keep pets as well, though ours are rather harder to feed." },
      },
      choices = {
        { text = "Is a priest's shadow anything like your craft, Zevrost?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Your kind traded the elements for demons. Was it worth it?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How can you call demon magic a mere tool, Zevrost?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Isn't this the magic that ruined the orcs?", next = "ruin" },
        { text = "What is the Cleft of Shadow?", next = "cleft" },
        { text = "Rogues and warlocks share the Cleft. Friendly neighbors?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The arcane is cleaner than what you teach, Zevrost.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do warlocks have any use for warriors, Zevrost?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How is a demon different from a hunter's beast, Zevrost?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does the Light threaten your arts, Zevrost?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll go.", next = "END" },
      },
      again = { { id = "h_again", text = "More questions? Curiosity is the first step to power, after all." } },
    },
    ruin = {
      lines = { { id = "r_default", text = "The orcs were ruined by bowing to demons, not by learning their names. A warlock commands, and a slave obeys, and there is all the difference in the world between them." } },
      choices = { { text = "And if the demon wins?", next = "ruin_wins" } },
    },
    ruin_wins = {
      lines = { { id = "rw_default", text = "Then the warlock was weak, and the Horde is better rid of him. That is the price of the art, and every student of mine pays it willingly." } },
      choices = {
        { text = "Power like that should be watched closely.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Strength takes risks. The weak can stay above.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    cleft = {
      lines = { { id = "c_default", text = "The lowest part of the city, where rogues and warlocks and the less welcome trades keep their shops. The Warchief knows we are here, and that is enough for most of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Some things are better left unasked in the Cleft, friend." } },
  },
}
