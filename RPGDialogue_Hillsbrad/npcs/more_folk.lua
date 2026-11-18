-- More of Hillsbrad: Kris Legace, the freewheeling leather trader hiding in Durnholde's ruins, and two
-- Tarren Mill sellers, Mallen Swain (tailoring supplies) and Jason Lemieux (mushrooms).
-- Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Kris Legace: leather armour trader behind Durnholde's keep, friendly to both sides.
P:NPC {
  key = "hb_kris_legace", id = TODO_NPC("Kris Legace"), name = "Kris Legace", title = "Freewheeling Tradeswoman",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "durnholde" }, temper = { "smooth", "shrewd" }, values = { "practical", "free" },
  notices = { "kit", "stealth" },

  impression = {
    first = "She sells to anyone and seems proud of answering to no one.",
    third = "{name} met Kris Legace, a freewheeling trader who sells leather armour in the ruins of Durnholde Keep.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, friend. Some of the folk round here don't like competition." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive? Good for you, and good for business." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde coin spends the same as anyone's, and I'm not fussy. Come in out of sight." },
    { id = "g_rescue", when = { questActive = TODO_QUEST("The Rescue") }, text = "Looking for the orcs in chains? Keep your voice down, and don't tell anyone I pointed." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armour's been chewed on by every Syndicate blade in the keep. I've better, if you've the coin." },
    { id = "n_stealth", cat = "stealth", when = { class = "ROGUE" },
      text = "You came up on me quiet as a cat, and I respect that. You'll want soft leather, then, the kind that doesn't creak." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kris Legace, freewheeling tradeswoman. I sell good leather to anyone who finds me back here, Alliance or Horde, and the Syndicate's welcome to try and stop me." },
        { id = "h_freed", tags = { "news" }, when = { questDone = TODO_QUEST("The Rescue") },
          text = "So those two orcs got out, did they? The guards have been screaming at each other for days, and it's been very good for business while they're looking the other way." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it quick and make it quiet." },
        { id = "h_again2", text = "Go on, I'm listening, and I'm watching the wall." },
      },
      choices = {
        { text = "Show me your leather.", next = "BUSINESS" },
        { text = "Why trade from a Syndicate ruin?", next = "why" },
        { text = "The Syndicate must know you're here.", next = "syndicate" },
        { text = "Selling to both sides isn't very loyal.", next = "loyal" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Because everyone who comes to Durnholde needs armour, and nobody else is mad enough to sell it here. The Alliance come for the Syndicate, the Horde come for their prisoners, and they all leave a bit more cut up than they came." },
      },
      choices = {
        { text = "Prisoners? Who's held here?", next = "why_prisoners" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_prisoners = {
      lines = {
        { id = "wp_default", text = "Orcs, mostly, caught poking about the keep. There's one just past that wall, and I hear him at night, singing something low that I don't understand and don't much like. Krusk, over by Tarren Mill, wants them back." },
      },
      choices = {
        { text = "You could help them out.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    syndicate = {
      lines = {
        { id = "sy_default", text = "They know, and they leave me be, since a few of them buy from me too when their captain isn't looking. A trader who doesn't take sides is the safest person in a war, so long as she keeps her mouth shut." },
      },
      choices = {
        { text = "And do you keep it shut?", next = "syndicate_shut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    syndicate_shut = {
      lines = {
        { id = "ss_default", text = "Mostly. I'll tell you this much for free: the ones who wear the nicest boots in this keep used to be nobles in Alterac, and they still think they're owed a kingdom." },
      },
      choices = {
        { text = "Good to know.", next = "BACK" },
        { text = "Let's see the boots, then.", next = "BUSINESS" },
      },
    },
    loyal = {
      big = true,
      lines = {
        { id = "lo_default", text = "Loyal to whom, the kings who left Hillsbrad to burn? I'm loyal to my stock and my skin, and so far neither's let me down." },
      },
      choices = {
        { text = "Fair enough. A free trader owes nobody.", next = "BACK", reply = "Now you're talking sense. Come back when you need leather, and I'll still be here.", fx = { align = { order = -1 } } },
        { text = "A war needs people to pick a side.", next = "BACK", reply = "Then pick one, friend, and let me sell you the armour for it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, don't care, and don't say it so loud." } },
  },
}

-- Mallen Swain: Forsaken tailoring supplies seller at Tarren Mill.
P:NPC {
  key = "hb_mallen_swain", id = TODO_NPC("Mallen Swain"), name = "Mallen Swain", title = "Tailoring Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "tarren_mill" }, temper = { "dry", "fussy" }, values = { "craft", "orderly" },
  notices = { "craft" },

  impression = {
    first = "He thinks a well-made seam is the last dignity the dead have.",
    third = "{name} met Mallen Swain, the Forsaken tailoring supplier at Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "Thread, needles, dye. Do try not to bleed on any of it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I'd hoped someone in this town would learn to sew." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor! Finally, someone who will appreciate the good thread." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Your stitching is neat, I'll give you that. Most of the living sew like they've somewhere better to be." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mallen Swain, tailoring supplies. I sell to the deathguards, the apothecaries and anyone else in Tarren Mill who still cares how they're held together." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "Mallen Swain, tailoring supplies. The living buy thread for their clothes, and the dead buy it for themselves, and I sell to both without asking which." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Go on. I'm only threading a needle." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "The dead buy thread for themselves?", next = "stitches" },
        { text = "Who were you before?", next = "before" },
        { text = "Not today.", next = "END" },
      },
    },
    stitches = {
      lines = {
        { id = "st_default", text = "Flesh that won't heal has to be sewn, and a deathguard who loses an arm on the Southshore road would rather keep it. I've stitched more shoulders than sleeves this month." },
      },
      choices = {
        { text = "Grim work.", next = "stitches_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stitches_grim = {
      big = true,
      lines = {
        { id = "sg_default", text = "Grim, and honest, and I take a certain pride in it. Apothecary Lydon calls it vanity, but a man who falls apart on duty serves the Dark Lady poorly." },
      },
      choices = {
        { text = "There's dignity in it. Keep them whole.", next = "BACK", reply = "Thank you. Not many say so, living or otherwise.", fx = { align = { light = 1 } } },
        { text = "Lydon's right. A soldier's a soldier, sewn or not.", next = "BACK", reply = "Then Lydon can stitch them himself, and we'll see how proud he is of the result.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "bf_default", text = "A tailor in Hillsbrad, with a shop on the green and a wife who chose the colours. The shop is gone and so is she, and now I choose the colours myself, which is mostly black." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let's see your black, then.", next = "BUSINESS" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I sew. Ask the deathguards about anything else." } },
  },
}

-- Jason Lemieux: Forsaken mushroom seller at Tarren Mill.
P:NPC {
  key = "hb_jason_lemieux", id = TODO_NPC("Jason Lemieux"), name = "Jason Lemieux", title = "Mushroom Seller",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "tarren_mill" }, temper = { "dry", "cheerful" }, values = { "practical" },
  notices = { "hunger" },

  impression = {
    first = "He grows half his mushrooms in a cellar he won't describe.",
    third = "{name} met Jason Lemieux, who sells mushrooms at Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "Mushrooms, fresh from the dark. Well, fresh enough." },
    { id = "g_back", when = { metBefore = true }, text = "Hungry again? The living always are." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "A tauren! You lot like your greens, so you'll love my greys." },
  },

  notice = {
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half starved, friend. Even I can tell, and my own stomach gave up years ago." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jason Lemieux, mushroom seller. The Forsaken don't eat much, but the orcs and trolls passing through do, and mushrooms grow nicely where nothing else will." },
      },
      again = {
        { id = "h_again", text = "Anything else? The caps don't keep forever." },
        { id = "h_again2", text = "Go on, I'm in no hurry. I'm dead." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Where do you grow them?", next = "grow" },
        { text = "You're cheerful, for a Forsaken.", next = "cheer" },
        { text = "Not now.", next = "END" },
      },
    },
    grow = {
      lines = {
        { id = "gr_default", text = "In a cellar under the old mill, in the dark and the damp, on beds of things I'd rather not name. Mushrooms aren't picky, and they don't ask what they're fed." },
      },
      choices = {
        { text = "That's horrible.", next = "grow_horrible" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow_horrible = {
      lines = {
        { id = "gh_default", text = "It's straw and old leaves, mostly, and I only say it like that to watch the living go pale. You've gone a little pale, I see. Sorry, but it never stops being funny." },
      },
      choices = {
        { text = "Very droll.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll buy some anyway.", next = "BUSINESS" },
      },
    },
    cheer = {
      big = true,
      lines = {
        { id = "ch_default", text = "Dead is dead, friend, and moping won't make me less so. I'd rather sell mushrooms and laugh than brood in the Undercity with the poets." },
      },
      choices = {
        { text = "Good for you. Laughter's worth keeping.", next = "BACK", reply = "It is, and it costs nothing, which suits my prices.", fx = { align = { light = 1 } } },
        { text = "Some things deserve brooding over.", next = "BACK", reply = "Then brood, friend, and I'll sell you something to chew while you do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No idea, friend. Ask me about mushrooms." } },
  },
}
