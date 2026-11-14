-- Role pools that aren't tied to one town. Narrow roles only: these people notice
-- specific things (DESIGN.md §2.3, brief 4.4). Town-specific pools live in zone packs.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Children: every child is impressed by magic and by animals.
P:Pool {
  id = "child", role = "child",
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

-- Spirit healers: a first, small set. The full conversations come in M6.
P:Pool {
  id = "spirithealer", role = "spirithealer",
  greetings = {
    { id = "g_again", when = { deaths = { min = 5 } }, text = "You again. Your file grows thick." },
    { id = "g_first", when = { deaths = { max = 1 } }, text = "Do not be afraid. Not yet." },
  },
  lines = {
    { id = "l_default", text = "You have walked a long way without your body. It is waiting." },
    { id = "l_forsaken", when = { race = "Scourge" }, text = "You have done this before, in a larger way. You know the road." },
    { id = "l_trivial", when = { deathCause = "trivial" }, text = "That creature. Truly? Your file will remember this one." },
  },
  choices = { { text = "Return me to life.", next = "BUSINESS" } },
}
