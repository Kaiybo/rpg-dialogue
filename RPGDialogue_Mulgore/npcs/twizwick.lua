-- Twizwick Sprocketgrind: a goblin engineering trainer camped on a high plateau reached through the
-- Venture Co. Mine, who will train anyone of either faction. Voice: bibles/twizwick.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "twizwick", id = TODO_NPC("Twizwick Sprocketgrind"), name = "Twizwick Sprocketgrind",
  title = "Engineering Trainer",
  bible = "bibles/twizwick.md", role = "trainer", tier = "service",
  communities = {}, temper = { "manic", "cheerful" }, values = { "craft", "profit" },
  notices = { "craft", "race" },

  impression = {
    first = "He adores the smell of grease and insists he isn't Venture Company.",
    third = "{name} met Twizwick Sprocketgrind, a goblin engineering trainer camped on a lonely plateau above the Venture Co. Mine in Mulgore.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Sniff, sniff! Ah, it's you! My favorite apprentice! Come smell this new grease. It's divine!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Sniff, sniff. Oh, you. Fine, fine. Here's the grease. Try not to blow anything up." },
    { id = "g_default", text = "Sniff, sniff! You smell that? Don't you just love the smell of grease, pal?" },
    { id = "g_back", when = { metBefore = true }, text = "Back up the mountain! Ya must really love engineering, or ya really love climbing, and I only charge for one of those." },
    { id = "g_eng", when = { profession = "Engineering" }, text = "A fellow enthusiast, huh? Well, you just wait, we'll make a proper gearhead out of you in no time." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Whoa, whoa, a tauren up here, and you didn't bring the braves? Good, because the last time a brave came up, he knocked over a crate of blasting powder and I had to rebuild the whole east side of the camp." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Look at those scorch marks on your gloves, chum. Somebody's been playing with copper tubes, and somebody's lucky to still have ten fingers." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Twizwick Sprocketgrind, engineer, inventor and the only goblin in Mulgore who'll teach you without making you sign a Venture Company contract first. Horde, Alliance, I don't care, pal, your gold all clinks the same." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "An Alliance type, all the way up here in tauren country! Don't worry, I won't tell anybody, and nobody comes up here anyway, which is the whole point of the place." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Now there's a customer who already knows which end of the wrench to hold, though your lot use far too many cogs and not nearly enough explosives." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time is money, and I've got plenty of both up here." },
        { id = "h_again2", text = "Go on, ask, the questions are free and the lessons ain't." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Are you with the Venture Company?", next = "venture" },
        { text = "Why live up here alone?", next = "alone" },
        { text = "What's the best thing you've ever built?", next = "best" },
        { text = "What are you working on right now?", next = "project" },
        { text = "The tauren must find you strange.", next = "tauren_odd" },
        { text = "My last target dummy exploded. Normal?", next = "dummy", when = { profession = { name = "Engineering", min = 50 } } },
        { text = "I'll be going.", next = "END" },
      },
    },
    project = {
      lines = { { id = "project_d", text = "A steam-driven plough, pal, for the tauren farmers down below, so they can turn a field in an hour instead of a day. It's had two test runs, and only one of 'em set the field on fire, which in engineering is what we call progress." } },
      choices = {
        { text = "Do the tauren actually want a steam plough?", next = "project_want" },
        { text = "One fire out of two isn't bad.", next = "BACK", reply = "That's what I said! The farmer was less excited about it, but I'm told he's coming round." },
        { text = "Something else.", next = "BACK" },
      },
    },
    project_want = {
      lines = { { id = "project_want_d", text = "They want the field turned faster, and I want to be paid for it, so we're in agreement on the important parts. The elders keep sayin' something about the Earth Mother not likin' noise, but nobody's paid me to make it quieter yet." } },
      choices = {
        { text = "Maybe they'll pay for a quiet one.", next = "BACK", reply = "Now you're thinkin' like a goblin! Quiet costs extra, of course." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    tauren_odd = {
      lines = { { id = "tauren_odd_d", text = "They do, and I find them strange right back, so we're even. They bring me broken things, buckets and wagon wheels and the odd spear, and they never haggle, which is the strangest thing I ever saw in my life." } },
      choices = {
        { text = "They never haggle at all?", next = "tauren_haggle" },
        { text = "You must charge them too much, then.", next = "BACK", reply = "Listen, I charge 'em fair, and that's more than the Venture boys would. I've got a reputation up here." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren_haggle = {
      lines = { { id = "tauren_haggle_d", text = "Not a copper's worth, pal. They name the price they think is fair and they pay it, and if I ask for more they just look at me with those big sad eyes until I feel like a heel. I've lost more profit to guilt up here than I ever lost to bad luck." } },
      choices = {
        { text = "Guilt in a goblin? That's new.", next = "BACK", reply = "Don't tell anybody in Ratchet, or I'll never live it down." },
        { text = "Another question.", next = "BACK" },
      },
    },
    dummy = {
      lines = { { id = "dummy_d", text = "Normal? It's practically a rite of passage, friend! The first one I built blew my eyebrows clean off, and the second took the whole shed, so if yours only exploded, you're already ahead of where I was at your age." } },
      choices = {
        { text = "That's oddly comforting.", next = "BACK", reply = "That's engineering! Comfort in the face of combustion." },
        { text = "Something else.", next = "BACK" },
      },
    },

    venture = {
      big = true,
      lines = { { id = "ve_default", text = "Me? With those cut-throats? No, no, no, I worked for 'em once, and they docked my wages for every explosion that wasn't on the schedule, and that was most of 'em. Now I live above their mine and watch 'em dig, and it's cheaper than paying for a show." } },
      choices = {
        { text = "Good. They're ruining Mulgore.", next = "ve_more", fx = { align = { honor = 1 } } },
        { text = "Business is business. They pay well, and that's what counts.", next = "ve_more", fx = { align = { honor = -1 } } },
        { text = "Why did you leave?", next = "ve_more" },
      },
    },
    ve_more = {
      lines = { { id = "vem_default", text = "Because a Venture contract has more small print than a gnome's diary, pal, and somewhere in it they own your eyebrows. The tauren chase 'em off the lake and they come right back, and I sell 'em nothing, and that's my little protest." } },
      choices = {
        { text = "That's a good protest.", next = "BACK", fx = { affinity = 1, learn = { "venture_company" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    alone = {
      lines = { { id = "al_default", text = "No neighbors, no rent, no foreman, and nobody to complain when something goes boom at midnight. It's paradise, pal, if you don't count the wind and the swoops and the long walk for water." } },
      choices = {
        { text = "Doesn't it get lonely?", next = "al_lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    al_lonely = {
      lines = { { id = "all_default", text = "Lonely? I talk to my machines, and they talk back, mostly with sparks. And customers like you climb up here every few days, so I get just enough company to remember why I moved away from it." } },
      choices = {
        { text = "I'll take that as a compliment.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    best = {
      lines = { { id = "be_default", text = "A rocket-powered butter churn, pal, which churned a whole barrel of cream in four seconds and then flew into the lake. The butter was excellent, and the fish ate well for a week." } },
      choices = {
        { text = "Will you build another?", next = "be_again" },
        { text = "Something else.", next = "BACK" },
      },
    },
    be_again = {
      lines = { { id = "bea_default", text = "Already sketching it, chum, on the back of the bill for the first one. Nobody's paid it yet, so the design's still technically on account." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Gears, grease, gunpowder and the Venture Company's dirty laundry, pal." } },
    background = { { id = "tp_bg", text = "Ex-Venture, now free-range. Best decision I ever made, and the cheapest." } },
    advice = { { id = "tp_ad", text = "Keep your fuse long and your exit short, chum. That's engineering in seven words." } },
    venture_company = { { id = "tp_vc", text = "Small print, big drills and no sense of humor. I'd know.", next = "venture" } },
    _none = { { id = "tp_none", text = "Can't build it, can't blow it up, so I don't know it, pal." } },
  },
}
