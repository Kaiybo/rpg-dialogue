-- Petra Grossen and her kodo Dadanga, Marshal's Refuge (0.72.0). Voice: bibles/petra.md
-- An orc packmaster who raised her kodo from a calf and asks you to keep your torches stashed.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "petra", id = TODO_NPC("Petra Grossen"), name = "Petra Grossen",
  bible = "bibles/petra.md", role = "worker", tier = "service",
  communities = { "marshals_refuge" }, temper = { "calm", "warm" }, values = { "loyal", "patient" },
  notices = { "light", "pet" },
  impression = {
    first = "Petra Grossen is an orc packmaster who has walked beside her kodo Dadanga since the beast was a calf. She is calm and kind, and she asks everyone to keep their torches away because Dadanga dislikes smoke.",
    third = "{name} met Petra Grossen, an orc of the Marshal Expedition, and her pack kodo Dadanga.",
  },

  greetings = {
    { id = "g_default", text = "Hello there. If you're carrying a lit torch, stash it, please; Dadanga dislikes smoke." },
    { id = "g_fed", when = { questDone = TODO_QUEST("Dadanga is Hungry!") }, text = "Dadanga's been watching the path for you since you fed her. She remembers kindness, and so do I." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and Dadanga's put on a little weight while you were away. Don't tell her I said so." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The camp's taken a shine to you. That's good; out here, friends are the only shelter worth having." },
  },

  notice = {
    { id = "n_fire", cat = "light", when = { class = { "MAGE", "WARLOCK" } },
      text = "You smell of burning, friend, so stand downwind of the kodo, would you? She's fussier about it than I am." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That {pet} of yours is well kept, I can see it in the coat. Dadanga likes most animals, so long as they're not on fire." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "My name's Petra, and to my right is my kodo, Dadanga. We've been with Marshal Expeditions a few years now, ever since Dadanga was a babe." },
        { id = "h_hungry", when = { questBefore = TODO_QUEST("Dadanga is Hungry!") },
          text = "Dadanga's eyeing you hopefully, which means she's hoping you brought a snack. She's a big girl, so if you find something growing out there, bring a lot of it." },
        { id = "h_fed", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dadanga is Hungry!"), days = 3 } },
          text = "Bloodpetal sprouts, and plenty of them! She's been content as a calf since, and she pushed a little parcel your way, did you see? She does that with people she likes." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Throm-ka. It's good to see another orc this far from the Barrens, even if you're only passing through." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren! Dadanga always perks up around your people, and I've never worked out whether it's the smell of the plains or the size." },
      },
      again = {
        { id = "h_again", text = "Anything else? Dadanga's in no hurry, and neither am I." },
        { id = "h_again2", text = "Go on. She likes the sound of talking, as long as nobody shouts." },
      },
      choices = {
        { text = "Why does Dadanga dislike smoke?", next = "smoke" },
        { text = "How did an orc end up with Marshal Expeditions?", next = "orc" },
        { text = "What does a pack kodo do out here?", next = "work" },
        { text = "Spark says Dadanga needs a bath.", next = "spark", when = { heardLine = "spark_nilminer.d_default" } },
        { text = "May I greet her?", next = "greet", when = { class = { "HUNTER", "DRUID", "SHAMAN" } } },
        { text = "What does Dadanga eat?", next = "BUSINESS" },
        { text = "Take care, Petra.", next = "END" },
      },
    },
    smoke = {
      lines = { { id = "s_default", text = "There's fire in the ground here, and the mountain to the south smokes day and night, and she's never got used to it. A torch near her face and she'll sulk for a week." } },
      choices = {
        { text = "She sounds like she has opinions.", next = "smoke_op" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smoke_op = {
      lines = { { id = "so_default", text = "She has a great many, and most of them are about food. I trust her nose more than any map, though; she's smelled danger before I've seen it more times than I can count." } },
      choices = { { text = "A good partner, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    orc = {
      lines = { { id = "o_default", text = "The Marshals needed somebody who knew kodos and wasn't afraid of the road from Gadgetzan, and I needed work that didn't involve an axe. It's been a fair trade on both sides." } },
      choices = {
        { text = "You didn't want to fight?", next = "orc_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc_fight = {
      big = true,
      lines = { { id = "of_default", text = "I've done my share, in the camps and after, and I found I'd rather raise something than cut it down. Dadanga taught me that, more than any shaman did." } },
      choices = {
        { text = "That's a strength, Petra, not a weakness.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "An orc should keep her axe close, all the same.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Carries the Marshals' supplies down from the rim and their finds back up, and she defends herself well enough, because I taught her how. But the beasts out there are overgrown madness, so we never travel far alone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    spark = {
      lines = { { id = "sp_default", text = "Does he now? Spark hasn't washed since the expedition landed, so he's hardly one to talk. Dadanga, ignore the goblin." } },
      choices = { { text = "I'll tell him you said so.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    greet = {
      lines = { { id = "g2_default", text = "Slowly, and from the front, so she can see your hands. There, she's leaning into you, that means she approves." } },
      choices = { { text = "Hello, Dadanga.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An orc who traded the axe for a kodo's lead rope. I haven't regretted it once, not even in Un'Goro." } },
    advice = { { id = "tp_ad", text = "Look after your animals before yourself; they'll carry you when you can't carry on." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask Williden, he's the one with the books." } },
  },
}
