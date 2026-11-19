-- Nighthaven folk an earlier pass missed: Celes Earthborne, Dargon at the inn, and the two Riverbends, Moren
-- and Mylentha, tauren of the Cenarion Circle in the south of the village. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Celes Earthborne: night elf, Nighthaven.
P:NPC {
  key = "celes_earthborne", id = TODO_NPC("Celes Earthborne"), name = "Celes Earthborne", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "nighthaven" }, temper = { "calm", "gentle" }, values = { "nature", "patient" },
  notices = { "class" },
  impression = {
    first = "Celes Earthborne is a night elf of the Cenarion Circle in Nighthaven who speaks as though every sentence had been turned over twice before she let it out. She seems to spend her days listening to the ground.",
    third = "{name} met Celes Earthborne, a quiet druid of the Cenarion Circle in Nighthaven.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. Walk softly in Nighthaven, for you are a guest of the Circle here, whoever you may be elsewhere." },
    { id = "g_back", when = { metBefore = true }, text = "The glade has drawn you back. It does that, to those who have need of quiet." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID", race = "Tauren" },
      text = "A druid of the Bluff. Your people came late to the Dream and have taken to it with a whole heart, and there are elders of mine who might learn from that." },
    { id = "n_druid2", cat = "class", when = { class = "DRUID", race = "NightElf" },
      text = "Welcome, {g:brother|sister}. You will have come for your trials or for peace, and Moonglade is generous with both." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Celes Earthborne, of the Cenarion Circle. My study is the soil of this glade and what sleeps in it, which is slow work, and I am told I have grown slow in the doing of it." } },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak, and I will listen as I listen to the ground." },
      },
      choices = {
        { text = "What sleeps in the soil?", next = "soil" },
        { text = "Why is Moonglade so peaceful?", next = "peace" },
        { text = "Horde and Alliance both walk here.", next = "both" },
        { text = "Elune be with you.", next = "END" },
      },
    },
    soil = {
      lines = { { id = "s_default", text = "Seeds that fell before I was born, and I am older than any kingdom of men. Some wait a thousand years for the right rain, and I have learned from them that waiting is not the same as doing nothing." } },
      choices = {
        { text = "Do you hear the land beyond the glade?", next = "beyond" },
        { text = "Let us speak of something else.", next = "BACK" },
      },
    },
    beyond = {
      lines = { { id = "b_default", text = "Faintly, as one hears a neighbour through a wall. Felwood to the south cries out without ceasing, and it is the reason the Keeper lets none of us forget that this peace is lent to us and not owned." } },
      choices = { { text = "Let us speak of something else.", next = "BACK" } },
    },
    peace = {
      lines = { { id = "p_default", text = "Because Keeper Remulos wills it so, and because the wardens enforce his will without exception. The glade has been a sanctuary of the druids since long before your wars, and it will be one after them." } },
      choices = { { text = "Let us speak of something else.", next = "BACK" } },
    },
    both = {
      lines = { { id = "bo_default", text = "They do, and they glare at one another across the lake and then go quietly about their business. I have come to think the Riverbends, who live among us, do more for peace by baking bread for an elf than all the envoys in Darnassus." } },
      choices = { { text = "Let us speak of something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have served the Circle in this glade for many turnings of the seasons. I do not count them any longer." } },
    _none = { { id = "tp_none", text = "The earth has not spoken to me of that. Perhaps Rabine Saturna can help you." } },
  },
}

-- Moren Riverbend: tauren, southern Nighthaven.
P:NPC {
  key = "moren_riverbend", id = TODO_NPC("Moren Riverbend"), name = "Moren Riverbend", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "nighthaven" }, temper = { "calm", "warm" }, values = { "nature", "wise" },
  notices = { "race" },
  impression = {
    first = "Moren Riverbend is a tauren of the Cenarion Circle who lives at the southern end of Nighthaven with his kinswoman Mylentha. He speaks slowly and looks at the lake a great deal, and nothing about either seems idle.",
    third = "{name} met Moren Riverbend, a tauren druid of the Cenarion Circle living in Nighthaven.",
  },
  greetings = {
    { id = "g_default", text = "The Earth Mother's peace upon you, {class}. You are welcome at the Riverbend fire, as all are who come to Moonglade in good faith." },
    { id = "g_back", when = { metBefore = true }, text = "The winds have carried you back to us. Sit, and tell me where they took you." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "It gladdens me to see one of our people in the glade. Tell me whether Hamuul Runetotem is well, for he set my feet on this path, and I have not seen the Bluff in many seasons." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Your people opened this glade to mine when they might have kept it closed. I do not forget it, whatever passes between our kind in Ashenvale." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Moren Riverbend. I came north from Mulgore to learn the old ways of the druids from those who have kept them longest, and I have stayed because there is more to learn here than one life will hold." } },
      again = {
        { id = "h_again", text = "What else would you hear?" },
        { id = "h_again2", text = "Speak. There is no hurry beside this lake." },
      },
      choices = {
        { text = "What have the night elves taught you?", next = "taught" },
        { text = "Do you miss Mulgore?", next = "mulgore" },
        { text = "Mylentha is your kin?", next = "mylentha" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    taught = {
      lines = { { id = "t_default", text = "Patience, first, and after that how little I knew. They have walked the Emerald Dream for ten thousand years, and my people are as calves beside them, though I think a calf sometimes sees what the old bull has stopped looking at." } },
      choices = {
        { text = "What does the calf see?", next = "calf" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    calf = {
      lines = { { id = "c_default", text = "That the land is to be lived upon as well as guarded. The elves tend the wild as one tends a shrine, whereas a tauren hunts in it, gives thanks, and buries his dead in it, and I believe the Earth Mother is honoured by both." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    mulgore = {
      lines = { { id = "m_default", text = "Every dawn, when An'she rises and there is no golden grass for the light to fall on. But the same sun and the same moon watch over both places, and I take comfort in that when the snow lies on the hills around us." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    mylentha = {
      lines = { { id = "my_default", text = "She is of my family and came north with me, and she is the reason our lodge is ever in order. She will tell you that I talk to the lake when I should be gathering firewood, and she is right." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A druid of Mulgore who came to learn from the Circle's elders. I am still learning." } },
    _none = { { id = "tp_none", text = "The winds have not spoken of it to me. Ask among the elders of the Circle." } },
  },
}

-- Mylentha Riverbend: tauren, Nighthaven.
P:NPC {
  key = "mylentha_riverbend", id = TODO_NPC("Mylentha Riverbend"), name = "Mylentha Riverbend", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "nighthaven" }, temper = { "warm", "steady" }, values = { "kind", "practical" },
  notices = { "weary" },
  impression = {
    first = "Mylentha Riverbend keeps the Riverbend lodge in Nighthaven and sees that her kinsman Moren remembers to eat. She has a tauren's calm and a housekeeper's eye, and she had noticed the state of my boots before I had said a word.",
    third = "{name} met Mylentha Riverbend, a tauren of the Cenarion Circle who keeps a lodge in Nighthaven.",
  },
  greetings = {
    { id = "g_default", text = "Come and rest, {class}. You have the dust of a long road on you, and Moonglade is a good place to shake it off." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and your boots are no better. Sit, and let your feet remember what stillness is." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of our own! You must take a little of our flatbread before you go, for you will not have tasted the like since the Bluff." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Your gear is worn nearly through, and I would guess that you are too. The inn is quiet here, and nothing in this glade will wake you before the sun does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Mylentha Riverbend. My kinsman Moren came to study with the Circle, and I came to see that he did not starve while he did it, and somewhere along the way the glade became my home as well." } },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak, I am listening." },
      },
      choices = {
        { text = "How do the night elves treat you?", next = "elves" },
        { text = "What is it like to live in Nighthaven?", next = "live" },
        { text = "Moren says you keep him in order.", next = "moren" },
        { text = "May the eternal sun shine on you.", next = "END" },
      },
    },
    elves = {
      lines = { { id = "e_default", text = "With great courtesy and a little distance, as they treat one another. It took three winters before a neighbour asked me into her house, and now she will not let me leave it without a basket of something." } },
      choices = {
        { text = "What won her over?", next = "won" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    won = {
      lines = { { id = "w_default", text = "Bread, I think, and time. I left a loaf on her step each new moon and said nothing of it, for the kaldorei do not care to be hurried into friendship, and a tauren knows how to wait." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    live = {
      lines = { { id = "l_default", text = "Quiet, and green even in the cold months, though there is no wide sky as there is in Mulgore. I have planted plains herbs behind the lodge, and the druids were good enough to pretend they did not notice." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    moren = {
      lines = { { id = "m_default", text = "Somebody must. He has a good heart and a deep mind, and he would sit by that lake until the moss grew over him if I did not call him in for supper." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am of the Riverbend family, from Mulgore. I came north for kin, and stayed for the peace." } },
    _none = { { id = "tp_none", text = "I do not know that. Moren might, if you can draw him away from the water." } },
  },
}
