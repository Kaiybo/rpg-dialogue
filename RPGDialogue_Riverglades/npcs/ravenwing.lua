-- Interrogator Ravenwing, Farholde Keep. Voice: bibles/ravenwing.md
-- Questions what the scouts bring back from the Twilight's camps, and has learned to distrust easy answers.
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ravenwing", id = TODO_NPC("Interrogator Ravenwing"), name = "Interrogator Ravenwing",
  bible = "bibles/ravenwing.md", role = "soldier", tier = "service",
  communities = { "farholde", "brotherhood_horse" }, temper = { "cold", "sharp" }, values = { "dutiful", "cautious" },
  notices = { "class", "fel" },
  impression = {
    first = "He asks more questions than I do, and I notice only afterward.",
    third = "{name} met Interrogator Ravenwing, who questions the Brotherhood's Twilight captives at Farholde Keep.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, and your story still holds. That's rarer than you'd think, so sit, and we'll speak plainly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Back again. I've added a few more questions about you to my list, and I'll ask them all eventually." },
    { id = "g_cold", text = "You're new. Where have you come from, and who sent you?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your story hasn't changed since last time, which is either a good sign or a well-practised one." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. I'll want to know where, eventually, but it can wait until you've had something to eat." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've made yourself useful since we last spoke, by the reports. I read all the reports." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear someone in the keep caught you in a lie. I'll be listening more carefully from now on, and so will they." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", when = { class = "WARLOCK" },
      text = "You traffic with things from outside this world. So do the cultists up at the Shroud, and I've watched where it led them, so I'll sit with my back to a wall while we talk." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You watch the doors when you come into a room. So do I, and so does every cultist I've ever questioned, and that's how I learned to notice." },
  },

  start = "hello",
  nodes = {

    rv_ashe = {
      lines = { { id = "rva_1", text = "Bone charms, mostly, and twists of copper wire, and little discs carved with a hammer over a broken circle. Ashe says the carving means nothing in itself, but the cultists won't give them up without a fight, and that interests me more than what they are." } },
      choices = {
        { text = "Why would they fight for a worthless charm?", next = "rv_ashe2" },
        { text = "I'm a mage. I could look at those trinkets.", next = "BACK", when = { class = "MAGE" }, reply = "Then take it up with Ashe; she guards them more jealously than I guard the prisoners. Tell her I sent you, and watch her face when you do." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rv_ashe2 = {
      lines = { { id = "rva2_1", text = "Because they believe the voice can find them through it, and a man who loses his charm thinks he's been abandoned. Take one away and the prisoner either weeps or talks, and I've learned to wait and see which." } },
      choices = {
        { text = "So the charm is your best tool.", next = "BACK", reply = "One of them. Silence is still the best, but the charm helps it along." },
        { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } },
      },
    },
    rv_you = {
      lines = { { id = "rvy_1", text = "I question everyone as if they were one of my prisoners, because one day one of them will be. It's nothing personal, and you'd be surprised how many people are relieved to be asked properly." } },
      choices = {
        { text = "Then ask me something properly.", next = "rv_you2" },
        { text = "Does anyone at Farholde escape your questions?", next = "rv_you2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rv_you2 = {
      lines = { { id = "rvy2_1", text = "Very well. Where did you sleep last night, and who saw you there? The Knight Commander answers that question for me every week, and so does Sergeant Riftan, though he complains about it." } },
      choices = {
        { text = "In Farholde's barracks. Ask Riftan, he snores.", next = "BACK", reply = "He does, and you're the third person to tell me so. I'll put that down in your favour.", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "That's my own business, Interrogator.", next = "BACK", reply = "Of course it is. Everything is someone's business, and in time most of it becomes mine." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Interrogator Ravenwing. When the scouts bring back a cultist alive, or a satchel of their papers, it comes to me, and I find out what it knows." },
        { id = "h_mugg", tags = { "news" }, when = { questDone = TODO_QUEST("Eye of Mugg") },
          text = "The Hammer's leader in the northern caves is dead, and I'm told you were there. If anyone carried papers out of those caves, I want them on my desk before they're used to light a fire." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest. The prisoners talk about a voice in the dark, and they talk about it the way you'd talk about the Light, and I'd value your opinion on what that means." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage. Ashe Amberhall, our own mage, studies the trinkets we take off the cultists while I study their faces, and between us we nearly understand them." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask carefully; I'll remember how you asked." },
        { id = "h_again2", text = "Go on. I've time, if you have answers." },
      },
      choices = {
        { text = "Even a cultist deserves fair treatment once he's captured.", next = "BACK", reply = "Fair, yes, and patient. Frightened men lie, and a man who's been treated fairly tells me more.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Hurt them until they talk. They'd do worse to us.", next = "BACK", reply = "They would, and they'd learn nothing, which is why I don't take my lessons from cultists.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What do the cultists tell you?", next = "cultists" },
        { text = "How do you make them talk?", next = "methods" },
        { text = "Why the questions? I'm on your side.", next = "trust" },
        { text = "These whispers. I've heard the like before.", next = "whisper", when = { class = { "PRIEST", "WARLOCK" } } },
        { text = "What does Ashe Amberhall make of the cultists' trinkets?", next = "rv_ashe" },
        { text = "You question me as if I were one of your prisoners.", next = "rv_you" },
        { text = "I'll leave you to your work.", next = "END" },
      },
    },

    cultists = {
      lines = { { id = "cu_default", text = "Very little that's useful and plenty that's frightening. They talk about the end of the world as if it were a harvest festival, and they look forward to it." } },
      choices = {
        { text = "You don't seem to believe any of it.", next = "cultists_believe" },
        { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } },
      },
    },
    cultists_believe = {
      lines = { { id = "cb_default", text = "I believe they believe it, which is dangerous enough. Some of them were farmers from Sunnyglade's country once, and something turned them, and I mean to find out what." } },
      choices = {
        { text = "Can they be turned back?", next = "cultists_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cultists_back = {
      big = true,
      lines = { { id = "ck_default", text = "I turned one, once, for a week or so, until the voice he'd been hearing came back and he stopped speaking to me at all. I don't try as hard now, and I'm not proud of that." } },
      choices = {
        { text = "Keep trying. Every one saved matters.", next = "BACK", reply = "I will, though it costs me more each time one slips back to the voice. You're kinder than most who stand in this room.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Don't. Get what you need and be done with them.", next = "BACK", reply = "That's what my superiors say, and some nights I'm tempted. But a confession is worth less than a man who stops listening to that voice.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    methods = {
      lines = { { id = "me_default", text = "Patience, mostly, and questions they don't expect, and a long silence after each answer. Most men will fill a silence with the truth if you leave it long enough." } },
      choices = {
        { text = "And when that doesn't work?", next = "methods_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    methods_hard = {
      lines = { { id = "mh_default", text = "Then I wait longer. The Commander doesn't hold with anything worse, and he's right, because a man in pain tells you what you want to hear, not what's true." } },
      choices = {
        { text = "Good. The Brotherhood's better than that.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    trust = {
      lines = { { id = "tr_default", text = "Everyone's on my side until the day they aren't. A friendly face is the cheapest disguise there is, and the Hammer can certainly afford one." } },
      choices = {
        { text = "Fair. Ask what you like.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    whisper = {
      lines = { { id = "wh_default", text = "Then you'll understand why I don't like the sound of it. The prisoners won't name what speaks to them, and when I press them, they laugh, and that's the only time any of them laugh." } },
      choices = {
        { text = "Whatever it is, it isn't the Light.", next = "BACK", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I ask the questions, friend. That's rather the point of me." } },
    advice = { { id = "tp_ad", text = "Listen to what a man doesn't say. It's usually louder." } },
    twilights_hammer = { { id = "tp_hammer", text = "Cultists who look forward to the end of the world, and who'd like to hurry it along. I've questioned enough of them to know they mean it." } },
    holy_light = { { id = "tp_holy_light", text = "The Light doesn't help me get answers from cultists, but it helps me sleep afterward, a little. I won't say more than that." } },
    bolvar = { { id = "tp_bolvar", text = "Stormwind's Regent wants reports, and I give him reports. What he does with them is his business, and what I do to get them is mine." } },
    si7 = { { id = "tp_si7", text = "I'm not SI:7, though I've worked with them, and they've borrowed my methods more than once. They're welcome to them." } },
    blackrock = { { id = "tp_blackrock", text = "The cultists I question sometimes speak of orcs in the mountains, Blackrock by their colors. I've written it down, and nobody's asked me about it yet." } },
    _none = { { id = "tp_none", text = "Not something the prisoners have mentioned. If they do, I'll let you know, perhaps." } },
  },
}
