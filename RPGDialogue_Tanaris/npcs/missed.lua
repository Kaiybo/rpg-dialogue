-- Tanaris folk an earlier pass missed: the ghost Gaeriyan on the cliffs north-east of Gadgetzan (seen only by
-- the dead, part of Linken's chain), and Winkey, a gnome taking the sun on an island off the coast.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Gaeriyan: human ghost on the cliffs north-east of Gadgetzan; Meet at the Grave, A Grave Situation.
P:NPC {
  key = "gaeriyan", id = TODO_NPC("Gaeriyan"), name = "Gaeriyan", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "gentle", "calm" }, values = { "wise", "patient" },
  notices = { "status" },
  impression = {
    first = "On the cliffs north-east of Gadgetzan there is a ghost named Gaeriyan who can only be seen by those who are, for the moment, dead themselves. He was courteous and weary, and he knew what was buried in the town's graveyard.",
    third = "{name} met the ghost Gaeriyan on the cliffs above Gadgetzan, who knows the secret under a gravestone in the town's graveyard.",
  },
  greetings = {
    { id = "g_default", text = "Please, leave an old spirit to his peace. I have watched this desert a long while, and I have little left to say to it." },
    { id = "g_meet", when = { questActive = TODO_QUEST("Meet at the Grave") }, text = "You have drunk something bitter and crossed over to find me. Very few trouble to do so, {class}, and so I shall hear what you have come to ask." },
    { id = "g_grave", when = { questActive = TODO_QUEST("A Grave Situation") }, text = "You have not yet been to the graveyard, I think. The stone will keep, but the elixir in your veins will not." },
    { id = "g_done", when = { questDone = TODO_QUEST("A Grave Situation") }, text = "I have given you all the knowledge I had, {name}. May luck go with you, and with the one whose sword it is." },
  },
  notice = {
    { id = "n_ghost", cat = "status", when = { ghost = true },
      text = "You come to me truly dead, and not by any elixir. Then we are neighbours for a little while, though I hope for your sake it is a short visit." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Gaeriyan, or I was. I died in these sands a long time before the goblins raised their town, and I have lingered on this cliff since, watching the living come and go without once being seen by them." },
        { id = "h_meet", when = { questActive = TODO_QUEST("Meet at the Grave") }, text = "I am Gaeriyan. The woman in the northern snows has sent you about a sword, and about the one who carried it, and it happens that I know where the thing it needs was hidden." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of the dead?" },
        { id = "h_again2", text = "Speak, while the elixir still holds you here." },
      },
      choices = {
        { text = "Donova Snowden sent me about Linken's sword.", next = "sword", when = { any = { { questActive = TODO_QUEST("Meet at the Grave") }, { questActive = TODO_QUEST("A Grave Situation") }, { questDone = TODO_QUEST("A Grave Situation") } } } },
        { text = "Why can only the dead see you?", next = "seen" },
        { text = "How did you die?", next = "died" },
        { text = "What do you make of Gadgetzan?", next = "town" },
        { text = "Rest well, Gaeriyan.", next = "END" },
      },
    },
    sword = {
      lines = { { id = "s_default", text = "The blade was meant to be more than it is, and what would finish it was put in the ground for safekeeping by someone who did not trust the living with it. I watched it buried, as I watch everything here, and nobody thought to hide it from a ghost." } },
      choices = {
        { text = "Where was it buried?", next = "where" },
        { text = "Another question.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "In the graveyard at Gadgetzan there is one stone that does not sit like the rest, and nobody lies beneath it. Go to that gravestone, and look under it for what the sword is wanting." } },
      choices = {
        { text = "Why tell me, after keeping it so long?", next = "whytell" },
        { text = "Another question.", next = "BACK" },
      },
    },
    whytell = {
      lines = { { id = "wt_default", text = "Because you went to the trouble of dying to ask me, and that is a courtesy the dead do not often receive. And because a secret that outlives everyone who needed it is only a stone with nothing under it." } },
      choices = { { text = "Thank you. Another question.", next = "BACK", fx = { affinity = 1 } } },
    },
    seen = {
      lines = { { id = "se_default", text = "I do not know that I chose it. I think that when one has been dead as long as I have, one grows thin to living eyes, as an old path grows over, and only those who walk on the same side can still make it out." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    died = {
      lines = { { id = "d_default", text = "Thirst, and a wrong turning, and the pride that would not let me admit to either until it was too late. There was no town here then to walk towards, only the dunes and the trolls of Zul'Farrak, who gave no water to strangers." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    town = {
      lines = { { id = "t_default", text = "It is loud, and it sells water at a price that would have saved my life and emptied my purse. I do not grudge the goblins their walls, for I would have given a great deal to see a lamp on this horizon on my last night." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A traveller who died of thirst in these dunes, long before there was a Gadgetzan to reach." } },
    _none = { { id = "tp_none", text = "The dead are told very little, and I have forgotten much of what I knew." } },
  },
}

-- Winkey: gnome on a small island off the Tanaris coast.
P:NPC {
  key = "winkey", id = TODO_NPC("Winkey"), name = "Winkey", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "tanaris_coast" }, temper = { "cheerful", "chatty" }, values = { "curious", "friendly" },
  notices = { "race" },
  impression = {
    first = "Winkey is a gnome who has an entire island to herself off the coast of Tanaris and is using it to do absolutely nothing. She was delighted to have a visitor and more delighted that I had not come to fetch her back to work.",
    third = "{name} met Winkey, a gnome taking a very long holiday on a small island off the coast of Tanaris.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello! You swam all the way out here? You're not from Gadgetzan about the mooring fee, are you, because I've checked and this island isn't on their map." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! I've turned over since you were last here, so that's my day's work done." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Sit down, sit down, and promise me you won't mention schedules, quotas or anything with a boiler in it for at least ten minutes." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Goodness, you'd want to keep out of this sun, wouldn't you? I mean no offence, only I've seen what it does to a ham left on a windowsill." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Winkey! I spent eleven years calibrating pressure valves, and then one morning I calculated that I had spent ninety-four percent of my life indoors, so I came to find the sunniest place on the map and lie down on it." } },
      again = {
        { id = "h_again", text = "What else would you like to know? I've nothing scheduled, which is the whole idea." },
        { id = "h_again2", text = "Go on, ask! Talking doesn't count as work." },
      },
      choices = {
        { text = "Why this island?", next = "island" },
        { text = "Isn't it dangerous out here alone?", next = "danger" },
        { text = "Don't you miss your work?", next = "work" },
        { text = "Enjoy the sun, Winkey.", next = "END" },
      },
    },
    island = {
      lines = { { id = "i_default", text = "I took measurements, naturally. It has the most hours of sunlight on the coast, a steady breeze off the water, and it's exactly far enough from Steamwheedle Port that no goblin has rowed out to sell me a parasol." } },
      choices = {
        { text = "You measured before lying down?", next = "measured" },
        { text = "Something else.", next = "BACK" },
      },
    },
    measured = {
      lines = { { id = "m_default", text = "Well, I'm on holiday, not a barbarian! I tested four beaches and two sandbars first, and kept a chart, and I'll admit that working it all out was the most fun I'd had in years, which rather worried me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "There are pirates down the shore and sea turtles a good deal bigger than I am in the shallows, but neither has shown the slightest interest in one small gnome. I think I simply don't look profitable, and I mean to keep it that way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "w_default", text = "Not the valves, no, though I do catch myself timing the waves and working out the average. I expect I'll go back to a workbench one day, when I've finished being warm, and I estimate that at another two or three years." } },
      choices = { { text = "Take your time. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A valve calibrator from Gnomeregan, retired for the present. I'm on the first holiday of my life." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, and isn't that lovely? I used to have to know everything." } },
  },
}
