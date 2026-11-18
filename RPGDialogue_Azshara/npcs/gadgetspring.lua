-- The Gadgetsprings' house on the beach of the Ruined Reaches: Jubie (engineering supplies) and her husband Blimo (trade supplies).
-- Voice: bibles/gadgetspring.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Jubie Gadgetspring
---------------------------------------------------------------------------
P:NPC {
  key = "jubie", id = TODO_NPC("Jubie Gadgetspring"), name = "Jubie Gadgetspring", title = "Engineering Supplies",
  bible = "bibles/gadgetspring.md", role = "vendor", tier = "service",
  communities = { "ruined_reaches" }, temper = { "brisk", "cheerful" }, values = { "inventive", "practical" },
  notices = { "engineer" },

  impression = {
    first = "Jubie Gadgetspring sells engineering supplies from a two-story house on a lonely Azshara beach, and she seems delighted that anyone found it. She talks about her husband Blimo with fond exasperation.",
    third = "{name} met Jubie Gadgetspring, the gnome who sells engineering supplies on the beach of the Ruined Reaches.",
  },

  greetings = {
    { id = "g_default", text = "A customer! On our beach! Blimo, put the kettle on, we've got a customer!" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Blimo owes me a silver; he said nobody comes back." },
  },

  notice = {
    { id = "n_eng", cat = "engineer", when = { profession = "Engineering" },
      text = "Oh, an engineer, I can tell by the soot! Do you need tubes? Everybody always needs tubes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jubie Gadgetspring, engineering supplies: tubes, frameworks, blasting powder, parchment and ink. My husband Blimo sells everything else downstairs, and between the two of us, we've got whatever an adventurer forgets to bring to the end of the world." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, all the way out here! Oh, it's been so long since I talked shop with someone who understood a single word I said. Pull up a crate and tell me how things are in Ironforge." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? I've a schematic on the boil." },
        { id = "h_again2", text = "Go on, ask away, the rocket needs another hour to cool anyway." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why live on a beach in Azshara?", next = "beach" },
        { text = "Aren't you afraid of the naga?", next = "naga" },
        { text = "You test rockets out here?", next = "rocket" },
        { text = "How is Ironforge? It's been a while for me too.", next = "tinkertown", when = { race = "Gnome" } },
        { text = "What sort of engineering are you working on?", next = "schematic", when = { profession = "Engineering" } },
        { text = "Goodbye, Jubie.", next = "END" },
      },
    },
    beach = {
      lines = { { id = "be_default", text = "Blimo wanted somewhere quiet after Gnomeregan, and I wanted somewhere I could test a rocket without the neighbors complaining. There aren't any neighbors here, unless you count the giants, and the giants have never once complained about the noise." } },
      choices = {
        { text = "You fled Gnomeregan?", next = "beach_gnomer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beach_gnomer = {
      lines = { { id = "bg_default", text = "Before the end, thankfully, on one of the last carts to Ironforge. We didn't like Ironforge much, all that stone, so we kept going until we found sand. I miss the old workshops, but I don't miss the trogg-shaped things in them now." } },
      choices = {
        { text = "Do you think Gnomeregan can be taken back?", next = "gnomer_back" },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },
    gnomer_back = {
      big = true,
      lines = { { id = "gb_default", text = "High Tinker Mekkatorque thinks so, bless him, and he's the cleverest gnome alive. But the whole city is soaked in that horrid radiation, and Thermaplugg is still down there, and some days I think we ought to build a new home instead of crying over the old one." } },
      choices = {
        { text = "Gnomeregan is your home. Take it back.", next = "BACK", fx = { align = { order = 1 }, learn = { "gnomeregan" } } },
        { text = "Build something new. Let the old city go.", next = "BACK", fx = { align = { order = -1 }, learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga = {
      big = true,
      lines = { { id = "na_default", text = "Terrified, dear, every night! But they mostly stay out by the wreck and the ruins, and I've rigged the porch with enough blasting powder to make them think twice. Blimo says we should move somewhere safer, and I say there's no such thing." } },
      choices = {
        { text = "Blimo's right. Move somewhere safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stay. It's your home, so defend it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The porch is rigged with powder?", next = "porch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    porch = {
      lines = { { id = "po_default", text = "Three charges under the boards, a tripwire on the steps and a lever by the kitchen door, all perfectly safe so long as nobody leans on the lever. Blimo leans on everything, so I've painted it bright red and put a little sign on it." } },
      choices = {
        { text = "Has it ever gone off?", next = "porch_off" },
        { text = "Something else.", next = "BACK" },
      },
    },
    porch_off = {
      lines = { { id = "pf_default", text = "Once, and only a little, and it wasn't the naga, it was a crab. A very large crab, mind you, and it had it coming, and Blimo was only singed on one side, which he says he doesn't mind, though he does mention it rather often." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    rocket = {
      lines = { { id = "ro_default", text = "Every week the weather allows! I'm building a little rocket to carry letters across the bay, so we wouldn't have to wait for a ship to bring word from Ratchet. So far, I've sent four letters, and the fish have read all of them." } },
      choices = {
        { text = "Who are the letters to?", next = "rocket_letters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rocket_letters = {
      lines = { { id = "rl_default", text = "My cousins in Tinker Town, mostly, and an order for more tubes from a supplier in Booty Bay who owes me money. If one ever arrives, I'll know my sums were right, and if none do, at least the fish are well informed about the price of tubes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tinkertown = {
      lines = { { id = "tt_default", text = "Oh, tell me everything, is it still noisy? Is the tram still running? Blimo's sister lives there, under the big gear, and she writes that it's crowded and smells of oil and everyone's terribly sad, and that she wouldn't live anywhere else." } },
      choices = {
        { text = "Still crowded, still noisy, and still hopeful.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Honestly, it's grim. Your beach is better.", next = "BACK", fx = { trait = { blunt = 1 } } },
      },
    },
    schematic = {
      lines = { { id = "sc_default", text = "A self-heating kettle, so Blimo stops complaining about the stove, and it's very nearly finished, except for the bit where it gets hot all at once instead of slowly. The goblins would sell it as a bomb, but I'm a gnome, so it's a kettle." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Parts, powder, and our little stretch of beach." } },
    gnomeregan = { { id = "tp_gn", text = "We got out in time. Not everyone did." } },
    ratchet = { { id = "tp_rat", text = "Blimo talks about it the way some gnomes talk about Gnomeregan, which is to say far too often." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know, dear. Ask Blimo; he likes to pretend he knows things." } },
  },
}

---------------------------------------------------------------------------
-- Blimo Gadgetspring
---------------------------------------------------------------------------
P:NPC {
  key = "blimo", id = TODO_NPC("Blimo Gadgetspring"), name = "Blimo Gadgetspring", title = "Trade Supplies",
  bible = "bibles/gadgetspring.md", role = "vendor", tier = "service",
  communities = { "ruined_reaches" }, temper = { "nervous", "gentle" }, values = { "careful", "kind" },

  impression = {
    first = "Blimo Gadgetspring sells trade supplies downstairs from his wife's workshop, and he jumps at every bang from the floor above. He'd rather be anywhere quieter, and says so politely.",
    third = "{name} met Blimo Gadgetspring, who sells trade supplies in a beach house in Azshara.",
  },

  greetings = {
    { id = "g_default", text = "Hello, hello! Don't mind the thumping upstairs, that's just Jubie. At least, I hope it is." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again! I lost a silver on you, you know. Jubie was quite smug." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Blimo Gadgetspring, trade supplies: thread, dye, vials, coal, fishing lures, a bit of everything. Jubie handles the explosive things upstairs, and I handle the things that don't explode, which is a much shorter list than you'd think in this house." },
        { id = "h_tailor", when = { profession = { "Tailoring", "Leatherworking" } },
          text = "Oh, a crafter, I can tell by the needle calluses! Thread, dye and good salt, right this way, and I'm so glad, because nobody upstairs ever wants anything that doesn't go bang." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've time; nobody else is coming." },
        { id = "h_again2", text = "Go on, I don't mind. It's nice to talk to someone who isn't on fire." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Do you like living here?", next = "here" },
        { text = "What's out on the cliffs?", next = "cliffs" },
        { text = "You count the naga every morning?", next = "count" },
        { text = "How did you and Jubie meet?", next = "meet" },
        { text = "I've fished these waters. What lures work?", next = "fishing", when = { profession = "Fishing" } },
        { text = "Goodbye, Blimo.", next = "END" },
      },
    },
    here = {
      big = true,
      lines = { { id = "he_default", text = "I like Jubie, and Jubie likes it here, so I suppose I like it here. Mostly I count the naga on the beach every morning and hope the number doesn't go up. I'd move to Ratchet tomorrow, but she won't hear of it." } },
      choices = {
        { text = "Tell her you're leaving. Your safety matters too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Stay with her. That's what marriage is.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why Ratchet, of all places?", next = "ratchet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ratchet = {
      lines = { { id = "ra_default", text = "Because it has a dock, and a bank, and a great many goblins with guns who'd rather shoot pirates than customers. Nobody in Ratchet keeps blasting powder under the porch, or if they do, they're polite enough not to tell you about it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "ratchet" } } } },
    },
    cliffs = {
      lines = { { id = "cl_default", text = "Giants, mostly, the big blue cliff walkers, who stomp about and don't seem to notice us at all. Jubie says they're harmless. I've noticed she says that from upstairs, though, where the windows are higher." } },
      choices = {
        { text = "Do the giants ever come close?", next = "cliffs_close" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cliffs_close = {
      lines = { { id = "cc_default", text = "One did, last spring, and picked up our rain barrel and looked into it for a very long time. Then it put it down, quite gently, and walked off. I didn't sleep for a week." } },
      choices = {
        { text = "What do you think it was looking for?", next = "cliffs_why" },
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    cliffs_why = {
      lines = { { id = "cw_default", text = "Jubie thinks it was thirsty. I think it was looking for a gnome, and decided the barrel didn't have one in it, and I've kept a lid on that barrel ever since, just in case it comes back to check." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    count = {
      lines = { { id = "co_default", text = "From the upstairs window, with Jubie's spyglass, while she's still asleep. Yesterday there were eleven by the wreck and three in the shallows, and the day before there were twelve, so either one went home or one is hiding, and I'd very much like to know which." } },
      choices = {
        { text = "Eleven is fewer. That's good news, surely.", next = "count_good" },
        { text = "Something else.", next = "BACK" },
      },
    },
    count_good = {
      lines = { { id = "cg_default", text = "That's exactly what Jubie said, and then she went back to sleep. I wrote it in the book, though; I write every morning's number in the book, so that if we're ever eaten, someone will at least know it was coming." } },
      choices = {
        { text = "That's very sensible, Blimo.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    meet = {
      lines = { { id = "me_default", text = "In Gnomeregan, at a lecture on pressure valves, which she interrupted to say the lecturer was wrong, and she was, and the valve proved it a moment later. I was sitting in the front row, and she helped me put my eyebrows out, and that was that." } },
      choices = {
        { text = "That's oddly romantic.", next = "meet_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meet_after = {
      lines = { { id = "ma_default", text = "It is, isn't it? I've had a quiet life, mostly, except for the parts with Jubie in them, and the parts with Jubie in them are the only ones I'd tell anyone about. Please don't repeat that upstairs; she'd never let me forget it." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    fishing = {
      lines = { { id = "fi_default", text = "Bright lures in the morning and dull ones at dusk, and never fish near the wreck, because something down there takes the line and the rod and very nearly the fisherman. I sell the bright ones and the dull ones, and I'd sell a longer rod if I had one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Supplies, naga counts, and giants' habits. Not much else." } },
    ratchet = { { id = "tp_rat", text = "A lovely harbour full of sensible goblins. I'd move there tomorrow, if anyone asked me." } },
    gnomeregan = { { id = "tp_gn", text = "I met my wife there, and I lost my eyebrows there, and I'd rather leave it at that." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Jubie might, if you shout up the stairs." } },
  },
}
