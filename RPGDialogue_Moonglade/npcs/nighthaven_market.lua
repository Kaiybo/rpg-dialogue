-- Nighthaven's small market: Geenia Sunshadow (robes), Darnall (tailoring supplies), Meliri (weapons), Kharedon (light armor).
-- Voice: bibles/nighthaven_market.md
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Geenia Sunshadow
---------------------------------------------------------------------------
P:NPC {
  key = "geenia", id = TODO_NPC("Geenia Sunshadow"), name = "Geenia Sunshadow", title = "Speciality Dress Maker",
  bible = "bibles/nighthaven_market.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "warm", "chatty" }, values = { "craft", "friendly" },
  notices = { "druid", "naked" },

  impression = {
    first = "Geenia Sunshadow makes robes for the druids of Nighthaven, and she measures every visitor with her eyes before they've said hello. She thinks a druid ought to look as good as the forest does.",
    third = "{name} met Geenia Sunshadow, the dressmaker of Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Oh, come in, come in! Let me see you in the light. Yes, I thought so; you need a new robe." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I knew that color would bring you back to me." },
  },

  notice = {
    { id = "n_druid", cat = "druid", when = { class = "DRUID", form = { "bear", "cat" } },
      text = "Oh, druid, please don't shed on my bolts! Change back, there's a dear, and then I'll show you something beautiful." },
    { id = "n_naked", cat = "naked", when = { nearlyNaked = true },
      text = "My goodness, you need me more than anyone who has walked through that door this year. Come here and let me find you something before the Keeper sees you." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I'm Geenia Sunshadow, and I make robes for the druids who come to Nighthaven, and for anyone else with the good sense to want one. Moonglade is the most beautiful place in the world, and I don't see why the people in it should dress like they've been sleeping in a barrow den." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren! I've had to learn to cut for your shoulders, and I'm still not sure I've got the horns right on the hoods. Come and stand by the window and let me take a proper look at you." },
      },
      again = {
        { id = "h_again", text = "What else, dear? I've a hem half-finished, but I can talk while I sew." },
        { id = "h_again2", text = "Go on, I'm listening; turn a little to the left while you talk, there's a dear." },
        { id = "h_again3", text = "Anything more? You can't rush a good hem or a good chat." },
      },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "Who buys robes in Moonglade?", next = "who" },
        { text = "Where do you get your cloth?", next = "cloth" },
        { text = "You were measuring me before I said hello.", next = "measure" },
        { text = "Do the druids really care what they wear?", next = "druids" },
        { text = "Do my robes survive when I change shape?", next = "shift", when = { class = "DRUID" } },
        { text = "What's the trouble with horns and hoods?", next = "horns", when = { race = "Tauren" } },
        { text = "Goodbye, Geenia.", next = "END" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Druids, mostly, from both the Horde and the Alliance, and the Keeper's peace means I sell to both and nobody minds. The tauren like heavy cloth and the night elves like it light, and I've stopped trying to make one robe that pleases both of them." } },
      choices = {
        { text = "Does the Horde ever give you trouble?", next = "who_horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_horde = {
      big = true,
      lines = { { id = "wh2_default", text = "Not once, in Moonglade, though I hear the stories from Ashenvale like everyone else. Some of my neighbours say I shouldn't sell to them at all, peace or no peace." } },
      choices = {
        { text = "The peace here is sacred. Sell to anyone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your neighbours have a point. Ashenvale is still bleeding.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "cl_default", text = "Darnall brings in thread and cloth from Darnassus, and I buy wool from a Horde trader who'd rather I didn't say his name. The dyes I make myself, from moonglade flowers, and those are a secret, so don't ask." } },
      choices = {
        { text = "I won't ask. Something else.", next = "BACK", fx = { trait = { discreet = 1 } } },
        { text = "Why would a Horde trader hide his name?", next = "cloth_trader" },
      },
    },
    cloth_trader = {
      lines = { { id = "ct_default", text = "Because his own people would ask why he's selling to an elf, and mine would ask why I'm buying from an orc, and neither of us wants that conversation. In Moonglade we can simply be two people who like good wool." } },
      choices = {
        { text = "Is that peace real, or only pretending?", next = "cloth_peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth_peace = {
      lines = { { id = "cp_default", text = "Real here, at least, for as long as the Keeper keeps it and the wardens keep the road. Whether it would last a day in Ashenvale I couldn't tell you, and I'd rather not be the one to find out." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    measure = {
      lines = {
        { id = "me_default", text = "Of course I was, dear; it's terribly rude not to. You carry your weight on your right side and you've been wearing that collar too tight, and I could fix both of those things by tomorrow evening." },
        { id = "me_plate", when = { class = { "WARRIOR", "PALADIN" } }, text = "Of course I was, though under all that metal I had to guess. Even a warrior wants something soft to wear when the armor comes off, and I'd make it in a colour that doesn't rust." },
      },
      choices = {
        { text = "Do you size up everyone who comes in?", next = "measure_all" },
        { text = "Something else.", next = "BACK" },
      },
    },
    measure_all = {
      lines = { { id = "ma_default", text = "Everyone, even the Keeper, though I've never dared offer him a robe. He's half a stag, and I wouldn't know where to begin, and I suspect the forest dresses him well enough." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    druids = {
      lines = { { id = "dr_default", text = "The young ones do, desperately, though they pretend otherwise. The old ones wear the same robe for centuries and call it humility, and I call it the reason I have to stand upwind of them at the Moonwell." } },
      choices = {
        { text = "Surely the old ones have earned some humility.", next = "druids_old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    druids_old = {
      lines = { { id = "do_default", text = "They've earned anything they like, dear, and they've slept through more of history than I've lived. I only think a druid can be humble and well hemmed at once, and so far nobody's proved me wrong." } },
      choices = {
        { text = "Simple robes suit a druid. Leave the old ones be.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A little pride in one's look never hurt anyone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shift = {
      lines = { { id = "sh_default", text = "They go wherever you go when you change, and come back with you, though Kharedon will tell you how a bear's shoulders strain the seams. I leave a little ease in the back of every druid's robe, just in case." } },
      choices = { { text = "Thoughtful. Something else.", next = "BACK" } },
    },
    horns = {
      lines = { { id = "ho_default", text = "Every tauren's horns curve differently, and a hood that fits one splits on the next, so I've started cutting slits and hoping. The Bluff tailors would laugh at me, I'm sure, but none of them have to dress a Runetotem and a Bloodhoof on the same afternoon." } },
      choices = { { text = "Slits work for me. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Robes, cloth, color, and who in Nighthaven needs a new hem." } },
    cenarion_circle = { { id = "tp_cc", text = "They're my best customers, dear, though they always want green." } },
    advice = { { id = "tp_ad", text = "Wear something you can move in. You never know when you'll need to run, or turn into a bear." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask me about something I can sew." } },
  },
}
