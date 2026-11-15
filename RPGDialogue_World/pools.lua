-- Role pools that aren't tied to one town. Narrow roles only: these people notice
-- specific things (DESIGN.md §2.3, brief 4.4). Town-specific pools live in zone packs.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Children: every child is impressed by magic and by animals.
P:Pool {
  id = "child", role = "child",
  barks = {
    { id = "b_look", text = "Mama, look! An adventurer!" },
    { id = "b_sword", when = { class = { "WARRIOR", "PALADIN" } }, text = "I bet I could carry that sword, I bet I could." },
    { id = "b_kitty", when = { form = "cat" }, text = "Look, there's a big kitty! Is it a friendly one?" },
  },
  greetings = {
    { id = "g_hi", text = "Are you an adventurer, a real one, like in the stories?" },
    { id = "g_sword", when = { class = { "WARRIOR", "PALADIN" } }, text = "Is that sword heavy? Can I hold it, just for a second? I won't drop it, I promise." },
  },
  notice = {
    { id = "n_cat", cat = "form", when = { form = "cat" }, place = "replace",
      text = "You were a person and now you're a kitty! Can I pet you, please? I'll be really gentle." },
    { id = "n_bear", cat = "form", when = { form = "bear" }, place = "replace",
      text = "A bear! Mama says bears eat children. You look like a nice bear, though." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" }, place = "replace",
      text = "You're all dark and wavy! Are you a ghost? Mama says ghosts aren't real, so are you real?" },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Does {pet} bite? Does {pet} like apples, because I've got half an apple right here?" },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "What IS that? It's making faces at me, so I'm making faces back." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Can you do a trick, just a little one, like making something float?" },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" }, place = "replace",
      text = "A ghost doggy! Are you a ghost or a doggy or both, and can I ride you, please?" },
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "You're so fast like that! Can you race the guards' horses? I bet you'd win, I bet you would." },
    { id = "n_moonkin", cat = "form", when = { form = "moonkin" }, place = "replace",
      text = "You're a great big owl-bear! Please hoot for me, just once, and I promise I won't tell anybody." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "You're hardly any taller than me, but you're a grown-up, aren't you? Can you fix my wooden horse, because its wheel came off?" },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You're the biggest person I ever saw! Do you have to duck under every single door?" },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Is it true you lived up in the sky? Were there birds everywhere, and did you ever get to sit on a cloud?" },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Are you a knight, a real one, with the Light? Make it glow, please, just a little bit, just for me." },
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your big blue shadow-man is following you! Does it have a name, and does it like stories?" },
    { id = "n_cat_pet", cat = "pet", when = { pet = { family = "Cat" } },
      text = "Is that a real tiger? I'm going to have one when I'm big, and nobody can stop me." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk so quietly! Can you teach me how? I want to sneak up on my brother." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "What are those things on your belt? Are they toys? Can I have the fire one?" },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Are you, um, dead? Mama says not to stare at the Forsaken, but you're staring at me, so that's fair." },
  },
  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "You just turned into a cat! Do it again, do it again!" },
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Whoa! You got so big!" },
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "You went all dark! Now do the other one, the shiny one!" },
    { id = "r_stealth", on = "stealth", text = "Where'd you go? I can still see your feet a bit." },
    { id = "r_pet", on = "pet", text = "Where did that come from? Is it yours?" },
    { id = "r_wolf", on = "form", when = { form = "ghostwolf" }, text = "You turned into a wolf! A see-through wolf!" },
    { id = "r_travel", on = "form", when = { form = "travel" }, text = "You turned into a big spotty cat! Do it slower so I can see how!" },
    { id = "r_moonkin", on = "form", when = { form = "moonkin" }, text = "You're a giant owl now! That's not fair, I want to be an owl." },
  },
  lines = {
    { id = "l_default", text = "I'm not supposed to talk to strangers, but you're not very strange." },
    { id = "l_hero", when = { townStanding = { min = 30 } }, text = "Everybody says you're a hero. Are you? Did you fight anything big?" },
    { id = "l_mage", when = { class = "MAGE" }, text = "Can you make it snow, just here, just on me? I won't tell anybody it was you." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "Do you shoot apples off people's heads? My brother says hunters do that, but my brother says lots of things." },
    { id = "l_warlock", when = { class = "WARLOCK" }, text = "Mama says I mustn't go near people who smell like matches. You smell like matches, but you don't look very scary." },
  },
  choices = {
    { text = "Run along home, now.", next = "END", fx = { trait = { stern = 1 } } },
    { text = "I'll show you a trick another time.", next = "END", fx = { trait = { kind = 1 } } },
  },
  topics = {
    _none = { { id = "t_none", text = "I don't know, I'm only little. You should ask a grown-up." } },
  },
}

-- Flight masters: professional opinions about anything that flies.
P:Pool {
  id = "flightmaster_alliance", role = "flightmaster", faction = "Alliance",
  greetings = {
    { id = "g_where", text = "Where to, then? The birds are rested and ready." },
    { id = "g_again", when = { timesTalked = { min = 5 } }, text = "Back again? You'd think you owned a gryphon." },
  },
  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "I've heard about your people's little glide. It's a nice trick for going down, but a gryphon goes up." },
    { id = "n_druid_travel", cat = "form", when = { form = "travel" },
      text = "Four legs are fine on a road. Wings get you there before your supper's cold." },
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Fine animal, but it doesn't fly, does it?" },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "The Ironforge birds take to dwarves better than anyone. It's the beard, I think; they mistake it for a nest." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Hold on with both hands, now. A gnome comes off a gryphon easier than you'd think, and the ground's a long way down." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Your hippogryphs over in Kalimdor are gentler than my birds. Don't hold it against them; gryphons just have opinions." },
    { id = "n_hunter", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "{pet} stays on the ground, I'm afraid. It'll find you at the other end; they always do." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Send that thing away before you mount up. My birds won't fly with a demon anywhere near the saddle." },
  },
  lines = {
    { id = "l_default", text = "Pay the fare, hold on, and don't lean. That's all there is to it." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "You'll be wanting to arrive quietly. Gryphons don't do quiet, so you'll have to manage that part yourself." },
    { id = "l_mage", when = { class = "MAGE" }, text = "Mages teleport to the capitals, I hear, and fly with me everywhere else, so we're not rivals just yet." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "Warriors always want to jump off before we land. Please don't; the bird takes it personally." },
  },
  choices = { { text = "Just the flight, thanks.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Gryphon riders talk more than they ought to, and I'm the one they talk to when they land. Here's what I've heard from the roosts." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You're one of my regulars now, so you'll hear what the riders say over their ale as well." },
    },
  },
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
      text = "I think you've had your share, friend. Sit down, and have some water first." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You've the look of someone who eats for three. Warriors always do, and they never once leave the bread basket for the next table." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Conjured your own water again, have you? Sit and drink mine anyway; it's better company." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Rooms are upstairs, and the other guests' purses stay where they are. I say that to everyone, but I say it a little more firmly to you." },
    { id = "n_hunter", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "{pet} sleeps by the fire, not on the bed. The last hunter's cat shed on every blanket I own." },
    { id = "n_bear", cat = "form", when = { form = "bear" }, place = "replace",
      text = "Not through the door like that, please; the frame's older than I am, and it's had a hard life." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" },
      text = "Leave the wolf at the door, shaman. The regulars won't drink with anything see-through at the table." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "You'll not be wanting the stew, I'd guess. Sit by the fire anyway; a fire's good for everyone, breathing or not." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Mind your horns on the beam by the stairs. Everyone your size hits it once, and the beam has the scars to prove it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, good. You'll know a decent ale when you taste one, and I'll want your honest opinion of mine." },
  },
  lines = {
    { id = "l_default", text = "Warm fire, cold drink, soft bed: pick any two." },
    { id = "l_warlock", when = { class = "WARLOCK" }, text = "Your sort keep odd hours and odder company. Pay up front, and keep the candles away from the curtains." },
    { id = "l_paladin", when = { class = "PALADIN" }, text = "A paladin under my roof! The drunks behave better when one of you is sitting by the fire." },
  },
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
  lines = { { id = "l_default", text = "Everything's priced fair, mostly." } },
  choices = { { text = "Let me see your wares.", next = "BUSINESS" } },
}

-- Trainers anywhere (named trainers override this).
P:Pool {
  id = "trainer", role = "trainer",
  greetings = { { id = "g_ready", text = "Ready to learn something?" } },
  lines = { { id = "l_default", text = "Practice what I teach you, or don't come back for more." } },
  choices = { { text = "Train me.", next = "BUSINESS" } },
}

-- Spirit healers live in spirithealer.lua (one shared character, the deepest in the addon).
