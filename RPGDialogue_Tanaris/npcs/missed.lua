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
        { text = "You must know every soul in Gadgetzan's graveyard.", next = "gy" },
        { text = "What does the desert hide that the living miss?", next = "sands" },
        { text = "I could pray for your spirit to find its rest.", next = "rest", when = { class = "PRIEST" } },
        { text = "Rest well, Gaeriyan.", next = "END" },
      },
    },
    gy = {
      lines = { { id = "gy_d", text = "Most of those under the stones died much as I did, only with a goblin's bill in their pockets. There are Wastewander bandits there, and prospectors who trusted a stranger's map, and a few who walked west to Zul'Farrak and were carried home in pieces." } },
      choices = {
        { text = "Zul'Farrak seems to claim a great many.", next = "gy_zf" },
        { text = "Do any of them linger, as you do?", next = "gy_linger" },
        { text = "Something else, Gaeriyan.", next = "BACK" },
      },
    },
    gy_zf = {
      lines = { { id = "gy_zf_d", text = "The Sandfury trolls hold that city as if the desert had raised it for them, and they give back nothing that wanders inside. I have watched the goblins' hired swords march west in good order and come home by ones and twos, when they came home at all." } },
      choices = {
        { text = "Then I'll go with friends, or not at all.", next = "BACK", reply = "That is the first wise thing a living soul has said on this cliff in a long while." },
        { text = "Let us speak of other things.", next = "BACK" },
      },
    },
    gy_linger = {
      lines = { { id = "gy_linger_d", text = "None that I have seen, and I have looked on a good many quiet nights. Perhaps they had less to regret than I did, or perhaps the goblins' noise drives them off, for nothing rests easily within earshot of that town." } },
      choices = {
        { text = "Maybe they simply had somewhere to go.", next = "BACK", reply = "Perhaps. It is a kinder thought than mine, and I will keep it." },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    sands = {
      lines = { { id = "sands_d", text = "Everything the wind has buried, and will dig up again when it pleases. I have seen old walls rise out of the dunes in a storm and sink again by morning, with nobody but me on the cliff to watch them." } },
      choices = {
        { text = "You must see a great deal from this height.", next = "sands_south" },
        { text = "I have other questions.", next = "BACK" },
      },
    },
    sands_south = {
      lines = { { id = "sands_south_d", text = "More than I would like. Far to the south the ground is broken open, and things with too many legs crawl out of it at night and go back down before the sun, and the goblins have not yet decided whether to fear them or to sell them." } },
      choices = {
        { text = "The goblins will try selling them first.", next = "BACK", reply = "Very likely, and I shall watch that bargain from up here with some interest." },
        { text = "Back to other matters.", next = "BACK" },
      },
    },
    rest = {
      lines = { { id = "rest_d", text = "That is kindly offered, {class}, and I thank you for it. But I do not know what holds me to this cliff, and I am not sure I wish to be loosed from it before I understand, so keep your prayer for one who asks." } },
      choices = {
        { text = "Then I'll keep it ready, should you ever ask.", next = "BACK", reply = "Few have offered even that. Thank you." },
        { text = "As you wish. Something else.", next = "BACK" },
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
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Oh, it's you! I'm so glad! Come sit on the dock and tell me everything you've seen out there." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Oh. You swam all the way out here again? Well, I suppose you can stay for a bit." },
    { id = "g_default", text = "Oh, hello! You swam all the way out here? You're not from Gadgetzan about the mooring fee, are you, because I've checked and this island isn't on their map." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! I've turned over since you were last here, so that's my day's work done." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A dwarf! Lovely! You won't make me talk about gears, will you? Dwarves only ever want to talk about gears, or beer." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Sit down, sit down, and promise me you won't mention schedules, quotas or anything with a boiler in it for at least ten minutes." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Goodness, you'd want to keep out of this sun, wouldn't you? I mean no offence, only I've seen what it does to a ham left on a windowsill." },
  },
  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I spent eleven years in Gnomeregan calibrating pressure valves. Then Gnomeregan was lost, and I spent four more in Ironforge calibrating them all over again. One morning I realised I'd never seen the sea. So I came to see it." },
      },
      choices = {
        { text = "Did you lose anyone in Gnomeregan?", next = "y_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_lost = {
      lines = {
        { id = "y_y_lost", text = "A few. My supervisor, Mister Cogsworth, who used to hum while he worked. A friend from the boiler rooms. I try not to think about it. That's partly why I'm here; it's easier not to think about it in the sun." },
        { id = "y_y_lost_v0", when = { race = "Gnome" }, text = "A few, as I expect you did. My supervisor, Mister Cogsworth, who hummed while he worked. It's easier not to think about it in the sun." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_visit = {
      lines = {
        { id = "y_y_visit", text = "A goblin from Gadgetzan came out once in a little rowboat, to tell me I owed a mooring fee for the island. I told him I hadn't moored anything, I'd swum. He went away very confused, and I've not seen him since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_back = {
      lines = {
        { id = "y_y_back", text = "Sometimes I think I ought to go back and help retake Gnomeregan. Other times I think I've done my share and deserve a holiday. What do you think?" },
      },
      choices = {
        { text = "Go back. Your people need you.", next = "BACK", reply = "Oh, I know, I know. I'll go. Soon. After the tide turns. Or the next one.", fx = { align = { honor = 1 } } },
        { text = "Rest. You've earned it.", next = "BACK", reply = "Thank you! That's what I keep telling myself. It's lovely to hear it from someone else.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "How did you end up here?", next = "y_hist" },
        { text = "Has anyone else visited?", next = "y_visit" },
        { text = "Will you ever go back to work?", next = "y_back" },
        { text = "I'm an engineer myself.", next = "BACK", when = { profession = "Engineering" }, reply = "Oh dear. Please don't tell me what you're working on. I'll want to help, and then I'll be working." },
        { text = "What do you eat out here on your own?", next = "w9_eat" },
        { text = "Enjoy the sun, Winkey.", next = "END" },
      },
    },

    w9_eat = {
      lines = {
        { id = "w9_eat_d", text = "Crab, mostly, and fish when I can be bothered, and the occasional coconut that floats in from somewhere very far away. I built a little grill out of a ship's lantern and some pipe, and it holds a perfect cooking temperature, plus or minus two degrees." },
        { id = "w9_eat_v1", when = { race = "Gnome" }, text = "Crab, fish and the odd lost coconut, same as any gnome on holiday would, I imagine! I built a grill from a ship's lantern and some pipe, and you'll appreciate this, it holds temperature to within two degrees without a single valve." },
      },
      choices = {
        { text = "Two degrees? I thought you were resting.", next = "w9_eat2" },
        { text = "Sounds like a good life.", next = "w9_eat2" },
        { text = "Something else.", next = "BACK" },
      },
    },

    w9_eat2 = {
      lines = { { id = "w9_eat2_d", text = "I am resting, I promise! I just rest more precisely than most people. Besides, if I let the grill wander about, the crab comes out like boot leather, and nobody swims all the way out here for boot leather." } },
      choices = {
        { text = "I'd swim out for good crab.", next = "BACK", reply = "Then you're welcome any time! Bring your own plate, though." },
        { text = "Something else.", next = "BACK" },
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
    gnomeregan = { { id = "tp_ygnomeregan", text = "Gnomeregan. My old home. I try not to think about it, and I'm getting quite good at it." } },
    gadgetzan = { { id = "tp_ygadgetzan", text = "Gadgetzan wants a mooring fee. I swam. That's not mooring." } },
    background = { { id = "tp_bg", text = "A valve calibrator from Gnomeregan, retired for the present. I'm on the first holiday of my life." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, and isn't that lovely? I used to have to know everything." } },
  },
}
