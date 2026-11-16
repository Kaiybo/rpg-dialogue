-- Darkshire's gryphon master and weaponsmith. Voice: bibles/darkshire_trades.md
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC = P.TODO_NPC

-- Felicia Maline: Darkshire's gryphon master.
P:NPC {
  key = "felicia_maline", id = TODO_NPC("Felicia Maline"), name = "Felicia Maline", title = "Gryphon Master",
  bible = "bibles/darkshire_trades.md", role = "flightmaster", tier = "service",
  communities = { "darkshire" }, temper = { "steady" }, values = { "duty", "courage" },
  impression = {
    first = "Felicia Maline keeps Darkshire's gryphons, and she says the birds hate Duskwood's dark nearly as much as the townsfolk do.",
    third = "{name} met Felicia Maline, Darkshire's gryphon master.",
  },
  greetings = {
    { id = "g_default", text = "Flying out? I don't blame you. The birds are always glad to leave, too." },
    { id = "g_back", when = { metBefore = true }, text = "Back in Duskwood? You're braver than most, or you've a short memory." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Felicia Maline. I keep the gryphons of Darkshire, which mostly means keeping them calm when the wolves howl at night." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "A hunter, and with a beast at your side! Keep it close at night, friend; the worgen like nothing better than a stray pet." },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds want their supper." },
        { id = "h_again2", text = "Go on, then, since it's quiet in here for once." },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Why do the gryphons hate the wood?", next = "a" },
        { text = "Who flies out of Darkshire?", next = "b" },
        { text = "Thank you, Felicia.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Because they can't see through the canopy, and a gryphon that can't see the ground is a frightened gryphon. They fly high over Duskwood and they don't come down until Darkshire's lamps are under them." } },
      choices = {
        { text = "Have you lost any?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "One, last winter, that came down near Raven Hill and never came back up. The Night Watch wouldn't go and look for it, and I can't say I blame them." } },
      choices = {
        { text = "Someone should have gone. Every life matters, even a beast's.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The Watch was right. You don't risk men for a bird.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Couriers for the Night Watch, mostly, and the odd merchant who's had enough. Hardly anyone flies in, except adventurers like you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came from Stormwind to keep the birds, and the town kept me." } },
    _none = { { id = "tp_none", text = "I wouldn't know about that. I know the sky, not the ground." } },
  },
}

-- Gavin Gnarltree: Darkshire's weaponsmith; kin of Clarise Gnarltree.
P:NPC {
  key = "gavin", id = TODO_NPC("Gavin Gnarltree"), name = "Gavin Gnarltree", title = "Weaponsmith",
  bible = "bibles/darkshire_trades.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "grim" }, values = { "craft", "practical" },
  impression = {
    first = "Gavin Gnarltree sells swords and axes to a town that sleeps with one hand on a hilt, and he doesn't pretend any of it is enough against what lives in the wood.",
    third = "{name} met Gavin Gnarltree, Darkshire's grim weaponsmith.",
  },
  greetings = {
    { id = "g_default", text = "Steel, sharpened. You'll want it in this wood." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive? Then the blade's done its job, or you've done yours." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gavin Gnarltree. I make weapons for Darkshire, and in Darkshire nobody buys a blade for show." },
        { id = "h_cond", when = { class = "WARRIOR" }, text = "A warrior. Good. Commander Ebonlocke could use a dozen more of you, and I could use the custom." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask. I'm only grinding an edge." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What works against the worgen?", next = "a" },
        { text = "Are you kin to Clarise?", next = "b" },
        { text = "Good day.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Folk will tell you silver, but folk tell you all sorts. What works is a heavy blade, a steady arm and a friend at your back, and I can only sell you the first of those." } },
      choices = {
        { text = "And against the dead at Raven Hill?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "Something blunt, because bones don't bleed. Some say the Light does better than any mace, but I've never sold a prayer and I won't start now." } },
      choices = {
        { text = "Faith is the better weapon. Steel only finishes the job.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Steel is what keeps this town alive, not prayers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "We're Gnarltrees, and that's enough said. She sells to the town and I sell to the Watch, and we both sell more than we'd like." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've worked this forge since before the wood went dark, and I'll work it after, if the town lasts." } },
    _none = { { id = "tp_none", text = "Don't know, and in Duskwood it's healthier not to wonder." } },
  },
}
