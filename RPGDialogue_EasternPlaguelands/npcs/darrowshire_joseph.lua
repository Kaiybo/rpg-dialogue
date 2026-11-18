-- Captain Joseph Redpath's spirit in Darrowshire, freed after the battle is fought again. Voice: bibles/joseph_redpath.md
-- A farmer who became a captain for one terrible day; plain, steady, and thinking only of his daughter.
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "joseph_redpath", id = TODO_NPC("Joseph Redpath"), name = "Joseph Redpath",
  bible = "bibles/joseph_redpath.md", role = "questgiver", tier = "quest",
  communities = { "darrowshire" }, temper = { "warm", "weary" }, values = { "loyal", "brave", "kind" },
  notices = { "class", "race" },
  impression = {
    first = "Joseph Redpath held Darrowshire's square until he fell, and something cruel wore him for years afterward. Freed at last, he asked about his daughter before he asked about anything else.",
    third = "{name} spoke with the freed spirit of Joseph Redpath, the captain who died defending Darrowshire.",
  },

  greetings = {
    { id = "g_free", text = "You're standing in my town square, friend, and you're the first living soul I've seen clearly in a long while. Forgive me if I stare." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to Darrowshire. Not many do, and fewer come twice, so you're welcome here as long as I've any say in it." },
    { id = "g_battle", when = { questActive = TODO_QUEST("The Battle of Darrowshire") }, text = "You fought that day as if you'd been here the first time. I don't know how you did it, but the chain's broken, and I can feel it." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, were you? Time's a strange thing for me now, but I noticed you were gone, which is more than I noticed for years." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin of the Silver Hand, or near enough. I asked for help from your order when the Scourge came down the road, and none came in time, though I never blamed the men who couldn't reach us." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You've risen too, but you walk with your own mind behind your eyes. I know what it costs to lose that, and I'm glad someone got theirs back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Joseph Redpath, and I was captain of Darrowshire's defense for the one day it needed one. I was a farmer before that, and I'd have liked to stay one." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("The Battle of Darrowshire") },
          text = "The thing they called Redpath the Corrupted is gone, and I'm only Joseph again. I can't tell you what that's worth, so I'll just say thank you and hope it's enough." },
        { id = "h_doll", when = { questDone = TODO_QUEST("Pamela's Doll") },
          text = "Pamela showed me her doll, all stitched back together, and she says a stranger did it. That was you, I think, and I'll not forget it." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "You carry yourself like a soldier, {class}. I had farmers with pitchforks that day, and they stood like soldiers too, every one of them, right up until the end." },
        { id = "h_horde", when = { faction = "Horde", race = { "Orc", "Tauren", "Troll" } },
          text = "I fought orcs once, in the Second War, and I thought I'd never want one standing in my town. Yet here you are, and the Scourge is the enemy we share, so I've no quarrel left in me." },
      },
      again = {
        { id = "h_again", text = "Ask what you like. I've had nobody to talk to for years but the dead, and they're poor company." },
        { id = "h_again2", text = "Go on, friend. Pamela's busy with her doll, so I've a little time." },
      },
      choices = {
        { text = "Pamela's been waiting for you.", next = "pamela" },
        { text = "Tell me about the battle.", next = "battle" },
        { text = "Carlin made it out. He's at Light's Hope.", next = "carlin" },
        { text = "Who else stood with you that day?", next = "heroes" },
        { text = "What became of the town afterward?", next = "town" },
        { text = "Did you ever wish you'd been a paladin?", next = "paladin", when = { class = "PALADIN" } },
        { text = "I know what it is to come back wrong.", next = "risen", when = { race = "Scourge" } },
        { text = "Rest easy, Captain.", next = "END" },
      },
    },

    pamela = {
      lines = { { id = "pa_default", text = "I know, and it breaks what's left of my heart. I told her to hide in the house and not to come out for anything, and she did as she was told, which she never did before in her life." } },
      choices = {
        { text = "What happened to her?", next = "pamela_hid" },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    pamela_hid = {
      lines = { { id = "ph_default", text = "The house didn't keep the Scourge out, and that's all I'll say of it. She's been waiting by the door ever since, waiting for her papa to come home, and I couldn't come, because I wasn't myself." } },
      choices = {
        { text = "Will you stay with her now?", next = "pamela_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pamela_stay = {
      big = true,
      lines = { { id = "ps_default", text = "For as long as the Light lets me, and then I'll take her wherever we go next, by the hand, so she's not frightened. Do you think that's selfish, keeping her here a little longer when she ought to be at rest?" } },
      choices = {
        { text = "Stay with her. She's waited long enough for her father.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Let her go on. Holding her here is for your sake, not hers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "That's not for me to say, Joseph.", next = "BACK" },
      },
    },

    battle = {
      lines = {
        { id = "ba_default", text = "They came from the north, out of Stratholme's way, more of them than a man could count. I put the women and children in the houses and the men in the square, and we held as long as flesh can hold." },
        { id = "ba_warrior", when = { class = "WARRIOR" }, text = "They came from the north in a tide, {class}, and I set my farmers in a line across the square because I'd seen it done in the war. It held longer than it had any right to." },
      },
      choices = {
        { text = "And then you fell.", next = "battle_fell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    battle_fell = {
      lines = { { id = "bf_default", text = "Something came that was worse than the rest, and I went down under it. When I opened my eyes again they weren't mine, and the hands I saw were cutting down my own neighbors." } },
      choices = {
        { text = "Do you remember what you did?", next = "battle_remember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    battle_remember = {
      big = true,
      lines = { { id = "br_default", text = "Pieces, like a fever dream, and I'd rather not have any of them. The Scourge didn't care who I'd been, only what I could do for it, and it used me hard. Tell me true, friend: is a man to blame for what his body does when he's gone?" } },
      choices = {
        { text = "No. The Scourge did those things, not you.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Blame or not, you carry it. That's what honor asks.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "It's done, Joseph. Weighing it changes nothing now.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },

    carlin = {
      lines = {
        { id = "ca_default", text = "Carlin lived? Oh, thank the Light. He always was the clever one, and I was the stubborn one, and I'd hoped one of us would have the sense to run." },
        { id = "ca_known", when = { questDone = TODO_QUEST("Heroes of Darrowshire") }, text = "Carlin sent you, didn't he, to gather up our things so we'd be remembered? That's just like him, and I'd wager he blames himself for living, which is just like him too." },
      },
      choices = {
        { text = "He blames himself for surviving.", next = "carlin_guilt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carlin_guilt = {
      lines = { { id = "cg_default", text = "Then he's a fool, and I love him for it. Somebody had to live to tell it, and better him than me, because I was never any good with words." } },
      choices = {
        { text = "Is there something you'd want me to tell him?", next = "carlin_message" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carlin_message = {
      lines = { { id = "cm_default", text = "Tell him I'm with Pamela, and that she's not afraid anymore, and that he's to stop sitting in a chapel feeling sorry and go and see our sister Marlene on Sorrow Hill. He'll know it's me, because I always did tell him what to do." } },
      choices = {
        { text = "I'll tell him, word for word.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    heroes = {
      lines = { { id = "he_default", text = "Davil Lightfire came to us when he heard we were in trouble, and he didn't have to, because it wasn't his town. He fought like ten men and fell like one, and I never got to thank him." } },
      choices = {
        { text = "Who were the ones leading the Scourge?", next = "villains" },
        { text = "Something else.", next = "BACK" },
      },
    },
    villains = {
      lines = { { id = "vi_default", text = "Horgus the Ravager and Marduke the Black, and worse behind them that I never saw clearly. Carlin's had folk hunting their bones for years, and if you were one of them, I hope you didn't leave much." } },
      choices = {
        { text = "They got what they deserved.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    town = {
      lines = { { id = "to_default", text = "It's ghosts and ghouls now, and the barley's gone to weeds. We had the best soil in the east, and the finest apple trees, and a harvest fair every autumn that half the Eastweald came to." } },
      choices = {
        { text = "Could Darrowshire ever be rebuilt?", next = "town_rebuild" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town_rebuild = {
      big = true,
      lines = { { id = "tr_default", text = "Not by me, and not soon, but I'd like to think the land remembers how to grow. What do you think, friend? Should someone come back here one day and plant, or should it be left to the dead?" } },
      choices = {
        { text = "Someone should plant here again. The living reclaim what was theirs.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leave it be. Some places should stay as they fell.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    paladin = {
      lines = { { id = "pl_default", text = "Once, when I was young and thought the Light would choose me if I only stood still enough. Father needed me on the farm, and I never regretted it until the day the Scourge came, and then I regretted it all at once." } },
      choices = {
        { text = "You held the line without the Light's training.", next = "paladin_line" },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_line = {
      lines = { { id = "pli_default", text = "We held it with pitchforks and stubbornness, and the Light was there anyway, I'm sure of it. Maybe it doesn't need you trained, only standing where it's needed." } },
      choices = {
        { text = "That's a truer creed than some I was taught.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    risen = {
      lines = { { id = "ri_default", text = "Then you know there's no word for it, being a passenger in your own bones. How did you get yourself back, if you don't mind my asking?" } },
      choices = {
        { text = "The Banshee Queen broke the Lich King's hold.", next = "risen_queen" },
        { text = "I clawed my way back. Nobody gave it to me.", next = "risen_queen", fx = { trait = { proud = 1 } } },
      },
    },
    risen_queen = {
      lines = { { id = "rq_default", text = "Then you were luckier than me, though I suppose I'm lucky now too, in my way. Be gentle with yourself, friend, because nobody else out here will be." } },
      choices = {
        { text = "And you, Joseph.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A farmer's son who became a farmer, and a captain for a day. That's the whole of it, and I'd not trade the farming years for anything." } },
    advice = { { id = "tp_ad", text = "Put the little ones somewhere safe before you do anything brave. I did that much right, and it's the only part I'd do the same." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "I don't know them; they came after my time. If they'd burn Pamela for being a ghost, I don't care to know them." } },
    _none = { { id = "tp_none", text = "I've been gone a long while, friend, and I'm the last to ask about anything past Darrowshire's fences. Carlin would know, I expect." } },
  },
}
