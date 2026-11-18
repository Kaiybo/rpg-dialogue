-- Zangen Stonehoof, who lights the evening fire on the High Rise. Voice: bibles/zangen.md
-- A devout, unhurried keeper of the flame, helping Rau Cliffrunner reach an artifact of the centaur's making.
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zangen", id = TODO_NPC("Zangen Stonehoof"), name = "Zangen Stonehoof",
  bible = "bibles/zangen.md", role = "priest", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "devout", "patient" },
  notices = { "class", "form" },
  impression = {
    first = "Zangen Stonehoof lights the great fire on the High Rise every evening and says the same prayer over it. He is gentle and unhurried, and he is helping Rau Cliffrunner reach something the Galak centaur guard.",
    third = "{name} met Zangen Stonehoof on the High Rise of Thunder Bluff, the tauren who lights the evening fire and sent for moonwell water for Rau Cliffrunner.",
  },

  greetings = {
    { id = "g_fire", text = "Warm your hands, {class}. The fire belongs to everyone who passes, as the plains belong to every herd." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The fire is lit, and the ancestors can see their way home. Sit, if you like." },
    { id = "g_phial", when = { questActive = TODO_QUEST("The Sacred Flame") }, text = "A dryad's phial, filled at the moonwell by the Falfarren. Be gentle with it; the water remembers how it was carried." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you sat by this fire. It burned every night without you, but it's glad of the company." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you carried the phial for me. The fire throws a longer shadow behind you now." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear kind words about you on the rises. They warm an old tauren nearly as well as the fire." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = { "DRUID", "SHAMAN" } },
      text = "You feel the fire differently than most, I think. It isn't only wood burning, is it?" },
    { id = "n_form", cat = "form", when = { form = { "bear", "cat", "travel" } },
      text = "Even the beasts come to the fire when the nights turn cold. Rest your shape a while, friend; nothing here will hunt you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Zangen Stonehoof. Every evening I light this fire and ask the Earth Mother to watch over us in the dark as in the day, and to remind us of the ancestors who guide our way. Lately I also help my friend Rau Cliffrunner, who seeks an artifact the centaur guard." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Sacred Flame") },
          text = "The Galak centaur in Thousand Needles guard an artifact from the time of the centaur's making, and my friend Rau Cliffrunner would see it recovered. To reach it, he needs water from one of the night elves' moonwells, carried in a dryad's phial." },
        { id = "h_filled", tags = { "news" }, when = { questActive = TODO_QUEST("The Sacred Flame") },
          text = "The dryads near the Raynewood Retreat carry the phials, and the moonwell lies on the western bank of the Falfarren River, south of the road. Ashenvale is no friend to the Horde, {name}, so walk softly." },
        { id = "h_rau", when = { questDone = TODO_QUEST("The Sacred Flame") },
          text = "Rau sends thanks from Freewind Post, and says the water arrived clear and cold. I told him you'd carried it as if it were the flame itself." },
        { id = "h_dusk", when = { timeOfDay = "dusk" }, text = "You've come at the right hour, {class}. Stand with me while I light it; the words are short, and the fire likes witnesses." },
      },
      again = {
        { id = "h_again", text = "What else? The fire keeps talking, and the ancestors listen, so I might as well join in." },
        { id = "h_again2", text = "Ask what you will. The evening is long, and the kettle has barely started to grumble." },
      },
      choices = {
        { text = "Why light the fire every night?", next = "fire" },
        { text = "What artifact do the centaur guard?", next = "artifact" },
        { text = "Who is Rau Cliffrunner?", next = "rau" },
        { text = "The fire seems to speak to you, Zangen.", next = "speak", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "How can I help?", next = "BUSINESS" },
        { text = "Earth Mother watch over you.", next = "END" },
      },
    },
    fire = {
      lines = { { id = "f_default", text = "So the ancestors can see their way among us, and so the living remember that they're watched. A city on the bluffs needs reminding, I think, more than a village does." } },
      choices = {
        { text = "Why does a city need reminding?", next = "city" },
        { text = "It's a beautiful fire.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    city = {
      lines = { { id = "c_default", text = "Because in a city, the herds are far away and the land is under stone. A tauren can go a whole day in Thunder Bluff without touching the earth, and that is how we start to forget." } },
      choices = {
        { text = "Then cities are a danger to your people.", next = "city_end" },
        { text = "Every people needs its cities.", next = "city_end" },
      },
    },
    city_end = {
      big = true,
      lines = { { id = "ce_default", text = "Cities protect us, and I would not tear this one down for anything. But a city that forgets the plains beneath it is only a high place to fall from, so I light the fire, and the rest is up to each of us." } },
      choices = {
        { text = "The old ways must be kept, whatever the cost.", next = "BACK", reply = "You speak like my grandmother, who kept the fire burning through three hard winters. Only take care the cost is not paid by the young, who never chose it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "People change. Let them find new ways.", next = "BACK", reply = "Perhaps they will, and the Earth Mother is patient with change. But a new trail is still walked on old ground, and I would have them remember that much.", fx = { align = { order = -1 } } },
        { text = "Something else, Zangen.", next = "BACK" },
      },
    },
    artifact = {
      lines = { { id = "a_default", text = "Rau would know more, but the centaur tell a story that they were born from the earth itself, long ago. The Galak keep something from that time, and Rau believes it could tell us why the centaur hate everything that isn't centaur." } },
      choices = {
        { text = "Why does it need moonwell water?", next = "moonwell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonwell = {
      lines = { { id = "m_default", text = "Rau says the artifact is bound in a way that only pure water can loosen, and the moonwells are the purest water in Kalimdor. The night elves would not give it to us, so we must take it gently and hope they forgive us." } },
      choices = {
        { text = "Taking from a moonwell is still taking.", next = "BACK", reply = "It is, and I feel the weight of it each time I think of the elves. We will take only what we need, and give thanks to the water as we would to the hunt.", fx = { align = { light = 1 } } },
        { text = "The elves don't own the water. We need it.", next = "BACK", reply = "The water belongs to the Earth Mother, yes, though the elves have kept it longer than we have had a city. Need is a good reason, but it is not the same as a right.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rau = {
      lines = { { id = "r_default", text = "An old friend, now at Freewind Post in Thousand Needles. He watches the Galak and the Grimtotem both, which is more watching than any one tauren should have to do." } },
      choices = { { text = "I'll find him there.", next = "BACK", fx = { learn = { "grimtotem" } } } },
    },
    speak = {
      lines = { { id = "s_default", text = "Not in words, but in how it burns. When it leans east, someone is coming home, and when it crackles too loudly, someone has been forgotten, and I say a name I know into it." } },
      choices = {
        { text = "Say a name for me, sometime.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I light the fire. That has been my life for many years, and I have no complaints about it." } },
    advice = { { id = "tp_ad", text = "Touch the earth at least once a day, even in a city. It reminds you where you came from." } },
    grimtotem = { { id = "tp_grim", text = "The Grimtotem keep their own fires, far from ours, and I wonder sometimes what they pray for." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother hears every prayer, and I say mine over the fire every evening. It is a small thing, but she likes small things done well." } },
    centaur = { { id = "tp_centaur", text = "The Galak centaur guard the old places in Thousand Needles, and Rau Cliffrunner wants what they keep there. I help him because the past belongs to all of us, not only to those who hold it." } },
    cairne = { { id = "tp_cairne", text = "Cairne lights the great fire with me sometimes, on the high days. He says the prayer better than I do, and I do not mind." } },
    the_elements = { { id = "tp_the_elements", text = "The fire spirit on the High Rise is old and calm, and it likes the prayer. I think it would burn without me, but I like to think it burns better with me." } },
    _none = { { id = "tp_none", text = "The fire hasn't told me of that one. Ask on the Elder Rise, and walk with the Earth Mother on your way." } },
  },
}
