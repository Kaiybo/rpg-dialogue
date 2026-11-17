-- Ruul Eagletalon, warrior and teacher in Bloodhoof Village. Voice: bibles/ruuleagletalon.md
-- A steady old warrior who measures the young by how they come back from the Windfury cliffs.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ruuleagletalon", id = TODO_NPC("Ruul Eagletalon"), name = "Ruul Eagletalon",
  bible = "bibles/ruuleagletalon.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "steady" }, values = { "patient", "brave" },
  notices = { "class", "greenness" },
  impression = {
    first = "Ruul Eagletalon calls himself a warrior and a teacher, and he tests the young of Bloodhoof against the Windfury harpies before they go further from home. He is patient, and he expects you to come back.",
    third = "{name} met Ruul Eagletalon in Bloodhoof Village, a warrior who tests young tauren against the Windfury harpies.",
  },

  greetings = {
    { id = "g_village", text = "Well met, {name}. Sit if you need to; standing proves nothing to me." },
    { id = "g_active", when = { questActive = TODO_QUEST("Dangers of the Windfury") }, text = "The Windfury nest along the mountain's edge to the southeast, away from the road. Bring me their talons." },
    { id = "g_done", when = { questDone = TODO_QUEST("Dangers of the Windfury") }, text = "Let the wind always be at your back, {name}. You've earned it." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and you came back. That is the part I always worry about." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You were ready to leave Mulgore when I last saw you, and now you look ready for much more than that. I'm glad I was right." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The village speaks well of you, {name}. A teacher likes hearing that, even about someone he only taught a little." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Then you'll understand that the trial is not about the harpies, it is about what you learn while fighting them." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 6 },
      text = "You're young for the Windfury yet. Spend a few more days near the village first; there's no shame in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ruul, warrior and teacher. When the young of Bloodhoof are ready to go further than Mulgore, I send them against the Windfury first, so we both know what they're made of." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Dangers of the Windfury") },
          text = "Thank you for taking the time to speak to me, {name}. You've reached the age when you must prepare for trials if you'll travel much further, so seek out the Windfury harpies to the southeast. They're one of our natural enemies here, and a good measure of your skill." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dangers of the Windfury"), days = 3 } },
          text = "You've done well, {name}. You seem prepared to travel onward, and I'll tell my brother Eyahn in Thunder Bluff to expect someone worth meeting." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Windfury", min = 20 } }, text = "The Windfury along the cliffs have fewer voices this season, and the herders are grateful. That's a lesson the harpies will remember longer than you will." },
      },
      again = {
        { id = "h_again", text = "What else would you ask your teacher? Let the wind be at your back while you think." },
        { id = "h_again2", text = "Go on. I've time for the young, always." },
      },
      choices = {
        { text = "Why the Windfury harpies?", next = "harpies" },
        { text = "What makes someone ready to leave Mulgore?", next = "ready" },
        { text = "So you have a brother.", next = "eyahn" },
        { text = "Teach me something, as one warrior to another.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'm ready for a trial.", next = "BUSINESS" },
        { text = "Farewell, Ruul.", next = "END" },
      },
    },
    harpies = {
      lines = { { id = "h2_default", text = "They nest on the cliffs where the mountains meet the plains, and they swoop on herders and travelers alike. They're quick, they come from above, and they fight in flocks, which is everything the world beyond Mulgore will throw at you." } },
      choices = {
        { text = "So they're practice.", next = "practice" },
        { text = "Something else, Ruul.", next = "BACK" },
      },
    },
    practice = {
      lines = { { id = "p_default", text = "Practice, yes, and also a danger to our people and our herds that needs answering. I don't send the young to fight anything that doesn't need fighting." } },
      choices = {
        { text = "Surely someone fails the trial now and then.", next = "fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fail = {
      big = true,
      lines = { { id = "f_default", text = "Then they come back and try again, and nobody in Bloodhoof says a word about it, because I'll not let them. The only way to fail my trial is to die in it, so don't." } },
      choices = {
        { text = "Patience with the young makes good warriors.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Failure should sting. That's how you learn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ready = {
      lines = { { id = "r_default", text = "When you can fight something faster than you and come back with a lesson instead of just a wound. The Barrens and the Needles are beyond our hills, and they're not patient with fools, though the Earth Mother is." } },
      choices = {
        { text = "I'd rather learn than bleed.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sometimes bleeding is how you learn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eyahn = {
      lines = { { id = "e_default", text = "Eyahn, on the lower rise in Thunder Bluff. He prepares the ceremonies for our honored dead, and I prepare the young to live, so between us we have the whole of a tauren's life covered." } },
      choices = {
        { text = "That's a strange pair of trades.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll look for him in Thunder Bluff.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    warrior = {
      lines = { { id = "w_default", text = "Strike at what's in front of you, but listen for what's above. The Windfury taught me that, and so did a few wars, and the lesson cost less from the harpies." } },
      choices = { { text = "I'll listen for what's above.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A warrior who grew old enough to teach. There's no better thing a warrior can become, I think." } },
    advice = { { id = "tp_ad", text = "Let the wind always be at your back, and keep an eye on the sky. Most of what kills you out there comes from above or behind." } },
    _none = { { id = "tp_none", text = "I don't know of that. Ask in Thunder Bluff; my brother hears more than I do, and the elders more than both of us." } },
  },
}
