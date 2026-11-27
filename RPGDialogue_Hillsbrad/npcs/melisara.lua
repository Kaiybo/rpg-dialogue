-- Melisara: Sharlindra's banshee lieutenant in Tarren Mill, hunting the ogre who stole the Crown of Will.
-- Voice: bibles/melisara.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hb_melisara", id = TODO_NPC("Melisara"), name = "Melisara",
  bible = "bibles/melisara.md", role = "soldier", tier = "quest",
  communities = { "tarren_mill" }, temper = { "sharp", "proud" }, values = { "loyal", "stern", "dutiful" },
  notices = { "class", "kit" },

  impression = {
    first = "Her voice raises the hair on my neck even when she's polite.",
    third = "{name} met Melisara, the banshee lieutenant in Tarren Mill who hunts the Dark Lady's enemies in Alterac.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "You. Good. I've a head or two to collect, and I'd rather collect them with you." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "Speak quickly, and then leave. I've no patience for you." },
    { id = "g_default", text = "Speak, and be quick about it. I have heads to collect." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I hope you bring progress and not excuses." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. Sharlindra asked where you were, and I had no answer to give her." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You are more dangerous than when we met. Good; the ogres are not getting any smaller." },
    { id = "g_maulers", when = { questObjective = { TODO_QUEST("The Crown of Will"), left = { min = 1 } } }, text = "Your task is unfinished. Shall I inform Sharlindra of your ineptitude?" },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", faction = "Horde" },
      text = "A priest. You serve the shadow, I hope, and not that sickly Light the living cling to." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Crushridge have marked you. Mend it, for I'll not send you back half-armoured and lose you to an ogre's club." },
  },

  start = "hello",
  nodes = {
    w3_pikes = {
      lines = {
        { id = "w3_pikes_1", text = "So that the Crushridge see them every morning from their caves and count how many chieftains they have left. An ogre understands very little, {class}, but it understands a head on a stick, and that is a lesson that needs no translating." },
      },
      choices = {
        { text = "Does it work?", next = "w3_work" },
        { text = "A grim message.", next = "BACK", reply = "A clear one. The Dark Lady prefers her messages clear, and so do I." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_work = {
      lines = {
        { id = "w3_work_1", text = "They have stopped raiding the road for nine days, which is eight more than they managed before. When they forget, there will be another head and another pike, and the lesson will be taught again, more slowly." },
      },
      choices = {
        { text = "Then the road is safer. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Melisara, lieutenant to Sharlindra and servant of the Dark Lady. You'll find I don't waste much time with idle chatter, so ask what you came to ask. The Crown of Will and the ogre Mug'thol are my concern today." },
        { id = "h_sent", tags = { "news" }, when = { questActive = TODO_QUEST("The Crown of Will") },
          text = "Sharlindra sent you? Very well. Mug'thol is an irritant, and we will deal with him quickly, thoroughly and without incident." },
        { id = "h_heads", when = { questRecent = { TODO_QUEST("The Crown of Will"), days = 5 } },
          text = "His lieutenants fell first, then Mug'thol himself, crown and all, and their heads now sit on pikes above Alterac. It is a fitting monument to those who defy the Dark Lady." },
        { id = "h_grave", when = { questActive = TODO_QUEST("The Grave Knight") },
          text = "A necromancer hides in the sewers beneath Dalaran, raising an army of undeath under the Kirin Tor's noses. I care nothing for the wizards, but he spits on everything the Forsaken stand for, so end him." },
        { id = "h_grave_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Grave Knight") },
          text = "Atrexis is dead, and Dalaran never knew who did it the favour. That suits me, for the Dark Lady's reach is best felt and not seen." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "One of us. Good; you'll understand what it is to be bound to another's will, and why the Dark Lady will not suffer it again." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are in the wrong town, and I am in no mood. Leave." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly." },
        { id = "h_again2", text = "Ask, and then go. The ogres are waiting." },
      },
      choices = {
        { text = "What is the Crown of Will?", next = "crown" },
        { text = "Who is Mug'thol?", next = "mugthol" },
        { text = "Who is Sharlindra?", next = "sharlindra" },
        { text = "I can't imagine what it's like, being a banshee.", next = "banshee" },
        { text = "I know what it is to be bound.", next = "bound", when = { race = "Scourge" } },
        { text = "Why put the ogres' heads on pikes?", next = "w3_pikes" },
        { text = "I'll take my leave, Melisara.", next = "END" },
      },
    },

    crown = {
      lines = {
        { id = "cr_default", text = "A relic of Alterac, strange in its simplicity. Whoever wears it can shake off the will of another, and so it is something the Dark Lady would rather hold than see on anyone else's head." },
      },
      choices = {
        { text = "Why does Sylvanas want it?", next = "crown_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crown_why = {
      big = true,
      lines = {
        { id = "cw_default", text = "That is her business, and not mine to guess at aloud. I will say only that a thing that breaks one will can break others, and she has every reason to keep such a thing close." },
      },
      choices = {
        { text = "Then destroy it. No one should hold that power.", next = "BACK", reply = "Destroy it? You speak like one of the living, who always think power can be wished away. The Dark Lady does not throw away a blade simply because it is sharp.", fx = { align = { order = -1 } } },
        { text = "Better in her hands than an ogre's.", next = "BACK", reply = "Precisely, and a great deal better than in the hands of whatever buried it. You learn our ways quickly, which I will remember.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mugthol = {
      lines = {
        { id = "mu_default", text = "An ogre, and a Crushridge chief, who was sent with his warband into Alterac to retrieve the crown for the Dark Lady. Instead the fool tried it on, as ogres can't resist anything shiny, and it let him slip the possession that bound him to our service." },
      },
      choices = {
        { text = "So the Forsaken had an ogre under their control.", next = "mugthol_control" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mugthol_control = {
      big = true,
      lines = {
        { id = "mc_default", text = "We had many things under our control, until one of them put on a crown. Now his ogres hold the ruins of Alterac, and the snow there blooms red with their blood, as it will until the Crushridge are ground into the dirt." },
      },
      choices = {
        { text = "He broke his chains. I almost admire him.", next = "BACK", reply = "Admire him at a distance, then, and be glad you will never stand where he stands. Our Lady does not forgive a broken chain, and neither do I.", fx = { align = { light = 1 } } },
        { text = "A servant who slips his leash must be made an example.", next = "BACK", reply = "Yes, and he will be, piece by piece, until the Crushridge remember what obedience felt like. You understand the Dark Lady's mind better than most.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sharlindra = {
      lines = {
        { id = "sh_default", text = "The Dark Lady's own lieutenant in the Undercity, and mine. She sees that what we recover reaches Lady Sylvanas, and she remembers the names of those who serve well, and those who don't." },
      },
      choices = { { text = "Something else, Melisara.", next = "BACK" } },
    },

    banshee = {
      lines = {
        { id = "ba_default", text = "Cold, and quiet, until it isn't. We were elves once, many of us, and the Scourge took our bodies and left us only voices, and we have learned to make our voices cut." },
      },
      choices = {
        { text = "Do you miss having a body?", next = "banshee_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    banshee_miss = {
      lines = {
        { id = "bm_default", text = "That is not a question the living should ask, nor one the dead should answer. I serve, and service needs no body, only will." },
        { id = "bm_warm", when = { disposition = { min = 70 } },
          text = "Some nights I remember a bowstring biting into my fingers, and the remembering is worse than the lack. Tell no one I said so." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    bound = {
      lines = {
        { id = "bo_default", text = "Then you know why the crown matters, and why no ogre will wear it while I exist. We were puppets once, all of us, and the Dark Lady freed us; I will not see that freedom used against her." },
      },
      choices = {
        { text = "Never again. I'll bring you Mug'thol's head.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You're useful, and you're ruthless when it counts. The Dark Lady would approve." },
    },
    grievance = {
      { id = "dp_gv", text = "You've wasted my time, and my time is the Dark Lady's time. Mind that." },
    },
    knows = { { id = "tp_knows", text = "I know Alterac, the ogres in it and the enemies of the Dark Lady. That will have to suffice." } },
    background = { { id = "tp_bg", text = "I serve Sharlindra, who serves the Dark Lady. That is all of me you need." } },
    advice = { { id = "tp_ad", text = "Thin the Crushridge before you strike at their chief. Ogres fight harder with friends around them." } },
    alterac = { { id = "tp_alterac", text = "A dead kingdom full of ogres and traitors. It suits them." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady was the Ranger-General of Quel'Thalas, and she died defending it, and she rose to free us all. Speak her name with care in my hearing, living one." }, { id = "tp_sylvanas2", when = { race = "Scourge" }, text = "You know her worth as well as I do, for she broke the chains on your mind as she broke mine. We owe her everything, and we will pay it." } },
    scourge = { { id = "tp_scourge", text = "The Scourge are slaves who do not know they are slaves, and the Lich King holds every chain. I remember the voice in my head, and I would see it silenced forever." } },
    arthas = { { id = "tp_arthas", text = "The prince of Lordaeron killed me with his own sword, and then he bound me to his will. I do not need to tell you what I would do to him, given the chance." } },
    forsaken = { { id = "tp_forsaken", text = "We are the Forsaken, the dead who chose ourselves, and we serve the Dark Lady and no one else. The living may call us monsters, and some of them are right." } },
    _none = { { id = "tp_none", text = "That is not my concern, and I doubt it is yours." } },
  },
}
