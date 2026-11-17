-- Sha'ni Proudtusk: the ghost of a Kargath scout, chained and killed on the altar atop Dreadmaul Rock by the ogre Krom'Grul. Voice: bibles/shani.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "shani", id = TODO_NPC("Sha'ni Proudtusk"), name = "Sha'ni Proudtusk",
  bible = "bibles/shani.md", role = "questgiver", tier = "quest",
  communities = { "dreadmaul_rock" }, temper = { "fierce", "sorrowful" }, values = { "loyal", "brave" },
  notices = { "race", "soldier" },

  impression = {
    first = "Sha'ni Proudtusk is a ghost on the altar where Krom'Grul killed her, and she was angrier at losing her ring than at losing her life. Her last thoughts were all for Thal'trak.",
    third = "{name} found the ghost of Sha'ni Proudtusk, a Kargath scout, on the altar atop Dreadmaul Rock in the Burning Steppes.",
  },

  greetings = {
    { id = "g_default", text = "You can see me? Then you were sent, and I know by who, so sit down and listen before the fire takes my voice." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to this cursed rock. Did you find him, the ogre with my ring?" },
    { id = "g_done", when = { questDone = TODO_QUEST("Krom'Grul") }, text = "He has it now, my ring, or he threw it away, I know. I can feel the rock letting go of me a little more every day." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, climbing this rock for a dead troll. You make my spirit proud, cousin." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "You carry yourself like one of the platoon, and you'd have stood with us when the ogres came. I'm sorry you weren't here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Sha'ni Proudtusk, scout of the Kargath Expeditionary Force, or I was, before this rock. My whole platoon was captured and slain, all except me, because their leader wanted me for some kind of ritual." },
        { id = "h_rock", tags = { "news" }, when = { questActive = TODO_QUEST("Dreadmaul Rock") },
          text = "Thal'trak sent you, didn't he? My poor Thal'trak, standing at his post and staring at the road, I know he is." },
        { id = "h_krom", tags = { "news" }, when = { questActive = TODO_QUEST("Krom'Grul") },
          text = "Krom'Grul is somewhere in the caves and mines of this rock, and he wears my wedding nose-ring on his finger like a prize. Kill him and take it back to Thal'trak." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance, on this rock? The dead don't keep sides, I find, so if you came to see the ogres die, you are welcome to my grave." },
      },
      again = {
        { id = "h_again", text = "What else? I have time now, more than I want." },
        { id = "h_again2", text = "Ask. The fire doesn't hurt anymore, so I can talk." },
      },
      choices = {
        { text = "What happened to your platoon?", next = "platoon" },
        { text = "Who is Krom'Grul?", next = "krom" },
        { text = "What should I tell Thal'trak?", next = "thaltrak" },
        { text = "What were the ogres doing up here?", next = "ritual" },
        { text = "I can feel the spirits restless here.", next = "xspirit", when = { class = { "SHAMAN", "PRIEST" } } },
        { text = "Rest easy, Sha'ni.", next = "END" },
      },
    },

    platoon = {
      lines = {
        { id = "pl_default", text = "We came to see what the Firegut were chanting about, and we came too close. They took us at night, all of us, and the others died fighting, which is the good death, and I didn't get one." },
      },
      choices = {
        { text = "How did you die?", next = "platoon_death" },
        { text = "Something else.", next = "BACK" },
      },
    },
    platoon_death = {
      lines = {
        { id = "pd_default", text = "Chained to this altar, and the beast brutalized me for an hour until my body stopped. Then he ripped my wedding nose-ring off my face and stuck it on his finger, and I never saw such savagery, not even from the Blackrock." },
      },
      choices = {
        { text = "He'll pay for every minute of it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    krom = {
      lines = {
        { id = "kr_default", text = "The leader of these Firegut, huge and cruel, and smarter than an ogre has any right to be. He hides in the caves of this rock, and he'll have guards, so don't go in alone." },
      },
      choices = {
        { text = "What do you want done with him?", next = "krom_fate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    krom_fate = {
      lines = {
        { id = "kf_default", text = "Find Krom'Grul and kill him, and take my ring back to Thal'trak. That's all the vengeance I want, because I'm dead and I've no use for more." },
      },
      choices = {
        { text = "Then he dies, and slowly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "He'll die quick and clean, like a warrior should.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thaltrak = {
      lines = {
        { id = "th_default", text = "Tell him we'll meet again, in another life. Tell him it was my last mission, and we were going to the Hinterlands to live with my mother and father, and that I'm sorry I made him wait." },
      },
      choices = {
        { text = "He'll want to know if you suffered.", next = "thaltrak_lie" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thaltrak_lie = {
      lines = {
        { id = "tl_default", text = "Then you decide what to tell him, because I can't. If he asks, and you think the truth will break him, I won't haunt you for a kind lie." },
      },
      choices = {
        { text = "He deserves the truth, all of it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll spare him the worst of it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ritual = {
      lines = {
        { id = "ri_default", text = "Something old and ugly, with fire and chanting and blood on the altar, and they wanted a living sacrifice for the end of it. I never learned who taught them, because they killed me before the chanting was done." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xspirit = {
      big = true,
      lines = {
        { id = "xs_default", text = "There are many of us here, my platoon and others before us, and none of us can leave while the Firegut chant over the stones. Maybe when Krom'Grul is dead they'll stop, and we can go." },
      },
      choices = {
        { text = "I'll see you all freed. Vengeance can come after.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Vengeance first. The dead can wait a little longer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A scout of the Horde, a wife, and now a ghost on a rock in the Burning Steppes." } },
    advice = { { id = "tp_ad", text = "Never get close enough to hear the chanting. By then they've already seen you." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin be our chief, mon, and he be wise. Tell him a Darkspear scout died well, if you ever see him." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear be my husband's people, mon, and mine be in the Hinterlands. We was going to live there together, after." } },
    firegut = { { id = "tp_firegut", text = "The Firegut chained me to this altar for their ritual. Krom'Grul be the one who did it, mon, and I hope you make him pay." } },
    thrall = { { id = "tp_thrall", text = "The Warchief give the Darkspear a home, and my husband fight for him. I fight for him too, in my way." } },
    _none = { { id = "tp_none", text = "I don't know. The dead know less than you'd think." } },
  },
}
