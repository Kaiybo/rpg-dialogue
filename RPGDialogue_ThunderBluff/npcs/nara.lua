-- Nara Wildmane, young druid in the Hall of Elders, haunted by the Druids of the Fang. Voice: bibles/nara.md
-- Fierce, restless and honest about her nightmares, she wants the Barrens healed and the faces out of her dreams.
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "nara", id = TODO_NPC("Nara Wildmane"), name = "Nara Wildmane",
  bible = "bibles/nara.md", role = "priest", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "fierce" }, values = { "nature", "brave" },
  notices = { "form", "class" },
  impression = {
    first = "Nara Wildmane is a young druid of the Hall of Elders with a fierce spirit and bad dreams. The four leaders of the Druids of the Fang haunt her sleep, and she wants them dead so the Barrens can heal.",
    third = "{name} met Nara Wildmane on the Elder Rise, a young druid haunted by the leaders of the Druids of the Fang.",
  },

  greetings = {
    { id = "g_hall", text = "Some truths only come to us in dreams, {class}, though lately I wish they'd find another door." },
    { id = "g_active", when = { questActive = TODO_QUEST("Leaders of the Fang") }, text = "Cobrahn, Anacondra, Pythas, Serpentis. Bring me their gems, and bring yourself back too." },
    { id = "g_done", when = { questDone = TODO_QUEST("Leaders of the Fang") }, text = "I slept through the night last night. I'd almost forgotten how." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone! I dreamed of you once while you were away, and you were somewhere green." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown stronger since you went into the caverns for me. I can feel it the way I feel weather coming." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The elders speak well of you, and they don't speak well of anyone young. Take it as a rare gift." },
  },

  notice = {
    { id = "n_form", cat = "form", when = { form = { "bear", "cat", "travel", "aquatic" } },
      text = "Changed shape and came to the Hall like that? Hamuul will scold you, and I'll pretend I didn't see." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "Another druid! Then you know what it is to dream with your eyes open. Be careful whose dreams you wander into." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Nara Wildmane. I study with the druids of the Hall of Elders, and I've been dreaming of the Barrens lately, though they aren't the kind of dreams you'd want." },
        { id = "h_sent", when = { questActive = TODO_QUEST("Nara Wildmane") },
          text = "Hamuul sent you to me? Then you've heard some of it already, and he trusts you, so I'll tell you the rest." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Leaders of the Fang") },
          text = "The Druids of the Fang in the Wailing Caverns are an aberration. They were part of a noble order that meant to heal the Barrens, and now they seek to remake that land to match their own twisted dreams, and I see their four faces every time I close my eyes." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Leaders of the Fang"), days = 3 } },
          text = "You did it, {name}. My dreams are free of their faces, and you've helped save the Barrens from a cursed future, so I thank you for myself, for the druids of Thunder Bluff, and for the land." },
        { id = "h_cleared", tags = { "news" }, when = { cleared = "Wailing Caverns" }, text = "You've been to the depths of the Wailing Caverns. Did you see Naralex? Did he look peaceful, or was he still trapped in the dream?" },
      },
      again = {
        { id = "h_again", text = "What else? I'm awake, at least, for now." },
        { id = "h_again2", text = "Ask. Talking keeps the dreams away." },
      },
      choices = {
        { text = "Who are the Druids of the Fang?", next = "fang" },
        { text = "What are your dreams like?", next = "dreams" },
        { text = "What's it like studying under Hamuul?", next = "hamuul" },
        { text = "I walk the dream too, sometimes.", next = "druid", when = { class = "DRUID" } },
        { text = "I've seen the caverns. Naralex still sleeps.", next = "naralex", when = { cleared = "Wailing Caverns" } },
        { text = "What can I do?", next = "BUSINESS" },
        { text = "Sleep well, Nara.", next = "END" },
      },
    },
    fang = {
      lines = { { id = "f_default", text = "Followers of a night elf druid named Naralex, who went into the caverns beneath the Barrens to heal the land through the Emerald Dream. Something went wrong down there, and Naralex fell into a sleep he can't wake from, and his followers turned." } },
      choices = {
        { text = "Turned how?", next = "turned", fx = { learn = { "wailing_caverns" } } },
        { text = "Something else, Nara.", next = "BACK", fx = { learn = { "wailing_caverns" } } },
      },
    },
    turned = {
      lines = { { id = "t_default", text = "They started dreaming his nightmare instead of their own dreams. Now they call themselves the Druids of the Fang, and they twist the caverns' beasts into serpents and raptors that obey them, and they think it's healing." } },
      choices = {
        { text = "Can they be saved?", next = "saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saved = {
      big = true,
      lines = { { id = "s_default", text = "Some of the lesser ones, maybe, if Naralex wakes. The four leaders, Cobrahn and Anacondra and Pythas and Serpentis, carry the nightmare in their dream gems, and I don't think anything is left in them to save." } },
      choices = {
        { text = "Then end them, and spare the rest if we can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They chose this. End them all.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dreams = {
      lines = { { id = "d_default", text = "I walk the Barrens in my sleep, and the grass is green and wrong, and four faces watch me from the water. Hamuul says it's the Dream reaching out, but it feels more like the Dream is reaching in." } },
      choices = {
        { text = "That sounds frightening.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Maybe the Dream is warning you.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    hamuul = {
      lines = { { id = "h2_default", text = "He's patient with me, which I don't always deserve. He studied with the night elves, the first of us to do it, and he tells me a druid's first duty is to listen, though I'd rather act." } },
      choices = {
        { text = "Acting without listening gets people killed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sometimes listening is just waiting too long.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then be careful in the Barrens. The Dream there is sick, and it'll follow you home if you let it, so wake up somewhere green when you can." } },
      choices = { { text = "I'll be careful.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } } },
    },
    naralex = {
      lines = { { id = "n_default", text = "Still sleeping, after everything. Then the nightmare isn't finished with him yet, and I'll keep dreaming about those caverns until it is." } },
      choices = { { text = "We'll find a way to wake him.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A druid of the Hall of Elders, young and impatient, or so Hamuul tells me. I'd say determined." } },
    advice = { { id = "tp_ad", text = "Pay attention to your dreams. They're often trying to tell you something you already know." } },
    wailing_caverns = { { id = "tp_wc", text = "Beneath the Barrens, where Naralex sleeps. Don't go down there alone, and don't drink the water.", next = "fang" },
      { id = "tp_wc2", text = "The caverns were meant to be the start of healing the Barrens. Now they're the sickness at its heart." } },
    cenarion_circle = { { id = "tp_cc", text = "The druids of the night elves and of the tauren, together. Hamuul believes in it with his whole heart, and I'm starting to." } },
    _none = { { id = "tp_none", text = "I haven't dreamed of that one. Ask Hamuul; he knows more than any of us." } },
  },
}
