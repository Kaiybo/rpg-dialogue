-- Llane Beshere, warrior trainer, Hall of Arms, Northshire Abbey. Voice: bibles/llane.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "llane", id = TODO_NPC("Llane Beshere"), name = "Llane Beshere",
  bible = "bibles/llane.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "fitness", "stance" },
  impression = {
    first = "Llane Beshere corrected my stance before he asked what I wanted, which says everything about him. He believes warriors are made by being knocked down and getting back up.",
    third = "{name} met Llane Beshere, Northshire's warrior trainer, who teaches a proper stance as if it were scripture.",
  },

  greetings = {
    { id = "g_feet", text = "Feet apart, recruit. Now, what do you need?" },
    { id = "g_drills", when = { class = "WARRIOR" }, text = "Back for more drills?" },
  },

  notice = {
    { id = "n_ressick", cat = "fitness", place = "before", when = { resSick = true },
      text = "You died recently; I can see it in how you stand. Sit down before you fall down." },
    { id = "n_naked", cat = "fitness", when = { nearlyNaked = true, class = "WARRIOR" },
      text = "A warrior without armor is a target with opinions." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Warriors are made, not born. Mostly by getting knocked down and standing back up." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Simple Letter"), days = 1 } },
          text = "So you can read. Good, now let's see if you can stand." },
        { id = "h_warrior_blooded", when = { class = "WARRIOR", band = "Blooded" },
          text = "You've put on some muscle. Still dropping your guard on the left, though." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "Hunters. Always trying to win a fight from across the field." },
        { id = "h_other", when = { ["not"] = { class = { "WARRIOR", "HUNTER" } } },
          text = "Not my student. The drills wouldn't kill you, though. Probably." },
        { id = "h_bruise", when = { metBefore = true, class = "WARRIOR" }, text = "You're standing straighter, and the bruises are in better places. That's progress, recruit." },
        { id = "h_dawn", when = { metBefore = true }, text = "The recruits ran the yard twice this morning. One cried and one laughed, and the one who laughed is the one I'm worried about." },
        { id = "h_veteran", when = { class = "WARRIOR", minLevel = 20 },
          text = "Look at the scars on you. Somebody's been earning them properly. Stand there. Let me see if the left guard ever got fixed." },
      },
      again = {
        { id = "h_again", text = "Anything else, recruit? Ask while you stretch; you'll want the breath later." },
        { id = "h_again2", text = "Go on, and quickly; the yard doesn't run itself." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Any advice?", next = "advice" },
        { text = "How do I stop getting knocked down?", next = "stance", when = { class = "WARRIOR", maxLevel = 12 } },
        { text = "I've fought a long way from this hall since.", next = "veteran", when = { class = "WARRIOR", minLevel = 20 } },
        { text = "Anything for a priest to learn in here?", next = "priest", when = { class = "PRIEST" } },
        { text = "Later.", next = "END" },
      },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Hit first and hit hard, and don't stop until it stops moving." },
        { id = "a_green", when = { class = "WARRIOR", band = "Greenhorn" },
          text = "Charge in, then keep them close. A warrior at range is a corpse with good intentions." },
      },
      choices = {
        { text = "And if it doesn't stop moving?", next = "advice_more" },
        { text = "Understood.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Sounds simple enough.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    advice_more = {
      lines = {
        { id = "am_default", text = "Then you were fighting the wrong thing, or fighting it wrong. Walk away, find out which, and come back, because pride makes a poor shield." },
      },
      choices = { { text = "Walk away. Noted.", next = "BACK", fx = { trait = { cautious = 1 }, affinity = 1 } } },
    },
    stance = {
      lines = {
        { id = "s_default", text = "Keep your weight low and your feet wider than you like, and your shield arm doesn't drop just because you're tired. Everyone's tired, kobolds especially." },
      },
      choices = {
        { text = "Show me.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "That's it? Stand wider?", next = "stance_more" },
      },
    },
    stance_more = {
      lines = {
        { id = "sm_default", text = "That's it, a thousand times, until you do it asleep. Then I'll show you the second thing. Most never get to the second thing." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    veteran = {
      lines = {
        { id = "v_default", text = "I can tell. You walked in here like the door owed you something. Tell me one thing the road taught you that I didn't." },
      },
      choices = {
        { text = "That nobody fights fair.", next = "veteran_fair", fx = { affinity = 1 } },
        { text = "When to run.", next = "veteran_run", fx = { trait = { cautious = 1 }, affinity = 2 } },
      },
    },
    veteran_fair = {
      lines = { { id = "vf_default", text = "I told you that, and you didn't believe me. Nobody does until it costs them a tooth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    veteran_run = {
      lines = { { id = "vr_default", text = "Good answer, better than mine. I'll be telling the new ones that, and taking the credit." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "p_default", text = "One thing: stand behind me, not beside me and not in front of me. If you're ever in front, I've failed, and so have you." },
      },
      choices = {
        { text = "Behind you. And I keep you standing.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll stand where I'm needed, not where I'm told.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "And if I'd rather fight?", next = "priest_fight" },
      },
    },
    priest_fight = {
      lines = { { id = "pf_default", text = "Then you'll fight and heal yourself, and nobody will heal me. Pick a job and do it well." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I train recruits in the Hall of Arms. Before that I was one. That's all the story you need." } },
    advice = { { id = "tp_ad", text = "Your shield arm will want to drop, and you mustn't let it. That's the whole lesson, and nobody learns it the first time." } },
    northshire_abbey = { { id = "tp_abbey", text = "The brothers have the halls with books. I have the one with the dents in the floor." } },
    kobolds = { { id = "t_kobolds", text = "Small, fast and cowardly, which makes them perfect practice." } },
    _none = { { id = "t_none", text = "Do I look like a librarian?" } },
  },
}
