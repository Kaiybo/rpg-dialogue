-- Trackmaster Zherin, keeping the Mirage Raceway's track clear of basilisks. Voice: bibles/zherin.md
-- A tauren tracker with dry humor, hired to keep the salt flats' beasts off a course full of rocket cars.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zherin", id = TODO_NPC("Trackmaster Zherin"), name = "Trackmaster Zherin",
  bible = "bibles/zherin.md", role = "questgiver", tier = "quest",
  communities = { "mirage_raceway" }, temper = { "dry" }, values = { "practical", "patient" },
  notices = { "pet", "class" },
  impression = {
    first = "Trackmaster Zherin is a tauren tracker hired to keep the Mirage Raceway's track clear of basilisks. He finds the racers baffling, the salt flats fascinating, and the cleanup afterward the worst part of the job.",
    third = "{name} met Trackmaster Zherin at the Mirage Raceway, the tauren tracker who keeps basilisks off the racing course.",
  },

  greetings = {
    { id = "g_track", text = "Stay off the track when the flags are up, friend. The racers don't brake for anything, tauren included." },
    { id = "g_active", when = { questActive = TODO_QUEST("A Bump in the Road") }, text = "Thin out the basilisks on the flats, the big ones and the crystal-hided ones, but please don't kill them on the track." },
    { id = "g_done", when = { questDone = TODO_QUEST("A Bump in the Road") }, text = "Not a single basilisk on the course last race. The goblins thanked me, which I didn't enjoy as much as I expected." },
    { id = "g_away", when = { away = 14 }, text = "{away} away from the flats, and you missed three crashes. Two were basilisks, and one was pure goblin." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You track better than when you first came out here. I can see it in how you walk the salt." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The gnomes say you've been helping around the raceway. They said it about four times, very quickly." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep your companion off the track, friend. A rocket car won't care whose pet it is." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, good. You'll know the basilisks follow the salt licks, then, and you'll know to wait for them there." },
  },

  start = "hello",
  nodes = {
    op_raceway = {
      lines = {
        { id = "opr_q", text = "I'm paid to keep the track clear, not to like it, and on most days I don't. What do you think of all this, the racing and the rockets and the wagers?" },
      },
      choices = {
        { text = "It's harmless fun. Let them race.", next = "op_raceway_r1", fx = { align = { order = -1 }, opinion = { mirage_raceway = "fun" } } },
        { text = "It's a waste of good salt flats and better lives.", next = "op_raceway_r2", fx = { affinity = 2, align = { order = 1 }, opinion = { mirage_raceway = "waste" } } },
        { text = "Anything that keeps goblins and gnomes busy is good for everyone.", next = "op_raceway_r3", fx = { trait = { witty = 1 }, opinion = { mirage_raceway = "useful" } } },
        { text = "I've no opinion on it yet.", next = "BACK" },
      },
    },
    op_raceway_r1 = {
      lines = {
        { id = "op_raceway_r1", text = "Harmless until a basilisk wanders onto the track, which happens more than they'd like you to know. Still, the crowd seems happy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_raceway_r2 = {
      lines = {
        { id = "op_raceway_r2", text = "The salt flats would agree with you, if they could talk. I'm only here for the pay, and for the basilisks, which are honest about what they want." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_raceway_r3 = {
      lines = {
        { id = "op_raceway_r3", text = "Ha! I hadn't thought of it that way, and I like it. Better they blow up a rocket out here than a town somewhere else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Trackmaster Zherin. After a goblin racer met a basilisk at full speed and nobody walked away happy, the raceway hired me to keep the course clear of the flats' beasts." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A Bump in the Road") },
          text = "I don't know what the animals on the flats are eating to grow so big, but we have to thin them out before they wander onto the track during a race. If you want to make a little profit, go out and clear the basilisks for me." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Bump in the Road"), days = 3 } },
          text = "Good work. I hope you didn't kill any of them on the track itself, because the carcasses take a long time to rot in this sun, and I'm the one with the shovel." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance, eh? The raceway doesn't care, and neither do the basilisks. Out here we've all got the same enemy, and it's got a stony stare." },
      },
      again = {
        { id = "h_again", text = "What else? The next race is in an hour, and the basilisks never ask the goblins' permission." },
        { id = "h_again2", text = "Go on. I can listen and watch the flats at the same time." },
      },
      choices = {
        { text = "What happened in the crash?", next = "crash" },
        { text = "Why are the beasts so big out here?", next = "beasts" },
        { text = "I didn't expect a tauren tracker at a goblin raceway.", next = "why" },
        { text = "How do you track on salt?", next = "track", when = { class = { "HUNTER", "DRUID" } } },
        { text = "I'll take the work.", next = "BUSINESS" },
        { text = "Good luck with the races.", next = "END" },
      },
    },
    crash = {
      lines = { { id = "c_default", text = "The goblins' racer came around the far turn and a basilisk was sunning itself in the middle of the course. The basilisk didn't move, the racer didn't stop, and the pieces of both were scattered halfway to the gnomes' tents." } },
      choices = {
        { text = "And the driver?", next = "driver" },
        { text = "Something else, Zherin.", next = "BACK" },
      },
    },
    driver = {
      lines = { { id = "d_default", text = "Walked away, somehow, with no eyebrows and a lot of opinions. Goblins are tougher than they look, and they bounce, which I'd never have believed if I hadn't seen it." } },
      choices = {
        { text = "The gnomes and goblins never seem to stop competing.", next = "rivals" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals = {
      big = true,
      lines = { { id = "r_default", text = "Never, as far as I can tell. They build faster cars to beat each other, and they crash them faster too, and in between they sabotage each other's tents. I just keep the track clear and try not to take sides." } },
      choices = {
        { text = "What do you make of the raceway yourself?", next = "op_raceway" },
        { text = "Competition drives them to build better things.", next = "BACK", reply = "Better and faster and louder, yes, and I keep counting the pieces they leave on the flats, so I'm not sure what better means.", fx = { align = { order = -1 }, learn = { "mirage_raceway" } } },
        { text = "Someone should set rules before somebody dies.", next = "BACK", reply = "I have said so, gently, and they nodded and built a faster car, so I walk the track a little earlier each morning.", fx = { affinity = 1, align = { order = 1 }, learn = { "mirage_raceway" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "mirage_raceway" } } },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "I've been trying to work that out since I came. The salt crystals in the flats get into everything, the water, the plants, the basilisks' hides, and the beasts here grow harder and bigger than any the Earth Mother raised in Mulgore." } },
      choices = {
        { text = "That's worth studying.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The raceway pays well, and nobody else wanted to walk the flats all day under An'she's full glare. Thunder Bluff gave me my tracking, and the goblins give me my coin, and I don't see why I can't keep both." } },
      choices = {
        { text = "Coin is coin. Smart choice.", next = "BACK", reply = "It keeps me fed, and the goblins pay on time, which is more than I can say for some hunts I have walked.", fx = { align = { honor = -1 } } },
        { text = "Your people might need that skill more.", next = "BACK", reply = "Perhaps they might, and the thought follows me across the flats every evening, so I will not tell you that you are wrong.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    track = {
      lines = { { id = "t_default", text = "You don't, mostly, because salt doesn't hold a print. You track the cracks in the crust and the places where the basilisks have licked the ground, and you track the birds, because they always know where the carcasses are." } },
      choices = { { text = "I'll remember the birds.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A tracker from Thunder Bluff, working for goblins. My mother would have opinions about that." } },
    advice = { { id = "tp_ad", text = "Don't stand still on salt flats in the afternoon. Things here think anything still is either food or a rock." } },
    mirage_raceway = { { id = "tp_mr", text = "Gnomes on one side, goblins on the other, and a track down the middle that I keep clear. It's the loudest place in Kalimdor, and I've gotten used to it." } },
    centaur = { { id = "tp_centaur", text = "The Galak are a danger in the canyons, but the salt flats are too open for them. They don't like being seen, and out here, you see everything." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made the salt flats, and she made them strange. I've walked them for years, and I still find new things every day." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "The goblins from Gadgetzan hired me to keep the track clear, and they pay well. I don't understand why they race, but I understand their coin." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes lost their city to something they built, I'm told, and now they build race cars. I find that either very brave or very foolish, and I haven't decided which." } },
    _none = { { id = "tp_none", text = "Don't know. Ask a goblin; they'll tell you something, even if it's wrong, and charge you for the privilege." } },
  },
}
