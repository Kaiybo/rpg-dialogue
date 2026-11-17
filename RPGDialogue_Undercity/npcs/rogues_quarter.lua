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
        { text = "So you were a cutpurse.", next = "purse" },
        { text = "What's the first lesson?", next = "lesson" },
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "I worked the capital's markets too, Miles, before the plague.", next = "xorig_cutpurse", when = { origin = "forsaken_capital_cutpurse" } },
        { text = "I'll see myself out.", next = "END" },
      },
    },
    xorig_cutpurse = {
      lines = {
        { id = "xcp_default", text = "Did you now? Then we've almost certainly robbed the same merchants, and quite possibly each other. Which corner was yours: the fish stalls by the gate, or the cloth sellers under the palace wall?" },
      },
      choices = {
        { text = "The fish stalls. The smell kept the guards away.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "The cloth sellers. Richer pockets, slower owners.", next = "BACK", fx = { affinity = 1, trait = { greedy = 1 } } },
        { text = "I'll keep that to myself, if it's all the same.", next = "BACK", fx = { trait = { cautious = 1 } } },
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
  notices = { "class" },
  impression = {
    first = "Gregory Charles teaches rogues with a courtier's manners and a hangman's patience. He spoke of the noble he once guarded as if the man were a debt never settled.",
    third = "{name} met Gregory Charles, a cold, courteous rogue trainer in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Good evening. State your business, and kindly keep your hands visible while you do." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. I trust you've been practising, since I'll know if you haven't." },
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
      },
      again = {
        { id = "h_again", text = "Is there something more? Be precise, please." },
      },
      choices = {
        { text = "Who was the nobleman?", next = "noble" },
        { text = "The Dark Lady must have work for rogues.", next = "service" },
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
  },

  topics = {
    _none = { { id = "tp_none", text = "That isn't within my remit. Try Mennet Carkad, who makes everything his business." } },
  },
}
