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
        { text = "Who comes through this inn?", next = "who" },
        { text = "Strongbash says you hear everything.", next = "hear", when = { heardLine = "brave_strongbash.im_default" } },
        { text = "What do you make of the village's troubles?", next = "troubles" },
        { text = "You've chosen a good seat.", next = "seat" },
        { text = "I'll leave you to the fire.", next = "END" },
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
