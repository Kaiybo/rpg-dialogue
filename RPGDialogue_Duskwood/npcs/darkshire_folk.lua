-- Darkshire's other households. Voice: bibles/darkshire_folk.md
-- The Carevins and Calor, the historian, the stargazer, the cook, the councilman,
-- the innkeeper and the smith who hates being crept up on.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jonathan", id = TODO_NPC("Jonathan Carevin"), name = "Jonathan Carevin",
  bible = "bibles/darkshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "stern" }, values = { "devout", "wary" },
  notices = { "form", "stranger" },

  greetings = {
    { id = "g_wary", text = "You're new. State your business, and keep your hands where I can see them." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathing, I see. In Duskwood that counts for a reference." },
    { id = "g_answered", when = { questDone = TODO_QUEST("Answered Questions") }, text = "Sit. You've earned a chair in this house, and I don't offer many." },
  },

  notice = {
    { id = "n_beast", cat = "form", place = "replace", when = { form = { "bear", "cat" } },
      text = "Change back. Now. In this town anything that walks in on four legs gets a crossbow before it gets a greeting." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A shapechanger. I know your kind isn't the curse. I also know the curse looks a great deal like your kind in the dark." },
    { id = "n_horde", cat = "stranger", when = { faction = "Horde" },
      text = "The Watch let you through. I'd like to know why. I'd like to know a great many things about you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jonathan Carevin. The Watch keeps the lamps lit; my household goes out past them. Demons, the walking dead, worse. Someone has to." },
        { id = "h_calor", when = { heardLine = "calor.h_default" },
          text = "Calor sent you. He recruits quickly. I trust slowly. Between us we get about one useful person a year." },
        { id = "h_family", tags = { "news" }, when = { questActive = TODO_QUEST("The Carevin Family") },
          text = "A night elf priestess, staying in Darkshire? No. I'd know. What I'd like to know is why a stranger asks me that, and then about wolf-men, in one breath." },
        { id = "h_scythe", when = { questActive = TODO_QUEST("The Scythe of Elune") },
          text = "You asked your questions. Now answer mine with your blade. Then we'll see what you've earned." },
        { id = "h_answered", when = { questDone = TODO_QUEST("Answered Questions") },
          text = "I have more to go on than I did, and I like it less. That's how answers usually go." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elf-kin, but not a cut I know. Where your people come from is your own business. What you do in my woods is mine." },
      },
      choices = {
        { text = "What does your household do?", next = "hunt" },
        { text = "Why are you so suspicious?", next = "wary" },
        { text = "I'll be going.", next = "END" },
      },
    },
    hunt = {
      lines = {
        { id = "hu_default", text = "We hunt. Nothing more mysterious than that. The Watch waits for the dark to come to them. We go to it." },
      },
      choices = {
        { text = "I'd like to help.", next = "END", fx = { affinity = 1, learn = { "carevins" } } },
        { text = "Sounds like a good way to die.", next = "die" },
      },
    },
    die = {
      lines = { { id = "d_default", text = "It is. So is staying home, here. At least we pick the ground." } },
      choices = { { text = "...", next = "END" } },
    },
    wary = {
      big = true,
      lines = {
        { id = "w_default", text = "The worgen came out of nowhere, and nothing comes out of nowhere. Someone brought them. Someone knows. Until I find out who, everyone is a question." },
      },
      choices = {
        { text = "Including me.", next = "END", fx = { trait = { curious = 1 }, learn = { "worgen" } } },
        { text = "I'll help you find out.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
  },

  topics = {
    night_watch = { { id = "tp_watch", text = "Brave people with lanterns. I don't fault them. I just don't wait with them." } },
    worgen = { { id = "tp_worgen", text = "They didn't wander here. Packs that size don't wander. Something called them." } },
    carevins = { { id = "tp_carevins", text = "My family. We keep our own counsel. That's all the town needs to know, and most of what they say." } },
    ladimore = { { id = "tp_ladimore", text = "Sirra will tell you the story. I'll tell you the end of it walks at Raven Hill and doesn't care who you are." } },
    stalvan = { { id = "tp_stalvan", text = "Old murders. I hunt the ones still happening." } },
    _none = { { id = "tp_none", text = "If it isn't hunting us, I haven't made time for it." } },
  },
}

P:NPC {
  key = "calor", id = TODO_NPC("Calor"), name = "Calor",
  bible = "bibles/darkshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "fierce" }, values = { "devout", "proud" },
  notices = { "form", "trophy" },

  greetings = {
    { id = "g_hunt", text = "You have the look of someone who's swung a blade. Have you swung it at anything that swung back?" },
    { id = "g_back", when = { metBefore = true }, text = "Out of the trees again. Count your fingers. Good. Now tell me what you killed." },
  },

  notice = {
    { id = "n_beast", cat = "form", place = "replace", when = { form = { "bear", "cat" } },
      text = "Stand still. Stand still! ...A druid. Light, you nearly had a bolt in you. Don't come into Darkshire on four legs." },
    { id = "n_paladin", cat = "trophy", when = { class = "PALADIN" },
      text = "A paladin. Good. The Light should be out in the trees, not polishing pews in Stormwind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Calor. I stood a Night Watch post for years and watched the dark take a little more each season. Then I joined Master Carevin. Now we take some back." },
        { id = "h_woods", tags = { "news" }, when = { questActive = TODO_QUEST("Worgen in the Woods") },
          text = "Brightwood Grove, the Rotting Orchard, and the mine down south past them. The small ones weave shadows, the big ones run in packs, the worst ones sit by their fires near Roland's Doom." },
        { id = "h_woods_done", when = { questDone = TODO_QUEST("Worgen in the Woods") },
          text = "Kill one, two more come out of the trees. I don't understand where they come from. Master Carevin will. I have faith in that." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elf. Good eyes, I'd guess. Use them in the trees. The worgen are grey on grey and they'll be on you before you've drawn breath." },
      },
      choices = {
        { text = "Why did you leave the Night Watch?", next = "watch" },
        { text = "How do I prove myself?", next = "prove" },
        { text = "Later, Calor.", next = "END" },
      },
    },
    watch = {
      big = true,
      lines = {
        { id = "w_default", text = "They're good people who've made peace with losing slowly. I couldn't. Standing under a lamp all night isn't a fight. It's a wait." },
      },
      choices = {
        { text = "Somebody has to hold the town.", next = "hold", fx = { trait = { kind = 1 } } },
        { text = "I'd rather fight too.", next = "END", fx = { affinity = 2, trait = { fierce = 1 } } },
      },
    },
    hold = {
      lines = { { id = "ho_default", text = "Somebody does. Somebody else. I didn't say they were wrong. I said I couldn't." } },
      choices = { { text = "...", next = "END" } },
    },
    prove = {
      lines = { { id = "p_default", text = "Not with talk. Go out to the grove, kill what's there, come back and tell me what you saw. Then we'll talk about Master Carevin." } },
      choices = { { text = "I'll be back.", next = "END", fx = { learn = { "carevins", "worgen" } } } },
    },
  },

  topics = {
    night_watch = { { id = "tp_watch", text = "I wore the lamp. I don't speak against them. I just don't stand with them anymore." } },
    worgen = { { id = "tp_worgen", text = "They appeared out of nowhere, near enough. One season the woods were only dark. The next, they were hungry." } },
    carevins = { { id = "tp_carevins", text = "Master Carevin is the only man in Darkshire with a plan that isn't waiting. That's enough for me." } },
    _none = { { id = "tp_none", text = "Ask someone who sits still. I'm going back out." } },
  },
}

P:NPC {
  key = "sirra", id = TODO_NPC("Sirra Von'Indi"), name = "Sirra Von'Indi",
  bible = "bibles/darkshire_folk.md", role = "scholar", tier = "quest",
  communities = { "darkshire" }, temper = { "fussy" }, values = { "curious", "careful" },
  notices = { "lore", "arcane" },

  greetings = {
    { id = "g_busy", text = "Hm? Yes, yes, come in. Mind the papers. Mind those papers too. Just stand there, actually." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. I remember you. You stood very still last time. I appreciated that." },
    { id = "g_wait", when = { questActive = TODO_QUEST("Wait for Sirra to Finish") }, text = "Not yet. Not yet! You can't rush a dead hand. Sit. There's a stool. Under the books." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "You've read The Seven Kingdoms. Don't look surprised; you have the look. Good. The town's history is in there, if you read between the reigns." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage! You'll read three tongues at least. No? Two? Well. They teach you all the wrong things in Stormwind now." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sirra Von'Indi, historian to the town. Languages, old scripts, older families. If it happened in Darkshire and someone wrote it down, I've read it twice." },
        { id = "h_note", tags = { "news" }, when = { questActive = TODO_QUEST("Translate Abercrombie's Note") },
          text = "The hermit's note? Let me see. Oh. Oh, that's an old script. Older than the hermit. Whatever is he doing with it?" },
        { id = "h_note_ack", when = { heardLine = "abercrombie.h_note" },
          text = "Did he tell you not to read it? You couldn't have. It's in a hand nobody's used here in a long while. Which is precisely why he used it." },
        { id = "h_ello", tags = { "news" }, when = { questActive = TODO_QUEST("Translation to Ello") },
          text = "Take this to Lord Ello. Quickly, please. And don't stop to talk to anyone on the way. I mean it." },
        { id = "h_grave", when = { questActive = TODO_QUEST("The Weathered Grave") },
          text = "A grave at Raven Hill with a name half worn away? Tell me the letters you could read. Slowly." },
        { id = "h_morgan", tags = { "news" }, when = { questActive = TODO_QUEST("Morgan Ladimore") },
          text = "So you've seen the grave and you've heard the name. Then you know what walks there. Put him to rest. It's long past time." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Shen'dorei. I've no books on you at all, do you know that? Not one. I'd be terribly grateful for a word or two of your tongue, if you'd allow it." },
      },
      choices = {
        { text = "Tell me about Morgan Ladimore.", next = "morgan" },
        { text = "What's the oldest thing you've read?", next = "oldest" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    morgan = {
      big = true,
      lines = {
        { id = "m_default", key = true,
          text = "A knight of this town, back when it was Grand Hamlet. He rode to war under Uther and came home to graves. His grief did a terrible thing, and then he did a worse one to himself." },
      },
      choices = {
        { text = "And now?", next = "now", fx = { learn = { "ladimore" } } },
        { text = "That's a hard story.", next = "END", fx = { affinity = 1, trait = { kind = 1 }, learn = { "ladimore" } } },
      },
    },
    now = {
      lines = { { id = "n_default", text = "Now he doesn't rest. The grave is in a quiet corner of Raven Hill. I'd not go there after dark. I'd not go there at all, honestly." } },
      choices = { { text = "...", next = "END" } },
    },
    oldest = {
      lines = { { id = "o_default", text = "Town ledgers from before the First War. Births, deaths, a long argument about a fence. It's the fence I love. Nobody fights about fences in a dying town." } },
      choices = { { text = "That's oddly hopeful.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    night_watch = { { id = "tp_watch", text = "Founded in a hurry, recorded in a hurry. Half the rosters are in pencil. That tells you all you need to know." } },
    worgen = { { id = "tp_worgen", text = "Nothing in the records. Not one mention before these last years. Which is the most interesting thing anyone's told me in ages." } },
    stalvan = { { id = "tp_stalvan", text = "The Mistmantles are in the old registers, yes. Then a gap. I hate a gap. Smitts hates it more." } },
    ladimore = { { id = "tp_ladimore", text = "I wrote the account myself, from what the old families remembered. I still don't like reading it back." } },
    carevins = { { id = "tp_carevins", text = "An old Darkshire family. They don't care for being written about. I write about them anyway, quietly." } },
    _none = { { id = "tp_none", text = "Not in my papers. Which means either it never happened or nobody here could spell it." } },
  },
}

P:NPC {
  key = "viktori", id = TODO_NPC("Viktori Prism'Antras"), name = "Viktori Prism'Antras",
  bible = "bibles/darkshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "eager" }, values = { "curious", "rational" },
  notices = { "craft", "arcane" },

  greetings = {
    { id = "g_sky", text = "Ah! Do you know, there's a gap in the canopy right above this hut? Twenty minutes of sky, some nights. I don't waste them." },
    { id = "g_back", when = { metBefore = true }, text = "Back! Good. The fog lifted for nearly an hour last night. I saw three stars I'd never charted." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Oh, bless you. Can you turn a bronze tube? A true one, no bends? Cog's plans say it must be true." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage. I mean no offense, but I think the answer here isn't magic. I think it's something you can measure." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Viktori Prism'Antras. I study the stars. In Duskwood, yes. Everyone laughs. Everyone in Duskwood also hasn't seen the sun in years, so who's laughing?" },
        { id = "h_tube", tags = { "news" }, when = { questActive = TODO_QUEST("Look To The Stars") },
          text = "A bronze tube, made by an engineer. Herble down the hill sells a few, if he hasn't run out. It's the first piece of Cog's design." },
        { id = "h_cog", when = { questDone = TODO_QUEST("Look To The Stars") },
          text = "Cog's a gnome, a dear friend, and the only person who answered my letters with drawings. His blueprints are the reason I'm still sane." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid! You'll tell me it's spirits, or the moon. Fine, maybe. But spirits leave marks, and marks can be measured. That's all I'm after." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You lived above the clouds? Truly? What did the stars look like with nothing in the way? No, don't tell me. Yes. Tell me." },
      },
      choices = {
        { text = "What are you building?", next = "device" },
        { text = "Why the stars, here?", next = "why" },
        { text = "Good luck with the fog.", next = "END" },
      },
    },
    device = {
      lines = {
        { id = "d_default", text = "A way to see far things close. Cog drew it; I'm only the hands. Lenses, tubes, a mount that doesn't wobble. The wobbling is the hard part." },
      },
      choices = { { text = "I'll keep an eye out for parts.", next = "END", fx = { affinity = 1 } } },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because something changed this forest, and everyone says magic and stops thinking. I don't want to stop thinking. I want to look up and find a reason." },
      },
      choices = {
        { text = "I hope you find it.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Some things don't have reasons.", next = "reasons" },
      },
    },
    reasons = {
      lines = { { id = "r_default", text = "Then I'll have wasted some time and learned a great deal about lenses. I can live with that." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "Came with the dark, or the dark came with them. Cause or effect. I'd give my last lens to know which." } },
    night_watch = { { id = "tp_watch", text = "Lovely people. They keep asking me to put out my lamp. I keep asking them to put out theirs. Light pollution, you see." } },
    _none = { { id = "tp_none", text = "Not my field. My field is roughly forty miles straight up." } },
  },
}

P:NPC {
  key = "grual", id = TODO_NPC("Chef Grual"), name = "Chef Grual",
  bible = "bibles/darkshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "cheerful" }, values = { "proud", "generous" },
  notices = { "craft", "hunger" },

  greetings = {
    { id = "g_kitchen", text = "Come in, come in! Kitchen's warm, pot's on. Mind the cleaver, it's got a mind of its own." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer! Don't tell the others. I say that to all of them." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Proper respect between us, then. You want to know my secret? No you don't. Nobody does. Trust me." },
    { id = "n_thin", cat = "hunger", when = { race = "Skyborne" },
      text = "Look at you, you're a twig! Sit down. Sit down! Nobody leaves my kitchen that thin." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Grual! I cook for the Scarlet Raven. Best food in Darkshire, and I'll fight anyone who says it's the only food in Darkshire." },
        { id = "h_crab", tags = { "news" }, when = { questActive = TODO_QUEST("Dusky Crab Cakes") },
          text = "Crab cakes, the house favourite! I need a few bits for the recipe. Don't ask which bits. It's a family secret, and the family's very private." },
        { id = "h_kabob", when = { questActive = TODO_QUEST("Seasoned Wolf Kabobs") },
          text = "Wolf flanks, lean ones. Duskwood wolves are all gristle and grudge, but with enough pepper anything's a supper." },
        { id = "h_jitters", tags = { "news" }, when = { questActive = TODO_QUEST("Jitters' Growling Gut") },
          text = "Someone hungry up in the hills, and too scared to come down? Poor soul. Fetch me the makings and I'll send something hot." },
        { id = "h_jitters_ack", when = { heardLine = "jitters.s_default" },
          text = "That fellow up the hill. Watched something awful, didn't he? You can tell by the way a man eats. He ate like it was the last thing he'd ever be sure of." },
      },
      choices = {
        { text = "What's in the crab cakes?", next = "secret" },
        { text = "What's good tonight?", next = "tonight" },
        { text = "Just smelling, thanks.", next = "END" },
      },
    },
    secret = {
      lines = {
        { id = "s_default", text = "Crab! Mostly crab. Crab-adjacent. Look, does it taste good? Then that's what's in it." },
      },
      choices = {
        { text = "I'll take your word for it.", next = "END", fx = { affinity = 1 } },
        { text = "That's not reassuring.", next = "worry" },
      },
    },
    worry = {
      lines = { { id = "w_default", text = "It's not meant to reassure. It's meant to be delicious. Different job entirely." } },
      choices = { { text = "...", next = "END" } },
    },
    tonight = {
      lines = { { id = "t_default", text = "Stew. It's always stew by the end of the week. Everything that didn't get eaten goes in, and comes out tasting like it meant to." } },
      choices = { { text = "Stew it is.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "Not on my menu. I've been asked. I've said no. Some lines a cook doesn't cross." } },
    night_watch = { { id = "tp_watch", text = "They eat at odd hours and tip in apologies. I feed them anyway. You don't let the lamp-holders go hungry." } },
    stalvan = { { id = "tp_stalvan", text = "Smitts's thing. Ask him. Bring a chair, it's a long one." } },
    _none = { { id = "tp_none", text = "Can't help you there. Can I interest you in a crab cake?" } },
  },
}

P:NPC {
  key = "millstipe", id = TODO_NPC("Councilman Millstipe"), name = "Councilman Millstipe",
  bible = "bibles/darkshire_folk.md", role = "noble", tier = "quest",
  communities = { "darkshire" }, temper = { "indignant" }, values = { "just", "proud" },
  notices = { "status", "soldier" },

  greetings = {
    { id = "g_council", text = "From Stormwind? I have a list for you. From anywhere else, a shorter one." },
    { id = "g_back", when = { metBefore = true }, text = "You. Good. You came back, which is more than the last three Stormwind envoys managed." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Armour. Real armour. Is the Crown finally sending soldiers, or did you come on your own? On your own. Of course." },
    { id = "n_status", cat = "status", when = { townStanding = { town = "darkshire", min = 30 } },
      text = "The Watch speaks well of you. Do you know how rarely the Watch speaks well of anything? I'm minuting it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Councilman Millstipe, Council of Darkshire. We govern this town. We'd govern it better if Stormwind ever read our letters past the first line." },
        { id = "h_ello", when = { heardLine = "ello.h_default" },
          text = "The mayor told you about his petitions? I drafted half of them. Stronger language every time. They've stopped replying to the strong ones too." },
        { id = "h_ward", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("Crime and Punishment") },
          text = "Dextren Ward sold our dead out of their graves to Morbent Fel. Lord Ebonlocke sentenced him. The nobles in Stormwind took him off our hands and kept him. In the Stockade. Alive." },
        { id = "h_ward_done", tags = { "news" }, when = { questDone = TODO_QUEST("Crime and Punishment") },
          text = "It's done, then. The families can visit the graves without wondering. And somewhere in Stormwind a noble has been reminded that Darkshire still exists." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Alliance" },
          text = "You're with the Alliance now, your people? Then you'll learn soon enough. You write to Stormwind, and you wait, and you write again." },
      },
      choices = {
        { text = "What's wrong with Stormwind?", next = "stormwind" },
        { text = "What does the Council do?", next = "council" },
        { text = "Good day, Councilman.", next = "END" },
      },
    },
    stormwind = {
      big = true,
      lines = {
        { id = "s_default", text = "Nothing, if you live there. They pulled the soldiers out, let the nobles overrule our courts, and send back letters about patience. Patience doesn't hold a pike." },
      },
      choices = {
        { text = "They've got troubles of their own.", next = "troubles" },
        { text = "Darkshire deserves better.", next = "END", fx = { affinity = 2, standing = { darkshire = 1 } } },
      },
    },
    troubles = {
      lines = { { id = "t_default", text = "So does everyone. Ours have teeth. Theirs have committees. Forgive me if I don't weep." } },
      choices = { { text = "...", next = "END" } },
    },
    council = {
      lines = { { id = "c_default", text = "Taxes, roads, graves, quarrels. Mostly graves, lately. We judge our own crimes, too. When we're allowed to." } },
      choices = { { text = "When you're allowed to?", next = "stormwind" }, { text = "I see.", next = "END" } },
    },
  },

  topics = {
    night_watch = { { id = "tp_watch", text = "The Council funds them with what we have, which is gratitude and leftover pikes." } },
    worgen = { { id = "tp_worgen", text = "On the agenda every week. Every week the agenda loses." } },
    stalvan = { { id = "tp_stalvan", text = "Before my time on the Council. The file is thin. I suspect someone wanted it thin." } },
    _none = { { id = "tp_none", text = "Write it down and submit it to the Council. We'll lose it properly." } },
  },
}

P:NPC {
  key = "trelayne", id = TODO_NPC("Innkeeper Trelayne"), name = "Innkeeper Trelayne",
  bible = "bibles/darkshire_folk.md", role = "innkeeper", tier = "service",
  communities = { "darkshire" }, temper = { "steady" }, values = { "practical", "kind" },
  notices = { "weary", "kit" },

  greetings = {
    { id = "g_beds", text = "Beds upstairs, blankets in the chest, shutters stay closed. That last one isn't a suggestion." },
    { id = "g_home", when = { homeInn = { "Darkshire", "Scarlet Raven Tavern" } }, text = "Your room's as you left it. I checked the shutters twice. Habit." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "In you come, quick. Don't stand in the doorway with the light behind you. They notice that." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { deathsHere = { min = 2 } },
      text = "You look like the woods chewed on you and spat you out. Twice, by the look. Sit. I'll bring something hot." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your kit's in ribbons. Gnarltrees up the road will patch it. Do it before you sleep; nobody sleeps well with holes in their mail around here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Trelayne. Smitts keeps the bar, I keep the beds. Between us we keep people indoors after dark, which is the whole job here." },
        { id = "h_smitts", when = { heardLine = "smitts.m_default" },
          text = "So Smitts told you about the murders. He tells everyone eventually. Let him. It's the only thing he's never been able to put down." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "How do you sleep here?", next = "sleep" },
        { text = "Just passing through.", next = "END" },
      },
    },
    sleep = {
      lines = { { id = "s_default", text = "Badly, and with a poker by the bed. You get used to the howling. You never get used to it stopping." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    night_watch = { { id = "tp_watch", text = "Half of them sleep here between shifts. I don't charge. They don't stay long enough to count." } },
    worgen = { { id = "tp_worgen", text = "They don't come into the square. Yet. I keep the shutters closed in case 'yet' turns up." } },
    _none = { { id = "tp_none", text = "Ask Smitts. He knows everything. He'll make you pay for it in listening." } },
  },
}

P:NPC {
  key = "clarise", id = TODO_NPC("Clarise Gnarltree"), name = "Clarise Gnarltree",
  bible = "bibles/darkshire_folk.md", role = "trainer", tier = "service",
  communities = { "darkshire" }, temper = { "wry" }, values = { "practical", "craft" },
  notices = { "craft", "stealth" },

  greetings = {
    { id = "g_forge", text = "Forge is hot, hammer's heavy, and you're standing right where the sparks go. Step left." },
    { id = "g_back", when = { metBefore = true }, text = "More lessons, or more burns? Both, usually." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! Show me your hands. Hm. Fewer burns than mine. You're either very good or you haven't tried anything hard yet." },
  },

  react = {
    { id = "r_stealth", on = "stealth",
      text = "Light's sake! Don't come out of the dark at me like that. Next time cough, or whistle, or something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Clarise Gnarltree. I teach the craft. Gavin does the blades, Morg does the armour, and between the three of us there's a Gnarltree for every bit of you." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elf-built. Light frame, long reach. If you ever take up the hammer, choke up on the handle. You'll thank me." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS" },
        { text = "You don't look like you've slept.", next = "sleep" },
        { text = "Later.", next = "END" },
      },
    },
    sleep = {
      big = true,
      lines = {
        { id = "s_default", text = "Not much. Some nights the wind brings screaming down off the hills. Could be wolves. Could be anything. I just work till it stops." },
      },
      choices = {
        { text = "That sounds hard.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "At least the work gets done.", next = "END", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "Claws like that go through cheap mail like it's wet paper. Don't buy cheap mail. Buy ours." } },
    night_watch = { { id = "tp_watch", text = "I keep their pikes sharp for free. Least I can do. Well, the least I can do is nothing. This is a bit more." } },
    _none = { { id = "tp_none", text = "If you can't hit it or wear it, I'm no help." } },
  },
}
