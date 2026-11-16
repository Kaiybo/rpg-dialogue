-- Deathknell: where the Forsaken wake. Voice: bibles/tirisfal.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mordo", id = TODO_NPC("Undertaker Mordo"), name = "Undertaker Mordo",
  bible = "bibles/tirisfal.md", role = "worker", tier = "quest",
  communities = { "deathknell" }, temper = { "matter_of_fact" }, values = { "practical" },
  notices = { "greenness" },
  impression = {
    first = "Undertaker Mordo tends the graves at Deathknell and greets the newly risen with a matter-of-fact kindness. He buries things, he says, and leaves the explaining to others.",
    third = "{name} met Undertaker Mordo, who tends the graves of Deathknell and welcomes those who rise from them.",
  },

  greetings = {
    { id = "g_grave", text = "Ah, you're up. Sit a moment if you need to; the first few minutes are the strangest." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still yourself. That's a fine sign." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 2 },
      text = "Go on, look at your hands. Yes, they're yours, and no, they won't get better, but you'll stop minding." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Undertaker Mordo. I tend the graves here, and sometimes the graves tend to stir, as you did. Welcome back." },
        { id = "h_rude", tags = { "news" }, when = { questActive = TODO_QUEST("Rude Awakening") },
          text = "Shadow Priest Sarvis will explain the rest. He's in the chapel. Try not to stare at the others; they're new too." },
      },
      choices = {
        { text = "My hands still know a sword. Is that normal?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I remember the Scourge's voice, Mordo.", next = "remember", when = { origin = "forsaken_scourge_remembered" } },
        { text = "What happened to me?", next = "what" },
        { text = "I'll find Sarvis.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? Take your time; the graves aren't going anywhere." },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Perfectly normal. The hands remember longer than the head does, and I've watched a fellow who couldn't recall his own name pick up a shovel and dig a perfect grave. Arren will be glad of whatever your hands remember." } },
      choices = { { text = "Then I'll go to Arren.", next = "BACK", fx = { affinity = 1 } } },
    },
    remember = {
      lines = { { id = "re_default", text = "Some do, and those ones dig the deepest when I hand them a shovel, I notice. It's quiet in your head now, isn't it? Hold on to that quiet, and don't go looking for the voice again." } },
      choices = {
        { text = "I'll never answer it again.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Sometimes I miss knowing what to do.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    what = {
      big = true,
      lines = {
        { id = "w_default", text = "The plague took you, and the Scourge raised you. The Dark Lady broke their hold, so now you're your own again. Mostly." },
      },
      choices = { { text = "Mostly?", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I bury things; I don't explain them. Ask Sarvis." } },
  },
}

P:NPC {
  key = "sarvis", id = TODO_NPC("Shadow Priest Sarvis"), name = "Shadow Priest Sarvis",
  bible = "bibles/tirisfal.md", role = "priest", tier = "major",
  communities = { "deathknell" }, temper = { "sardonic" }, values = { "loyal", "sharp" },
  notices = { "class" },
  impression = {
    first = "Having died once already, Shadow Priest Sarvis finds it hard to take death seriously. His humour is dry as grave dust, and the Light plainly makes him uneasy.",
    third = "{name} met Shadow Priest Sarvis, the sardonic voice of the Forsaken in Deathknell, who serves the Dark Lady alone.",
  },

  greetings = {
    { id = "g_chapel", text = "Another one walks in under their own power. Splendid. Death couldn't keep you, so let's see what you're good for." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? Death seems to suit you." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I'll admit the Light makes me uneasy, though it used to make me feel safe, so step back a little while you're glowing, if you don't mind." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Whatever you prayed to before, it didn't save you, and the shadows were here when you woke. Think about that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Shadow Priest Sarvis. We Forsaken have already died once, and it's hard to take death seriously after that." },
        { id = "h_mindless", tags = { "news" }, when = { questActive = TODO_QUEST("The Mindless Ones") },
          text = "Not everyone wakes as themselves. The mindless shamble about the graves. Put them back down; they're past helping." },
        { id = "h_rattle", when = { questActive = TODO_QUEST("Rattling the Rattlecages") },
          text = "Rattlecage skeletons wander the fields, Scourge leftovers. Break them; they won't mind." },
        { id = "h_path", when = { questActive = TODO_QUEST("A Difficult Path") },
          text = "A scroll came for you, and it reeks of the Light. Read it over there, please, not here, and then go to Aramis." },
      },
      choices = {
        { text = "I woke with a sword arm and no prayers, Sarvis.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Who are the Forsaken?", next = "forsaken" },
        { text = "The Light still answers me, Sarvis.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I deal in fel and shadow, like you.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I studied magic in life. Does it still matter?", next = "mage", when = { class = "MAGE" } },
        { text = "I'd rather work from the shadows.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll get to work.", next = "END" },
      },
      again = {
        { id = "h_again", text = "More questions? Death has made you chatty. Go on." },
        { id = "h_again2", text = "Yes? I have eternity, more or less, so I suppose I can spare a minute." },
      },
    },
    paladin = {
      big = true,
      lines = {
        { id = "pa_default", text = "So I've noticed, and so has my skin. I prayed to that Light my whole life, and it let the plague take me anyway; then it lets you keep it after death. Forgive me if I find the Light's sense of humor harder to love than mine." },
        { id = "pa_knight", when = { origin = "forsaken_risen_knight" },
          text = "A knight of the Silver Hand, risen. Uther's own order, and the prince who killed him is the one who made you. If the Light can stomach that irony, I suppose I can." },
      },
      choices = {
        { text = "It never left. We left it, and I came back.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "I use it because it hurts the living. Nothing more.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Who taught you the shadow, then?", next = "paladin_shadow" },
      },
    },
    paladin_shadow = {
      lines = { { id = "ps_default", text = "Nobody. I woke in the dark, and it was there, and it answered when I called. The Light had to be begged; the shadow simply listened, and I'm too tired to beg anymore. Go to Aramis; he still has the patience for begging." } },
      choices = { { text = "I'll go to Aramis.", next = "BACK" } },
    },
    warlock = {
      lines = {
        { id = "wl_default", text = "Like me? Not at all, friend. I listen to the dark; you make bargains with things that live in it, and they always want something back. Keep your contracts short and your imp on a leash." },
        { id = "wl_cult", when = { origin = "forsaken_cult_remnant" },
          text = "You knelt to the Cult before you died, didn't you? I can always tell; the Cult's people stand a little too comfortably near the Scourge's leftovers. Don't let the old habits drag you back." },
      },
      choices = {
        { text = "My bargains serve the Dark Lady, no one else.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My bargains serve me. That's the point of freedom.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "It matters more than ever. The mind is the one thing the plague didn't rot, and a mage is mostly mind. Mind you, the Kirin Tor won't have you back, so you'll have to find your books in the Undercity now." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "Dalaran's apprentices took the plague as badly as anyone, and better than most, since they at least had the sense to read about it first. Go to Bethor Iceshard in the Undercity when you're ready; he'll remember your masters." },
      },
      choices = { { text = "Then I'll find my books.", next = "BACK", fx = { affinity = 1 } } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Most of us would, now; the sunlight is unkind to our complexions. The Dark Lady's deathstalkers will want to see you, eventually. Until then, practice on the mindless; they never notice anything." } },
      choices = { { text = "I'll practice on the mindless.", next = "BACK", fx = { affinity = 1 } } },
    },
    forsaken = {
      big = true,
      lines = {
        { id = "f_default", text = "We're what the Scourge made and the Dark Lady freed. The living fear us; the Lich King wants us back. We serve Lady Sylvanas, and we answer to no one else." },
      },
      choices = {
        { text = "For the Dark Lady.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I serve myself now, not the Dark Lady.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "And what do we want?", next = "want" },
      },
    },
    want = {
      lines = { { id = "wa_default", text = "To exist without asking anyone's permission. It's a modest ambition, and the world finds it outrageous." } },
      choices = { { text = "...", next = "BACK", fx = { affinity = 1 } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Then you woke with what the Dark Lady needs most, warrior. Prayers can come later, or not at all; the Scarlets won't wait for you to find your faith." } },
      choices = {
        { text = "Maybe I'll find the Light again, someday.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll fight for her, and leave the gods out of it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "People tell a shadow priest all sorts of things, usually right before or right after they die. Ask about these; I've heard plenty." },
    },
    scarlet_crusade = { { id = "tp_crusade", text = "They burn what they don't understand, and they don't understand very much." } },
    _none = { { id = "tp_none", text = "A good question for someone with more patience than I have." } },
  },
}

P:NPC {
  key = "arren", id = TODO_NPC("Executor Arren"), name = "Executor Arren",
  bible = "bibles/tirisfal.md", role = "soldier", tier = "quest",
  communities = { "deathknell" }, temper = { "clipped" }, values = { "dutiful", "loyal" },
  notices = { "kit" },
  impression = {
    first = "Executor Arren wastes no words and expects reports rather than conversation. He wants the Scarlet Crusade gone, and he does not care whether they ever understand why.",
    third = "{name} met Executor Arren, who keeps Deathknell against the Scarlet Crusade camped to its southeast.",
  },

  greetings = {
    { id = "g_post", text = "You there, can you hold a weapon? Then Deathknell needs every pair of hands that still works." },
    { id = "g_back", when = { metBefore = true }, text = "Report." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Crusade did that? They'll do worse if you let them, so get it fixed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Executor Arren, and I keep Deathknell. The Scarlet Crusade has a camp to the southeast, and they're bold enough to come for us here." },
        { id = "h_crusade", tags = { "news" }, when = { questActive = TODO_QUEST("The Scarlet Crusade") },
          text = "Their camp is too close for my liking. Thin them out, and bring back proof." },
        { id = "h_messenger", when = { any = { { questActive = TODO_QUEST("The Red Messenger") }, { questActive = TODO_QUEST("Vital Intelligence") } } },
          text = "They send runners between their camps. Whatever those runners carry, I want it, and so will Brill." },
        { id = "h_adventurer", when = { questActive = TODO_QUEST("The Adventurer") },
          text = "You've earned a breath. There's a traveler camped on the road by Brill who claims she's not one of the Crusade, so see what she's about." },
      },
      choices = {
        { text = "Why do the Crusaders hate us?", next = "hate" },
        { text = "Give me a post, Executor. I can fight.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Understood, Executor.", next = "END", fx = { affinity = 1, standing = { deathknell = 1 } } },
      },
      again = {
        { id = "h_again", text = "Anything else? Brief." },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "Good. The gate, then the camp to the southeast. You'll hit harder than the living Crusaders expect, and you won't flinch when they scream. Use both." },
        { id = "wa_soldier", when = { origin = "forsaken_lordaeron_soldier" },
          text = "I see Lordaeron drill in your stance, and that is good. It is the same drill on a different side, so hold the gate." },
      },
      choices = {
        { text = "I'll hold it, Executor.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Holding is for the dead. I'll hunt them down.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    hate = {
      lines = { { id = "ha_default", text = "Because we remind them what the plague did, and it's easier to burn us than to look at us. I don't need them to understand; I need them gone." } },
      choices = { { text = "Then they'll be gone.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 }, learn = { "scarlet_crusade" } } } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "Zealots in red. Ask Executor Zygand in Brill; he's been fighting them longer than I have." } },
    _none = { { id = "tp_none", text = "That is no concern of Deathknell's, nor of mine." } },
  },
}

P:NPC {
  key = "aramis", id = TODO_NPC("Aramis Hammerhand"), name = "Aramis Hammerhand",
  bible = "bibles/tirisfal.md", role = "trainer", tier = "quest",
  communities = { "deathknell" }, temper = { "steadfast" }, values = { "devout", "patient" },
  notices = { "class" },
  impression = {
    first = "Though it hurts him to hold the Light, Aramis Hammerhand will not let go of it. He calls the pain a forge, and he says it like a man who has made his peace with burning.",
    third = "{name} met Aramis Hammerhand in the Deathknell church, who teaches those Forsaken who woke still holding the Light.",
  },

  greetings = {
    { id = "g_church", text = "Come in. The church still remembers what it was for, even if the town has forgotten." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "You came. I wondered whether you would, because many don't." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "It hurts, doesn't it, the Light in this body? It hurts me too, but don't let go of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Aramis Hammerhand, and I teach those of us who woke still holding the Light. There aren't many, and I'd like there to be more." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("A Difficult Path") },
          text = "You read the scroll, so your training can begin. Whatever you do, don't turn away from the Light; it hasn't turned away from you." },
        { id = "h_rediscover", when = { any = { { questActive = TODO_QUEST("Rediscovering the Light") }, { questActive = TODO_QUEST("Coming to Terms") } } },
          text = "The pain is a forge. It burns, and what's left is stronger. That's the whole of the lesson, and it takes years." },
      },
      choices = {
        { text = "Why does the Light still answer us?", next = "why" },
        { text = "Does the pain ever ease, Aramis?", next = "pain", when = { class = "PALADIN" } },
        { text = "I was a knight of the Silver Hand, before.", next = "knight", when = { class = "PALADIN", origin = "forsaken_risen_knight" } },
        { text = "The Crusade calls on the same Light against us.", next = "crusade", when = { class = "PALADIN" } },
        { text = "What does the Dark Lady think of us?", next = "sylvanas", when = { class = "PALADIN" } },
        { text = "How can you stand it, a dead man in the Light?", next = "other", when = { ["not"] = { class = "PALADIN" } } },
        { text = "I'll keep training.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light left me when I died, and I'm done with it.", next = "END", fx = { align = { light = -1 } } },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The church is quiet, and I've learned to like quiet." },
        { id = "h_again2", text = "Go on. Questions are the only prayer some of us can manage now." },
      },
    },
    pain = {
      big = true,
      lines = {
        { id = "pn_default", text = "No, it doesn't ease, but you learn its shape. In the first month I couldn't lay on hands without falling to my knees; now I fall to one knee, and I count that as progress. The day it stops hurting, I'll worry that I've stopped feeling the Light at all." },
      },
      choices = {
        { text = "Then I'll bear it, and keep faith.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "If it hurts this much, maybe it's telling us to stop.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "What helps, when it's worst?", next = "pain_helps" },
      },
    },
    pain_helps = {
      lines = { { id = "ph_default", text = "Remembering who it's for. I don't heal myself with it, because I can't, really; I heal the ones beside me, and their faces when the wound closes are worth every burn. A paladin's Light was never meant to be kept." } },
      choices = { { text = "Then I'll give it away.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    knight = {
      lines = { { id = "kn_default", text = "Then you carry more than the rest of us. You took vows to protect Lordaeron, and Lordaeron is gone, and so are most of the brothers who heard you swear them. I'd say your vows outlived the kingdom, if you choose to keep them." } },
      choices = {
        { text = "Then I'll keep them too.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "The vows died with the kingdom, Aramis.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    crusade = {
      lines = { { id = "cr_default", text = "They do, and it answers them as it answers us. That's the hardest lesson in this church: the Light doesn't take sides, and it will heal a Crusader who'd burn you as gladly as it heals you. What you do with it is the only thing that's yours." } },
      choices = {
        { text = "Then I'll use it better than they do.", next = "BACK", fx = { affinity = 2 } },
        { text = "A Light that serves both sides is no friend of mine.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    sylvanas = {
      lines = { { id = "sy_default", text = "That we're useful, I think, and that's all she's ever said of it. The deathguards in Brill watch us with something between respect and fear. I don't mind; a paladin who's feared a little by his own side behaves himself." } },
      choices = { { text = "Useful is enough for now.", next = "BACK", fx = { affinity = 1 } } },
    },
    other = {
      lines = { { id = "ot_default", text = "Badly, some days. But I woke up, and the Light was still there, hurting, and I decided it would be a poor kind of faith that only held while it was comfortable. You needn't share it, friend; just don't mock the ones who try." } },
      choices = { { text = "I won't mock it.", next = "BACK", fx = { affinity = 2 } } },
    },
    why = {
      big = true,
      lines = {
        { id = "y_default", text = "I don't know, and I've stopped needing to know. It answers, and it hurts, and it answers again, and that's enough faith for one dead man." },
      },
      choices = {
        { text = "It's enough for me too.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "It isn't enough for me, and I need more than pain.", next = "BACK", fx = { align = { light = -2 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I can't say. Ask me about the Light; I've thought about little else." } },
  },
}
