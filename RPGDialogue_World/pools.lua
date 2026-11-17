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

---------------------------------------------------------------------------
-- 0.54.0: what folk notice about your war record, your guild, your kills and what's
-- in your pack, plus late-night and early-morning lines. Notice-only pools stack onto
-- the role pools above (a named NPC with noticing moments of their own keeps to them).
-- Item ids: Head of Onyxia 18422/18423, Head of Nefarian 19002/19003 (either faction's).
---------------------------------------------------------------------------
P:Pool {
  id = "notice_guard_alliance", role = "guard", faction = "Alliance",
  notice = {
    { id = "n_rank_high", cat = "pvp", when = { pvpRank = 10 },
      text = "{rank} {name}. They read your name out at muster last week, and half the barracks wanted to know if you were as tall as the stories say." },
    { id = "n_rank_mid", cat = "pvp", when = { pvpRank = { min = 6, max = 9 } },
      text = "That's a {rank}'s bearing, if I'm any judge. The Alliance needs more like you in the field and fewer like me at gates." },
    { id = "n_rank_low", cat = "pvp", when = { pvpRank = { min = 1, max = 5 } },
      text = "A {rank}, are you? Keep at it. Every officer I've ever saluted started out with mud on their boots." },
    { id = "n_dishonor", cat = "pvp", when = { dishonorKills = { min = 3 } },
      text = "Word travels, {g:sir|ma'am}. I've heard you've cut down folk who never held a weapon, and the Alliance doesn't fight that way." },
    { id = "n_flagged", cat = "pvp", when = { pvpFlagged = true, capital = true },
      text = "You've still got the battlefield on you; I can see it in how you stand. Put it down inside the walls, if you can." },
    { id = "n_kobolds", cat = "kills", when = { killed = { name = "Kobold", min = 60 } },
      text = "The miners say someone's been clearing the kobolds out of the shafts by the cartload. I'd wager that was you." },
    { id = "n_defias", cat = "kills", when = { killed = { name = "Defias", min = 40 } },
      text = "You've put a fair number of red kerchiefs in the ground. The Brotherhood will know your face by now, so watch the hedgerows." },
    { id = "n_gnolls", cat = "kills", when = { killed = { name = { "Riverpaw", "Redridge", "Mosshide", "Gnoll" }, min = 50 } },
      text = "Farmers keep telling me the gnolls have gone quiet. Something has thinned them out, and I suspect it's standing in front of me." },
    { id = "n_murlocs", cat = "kills", when = { killed = { name = "Murloc", min = 50 } },
      text = "You smell of the shore, and of murloc. The fishermen will be glad of it, even if nobody else at the inn is." },
    { id = "n_scourge", cat = "kills", when = { killed = { name = { "Skeletal", "Ghoul", "Zombie", "Plagued", "Rotting", "Scourge" }, min = 80 } },
      text = "You've been north, haven't you? You've the look of someone who has put down a great many things that were already dead." },
    { id = "n_onyxia", cat = "carry", when = { carrying = { 18422, 18423 } },
      text = "Is that what I think it is in your pack? Light preserve us, that's a dragon's head, and it's still looking at me." },
    { id = "n_nefarian", cat = "carry", when = { carrying = { 19002, 19003 } },
      text = "Nefarian's head. I never thought I'd see the day; the whole city will want to see it hung up, and so do I." },
  },
}

P:Pool {
  id = "notice_guard_horde", role = "guard", faction = "Horde",
  notice = {
    { id = "n_rank_high", cat = "pvp", when = { pvpRank = 10 },
      text = "{rank} {name}. The grunts tell stories about you around the fires, and most of them are probably true." },
    { id = "n_rank_mid", cat = "pvp", when = { pvpRank = { min = 6, max = 9 } },
      text = "A {rank}. You've bled for the Horde and it shows. Stand where the young ones can see you." },
    { id = "n_rank_low", cat = "pvp", when = { pvpRank = { min = 1, max = 5 } },
      text = "{rank}, is it? Good, it's a start. Bring back more than a title next time, and the Warchief will know your name." },
    { id = "n_dishonor", cat = "pvp", when = { dishonorKills = { min = 3 } },
      text = "I've heard you kill those who can't fight back. There is no honor in that, and the Warchief's orcs don't forget." },
    { id = "n_flagged", cat = "pvp", when = { pvpFlagged = true, capital = true },
      text = "You've still got blood in your eye from the front. Good; just keep it pointed at the Alliance and not at the market." },
    { id = "n_quilboar", cat = "kills", when = { killed = { name = { "Razormane", "Bristleback", "Death's Head", "Quilboar" }, min = 60 } },
      text = "The quilboar have been bleeding all season, and the scouts say it's one fighter's work. They must mean you." },
    { id = "n_centaur", cat = "kills", when = { killed = { name = { "Kolkar", "Galak", "Magram", "Gelkis", "Centaur" }, min = 50 } },
      text = "The centaur clans curse a name around their fires now. I didn't catch it, but I think it's yours." },
    { id = "n_bladecult", cat = "kills", when = { killed = { name = "Burning Blade", min = 20 } },
      text = "You've been killing Burning Blade cultists. Good. Every one of them is an orc who chose the demons again, and they get no grief from me." },
    { id = "n_scarlet", cat = "kills", when = { killed = { name = "Scarlet", min = 50 } },
      text = "You've been at the Scarlet Crusade, I hear. Those zealots would burn every one of us, so I hope you made them pay for the wood." },
    { id = "n_onyxia", cat = "carry", when = { carrying = { 18422, 18423 } },
      text = "Lok'tar! That's the black dragon's head in your pack. Take it to the Warchief before it starts whispering again." },
    { id = "n_nefarian", cat = "carry", when = { carrying = { 19002, 19003 } },
      text = "Nefarian's head, in your hands. My grandfather would have wept to see Blackrock's master brought low by the Horde." },
  },
}

P:Pool {
  id = "notice_citizen_alliance", role = "citizen", faction = "Alliance",
  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 8 },
      text = "You're the {rank}, aren't you? My nephew talks about you as if you were Lothar himself." },
    { id = "n_defias", cat = "kills", when = { killed = { name = "Defias", min = 40 } },
      text = "Somebody's been making the Defias pay, and folk say it's you. My cousin lost her farm to them, so thank you." },
    { id = "n_many", cat = "kills", when = { killed = { min = 3000 } },
      text = "You've a hard look about you, the look of someone who's fought too many battles to count. I hope you sleep well, at least." },
    { id = "n_onyxia", cat = "carry", when = { carrying = { 18422, 18423 } },
      text = "Is that a dragon's head in your pack? Light help me, I think it blinked." },
  },
  greetings = {
    { id = "g_guild", when = { guild = true, timesTalked = { max = 1 } },
      text = "You're with {guild}, aren't you? I've heard the name in the market, and mostly good things." },
    { id = "g_late", when = { timeOfDay = "night" },
      text = "Out at this hour? Mind the shadows; the watch can't be everywhere at once." },
  },
}

P:Pool {
  id = "notice_citizen_horde", role = "citizen", faction = "Horde",
  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 8 },
      text = "You're the {rank} the grunts sing about. I thought you'd be bigger, but the scars are right." },
    { id = "n_quilboar", cat = "kills", when = { killed = { name = { "Razormane", "Bristleback", "Quilboar" }, min = 60 } },
      text = "The quilboar don't raid our caravans the way they used to. My brother says that's your doing, so I owe you a drink." },
    { id = "n_many", cat = "kills", when = { killed = { min = 3000 } },
      text = "You've the eyes of a veteran, the kind who stopped counting their battles a long time ago. Strength to you." },
    { id = "n_onyxia", cat = "carry", when = { carrying = { 18422, 18423 } },
      text = "Spirits watch over us, is that a dragon's head? Keep it wrapped up; the children are watching." },
  },
  greetings = {
    { id = "g_guild", when = { guild = true, timesTalked = { max = 1 } },
      text = "You march with {guild}, don't you? I've heard the name in the camps; they say it's a good one." },
    { id = "g_late", when = { timeOfDay = "night" },
      text = "Late to be wandering. The fires are low, but sit if you need to; nobody's turned away from a fire here." },
  },
}

P:Pool {
  id = "notice_innkeeper", role = "innkeeper",
  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "A {rank} under my roof! Your first drink's on the house; it's good for business when the regulars see you here." },
    { id = "n_dishonor", cat = "pvp", when = { dishonorKills = { min = 3 } },
      text = "I've heard things about you, and I'll not repeat them in front of the other guests. You'll pay up front tonight." },
    { id = "n_guildmaster", cat = "guild", when = { guildRank = "Guild Master" },
      text = "You lead {guild}, don't you? If you're bringing the lot of them through tonight, warn me first, so I can hide the good cheese." },
    { id = "n_guild", cat = "guild", when = { guild = true },
      text = "Your {guild} friends were through here last week. They paid their tab, mostly, and I'd thank you to remind the rest." },
    { id = "n_loner", cat = "guild", when = { guild = false, minLevel = 40 },
      text = "You travel alone, don't you? There's no shame in it, but a table of friends makes the road shorter, and I've plenty of tables." },
    { id = "n_onyxia", cat = "carry", when = { carrying = { 18422, 18423 } },
      text = "Whatever you've got in that sack, it's not coming up to the rooms. I can smell the dragon on it from here." },
  },
  greetings = {
    { id = "g_late", when = { timeOfDay = "night" },
      text = "Come in, come in, and shut the door against the cold. There's still a fire, and I can warm the stew." },
    { id = "g_dawn", when = { timeOfDay = "dawn" },
      text = "You're up before the bread's out. Sit; the kettle's on, and you're the first company I've had all morning." },
  },
  lines = {
    { id = "l_night", when = { timeOfDay = "night" },
      text = "This is the best hour in an inn. The loud ones have gone to bed and the honest ones are still talking." },
    { id = "l_dawn", when = { timeOfDay = "dawn" },
      text = "Half my guests leave before sunrise, and the other half leave before I've counted the spoons." },
  },
}
