-- Oben Rageclaw, the spirit of a sleeping druid in the Ban'ethil Barrow Den (0.72.0). Voice: bibles/oben.md
-- Classic: The Sleeping Druid, Druid of the Claw. The Gnarlpine shaman walk his body; his spirit is cut off in the Dream.
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "oben", id = TODO_NPC("Oben Rageclaw"), name = "Oben Rageclaw",
  bible = "bibles/oben.md", role = "questgiver", tier = "quest",
  communities = { "teldrassil_wilds" }, temper = { "calm", "wry" }, values = { "duty", "nature" },
  notices = { "form", "class" },
  impression = {
    first = "Oben Rageclaw is a druid's spirit cut loose from his own body, watching furbolgs walk it about like a puppet. He asked me to destroy it so he could rest, and he managed a joke while he asked.",
    third = "{name} met the spirit of Oben Rageclaw, a druid of the claw whose sleeping body the Gnarlpine shaman had stolen.",
  },

  greetings = {
    { id = "g_hello", text = "You can see me, then. Good, because I have been shouting at furbolgs for days and they never listen." },
    { id = "g_charm", when = { questActive = TODO_QUEST("The Sleeping Druid") }, text = "The shaman carry the charm on their belts. Bring me one, and let us see what holds my body to them." },
    { id = "g_body", when = { questActive = TODO_QUEST("Druid of the Claw") }, text = "My body is in the deepest chamber, wearing my claws and doing the shaman's bidding. Do not hesitate on my account." },
    { id = "g_free", when = { questDone = TODO_QUEST("Druid of the Claw") }, text = "Still here, a little longer, though the Dream pulls at me now. Thank you, friend; I can feel the way home." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, were you? Time is strange for a spirit, so I will take your word for it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You have grown strong since you came down into this barrow. I wish I could still clap a friend on the shoulder." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Careful, wearing that shape down here! The last bear in this den with a druid inside it was me, and look how that turned out." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Do not try to put me to rest with prayers, please; it tickles, and it will not work while my body still walks." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Oben Rageclaw, a druid of the claw, and I was sleeping here with my brothers when the Gnarlpine shaman found a way to pull my spirit from my body. Now they walk it about the den and set it on anyone who comes in." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Sleeping Druid") },
          text = "The shaman carry a strange charm for their ritual, and I would like to examine one. If I can see how it was done, I may see how it can be undone." },
        { id = "h_charm_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Sleeping Druid"), days = 3 } },
          text = "This charm reeks of a vile enchantment, stronger than I hoped. I cannot break it from here, which leaves us only one cure, and you will not like it." },
        { id = "h_claw", tags = { "news" }, when = { questActive = TODO_QUEST("Druid of the Claw") },
          text = "Destroy my body, friend. While it lives, the shaman hold my spirit outside the Dream, and I would rather be free than whole." },
        { id = "h_free", tags = { "news" }, when = { questRecent = { TODO_QUEST("Druid of the Claw"), days = 3 } },
          text = "It is done, and I felt it go like a cold weight lifted from my chest. The Dream is calling, and I can answer it at last." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "One of the Circle, come into the barrow! Mind the shaman, because they would take your bear's shape for their own if they could, the same as they took mine." },
      },
      again = {
        { id = "h_again", text = "Ask what you like. I am in no hurry, which is the one advantage of being dead-ish." },
        { id = "h_again2", text = "Go on, friend; spirits have time for conversation." },
      },
      choices = {
        { text = "How did the shaman take your body from you?", next = "ritual" },
        { text = "It must be strange, being caught outside the Dream.", next = "dream" },
        { text = "Why were you sleeping here?", next = "sleepers" },
        { text = "You really want me to kill your body?", next = "body", when = { any = { { questActive = TODO_QUEST("Druid of the Claw") }, { questDone = TODO_QUEST("The Sleeping Druid") } } } },
        { text = "Could this happen to me?", next = "druid_o", when = { class = "DRUID" } },
        { text = "What do you need from me?", next = "BUSINESS" },
        { text = "Rest easy, Oben.", next = "END" },
      },
    },

    ritual = {
      lines = {
        { id = "ri_default", text = "While we sleep, our spirits walk the Dream and our bodies lie empty, and the shaman found a way to slip into the space I left. I woke in the Dream with my body gone from under me, like a man who comes home to find the door barred." },
      },
      choices = {
        { text = "Who taught furbolg shaman a ritual like that?", next = "ritual_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ritual_who = {
      lines = {
        { id = "rw_default", text = "No one I know, and that frightens me more than the furbolgs do. The Gnarlpine were never this clever before the fel moss came, and something has been whispering to them." },
      },
      choices = {
        { text = "Then whatever whispers to them is the real enemy.", next = "ritual_end" },
        { text = "Something else.", next = "BACK", fx = { learn = { "fel_moss" } } },
      },
    },
    ritual_end = {
      big = true,
      lines = {
        { id = "re_default", text = "Yes, and Athridas in Dolanaar suspects the same, so tell him what you saw here. As for the shaman, they are only fools holding a knife someone else sharpened." },
      },
      choices = {
        { text = "Fools with knives still need stopping.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then I'll spare the shaman I can.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },

    dream = {
      lines = {
        { id = "dr_default", text = "It is like standing at a window, with the whole green world of the Dream on the other side of the glass. I can see my brothers sleeping there, and I cannot reach them." },
      },
      choices = {
        { text = "I'm sorry, Oben.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "I'd have thought they could help you from inside it.", next = "dream_help" },
      },
    },
    dream_help = {
      lines = {
        { id = "dh_default", text = "They are deep in Ysera's realm and the paths there are long. By the time one of them noticed I was missing, the shaman would have worn my body to rags." },
      },
      choices = {
        { text = "Then it falls to me.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sleepers = {
      lines = {
        { id = "sp_default", text = "Some of the Circle sleep for long years by Ysera's leave, keeping watch in the Dream, and the barrow dens keep our bodies safe while we do. Gaerolas Talvethren guards us, and he will be heartsick that this happened on his watch." },
      },
      choices = {
        { text = "The Gnarlpine wounded Gaerolas too, out at his post.", next = "sleepers_gaerolas", when = { questDone = TODO_QUEST("A Troubling Breeze") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sleepers_gaerolas = {
      lines = {
        { id = "sg_default", text = "Then the trouble is wider than one barrow. Tell him it was no fault of his, if you see him, because he will not believe it from himself." },
      },
      choices = {
        { text = "I'll tell him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Goodbye, Oben.", next = "END" },
      },
    },

    body = {
      big = true,
      lines = {
        { id = "bo_default", text = "I do, and I have thought on it longer than you would think. A body that hurts the people I swore to protect is not mine any longer, whatever face it wears." },
      },
      choices = {
        { text = "Then I'll do it quickly, and with respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A body's a body. It won't trouble me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "There must be some other way.", next = "body_other" },
      },
    },
    body_other = {
      lines = {
        { id = "bot_default", text = "If there were, I would have found it while you were fetching that charm. Do not grieve for me, friend, because I am going somewhere green." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Goodbye, Oben.", next = "END" },
      },
    },
    druid_o = {
      lines = {
        { id = "do_default", text = "Only if you sleep where furbolg shaman can reach you, and I hope that lesson is learned now. When the Circle asks you to walk the Dream, make sure someone with a sword is sitting beside you." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A druid of the claw who took a long nap in the wrong barrow. That is the short version, and the long one is mostly snoring." } },
    advice = { { id = "tp_ad", text = "Never leave your body unattended. I mean it more plainly than most people who say it." } },
    furbolgs = { { id = "tp_furbolgs", text = "The shaman are the ones to watch, because the warriors only do what the shaman tell them. Take the charm off a shaman and you take away half his tribe's mischief." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle keeps the balance, and some of us keep it by sleeping, which sounds easier than it is." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "I was in the Dream when the Gnarlpine trapped me in my sleep, and I can tell you it is far nicer than a barrow. The food in both is terrible." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are a sensible clan, the only one left, and if I'd napped on their ground instead I'd have been fine. Lesson learned, and slowly, as I do everything." } },
    nordrassil = { { id = "tp_nordrassil", text = "The first tree, on Hyjal. I slept under it for a few centuries once, and I recommend it far more than a barrow full of Gnarlpine." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's children watch over the Dream, and they've nudged me awake more than once when I wandered too deep. Very polite dragons, for dragons." } },
    _none = { { id = "tp_none", text = "I cannot say, friend. I slept in the Dream for a very long time, and the world went on without me." } },
  },
}
