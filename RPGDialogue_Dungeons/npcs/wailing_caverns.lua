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
        { text = "Something huge burst out of the water as you woke.", next = "mutanus" },
        { text = "Your disciple waited at the entrance all this time.", next = "disciple" },
        { text = "How does a druid tell the Dream is turning?", next = "druid_warn", when = { class = "DRUID" } },
        { text = "Does Malfurion know what happened to you?", next = "malfurion", when = { race = "NightElf" } },
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
      choices = {
        { text = "Tauren and night elves, working together?", next = "heal_together" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal_together = {
      lines = { { id = "ht_default", text = "Why not? The tauren have walked with Cenarius' teachings longer than many of my own people would admit, and the land doesn't care whose banner the planter carries. It's only our wars that care." } },
      choices = {
        { text = "The land should come before any war.", next = "BACK", reply = "Then you'd make a better druid than I did, friend. Hold to that when someone hands you a reason to forget it.", fx = { align = { order = -1 } } },
        { text = "The Alliance and Horde have their reasons for war.", next = "BACK", reply = "They do, and I won't pretend those reasons are empty. I only wish the springs didn't have to pay for them.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mutanus = {
      narr = "He shudders and pulls his robe tighter about his shoulders.",
      lines = { { id = "mu_default", text = "Mutanus the Devourer. I think the nightmare shaped him out of everything I feared down here, and when I began to wake, he came to keep me sleeping. If he's dead, then something in me is quieter for it." } },
      choices = {
        { text = "Was he real, or only part of the dream?", next = "mutanus_real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mutanus_real = {
      lines = { { id = "mr_default", text = "Real enough to bleed, you saw that yourself. That's what frightens me most, that a dream can leak out and take on flesh and teeth. I don't know what that means for the rest of the world's sleepers." } },
      choices = {
        { text = "Then other sleepers may be in danger.", next = "mutanus_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mutanus_others = {
      lines = { { id = "mo_default", text = "Many of my order dream for years at a time, and some of them have not woken on schedule. I pray I'm wrong, but I'll be saying so to the Circle all the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    disciple = {
      lines = { { id = "di_default", text = "He did? Faithful soul, he must have sat by that mouth of stone and listened to me scream in my sleep for months. I'll thank him on my knees when I see him." } },
      choices = {
        { text = "He needed strangers to do what he couldn't.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_warn = {
      lines = { { id = "dw_default", text = "The colours go too bright, and the animals stop looking at you as a friend. If you feel the Dream holding on when you try to leave, don't push deeper to find the cause. Come back at once, and tell someone." } },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    malfurion = {
      lines = { { id = "ml_default", text = "My shan'do sleeps in the barrow dens with the eldest of the Circle and walks the Dream far deeper than I ever dared. If anyone has felt this sickness, he has, and that thought gives me no comfort at all." } },
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
