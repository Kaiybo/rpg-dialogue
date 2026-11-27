-- Mulgore's merchants the roster scan found unwritten. Camp Narache's armory tent (Bronk Steelrage,
-- Marjak Keenblade, Varia Hardhide) and its general goods (Kawnie Softbreeze); Bloodhoof Village's
-- Harn Longcast, Kennah Hawkseye, Moorat Longstride and Wunna Darkmane, and Magrin Rivermane at the inn.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Magrin Rivermane: a tauren who keeps a seat in the Bloodhoof Village inn.
---------------------------------------------------------------------------
P:NPC {
  key = "magrin_rivermane", id = TODO_NPC("Magrin Rivermane"), name = "Magrin Rivermane", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "bloodhoof" }, temper = { "quiet" }, values = { "hospitality", "memory" },
  notices = { "race", "class" },
  impression = {
    first = "Magrin Rivermane has a place by the fire in the Bloodhoof Village inn and the look of someone who has had it a long while. He listens to the whole room at once, and he nods to each traveller as though ticking them off a count.",
    third = "{name} met Magrin Rivermane, who keeps a seat by the fire in the Bloodhoof Village inn.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Sit, friend, by me. The fire is better when shared with someone I'm glad to see." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "There is room by the fire, {class}, as there is for anyone. I've little else to offer you." },
    { id = "g_default", text = "Sit down by the fire, {class}, for there is room, and the plains will still be there when you are warm." },
    { id = "g_back", when = { metBefore = true }, text = "I thought we would see you at this fire again, because travellers who stop here once tend to." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It is a good night to be under a roof. Kauth has built the fire high, and you are welcome to your share of it." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken, at a tauren fire. Sit all the same, for the elders have said you are to be given a chance, and I would like to judge for myself." },
    { id = "n_druid", cat = "class", when = { class = "DRUID", race = "Tauren" },
      text = "You carry the calm of the Cenarion teaching, young one. The inn always feels a little quieter when a druid comes in." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Magrin Rivermane. I have no stall and no post, only this seat, and from it I have watched most of the Horde come through Bloodhoof at one time or another." },
      },
      again = {
        { id = "h_again", text = "What else would you talk of? The fire has a while left in it." },
        { id = "h_again2", text = "I am listening, as I usually am." },
      },
      choices = {
        { text = "Watching quietly and judging fairly is a rare gift.", next = "BACK", reply = "You are kind to say it. Fewer folk listen than you would think.", fx = { align = { honor = 1 } } },
        { text = "An old tauren by the fire hears only gossip.", next = "BACK", reply = "Gossip, yes, and the truth hides inside it. You'd be surprised.", fx = { align = { honor = -1 } } },
        { text = "Who comes through this inn?", next = "who" },
        { text = "Strongbash says you hear everything.", next = "hear", when = { heardLine = "brave_strongbash.im_default" } },
        { text = "What do you make of the village's troubles?", next = "troubles" },
        { text = "You've chosen a good seat.", next = "seat" },
        { text = "What's the strangest traveller you've seen here?", next = "strange" },
        { text = "Innkeeper Kauth keeps a warm fire.", next = "kauth" },
        { text = "Do many orcs come through Bloodhoof?", next = "orcs_through", when = { race = "Orc" } },
        { text = "What have you learned from your seat by the fire?", next = "w7_learn" },
        { text = "I'll leave you to the fire.", next = "END" },
      },
    },
    w7_learn = {
      lines = {
        { id = "w7_learn_l1", text = "That everyone carries something heavy, and most of them would like to set it down for an evening. An orc who lost his clan, a troll who misses the sea, a young tauren afraid of the road; I listen, and they set it down, and in the morning they pick it up again, a little lighter." },
      },
      choices = {
        { text = "Do you ever tell them anything?", next = "w7_learn2" },
        { text = "That sounds like a heavy seat.", next = "w7_learn3" },
        { text = "Something else, Magrin.", next = "BACK" },
      },
    },
    w7_learn2 = {
      lines = {
        { id = "w7_learn2_l1", text = "Rarely. People do not want advice by the fire; they want an ear. When someone does ask, I tell them what my mother told me: the grass bends under the herd, and it does not break." },
        { id = "w7_learn2_l2", when = { race = "Tauren" }, text = "Rarely. But you, I will tell: the grass bends under the herd, and it does not break. You will carry heavy things on the road. Bend, cousin, and do not break." },
      },
      choices = {
        { text = "Good words.", next = "BACK", reply = "My mother's. They have lasted longer than she did." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_learn3 = {
      lines = {
        { id = "w7_learn3_l1", text = "It is a seat by a fire. Nothing is heavy by a fire, for long." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = { { id = "strange_d", text = "A troll who sits by the road and stares into every traveller's face, looking for young priests who have wandered off. Var'jun, his name is, and he has been searching for a good while now without finding a single one." } },
      choices = {
        { text = "Has he asked you to help?", next = "strange_help" },
        { text = "A troll searching faces. That is odd.", next = "BACK", reply = "Less odd than you would think, once you have watched him a while. He is only worried, and worry looks strange from outside." },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange_help = {
      lines = { { id = "strange_help_d", text = "He has, and I told him what I tell everyone, that I would watch. I have seen two young trolls pass through in the last moon, and I told him both times, though by then they had already gone on toward Thunder Bluff." } },
      choices = {
        { text = "That's kind of you.", next = "BACK", reply = "It costs me nothing but attention, and attention is all I have to give from this seat." },
        { text = "Another question.", next = "BACK" },
      },
    },
    kauth = {
      lines = { { id = "kauth_d", text = "He does, and he keeps it burning even when the inn is empty, for he says an empty fire is an invitation and a cold hearth is a warning. I have sat by it for so many seasons that he has stopped asking whether I want anything." } },
      choices = {
        { text = "Do you ever leave this seat?", next = "kauth_leave" },
        { text = "A warm fire and a good seat. What more is there?", next = "BACK", reply = "Company, perhaps, and you have brought me some. I am grateful." },
        { text = "Something else.", next = "BACK" },
      },
    },
    kauth_leave = {
      lines = { { id = "kauth_leave_d", text = "To walk the village at dawn, and to go up the lift to Thunder Bluff when the elders call the tribes together, though my knees argue with me about it. Otherwise I am here, and the village comes to me, which saves my knees a great deal." } },
      choices = {
        { text = "The village comes to you. I like that.", next = "BACK" },
        { text = "Another question.", next = "BACK" },
      },
    },
    orcs_through = {
      lines = { { id = "orcs_through_d", text = "More every season, orc, on their way to the Barrens or back from it. They eat Kauth's stew and say it needs more pepper, and they leave a coin for the fire, which I have always thought was a fine custom." } },
      choices = {
        { text = "Orcs know the value of a good fire.", next = "BACK", reply = "They do. It is one of the things that makes the Horde feel like one tribe." },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Young tauren down from the mesa with their first kills still on their minds, and orcs who have never before seen so much green in one place. Lately there are trolls as well, and the pale dead from Lordaeron, who sit furthest from the fire and say the least." } },
      choices = {
        { text = "What do you make of the Forsaken?", next = "who_forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_forsaken = {
      lines = { { id = "wf_default", text = "I think they are a people in pain who have not decided what to do with it. Our elders spoke for them before the Warchief, and I hope the day never comes when we are ashamed of having done so.", fx = { learn = { "forsaken" } } } },
      choices = {
        { text = "We have not forgotten that kindness.", next = "BACK", when = { race = "Scourge" }, reply = "Then remember it on the day it is hard to, for that is the only day it will count.", fx = { affinity = 1 } },
        { text = "A careful answer. Something else.", next = "BACK" },
      },
    },
    hear = {
      lines = { { id = "h2_default", text = "Strongbash hears everything too, but he is talking at the time, so it does not stay with him. I only know that a quiet tauren by a fire is told a great deal by people who simply wish to be listened to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troubles = {
      lines = { { id = "t_default", text = "The gnolls, the goblins and the dwarves at their digging are all one trouble with three faces, which is that others have learned Mulgore is good land. Baine handles it well, and he will handle it better with help.", fx = { learn = { "venture_company" } } } },
      choices = { { text = "Then I'll go and offer mine.", next = "BACK", fx = { affinity = 1 } } },
    },
    seat = {
      lines = { { id = "s_default", text = "It is near the fire, it faces the door, and it is within reach of Kauth's stew pot. I spent enough years sleeping on open ground to know when I have found the best seat in Mulgore." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I walked with the tribe through the wandering years, and now that we have a home I mean to sit in it." } },
    forsaken = { { id = "tp_fo", text = "They are guests of the Horde, and I watch them as I would any guest who came in out of a storm." } },
    cairne = { { id = "tp_ca", text = "He gave us a land where an old tauren can sit by one fire for as long as he pleases, and I thank him daily." } },
    venture_company = { { id = "tp_vc", text = "Their people never stop at the inn, and I think less of anyone who will not share a fire." } },
    _none = { { id = "tp_none", text = "Nobody has brought that tale to this fire yet, but stay a while and somebody may." } },
  },
}
