-- Marvon Rivetseeker, goblin scientist at the Broken Pillar (0.72.0). Voice: bibles/marvon.md
-- Treasure hunter at heart; crashed his zeppelin in the desert and decided to call it research.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marvon", id = TODO_NPC("Marvon Rivetseeker"), name = "Marvon Rivetseeker",
  bible = "bibles/marvon.md", role = "scholar", tier = "quest",
  temper = { "excitable", "chatty" }, values = { "curious", "profit" },
  notices = { "craft", "lore" },
  impression = {
    first = "Marvon Rivetseeker crashed his zeppelin in the Tanaris desert and decided he'd meant to come all along. He calls himself a scientist, but his eyes light up at treasure, and he once barely got out of the Sunken Temple alive.",
    third = "{name} met Marvon Rivetseeker, a goblin scientist and treasure hunter camped at the Broken Pillar in Tanaris.",
  },

  greetings = {
    { id = "g_default", text = "I know, I know, I'm out here in the middle of nowhere, pal! Come in out of the sun, if you can find any shade, and shake your boots out first; the scorpids like boots, and boots cost money." },
    { id = "g_orn", when = { questActive = TODO_QUEST("Gahz'ridian") }, text = "Keep the helmet on and keep walking! The ornaments are everywhere, once you know how to look." },
    { id = "g_orn_done", when = { questDone = TODO_QUEST("Gahz'ridian") }, text = "My favourite helper! You did give the helmet back, didn't you, buddy? I keep counting and coming up one short, and that helmet's worth more than my zeppelin, these days." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good, because I've had nobody to talk to but the pillar, and the pillar's a terrible listener and an even worse investor." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Then you'll appreciate that the crash wasn't the zeppelin's fault, pal. It was mostly the ground's, and the ground won't pay for repairs." },
    { id = "n_lore", cat = "lore", when = { class = { "MAGE", "PRIEST" } },
      text = "You look like the bookish sort, and I mean that as a compliment, which out here is rare." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Marvon Rivetseeker, scientist and treasure hunter, though not always in that order, and the treasure pays for the science. My home's in Ratchet, but after I crashed my zeppelin out here, I figured I might as well start the research I came to do. It beats going back underground, after what I saw in the Sunken Temple." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Gahz'ridian") },
          text = "Long ago the trolls carved ornaments of Gahz'rilla, a hydra they worshipped, out of a stuff I call Gahz'ridian, and a stuff nobody's named is a stuff nobody's priced. I've found some, but I'd love more, and I've even invented a detector to help!" },
        { id = "h_orn", tags = { "news" }, when = { questActive = TODO_QUEST("Gahz'ridian") },
          text = "You'll find it just about anywhere in the desert, but the ruins east and south of here are thick with it. Put the helmet on and the search begins all by itself!" },
        { id = "h_orn_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gahz'ridian"), days = 3 } },
          text = "Perfect, every one of them, pal, and they'll keep me busy for weeks and solvent for months. Now, about my helmet." },
        { id = "h_circle", tags = { "news" }, when = { questActive = TODO_QUEST("The Stone Circle") },
          text = "The round stone with the serpent on it is crated up in my workshop in Ratchet. Bring it back, and I might remember more of what I saw down in that temple." },
        { id = "h_circle_done", when = { questDone = TODO_QUEST("The Stone Circle") },
          text = "That stone brought it all back, every slimy step of it. If you're going down into the Sunken Temple, mind the circle of serpents, and mind the ooze more." },
        { id = "h_gob", when = { race = "Goblin" },
          text = "Ah, one of us! Then you know the difference between a crash and an unscheduled field expedition, and you know which one the insurance pays for." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I can talk all day, and frankly I have been, to a pillar." },
        { id = "h_again2", text = "Ask away! Science thrives on questions, and so does boredom." },
      },
      choices = {
        { text = "You crashed a zeppelin out here?", next = "crash" },
        { text = "Gahz'ridian sounds like a strange thing to chase.", next = "gahz" },
        { text = "You've been inside the Sunken Temple?", next = "temple" },
        { text = "Who looks after your home in Ratchet?", next = "ratchet" },
        { text = "Can I see that detector's workings?", next = "engineer", when = { profession = "Engineering" } },
        { text = "These ornaments were holy to my people once.", next = "troll", when = { race = "Troll" } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Good luck with the research.", next = "END" },
      },
    },
    crash = {
      lines = { { id = "c_default", text = "A small crash, a gentle one, as crashes go, and only one small explosion! The engines quit over the dunes, and the ground came up faster than my calculations, and here I am." } },
      choices = {
        { text = "That zeppelin looks past saving.", next = "crash_salvage" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crash_salvage = {
      lines = { { id = "cs_default", text = "Parts of it, and the parts that aren't are now a very fine shade structure, which I'm counting as an asset. I'll fly home when the research is done, or when somebody in Gadgetzan lends me a pilot, whichever is cheaper." } },
      choices = { { text = "I'd wager on the research.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    gahz = {
      lines = { { id = "gz_default", text = "Nobody knows, which is exactly why I want it, pal! The trolls made their hydra idols from it, and it doesn't behave like any stone or metal I've ever cut, and it's everywhere out here if you've got the eyes for it, and nobody's cornered the market yet." } },
      choices = {
        { text = "Do you mean to study it, or sell it?", next = "gahz_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gahz_sell = {
      big = true,
      lines = { { id = "gs_default", text = "Study it first, then sell it, naturally! A scientist who can't fund his own expeditions ends up stuck in a desert with a broken zeppelin, pal, and I should know, because I'm the one stuck." } },
      choices = {
        { text = "Knowledge first. The money will follow.", next = "BACK", reply = "Spoken like somebody who's never had to pay a zeppelin mechanic, friend, but I like the optimism, and I'll put it on my tab.", fx = { align = { order = 1 } } },
        { text = "Sell it now, while it's still a mystery.", next = "BACK", reply = "Ooh, you've got the instinct, pal, because a mystery fetches more than an answer ever does, right up until somebody else figures it out first.", fx = { align = { order = -1 } } },
        { text = "Something else, Marvon.", next = "BACK" },
      },
    },
    temple = {
      lines = { { id = "t_default", text = "Once, and once was plenty. The evil in that place gets into you, and I barely found my way out, wading through ooze, with nothing in my head but a big round room full of serpent statues." } },
      choices = {
        { text = "What's down there?", next = "temple_what" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    temple_what = {
      lines = { { id = "tw_default", text = "The trolls who built it worshipped something they shouldn't have, and it's still down there, I'd bet my zeppelin on it. Not that my zeppelin's worth much any more, about forty silver for scrap." } },
      choices = {
        { text = "Then the temple should be sealed for good.", next = "temple_stance" },
        { text = "Then someone ought to go and find out.", next = "temple_stance" },
      },
    },
    temple_stance = {
      big = true,
      lines = { { id = "ts_default", text = "That's the question, isn't it? I found a stone with the same serpent mark on it, and the scientist in me says find out, the businessman in me says it'd fetch a fortune, and every sensible bone in me says run." } },
      choices = {
        { text = "Leave some doors shut, Marvon.", next = "BACK", reply = "You sound like my mother, and she was right about most things, so maybe I'll keep that stone wrapped up in a sock for a while longer.", fx = { align = { light = 1 } } },
        { text = "Fortune favors whoever opens the door first.", next = "BACK", reply = "That's what worries me, friend, because whoever opens it first might also be the first one eaten, and I've got a lot of plans for this face.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ratchet = {
      lines = { { id = "r_default", text = "My assistant, Liv Rizzlefix, who's probably reorganising all my shelves while I'm gone. My friend Larion was meant to come visit, but last I heard he'd gone and got himself lost in Un'Goro." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    engineer = {
      lines = { { id = "e_default", text = "Certainly! A resonator in the crown, a sensing coil round the brim, and a little bell that rings when you're close. The bell is the only part that works every time, but it's a very good bell, and the bell alone cost me six gold." } },
      choices = { { text = "That's not much of a detector.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Clever work, Marvon.", next = "BACK", fx = { affinity = 1 } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "Oh! Well, I'm not melting them down, if that's the worry, I'm studying them. And if any of your elders want one back, they can have it, at a very reasonable price." } },
      choices = { { text = "Of course they can.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A goblin of Ratchet with a workshop, an assistant, a crashed zeppelin and more questions than gold, pal. I'm working on the gold." } },
    advice = { { id = "tp_ad", text = "Always bring a second helmet, buddy. You never know when somebody's going to walk off with the first, and replacements aren't cheap." } },
    steamwheedle = { { id = "tp_sw", text = "Good people, mostly, so long as you remember they're keeping a tab. I keep one too." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "I went into the Sunken Temple once, pal, and came out with my life and not much else. There's a dragon down there, and trolls who want to bring back a god, and I'd rather not go back." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "Zul'Farrak's got more treasure than any place in Tanaris, pal, and more trolls too. I'd love to go in, if I had a small army." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's where my workshop is, pal, and my assistant's minding it while I'm stuck in this desert. I hope he hasn't blown it up." } },
    uldaman = { { id = "tp_uldaman", text = "Uldaman's full of old secrets, pal, and the dwarves are digging them out as fast as they can. I'd love to see what they've found." } },
    bronze_dragonflight = { { id = "tp_bronze_dragonflight", text = "There's a story about a cave in the dunes where the bronze dragons keep watch over time itself, pal. Scientifically speaking, it's nonsense, but I'd still like to see it." } },
    _none = { { id = "tp_none", text = "Haven't studied that one yet, pal! Give me a few weeks, a working zeppelin and a modest grant." } },
  },
}
