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
    first = "He is patient, and he expects you to come back.",
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
        { id = "h_default", key = true, text = "I am Ruul, warrior and teacher. When the young of Bloodhoof are ready to go further than Mulgore, I send them against the Windfury first, so we both know what they're made of. My brother readies the dead in Thunder Bluff, and I ready the living." },
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
        { text = "Tell me about your brother.", next = "eyahn" },
        { text = "Teach me something, as one warrior to another.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'm ready for a trial.", next = "BUSINESS" },
        { text = "What else threatens Bloodhoof besides harpies?", next = "threats" },
        { text = "How should I fight the Windfury?", next = "tactics" },
        { text = "Can my pet fight the harpies with me?", next = "pet_harpy", when = { class = "HUNTER" } },
        { text = "How did you get that scar on your arm?", next = "w7_scar" },
        { text = "Farewell, Ruul.", next = "END" },
      },
    },
    w7_scar = {
      lines = {
        { id = "w7_scar_l1", text = "A Windfury matriarch, years ago, when I was as young and as sure as you. She came down on me from above while I was watching the three in front, and her talons opened me from shoulder to wrist." },
      },
      choices = {
        { text = "How did you survive?", next = "w7_scar2" },
        { text = "You should have watched the sky.", next = "w7_scar3" },
        { text = "Something else, Ruul.", next = "BACK" },
      },
    },
    w7_scar2 = {
      lines = {
        { id = "w7_scar2_l1", text = "My brother Eyahn, who was watching the sky when I was not. He put a spear through her before she could come back for my throat, and then he carried me down to Bloodhoof and complained about my weight the whole way." },
        { id = "w7_scar2_l2", when = { class = "WARRIOR" }, text = "Eyahn, who watched the sky for me. You'll learn this, as I did: a warrior is only as safe as the one at his back. Find someone who will watch your sky, and watch theirs." },
      },
      choices = {
        { text = "He sounds like a good brother.", next = "BACK", reply = "The best, though I will never tell him so to his face." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_scar3 = {
      lines = {
        { id = "w7_scar3_l1", text = "I should have, and now I do. That is why I send the young against the harpies first: they teach you to look up." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    threats = {
      lines = { { id = "threats_d", text = "The Palemane gnolls in the west, who steal what they cannot hunt, and the goblins of the Venture Company in the east, who take what they cannot buy. And in the north, the dwarves have opened a dig at Bael'dun, and they treat our land as if it had no owner." } },
      choices = {
        { text = "The dwarves are digging in Mulgore?", next = "threats_dwarves" },
        { text = "Enemies on every side.", next = "BACK", reply = "That is the way of the plains, and we have always lived it. The difference now is that we have a city to come home to." },
        { text = "Something else.", next = "BACK" },
      },
    },
    threats_dwarves = {
      lines = { { id = "threats_dwarves_d", text = "They are, and they mean to keep digging until someone stops them. The Bael'dun dwarves fire upon our braves when they come near, and the elders debate whether to drive them out by force, which tells you how much patience they have left." } },
      choices = {
        { text = "Then the elders should stop debating.", next = "BACK", reply = "You speak like a young warrior, and you may be right. But let the elders do their work first." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    tactics = {
      lines = { { id = "tactics_d", text = "Keep your back to rock, young one, so they cannot dive at you from behind. A harpy is quick and cruel but light in the bones, and one good blow will put her down, so wait for it and do not waste your strength on the air." } },
      choices = {
        { text = "Wait for the one good blow. I understand.", next = "tactics_patience" },
        { text = "That sounds like a lesson you learned the hard way.", next = "BACK", reply = "Every lesson worth teaching was learned that way. I only hope yours will come easier." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tactics_patience = {
      lines = { { id = "tactics_patience_d", text = "Good, for patience is the whole of it, in harpies and in everything else. A warrior who strikes at every shadow will tire before the real enemy comes, and the real enemy always comes last." } },
      choices = {
        { text = "I'll remember that beyond Mulgore.", next = "BACK", reply = "Do. My brother says I repeat it too often, but it has never once been wrong." },
        { text = "Another question.", next = "BACK" },
      },
    },
    pet_harpy = {
      lines = { { id = "pet_harpy_d", text = "It can, and gladly, but harpies fight from the air and your companion fights from the ground. Let your beast hold their attention while you strike, {class}, and keep it close, for a harpy will lead it away to the cliffs if she can." } },
      choices = {
        { text = "My companion won't wander.", next = "BACK", reply = "Then you have trained it well, and I'll trust your word." },
        { text = "Something else.", next = "BACK" },
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
        { text = "Patience with the young makes good warriors.", next = "BACK", reply = "It does, and I've seen the proof come back up this road a hundred times. A young brave who isn't laughed at tries again, and the one who tries again lives.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Failure should sting. That's how you learn.", next = "BACK", reply = "It stings well enough on its own, believe me, without my adding to it. I'd rather they learn from the sting than from my scorn.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ready = {
      lines = { { id = "r_default", text = "When you can fight something faster than you and come back with a lesson instead of just a wound. The Barrens and the Needles are beyond our hills, and they're not patient with fools, though the Earth Mother is." } },
      choices = {
        { text = "I'd rather learn than bleed.", next = "BACK", reply = "Then you're wiser than most who come through Bloodhoof. Keep that thought, and the Barrens will teach you gently, mostly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sometimes bleeding is how you learn.", next = "BACK", reply = "Sometimes it is, and I've the scars to prove it. Just make sure you bleed for the lesson and not for your pride.", fx = { align = { order = -1 } } },
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
    centaur = { { id = "tp_centaur", text = "The centaur were our oldest enemies, and they taught the tauren how to fight. I teach the young the same lessons, though I use the harpies instead." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback are a threat to the south of Mulgore, and the young braves must learn to face them. I would rather they learned from me first." } },
    cairne = { { id = "tp_cairne", text = "Cairne is the greatest warrior of our people, and the wisest. He taught me that strength is for protecting the herd, and I have never forgotten it." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gives us strength, and it is our duty to use it well. A warrior who fights for no reason is no warrior at all." } },
    _none = { { id = "tp_none", text = "I don't know of that. Ask in Thunder Bluff; my brother hears more than I do, and the elders more than both of us." } },
  },
}
