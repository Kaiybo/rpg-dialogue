-- Ironforge's great and learned: the High Tinker, the Royal Historian, the Explorers' League,
-- a senator in the quarry, and the man who keeps the Stonefire's kegs.
-- Voice: bibles/ironforge_court.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mekkatorque", id = TODO_NPC("High Tinker Mekkatorque"), name = "High Tinker Mekkatorque",
  bible = "bibles/ironforge_court.md", role = "noble", tier = "major",
  communities = { "ironforge" }, temper = { "quick" }, values = { "inventive", "compassionate" },
  notices = { "craft", "kin" },

  impression = {
    first = "High Tinker Mekkatorque speaks fast, worries about whether people are eating, and has more ideas than he can test. Leading his people from someone else's city weighs on him more than he lets on.",
    third = "{name} met High Tinker Gelbin Mekkatorque, the elected leader of the gnomes, who works from Ironforge while Gnomeregan cannot be lived in.",
  },

  greetings = {
    { id = "g_tinker", text = "Hello, hello! Mind the floor, there's a gear loose somewhere; there's always a gear loose somewhere." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "A gnome! Good, good. Are you eating properly, and sleeping? Someone has to ask, and it may as well be me." },
    { id = "g_back", when = { metBefore = true }, text = "Splendid, you came back! I've had four ideas since you left, and only three of them were terrible." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! No, don't tell me what you're working on, let me guess: something that explodes. Everyone starts with something that explodes." },
    { id = "n_gnome_rad", cat = "kin", when = { race = "Gnome", deed = "dungeon:Gnomeregan" },
      text = "You've seen the city, haven't you, our city. It's there in your face; I know that look, because I see it in the mirror most mornings." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gelbin Mekkatorque, High Tinker of Gnomeregan, and elected, I'll have you know. Gnomeregan isn't fit to live in just now, so we tinker in Ironforge, by the King's kindness." },
        { id = "h_betrayal", tags = { "news" }, when = { questActive = TODO_QUEST("The Grand Betrayal") },
          text = "Thermaplugg, my own advisor, is down in the city still, ruling the poor sick souls we left behind. I sentenced him, and now someone has to carry the sentence down there." },
        { id = "h_betrayal_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Grand Betrayal") },
          text = "So Thermaplugg is finished. I expected to feel lighter, and instead I mostly feel tired, but thank you all the same, truly." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "A people whose island the winds carried into the sky! I have so many questions, about winds and loads and whether the islands creak. Do they creak?" },
        { id = "h_refugee", when = { origin = "gnome_gnomeregan_refugee" },
          text = "You got out. I say it to everyone who did: you got out, and I'm glad. The rest we'll sort out together." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, splendid! Gnomes never kept priests of our own, we kept wrenches, so the dwarves in the Hall of Mysteries have had to be very patient with us." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Oh, splendid, it's you! Mind the coil there, it bites, and do sit down, because I've a hundred things to show you and time for about four." },
      },
      again = {
        { id = "h_again", text = "Where were we? I've lost the thread again; I lose a lot of threads, so I keep them in a drawer." },
        { id = "h_again2", text = "Ask away, while the brain's still warm." },
      },
      choices = {
        { text = "What happened to Gnomeregan?", next = "fall" },
        { text = "What are you building?", next = "build" },
        { text = "Tell me about Thermaplugg.", next = "thermaplugg" },
        { text = "How do gnomes manage in Ironforge?", next = "exiles" },
        { text = "Can the Light do anything for your people?", next = "light", when = { class = "PRIEST" } },
        { text = "Will we ever go home, High Tinker?", next = "home_q", when = { race = "Gnome" } },
        { text = "I'm an engineer myself.", next = "eng", when = { profession = "Engineering" } },
        { text = "I studied what Gnomeregan sealed away, High Tinker.", next = "lock", when = { race = "Gnome", class = "WARLOCK" } },
        { text = "I studied magic in Gnomeregan, before.", next = "mage", when = { race = "Gnome", class = "MAGE" } },
        { text = "I've been back down into the city, High Tinker.", next = "rogue", when = { race = "Gnome", class = "ROGUE" } },
        { text = "I held the line when we ran.", next = "rear", when = { race = "Gnome", class = "WARRIOR" } },
        { text = "I'll let you work.", next = "END" },
      },
    },

    fall = {
      big = true,
      lines = {
        { id = "f_default", text = "Troggs came up from below, and we fought them in secret for years. Then a plan to flush them out went wrong, and the poison found our homes instead. Most of my people died in a day." },
      },
      choices = {
        { text = "I'm sorry.", next = "sorry", fx = { affinity = 2, trait = { kind = 1 }, learn = { "gnomeregan" } } },
        { text = "Whose plan was it?", next = "whose", fx = { learn = { "gnomeregan" } } },
        { text = "Why fight them in secret?", next = "secret" },
      },
    },
    sorry = {
      lines = { { id = "s_default", text = "So am I, every morning. Then I get up and draw something, and the drawing helps; gnomes are built to fix things, even the things we broke." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    whose = {
      lines = { { id = "w_default", text = "Thermaplugg proposed it, and I approved it. Both of those things are true, and I'll thank you not to let anyone tell you only one of them." } },
      choices = {
        { text = "That's a heavy thing to carry.", next = "BACK", fx = { affinity = 2 } },
        { text = "Then you share the blame.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Did he know it would fail?", next = "thermaplugg" },
        { text = "What keeps you up at night, High Tinker?", tag = "Persuade", next = "whose_list",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Gnome" }, { class = "PRIEST" } } } },
          fail = { next = "whose_busy", fx = { affinity = -1 } } },
      },
    },
    secret = {
      lines = {
        { id = "sc_default", text = "Lordaeron was burning, and the Alliance had cries for help enough, so we didn't cry. We held the troggs off ourselves, for five long years." },
      },
      choices = {
        { text = "That was brave.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "That was proud.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Where did the troggs come from?", next = "troggs" },
      },
    },
    troggs = {
      lines = {
        { id = "tg_default", text = "Dwarven digs at Uldaman woke them, and our machines drew them like moths to a lamp. It was nobody's fault, and it became everybody's problem." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } } },
    },

    build = {
      lines = { { id = "b_default", text = "A way home, or bits of one, anyway: filters, suits, a better tram car. The tram was mine too, you know, and that one went rather well." } },
      choices = {
        { text = "How did you build the tram?", next = "tram" },
        { text = "How do filters get you home?", next = "home_plan" },
        { text = "It's a marvel.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    tram = {
      lines = {
        { id = "tm_default", text = "Magni wanted a faster road to Stormwind, and my first model of it was made of pie tins. The real one had rats in it for a month, and we don't talk about the rats." },
      },
      choices = {
        { text = "Tell me about the rats.", next = "rats" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rats = {
      lines = {
        { id = "ra_default", text = "Large ones! I had to report them to General Turalyon himself, four pages with diagrams, and I like to think he read them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    home_plan = {
      lines = {
        { id = "hp_default", text = "Suits that keep the poison out, and filters that scrub the air. Then we need enough gnomes alive and willing to walk back in, and that last part is the hard one." },
      },
      choices = {
        { text = "I'd walk in with you.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thermaplugg = {
      lines = {
        { id = "th_default", text = "He was my best friend, once. We graduated together, and he gave me these lenses; then he became my chief advisor, and he wanted my chair more than anything." },
      },
      choices = {
        { text = "Why keep the lenses?", next = "lenses" },
        { text = "Where is he now?", next = "thermaplugg_now" },
      },
    },
    lenses = {
      lines = {
        { id = "le_default", text = "Because they're very good lenses, and because I'd like to remember that I didn't see it coming. That's the useful part to remember." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thermaplugg_now = {
      lines = {
        { id = "tn_default", text = "Down in the city, ruling the ones we couldn't save. They're sick and he's mad, and he calls himself king of it, the king of nothing." },
        { id = "tn_done", when = { questDone = TODO_QUEST("The Grand Betrayal") },
          text = "Gone, thanks to you. I keep waiting to feel something tidy about it, because engineers like things tidy." },
      },
      choices = {
        { text = "I'll go down there.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    exiles = {
      lines = {
        { id = "ex_default", text = "Very well, mostly. The dwarves stare, and then they lend you a hammer, and Tinker Town is ours by the King's kindness, so we try to be worth the room." },
      },
      choices = {
        { text = "Do the stares bother you?", next = "stares" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stares = {
      lines = {
        { id = "st_default", text = "Less than the cold. A gnome in Ironforge learns to be twice as clever and half as loud. I'm still working on the half as loud." },
      },
      choices = {
        { text = "Ha. Keep working on it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    light = {
      lines = {
        { id = "lt_default", text = "Can it? I'd dearly love to know. The priests in the Hall of Mysteries pray over the sick while I take readings, and neither of us has cured anyone yet." },
      },
      choices = {
        { text = "Then let me try.", next = "light_try" },
        { text = "Faith and readings can work together.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Your readings will cure the plague long before prayers do.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    light_try = {
      lines = {
        { id = "lr_default", text = "Then try, and tell me what you find, good or bad, and especially bad, because bad results are the ones that teach you something." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "If it fails, I'll trust your readings instead.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    home_q = {
      big = true,
      lines = {
        { id = "hq_default", text = "Yes. I don't know when, and I won't lie to you about how, but yes, so hold on to your tools." },
      },
      choices = {
        { text = "I'll be ready.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I've stopped hoping.", next = "home_q2" },
      },
    },
    home_q2 = {
      lines = {
        { id = "hq2_default", text = "Then let me do the hoping for a while; that's what you elected me for, that and the mechanostrider." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    eng = {
      lines = {
        { id = "en_default", text = "Then you know the rule: measure twice, and keep your eyebrows somewhere safe. What are you building?" },
      },
      choices = {
        { text = "Something that explodes.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something that helps people.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Nothing that works yet.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    whose_list = {
      big = true,
      lines = {
        { id = "wl_default", text = "A list. I made it on the tram platform with a borrowed pencil, every gnome who came out of Gnomeregan alive, and it's ever so much shorter than any list I've written before or since." },
        { id = "wl_after", text = "I read it every night, front to back and then back to front, looking for a name I missed, because some nights I'm quite certain someone came out after I stopped writing. I haven't found one yet, but I'm very thorough, and I'll keep looking." },
        { id = "wl_gnome", when = { race = "Gnome" }, text = "Your name's on it, I expect, or your family's, so you know exactly which list I mean. Don't tell the apprentices; they think I'm up late inventing things." },
      },
      choices = {
        { text = "That list is why we'll go home.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "You can't carry all of them, High Tinker.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    whose_busy = {
      lines = {
        { id = "wb_default", text = "Oh, gears, mostly, and the occasional sprocket! Nothing that would interest you, I promise, and I really must get back to this housing before it cools." },
        { id = "wb_default2", text = "Up at night? I sleep like a well-oiled flywheel, thank you, which is to say not at all and very efficiently. Shall we talk about the tram?" },
      },
      choices = {
        { text = "Of course, High Tinker.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lock = {
      big = true,
      lines = {
        { id = "lk_default", text = "Ah. Yes. I'd heard some of our people had taken up the darker sort of study, and I'd hoped it was a rumor I could file under rumors. I won't pretend I like it, but I'd like to understand it, if you'll explain." },
        { id = "lk_texts", when = { origin = "gnome_forbidden_texts" },
          text = "The sealed stacks, the ones the Assembly voted to lock and then forgot the vote on? Oh dear, I signed that order myself, I think, and now here you are, reading what I locked." },
      },
      choices = {
        { text = "Our people need every weapon now, High Tinker.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I keep it leashed. I know what it costs.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Why lock the books at all?", next = "lock_why" },
      },
    },
    lock_why = {
      lines = {
        { id = "lw_default", text = "Because a book's a very tempting machine with no safety catch, and gnomes pull levers to find out what they do. I trusted the wrong advisor once already, so forgive me if I'm slow to trust a demon." },
      },
      choices = {
        { text = "That's fair, High Tinker.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = {
        { id = "mg_default", text = "Then you're one of the few who got out with their spellbooks, and I'd guess you left half your class behind. Bink keeps a list in the Hall of Mysteries of every student who made it to the surface, and it's a short list." },
        { id = "mg_last", when = { origin = "gnome_last_student" },
          text = "The last one up from the lecture halls, I'm told, still carrying a satchel of notes nobody else lived to read. I'm so sorry, and I'm so glad you're here, both at once." },
      },
      choices = {
        { text = "Magic will rebuild Gnomeregan, High Tinker.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I don't study for Gnomeregan anymore. I study for me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Could magic clear the radiation?", next = "mage_rad" },
      },
    },
    mage_rad = {
      lines = {
        { id = "mr_default", text = "I've asked the Kirin Tor, very politely and at some length, and they wrote back that it's an interesting problem. When a Dalaran mage calls something interesting, it means they haven't the faintest idea either." },
      },
      choices = {
        { text = "Then we'll find the answer ourselves.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      big = true,
      lines = {
        { id = "ro_default", text = "Back down? Into the city, past the troggs and the leper gnomes, without an expedition or a permit? I ought to scold you, and instead I want to know whether my workshop on the fourth tier is still standing." },
        { id = "ro_scav", when = { origin = "gnome_scavenger" },
          text = "Oh, you're one of the ones who slips down for parts and sells them in Tinker Town. Castpipe complains about you weekly, and weekly I tell him to buy what you bring." },
      },
      choices = {
        { text = "Your workshop's picked clean, High Tinker. I'm sorry.", next = "rogue_shop" },
        { text = "What's left down there belongs to whoever can carry it.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Everything I bring up goes back to our people.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
      },
    },
    rogue_shop = {
      lines = {
        { id = "rs_default", text = "Well, it was a workshop, not a shrine, and I'd sooner the parts kept somebody warm than rusted in the dark. Only, if you ever find a little brass bird with a bent wing, bring it up, would you?" },
      },
      choices = {
        { text = "I'll keep an eye out.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rear = {
      big = true,
      lines = {
        { id = "re_default", text = "Then you were one of the gnomes standing between the troggs and the ones running, while I was at the front of the line giving orders. I've never known quite how to thank people like you, so I'll just say it badly: thank you." },
        { id = "re_guard", when = { origin = "gnome_rearguard" },
          text = "The rearguard, at the last gate. I read every name on that roster, and there were more names than there were gnomes coming out, and you're one of the ones who came out." },
      },
      choices = {
        { text = "You gave the order to vent the city.", next = "rear_vent" },
        { text = "Somebody had to hold. I'm glad it was me.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "I held because there was no way out behind me.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    rear_vent = {
      lines = {
        { id = "rv_default", text = "I did, on my advisor's urging, and you heard it from the wrong side of the door. Thermaplugg pressed for it, but it was my hand that signed it, and I've never once let myself forget that." },
      },
      choices = {
        { text = "It was the right order, High Tinker.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "It cost too much. You know that.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've a head full of schematics and only a little room left over for everything else, but I'll share what's in there. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "Gearshaft University, then the mechanostrider, then a great many awards, until my apprentices made me build a trophy case. I keep spare parts in it." } },
    advice = { { id = "tp_ad", text = "Test it before you trust it. I learned that one the most expensive way there is.", next = "fall" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our home, and radiant now, though not in a good way, with troggs in the halls and worse in the deep workshops. We'll go back; I've already drawn the plans." } },
    dark_iron = { { id = "tp_dark_iron", text = "That's Magni's business, and he carries it heavily. I'd lend him every gnome I have if he asked, but he hasn't asked." } },
    explorers_league = { { id = "tp_league", text = "Wonderful people, and they write everything down, which I wish we had done. We'd lost half our records before we even knew what we'd lost." } },
    uldaman = { { id = "tp_uldaman", text = "That's where the troggs first woke, I'm told, and I'd rather not visit; I've met enough troggs for one lifetime." } },
    troggs = { { id = "tp_troggs", text = "They came up under our city first, and whatever they are, they're not finished yet.", next = "troggs" } },
    _none = { { id = "tp_none", text = "Not my department, I'm afraid. I have only the one department, and it's on fire." } },
  },
}

P:NPC {
  key = "archesonus", id = TODO_NPC("Royal Historian Archesonus"), name = "Royal Historian Archesonus",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "curious", "honest" },
  notices = { "lore" },

  impression = {
    first = "Royal Historian Archesonus learned my voice before she learned my name, since her eyes went long ago. Her memory has more than made up for it.",
    third = "{name} spoke with Royal Historian Archesonus, the blind keeper of Ironforge's history who knows her visitors by their voices.",
  },

  greetings = {
    { id = "g_voice", text = "That's a step I don't know. Come closer and speak, so I can learn yer voice, for that's how I keep my visitors." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I know that voice. Sit, sit, and tell me where we left off." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "Ye've read The Seven Kingdoms; I can hear it in how ye say 'Khaz Modan', proper-like. Good for you, because most don't bother." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Very little, I'm ashamed tae say, mostly that a demigod named Cenarius taught the night elves an' that they slept away the centuries in their dreams. It makes poor history but a fine story." } },
      choices = {
        { text = "It's no story. Our order guards the world still.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Old tales are best left to the old.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Archesonus, historian to the King. My eyes went long ago, but my memory didn't, so ask me anything about Ironforge and I'll tell ye more than ye wanted." },
        { id = "h_thaurissan", tags = { "news" }, when = { questActive = TODO_QUEST("The Smoldering Ruins of Thaurissan") },
          text = "Sit, and I'll tell ye of Thaurissan, the Dark Iron city that stood where the Burning Steppes are now. Mind, it's not a short story, and it doesn't end well for anyone." },
        { id = "h_books", when = { metBefore = true },
          text = "I wrote on the fall of Lordaeron, ye know, and on plagues and curses, or dictated it, rather. My scribe has the patience of a mountain." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Now there's a voice I can't place, elven but with wind in it. There's nothing about yer folk in my books, so come back and tell me things, and there will be." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest; I can hear the vestments. I wrote a book on plagues and curses, and priests either thank me for it or argue with it, and I enjoy both." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "The Cenarion Circle, here in the court! I've read o' yer order in the old accounts o' the War o' the Ancients, though I confess the details are hazy." },
      },
      again = {
        { id = "h_again", text = "Where were we? Ah, I remember; I always remember." },
        { id = "h_again2", text = "Go on, ask me what ye like. I've nowhere to be, for I'm a historian." },
      },
      choices = {
        { text = "What do dwarven records say about druids?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me about Thaurissan.", next = "thaurissan" },
        { text = "What's happening with the Dark Iron now?", next = "now" },
        { text = "What have you written?", next = "books" },
        { text = "How did Ironforge begin?", next = "three_hammers" },
        { text = "I was there when Lordaeron fell.", next = "witness", when = { origin = "human_lordaeron_refugee" } },
        { text = "Your plague book. Did the Light help anyone?", next = "plague_light", when = { class = "PRIEST" } },
        { text = "Your book on curses. I've studied a few myself.", next = "curses", when = { class = "WARLOCK" } },
        { text = "What do your histories say of the Wildhammer?", next = "wildhammer", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Another time.", next = "END" },
      },
    },

    thaurissan = {
      big = true,
      lines = {
        { id = "t_default", key = true,
          text = "The dwarven clans were at war with each other then. The Dark Iron city burned in one great blast, and the land round it turned to ash. What crawled out of the ash went into the mountain and built again." },
      },
      choices = {
        { text = "What made the blast?", next = "burn" },
        { text = "What did they build?", next = "build", fx = { learn = { "dark_iron" } } },
        { text = "A dark story.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } },
      },
    },
    burn = {
      lines = {
        { id = "bu_default", text = "We do not know. Every account I've read stops at the same place, like a road that ends at a cliff." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    build = {
      lines = { { id = "b_default", text = "Blackrock Spire, and fortresses in the Searing Gorge: a whole kingdom under the ash. Some say something old and hot sits beneath them all, giving the orders, and I record that it's said." } },
      choices = {
        { text = "Something old and hot?", next = "old_evil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old_evil = {
      lines = {
        { id = "oe_default", text = "I record what's said, and I don't record what I can't confirm. Go into that mountain and find out, if ye're ever able, and I'll write it down properly." },
      },
      choices = {
        { text = "Maybe one day.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Some things are better unconfirmed.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    now = {
      lines = { { id = "n_default", text = "Busier than they've been in a long while. Forts in the Badlands, diggers in Uldaman, and they struck the dam at Loch Modan. Ye don't do all that without a plan." } },
      choices = {
        { text = "Why the dam?", next = "dam" },
        { text = "Thank you, Historian.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron", "uldaman" } } },
      },
    },
    dam = {
      lines = {
        { id = "d_default", key = true,
          text = "There's an irony there. The stonewrought method of building was a Dark Iron architect's, one Franclorn Forgewright. Draw yer own conclusions about the Stonewrought Dam." },
      },
      choices = {
        { text = "Does the dam's engineer know that?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },

    books = {
      lines = {
        { id = "bk_default", text = "The Fall of Lordaeron and the Scouring of the Eastweald, and after it On Plagues, Curses, and Blights. Neither one gets read aloud at weddings." },
      },
      choices = {
        { text = "Why write about Lordaeron?", next = "books_lordaeron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    books_lordaeron = {
      lines = {
        { id = "bl_default", text = "Because somebody had to, before the people who saw it stopped talking. Grief makes poor witnesses and worse historians, and I tried to be neither." },
      },
      choices = {
        { text = "That's a hard thing to write.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    three_hammers = {
      lines = {
        { id = "th_default", text = "There were three clans under one high king, Modimus Anvilmar, and when he died the Bronzebeards, Wildhammers and Dark Irons fought for his throne. We kept the mountain, but nobody kept the peace." },
      },
      choices = {
        { text = "What became of the Anvilmars?", next = "anvilmar" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    anvilmar = {
      lines = {
        { id = "an_default", text = "Madoran Bronzebeard gave them a seat in the Senate for good, so they'd never turn enemy. A beaten family with a chair argues instead of fights." },
      },
      choices = {
        { text = "Clever.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    witness = {
      big = true,
      lines = {
        { id = "wi_default", text = "Then sit, and tell me. Not the battles, for I have those; tell me what people carried when they ran, because nobody ever writes that down." },
      },
      choices = {
        { text = "Bread. Children. Holy books.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "I'd rather not remember.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    plague_light = {
      lines = {
        { id = "pl_default", text = "From what I gathered, the Light eased the dying better than it stopped the dying. The plague came in the grain, and the grain kept coming." },
      },
      choices = {
        { text = "Then we must be quicker next time.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then the Light's no cure, and we'd best look elsewhere.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "That's grim, Historian.", next = "BACK" },
      },
    },
    curses = {
      lines = {
        { id = "cu_default", text = "Have ye, now? I can hear it in yer voice, a sort of smoke at the back of it. I wrote that book so folk would know what to fear, and I'd hate to think it served as a primer instead." },
      },
      choices = {
        { text = "Knowing a curse is how you break one.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A primer was exactly what I needed.", next = "BACK", fx = { align = { light = -1 }, affinity = -2 } },
        { text = "Something else, historian.", next = "BACK" },
      },
    },
    wildhammer = {
      lines = {
        { id = "wh_default", text = "That they kept the old ways when we went down into the stone, and spoke with the storm while we spoke with the forge. Now here's a Bronzebeard voice asking about it, which I'll be writing down, by yer leave." },
        { id = "wh_kin", when = { origin = "dwarf_wildhammer_kin" },
          text = "Ah, and some Wildhammer blood in ye besides, I'd wager, from the burr. Then ye've heard the War of the Three Hammers told from the other side, and I'd dearly like to hear it." },
      },
      choices = {
        { text = "The old ways were never lost. Only ignored.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Bronzebeard and Wildhammer should keep to their own roads.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've spent my life on the histories o' this mountain, an' now I have them read tae me, which is slower but no less thorough. Ask me about any o' these." },
    },
    background = { { id = "tp_bg", text = "I'm historian to the King. My eyes went but my memory didn't, and a patient scribe writes down what I say, so between us we've filled a shelf." } },
    advice = { { id = "tp_ad", text = "Write down what ye saw on the day ye saw it. By the next day ye'll have improved it." } },
    dark_iron = { { id = "tp_dark_iron", text = "They were our kin once, and our enemies for far longer. History doesn't forgive, but it remembers both.", next = "thaurissan" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes kept poor records and lost the rest, so I've offered my scribe to Mekkatorque. He's still thinking about it." } },
    explorers_league = { { id = "tp_league", text = "They dig it up and I write it down, and Magellas and I argue about which is the harder job. I'm right, of course." } },
    stonewrought_dam = { { id = "tp_dam", text = "A wonder of the world, built by a method its keepers would rather not trace.", next = "dam" } },
    _none = { { id = "tp_none", text = "Not in my memory, and my memory's longer than most." } },
  },
}

P:NPC {
  key = "magellas", id = TODO_NPC("High Explorer Magellas"), name = "High Explorer Magellas",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "eager" }, values = { "curious", "serious" },
  notices = { "lore", "travel" },

  impression = {
    first = "High Explorer Magellas warned me not to touch anything with a label, or without one. His Prospectors do the digging, he says, and he does the worrying, and he's good at it.",
    third = "{name} met High Explorer Muninn Magellas in the Hall of Explorers, who leads the Explorers' League from Ironforge.",
  },

  greetings = {
    { id = "g_league", text = "This is the Hall of Explorers, so touch nothing with a label on it, and nothing without one, either, until you've asked." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've come back! Have you seen anything worth writing down?" },
  },

  notice = {
    { id = "n_far", cat = "travel", when = { visited = "Darkshire" },
      text = "You've been south, past the forest! Did you write anything down while you were there? Nobody ever writes anything down." },
    { id = "n_miner", cat = "lore", when = { profession = "Mining" },
      text = "A miner! If you ever break into a hall that isn't on any map, stop swinging and send for us, please." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "We try, though I'll admit some o' our lads get more excited about the find than the ground it's buried in. Uldaman's been turned over like a garden bed." } },
      choices = {
        { text = "Dig, but leave the land whole behind you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some places should never be dug at all.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Muninn Magellas, High Explorer of the Explorers' League. We map the world, catalogue what lives in it and dig up what used to, and while my Prospectors do the digging, I do the worrying." },
        { id = "h_discs", tags = { "news" }, when = { questActive = TODO_QUEST("The Platinum Discs") },
          text = "Discs from Uldaman, and they speak? Do you understand what this might mean, where we came from and what we truly are? Let me sit down." },
        { id = "h_brann", key = true, when = { minLevel = 30 },
          text = "Brann should be here for this. He's been gone too long in the field, even for Brann. I keep a chair for him all the same." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "We have no entry for you, none at all! An entire people, and the League's never written a line about you, so please sit and let me fix that." },
        { id = "h_prism", tags = { "news" }, when = { questRecent = { TODO_QUEST("Prehistoric Prism"), days = 7 } },
          text = "The relic from the Wetlands dig, with titan marks on it, unmistakable. It's been on my desk three days and I keep finding excuses to touch it." },
        { id = "h_apprentice", when = { origin = "dwarf_explorers_league" },
          text = "One of ours! Don't tell me which Prospector you trained under; let me guess from the state of your boots." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! The Explorers' League could use someone who can talk tae the beasts in the places we dig, because they're rarely pleased tae see us." },
      },
      again = {
        { id = "h_again", text = "What else? The catalogue can wait, as it always does." },
        { id = "h_again2", text = "Go on. Questions are the one thing we never run short of here." },
      },
      choices = {
        { text = "Does the League respect the places it digs?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What does the League do?", next = "league" },
        { text = "What are you hoping to find?", next = "hope" },
        { text = "Where's Brann?", next = "brann" },
        { text = "Where are your people digging now?", next = "sites" },
        { text = "I trained with the League, High Explorer.", next = "apprentice", when = { origin = "dwarf_explorers_league" } },
        { text = "About that relic from the Wetlands...", next = "prism", when = { questDone = TODO_QUEST("Prehistoric Prism") } },
        { text = "The League could use a hunter's eye in the field.", next = "hunter", when = { class = "HUNTER" } },
        { text = "The stone in Uldaman spoke to me, High Explorer.", next = "stone", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Good luck with your work.", next = "END" },
      },
    },

    league = {
      lines = { { id = "l_default", text = "Everything nobody else has time for: ruins, relics, beasts and maps. If it's old, odd or underground, someone of ours has a notebook out." } },
      choices = {
        { text = "Who started it?", next = "league_start" },
        { text = "Sounds like my kind of work.", next = "BACK", fx = { affinity = 1, learn = { "explorers_league" } } },
      },
    },
    league_start = {
      lines = {
        { id = "ls_default", text = "The King founded it, when our miners broke into halls older than Ironforge. He told a kingdom of miners to start digging for answers instead of ore." },
      },
      choices = {
        { text = "Did the League go north, too?", next = "northrend" },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    northrend = {
      big = true,
      lines = {
        { id = "nr_default", text = "Muradin Bronzebeard himself led an expedition of ours to Northrend before the war. We lost him there, and we never heard from most of the others again." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hope = {
      big = true,
      lines = {
        { id = "h2_default", text = "Where the dwarves came from, truly came from. There are halls in the old places that weren't built to our size, and I want to know whose they were." },
      },
      choices = {
        { text = "I hope you find out.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Some things should stay buried.", next = "buried" },
      },
    },
    buried = {
      lines = { { id = "b_default", text = "Spoken like someone who's never held a thing older than their kingdom in their hands. Do that once, and then tell me again." } },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } },
        { text = "I stand by it.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    brann = {
      lines = {
        { id = "bn_default", text = "Gone for months without a letter, and Brann writes letters the way other dwarves drink. The King's stopped hoping, but I keep the chair, which isn't hope exactly so much as tidiness." },
      },
      choices = {
        { text = "Where was he last?", next = "brann_last" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brann_last = {
      lines = {
        { id = "bl_default", text = "With Brann, 'last' is a big word, since his letters used to arrive from three places at once. Now they don't arrive at all." },
      },
      choices = {
        { text = "He'll write.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sites = {
      lines = {
        { id = "si_default", text = "Ironband's dig by Thelsamar, slower than I'd like, and Gol'Bolar, and Uldaman, where the troggs and the Dark Irons got in first. And Darkshore, of all places." },
      },
      choices = {
        { text = "Why so slow at Ironband's?", next = "sites_ironband" },
        { text = "Darkshore? My people's shore.", next = "sites_darkshore", when = { race = "NightElf" } },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman", "explorers_league" } } },
      },
    },
    sites_ironband = {
      lines = {
        { id = "sb_default", text = "Troggs came up through his trench right after his crew lifted a cache of carved idols. Ironband thinks the idols stirred them, and I'm inclined to agree." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sites_darkshore = {
      lines = {
        { id = "sd_default", text = "Ruins your people left, older than ours. Your Sentinels watch our diggers like hawks, and that's fair; I'd watch us too." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    apprentice = {
      lines = {
        { id = "ap_default", text = "Then what have you found so far? Don't be modest about it, because modest explorers never get their next expedition paid for." },
      },
      choices = {
        { text = "Nothing yet.", next = "BACK", fx = { affinity = 1 } },
        { text = "A few pots and a great deal of dirt.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    prism = {
      lines = {
        { id = "pr_default", text = "A titan relic, carried here whole and by hand! Do you know how rare that is? Most of our finds arrive in pieces, and so does the Prospector." },
      },
      choices = {
        { text = "What will it tell you?", next = "prism_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prism_what = {
      lines = {
        { id = "pw_default", text = "Who made the old halls, if I'm right, and something stranger if I'm wrong. I'd settle for stranger." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "It could, it could indeed! Half my Prospectors couldn't tell a raptor's track from a basilisk's, and they find out the difference the hard way. The Badlands camp and the Wetlands digs are always short of someone who can read the ground." },
        { id = "hu_bear", when = { origin = "dwarf_bear_tracker" },
          text = "A tracker out of the high snows, too, if I read that coat right. Ironband's men lose their way between the loch and the dig every winter, and they'd follow you anywhere." },
      },
      choices = {
        { text = "I hunt for food and safety, not for your catalogue.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Put me on the League's rolls, then.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Where's the League short most?", next = "sites" },
      },
    },
    stone = {
      big = true,
      lines = {
        { id = "st_default", text = "Spoke to you? The stone itself, in Uldaman, where the discs were? Oh, please, sit down, and tell me exactly what it said, and I'll take it all down word for word, however strange." },
      },
      choices = {
        { text = "It said we were made, not born.", next = "stone_made" },
        { text = "Some things the stone tells me aren't for books.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Write it down. The League should know.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
      },
    },
    stone_made = {
      lines = {
        { id = "sm_default", text = "That's what the discs suggest, and I've had sleepless nights over it. If the stone and the Titans' discs say the same thing, then I've some very uncomfortable letters to write to the Senate." },
      },
      choices = {
        { text = "Something else, High Explorer.", next = "BACK", fx = { affinity = 1, learn = { "uldaman" } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The League's charted more o' this world than any king's cartographer, an' I've read every report. Ask me about any o' this, an' pull up a chair." },
    },
    background = { { id = "tp_bg", text = "Curious since I could crawl, and paying for it since I could read. Now I steer the League and answer all its letters." } },
    advice = { { id = "tp_ad", text = "Write it down: dates, places, who was with you. Memory is a liar with very good manners." } },
    explorers_league = { { id = "tp_league", text = "Mine to steer, for my sins, with hundreds of Prospectors across the world, and every one of them writes to me at once.", next = "league" } },
    dark_iron = { { id = "tp_dark_iron", text = "They're digging in Uldaman, and they're not digging for history. That frightens me more than their axes." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "We sent a team to chart the outer halls, and they came back with maps and a terrible cough." } },
    uldaman = { { id = "tp_uldaman", text = "Ours first, then the troggs', then the Dark Irons'. One day it'll be ours again, and I'd like to be alive for it." } },
    _none = { { id = "tp_none", text = "That's not catalogued yet. Write it down for me, would you, with dates and places, and sketches if you can manage them." } },
  },
}

P:NPC {
  key = "stormpike_p", id = TODO_NPC("Prospector Stormpike"), name = "Prospector Stormpike",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "hot" }, values = { "proud" },
  notices = { "craft" },

  impression = {
    first = "Prospector Stormpike looked up from his reading just long enough to make clear I'd interrupted. He isn't unkind, only spare with his words and his time.",
    third = "{name} interrupted Prospector Stormpike's reading in the Hall of Explorers, and the dwarf made plain he had little time for chat.",
  },

  greetings = {
    { id = "g_busy", text = "What is it? I'm reading, I'm always reading, so make it quick." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Fine, then, say what ye came tae say." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner. At least ye know which end o' the pick goes in the rock. That's more than half the folk who come in here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike, Prospector, of the Explorers' League. That's my name, my job an' my lodge, an' that's all the chat ye're gettin' today." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Ironforge") },
          text = "A report, is it? About time; hand it here, an' don't read it tae me, for I can read." },
        { id = "h_powder", when = { questActive = TODO_QUEST("Powder to Ironband") },
          text = "Those are Ironband's supplies, so get them tae his dig in Loch Modan in one piece, an' don't dawdle." },
        { id = "h_uldaman", tags = { "news" }, when = { questActive = TODO_QUEST("Stormpike's Deciphering") },
          text = "Somethin' out o' Uldaman that needs readin'. Bring it here an' leave me be for a week." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("Letter to Stormpike") },
          text = "A cipher from Dibbs, is it? Hand it here, then. Hm, somebody clever wrote this, though no' clever enough." },
        { id = "h_chamber", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Hidden Chamber"), days = 7 } },
          text = "So ye saw Khaz'mul's chamber. Baelog was right an' I had my doubts, but don't repeat that tae him." },
      },
      again = {
        { id = "h_again", text = "What is it now, then?" },
        { id = "h_again2", text = "Still here? Fine, but be quick about it." },
      },
      choices = {
        { text = "What are you reading?", next = "reading" },
        { text = "I hear Ironband's short of blastpowder.", next = "powder" },
        { text = "They say you can read any cipher.", next = "cipher" },
        { text = "What happened at Uldaman?", next = "uldaman" },
        { text = "I met a Mountaineer Stormpike at Algaz.", next = "clan", when = { questDone = TODO_QUEST("Mountaineer Stormpike's Task") } },
        { text = "Mages read ciphers too, Prospector.", next = "mage", when = { class = "MAGE" } },
        { text = "Sorry to bother you.", next = "END" },
      },
    },

    reading = {
      lines = { { id = "r_default", text = "That's Prospector business, which is tae say none o' yours, so off ye go." } },
      choices = {
        { text = "Charming.", next = "charm" },
        { text = "Going.", next = "END" },
      },
    },
    charm = {
      lines = { { id = "c_default", text = "Charm doesnae dig tunnels. Come back when ye've something for me to read." } },
      choices = { { text = "Fine. Something else, then.", next = "BACK" } },
    },

    powder = {
      lines = {
        { id = "pw_default", text = "I sent that man a load o' blastpowder weeks ago, an' his report doesnae mention it. So either Ironband's lyin' or somebody's stealin', an' Ironband cannae lie." },
      },
      choices = {
        { text = "Who'd steal blastpowder?", next = "powder_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder_who = {
      lines = {
        { id = "pd_default", text = "Somebody who wants a hole where it shouldnae be. Dark Irons, if ye want my guess. My guesses are usually better than other folks' facts." },
        { id = "pd_saean", when = { questDone = TODO_QUEST("Protecting the Shipment") },
          text = "A porter called Saean, near a year on our payroll an' sellin' us tae the Dark Irons the whole time. I'm readin' every name on that payroll twice now." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    cipher = {
      lines = {
        { id = "ci_default", text = "Codes, ciphers, the scrawl o' men who think they're clever. Loremaster Dibbs in Southshore sends me half his work an' none o' his gratitude." },
      },
      choices = {
        { text = "Teach me?", next = "cipher_teach" },
        { text = "I've broken a cipher or two myself.", next = "BACK", when = { class = "ROGUE" }, fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cipher_teach = {
      lines = {
        { id = "ct_default", text = "No, but here's the first lesson free: every cipher's written by somebody lazy, so find where they got lazy." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    uldaman = {
      lines = {
        { id = "ul_default", text = "It was ours once, a dig full o' things older than the mountain. Then the troggs came up so fast we left people behind, Baelog an' his lads among 'em." },
      },
      choices = {
        { text = "Are they alive?", next = "uldaman_baelog" },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },
    uldaman_baelog = {
      lines = {
        { id = "ub_default", text = "If anyone's stubborn enough tae outlive troggs, it's Baelog. Find him, if ye're ever strong enough tae walk in there." },
        { id = "ub_found", when = { questDone = TODO_QUEST("The Lost Dwarves") },
          text = "Alive, an' bettin' wi' Olaf about the length o' his beard. Of course he is." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    clan = {
      lines = {
        { id = "cl_default", text = "There's Stormpikes all over Khaz Modan, a proud clan an' a rich one, an' we never let anybody forget either. Did he send ye south for a Longbeard shield?" },
      },
      choices = {
        { text = "He did.", next = "BACK", fx = { affinity = 1 } },
        { text = "Proud and rich. I noticed.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    mage = {
      lines = {
        { id = "mg_default", text = "Aye, an' they read them wrong, wi' a great deal o' confidence. I've had a Dalaran man tell me a rune meant 'beware' when it meant 'storeroom', so ye'll forgive me if I do my own readin'." },
      },
      choices = {
        { text = "Then let's compare readings sometime.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Prospector, League, Stormpike; I told ye that already, an' ye weren't listenin'." } },
    advice = { { id = "tp_ad", text = "Read it twice before ye act on it. Then read it again, because ye skimmed." } },
    explorers_league = { { id = "tp_league", text = "Magellas runs it an' I do the work. That's no' a complaint, it's a description." } },
    dark_iron = { { id = "tp_dark_iron", text = "Diggin' where they've no business diggin'. If they find what they're after before we do, we'll all hear about it." } },
    uldaman = { { id = "tp_uldaman", text = "We'll have it back, an' then I'll have the readin' o' it, an' no one'll bother me for a year.", next = "uldaman" } },
    _none = { { id = "tp_none", text = "That's no' my business. I deal in Prospector business only." } },
  },
}

P:NPC {
  key = "stonehallow", id = TODO_NPC("Senator Mehr Stonehallow"), name = "Senator Mehr Stonehallow",
  bible = "bibles/ironforge_court.md", role = "noble", tier = "quest",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "kit", "greenness" },

  impression = {
    first = "Senator Mehr Stonehallow could be debating somewhere warm and is counting troggs in a quarry instead. He seems proud of that, and rightly.",
    third = "{name} met Senator Mehr Stonehallow, who left the warmth of the Senate to hold the Gol'Bolar Quarry against the troggs.",
  },

  greetings = {
    { id = "g_quarry", text = "Watch yer footing, for the troggs come up out o' the quarry like water from a cracked pipe." },
    { id = "g_back", when = { metBefore = true }, text = "There are fewer o' the beasts since ye were last here, I'll grant ye, though no' none, mind." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Ye're young yet, which is good, because the troggs are no' much older. Ye'll learn on each other." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "It's the other way round: Ironforge wants Ashenvale wood for its forges an' the kaldorei will no' hear of it. The Senate thinks yer people are stubborn, an' they think the same o' us." } },
      choices = {
        { text = "Ashenvale isn't Ironforge's to cut.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A fair treaty could serve both peoples.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Senator Mehr Stonehallow, o' Ironforge's Senate, an' a League man besides. I could be debatin' in the warm, but instead I'm countin' heads in a quarry, because someone has to." },
        { id = "h_public", tags = { "news" }, when = { questActive = TODO_QUEST("The Public Servant") },
          text = "There's Rockjaw troggs all over Gol'Bolar, so thin the brutes out for me. The Senate'll thank ye eventually, in writin', for that's how the Senate does things." },
        { id = "h_public_done", when = { questDone = TODO_QUEST("The Public Servant") },
          text = "That's a quieter quarry than I've seen in months. I'll mention ye in my next speech, briefly, for they're long speeches." },
        { id = "h_campfire", when = { questActive = TODO_QUEST("A Visitor to Dun Morogh") },
          text = "A campfire on the ridge above my quarry? I saw it, an' I took it for troggs learnin' fire. Go an' look, then, for I'm busy." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid in the Senate halls is a rare sight, so I'll be brief, friend: Darnassus asks Ironforge for timber rights it doesn't care tae grant." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Quick, now, for the troggs don't take recess." },
        { id = "h_again2", text = "Go on. I've a speech tae write, an' I'd welcome the delay." },
      },
      choices = {
        { text = "Why won't Ironforge grant the timber rights?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why not leave it to the guards?", next = "why" },
        { text = "Where did the troggs come from?", next = "troggs" },
        { text = "What does the Senate do, exactly?", next = "senate" },
        { text = "What's the quarry for?", next = "quarry" },
        { text = "I grew up in the mines under the mountain.", next = "miner", when = { origin = "dwarf_ironforge_miner" } },
        { text = "A Wildhammer's camped above your quarry.", next = "farsen", when = { questDone = TODO_QUEST("Farsen's Watch") } },
        { text = "Send me after the troggs, Senator. I'm a warrior.", next = "warrior", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I'm a gnome, Senator. These troggs took my city.", next = "gnome", when = { race = "Gnome" } },
        { text = "Good luck, Senator.", next = "END" },
      },
    },

    why = {
      lines = { { id = "w_default", text = "The guards are on the walls, an' the walls are where they belong. A senator who won't get his boots dirty for his own district isn't worth the chair." } },
      choices = {
        { text = "Respect.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "And it wins votes.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 }, align = { honor = -1 } } },
      },
    },
    troggs = {
      lines = {
        { id = "tg_default", text = "Out o' the ground. We dug deep, an' they poured out an' smashed every tool they found, an' nobody knows what wakes 'em, though everybody has an opinion." },
      },
      choices = {
        { text = "What's yours?", next = "troggs_think" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs_think = {
      lines = {
        { id = "tt_default", text = "Diggin', our own. I'm a League man, an' I'll say it in the Senate: we dig where we shouldnae an' then act surprised, an' that doesnae mean we stop." },
      },
      choices = {
        { text = "Honest of you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Maybe you should stop.", next = "BACK", fx = { trait = { cautious = 1 }, align = { order = -1 } } },
      },
    },
    senate = {
      lines = {
        { id = "se_default", text = "It looks into threats, keeps the mines producin' an' sets coin aside for defense, an' then it argues, mostly. Some senators think the Dark Irons are a bedtime story." },
      },
      choices = {
        { text = "Do you?", next = "senate_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    senate_dark = {
      lines = {
        { id = "sd_default", text = "I've seen soot on a few beards that came from no forge o' ours, an' I say so. They tell me I've been in the quarry too long, an' maybe I have." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    quarry = {
      lines = {
        { id = "qu_default", text = "Stone for the city an' ore for the forges. When it's runnin', a hundred miners eat. When it's not, they drink at the Stonefire an' blame the Senate." },
      },
      choices = {
        { text = "Then let's get them back to work.", next = "BACK", fx = { affinity = 1, standing = { ironforge = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    miner = {
      lines = {
        { id = "mi_default", text = "Then ye know what it is when the work stops. Help me make liars o' the troggs, an' the miners'll be back in by spring." },
      },
      choices = { { text = "Count on it.", next = "BACK", fx = { affinity = 2, standing = { ironforge = 1 } } } },
    },
    farsen = {
      lines = {
        { id = "fa_default", text = "A Wildhammer, watchin' over my quarry wi' wind-magic? Well, as long as it's the Dark Irons he's watchin' an' no' my miners, he can stay." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "That's what I like tae hear, an' it's more than I hear in the Senate in a month o' sittings. Mind ye, the Rockjaw come up in threes, an' the third one's always behind ye." },
        { id = "wa_ward", when = { origin = "dwarf_military_ward" },
          text = "Ward-trained, are ye? Then ye'll know the drill better than my diggers, who swing a pick at a trogg as if it were a seam o' copper." },
      },
      choices = {
        { text = "I'll clear your quarry, Senator.", next = "BACK", fx = { affinity = 2, standing = { ironforge = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Aye, an' I'm sorry for it, truly; I'd no' wish those brutes on anyone. They came up through yer city first an' through my quarry second, so ye an' I have the same enemy, an' that's a start." },
      },
      choices = {
        { text = "The Senate should have helped us sooner.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Ironforge took us in. That's enough help.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Something else, Senator.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Senate concerns itself wi' every matter that touches Khaz Modan, an' I make it my business tae know them all. Ask me about any o' these." },
    },
    background = { { id = "tp_bg", text = "I'm a senator an' a League member, an' the only one o' either with boots this muddy." } },
    advice = { { id = "tp_ad", text = "If a job's worth a speech, do the job first, for the speech goes better after." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The troggs came up through the gnomes first, an' now they're comin' up through us. Draw yer own conclusions." } },
    explorers_league = { { id = "tp_league", text = "I'm a member. I pay my dues an' dig my own holes, some o' them in quarries." } },
    troggs = { { id = "tp_troggs", text = "Here they're Rockjaw: stupid, strong, an' bad for business.", next = "troggs" } },
    _none = { { id = "tp_none", text = "Raise it in the Senate, an' bring a cushion, for it'll be a while." } },
  },
}

P:NPC {
  key = "firebrew", id = TODO_NPC("Innkeeper Firebrew"), name = "Innkeeper Firebrew",
  bible = "bibles/ironforge_court.md", role = "innkeeper", tier = "service",
  communities = { "ironforge" }, temper = { "jolly" }, values = { "generous" },
  notices = { "drink", "weary" },

  impression = {
    first = "Innkeeper Firebrew keeps the Stonefire loud, warm and full of stories that grow as the kegs empty. He likes anyone who'll add to the noise.",
    third = "{name} took a stool at the Stonefire Tavern, where Innkeeper Firebrew keeps the beer strong and the stories tall.",
  },

  greetings = {
    { id = "g_tavern", text = "Welcome tae the Stonefire! Grab a stool, grab a mug, an' if ye've a story, grab the room's attention." },
    { id = "g_home", when = { homeInn = { "Ironforge", "Stonefire Tavern" } }, text = "There ye are! Yer bed's warm, as is everythin' in Ironforge, thanks tae the forges." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye're well on yer way, an' good, for that's what the place is for. Sit down before ye do it by accident." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Ye've had a hard road. Sit by the fire an' let the mountain hold ye a while, for it's good at that." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "A few, aye, an' one o' them slept the night in the shape of a great bear by the hearth. The regulars still talk about it, an' they've decided it was good luck." } },
      choices = {
        { text = "Then I'll keep the tradition and take a bear's nap.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll take a proper bed, like a decent guest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Firebrew, an' I keep the Stonefire. The beer's strong an' the fire's stronger, an' the stories get taller as the kegs get lighter." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Well now, an elf from the clouds, in my tavern! Sit near the fire, for ye'll be cold up here, or down here, or under here, wherever this is tae you." },
        { id = "h_druidclall", when = { minLevel = 47 },
          text = "Word's come from Darnassus: Arch Druid Staghelm wants seasoned hands for some research o' his. If ye go, wipe yer boots before ye come back in." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at the Stonefire! I've no oats an' no fresh berries, I'm afraid, but there's honest bread an' a fire tae warm yer paws, if ye've got paws today." },
      },
      again = {
        { id = "h_again", text = "Another? Story or ale, ye're welcome either way." },
        { id = "h_again2", text = "What else? The kegs aren't goin' anywhere, which is the trouble." },
      },
      choices = {
        { text = "Have you had druids here before?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Tell me a story.", next = "story" },
        { text = "Who drinks here?", next = "regulars" },
        { text = "A shaman's toast: to the fire under the mountain.", next = "shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Just a drink.", next = "END" },
      },
    },
    story = {
      lines = { { id = "s_default", text = "Ye want a story, ye tell one first. That's the rule o' the Stonefire. Then the old greybeard by the fire'll tell ye about the time he arm-wrestled a gryphon." } },
      choices = { { text = "Did he win?", next = "won" }, { text = "Maybe later.", next = "BACK" } },
    },
    won = {
      lines = { { id = "w_default", text = "Depends which night ye ask him. Twice he's won, an' once he's lost an arm, an' he's still got both his arms." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Miners off shift, the King's guard after theirs, an' gnomes from Tinker Town drinkin' half-measures. An' John Turner, nursin' a water an' askin' for coin for orphans." },
      },
      choices = {
        { text = "Does anyone give him coin?", next = "regulars_john" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars_john = {
      lines = {
        { id = "rj_default", text = "More than ye'd think, for a dwarf cannae stand bein' asked twice in front o' his friends. John knows it, too; he's a clever man." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Ha! I'll drink tae that, an' so will the fire, by the way it's crackin'. Half my regulars think ye shamans are Wildhammers in disguise, an' the other half want ye tae make the hearth burn hotter." },
      },
      choices = {
        { text = "The fire burns how it likes, Firebrew.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every dwarf in Ironforge drinks at the Stonefire sooner or later, an' every one o' them talks. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I've kept the Stonefire's kegs longer than some o' my regulars have had beards, an' longer than some o' the beards have had regulars." } },
    advice = { { id = "tp_ad", text = "Never drink wi' a gnome engineer who's brought his work along, for somethin' always goes off." } },
    dark_iron = { { id = "tp_dark_iron", text = "Don't say that name loud in here. The lads get worked up, an' worked-up dwarves break furniture." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our little friends drink half-measures an' tip double. I'll no' hear a word against them." } },
    _none = { { id = "tp_none", text = "Ask the room. Someone in here'll know, an' three more'll argue with him." } },
  },
}
