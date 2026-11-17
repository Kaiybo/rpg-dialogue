-- Maurin Bonesplitter, Forsaken scholar of the Burning Blade at Ghost Walker Post (0.72.0). Voice: bibles/maurin.md
-- Classic: Alliance Relations (sends to Keldran), The Burning of Spirits, The Corrupter (Lord Azrethoc).
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "maurin", id = TODO_NPC("Maurin Bonesplitter"), name = "Maurin Bonesplitter",
  bible = "bibles/maurin.md", role = "scholar", tier = "quest",
  communities = { "ghost_walker" }, temper = { "cold", "contemptuous" }, values = { "knowledge", "loyal" },
  notices = { "arcane", "race" },
  impression = {
    first = "Maurin Bonesplitter despises the Burning Blade less for serving demons than for not understanding them. He is a cold, precise thing, and the orcs at Ghost Walker Post are glad of him and keep their distance.",
    third = "{name} met Maurin Bonesplitter, a Forsaken spellcaster sent to Ghost Walker Post by Keldran to undo the Burning Blade in Desolace.",
  },

  greetings = {
    { id = "g_hello", text = "Be still a moment, {class}. I was counting something, and I would rather not begin again." },
    { id = "g_gems", when = { questActive = TODO_QUEST("The Burning of Spirits") }, text = "Activate the gem only when they are close to death, or it will be useless. I made the magic simple; do not make it difficult." },
    { id = "g_corrupter", when = { questActive = TODO_QUEST("The Corrupter") }, text = "Azrethoc's contract was signed in a hand older than his servants know. Its maker must be found." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Corrupter") }, text = "Azrethoc is gone, and the Blade has lost the hand that held its leash. They will not understand what they have lost, which is the pleasing part." },
    { id = "g_away", when = { away = 14 }, text = "You have been gone {away}, and though the dead do not notice time as you do, I noticed your absence, which should flatter you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown more dangerous since I first gave you that gem. Good; Desolace rewards nothing else." },
  },

  notice = {
    { id = "n_lock", cat = "arcane", when = { class = "WARLOCK" },
      text = "A warlock of the Horde, and not the Blade's sort. Keep your demon on a short chain here, because the orcs cannot always tell the difference, and I cannot always be bothered to explain it." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of us, so far from the Undercity. Do the living here still flinch when you pass? Let them; it keeps the conversations short." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Maurin Bonesplitter. Keldran sent me to Desolace because I know the Burning Blade and its magics better than its own warlocks do, and I am here to see the cult undone." },
        { id = "h_relations", when = { questBefore = TODO_QUEST("Alliance Relations") },
          text = "Allow me to tell you something important to our Horde, though far from obvious. Our Warchief is a diplomat at heart, and there is a man in Orgrimmar named Keldran who can tell you what that means for us here." },
        { id = "h_burning_before", when = { questBefore = TODO_QUEST("The Burning of Spirits"), questDone = TODO_QUEST("Alliance Relations") },
          text = "Death is too kind for those who turned their backs on their liege for a demon's favour. Take this gem; when one of the Blade lies close to death, activate it, and it will pull the corrupted spirit out and leave a gem behind." },
        { id = "h_burning_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Burning of Spirits"), days = 3 } },
          text = "You have returned successful, and I shall put these somewhere safe, which is not a place I will tell you. Speak to Takata when you are rested; he may have other work." },
        { id = "h_corrupter", tags = { "news" }, when = { questActive = TODO_QUEST("The Corrupter") },
          text = "These runes are an old language, close to the Eredun tongue but drastically different, and this is a contract. The signature at the bottom belongs to a demon: Lord Azrethoc." },
        { id = "h_corrupter_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Corrupter"), days = 3 } },
          text = "His apparition came for me once, and it was only a shadow, and still it was more than I wished to meet. You met the substance, and you came back. I find that I am impressed." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, looking at me as your people always do, as though I were a sickness on the land. I am, perhaps, but I am the Horde's sickness, and I am pointed at its enemies." },
      },
      again = {
        { id = "h_again", text = "What else? Ask it precisely, and I will answer the same way." },
        { id = "h_again2", text = "Continue. I have a great deal of time, though I prefer not to waste it." },
      },
      choices = {
        { text = "What makes the Burning Blade weak?", next = "blade" },
        { text = "What do the gems do to their spirits?", next = "gems", when = { questDone = TODO_QUEST("Alliance Relations") } },
        { text = "Keldran trusting a Forsaken surprises me.", next = "keldran" },
        { text = "Tell me about Azrethoc's contract.", next = "contract", when = { any = { { questActive = TODO_QUEST("The Corrupter") }, { questDone = TODO_QUEST("The Corrupter") } } } },
        { text = "I'm a warlock too. How is my power different from theirs?", next = "warlock_m", when = { class = "WARLOCK" } },
        { text = "What would you have me do?", next = "BUSINESS" },
        { text = "Farewell, Maurin.", next = "END" },
      },
    },

    blade = {
      lines = {
        { id = "bl_default", text = "Their magics are pathetic and their strength is feeble, because their only power comes from those they serve. They mumble words they do not understand to masters who do not care for them." },
      },
      choices = {
        { text = "And you understand those words?", next = "blade_understand" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    blade_understand = {
      lines = {
        { id = "bu_default", text = "Enough of them to know which ones bite. That is why I am useful to the Warchief, and why the orcs here keep their distance from me; they are not fools." },
      },
      choices = {
        { text = "Where did you learn them?", next = "blade_learn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade_learn = {
      big = true,
      lines = {
        { id = "bl2_default", text = "In death, and in the Undercity's libraries afterwards, and that is all you will hear of it. Knowledge does not care where it was found, {class}, only how it is used." },
      },
      choices = {
        { text = "Some knowledge is too dangerous to keep.", next = "BACK", fx = { align = { light = 1 }, opinion = { necromancy = "dangerous" } } },
        { text = "Any weapon is worth having against our enemies.", next = "BACK", fx = { align = { light = -1 }, opinion = { necromancy = "useful" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gems = {
      lines = {
        { id = "ge_default", text = "They draw out what the demons have put into a cultist, the corrupted part, and hold it fast in stone. What remains dies, and dies cleaner than it lived." },
      },
      choices = {
        { text = "The gems themselves must go somewhere.", next = "gems_kept" },
        { text = "Isn't that necromancy?", next = "necro_op" },
        { text = "Something else.", next = "BACK" },
      },
    },
    necro_op = {
      lines = { { id = "ne_default", text = "It is, and I make no apology for the word. The Scourge use the same arts to chain the dead, and I use them to unmake the Blade, so tell me, {class}: does the tool make the crime, or the hand?" } },
      choices = {
        { text = "The hand. Turned on our enemies, it's justice.", next = "ne_hand", fx = { affinity = 2, align = { light = -1 }, opinion = { necromancy = "useful" } } },
        { text = "The tool. Necromancy is rot, whoever holds it.", next = "ne_tool", fx = { affinity = -2, align = { light = 1 }, opinion = { necromancy = "wrong" } } },
        { text = "Both. I'll fight beside you, but I'll watch you.", next = "ne_both", fx = { affinity = 1, trait = { skeptical = 1 }, opinion = { necromancy = "dangerous" } } },
        { text = "It made us. We may as well master it.", next = "ne_undead", when = { race = "Scourge" }, fx = { affinity = 1, opinion = { necromancy = "master" } } },
        { text = "Something else, Maurin.", next = "BACK" },
      },
    },
    ne_hand = {
      lines = { { id = "neh_default", text = "Precisely. You would do well in the Undercity, where that answer is taught to apprentices before they are allowed to touch a scalpel." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ne_tool = {
      lines = { { id = "net_default", text = "Then you will forgive me if I do not ask you to carry the gems. Rot is what the Blade made of itself; I merely sweep it up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ne_both = {
      lines = { { id = "neb_default", text = "Good. Watch me closely, then, and you may learn something, which is more than the orcs here manage." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ne_undead = {
      lines = { { id = "neu_default", text = "A sensible child of the Dark Lady. Mastery is the only answer to what was done to us, and the Lich King will learn it in time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gems_kept = {
      big = true,
      lines = {
        { id = "gk_default", text = "I dispose of them properly, which is a phrase I chose with care. Do not ask me what properly means, because you would not like the answer, and it would not change your work." },
      },
      choices = {
        { text = "I don't need to know. The cult dies either way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather know what I'm helping you do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    keldran = {
      lines = {
        { id = "ke_default", text = "Keldran trusts usefulness, and I am very useful. The Warchief learned from the humans that how the Horde appears matters, and a Horde that hunts its own traitors appears well to everyone." },
      },
      choices = {
        { text = "And what do you get from it?", next = "keldran_get" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keldran_get = {
      lines = {
        { id = "kg_default", text = "A purpose, and a place for my people at the Warchief's table that we did not have before. The Dark Lady values both, {class}, and so do I." },
      },
      choices = {
        { text = "That's honest of you.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Farewell, Maurin.", next = "END" },
      },
    },

    contract = {
      lines = {
        { id = "co_default", text = "A flayed skin, inked in a language older than the Blade's and kin to the Eredun tongue, binding the cult's warlocks to Lord Azrethoc. They signed away more than they knew, as servants of demons always do." },
      },
      choices = {
        { text = "Could the contract be broken instead?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_legion" } } },
      },
    },
    warlock_m = {
      lines = {
        { id = "wm_default", text = "You command your demons, and they beg theirs. Keep it that way, and you will never end up as a gem in my satchel." },
      },
      choices = {
        { text = "I intend to.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I died, and I learned, and now I serve. The order of those matters more than the details." } },
    advice = { { id = "tp_ad", text = "Never sign anything a demon offers you, however it is phrased. The Blade's warlocks are a lesson written in their own skin." } },
    burning_blade = { { id = "tp_blade", text = "A cult of traitors who mistake obedience for power. I will see them ended.", next = "blade" } },
    scourge = { { id = "tp_scourge", text = "I served the Scourge once, and I remember all of it, which is the worst of what I can tell you. The Lich King's grip was cold and clear, and the Burning Blade's demons are crude by comparison." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are what is left when you pull a puppet's strings and it walks off on its own. We owe nothing to anyone, and the Dark Lady is the only one who understands that." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady freed us when the Lich King's power faltered, and she has a plan for Lordaeron. I do not need to know it to serve it." } },
    burning_legion = {
      { id = "tp_burning_legion", text = "The Legion is an old power and a patient one, and these orcs who bargain with it are children playing with knives. I study them so that I know where to cut." },
      { id = "tp_burning_legion2", when = { race = "Scourge" }, text = "You and I know what it is to belong to something greater and colder than ourselves. The warlocks of the Burning Blade want that, and they deserve what they will get." },
    },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was a necromancer of Dalaran, and now he is the Lich King's voice in the plaguelands. His work is meticulous, and I would very much like to see it unmade." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a useful ally to the Dark Lady, and the orcs here are courteous enough. They keep their distance from me, which I appreciate." } },
    _none = { { id = "tp_none", text = "I do not know, and I do not guess. Ask Takata; he guesses for a living." } },
  },
}
