-- Gazrog, the Crossroads officer who lost the guards' payroll to raptors. Voice: bibles/gazrog.md
-- An orc who cannot get over the fact that the thieves were lizards, and who has to answer to every unpaid grunt.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gazrog", id = TODO_NPC("Gazrog"), name = "Gazrog",
  bible = "bibles/gazrog.md", role = "soldier", tier = "quest",
  communities = { "crossroads" }, temper = { "gruff" }, values = { "dutiful", "practical" },
  notices = { "pet", "class" },
  impression = {
    first = "Gazrog keeps the Crossroads guard tower and lost the guards' silver to a pack of raptors. He still cannot believe it, and he has to face every unpaid grunt in town until the silver comes back.",
    third = "{name} met Gazrog at the Crossroads, the orc whose guard payroll was stolen by raptors.",
  },

  greetings = {
    { id = "g_tower", text = "If you've come about the pay, the answer's still no. If you've come about raptors, talk." },
    { id = "g_heads", when = { questActive = TODO_QUEST("Raptor Thieves") }, text = "Raptor heads, {class}. Twelve of them. I want to look them in the eye." },
    { id = "g_silver", when = { questActive = TODO_QUEST("Stolen Silver") }, text = "The Raptor Grounds, south of Ratchet. If the silver's anywhere, it's in a nest down there." },
    { id = "g_paid", when = { questDone = TODO_QUEST("Stolen Silver") }, text = "The guards got paid, and they've stopped glaring at me. That's your doing." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone and you're back. Nothing's been stolen since you left, which I'm counting as a victory." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You're not the same {class} who went raptor hunting for me. These days I'd worry for the raptors." },
  },

  notice = {
    { id = "n_raptorpet", cat = "pet", when = { pet = { family = "Raptor" } },
      text = "Is that a raptor? Keep it away from my strongbox, I mean it, I've been robbed by its cousins once already." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. If you'd stolen the silver I'd at least understand it, which is more than I can say for the lizards." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gazrog. I keep the guard tower and the Crossroads' strongbox, or I kept the strongbox, until a shipment of silver went missing on my watch. The guards' payroll, every coin of it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Raptor Thieves") },
          text = "A shipment of silver was stolen from our guard tower, meant to pay the Crossroads' guards. And we caught one of the thieves on the night of the theft, {class}, and it was a raptor! I don't know what a raptor wants with silver, and I don't care, I just want them dead." },
        { id = "h_heads_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Raptor Thieves"), days = 3 } },
          text = "You got rid of the raptors, {name}, and you're a {class} of worth. But the silver's still out there, and the guards still haven't been paid." },
        { id = "h_silver_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Stolen Silver"), days = 3 } },
          text = "So they did hide it in their lair! It's hard to believe beasts would want silver, so maybe the stories about how clever they are aren't so far off. Thank you, {name}." },
        { id = "h_dogran", when = { questActive = TODO_QUEST("News of Dogran") },
          text = "You're asking after Grunt Dogran? He was taken by the Bristleback down in the south, near Agama'gor, and Grunt Logmar at Camp Taurajo knows more than I do." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got a strongbox to stare at." },
        { id = "h_again2", text = "Go on. Nobody else here wants to talk to me until payday, and some of the grunts have stopped talking to me at all." },
      },
      choices = {
        { text = "Raptors stole silver? Really?", next = "raptors" },
        { text = "How are the guards taking it?", next = "guards" },
        { text = "The Crossroads seems to have trouble on every side.", next = "crossroads" },
        { text = "I'm looking for word of Grunt Dogran.", next = "dogran", when = { class = "WARLOCK" } },
        { text = "I've got work in me.", next = "BUSINESS" },
        { text = "Good luck with the lizards.", next = "END" },
      },
    },
    raptors = {
      lines = { { id = "r_default", text = "Really! The night watch caught one with a sack in its jaws, and it bit the watchman and ran off laughing, or whatever raptors do instead of laughing. Nobody in the Crossroads believes me, and I was there." } },
      choices = {
        { text = "Maybe someone trained them to steal.", next = "trained" },
        { text = "Maybe they just like shiny things.", next = "shiny" },
      },
    },
    trained = {
      lines = { { id = "t_default", text = "That's what keeps me up at night, {class}. If somebody out there is teaching raptors to rob the Horde, then it's not a hunt, it's a war, and I'd rather it were just lizards." } },
      choices = {
        { text = "Then I'll find the truth, whatever it is.", next = "truth" },
        { text = "Something else, Gazrog.", next = "BACK" },
      },
    },
    truth = {
      big = true,
      lines = { { id = "tr_default", text = "Find the silver first, and the truth will be lying next to it. Thork wants me to write it off and I won't, because the guards would never trust that strongbox again." } },
      choices = {
        { text = "The guards earned that silver. It comes back.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let it go. Pay them from somewhere else.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shiny = {
      lines = { { id = "sh_default", text = "Then they've got expensive taste. I've seen magpies with more sense, and they at least don't bite." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    guards = {
      lines = { { id = "g_default", text = "Badly. A grunt who isn't paid still stands his watch, because he's Horde, but he stands it angry, and angry guards look at me when I walk past." } },
      choices = {
        { text = "They'll forgive you when they're paid.", next = "BACK", fx = { affinity = 1 } },
        { text = "It wasn't your fault. Raptors happen.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    crossroads = {
      lines = { { id = "c_default", text = "Harpies to the north, centaur to the west, quilboar to the south, and now raptors in the strongbox. Thork holds it together, and the rest of us try not to make his job harder." } },
      choices = {
        { text = "That's a lot of enemies for one town.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dogran = {
      lines = { { id = "d_default", text = "Dogran was a good grunt, and the Bristleback took him near Agama'gor. Logmar at Camp Taurajo was with him, so start there, and bring him home if there's anything left to bring." } },
      choices = { { text = "I'll find him.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm an orc who keeps a strongbox and a tower. I was good at it until the lizards came." } },
    advice = { { id = "tp_ad", text = "Lock your valuables up high. Raptors can't climb, or I hope they can't, anyway." } },
    _none = { { id = "tp_none", text = "Don't know. Ask Thork, he knows everything that happens here." } },
  },
}
