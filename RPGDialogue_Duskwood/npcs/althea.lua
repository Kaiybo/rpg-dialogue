-- Commander Althea Ebonlocke, the Night Watch, Darkshire. Voice: bibles/althea.md
-- Holds the town with a militia, adventurers and very little sleep.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "althea", id = TODO_NPC("Commander Althea Ebonlocke"), name = "Commander Althea Ebonlocke",
  bible = "bibles/althea.md", role = "soldier", tier = "major",
  communities = { "darkshire" }, temper = { "steady" }, values = { "brave", "lawful", "stern" },
  notices = { "soldier", "night" },

  greetings = {
    { id = "g_watch", text = "Night Watch. State your business, then be useful." },
    { id = "g_recruit", when = { questDone = TODO_QUEST("The Night Watch") }, text = "One of mine, near enough. Report." },
    { id = "g_hero", when = { townStanding = { town = "darkshire", min = 55 } }, text = "There's the reason half my watchers are still alive. Sit. Briefly." },
    { id = "g_ladim", when = { questActive = TODO_QUEST("Mor'Ladim") }, text = "Mor'Ladim. Take friends. I mean it." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN", "HUNTER" }, minLevel = 20 },
      text = "You'd make a decent watcher. We don't pay, we don't sleep, and the woods want to eat us. Interested?" },
    { id = "n_night", cat = "night", when = { timeOfDay = "night" },
      text = "Out after dark. In Duskwood. Either you're very brave or you haven't been here long. Stay in the lamplight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Commander Ebonlocke, the Night Watch. We're sworn to keep Darkshire's people alive. Some nights that's the whole of the oath, and it's plenty." },
        { id = "h_watch", tags = { "news" }, when = { questActive = TODO_QUEST("The Night Watch") },
          text = "The dead don't stay in the cemeteries out here. Thin them. Every skeleton you put down is one less at our gate." },
        { id = "h_watch_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Night Watch"), days = 3 } },
          text = "My watchers slept a full night. Two of them didn't know what to do with themselves." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "An old murder. Visiting nobles, years ago. Smitts never let it go, and now neither will you. Follow it to the end." },
        { id = "h_morgan", when = { questActive = TODO_QUEST("Morgan Ladimore") },
          text = "Sirra sent you with a name. Ladimore. Most of us stopped using it. We call what's left of him Mor'Ladim, when we call him anything." },
        { id = "h_ladim", tags = { "news" }, when = { questActive = TODO_QUEST("Mor'Ladim") },
          text = "He walks the cemetery in a slow, crooked circle and ends at his own grave. He's killed some of my strongest. Don't go alone." },
        { id = "h_ello", text = "The mayor writes to Stormwind. I train farmers to hold a pike. One of us will save this town, and it won't be the letters." },
        { id = "h_new", when = { maxLevel = 22 },
          text = "You're green for Duskwood. Keep to the road, keep a torch lit, and don't follow lights into the trees." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Can your people see through this fog any better than mine? No? Then you're as welcome as anyone else holding a sword." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest. Good. My watchers bleed, and all I have for them is bandages and bad jokes. Stay a night, if you can stand the howling." },
        { id = "h_roll", when = { metBefore = true }, text = "Lost no one last night. Write that down somewhere. It doesn't happen often enough." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly. The lamps won't light themselves." },
        { id = "h_again2", text = "Go on. I've a shift change in an hour and nothing better to do until then." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask, then. Keep half an eye on the gate while you do." },
      },
      choices = {
        { text = "What's out in the woods?", next = "woods" },
        { text = "How can I help the Watch?", next = "help" },
        { text = "Who are your watchers?", next = "watchers" },
        { text = "What is Mor'Ladim?", next = "morladim" },
        { text = "You and the mayor are kin?", next = "ello" },
        { text = "Let me tend your wounded watchers.", next = "priest", when = { class = "PRIEST" } },
        { text = "Did Stalvan Mistmantle do it?", next = "stalvan", when = { topicKnown = "stalvan" } },
        { text = "That stitched thing on the road...", next = "stitches", when = { questDone = TODO_QUEST("Translation to Ello") } },
        { text = "I'll keep to the lamplight.", next = "END" },
      },
    },

    woods = {
      big = true,
      lines = {
        { id = "w_default", text = "Worgen. Walking dead. Ogres from the pass. And the fog, which isn't a creature but behaves like one. Pick your poison." },
      },
      choices = {
        { text = "I'll take them all.", next = "BACK", fx = { trait = { brave = 1 }, affinity = 1, learn = { "worgen" } } },
        { text = "How do you live like this?", next = "live" },
        { text = "Where do the dead come from?", next = "woods_dead" },
      },
    },
    live = {
      lines = { { id = "l_default", text = "Badly. Together. And with a lot of lamp oil." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    woods_dead = {
      lines = {
        { id = "wd_default", text = "The cemeteries. Raven Hill's has swallowed the village it served. The scouts say something in a house above it keeps the dead walking. A man, not a monster." },
      },
      choices = {
        { text = "Who is he?", next = "woods_fel" },
        { text = "Something else.", next = "BACK", fx = { learn = { "raven_hill" } } },
      },
    },
    woods_fel = {
      lines = {
        { id = "wf_default", text = "Morbent Fel. A necromancer on Forlorn Rowe, above the graves. Sven Yorgen, out by the western river, has made him the whole of his life. Ask Sven.",
          fx = { learn = { "morbent_fel" } } },
      },
      choices = {
        { text = "Why hasn't the Watch gone after him?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    help = {
      lines = {
        { id = "hp_default", text = "Talk to my watchers at the posts. They know what needs killing this week. It changes. It never shrinks." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { learn = { "night_watch" }, standing = { darkshire = 1 } } },
        { text = "What needs killing this week?", next = "help_week" },
      },
    },
    help_week = {
      lines = {
        { id = "hw_default", text = "Skeletons in Tranquil Gardens, south of town. Live through that, and there's Raven Hill's graveyard. Live through that, and I'll find you something worse." },
      },
      choices = {
        { text = "You make it sound inviting.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Point me at them.", next = "BUSINESS", fx = { affinity = 1, standing = { darkshire = 1 } } },
      },
    },

    watchers = {
      lines = {
        { id = "wa_default", text = "Farmers, bakers, a tanner, two brothers who never agree on anything. Stormwind pulled its guards out. We trained our own, and they're good." },
      },
      choices = {
        { text = "Do they get paid?", next = "watchers_pay" },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    watchers_pay = {
      lines = {
        { id = "wp_default", text = "In lamp oil and gratitude. The council gives what it has, which is the lamp oil. The gratitude's mine." },
      },
      choices = {
        { text = "They're lucky to have you.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's a hard way to keep an army.", next = "BACK", fx = { opinion = { stormwind = "abandoned_its_own" } } },
      },
    },

    morladim = {
      big = true,
      lines = {
        { id = "ml_default", text = "A dead knight who won't lie down. He walks Raven Hill's cemetery and kills my watchers on patrol. Some of my strongest. I'd like him gone." },
      },
      choices = {
        { text = "Who was he, alive?", next = "morladim_who" },
        { text = "Then he needs putting down.", next = "BACK", fx = { trait = { brave = 1 }, affinity = 1 } },
      },
    },
    morladim_who = {
      lines = {
        { id = "mw_default", text = "Morgan Ladimore. Sirra knew him before the war and keeps the whole sorry tale on a shelf. Read it. Then come back and ask me for the hard part.",
          fx = { learn = { "ladimore" } } },
      },
      choices = {
        { text = "Does it make him easier to kill, knowing?", next = "morladim_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morladim_know = {
      lines = {
        { id = "mk_default", text = "Harder. Always harder. Know it anyway. The ones who don't know end up swinging at shadows, and he isn't one." },
      },
      choices = {
        { text = "I understand.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ello = {
      lines = {
        { id = "el_default", text = "Kin, yes. He talks to Stormwind; I talk to the dead, mostly with a pike. We each think the other is wasting their time. We're both right." },
      },
      choices = {
        { text = "Does he know you think that?", next = "ello_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ello_know = {
      lines = {
        { id = "ek_default", text = "He's a politician. He knows exactly what everyone thinks, and he writes the letters anyway. I respect that more than I'd ever tell him." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } } },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Then welcome. The ones back from Raven Hill don't sleep. Some ask whether the dead up there feel anything. I've no answer for them. You might." },
      },
      choices = {
        { text = "I'll sit with them tonight.", next = "BACK", fx = { affinity = 3, standing = { darkshire = 2 }, align = { light = 1 } },
          journal = { first = "Sat a night with the Night Watch's wounded in Darkshire, at Commander Ebonlocke's welcome.",
                      third = "{name} sat a night with the Night Watch's wounded in Darkshire." } },
        { text = "What do I tell them?", next = "priest_answer" },
      },
    },
    priest_answer = {
      lines = {
        { id = "pa_default", text = "Whatever's true. They'll know if it isn't. Watchers can smell a lie; Stormwind's been feeding them comfortable ones for years." },
      },
      choices = {
        { text = "Then they'll get the truth.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stalvan = {
      lines = {
        { id = "st_default", text = "I've had my eye on that tutor for years. Proof's the trouble. Smitts has pages; Daltry has the town's signatures. Lay them side by side and I'll do the rest." },
      },
      choices = {
        { text = "And if they match?", next = "stalvan_match" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stalvan_match = {
      lines = {
        { id = "sm_default", text = "Then someone walks up to that manor north of town with a sword and my order. I'd go myself. Darkshire won't let me leave the gate." },
      },
      choices = {
        { text = "Send me.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, learn = { "stalvan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stitches = {
      big = true,
      lines = {
        { id = "sc_default", text = "It came down the road from Raven Hill bellowing for Darkshire and went through two of my camps. Don't tell me who made it. I know." },
      },
      choices = {
        { text = "I fetched his supplies. I didn't know.", next = "stitches_guilt" },
        { text = "It's done now.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    stitches_guilt = {
      lines = {
        { id = "sg_default", text = "Nobody did. He was sweet to half this town. Next time a hermit wants thread, ask him what he's sewing." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 }, learn = { "embalmer" } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Commander of the Night Watch. I don't have a story. I have a roster, and every name on it matters more than mine." } },
    advice = { { id = "tp_ad", text = "Roads by day. Lamps by night. Never follow a light into the trees, whoever seems to be holding it." } },
    night_watch = { { id = "tp_watch", text = "Volunteers, mostly. Farmers, bakers, a tanner who swears he's killed forty ghouls. He's killed six." } },
    worgen = { { id = "tp_worgen", text = "Don't ask where they came from. Ask how many. That's the useful question." } },
    stalvan = { { id = "tp_stalvan", text = "A tutor who killed the girl he taught, and the man she was to marry. Maybe more. That's the short version. The long one keeps Smitts up at night." } },
    westfall = { { id = "tp_westfall", text = "Stoutmantle runs a militia too. I'd like to meet him. I'd like to compare notes on being forgotten." } },
    ladimore = {
      { id = "tp_ladimore_next", text = "Mor'Ladim. My watchers' worst night, most weeks. Ask what you want to know.", next = "morladim" },
      { id = "tp_ladimore", text = "He was one of ours once, a knight of this town. Now he's the thing my patrols walk around." },
    },
    morbent_fel = { { id = "tp_morbent", text = "A necromancer up on Forlorn Rowe. The dead he raises are my watchers' business. He's Sven Yorgen's." } },
    embalmer = { { id = "tp_embalmer", text = "A children's story, until it walked down my road. I've doubled the lamps on the Raven Hill side since." } },
    _none = { { id = "tp_none", text = "Not a Watch matter. If it becomes one, it'll find me." } },
  },
}
