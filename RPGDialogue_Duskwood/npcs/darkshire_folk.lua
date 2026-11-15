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
    { id = "g_light", when = { class = { "PRIEST", "PALADIN" } }, text = "Glory under the Light. Come in." },
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
        { id = "h_woods", when = { questActive = TODO_QUEST("Worgen in the Woods") },
          text = "Calor has you hunting. Good. Come back with your blade wet and his note in your hand, and we'll talk properly." },
        { id = "h_family", tags = { "news" }, when = { questActive = TODO_QUEST("The Carevin Family") },
          text = "A night elf priestess, staying in Darkshire? No. I'd know. What I'd like to know is why a stranger asks me that, and then about wolf-men, in one breath." },
        { id = "h_scythe", when = { questActive = TODO_QUEST("The Scythe of Elune") },
          text = "You asked your questions. Now answer mine with your blade. Then we'll see what you've earned." },
        { id = "h_answered", when = { questDone = TODO_QUEST("Answered Questions") },
          text = "I have more to go on than I did, and I like it less. That's how answers usually go." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elf-kin, but not a cut I know. Where your people come from is your own business. What you do in my woods is mine." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest. Then you know what we fight for. Glory under the Light. Say it with me, or tell me why you won't." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin. The Light walks with you; walk it out past the lamps, where it's needed. The Watch has candles enough." },
      },
      again = {
        { id = "h_again", text = "Well? I haven't all night. Nobody in this house has." },
        { id = "h_again2", text = "Ask. Briefly." },
      },
      choices = {
        { text = "What does your household do?", next = "hunt" },
        { text = "Why are you so suspicious?", next = "wary" },
        { text = "You fight under the Light?", next = "light" },
        { text = "What do you make of the Night Watch?", next = "watch" },
        { text = "Glory under the Light.", next = "priest", when = { class = "PRIEST" } },
        { text = "I'm a druid, not a beast.", next = "druid", when = { class = "DRUID" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    hunt = {
      lines = {
        { id = "hu_default", text = "We hunt. Nothing more mysterious than that. The Watch waits for the dark to come to them. We go to it." },
      },
      choices = {
        { text = "I'd like to help.", next = "BACK", fx = { affinity = 1, learn = { "carevins" } } },
        { text = "Sounds like a good way to die.", next = "die" },
        { text = "Who hunts with you?", next = "hunt_who" },
      },
    },
    die = {
      lines = { { id = "d_default", text = "It is. So is staying home, here. At least we pick the ground." } },
      choices = { { text = "Fair.", next = "BACK" } },
    },
    hunt_who = {
      lines = {
        { id = "hw_default", text = "Family, and the few Calor vouches for. Elaine keeps supplies moving; Sven Yorgen's camp eats because of her. The other names are ours to keep.",
          fx = { learn = { "carevins" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wary = {
      big = true,
      lines = {
        { id = "w_default", text = "The worgen came out of nowhere, and nothing comes out of nowhere. Someone brought them. Someone knows. Until I find out who, everyone is a question." },
      },
      choices = {
        { text = "Including me.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "worgen" } } },
        { text = "I'll help you find out.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Who would help such things?", next = "wary_aid" },
      },
    },
    wary_aid = {
      lines = {
        { id = "wa_default", text = "Those who give aid to demons and the dead. They exist. A man of this town sold Raven Hill's dead to a necromancer. Someone always sells.",
          fx = { learn = { "morbent_fel" } } },
      },
      choices = {
        { text = "Trust no one, then?", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    light = {
      lines = {
        { id = "li_default", text = "Always. Against evil, and against heresy. The Watch guards against the first. Somebody has to root out the second." },
      },
      choices = {
        { text = "What counts as heresy?", next = "light_heresy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_heresy = {
      lines = {
        { id = "lh_default", text = "Anything that bargains with the dark. Grave robbers, cultists, old men with too many books about the dead. I keep a list. It isn't short." },
      },
      choices = {
        { text = "Who's on it?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "That's a dangerous list to keep.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    watch = {
      lines = {
        { id = "wt_default", text = "Good people who have learned how to lose slowly. Calor stood with them for years. Ask him why he stopped." },
      },
      choices = {
        { text = "He left them for you?", next = "watch_calor" },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    watch_calor = {
      lines = {
        { id = "wc_default", text = "He left them for the work. I happened to be doing it. Don't let him tell you otherwise; he'll make me sound like a saint." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "...You said it as if you meant it. Most visitors mumble. Calor will want to test you. Let him." },
      },
      choices = {
        { text = "And if I fail his test?", next = "priest_test" },
        { text = "The Light doesn't need tests.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
      },
    },
    priest_test = {
      lines = {
        { id = "pt_default", text = "Then you'll have learned what the woods are, which is worth something. And Calor will say the words over you. He's better at it than he looks." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    druid = {
      lines = {
        { id = "dr_default", text = "I know. I said so. It doesn't change what my crossbow sees in the dark. Change where there's light, and we'll get on." },
      },
      choices = { { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My household hunts what hunts this town. That's all of my story a stranger needs." } },
    advice = { { id = "tp_ad", text = "Trust none who won't stand with you against the dead. It's a short test. It hasn't failed me yet." } },
    night_watch = { { id = "tp_watch", text = "Brave people with lanterns. I don't fault them. I just don't wait with them." } },
    worgen = { { id = "tp_worgen", text = "They didn't wander here. Packs that size don't wander. Something called them." } },
    carevins = { { id = "tp_carevins", text = "My family. We keep our own counsel. That's all the town needs to know, and most of what they say." } },
    ladimore = { { id = "tp_ladimore", text = "Sirra will tell you the story. I'll tell you the end of it walks at Raven Hill and doesn't care who you are." } },
    stalvan = { { id = "tp_stalvan", text = "Old murders. I hunt the ones still happening." } },
    morbent_fel = { { id = "tp_morbent", text = "A necromancer on a hill, and a town that let him buy its dead. He's on my list. Near the top." } },
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
        { id = "h_ravenhill", when = { questDone = TODO_QUEST("Raven Hill") },
          text = "Raven Hill's ghost was one frightened man with a lamp? Light. I'd have put a bolt through that window. Good thing Elaine sent you." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elf. Good eyes, I'd guess. Use them in the trees. The worgen are grey on grey and they'll be on you before you've drawn breath." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Out here the Light needs hands as much as voices. Have you got hands?" },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast; I'm due back out." },
        { id = "h_again2", text = "Go on. I'm sharpening. I can listen and sharpen." },
      },
      choices = {
        { text = "Why did you leave the Night Watch?", next = "watch" },
        { text = "How do I prove myself?", next = "prove" },
        { text = "What do you know about the worgen?", next = "worgen" },
        { text = "What did you see at Raven Hill?", next = "ravenhill" },
        { text = "Do you pray before you hunt?", next = "priest", when = { class = "PRIEST" } },
        { text = "Let me ride out with you.", next = "paladin", when = { class = "PALADIN" } },
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
        { text = "I'd rather fight too.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Do you miss it?", next = "watch_miss" },
      },
    },
    hold = {
      lines = { { id = "ho_default", text = "Somebody does. Somebody else. I didn't say they were wrong. I said I couldn't." } },
      choices = { { text = "Fair enough.", next = "BACK" } },
    },
    watch_miss = {
      lines = {
        { id = "wm_default", text = "The people. Not the waiting. I still drink with them at the Raven, when they'll have me. Some won't." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },
    prove = {
      lines = { { id = "p_default", text = "Not with talk. Go out to the grove, kill what's there, come back and tell me what you saw. Then we'll talk about Master Carevin." } },
      choices = {
        { text = "I'll be back.", next = "BACK", fx = { learn = { "carevins", "worgen" } } },
        { text = "Which grove?", next = "prove_where" },
      },
    },
    prove_where = {
      lines = {
        { id = "pw_default", text = "Brightwood Grove, north of the road. Bright! Somebody had a sense of humour, once. The shadow weavers nest there and in the Rotting Orchard." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worgen = {
      lines = {
        { id = "wo_default", text = "They seemed to appear out of thin air. Kill one and two step out of the trees. What draws them here I can't say. Master Carevin will find out." },
      },
      choices = {
        { text = "And if he doesn't?", next = "worgen_doubt" },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    worgen_doubt = {
      lines = {
        { id = "wd_default", text = "Then we keep killing them until he does. Faith isn't knowing the answer. It's keeping on until someone does. Those who stand in the Light don't fall." },
      },
      choices = {
        { text = "I hope you're right.", next = "BACK", fx = { affinity = 1 } },
        { text = "Plenty of good people fall.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    ravenhill = {
      lines = {
        { id = "rh_default", text = "Shadows moving in the houses, two nights running, and a light in a window the night before. Raven Hill's been empty for years. Empty houses don't light lamps." },
      },
      choices = {
        { text = "Did you go in?", next = "ravenhill_in" },
        { text = "Something else.", next = "BACK", fx = { learn = { "raven_hill" } } },
      },
    },
    ravenhill_in = {
      lines = {
        { id = "ri_default", text = "No. Elaine said to send someone careful. I'm not careful. I'd have burned the place down and asked my questions of the ashes." },
        { id = "ri_done", when = { questDone = TODO_QUEST("Raven Hill") },
          text = "No. And thank the Light for it. One poor, hiding wretch. I'd have shot him through the window and called it a ghost." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Every time. Short ones. 'Let me see it first.' The Light's been good about that so far." },
      },
      choices = {
        { text = "That's a soldier's prayer.", next = "BACK", fx = { affinity = 2 } },
        { text = "Pray for the worgen too, sometimes.", next = "priest_them" },
      },
    },
    priest_them = {
      lines = {
        { id = "pt_default", text = "For them? ...You're a better priest than I'd be. I'll think on it. Don't tell Master Carevin I said that." },
      },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 1, align = { light = 1 }, trait = { kind = 1 } } } },
    },
    paladin = {
      lines = {
        { id = "pa_default", text = "Gladly. Bring that hammer to Brightwood and let them hear the Light ring off it. A few more like you, and we'd outnumber the Watch." },
      },
      choices = { { text = "Lead on.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 }, learn = { "carevins" } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I stood a Watch post for years. Now I hunt with Master Carevin. That's the part of me worth knowing." } },
    advice = { { id = "tp_ad", text = "Count your fingers when you come out of the trees. That's how you know you won." } },
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
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Do they still teach the old burial forms at the abbey? Half the stones at Raven Hill are carved in them, and I'm the only one left who reads them." },
      },
      again = {
        { id = "h_again", text = "Yes? Another question? Splendid. Questions are the only thing in this town that keep." },
        { id = "h_again2", text = "Go on. I've lost my place anyway." },
      },
      choices = {
        { text = "Tell me about Morgan Ladimore.", next = "morgan" },
        { text = "What's the oldest thing you've read?", next = "oldest" },
        { text = "Tell me Darkshire's history.", next = "history" },
        { text = "What languages do you read?", next = "languages" },
        { text = "Who said the rites over Morgan?", next = "priest", when = { class = "PRIEST" } },
        { text = "Test me. Give me a script.", next = "mage", when = { class = "MAGE" } },
        { text = "I came home from Lordaeron too.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
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
        { text = "That's a hard story.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "ladimore" } } },
        { text = "You knew him?", next = "morgan_knew" },
      },
    },
    now = {
      lines = { { id = "n_default", text = "Now he doesn't rest. The grave is in a quiet corner of Raven Hill. I'd not go there after dark. I'd not go there at all, honestly." } },
      choices = {
        { text = "Who deals with him?", next = "now_althea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    now_althea = {
      lines = {
        { id = "na_default", text = "Althea. She's been handling the... trouble. With pikes, mostly. Pikes are not a historian's instrument, but I concede they have their uses." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    morgan_knew = {
      lines = {
        { id = "mk_default", text = "Before the war. A noble, good man. That is the man I keep on my shelf. The other one I leave to the Watch, and try not to think about." },
      },
      choices = {
        { text = "That's a kind way to remember him.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldest = {
      lines = { { id = "o_default", text = "Town ledgers from before the First War. Births, deaths, a long argument about a fence. It's the fence I love. Nobody fights about fences in a dying town." } },
      choices = {
        { text = "That's oddly hopeful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Before the First War? Was it Grand Hamlet then?", next = "oldest_hamlet" },
      },
    },
    oldest_hamlet = {
      lines = {
        { id = "oh_default", text = "Grand Hamlet, yes. Orcs burned it in the First War; the Alliance rebuilt it after the Second. Then the dark came, and someone renamed it without asking me." },
      },
      choices = {
        { text = "That bothers you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    history = {
      lines = {
        { id = "hi_default", text = "Which? The founding, the fires, or the fog? I recommend the fires. The fog is very poorly documented." },
      },
      choices = {
        { text = "The fog.", next = "history_fog" },
        { text = "The fires.", next = "oldest_hamlet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history_fog = {
      lines = {
        { id = "hf_default", text = "It came slowly, the old families say, and never lifted. Some say a curse, some blame the tower in Deadwind Pass. I say I need a primary source." },
      },
      choices = {
        { text = "Has anyone gone to look?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    languages = {
      lines = {
        { id = "la_default", text = "Common in all its old forms, a little Dwarven, and the dead scripts no one else in Darkshire bothers with. Which is why people bring me things." },
      },
      choices = {
        { text = "What sort of things?", next = "languages_things" },
        { text = "Something else.", next = "BACK" },
      },
    },
    languages_things = {
      lines = {
        { id = "lt_default", text = "Gravestones, mostly. Letters from the dead, sometimes. A hermit's note, once. I'd rather not discuss the hermit's note." },
        { id = "lt_after", when = { questDone = TODO_QUEST("Translation to Ello") },
          text = "That hermit's note. I read it aloud, slowly, and felt the air go heavy around me. I'd rather not discuss it further. Ever." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "embalmer" } } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "No one. They buried him quickly, without ceremony, on the edge of the cemetery. I understand why. I've never been comfortable with it." },
      },
      choices = {
        { text = "Then I'll say them.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Did a priest send him to the graves?", next = "priest_priest" },
      },
    },
    priest_priest = {
      lines = {
        { id = "pp_default", text = "A priest in Darkshire told him to look for a gravestone at Raven Hill. Kindly meant. He refused to believe it, and then he went. Don't carry that. Nobody should." },
      },
      choices = {
        { text = "Someone had to tell him.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Very well. This one. ...No, that's a laundry list, in old Common. I was testing your honesty, not your eyes. You failed charmingly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    lordaeron = {
      lines = {
        { id = "lo_default", text = "Then you've seen what he saw. The plague. The Silver Hand broken. Morgan came home from that to graves. Did you come home to anything?" },
      },
      choices = {
        { text = "Nothing that was still standing.", next = "BACK", fx = { affinity = 2 } },
        { text = "To strangers. And Stormwind.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Historian to Darkshire. I read what the town wrote down and correct what it got wrong. The second takes much longer." } },
    advice = { { id = "tp_ad", text = "Read the gravestones at Raven Hill before you fight anything there. Half the names will tell you what you're about to meet." } },
    night_watch = { { id = "tp_watch", text = "Founded in a hurry, recorded in a hurry. Half the rosters are in pencil. That tells you all you need to know." } },
    worgen = { { id = "tp_worgen", text = "Nothing in the records. Not one mention before these last years. Which is the most interesting thing anyone's told me in ages." } },
    stalvan = { { id = "tp_stalvan", text = "The Mistmantles are in the old registers, yes. Then a gap. I hate a gap. Smitts hates it more." } },
    ladimore = { { id = "tp_ladimore", text = "There's a book on him; the library in Stormwind keeps a copy, and so do I. It tells it better than I can, and I knew him." } },
    carevins = { { id = "tp_carevins", text = "A Darkshire family who don't care for being written about. I write about them anyway, quietly." } },
    embalmer = { { id = "tp_embalmer", text = "A nursery tale, until I translated a note. I've moved the nursery tale to the history shelf. I don't like it there." } },
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
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Do you know Cog Glitzspinner? No, of course not, there must be thousands of you. Forgive me. I get excited about gnomes." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest. You'll tell me the dark is a test of faith. Maybe! But tests have instruments, and I'm building one." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You lived above the clouds? Truly? What did the stars look like with nothing in the way? No, don't tell me. Yes. Tell me." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, if there's cloud coming." },
        { id = "h_again2", text = "Go on, go on. I'm only polishing a lens. I'm always polishing a lens." },
      },
      choices = {
        { text = "What are you building?", next = "device" },
        { text = "Why the stars, here?", next = "why" },
        { text = "Who is Cog?", next = "cog" },
        { text = "What can you see through the fog?", next = "fog" },
        { text = "Show me Cog's drawings.", next = "gnome", when = { race = "Gnome" } },
        { text = "Maybe the dark is a matter for faith.", next = "priest", when = { class = "PRIEST" } },
        { text = "I can turn you a true tube.", next = "engineer", when = { profession = "Engineering" } },
        { text = "Good luck with the fog.", next = "END" },
      },
    },
    device = {
      lines = {
        { id = "d_default", text = "A way to see far things close. Cog drew it; I'm only the hands. Lenses, tubes, a mount that doesn't wobble. The wobbling is the hard part." },
      },
      choices = {
        { text = "I'll keep an eye out for parts.", next = "BACK", fx = { affinity = 1 } },
        { text = "What parts, exactly?", next = "device_parts" },
      },
    },
    device_parts = {
      lines = {
        { id = "dp_default", text = "A tube, true and bronze. Something that reflects light. And a lens big enough to be worth the trouble. I know where one is. It's on an ogre." },
      },
      choices = {
        { text = "On an ogre?", next = "device_monocle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    device_monocle = {
      lines = {
        { id = "dm_default", text = "Zzarc'Vul, in the ogre mound to the south. He wears a monocle. What an ogre needs with a monocle I can't imagine, but it's exactly the right size." },
      },
      choices = {
        { text = "You want me to rob an ogre of his monocle.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because something changed this forest, and everyone says magic and stops thinking. I don't want to stop thinking. I want to look up and find a reason." },
      },
      choices = {
        { text = "I hope you find it.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Some things don't have reasons.", next = "reasons" },
      },
    },
    reasons = {
      lines = { { id = "r_default", text = "Then I'll have wasted some time and learned a great deal about lenses. I can live with that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cog = {
      lines = {
        { id = "cg_default", text = "Cog Glitzspinner. A gnome, and a friend. He sends blueprints the way other people send regards. I show him every step. He says he's impressed." },
      },
      choices = {
        { text = "Is he?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fog = {
      lines = {
        { id = "fo_default", text = "Mostly fog. But the gap above this hut opens some nights, and the fog thins. Twenty minutes of sky. I've charted three new stars." },
      },
      choices = {
        { text = "Twenty minutes isn't much.", next = "fog_gap" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fog_gap = {
      lines = {
        { id = "fg_default", text = "It's twenty more than anyone else in Duskwood bothers with. Everybody here looks down. At graves, mostly. Somebody should look up." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Would you? Here. ...You see that? He drew the mount three times. Three! He knows the wobble is the enemy. Do all gnomes think in mounts?" },
      },
      choices = {
        { text = "Only the good ones.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Maybe it is! Then let faith look through the glass too. If the Light made the stars, it won't mind being measured. Will it?" },
      },
      choices = {
        { text = "It won't mind.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Some things aren't for measuring.", next = "BACK", fx = { trait = { pious = 1 } } },
      },
    },
    engineer = {
      lines = {
        { id = "en_default", text = "You can? A true one? Herble sells a few, but his are dear and his opinions come free. Make me one and astronomy in Duskwood will owe you everything." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I study the stars. In Duskwood. Yes, I know. Laugh, then ask me something real." } },
    advice = { { id = "tp_ad", text = "Look up now and then. Everything that wants to eat you is down here." } },
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
          text = "That fellow up the hill watched something awful, didn't he? You can tell by how a man eats. He ate like it was the last thing he'd ever be sure of." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Bless the stew? It's been a long week for the stew." },
      },
      again = {
        { id = "h_again", text = "What else? Taste this while you think. No, don't ask what it is." },
        { id = "h_again2", text = "Go on! The pot needs stirring and I need talking to." },
      },
      choices = {
        { text = "What's in the crab cakes?", next = "secret" },
        { text = "What's good tonight?", next = "tonight" },
        { text = "Who do you cook for, out here?", next = "customers" },
        { text = "Where do you get anything, in Duskwood?", next = "ingredients" },
        { text = "Cook to cook: what's the trick?", next = "cook", when = { profession = "Cooking" } },
        { text = "I'll bless the stew.", next = "priest", when = { class = "PRIEST" } },
        { text = "Just smelling, thanks.", next = "END" },
      },
    },
    secret = {
      lines = {
        { id = "s_default", text = "Crab! Mostly crab. Crab-adjacent. Look, does it taste good? Then that's what's in it." },
      },
      choices = {
        { text = "I'll take your word for it.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's not reassuring.", next = "worry" },
        { text = "Crab-adjacent?", next = "secret_adjacent" },
      },
    },
    worry = {
      lines = { { id = "w_default", text = "It's not meant to reassure. It's meant to be delicious. Different job entirely." } },
      choices = { { text = "Fair.", next = "BACK" } },
    },
    secret_adjacent = {
      lines = {
        { id = "sa_default", text = "Things with legs. A good many legs. Crabs have legs! I'm saying nothing that isn't technically true about crabs." },
      },
      choices = {
        { text = "How many legs, Grual?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I don't want to know.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    tonight = {
      lines = { { id = "t_default", text = "Stew. It's always stew by the end of the week. Everything that didn't get eaten goes in, and comes out tasting like it meant to." } },
      choices = {
        { text = "Stew it is.", next = "BACK", fx = { affinity = 1 } },
        { text = "What went in this week?", next = "tonight_week" },
      },
    },
    tonight_week = {
      lines = {
        { id = "tw_default", text = "Wolf. More wolf. A turnip that put up a fight. And pepper from Stormwind, which is more than Stormwind's soldiers ever managed." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    customers = {
      lines = {
        { id = "cu_default", text = "Watchers, at all hours. Travellers, fewer every year. And now and then somebody who can't come down to eat, so the food goes up to them." },
      },
      choices = {
        { text = "Like the man at Raven Hill?", next = "customers_jitters", when = { questDone = TODO_QUEST("Jitters' Growling Gut") } },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    customers_jitters = {
      lines = {
        { id = "cj_default", text = "Him. I send a little up whenever someone's going that way. He never sends the plate back. I don't ask for it." },
      },
      choices = { { text = "That's kind of you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    ingredients = {
      lines = {
        { id = "in_default", text = "The woods provide. Wolves, mostly. Things that, er, skitter. Mushrooms! I mean mushrooms. The rest comes down the road from Stormwind, slowly." },
      },
      choices = {
        { text = "What comes from Stormwind?", next = "ingredients_stormwind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ingredients_stormwind = {
      lines = {
        { id = "is_default", text = "Herbs, from Felicia Gump's flower shop on the canals. A wolf without Stormwind seasoning is only a wolf. With it, it's a kabob." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = {
        { id = "co_default", text = "The trick is never telling. Fetch me the makings for the crab cakes and I'll show you something nearly as good. Nearly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Would you? Here, over the pot. ...Smells better already. That's faith, or the onions catching up. Either way, thank you." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Grual! Cook! That's the whole of it. A man is what he feeds people." } },
    advice = { { id = "tp_ad", text = "Eat before you go into the woods. Nobody fights well hungry, and nobody runs well full. Aim for the middle." } },
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
          text = "Dextren Ward sold our dead to Morbent Fel, and Lord Ebonlocke sentenced him to die. The nobles in Stormwind took him instead. He's alive, in their Stockade." },
        { id = "h_ward_done", tags = { "news" }, when = { questDone = TODO_QUEST("Crime and Punishment") },
          text = "It's done, then. The families can visit the graves without wondering. And somewhere in Stormwind a noble has been reminded that Darkshire still exists." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Alliance" },
          text = "You're with the Alliance now, your people? Then you'll learn soon enough. You write to Stormwind, and you wait, and you write again." },
        { id = "h_noble", when = { origin = "human_minor_noble" },
          text = "A noble's child, in my town hall. Do sit. I've waited years to say a few things to one of you. I'll be brief. I won't be kind." },
      },
      again = {
        { id = "h_again", text = "Next item. I'm minuting this, you understand." },
        { id = "h_again2", text = "Go on. The council's in recess. It's always in recess, lately." },
      },
      choices = {
        { text = "What's wrong with Stormwind?", next = "stormwind" },
        { text = "What does the Council do?", next = "council" },
        { text = "Who is Dextren Ward?", next = "ward" },
        { text = "What would you do, in Stormwind's place?", next = "place" },
        { text = "My family sits in the House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "Ward's dead. Was that justice, or a message?", next = "justice", when = { questDone = TODO_QUEST("Crime and Punishment") } },
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
        { text = "Darkshire deserves better.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } },
        { text = "Who decided to pull the soldiers out?", next = "stormwind_who" },
      },
    },
    troubles = {
      lines = { { id = "t_default", text = "So does everyone. Ours have teeth. Theirs have committees. Forgive me if I don't weep." } },
      choices = { { text = "Fair.", next = "BACK" } },
    },
    stormwind_who = {
      lines = {
        { id = "sw_default", text = "Someone at court, after the king went missing. The orders came signed and sealed, and nobody would say whose idea they were. Ask who gains when a town's left alone." },
      },
      choices = {
        { text = "Who does gain?", next = "BACK", fx = { trait = { curious = 1 }, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Taxes, roads, graves, quarrels. Mostly graves, lately. We judge our own crimes, too. When we're allowed to." } },
      choices = {
        { text = "When you're allowed to?", next = "ward" },
        { text = "I see.", next = "BACK" },
      },
    },
    ward = {
      lines = {
        { id = "wd_default", text = "A grave robber. He dug up our dead at Raven Hill and sold them to the necromancer on the hill. We sentenced him. The House of Nobles said no.",
          fx = { learn = { "morbent_fel" } } },
      },
      choices = {
        { text = "Why would they stop it?", next = "ward_stockade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ward_stockade = {
      lines = {
        { id = "ws_default", text = "Jurisdiction, they said. He eats their bread in their Stockade, and the families here still can't stand at a grave without wondering if it's empty." },
      },
      choices = {
        { text = "Someone should finish what you started.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "The law is the law.", next = "BACK", fx = { affinity = -1, align = { order = 2 } } },
      },
    },
    place = {
      lines = {
        { id = "pl_default", text = "Send fifty soldiers. Fifty! Not an army. Fifty, a priest, and one clerk who reads our letters past the first line." },
      },
      choices = {
        { text = "And if they still won't?", next = "place_break" },
        { text = "Something else.", next = "BACK" },
      },
    },
    place_break = {
      big = true,
      lines = {
        { id = "pb_default", text = "Then Darkshire learns to want nothing from Stormwind. That's a dangerous lesson for a town to learn. I'd rather not be the one teaching it." },
      },
      choices = {
        { text = "Let's make sure it never comes to that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Then tell them this, word for word: Darkshire's dead are being sold, and you're keeping the man who sold them warm. Will you remember that?" },
      },
      choices = {
        { text = "Word for word.", next = "BACK", fx = { affinity = 3, align = { honor = 1 }, standing = { darkshire = 1 } },
          journal = { first = "Councilman Millstipe gave me a message for the House of Nobles, about Darkshire's stolen dead.",
                      third = "{name} carried Councilman Millstipe's message for the House of Nobles." } },
        { text = "They won't listen to me either.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    justice = {
      lines = {
        { id = "ju_default", text = "Both. Justice for the families, a message for the nobles. I don't lose sleep over which mattered more. Not much sleep." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Councilman of Darkshire. I sit, I argue, I draft letters. Some days that feels like fighting. Most days it doesn't." } },
    advice = { { id = "tp_ad", text = "Write everything down and sign it. When Stormwind finally asks what happened here, I want the answer in our own hand." } },
    night_watch = { { id = "tp_watch", text = "The Council funds them with what we have, which is gratitude and leftover pikes." } },
    worgen = { { id = "tp_worgen", text = "On the agenda every week. Every week the agenda loses." } },
    stalvan = { { id = "tp_stalvan", text = "Before my time on the Council. The file is thin. I suspect someone wanted it thin." } },
    morbent_fel = { { id = "tp_morbent", text = "A necromancer who buys corpses, and a grave robber who sold them. One of them Stormwind protects. Guess which." } },
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
      again = {
        { id = "h_again", text = "Anything else? I've beds to turn down." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "How do you sleep here?", next = "sleep" },
        { text = "Who stays here, these days?", next = "guests" },
        { text = "Shall I bless the shutters?", next = "priest", when = { class = "PRIEST" } },
        { text = "Just passing through.", next = "END" },
      },
    },
    sleep = {
      lines = { { id = "s_default", text = "Badly, and with a poker by the bed. You get used to the howling. You never get used to it stopping." } },
      choices = {
        { text = "Why the shutters?", next = "sleep_shutters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sleep_shutters = {
      lines = {
        { id = "ss_default", text = "Because something out there calls names some nights. Never open a shutter because you heard yours. Nobody you'd want is calling." },
      },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    guests = {
      lines = {
        { id = "gu_default", text = "Watchers between shifts, the odd brave traveller, and the odd foolish one. I can't tell which is which till morning." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Would you? I'll take any help that keeps them shut. Bless the hinges too. The hinges are where it all goes wrong." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the beds at the Raven. That's my story. A short one's safer, in Duskwood." } },
    advice = { { id = "tp_ad", text = "Sleep with your boots where you can find them in the dark. You never know." } },
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
      again = {
        { id = "h_again", text = "Something else? Talk over the hammer; I won't stop." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS" },
        { text = "You don't look like you've slept.", next = "sleep" },
        { text = "What do you make, mostly?", next = "work" },
        { text = "Later.", next = "END" },
      },
    },
    sleep = {
      big = true,
      lines = {
        { id = "s_default", text = "Not much. Some nights the wind brings screaming down off the hills. Could be wolves. Could be anything. I just work till it stops." },
      },
      choices = {
        { text = "That sounds hard.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What does it sound like?", next = "sleep_lambs" },
      },
    },
    sleep_lambs = {
      lines = {
        { id = "sl_default", text = "Like lambs. That's the worst of it. It sounds like lambs, and I've never once found a lamb in the morning." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = {
        { id = "wk_default", text = "Pike heads for the Watch, nails for the shutters, hinges that hold. Pretty work's for Stormwind. Here we make things that keep you alive." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Gnarltree, at a forge in Darkshire. That's the whole story, and I like it short." } },
    advice = { { id = "tp_ad", text = "Mend your mail before you sleep, not after. Holes have a way of getting bigger in the dark." } },
    worgen = { { id = "tp_worgen", text = "Claws like that go through cheap mail like it's wet paper. Don't buy cheap mail. Buy ours." } },
    night_watch = { { id = "tp_watch", text = "I keep their pikes sharp for free. Least I can do. Well, the least I can do is nothing. This is a bit more." } },
    _none = { { id = "tp_none", text = "If you can't hit it or wear it, I'm no help." } },
  },
}
