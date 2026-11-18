-- Cassandra Wheeler, food and drink at Farholde Keep. Voice: bibles/cassandra.md
-- Feeds a keep that remembers half rations, and won't let anyone leave her counter hungry if she can help it.
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "cassandra", id = TODO_NPC("Cassandra Wheeler"), name = "Cassandra Wheeler", title = "Food & Drink",
  bible = "bibles/cassandra.md", role = "vendor", tier = "service",
  communities = { "farholde" }, temper = { "warm", "brisk" }, values = { "kind", "practical" },
  notices = { "weary", "drink" },
  impression = {
    first = "Cassandra Wheeler sells bread and ale at Farholde and watches every soldier who passes her counter to see who isn't eating. She is brisk, motherly, and stubborn about it.",
    third = "{name} met Cassandra Wheeler, who keeps Farholde Keep fed from her food and drink stall.",
  },

  greetings = {
    { id = "g_bread", text = "Bread's fresh, ale's cold, and the stew's whatever the hunters brought in. What'll it be?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, love? Good, you looked thin last time." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I'll wager you didn't eat a proper meal the whole time. Sit down, I'll find you something." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at you, filled out and fighting fit. My cooking, I'll take the credit, whatever you say." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Folk at the keep have been saying nice things about you, love. Have a bun on the strength of it." },
  },

  notice = {
    { id = "n_hungry", cat = "weary", when = { resSick = true },
      text = "You look like death, love, and I mean that the old-fashioned way. Eat something before you fall over in my doorway." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 1 } },
      text = "Had a few at the port already, have you? Then you'll want bread to soak it up, love, before you go anywhere near a horse." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Cassandra Wheeler, and this is my counter. Every soldier in Farholde comes past it sooner or later, and I make sure none of them goes past it hungry." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! You'll want the dark ale, then, which nobody else here drinks. I keep a cask for Bertrand, and he won't miss a pint." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. If you bring me boar or crawdad from the river, I'll know what to do with it, and so will every hungry soldier in the keep." },
      },
      again = {
        { id = "h_again", text = "Anything else, love? I've a pot on." },
      },
      choices = {
        { text = "How do you keep the keep fed?", next = "fed" },
        { text = "What's the gossip around the counter?", next = "gossip" },
        { text = "Do you remember the siege?", next = "siege" },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Thanks, Cassandra.", next = "END" },
      },
    },

    fed = {
      lines = { { id = "fe_default", text = "Fish from the sea, boar from the hills when the hunters are lucky, and bread from flour that comes in by sea and costs too much. I stretch it, and I stretch it, and somehow it stretches." } },
      choices = {
        { text = "It can't always be enough.", next = "fed_enough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fed_enough = {
      lines = { { id = "fn_default", text = "Some weeks. When it's thin, I feed the ones riding out first and the rest of us eat what's left, and nobody complains, because everybody here remembers the siege." } },
      choices = {
        { text = "The riders first? That seems right.", next = "fed_riders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fed_riders = {
      big = true,
      lines = { { id = "fr_default", text = "It's how Demar wants it, and I agree, mostly. Though I sneak a bit extra to the sick ones in Sister Rowland's chapel, and if he notices, he hasn't said." } },
      choices = {
        { text = "Good. The sick need it more than the rules do.", next = "BACK", reply = "That's what I tell myself when Demar counts the sacks. Don't tell him, mind, or I'll be cooking for the riders alone.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Orders are orders, even in a kitchen.", next = "BACK", reply = "They are, and I follow them, mostly. The sick ones only get the scrapings, honest.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gossip = {
      lines = { { id = "go_default", text = "Who's courting whom, who drank too much at the port, and whether the Commander's ever going to sleep. Mostly it's worry, love, dressed up as gossip." } },
      choices = {
        { text = "Folk here seem worried about something.", next = "gossip_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_worry = {
      lines = { { id = "gw_default", text = "The cultists up at the Shroud, the soldiers coughing in the chapel, and the Horde over at Rog'mar. Nobody says Stormwind's coming to help, and nobody's said it in years." } },
      choices = {
        { text = "Maybe I can change that.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } },
      },
    },

    siege = {
      lines = { { id = "si_default", text = "I was a girl, and I remember being hungry, and I remember the night the Brotherhood rode out of the gate and didn't stop. After that I decided nobody in this keep would ever go hungry again if I could help it." } },
      choices = {
        { text = "And you've kept that promise.", next = "BACK", fx = { affinity = 2, learn = { "siege_of_farholde" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Farholde born and bred, love, and I've fed it since I could reach the counter. There's not much more to say than that." } },
    advice = { { id = "tp_ad", text = "Eat before you fight, not after, because after you might not be in a state to." } },
    siege_of_farholde = { { id = "tp_siege", text = "Half rations and no ships. I was small, but I remember every hungry night of it." } },
    bolvar = { { id = "tp_bolvar", text = "Lord Bolvar sends us letters, love, and very little else, and you can't feed a keep on letters. I'll say that much and no more, because the Knight Commander says plenty." } },
    holy_light = { { id = "tp_holy_light", text = "Sister Rowland prays over the sick in the chapel, and I bring them soup, and between the two of us I think we do some good. The Light can have the credit, so long as they eat." } },
    booty_bay = { { id = "tp_booty_bay", text = "The boats from the south bring salt fish and gossip, and both of them smell of Booty Bay. I'll take the fish, love, and leave the gossip on the dock." } },
    second_war = { { id = "tp_second_war", text = "Farholde stood through the old war when the orcs came to the gate, and my mother kept the ovens going the whole time. I learned that a full belly holds a wall as well as any mortar does." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, love. Ask whoever's next in my queue; they'll have an opinion." } },
  },
}
