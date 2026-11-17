-- The Rogues' Quarter's trainers beside Carolyn Ward: Miles Dexter and Gregory Charles. Voices: bibles/<key>.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Miles Dexter: rogue trainer, a former cutpurse who still counts the room.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_dexter", id = TODO_NPC("Miles Dexter"), name = "Miles Dexter", title = "Rogue Trainer",
  bible = "bibles/uc_dexter.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "smooth", "wry" }, values = { "cunning" },
  notices = { "stealth", "purse" },
  impression = {
    first = "Miles Dexter teaches rogues in the Rogues' Quarter and admitted, quite cheerfully, that he'd already guessed what was in my pack. I checked it afterwards, and he was right.",
    third = "{name} met Miles Dexter, a rogue trainer in the Undercity and a former cutpurse of the capital.",
  },

  greetings = {
    { id = "g_default", text = "Don't stand under the lantern. It makes you look like a mark, and you're not a mark, are you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and you came in quieter this time. I noticed, even if nobody else did." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Nice try. Your left boot creaks, and it's been creaking since the canal." },
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "You're carrying a heavy purse into the Rogues' Quarter. That's either very trusting or very foolish, and I'm too fond of you to say which." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Miles Dexter. I teach the Dark Lady's rogues the finer points, and I learned them in the capital's markets, one purse at a time, before the plague put me out of business." },
        { id = "h_troll", when = { race = "Troll", class = "ROGUE" }, text = "A troll rogue. You lot are taller than anything should be that wants to hide, so we'll start by teaching you to crouch." },
        { id = "h_woman", when = { gender = "female", class = "ROGUE" }, text = "A lady rogue. The best pickpocket I ever ran with was a woman named Bess, and she could lift a ring off a dancing man's hand without missing a step." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask quietly; the walls here have ears, and most of them are mine." },
      },
      choices = {
        { text = "You were a cutpurse?", next = "purse" },
        { text = "What's the first lesson?", next = "lesson" },
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "I'll see myself out.", next = "END" },
      },
    },
    purse = {
      lines = { { id = "pu_default", text = "The best in the Merchants' Row, if I say so myself, and I do. The watch caught me twice in ten years, and the second time I'd already spent the money." } },
      choices = {
        { text = "Do you regret it?", next = "purse_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    purse_regret = {
      lines = { { id = "pr_default", text = "I regret the ones who couldn't spare it. The rest were nobles who'd have burned the city before they'd fed it, and I'd lift their purses again tomorrow if they were still alive to carry them." } },
      choices = {
        { text = "Theft from the greedy is no crime.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A thief is a thief, Miles.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    lesson = {
      lines = { { id = "le_default", text = "Count the doors before you count the coins. Every room has more ways out than its owner thinks, and a rogue who doesn't know them is just a burglar with a short future." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Never heard a whisper about it, and I hear most whispers in this city." } },
  },
}

---------------------------------------------------------------------------
-- Gregory Charles: rogue trainer, a nobleman's former bodyguard, formal and cold.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_gcharles", id = TODO_NPC("Gregory Charles"), name = "Gregory Charles", title = "Rogue Trainer",
  bible = "bibles/uc_gcharles.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "cold", "formal" }, values = { "loyal" },
  notices = { "class", "stealth" },
  impression = {
    first = "Gregory Charles teaches rogues with a courtier's manners and a hangman's patience. He stands with his back to the wall, counts the doors before he counts the people, and speaks of the noble he once guarded as if the man were a debt never settled.",
    third = "{name} met Gregory Charles, a cold, courteous rogue trainer in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Good evening. State your business, and kindly keep your hands visible while you do." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. I trust you've been practising, since I'll know if you haven't." },
    { id = "g_stealth", when = { stealthed = true }, text = "You came in by the left-hand arch, three steps behind the guard. Do sit down; I saw you before you'd decided to come." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You walk in here like you expect a fight. In this quarter, you'd never see it coming." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gregory Charles. I train rogues for the Dark Lady's service, and before the plague I kept a nobleman of Lordaeron alive, which was the harder task by far." },
        { id = "h_deathstalker", when = { origin = "forsaken_deathstalker_recruit" }, text = "Mennet's recruit. He tells me you have promise, and I've learned to doubt everything Mennet tells me, so you'll forgive me if I wait to see it." },
        { id = "h_party", when = { party = true }, text = "You've brought company, I see, and you let them walk behind you. I'd not have kept my post a week with habits like that." },
      },
      again = {
        { id = "h_again", text = "Is there something more? Be precise, please." },
        { id = "h_again2", text = "Continue. I am listening, and also watching the door behind you, so don't take offence if I don't look at you." },
      },
      choices = {
        { text = "Who was the nobleman?", next = "noble" },
        { text = "What does the Dark Lady want from rogues?", next = "service" },
        { text = "Why do you keep looking at the doors?", next = "doors" },
        { text = "Why do you doubt Mennet Carkad?", next = "mennet" },
        { text = "I could slip past you, Charles, back to the wall or not.", next = "slip", when = { class = "ROGUE", minLevel = 30 } },
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Good evening.", next = "END" },
      },
    },
    noble = {
      lines = { { id = "no_default", text = "A lord with lands near Andorhal, who paid well and trusted me completely. When the grain came, he ate the bread like everyone else, and there was no blade I could put between him and that." } },
      choices = {
        { text = "That wasn't your failing.", next = "noble_fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble_fail = {
      big = true,
      lines = { { id = "nf_default", text = "Perhaps not, but I was paid to keep him breathing, and he stopped. I serve the Dark Lady now with the same care, and I intend to finish the job this time." } },
      choices = {
        { text = "Loyalty like that is rare. Hold to it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Serve yourself first. Lords never repay it.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    service = {
      lines = { { id = "se_default", text = "Eyes in Hillsbrad and Silverpine, knives in the Scarlet camps, and silence afterwards. The Deathstalkers take the best of my students, and I take that as a compliment." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    doors = {
      lines = { { id = "do_default", text = "Habit, and a good one. A bodyguard learns to count the ways out of a room before he counts the people in it, and I have counted four here, one of which you are standing in, which I would ask you to correct." } },
      choices = {
        { text = "Does it ever stop, the counting?", next = "doors_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    doors_stop = {
      lines = { { id = "ds_default", text = "Not since I woke, and I don't expect it to, since it's the last thing of my old life I still do well. Allow me to ask you something in turn, as I ask all my students: whom do you protect?" } },
      choices = {
        { text = "My companions. Their backs are mine to watch.", next = "guard_friends", fx = { trait = { kind = 1 }, affinity = 1 } },
        { text = "The Dark Lady's people, whatever it costs me.", next = "guard_lady", fx = { trait = { brave = 1 }, affinity = 1 } },
        { text = "No one. That's how I stay alive.", next = "guard_none", fx = { trait = { cautious = 1 } } },
      },
    },
    guard_friends = {
      lines = { { id = "gf_default", text = "A worthy answer, if a costly one. Stand to their left, keep your eyes on the doors, and never, ever let them eat anything you haven't seen made." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guard_lady = {
      lines = { { id = "gl_default", text = "Then we serve the same mistress, and I'll train you accordingly, without kindness. Kindness is what I gave my lord, and you have heard how that ended." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guard_none = {
      lines = { { id = "gn_default", text = "Sensible, and it will keep you alive a good while, I don't doubt. It will not, however, give you anything to stay alive for, and I say that as one who has tried both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    slip = {
      lines = { { id = "sl_default", text = "You might, and I should be glad to see you try, because the attempt would teach me something about you and nothing about me. Just bear in mind that the last student who tried it is now posted to the Scarlet camps, and very happy there, I'm told." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mennet = {
      lines = { { id = "me_default", text = "Because Mennet Carkad tells every recruit they have promise, and he tells it so warmly that they believe him. I have buried enough promising young people, in two lives, to prefer evidence." } },
      choices = {
        { text = "Encouragement makes good recruits. Mennet's right.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Trust is earned. You're right to wait.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That isn't within my remit. Try Mennet Carkad, who makes everything his business, and do count the doors while you wait for him to finish talking." } },
  },
}
