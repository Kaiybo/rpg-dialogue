-- The Crossroads. Voice: bibles/crossroads.md
-- Thork holds the walls, Sergra holds the road, Mankrik holds a grudge.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thork", id = TODO_NPC("Thork"), name = "Thork",
  bible = "bibles/crossroads.md", role = "soldier", tier = "quest",
  communities = { "crossroads" }, temper = { "firm" }, values = { "loyal", "dutiful" },
  notices = { "race", "kit" },
  impression = {
    first = "Thork keeps the Crossroads for the Warchief and treats every road in the Barrens as his to hold. He is firm and fair after his fashion, and he will not spend soldiers on a grieving man's vengeance.",
    third = "{name} met Thork, the steadfast orc who holds the Crossroads for the Warchief against every threat in the Barrens.",
  },

  greetings = {
    { id = "g_home", text = "Make yourself at home at the Crossroads, and mind your own business while you do." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the road, I see. The Crossroads is glad of you, so don't let it go to your head." },
  },

  notice = {
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "An Alliance face at the Crossroads? That's bold. You'll get the same welcome as anyone else, once, so don't make me regret it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been out among the centaur, by the look of it. Get yourself patched up; the Horde needs you standing." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Hands for the wounded and a steady voice for the dying, because the Razormane don't leave many clean cuts. I care little whether your prayers go to the loa or to the shadow, so long as my grunts get back on the wall." } },
      choices = {
        { text = "Then I'll tend your wounded before my own business.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your grunts chose the wall. Their wounds are their own affair.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Thork.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Along the southern road at dusk, and around the Stagnant Oasis by night, where the water draws them in. Track them back to their camps and I can send grunts to hit them before they hit us, which is how I like to fight." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a good nose on it. Put it to work along the road, and it'll find centaur sign before you do." },
      },
      choices = {
        { text = "I'll scout for the wall, Thork, and report back.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Scouting's too slow. I'll hunt the centaur myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I need everything I can get. The Kolkar have their stormers and the quilboar have geomancers who make the thorns move, so if the enemy brings spirits to the fight, I'd be a fool not to bring my own." } },
      choices = {
        { text = "Then I'll answer your call, Thork, like the rest of the garrison.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight beside you, but the spirits aren't the Horde's to command.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "There is, though I won't say it too loudly on the wall where the grunts can hear. The Kolkar and the Razormane both scout this road at night, and a blade that watches their scouts without being seen is worth ten that charge them." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "There is, and I've learned to look past what the Forsaken are when they make themselves useful. The Kolkar and the Razormane both scout this road at night, and a blade that watches their scouts without being seen is worth ten that charge them." },
      },
      choices = {
        { text = "A scout who never sees me never reports back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather meet them in the open, under your banner.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What else threatens the Crossroads?", next = "threats" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Only if your demon forgets whose road this is. The Warchief allows your kind under watch, and I'll keep that watch myself, so keep the thing leashed and away from the tauren caravans, who've heard enough about the Burning Blade to reach for their spears." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "You're an orc, so you know what that power cost our people the first time. The Warchief allows it under watch, and I'll be the watch here, so keep your demon leashed and away from the tauren caravans." },
      },
      choices = {
        { text = "My demon answers to me, and I answer to the Warchief.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My power is my own business, Thork.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's the hardest part of holding the Crossroads?", next = "hardest" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The tauren blame the druids who went down into the Wailing Caverns, and they say their magic has twisted the water underground. I don't know druid business, but I know the oases are shrinking and the Kolkar fight harder over each one, so whatever's wrong, I need it fixed." } },
      choices = {
        { text = "Hold the oases first. We can mend the land once they're ours.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fix the caverns first, or there'll be no water left to hold.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "On the wall at dusk, when the Razormane come up the road in a pack and my grunts can't reach them before they scatter. Your fire breaks a charge before it starts, but keep it off the grass, because a burning plain doesn't care whose side it's on." },
      },
      choices = {
        { text = "I'll stand the wall at dusk and answer to your sergeant.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go where my spells are needed, not where I'm posted.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Thork.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Thork, and I keep the Crossroads for the Warchief. Every road in the Barrens meets here, and so does every kind of trouble." },
        { id = "h_journey", tags = { "news" }, when = { questActive = TODO_QUEST("Journey to the Crossroads") },
          text = "So they sent you to me. Good, I've more work than warriors. Rest a night, and then we'll see what you're made of." },
        { id = "h_disrupt", when = { questActive = TODO_QUEST("Disrupt the Attacks") },
          text = "Kolkar raiders hit our caravans and run. I want you to hit them first, hard enough that they think twice before they ride at the Crossroads." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Supplies for the Crossroads") },
          text = "The raiders took our supplies. Bring back whatever you can find, because every crate is another week we hold." },
        { id = "h_mankrik", when = { heardLine = "mankrik.h_default" },
          text = "So Mankrik told you his story. I'm sorry for his loss, but I won't send soldiers to die for a man who can't see past his anger. Someone has to say no." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at the Crossroads. Good, because the Barrens are dry as bone, and if you can find water where my scouts can't, you're worth three grunts on my wall." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid at the Crossroads. The Barrens are drying out faster every season, and if your kind can tell me why, you'll do more good than a dozen grunts on my wall." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Good, because the Barrens is all open ground, and I need someone who can see the Kolkar coming before they reach my wall." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The Crossroads sends more wounded back through that gate than I have beds for, so you'll find work here if you want it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage at the Crossroads. I don't understand your spells, but I understand a fireball landing among the Kolkar, and my wall could use a few." },
      },
      choices = {
        { text = "Do you need the spirits' help to hold the Crossroads?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why are the Barrens drying out, Thork?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What's the hardest part of holding the Crossroads?", next = "hardest" },
        { text = "What threatens the Crossroads?", next = "threats" },
        { text = "I work from the shadows, Thork. Is there a use for that here?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Where do the Kolkar scouts move, Thork?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'm a warlock, Thork. Will that be trouble at the Crossroads?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I'm loyal to the Horde.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I look out for myself first, and the Horde second.", next = "END", fx = { align = { honor = -1 } } },
        { text = "Give me a post on the wall, Thork.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Do you trust the Forsaken at your crossroads?", next = "forsaken", when = { race = "Scourge" } },
        { text = "What does the Crossroads need from a priest, Thork?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Where would a mage do the most good, Thork?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Farewell, Thork.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? The road doesn't stop for talk, so neither do I, for long." },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "The wall's the easy part, because it doesn't move. What I need are warriors who'll ride out with the caravans, since the Kolkar never attack a wall; they attack the wagons strung out on the road." },
        { id = "wa_tauren", when = { race = "Tauren" },
          text = "A tauren warrior on my wall would scare off half the raiders before they got close. But I'd rather have you out with the kodo caravans, where the Kolkar actually strike." },
      },
      choices = {
        { text = "Then I'll ride with the caravans.", next = "BACK", fx = { affinity = 2, standing = { crossroads = 1 } } },
        { text = "Why not strike the Kolkar camps first?", next = "warrior_camps" },
      },
    },
    warrior_camps = {
      lines = { { id = "wc_default", text = "Because I've got sixty soldiers and they've got the whole Barrens to run in. Hit them hard enough when they come, and they'll pick an easier target; that's all holding a road is." } },
      choices = { { text = "Understood.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "I trust Helbrim to brew what he's paid to brew, and to keep his bottles away from my well. The Warchief says your people are Horde, so you're Horde at my crossroads, but I count the bottles." } },
      choices = {
        { text = "Count them, then. We've earned some suspicion.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Your suspicion is an insult to the Dark Lady.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    threats = {
      big = true,
      lines = {
        { id = "t_default", text = "Centaur, quilboar, harpies and the Alliance, in no particular order, and they all want the same thing: the road. The Horde needs that road, so we hold it." },
      },
      choices = {
        { text = "Then I'll help hold it.", next = "BACK", fx = { affinity = 2, standing = { crossroads = 1 } } },
        { text = "That's a lot of enemies.", next = "lot" },
      },
    },
    lot = {
      lines = { { id = "l_default", text = "It is. The trick is that they hate each other too, and most days that's what keeps us alive." } },
      choices = { { text = "...", next = "END" } },
    },
    hardest = {
      lines = {
        { id = "h_sieve", text = "Every caravan wants an escort, every scout wants a rest, and the centaur raid on the one night I've got neither. The Warchief asked me for a crossroads. Some days I'm holding a sieve." },
      },
      choices = { { text = "You're holding it well.", next = "END", fx = { affinity = 2, standing = { crossroads = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear every report that reaches these walls, and these are the ones I'll speak to." },
    },
    wailing_caverns = { { id = "tp_caverns", text = "That's the druids' business, and Tonga worries about it enough for all of us." } },
    _none = { { id = "tp_none", text = "That's not my concern. My concern is the walls, and keeping them standing." } },
  },
}

P:NPC {
  key = "sergra", id = TODO_NPC("Sergra Darkthorn"), name = "Sergra Darkthorn",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "fierce" }, values = { "proud", "fair" },
  notices = { "gender", "kit" },
  impression = {
    first = "Sergra Darkthorn runs the Crossroads and dares anyone to be bothered by it. She sends people out past the walls with a grin, as if the Barrens were a test she enjoys setting.",
    third = "{name} met Sergra Darkthorn, the fierce orc who runs the Crossroads and sends new blood out to prove itself on the Barrens.",
  },

  greetings = {
    { id = "g_road", text = "You're new here. Good; the Barrens eats the timid, and you don't look timid to me. Now prove it." },
    { id = "g_back", when = { metBefore = true }, text = "You made it back. Most do, the first few times, and then the Barrens gets serious." },
  },

  notice = {
    { id = "n_woman", cat = "gender", when = { gender = "female" },
      text = "A woman out on the Barrens, making her own name. Good! The Horde has more of us than the old clans ever liked to admit, so go and show them." },
    { id = "n_man", cat = "gender", when = { gender = "male" },
      text = "Before you say it: yes, I lead here. If that bothers you, the road out is that way. If it doesn't, we'll get along fine." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I send anyone who'll go, and a priest who can keep a grunt breathing until the kodo cart reaches the gate is worth three axes out there. The Razormane have their own geomancers, so if you meet one, show it what real power looks like." } },
      choices = {
        { text = "I'll keep your people breathing, whatever's out there.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I go out to test myself, not to nurse grunts.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sergra.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Everywhere south of the Gold Road, and everywhere north of it too if you're careless. The Razormane raid from their kraals, the Kolkar from the oases and the Witchwing harpies from the cliffs to the west, so pick one and break it, and then come back to me for the next." } },
      choices = {
        { text = "I'll break them one by one, for the Crossroads.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll break whoever carries the best bounty first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I think everything out here tests us, and I'd rather pass than complain about it. The tauren say the Earth Mother made the Barrens hard so that only the strong would stay, and I've never heard a better reason to stay." } },
      choices = {
        { text = "Then I'll meet the test head on.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Out here the clever survive as often as the strong.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you'll see more of it than most, because the Barrens hides plenty from anyone who stomps. Go and watch the Kolkar camps by the Stagnant Oasis and count the fires they light at night, and you'll have earned your keep before anyone else is awake." },
      },
      choices = {
        { text = "Unseen work is still work, and it wins fights.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll scout, but when it comes to it, I'll fight openly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What else does the Barrens need?", next = "need" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Fire works too well out here, {class}, because the grass has been dry since spring and one careless spell sets a whole plain burning. Use your frost on the raptors and keep your fire for the centaur, and nobody at the Crossroads will have to put out your mistakes." },
        { id = "xmage_troll", when = { race = "Troll" }, text = "A Darkspear who reads books, now that's something new for the Barrens. Fire works too well out here, though, because the grass is dry, so keep your frost for the raptors and your fire for the centaur." },
      },
      choices = {
        { text = "I'll mind the grass. A burnt plain helps nobody.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the plain burns with the Kolkar on it, so be it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why do some orcs resent you?", next = "resent" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Tamed, no, and I'd be sorry to see it, because a land that bites back keeps the Horde sharp. But it can be lived in, if you learn where the water is and who else is drinking from it, and that's what I send people out to learn." } },
      choices = {
        { text = "The Horde should bring order to these plains, wall by wall.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave the Barrens wild. That's what makes it worth living in.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "You'll find plenty, though the tauren caravans will keep their distance and I won't blame them. The Burning Blade have a nest up on Dreadmist Peak to the north, so go and show those cultists what a warlock who serves the Horde looks like, and keep your demon on a short chain while you do it." },
      },
      choices = {
        { text = "I'll keep it leashed. The Crossroads has troubles enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My demon goes where I send it, and nobody else decides.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Sergra Darkthorn, and I run the Crossroads. Thork holds the walls and I send people out past them, since the Barrens doesn't tame itself." },
        { id = "h_plainstrider", tags = { "news" }, when = { questActive = TODO_QUEST("Plainstrider Menace") },
          text = "The plainstriders are out of hand, and they breed faster than we hunt them. Thin the flock and bring me proof." },
        { id = "h_zhevra", when = { questActive = TODO_QUEST("The Zhevra") },
          text = "Zhevra are fast and mean, and they kick like a falling rock. Bring me their hooves and you'll have earned a meal." },
        { id = "h_prowlers", when = { questActive = TODO_QUEST("Prowlers of the Barrens") },
          text = "Prowlers have been stalking the roads. Hunt them down, and show them who the predator is out here." },
        { id = "h_echeyakee", tags = { "news" }, when = { questActive = TODO_QUEST("Echeyakee") },
          text = "Out on the plains is a white savannah cat the hunters call Echeyakee, old and clever and hungry. Call it out the way I showed you, and bring luck." },
        { id = "h_jorn", when = { questActive = TODO_QUEST("Jorn Skyseer") },
          text = "Go and see Jorn Skyseer at Camp Taurajo. He'll teach you things about the Barrens that I never could. Tauren listen to the land better than orcs." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out here where the land's still wild! Then you'll feel what I feel, that the Barrens are a test and the spirits are watching to see who passes." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, out in the Barrens! Then you'll know this land better than any orc, so tell me whether it's really dying or only testing us." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Thork will want you on the wall, but I'll want you past it, out where the Barrens bites back." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, then! Good, because half the people I send past the walls come back needing one, and the other half don't come back at all." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The Crossroads has seen your kind before, and I'll judge you the way I judge anyone, by what you bring back from the Barrens." },
      },
      choices = {
        { text = "Do you really think the spirits test us, Sergra?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you think the Barrens can be tamed, Sergra?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Why do some orcs resent you?", next = "resent" },
        { text = "What does the Barrens need?", next = "need" },
        { text = "My beast and I are ready to hunt.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do the trolls here answer to you too?", next = "troll", when = { race = "Troll" } },
        { text = "I'd rather scout the Barrens unseen than hunt it loudly.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Fire and frost work out here as well as any spear.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Where does the Barrens bite hardest, Sergra?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do you ever send priests past the walls, Sergra?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Will a warlock find work at the Crossroads, Sergra?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I'll get to it.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, the plainstriders don't wait." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Good, because half my hunting work is for people like you anyway. A hunter who can't bring down a zhevra has no business calling out Echeyakee, so start small and earn the big cat." },
        { id = "hu_runner", when = { origin = "tauren_plains_runner" },
          text = "A plains runner, out of Taurajo's grass. Then you know the Barrens better than I do, and you'll find Echeyakee before he finds you." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "And {pet} looks hungry. Out here a hunter's beast eats what it kills, so let it do some of my work for me." },
      },
      choices = {
        { text = "I'll take the zhevra first, and then the cat.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Why does Echeyakee matter so much?", next = "hunter_cat" },
      },
    },
    hunter_cat = {
      lines = { { id = "hc_default", text = "Because he's old enough to have taught every cat out there how to stalk a caravan. Kill him and the rest get clumsy, and the Crossroads breathes easier for a season." } },
      choices = { { text = "Then he dies.", next = "BACK", fx = { affinity = 1 } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "They answer to me when I give the orders, and they give me less trouble about it than the orcs do. The Darkspear have had women leading hunts for longer than the Horde has had a name, I'm told." } },
      choices = { { text = "We have. The orcs could learn from it.", next = "BACK", fx = { affinity = 2 } } },
    },
    resent = {
      big = true,
      lines = {
        { id = "r_default", text = "Because I'm a woman who gives orders, and some of the old warriors still think the Horde is a boys' war-band. They'll learn, or they'll stay grunts, and either one suits me." },
      },
      choices = {
        { text = "They'll learn.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Then don't wait for them to learn. Go around them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who resents you?", next = "who" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Kargal Battlescar, for one. He's welcome to resent me from wherever I send him." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
    need = {
      lines = { { id = "n_default", text = "What I need is everything back in its place. When one part of the Barrens sickens the rest follow it down, and lately it's the water." } },
      choices = { { text = "...", next = "END", fx = { learn = { "wailing_caverns" } } } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "Something's wrong in the deep places, and it's seeping into the oases. Tonga knows more than I do, so listen to him." } },
    _none = { { id = "tp_none", text = "Ask Thork, or better yet, go out there and find out for yourself." } },
  },
}

P:NPC {
  key = "mankrik", id = TODO_NPC("Mankrik"), name = "Mankrik",
  bible = "bibles/crossroads.md", role = "soldier", tier = "quest",
  communities = { "crossroads" }, temper = { "grieving" }, values = { "loyal", "vengeful" },
  notices = { "kit", "kin" },
  impression = {
    first = "Up on the wall, Mankrik watches the horizon as if Olgra might walk out of the grass at any moment. His grief has gone hard and angry, and it will not let him rest.",
    third = "{name} met Mankrik, a grieving orc who stands watch at the Crossroads waiting for word of his wife Olgra.",
  },

  greetings = {
    { id = "g_horizon", text = "Hm? Oh, it's you. Stand aside, I'm watching the horizon, and if they come I want to see them first." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Did you see the pigs out there? Did you see any sign of her?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Lost in Battle") }, text = "She's found, and I know where she lies now. It isn't enough, but it's something." },
  },

  notice = {
    { id = "n_orc", cat = "kin", when = { race = "Orc" },
      text = "There's fire in you, orc. Good! Point it at the quilboar; they've earned every bit of it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The pigs got to you too? Then you understand, and you're angry, and that's good. Stay angry." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "If you find her, say what you like over her, and say it loud enough for the quilboar to hear. She'd have laughed at a priest fussing over her, but I wouldn't laugh, and I'd owe you for it." } },
      choices = {
        { text = "When she's found, she'll have her rites. You have my word.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't bring her back. Vengeance at least feels like something.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Mankrik.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The trail's cold now, but you could try, and that's more than most have offered. The quilboar who swarmed us dragged everything they took off to the south, so look for heavy tracks heading toward the southern kraals, and look closely." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a fine nose. If Olgra's still out there, a beast like that might find her where my eyes never could." },
      },
      choices = {
        { text = "I'll search for her, Mankrik, whatever I find.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your grief is your own, Mankrik. I hunt for myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "No. Yes. I don't know what I want, shaman, except to stop standing on this wall. If she's dead she'll be angry, and if she's angry she'll be near the quilboar who did it, so look there, and don't come back and tell me she was afraid." } },
      choices = {
        { text = "You should grieve her, Mankrik, and not only avenge her.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then her killers will pay for every day you've waited.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Quietly is how she'd have done it, if she'd ever had the sense to run, though Olgra never ran from anything in her life. The quilboar camps to the south took prisoners after that fight, so look there, and if you find her, don't let them see you leave." },
      },
      choices = {
        { text = "If I find who did it, they'll never see me coming.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll find her, and then I'll face her killers openly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What was Olgra like?", next = "olgra" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I hate the stink of the things, and I hate that the Horde still has to look at them. But if your demon puts its claws in the quilboar who swarmed us, I won't spit when it walks past me, and that's the most you'll get from me." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "Our people sold themselves to those things once, and look what it bought us. But if your demon tears into the quilboar who swarmed us, I'll keep my mouth shut about it, and that's more than I'd give most warlocks." },
      },
      choices = {
        { text = "A demon's claws are still claws, and revenge is revenge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll do it with my own hands, not a demon's.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Who was the tauren who found you?", next = "tauren" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I asked, and they told me the land would give her back to me in its own time. I don't want the land's time, I want my wife, and if I have to kill every quilboar between here and Thousand Needles to find her, I will." } },
      choices = {
        { text = "Find her and honour her. Vengeance won't bring her back.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The quilboar earned your vengeance. Take every bit of it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "No spell finds what the quilboar took, or I'd have begged one off every mage who passed through this gate. Burn their camps to the south if you like, and if you find her, bring me something of hers, because that's all I'll ever ask of anyone." },
      },
      choices = {
        { text = "Vengeance won't bring her back, Mankrik. I'm sorry.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then I'll make the quilboar pay for her, camp by camp.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mankrik. My wife Olgra and I fought the quilboar side by side until they split us up and swarmed us. A tauren found me half-dead on the road, but nobody ever found her." },
        { id = "h_hatred", tags = { "news" }, when = { questActive = TODO_QUEST("Consumed by Hatred") },
          text = "Kill them, as many as you can, and bring me proof. Thork won't send anyone, so I'm sending you, and for every one you kill I'll sleep a little." },
        { id = "h_lost", tags = { "news" }, when = { questActive = TODO_QUEST("Lost in Battle") },
          text = "She's out there somewhere, so find her for me, alive or not. I need to know, because I can't stand on this wall not knowing much longer." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "You came back, and you didn't have to. Olgra would have liked you, I think, and she didn't like many people." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You talk to the dead, they say, so if Olgra's spirit has crossed your path out in the grass, I need to hear it, whatever she said." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You've the eyes of someone who knows the grass, so if you've seen tracks out there that might be Olgra's, I need to hear it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Olgra could track a quilboar across bare rock, and she taught me a little of it before... well, before." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. If you've come to tell me Olgra's spirit is at peace, save your breath, because I'll believe that when I've seen what the quilboar did to her." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. I know your spells can't bring back the dead, so don't offer, and don't look at me like that." },
      },
      choices = {
        { text = "Do you want me to listen for Olgra's spirit?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Have you asked the tauren druids to help search, Mankrik?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Tell me about Olgra.", next = "olgra" },
        { text = "Revenge won't bring her back.", next = "revenge" },
        { text = "I fight with an axe too. Tell me how she fought.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "A tauren found you on the road?", next = "tauren", when = { race = "Tauren" } },
        { text = "I can slip into the quilboar camps and look for her quietly.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could I pick up Olgra's trail, Mankrik?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "My demons could hunt the ones who took her.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would you want a prayer said over Olgra, Mankrik?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could my spells help you find Olgra?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'll keep an eye out.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else? Say it, and then let me get back to the horizon." },
      },
    },
    warrior = {
      lines = { { id = "wr_default", text = "Two axes and no shield, always charging the biggest one first, and she never once let me take the front. That's how they split us: she charged, and I went after her, and there were more of them behind than either of us saw." } },
      choices = {
        { text = "That's how a warrior should die, charging.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "She should have held back, Mankrik.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "One of your people, a kodo herder heading for Taurajo, and he carried me to the Crossroads on his own back. I never got his name, and I'd give a great deal to thank him." } },
      choices = { { text = "I'll ask after him at Taurajo.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    olgra = {
      big = true,
      lines = {
        { id = "o_default", text = "She fought better than me, and laughed louder. She'd have told me to stop standing on this wall moping, and I would, if I knew where she was." },
      },
      choices = {
        { text = "I'll find her.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "I'm sorry.", next = "END", fx = { affinity = 2 } },
      },
    },
    revenge = {
      lines = { { id = "r_default", text = "Thork said the same, so I'll tell you what I told him: I know, and I don't care. Now leave me to the horizon." } },
      choices = {
        { text = "Why stand on this wall instead of searching yourself?", tag = "Persuade", next = "wall_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "kind" }, { questActive = TODO_QUEST("Lost in Battle") } } } },
          fail = { next = "wall_away", fx = { affinity = -1 } } },
        { text = "...", next = "END", fx = { affinity = -1 } },
      },
    },
    wall_truth = {
      big = true,
      lines = {
        { id = "wt_default", text = "Because as long as I stand here, she might still be out there alive. If I go and look, and I find her, then she isn't, and I'm a coward about that one thing, the only thing Olgra ever saw me run from." },
      },
      choices = {
        { text = "Then let me look for you.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "That isn't cowardice. It's love.", next = "END", fx = { affinity = 2 } },
      },
    },
    wall_away = {
      lines = {
        { id = "wa_default", text = "Because someone has to watch for the pigs, and I'm the one with the reason to. Go on, leave me to it." },
      },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I don't know much beyond the quilboar and this wall. Ask about these, if you must." },
    },
    _none = { { id = "tp_none", text = "I don't know and I don't care. Ask me about quilboar." } },
  },
}

P:NPC {
  key = "tonga", id = TODO_NPC("Tonga Runetotem"), name = "Tonga Runetotem",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "measured" }, values = { "balanced", "patient" },
  notices = { "form", "class" },
  impression = {
    first = "Tonga Runetotem found the strange power Thunder Bluff sent him looking for, and he wishes he had not. He speaks calmly about poisoned oases, which made what he said all the more unsettling.",
    third = "{name} met Tonga Runetotem, a tauren druid at the Crossroads tracing the sickness that poisons the oases of the Barrens.",
  },

  greetings = {
    { id = "g_calm", text = "Peace, friend. The land is restless lately. All the more reason for us not to be." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Druid-kin, good. I need eyes that see the land the way I do, so sit, and I'll tell you what's wrong with it." },
  },

  notice = {
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "You came in on four legs, and fast. That's good, because the Barrens is big, and the faster we move, the more we can save." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Perhaps the creatures that drink from them, if not the water itself, because what sickens the oases comes from under the earth and does not answer to prayers. The druids who went down into the Wailing Caverns meant to heal the land, and something answered them that should not have. Mend what you can on the surface, and leave the deep places to us." } },
      choices = {
        { text = "Then I'll mend whatever crawls out of those waters sick.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the land is poisoned, let it burn clean instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tonga.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Twisted beasts, and druids who have forgotten what they once swore to protect. The Druids of the Fang dream wrong and the creatures of the oases grow wrong around them, so if you must fight there, fight the corruption and spare whatever can still be healed." } },
      choices = {
        { text = "I'll fight the corruption and spare what can be healed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Twisted or not, a threat is a threat. I'll cut it down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They're larger, angrier and stranger, and some of them have scales where no scales should grow. Something in the Wailing Caverns is seeping into the water and the beasts that drink it, so watch what you hunt near the Forgotten Pools, and tell me what you see." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} from drinking at the oases until we know what's in the water. I'd hate to see a good companion turn against you." },
      },
      choices = {
        { text = "I'll watch and report, Tonga. The land must heal.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Twisted beasts make good trophies. I'll hunt them anyway.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Perhaps it could, though I confess the arcane makes me uneasy, because it is a power taken rather than one given. The trouble in the Wailing Caverns began with a druid who reached too far for something he wanted, so whatever you see down there, look carefully and do not reach." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Perhaps, though a dead mage studying a dying oasis is a strange sight, even for me. The trouble in the Wailing Caverns began with a druid who reached too far for something he wanted, so look carefully down there and do not reach." },
      },
      choices = {
        { text = "I'll study it to mend it, not to take it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power is power, and I'll take what I can learn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What exactly did you find out there?", next = "found" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Leashed is a word I've heard before, usually just before something got loose. The tauren know what the Burning Blade's fire does to living things, and I won't pretend your company sits easily with me, but if you know corruption, perhaps you'll know it when you smell it at the oases." },
      },
      choices = {
        { text = "Then I'll use what I know to help cleanse them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Corruption is only a tool, and I'll use it as I like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What did you find at the oases?", next = "found" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Perhaps better than a druid could, because the Druids of the Fang would know me at a glance and they would not know you. Slip past them at the mouth of the caverns and listen to what they say to each other, then come back and tell me whether any of them still remember who they were." },
      },
      choices = {
        { text = "I'll watch them first and judge them after.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If they've fallen, I'll put them down quietly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tonga.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "My name is Tonga Runetotem. Thunder Bluff sent me to find where a strange power in the Barrens was coming from, and I found it, though I wish I hadn't." },
        { id = "h_oases", tags = { "news" }, when = { questActive = TODO_QUEST("The Barrens Oases") },
          text = "The oases are the heart of the Barrens, and something is poisoning them. Bring me samples from the water, and we'll see how deep the sickness goes." },
        { id = "h_stagnant", when = { questActive = TODO_QUEST("The Stagnant Oasis") },
          text = "The Stagnant Oasis is the worst of all, so go carefully. The things that drink from it aren't themselves anymore." },
        { id = "h_hamuul", when = { questActive = TODO_QUEST("Hamuul Runetotem") },
          text = "Take what we've found to the Arch Druid. He'll want to see it with his own eyes, as I would in his place." },
        { id = "h_cure", when = { questActive = TODO_QUEST("Gathering the Cure") },
          text = "The gazelles near Dreadmist Peak are sick. Moonglade's lore and the Barrens' own water together might make them well, if you bring me what's needed." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The land doesn't need more blood spilled on it, but it may need someone to stand between it and whatever is spreading from the Wailing Caverns." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and you'll have seen it already: the beasts near the oases aren't what they were." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde in the Barrens. The Earth Mother speaks to my people in her own way, and I have wondered what your gods tell you when you listen as hard as I do." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You walk quietly for one so young. Good, because the Wailing Caverns do not forgive heavy feet." },
      },
      choices = {
        { text = "What did you find?", next = "found" },
        { text = "I'm a druid too, Tonga. Can I help heal the oases?", next = "druid", when = { class = "DRUID" } },
        { text = "The water spirits here are crying out.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Could an arcane eye help you trace the power in the caverns?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What spreads from the Wailing Caverns, Tonga?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What's wrong with the beasts near the oases, Tonga?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I know the feel of corruption. Mine is leashed, at least.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Can a priest help heal the poisoned oases, Tonga?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a rogue learn what's happening in the caverns?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Farewell, Tonga.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something more, friend? The land isn't in a hurry, even if we must be." },
      },
    },
    druid = {
      lines = {
        { id = "dr_default", text = "You can, and you should, but carefully. The druids in those caverns were trying to heal the land too, and they walked into the Dream and didn't come out themselves. Heal from the waking world first." },
        { id = "dr_pupil", when = { origin = "tauren_hamuul_pupil" },
          text = "You studied under Hamuul as I did, so you've heard his warning about the Dream already. Those druids under the Barrens heard it too, and went anyway." },
      },
      choices = {
        { text = "The Dream is dangerous. I'll stay in the waking world.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "If the sickness is in the Dream, that's where I'll fight it.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "They are, and I can only feel it as a wrongness in the green, while you hear it in words. Tell me what they say, friend, and I'll write it down for Hamuul; he'll want the spirits' account beside mine." } },
      choices = { { text = "They say the water is dreaming badly.", next = "BACK", fx = { affinity = 2, learn = { "wailing_caverns" } } } },
    },
    found = {
      big = true,
      lines = {
        { id = "f_default", key = true,
          text = "The Wailing Caverns. Druids went into them to heal the land, and something in the dark turned their dream bad. Now the sickness comes up with the water." },
      },
      choices = {
        { text = "Can it be stopped?", next = "stop", fx = { learn = { "wailing_caverns" } } },
        { text = "Druids did this?", next = "druids", fx = { learn = { "wailing_caverns" } } },
      },
    },
    stop = {
      lines = { { id = "s_default", text = "By someone braver than me. Go into the caverns when you're strong and find who started this, and start with the water. Always start with the water." } },
      choices = {
        { text = "I will.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll go when there's coin in it, and not before.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    druids = {
      lines = { { id = "d_default", text = "Druids meant well. That's the most frightening part, friend. Anyone can mean well and still go wrong in the dark." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've listened to the Barrens a long while, and it tells me more than people do. Ask me about any of these, friend." },
    },
    wailing_caverns = { { id = "tp_caverns", text = "It's a cave with a poisoned dream at the bottom of it. That's the plain version, and the plain version is bad enough." } },
    cenarion_circle = { { id = "tp_circle", text = "Hamuul brought us into it. The Barrens needs every druid it can get, and the Circle needs to hear about this place." } },
    _none = { { id = "tp_none", text = "I don't know, friend, but the land might. Listen to it a while." } },
  },
}

P:NPC {
  key = "helbrim", id = TODO_NPC("Apothecary Helbrim"), name = "Apothecary Helbrim",
  bible = "bibles/crossroads.md", role = "scholar", tier = "quest",
  communities = { "crossroads" }, temper = { "clinical" }, values = { "curious", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Apothecary Helbrim swears the Society only wants to study the Barrens, not harm it, mostly. That 'mostly' has stayed with me longer than anything else he said.",
    third = "{name} met Apothecary Helbrim of the Royal Apothecary Society, who studies what grows, festers and stings in the Barrens.",
  },

  greetings = {
    { id = "g_samples", text = "Hands! Living ones, even, which is excellent. Mine shake a little, these days." },
    { id = "g_back", when = { metBefore = true }, text = "Back with something for me? The Barrens is full of things worth bottling." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "You work with reagents? Good, then we'll talk shop, you and I. The others here only ask what's in my bottles so they can avoid it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Don't look at me like that; we're on the same side. The Society only wants to study the Barrens, not harm it. Mostly." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Use? Certainly, though perhaps not the one you'd hope, because a priest who can keep a test subject alive a little longer is worth a great deal to our work. Master Faranell would say the same, and he'd mean it more than I do." } },
      choices = {
        { text = "I'd keep anyone alive for the Society, whatever the reason.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Healing isn't a tool for your experiments, Apothecary.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, Apothecary.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Venom glands from the spiders and serpents, mostly, and whatever grows in the Forgotten Pools that the tauren won't let me pick. I'd go myself, but the last time I tried, a raptor took my satchel and very nearly my arm, and I can't spare either." } },
      choices = {
        { text = "I'll gather your samples, for the Horde's sake.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll gather them for coin, apothecary, and ask nothing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "For their venom, of course, which cures as often as it kills, depending on who holds the vial. The tauren call it medicine and I nod politely, and somewhere in Brill a colleague of mine is grateful for every gland I send home." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And do keep your {pet} away from my crates. Some of what's inside would interest it far too much, and none of it would do it any good." },
      },
      choices = {
        { text = "Medicine, then. I'll only gather for healing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Venom is venom. What you do with it is your affair.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because the elements make poor research partners, and shamans make worse ones, so I have to ask. The tauren at Thunder Bluff look at us as though the ground itself objects to our walking on it, and I would very much like to know whether it does, for my notes." } },
      choices = {
        { text = "Undeath breaks the natural order, and the earth feels it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements don't care what walks on them, Helbrim.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They do, and the Society has never pretended otherwise, whatever it tells the tauren. The spiders and serpents of the Barrens carry venoms that would interest anyone with a blade, though I'd rather not write it all down where our hooved friends might read it." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "They do, and you'll know as well as I do that the Dark Lady values both. The spiders and serpents of the Barrens carry venoms that would interest anyone with a blade, though I'd rather not write it all down where our hooved friends might read it." },
      },
      choices = {
        { text = "Better the tauren don't know everything. Secrets keep us strong.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Horde should know what its allies are brewing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What are you studying out here, exactly?", next = "study" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "The Forsaken trust nobody, which makes us admirably fair about it. The Dark Lady keeps a dreadlord of her own on a short chain in Undercity, so a warlock is welcome among us for exactly as long as he remembers who is holding the chain." },
      },
      choices = {
        { text = "Every power needs a master, and I hold my chain tightly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Chains are for the weak. My demon and I need none.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Does the Society send you word from Undercity?", next = "forsaken" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Remedies, mostly, and a better understanding of what grows in dry country, which the Society finds very useful. I won't pretend every tincture I brew is meant to heal, but the Warchief has seen our reports, and he hasn't complained." } },
      choices = {
        { text = "Plants taken for healing are well taken. Poisons are not.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Remedy or poison, knowledge is knowledge. I'd study it too.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "We trust results, and a good many of our finest minds were magi in Lordaeron before the plague, which rather proves the point. Keep your fire well away from my samples, though, because there is nothing quite as educational as a scorched specimen, and nothing quite as useless." },
      },
      choices = {
        { text = "Study the Barrens all you like, but don't poison them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Whatever the Society brews, the Horde's enemies deserve it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The name is Helbrim, of the Royal Apothecary Society. The Society sent me to see what grows out here that might be useful, and a great deal does, it turns out." },
        { id = "h_spores", tags = { "news" }, when = { questActive = TODO_QUEST("Fungal Spores") },
          text = "Spores from the fungus out by the water are what I need, and don't breathe near them. Well, you do still breathe, I suppose, so I'll simply advise against it." },
        { id = "h_zamah", when = { questActive = TODO_QUEST("Apothecary Zamah") },
          text = "Zamah needs this, up in Thunder Bluff by the Pools of Vision. The tauren don't entirely trust the Society, but they trust Zamah." },
        { id = "h_dizzywig", when = { questActive = TODO_QUEST("Wharfmaster Dizzywig") },
          text = "Dizzywig at Ratchet is to have this delivery. The goblins will move anything for the right price, and some of my shipments need moving very discreetly." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. I doubt I have a spirit left worth speaking to, so don't trouble yourself, though I confess I'm curious what the elements make of a man like me." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll disapprove of my work, I imagine, since I take the Barrens' plants apart to see what's inside, and your kind prefer them whole." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. How useful; the Society's samples have a habit of biting back, and I've only these thin old arms to defend them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know where the serpents and spiders of the Barrens nest, then, which is more than I do." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "Ah, a priest. If you're one of the Forgotten Shadow, we're practically colleagues, but if you still pray to the Light, I'd rather not hear about it while I'm working." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! The Society has a great deal of respect for the arcane, in its place, and its place is usually a laboratory." },
      },
      choices = {
        { text = "Why would an apothecary care what the elements think?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does the Society really want with the Barrens' plants?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What are you studying?", next = "study" },
        { text = "Does the Society send you word from Undercity?", next = "forsaken", when = { race = "Scourge" } },
        { text = "My people make medicine from these plants too.", next = "troll", when = { race = "Troll" } },
        { text = "An apothecary's venoms and a rogue's blades go well together.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What samples does the Society want, Helbrim?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why does the Society care about serpents, Helbrim?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the Forsaken trust warlocks more than the orcs do?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does the Society have any use for priests, Helbrim?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the Society trust mages, Helbrim?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Good luck with your work.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a sample warming, so be brief." },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "Every fortnight, by bat, and always the same thing: more samples, faster, and fewer questions from the tauren. Master Faranell is not a patient correspondent, though I'm told patience is a living virtue anyway." } },
      choices = {
        { text = "The Society's work comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The tauren deserve answers, Helbrim.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "Do they? Witch doctors' remedies, I suppose, which some of my colleagues sneer at. I don't, because half of what the Society knows about poisons began as someone's grandmother's cure, so do tell me which of these your people boil." } },
      choices = { { text = "Peacebloom, for fever. Never the fungus.", next = "BACK", fx = { affinity = 2 } } },
    },
    study = {
      big = true,
      lines = {
        { id = "s_default", text = "Everything that grows, festers or stings out here, and what I'm after is remedies, mostly. Some of us still remember being sick, and we'd like no one else to be." },
      },
      choices = {
        { text = "That's kind of you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Mostly remedies?", next = "mostly" },
      },
    },
    mostly = {
      lines = { { id = "m_default", text = "You listen closely. Mostly remedies, yes, but science is science, and what people do with it is their own affair." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "A poisoned dream leaking into the water? Terrible, of course, but quite fascinating." } },
    _none = { { id = "tp_none", text = "Not my field. Bring me a sample and I'll make it my field." } },
  },
}

P:NPC {
  key = "darsok", id = TODO_NPC("Darsok Swiftdagger"), name = "Darsok Swiftdagger",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "boastful" }, values = { "proud" },
  notices = { "class", "stealth" },
  impression = {
    first = "If Darsok Swiftdagger is to be believed, he is the best there is and cheaper besides. He is so pleased with himself that it is almost charming, though I would still keep an eye on my purse.",
    third = "{name} met Darsok Swiftdagger, a boastful blade at the Crossroads who wages his own war on the harpies of the hills.",
  },

  greetings = {
    { id = "g_blade", text = "Need someone dead? I'm the best there is. Need someone dead quietly? That's still me, and I'm cheaper, too." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, my favourite errand-runner. How many feathers today?" },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A fellow blade, eh? Don't get any ideas; I saw you coming from the gate, and nobody sneaks up on Darsok." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Ha! Nice try, but I can smell a shadow from twenty paces. Come out, before I come in." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Only the clumsy ones, and I don't keep the clumsy ones long. Still, a troll priest pulled me back from a Kolkar spear once, and I've been politer to your sort ever since." } },
      choices = {
        { text = "A priest heals anyone who needs it, paying or not.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll heal who I like, and let the rest bleed.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Darsok.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "When I must, and I'll admit they're handy, because the harpies always go for the biggest target first. You hold Serena's sisters off with that shield, and I'll be behind them before they've finished screeching, and we'll argue later about who got the most kills." } },
      choices = {
        { text = "I'll hold the line, and you can keep the kills.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll count my kills too, Darsok, and I'll beat yours.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Worth it? The Witchwing harpies come down out of the hills to raid caravans, and every one you bring down is one less screeching at our traders. Serena Bloodfeather leads them, and I've a mind to send her feathers to Thork for his helmet." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} eyed me like dinner the moment you walked up, and I respect that. Most people take a while to work out I'm dangerous." },
      },
      choices = {
        { text = "I hunt harpies to keep the roads safe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I hunt harpies for the bounty, and that's all.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Once, against Serena's sisters in the hills, and he called up a wind that knocked the harpies out of the sky like rocks. I'll admit it was a good trick, but I still got more kills, and that's what matters." } },
      choices = {
        { text = "The kills matter less than winning together.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Counting kills keeps everyone sharp, so I'll count mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Use, sure, if you can stand at the back and set their feathers alight while I go to work up close. The Witchwing harpies nest in the hills west of here, and they come at you screaming in threes, so keep your spells fast and your back to a rock." },
        { id = "xmage_troll", when = { race = "Troll" }, text = "Use, sure, and a Darkspear mage is a fine thing to see, so long as you stand behind me. The Witchwing harpies nest in the hills west of here and come at you screaming in threes, so keep your spells fast and your back to a rock." },
      },
      choices = {
        { text = "I'll burn them from cover while they're busy with you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll stand in front with you, not behind.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Are you truly the best, Darsok?", next = "best" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Jealous of a little thing that sets my cloak on fire whenever it gets bored? Not really, friend, because a good blade never asks to be fed and never talks back, and I'll take that over a demon on my shoulder any day." },
      },
      choices = {
        { text = "A demon is just a sharper knife.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You're right. I'd rather trust my own steel.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Are you really the best around?", next = "best" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not a chance, though I'll admit I've lost a harpy or two to a lion that got there first. The difference is that the lion eats what it kills and I get paid for it, which is the more civilised arrangement, if you ask me." } },
      choices = {
        { text = "I'd rather face my prey than knife it from the grass.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Strike unseen and get paid for it. That's sensible work.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The name's Darsok Swiftdagger. Throats, backs and the soft bits between armour plates are my trade, and I'm good at it." },
        { id = "h_harpy", tags = { "news" }, when = { questActive = TODO_QUEST("Harpy Raiders") },
          text = "Up in the hills you'll find harpies, filthy screeching things. Bring me their talons; I'd go myself, but I'd enjoy it too much." },
        { id = "h_lieutenants", when = { questActive = TODO_QUEST("Harpy Lieutenants") },
          text = "Now for the ones who give the orders: their lieutenants. Cut the head off a flock and the rest fly in circles." },
        { id = "h_serena", tags = { "news" }, when = { questActive = TODO_QUEST("Serena Bloodfeather") },
          text = "Serena Bloodfeather is their matriarch. Bring me her head, and then they'll know the Crossroads bites back." },
        { id = "h_jinzil", when = { questActive = TODO_QUEST("Letter to Jin'Zil") },
          text = "This letter goes to my old friend Jin'Zil, a witch doctor out in Stonetalon, and he'll have a use for you. Don't read it; he'll know." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? Nice trick with the lightning, but I've killed more harpies with one knife than most shamans have with a whole storm." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, eh? I hear you can turn into a cat and creep up on people, which is cute, but I was doing it before you'd grown your first claw." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, eh? Loud, slow and very good at getting hit, which is exactly what I need standing in front of me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Nobody sneaks up on Darsok, and that includes your beast, so don't let it try." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, eh? Patch up my clients' victims and I'll be out of business, so do us both a favour and only heal the people who pay me." },
      },
      choices = {
        { text = "Have you ever fought beside a shaman, Darsok?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could a cat outstalk you in the grass, Darsok?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Are you really the best?", next = "best" },
        { text = "I'm a blade too. Teach me something.", next = "rogue", when = { class = "ROGUE" } },
        { text = "You know Jin'Zil? He's Darkspear, like me.", next = "troll", when = { race = "Troll" } },
        { text = "Would a mage be any use to you against the harpies?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you ever fight beside warriors, Darsok?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Are the harpies worth hunting, Darsok?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "My imp does the dirty work for me. Jealous, Darsok?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do your students ever need a priest, Darsok?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I'll handle the harpies.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, the harpies won't kill themselves, more's the pity." },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Something for free from Darsok, eh? Fine, here is one lesson: harpies look up and never down, so come at them from below the ridge and they'll never see the knife. That one's worth gold in Ratchet." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "A deathstalker, eh? The Dark Lady trains you lot to kill quiet and report back, and I only do the first part. Tell your masters Darsok sends his regards." },
      },
      choices = {
        { text = "A clean kill from hiding. That's the job.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I'd rather they saw me coming.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "Know him? He pulled a harpy talon out of my shoulder once and charged me for the voodoo. You trolls drive a hard bargain, and I respect that more than I'd tell the Warchief." } },
      choices = { { text = "Ha. I'll carry your letter, then.", next = "BACK", fx = { affinity = 2 } } },
    },
    best = {
      lines = { { id = "b_default", text = "Ask the harpies. Oh, wait, you can't, and that's how good I am." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } }, { text = "Charming.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If it doesn't bleed, I'm not interested." } },
  },
}

P:NPC {
  key = "zargh", id = TODO_NPC("Zargh"), name = "Zargh",
  bible = "bibles/crossroads.md", role = "vendor", tier = "quest",
  communities = { "crossroads" }, temper = { "jolly" }, values = { "generous" },
  notices = { "hunger", "craft" },
  impression = {
    first = "Zargh the butcher sells meat to everyone who passes the Crossroads, which is everyone. Mention Gryshka in Orgrimmar and he goes as bashful as a butcher with a cleaver can.",
    third = "{name} met Zargh, the jolly butcher of the Crossroads, who has his heart set on a certain innkeeper in Orgrimmar.",
  },

  greetings = {
    { id = "g_meat", text = "Fresh meat! Well, recent meat. Stock up before you head out; the Barrens won't feed you kindly." },
    { id = "g_back", when = { metBefore = true }, text = "Hungry again? Course you are; everyone's hungry out here." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Take a look at these cuts of prime zhevra. Well, zhevra, anyway; prime is a strong word for anything in the Barrens." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The tauren do, and they look at me sideways when I don't, so lately I mutter a word over every kodo before the cleaver comes down. I don't know who's listening, but the meat tastes no worse for it." } },
      choices = {
        { text = "Thanking the beast is a good habit. Keep it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Meat is meat. Prayers won't make it any tenderer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Zargh.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Kodo, if you can find one that's died honestly, and zhevra, and plainstrider when nothing else is going. The grunts come in from the oases half starved and eat anything I put in front of them, so I always keep a pot on for the ones who've earned it." } },
      choices = {
        { text = "Feed the grunts first, Zargh. They've earned it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take the best cut, and the grunts can wait.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I didn't say that, and I'll thank you not to say it so loudly. Though if the spirits did happen to say whether a woman who sends back clean bones means yes, I wouldn't stop you telling me." } },
      choices = {
        { text = "Speak to her yourself, Zargh. That's what any spirit would say.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let her wonder a while longer. It works better.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Quietly, you say? Well, I wouldn't say no, though if she finds out somebody's been asking she'll know it was me, and then I'll never show my face in the Broken Tusk again, so tell her the meat's still good out here and leave the rest alone." },
      },
      choices = {
        { text = "A little sneaking never hurt a romance.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fair enough. Some things a man should ask himself.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What happened to your finger, Zargh?", next = "finger" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Once, and the thing ate the whole haunch in a breath and looked at me like I was next on the hook. I don't know what demons eat when nobody's feeding them, and I'd rather not, so I'll sell you meat for your own belly and that's where it stays." },
      },
      choices = {
        { text = "Fair. My demon goes hungry, and I keep it lean.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It eats what I let it eat, and it's always hungry.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How did you lose that finger?", next = "finger" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Plainstrider mostly, kodo when the herders sell me an old one, and zhevra when the hunters bring it in. Nobody goes hungry at the Crossroads while I've a cleaver, and I've never taken more than the herds could spare." } },
      choices = {
        { text = "Taking only what's needed honours the herds. Keep doing that.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The plains are full of game. Take all you can sell.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I'd sell meat to a kodo if it had coin, so of course I would. Bring me plainstrider meat or a few raptor flanks for the stew, and if you could warm my cooking stone without setting the stall alight, I'd say you were worth knowing." },
      },
      choices = {
        { text = "I'll hunt it myself and bring it to you fresh.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll buy it cheap off the hunters and sell it to you dear.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Zargh, and I'm the butcher. I sell meat to everyone who passes through the Crossroads, which is everyone, so business is good. Everything else is the Barrens." },
        { id = "h_meats", tags = { "news" }, when = { questActive = TODO_QUEST("Meats to Orgrimmar") },
          text = "Take these choice cuts to Gryshka at the inn in Orgrimmar, and get them there fresh. And tell her, well, tell her they're from me; she'll know what that means." },
        { id = "h_return", when = { questDone = TODO_QUEST("Return to the Crossroads") },
          text = "She liked them, she actually said that? Good, good! If there's a wedding you're invited, but I'm only saying if, mind; I'm not saying there's a wedding." },
        { id = "h_bones", when = { metBefore = true }, text = "Gryshka sent back the bones, picked clean. I don't know what that means, but I've decided it's a good sign." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do the spirits know anything about, well, matters of the heart? Never mind, forget I asked, and buy some meat." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! I'll not ask how you feel about the meat, because the last druid who came by gave me a very long look, and I've been selling less plainstrider since." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You'll be wanting meat, and plenty of it, because nobody eats like a grunt back from the Kolkar camps." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Do your lot eat meat like the rest of us, or is it all prayers and broth where you come from?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. Can you cook with that fire, or does it only burn things to cinders?" },
      },
      choices = {
        { text = "Do you want the spirits' advice about Gryshka, Zargh?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Where does the Crossroads' meat come from, Zargh?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What happened to your finger?", next = "finger" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "I hunt the plains. Want what I bring back?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I could find out how Gryshka feels about you, quietly.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What's good to eat in the Barrens, Zargh?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do warlocks ever buy meat to feed their demons?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you ever pray over the beasts you butcher, Zargh?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Would you sell meat to a mage, Zargh?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Not hungry.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a zhevra on the block that won't cut itself." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "A hunter who brings it in already dressed? You're my favourite kind of customer, the kind who's also my supplier. Bring me zhevra flank and I'll cut the best of it for Gryshka's next delivery." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "That beast of yours has been staring at my block since you walked up. Here, {pet}, a scrap, and that's all; I've got a reputation for stinginess to keep up." },
      },
      choices = { { text = "Only the best cuts go to Gryshka.", next = "BACK", fx = { affinity = 2 } } },
    },
    finger = {
      big = true,
      lines = {
        { id = "f_default", text = "An accident with the cleaver, a long time ago. Don't look at the sausages like that; I looked for it, I promise. Mostly." },
      },
      choices = { { text = "...I'll pass on the sausages.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't know, friend. I know meat, so ask me about meat." } },
  },
}

P:NPC {
  key = "boorand", id = TODO_NPC("Innkeeper Boorand Plainswind"), name = "Innkeeper Boorand Plainswind",
  bible = "bibles/crossroads.md", role = "innkeeper", tier = "service",
  communities = { "crossroads" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },
  impression = {
    first = "Hooves, feet or whatever else comes through the door, Innkeeper Boorand Plainswind welcomes them all. He likes his leaky roof because that is how the stars get in, and he keeps putting food in Mankrik's hands.",
    third = "{name} rested at Innkeeper Boorand Plainswind's inn at the Crossroads, where every traveller of the Barrens sleeps sooner or later.",
  },

  greetings = {
    { id = "g_inn", text = "Rest your hooves, or your feet, or whatever you've got. Everyone's welcome under this roof." },
    { id = "g_home", when = { homeInn = { "The Crossroads" } }, text = "Back to the Crossroads! Your bedroll's where you left it. I swept the dust off twice." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "The Barrens beat you up, little one. Sit down and eat; the Barrens will still be out there in the morning, sadly." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy. The floor's flat in here, but it won't feel like it. Sit down before it proves me wrong." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "More often than for a second bowl, which tells you something about the Barrens. Mankrik won't let anyone near him, though, so if you've a gentle way with the grieving, he's up on the wall, and I've run out of stew to bring him." } },
      choices = {
        { text = "I'll speak to Mankrik. Grief shouldn't sit alone.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A man who wants to grieve alone has earned that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Boorand.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not as well as they should, because the Kolkar raid at night and Thork rings the bell whether you're asleep or not. Still, a warrior who sleeps with his boots on wakes up faster, and the ones who learn that tend to live to pay me again." } },
      choices = {
        { text = "I'll sleep in my boots and answer the bell.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the wall guard answer the bell. I need sleep.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, and I'm glad of it, because the supply kodos are slow and the travellers are hungry. Zhevra makes a fine stew and plainstrider makes a poor one, but I'll cook either if a hunter brings it in clean." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can sleep by the fire tonight. The tauren snore loud enough to scare off anything else that might come in." },
      },
      choices = {
        { text = "I'll share my game with the inn, Boorand.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My game goes to the trader who pays most.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not the way they speak to you, but I hear them in the wind riders' grumbling and in the dust before the rains. My grandmother said the oases ran sweeter when she was young, and lately the water tastes wrong, so the spirits must feel it worse than we do." } },
      choices = {
        { text = "Then the oases must be healed, and the spirits with them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Barrens have always been harsh. Let them be.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "You and every trader who's crossed the Barrens with a full purse, friend. Nobody steals under my roof, because the walls are thin and the tauren snore loud enough to wake the dead, so take your boots off and let the stars come in through the holes." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "You don't sleep at all, I've heard, so I don't know why you'd keep your boots on. Nobody steals under my roof, because the walls are thin and the tauren snore loud enough to wake the dead, which I'm told you won't take personally." },
      },
      choices = {
        { text = "If you say so, I'll trust your roof tonight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I trust nobody's roof. The boots stay on.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What news is there from the road?", next = "news" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, I suppose, but then I'd lose the stars, and they're the best thing about this inn. My mother said the sky over the Barrens was the Earth Mother's blanket, and I'd rather sleep under a blanket with a few holes in it than under one of your spells." },
      },
      choices = {
        { text = "Then I'll leave the stars where they are.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good spell beats a leaky roof, Boorand.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Any news from the road, Boorand?", next = "news" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It worries everyone, though most try not to say so over supper. The herders talk about the druids lost in the Wailing Caverns and the grunts talk about the Kolkar at the oases, and I keep the stew hot because I can't do anything about either." } },
      choices = {
        { text = "The Horde should guard every oasis until the rains return.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No one should own the water. Let everyone drink freely.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Everyone's welcome who pays and keeps the peace, and the stars come in through my roof whether you're a shaman or something darker. Some of my tauren guests have seen the Burning Blade's work up on Dreadmist Peak, though, so give them a wide berth and they'll give you one." },
      },
      choices = {
        { text = "I'll keep my distance and my demon quiet.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If they fear me, that's their trouble, not mine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Boorand Plainswind is my name, and I keep the inn at the Crossroads. Orcs, trolls, tauren, the odd Forsaken: they all sleep the same once they're tired enough." },
        { id = "h_mankrik", when = { heardLine = "mankrik.h_default" },
          text = "Mankrik's been on that wall since before I got here. He eats when someone puts food in his hands, so I put food in his hands." },
        { id = "h_roof", when = { metBefore = true }, text = "A goblin from Ratchet stayed three nights and tried to sell me a better roof. This roof is fine; it has holes, and that's how the stars get in." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night at the Crossroads is never quiet. Riders coming in, wind riders grumbling on the tower. I'd miss it if it stopped." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman under my roof, and under the holes in it. The Earth Mother sends rain through them now and then, but she sends the stars through more often, so I've never patched a single one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid under my roof! The stars come in through the holes, and the rain too when the Earth Mother remembers us, so you'll feel right at home." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and you've got the walk of somebody who's spent all day fighting centaur. Sit, friend, before your legs decide it for you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Mind your beast on the stairs, because the last one knocked over a tauren and he wasn't happy about it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest under my leaky roof! Sit by the fire, and if any of the grunts by the door start groaning in their sleep, you'll know what to do better than I would." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, under my leaky roof. Mind your demon around the other guests, friend, and it can sleep by the door like anyone's dog." },
      },
      choices = {
        { text = "Do the spirits of the Barrens speak to you, Boorand?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does the drought worry the folk who stay here, Boorand?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Any news?", next = "news" },
        { text = "I don't really sleep anymore, Boorand.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I sleep light, Boorand, and with my boots on.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could a mage patch your leaky roof with a spell?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do warriors rest well at the Crossroads, Boorand?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do hunters bring you game, Boorand?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do travellers ever ask you for a priest, Boorand?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is a warlock welcome at your inn, Boorand?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Just resting.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else, little one? Ask it by the fire, where the Barrens wind can't reach us." },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "No, I suppose you don't, and I'm sorry for it. Sit by the fire anyway, because I've seen your people warm their hands like everyone else, and I don't think it's only habit." } },
      choices = { { text = "Maybe it isn't. Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
    news = {
      lines = { { id = "n_default", text = "Everyone coming through asks the same question: where's Mankrik's wife? If you find out, tell him first and then tell me, because I'm tired of not knowing either." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Tonga, by the inn. He knows the Barrens better than anyone." } },
  },
}
