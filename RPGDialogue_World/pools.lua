-- Role pools that aren't tied to one town. Narrow roles only: these people notice
-- specific things (DESIGN.md §2.3, brief 4.4). Town-specific pools live in zone packs.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Children: every child is impressed by magic and by animals.
P:Pool {
  id = "child", role = "child",
  barks = {
    { id = "b_look", text = "Mama, look! An adventurer!" },
    { id = "b_sword", when = { class = { "WARRIOR", "PALADIN" } }, text = "Bet I could carry that sword. Bet I could." },
    { id = "b_kitty", when = { form = "cat" }, text = "There's a big kitty! Is it friendly?" },
  },
  greetings = {
    { id = "g_hi", text = "Are you an adventurer? A real one?" },
    { id = "g_sword", when = { class = { "WARRIOR", "PALADIN" } }, text = "Is that sword heavy? Can I hold it? I won't drop it." },
  },
  notice = {
    { id = "n_cat", cat = "form", when = { form = "cat" }, place = "replace",
      text = "You were a person and now you're a kitty! Can I pet you? I'll be gentle." },
    { id = "n_bear", cat = "form", when = { form = "bear" }, place = "replace",
      text = "A bear! Mama says bears eat children. You look like a nice bear, though." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Does {pet} bite? Does {pet} like apples? I have half an apple." },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "What IS that? It's making faces at me. I'm making faces back." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Can you do a trick? A little one? Make something float?" },
  },
  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "You just turned into a cat! Do it again! Do it again!" },
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Whoa! You got so big!" },
    { id = "r_stealth", on = "stealth", text = "Where'd you go? I can still see your feet a bit." },
    { id = "r_pet", on = "pet", text = "Where did that come from? Is it yours?" },
  },
  lines = {
    { id = "l_default", text = "I'm not supposed to talk to strangers. But you're not very strange." },
    { id = "l_hero", when = { townStanding = { min = 30 } }, text = "Everybody says you're a hero. Are you? Did you fight anything big?" },
  },
  choices = {
    { text = "Run along home, now.", next = "END", fx = { trait = { stern = 1 } } },
    { text = "I'll show you a trick another time.", next = "END", fx = { trait = { kind = 1 } } },
  },
  topics = {
    _none = { { id = "t_none", text = "I don't know. I'm only little. Ask a grown-up." } },
  },
}

-- Flight masters: professional opinions about anything that flies.
P:Pool {
  id = "flightmaster_alliance", role = "flightmaster", faction = "Alliance",
  greetings = {
    { id = "g_where", text = "Where to? The birds are rested." },
    { id = "g_again", when = { timesTalked = { min = 5 } }, text = "Back again. You'd think you owned a gryphon." },
  },
  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "I've heard about your people's little glide. Nice trick for going down. A gryphon goes up." },
    { id = "n_druid_travel", cat = "form", when = { form = "travel" },
      text = "Four legs are fine on a road. Wings get you there before your supper's cold." },
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Fine animal. Doesn't fly, though, does it?" },
  },
  lines = {
    { id = "l_default", text = "Pay the fare, hold on, don't lean. That's all there is to it." },
  },
  choices = { { text = "Just the flight, thanks.", next = "BUSINESS" } },
}

-- Innkeepers anywhere (named innkeepers override this).
P:Pool {
  id = "innkeeper", role = "innkeeper",
  greetings = {
    { id = "g_room", text = "Room, meal, or both?" },
    { id = "g_home", when = { homeInn = true }, text = "Welcome home. Your bed's as you left it." },
  },
  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your little friend doesn't sleep in the beds. Last one set the sheets smoldering." },
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } },
      text = "I think you've had your share, friend. Sit. Water first." },
  },
  lines = { { id = "l_default", text = "Warm fire, cold drink, soft bed. Pick any two." } },
  choices = { { text = "A room, please.", next = "BUSINESS" }, { text = "Just passing through.", next = "END" } },
  topics = { _none = { { id = "t_none", text = "Never heard of it, and I hear most things." } } },
}

-- Vendors anywhere.
P:Pool {
  id = "vendor", role = "vendor",
  greetings = {
    { id = "g_buying", text = "Buying or selling?" },
    { id = "g_rich", when = { money = { min = 1000000 } }, text = "Ah, a customer with weight in their purse." },
  },
  lines = { { id = "l_default", text = "Everything's priced fair. Mostly." } },
  choices = { { text = "Let me see your wares.", next = "BUSINESS" } },
}

-- Trainers anywhere (named trainers override this).
P:Pool {
  id = "trainer", role = "trainer",
  greetings = { { id = "g_ready", text = "Ready to learn something?" } },
  lines = { { id = "l_default", text = "Practice what I teach you, or don't come back for more." } },
  choices = { { text = "Train me.", next = "BUSINESS" } },
}

-- Spirit healers: one shared character for every spirit healer, because they seem to keep
-- shared records ("your file"). Philosophical, wry, kind; the nature of the afterlife stays
-- a mystery (no Shadowlands, no Maw, nothing from later expansions).
P:Pool {
  id = "spirithealer", role = "spirithealer", tier = "major", spiritSensitive = true,
  notices = { "death" },
  greetings = {
    { id = "g_again", when = { deaths = { min = 5 } }, text = "You again. Your file grows thick." },
    { id = "g_first", when = { deaths = { max = 1 } }, text = "Do not be afraid. Not yet." },
    { id = "g_plain", text = "Your body is waiting. So am I." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "You have left your body behind again. It is waiting where you fell, in {deathplace}." },
        { id = "h_first", when = { deaths = { max = 1 } }, text = "The first time is the strangest. Breathe, if you remember how. You will not need to." },
        { id = "h_ten", when = { deaths = { min = 10, max = 24 } }, text = "Your file is thicker than most. I do not say that to wound you." },
        { id = "h_many", tags = { "news" }, when = { deaths = { min = 25, max = 49 } }, text = "{deaths} times. The others have begun to recognize your footsteps." },
        { id = "h_fifty", tags = { "news" }, when = { deaths = { min = 50 } }, text = "We have started a second file. The first one would not close." },
        { id = "c_falling", when = { deathCause = "falling" }, text = "The ground does not negotiate. You knew that once." },
        { id = "c_drowning", when = { deathCause = "drowning" }, text = "Water is patient. You were not." },
        { id = "c_fatigue", when = { deathCause = "fatigue" }, text = "You swam out until the world ran out. It does that." },
        { id = "c_guard", when = { deathCause = "guard" }, text = "A guard. Yours or someone else's, it makes the same mark in the file." },
        { id = "c_player", when = { deathCause = "player" }, text = "Another traveler sent you. The living are hard on one another." },
        { id = "c_trivial", when = { deathCause = "trivial" }, text = "This one I will write down kindly. {killer}. Small, but determined." },
        { id = "c_elite", when = { deathCause = "elite" }, text = "{killer}. A worthy reason, as such things are counted." },
        { id = "c_boss", when = { deathCause = "boss" }, text = "You went where the great ones wait, and one of them was waiting for you." },
        { id = "h_same_place", tags = { "news" }, priority = 5, when = { deathsHere = { min = 3 } },
          text = "{deathplace} again. You keep returning to the same door, as if it might open differently." },
        { id = "h_streak", tags = { "news" }, when = { daysSinceDeath = { min = 14 } },
          text = "A long while since I last saw you. The file had begun to gather dust. I was almost glad." },
        { id = "k_shaman", when = { class = "SHAMAN", minLevel = 30 }, text = "You carry your own way back. No ankh today?" },
        { id = "k_warlock", when = { class = "WARLOCK" }, text = "No soulstone this time? Your kind usually bargains its way past me." },
        { id = "k_healer", when = { class = { "PRIEST", "PALADIN" } }, text = "You raise others from where I stand. Strange, to see you on this side of the work." },
        { id = "r_forsaken", when = { race = "Scourge" }, text = "You have died before, in a larger way. You know this road better than I do." },
        { id = "r_nightelf", when = { race = "NightElf" }, text = "You come to me as a wisp, like all your people. A little light, insisting." },
        { id = "a_taint", when = { taint = { min = 30 } }, text = "Something came with you that should not have. It is watching me. Go, quickly." },
        { id = "a_light", when = { alignment = { axis = "light", min = 40 } }, text = "Gently, now. You have done more good than your file shows." },
        { id = "a_shadow", when = { alignment = { axis = "light", max = -40 } }, text = "I will return you. I am not required to approve." },
      },
      choices = {
        { text = "Return me to life.", next = "BUSINESS" },
        { text = "What does my file say?", next = "record" },
        { text = "What are you?", next = "mystery" },
        { text = "Why do you help us?", next = "why" },
      },
    },
    record = {
      lines = {
        { id = "rec_default", text = "{deaths} deaths. The last at {deathplace}. The records are complete, if not flattering." },
        { id = "rec_one", when = { deaths = { max = 1 } }, text = "One death. The file is a single page. Keep it that way, if you can." },
        { id = "rec_trivial", priority = 10, when = { deathCause = "trivial" }, text = "{deaths} deaths, the last at the hands of {killer}. I have underlined it." },
      },
      choices = {
        { text = "Burn the file.", next = "burn", fx = { trait = { witty = 1 } } },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },
    burn = {
      lines = { { id = "b_default", text = "It does not burn. Many have asked. One tried." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" } },
    },
    mystery = {
      lines = { { id = "m_default", text = "I am the one who stands here. That is all I am permitted to know, and more than most ask." } },
      choices = {
        { text = "Permitted by whom?", next = "mystery2", fx = { trait = { curious = 1 } } },
        { text = "Fair enough.", next = "hello" },
      },
    },
    mystery2 = {
      lines = { { id = "m2_default", text = "Ask me again when you have died a hundred times. I may know by then. So may you." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" } },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because you are not finished. None of you ever are." },
        { id = "w_shadow", when = { alignment = { axis = "light", max = -40 } },
          text = "Because I am asked to, not because you deserve it. Forgive the honesty. This place makes it easy." },
      },
      choices = {
        { text = "Thank you.", next = "BUSINESS", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },
  },
  topics = { _none = { { id = "t_none", text = "The living ask about the living. I keep other records." } } },
}
