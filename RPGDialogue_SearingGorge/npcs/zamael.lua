-- Zamael Lunthistle: the ghost of a night elf who served the Twilight's Hammer, found Elune again, and was executed for it; caged on Firewatch Ridge. Voice: bibles/zamael.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zamael", id = TODO_NPC("Zamael Lunthistle"), name = "Zamael Lunthistle",
  bible = "bibles/zamael.md", role = "questgiver", tier = "quest",
  communities = { "searing_gorge_wilds" }, temper = { "grave", "gentle" }, values = { "devout", "penitent" },
  notices = { "race", "priest" },

  impression = {
    first = "Zamael Lunthistle is a night elf ghost in a cultist's cage on Firewatch Ridge, and he asked for nothing for himself. He wants his prayer heard, and he says absolution is the last thing he expects.",
    third = "{name} met the ghost of Zamael Lunthistle, a night elf once of the Twilight's Hammer, caged on Firewatch Ridge in the Searing Gorge.",
  },

  greetings = {
    { id = "g_default", text = "Praise Elune, a visitor, and it has been many years since anyone stood at these bars without a whip in hand." },
    { id = "g_back", when = { metBefore = true }, text = "You return to an old ghost. The cage is the same, but your company makes it lighter." },
    { id = "g_away", when = { away = 21 }, text = "Three weeks or three years, {away} means little to the dead, but I noticed you were gone, and I am glad you came back." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The moon is up, though the smoke hides her, and I feel her nearer on nights like this." },
  },

  notice = {
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "One of my own people, and you look at me as Darnassus would, with pity and a little disgust. Both are deserved, so do not trouble to hide them." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST", race = "NightElf" },
      text = "A priestess of the Moon, or near enough. I once thought I would never stand before one again without shame, and I was right." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Zamael Lunthistle, or what remains of him, and these idol-worshippers keep my spirit caged as they kept my body before they killed it. Will you hear my tale, mortal?" },
        { id = "h_prayer_active", tags = { "news" }, when = { questActive = TODO_QUEST("Prayer to Elune") },
          text = "The prayer was etched on a golden tablet, and one of the cultists below must carry it still. If you find it, take it to Astarii Starseeker in Darnassus, for it matters more that it is heard than that I am forgiven." },
        { id = "h_prayer_done", tags = { "news" }, when = { questDone = TODO_QUEST("Prayer to Elune") },
          text = "I felt it, the moment the prayer reached the temple, like cool water poured over a burn. I am still here, and still caged, but something in me has begun to rest." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You wear the Horde's colours, and once that would have been reason enough for me to hate you. Now I am a ghost in a cage, and I will take any listener Elune sends." },
      },
      again = {
        { id = "h_again", text = "What else would you hear? I have little but time and memory." },
        { id = "h_again2", text = "Ask, mortal. The cage keeps me, but not my tongue." },
      },
      choices = {
        { text = "I wish to hear your tale.", next = "tale" },
        { text = "What is the Prayer to Elune?", next = "prayer" },
        { text = "Who keeps you here?", next = "hammer" },
        { text = "Can I free your spirit from this cage?", next = "free" },
        { text = "Elune forgives those who come back to her with clean hands.", next = "xelf", when = { race = "NightElf" } },
        { text = "Your faith came late. Does it still count?", next = "xfaith", when = { class = { "PRIEST", "PALADIN", "DRUID" } } },
        { text = "Rest as you can, Zamael.", next = "END" },
      },
    },

    tale = {
      lines = {
        { id = "ta_default", text = "As a young elf in Darkshore I fell in with some unsavory people, and they befriended me, and I let them lead me away from the Moon a little at a time. By the time I knew they were the Twilight's Hammer, I was one of them." },
      },
      choices = {
        { text = "What did you do while you served them?", next = "tale_deeds" },
        { text = "What made you turn back?", next = "tale_vision" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tale_deeds = {
      lines = {
        { id = "td_default", text = "Things I will not name to a living soul, for naming them would make them yours as well. Countless malevolent acts against this world and its people, mortal, and I did them gladly for many years." },
      },
      choices = {
        { text = "Then you deserved the cage.", next = "tale_judge", fx = { align = { light = -1 } } },
        { text = "What you did then isn't all you are.", next = "tale_judge", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "And then?", next = "tale_vision" },
      },
    },
    tale_judge = {
      lines = {
        { id = "tj_default", text = "You may be right, and I have had years to argue it with myself. The cage is just, I think, but the prayer is not mine to keep, and that is why I still ask for help." },
      },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    tale_vision = {
      lines = {
        { id = "tv_default", text = "After many years, Elune came to me in a vision, and I saw what I had done the way she must have seen it. I wept for a night and a day, and then I began to carve my shame into gold, so it would last longer than I would." },
      },
      choices = {
        { text = "The cult found out.", next = "tale_death" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tale_death = {
      lines = {
        { id = "tde_default", text = "They found the tablet and called it blasphemy, and they killed me for it on this ridge. My spirit would not fade, and they keep it here to mock the goddess, or perhaps only to mock me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    prayer = {
      lines = {
        { id = "pr_default", text = "A prayer to the Moon, etched on a golden tablet with my own hands, and in it every wrong I could remember. It is not a plea for mercy, mortal, only a true account, and Elune deserves at least that from me." },
      },
      choices = {
        { text = "Why send it to Astarii Starseeker?", next = "prayer_astarii" },
        { text = "Why not ask for forgiveness?", next = "prayer_forgive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prayer_astarii = {
      lines = {
        { id = "pa_default", text = "Because she keeps the Temple of the Moon in Darnassus, and she will read it aloud where the goddess listens. I could not walk there in life, and I cannot walk there now, so it must go in your hands." },
      },
      choices = {
        { text = "I'll carry it to Darnassus for you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    prayer_forgive = {
      lines = {
        { id = "pf_default", text = "Because I have not earned it, and asking would be one more lie in a life with too many. It matters little that my faith was rekindled after all I did, but the prayer must be heard, and absolution is the last thing I expect." },
      },
      choices = {
        { text = "That honesty is worth something.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Pride, even in penance. You'd rather suffer.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hammer = {
      lines = {
        { id = "ha_default", text = "The Twilight's Hammer, whose idolaters hold this ridge and worship things that ought never to be worshipped. They speak of an end to the world as though it were a gift they could hand to everyone." },
      },
      choices = {
        { text = "What do they want in the Gorge?", next = "hammer_gorge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammer_gorge = {
      lines = {
        { id = "hg_default", text = "The fire under the mountain, and anything older that sleeps beneath it, for they go wherever the world is wounded. Be careful of their relics, mortal, because I helped make some of them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    free = {
      lines = {
        { id = "fr_default", text = "Not with a key, I think, for the bars hold my body's memory more than my spirit. If anything frees me, it will be the prayer reaching the goddess, and if it does not, I have accepted my fate here." },
      },
      choices = {
        { text = "I'm sorry, Zamael.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xelf = {
      big = true,
      lines = {
        { id = "xe_default", text = "You say it kindly, {g:brother|sister}, and I hope you are right, though I have no claim on hoping. If Darnassus speaks my name after the prayer is read, I ask only that they speak it as a warning to the young." },
      },
      choices = {
        { text = "They'll hear your story as a warning. I'll see to it.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Your name should be forgotten. Let the prayer stand alone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfaith = {
      big = true,
      lines = {
        { id = "xf_default", text = "I have asked myself that every night in this cage, and I have no answer that satisfies me. Perhaps faith is not measured by when it arrives, but only by whether it stays." },
      },
      choices = {
        { text = "Late faith is still faith. The Light turns no one away.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Faith that comes only after the vision is just fear.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A night elf of Darkshore, a servant of the Hammer, a penitent, and now a ghost, which is the most honest of the four." } },
    advice = { { id = "tp_ad", text = "Beware of people who befriend you quickly and ask you to change slowly, mortal. That is how I was lost." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "The Hammer took me in when I was lost, and I served them with my whole heart. I was wrong, and I've had a long time to think about how wrong." } },
    elune = {
      { id = "tp_elune", text = "Elune's light doesn't reach this ridge, but I pray to her anyway. I don't expect an answer, but I'd like her to know I'm sorry." },
      { id = "tp_elune2", when = { race = "NightElf" }, text = "You'll know her prayers, sister or brother, so say one for me when you reach the moonwell. I've forgotten half of them." },
    },
    tyrande = { { id = "tp_tyrande", text = "Tyrande would be ashamed of me, and she'd be right to be. I'd like to tell her so, if I could." } },
    the_elements = { { id = "tp_the_elements", text = "The Hammer worshipped the elements, or said they did. They worshipped power, and the elements were just the shape it took." } },
    _none = { { id = "tp_none", text = "I do not know it, mortal. My world has been this cage for a long while." } },
  },
}
