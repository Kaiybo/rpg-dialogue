-- Wailing Caverns: Naralex himself, waking from the nightmare at the end of the escort, and
-- Lady Anacondra, the Druid of the Fang who speaks before she strikes. (The Disciple of Naralex
-- lives in RPGDialogue_Barrens.)
-- Voices: bibles/dg_naralex.md, bibles/dg_anacondra.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Naralex: the night elf druid whose dream turned to nightmare beneath the Barrens.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_naralex", id = TODO_NPC("Naralex"), name = "Naralex",
  bible = "bibles/dg_naralex.md", role = "story", tier = "major",
  temper = { "gentle", "haunted" }, values = { "wise", "faithful" },
  notices = { "class", "race" },
  impression = {
    first = "He looks thin and dazed, like a man surfacing from deep water.",
    third = "{name} helped wake Naralex from his nightmare in the Wailing Caverns.",
  },

  greetings = {
    { id = "g_default", text = "Is this real? The stone is cold and wet under my hands, so I think it must be. Thank you, whoever you are." },
    { id = "g_leaders", when = { questActive = TODO_QUEST("Leaders of the Fang") }, text = "You carry the smell of the Fang on you. Cobrahn, Anacondra, Pythas, Serpentis... they followed me down here, and I led them into this." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. I still wake some nights unsure which world I'm in, so your face helps." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Listen to me, then, as one of the Circle to another: the Dream is not safe anymore. Something in it is sick." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of the Kaldorei, so far from the forest. You'll know my teacher's name, then, for I studied under Malfurion like so many of us." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your shamans warned me the land here was wounded in ways I didn't understand. I should have listened more carefully." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Naralex, of the Cenarion Circle. I came to the Barrens to heal it, and I went into the Emerald Dream to find the strength for it. I don't know how long I slept." },
        { id = "h_druid", when = { class = "DRUID" }, text = "You walk the same path I did, so let my mistake be a lesson. I reached too deep and too fast, and the Dream reached back." },
      },
      again = {
        { id = "h_again", text = "Ask me what you will. Speaking helps me remember which world is which." },
      },
      choices = {
        { text = "What did you see in the Dream?", next = "nightmare" },
        { text = "Your disciples became the Druids of the Fang.", next = "fang" },
        { text = "Why did you come to the Barrens?", next = "barrens" },
        { text = "What happens now that you're awake?", next = "now" },
        { text = "Rest, Naralex. I'll go.", next = "END" },
      },
    },
    nightmare = {
      lines = { { id = "n_default", text = "At first, only beauty, the world as it was meant to be, green and endless. Then the green began to rot at the edges, and voices I couldn't see started whispering that I would never leave." } },
      choices = {
        { text = "Whose voices were they?", next = "voices" },
        { text = "Something else.", next = "BACK" },
      },
    },
    voices = {
      lines = { { id = "v_default", text = "I don't know, and that frightens me more than anything I saw. Something has taken root in the Dream, and it is clever enough to wear the shape of what you love." } },
      choices = {
        { text = "The Circle must be warned at once.", next = "BACK", reply = "Yes. I'll go to Moonglade when I can stand, and I'll tell Remulos everything. You've given me the chance to do that, at least.", fx = { align = { order = 1 }, learn = { "nightmare" } } },
        { text = "Maybe the Dream should be left alone.", next = "BACK", reply = "Perhaps, but the Dream doesn't leave us alone. You've seen what it did to the beasts here, and that was only one sleeper's nightmare.", fx = { align = { order = -1 }, learn = { "nightmare" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fang = {
      lines = { { id = "f_default", text = "They were my friends and my students, and they followed me in hoping to share my vision. The nightmare found them weaker than me and took them whole, and they turned what I meant as healing into a hunt." } },
      choices = {
        { text = "They chose their path. It isn't your fault.", next = "BACK", reply = "You're kind to say it, but I opened the door they walked through. I'll carry that, and I'll try to deserve the forgiveness you're offering.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You led them here. You owe them.", next = "BACK", reply = "I do, and I won't argue. If any of them can still be saved, I'll spend the rest of my life trying.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    barrens = {
      lines = { { id = "b_default", text = "This land was green once, before the Sundering and before war after war stripped it. I found springs in these caverns that still remembered, and I thought I could coax them into singing again." } },
      choices = {
        { text = "Can the Barrens still be healed?", next = "heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal = {
      lines = { { id = "hl_default", text = "I believe so, but slowly, and not by one druid dreaming alone in the dark. It will need tauren and night elves and anyone else willing to plant and wait. That's a lesson I learned too late." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    now = {
      lines = { { id = "nw_default", text = "Now I find my disciples who are still themselves and tell them they waited for a reason. After that, I go to Moonglade, if my legs will carry me, and I never sleep that deeply again." } },
      choices = {
        { text = "I'm glad we reached you in time.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    nightmare = { { id = "tp_nm", text = "The sickness in the Dream. I've no better name for it yet.", next = "nightmare" } },
    wailing_caverns = { { id = "tp_wc", text = "These caverns were meant to be the heart of a reborn Barrens, and I made them a nest of nightmares instead." } },
    _none = { { id = "tp_none", text = "Forgive me, my mind is still half in the Dream. I can't speak to that." } },
  },
}

---------------------------------------------------------------------------
-- Lady Anacondra: a Druid of the Fang, once Naralex's disciple, now his nightmare's guardian.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_anacondra", id = TODO_NPC("Lady Anacondra"), name = "Lady Anacondra", title = "Druid of the Fang",
  bible = "bibles/dg_anacondra.md", role = "boss", tier = "quest",
  temper = { "cold", "possessive" }, values = { "faithful", "proud" },
  notices = { "class" },
  impression = {
    first = "She speaks softly, like someone singing a sleeping child to rest.",
    third = "{name} faced Lady Anacondra, a Druid of the Fang, in the Wailing Caverns.",
  },

  greetings = {
    { id = "g_default", text = "Hush. You'll wake the beasts, and worse, you'll wake him." },
    { id = "g_leaders", when = { questActive = TODO_QUEST("Leaders of the Fang") }, text = "Nara sent you for my gem, didn't she? She never understood the Dream, and now she sends killers to do her understanding for her." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You could join us, you know. The Dream is so much sweeter when you stop fighting it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Anacondra, and I keep the Dream for my master. He sleeps so that the Barrens may be remade, and I'll let nobody disturb him before the remaking is done." },
      },
      again = { { id = "h_again", text = "Still here? The serpents are getting restless." } },
      choices = {
        { text = "Naralex is trapped, not dreaming.", next = "trapped" },
        { text = "What happened to you down here?", next = "changed" },
        { text = "Ebru still remembers you.", next = "ebru" },
        { text = "Then we fight.", next = "END" },
      },
    },
    trapped = {
      lines = { { id = "t_default", text = "Trapped? He's free, freer than any of us ever were awake. The beasts grow strong, the plants grow wild, and soon the whole Barrens will be as green and hungry as these caves." } },
      choices = {
        { text = "That isn't healing. It's sickness.", next = "BACK", reply = "Spoken like someone who's never heard the Dream sing. I pity you.", fx = { align = { order = 1 } } },
        { text = "Wild and strong sounds better than dead.", next = "BACK", reply = "You see it! Perhaps I won't kill you quickly after all.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = { { id = "c_default", text = "Nothing happened. I simply woke up. The others are still asleep up there, praying and fretting, while I learned to hear what the Dream really wants." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ebru = {
      lines = { { id = "e_default", text = "Ebru. I taught her every herb in Ashenvale once, and she never learned to listen past their names. Tell her... no, tell her nothing. She'll come down here eventually, like all of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Hush. That doesn't matter to the Dream." } },
  },
}
