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
    { id = "g_active", when = { questActive = TODO_QUEST("A Bump in the Road") }, text = "Basilisks, the big ones and the crystal-hided ones, out on the flats. Not on the track, please." },
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
        { id = "h_again", text = "What else? The next race is in an hour." },
        { id = "h_again2", text = "Go on. I can listen and watch the flats at the same time." },
      },
      choices = {
        { text = "What happened in the crash?", next = "crash" },
        { text = "Why are the beasts so big out here?", next = "beasts" },
        { text = "A tauren tracker at a goblin raceway?", next = "why" },
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
        { text = "Do the gnomes and goblins ever stop competing?", next = "rivals" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals = {
      big = true,
      lines = { { id = "r_default", text = "Never, as far as I can tell. They build faster cars to beat each other, and they crash them faster too, and in between they sabotage each other's tents. I just keep the track clear and try not to take sides." } },
      choices = {
        { text = "Competition drives them to build better things.", next = "BACK", fx = { align = { order = -1 }, learn = { "mirage_raceway" } } },
        { text = "Someone should set rules before someone dies.", next = "BACK", fx = { affinity = 1, align = { order = 1 }, learn = { "mirage_raceway" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "mirage_raceway" } } },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "I've been trying to work that out since I came. The salt crystals in the flats get into everything, the water, the plants, the basilisks' hides, and the beasts here grow harder and bigger than any I saw in Mulgore." } },
      choices = {
        { text = "That's worth studying.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The raceway pays well, and nobody else wanted to walk the flats all day in this heat. Thunder Bluff gave me my tracking, and the goblins give me my coin, and I don't see why I can't keep both." } },
      choices = {
        { text = "Coin is coin. Smart choice.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Your people might need that skill more.", next = "BACK", fx = { align = { honor = 1 } } },
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
    _none = { { id = "tp_none", text = "Don't know. Ask a goblin; they'll tell you something, even if it's wrong." } },
  },
}
