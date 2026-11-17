-- Grom'gol, the rest of the camp: the zeppelin tower, the wind riders and the supply tent. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "nezraz", id = TODO_NPC("Nez'raz"), name = "Nez'raz",
  bible = "bibles/gromgol_more.md", role = "flightmaster", tier = "service",
  communities = { "gromgol" }, temper = { "chatty" }, values = { "greedy", "practical" },
  notices = { "race", "weary" },

  impression = {
    first = "Nez'raz runs the zeppelin to Orgrimmar from the tower outside Grom'gol, and talks about the Stranglethorn sun like a goblin who's found a beach he doesn't have to pay for. He swears the zeppelins are perfectly safe, and swears it a little too often.",
    third = "{name} met Nez'raz, the goblin zeppelin master at Grom'gol.",
  },

  greetings = {
    { id = "g_default", text = "The zeppelin to Orgrimmar leaves soon, or late, or soon-ish anyway, pal, so stay near the tower and keep your ticket where you can find it!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You're a regular, pal, and regulars get my best smile, which is free." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Whoa, whoa, a big one! Stand in the middle of the deck when you ride, pal, so the zeppelin doesn't list to one side, because the Cartel bills me for every degree." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look rough, buddy. Sit at the top of the tower while you wait, because nothing in the jungle climbs this high, mostly, and the view's free." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Absolutely! You don't get airsick, you don't panic, and if anything happens, which it won't, you can heal yourself, which saves me on the paperwork. I'd put you on a poster if I thought the Horde would buy it, but the orcs get nervous about the Light, I've noticed." } },
      choices = {
        { text = "Don't sell anyone false promises about your zeppelins.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Put me on the poster. A little legend never hurt.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nothing a little goblin genius and a lot of rope couldn't patch, and the zeppelin only dipped a bit over the Barrens. Warriors always get restless on the ride, so stand at the rail and glare at the clouds, and you'll reach Orgrimmar with every rope where it should be." } },
      choices = {
        { text = "Fair. A warrior keeps discipline, even on a zeppelin.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If I'm bored, I'll swing my axe wherever I please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, and raptors are the worst, because they panic when the ground goes away and then they bite whoever's nearest. Keep your beast low and close, talk to it the whole way, and it'll land in Orgrimmar a happier animal than it took off." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some do, and raptors are the worst, because they panic when the ground goes away and then they bite whoever's nearest. Keep your beast low and close, talk to it the whole way, and it'll land in Orgrimmar a happier animal than it took off. And {pet} looks sturdy enough, but I'll be standing well back during the launch, pal, no offense meant." },
      },
      choices = {
        { text = "I'll keep my beast close and calm the whole way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My beast'll ride how it likes. It's a wild animal.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Then you'd better have a spell that floats, pal, because the jungle down there is all teeth. We had one come down hard over the coast once, nothing exploded, much, and the crew who walked out of the trees didn't want to talk about the walk." } },
      choices = {
        { text = "Then let's make sure it doesn't. Check those engines.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If it goes down, I'm jumping first and asking later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "All the time, and I tell the passengers it's perfectly safe, which is a lie I'm paid very well to tell. Put a shaman aboard, though, and the storms seem to step aside, so I've started giving your lot the good seats at no extra charge." } },
      choices = {
        { text = "Tell your passengers the truth about the storms, Nez'raz.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A comforting lie keeps passengers calm. Keep telling it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Perfectly, pal, almost entirely, and I've only lost one crate over the side in the last month, and it was insured. The engine makes a funny noise now and then, but that's just it singing, and a happy engine is a safe engine." } },
      choices = {
        { text = "I'll trust your word. You know your zeppelin.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll check the engine myself, just in case.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Nez'raz.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every one of them who knows the spell, and they never even say goodbye, or pay a fare. I tell them the view's better from the zeppelin, and it's true, but they'd rather blink and be home than spend an afternoon looking at the sea." } },
      choices = {
        { text = "I'll take the zeppelin. The view's worth it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll teleport. Time is too precious to waste.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More than you'd think, because Thunder Bluff's a long way from anywhere and even the Earth Mother's own get tired of walking. One of your elders rode up top the whole way to Orgrimmar once, and I swear the gas bags were happier for it." } },
      choices = {
        { text = "Your zeppelins are clever, but the sky was ours first, friend.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Your zeppelins haven't dropped me in the jungle yet. I respect that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You wouldn't put in a word with the air spirits about the crosswinds, would you, buddy? The last crossing nearly put us in the sea, and seawater does terrible things to an engine." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Say a little something for the engine, would you, pal? It's been coughing since the last crossing." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock! Your little buddy rides in the hold, pal, because the last imp we let up top set the balloon smoking." },
        { id = "h_default", key = true,
          text = "Nez'raz, zeppelin master! The ship from this tower drops off at Orgrimmar, and the sun here beats the dust there any day of the week. It's the best post on the line, if you ask me, and nobody ever does, which is why I charge for my opinions." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night runs are the quiet ones, pal, and the jungle down there sounds like it's eating itself. Up here you just hear the engine and the wind and the coins in the fare box, and that's how I like it." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now, the zeppelin's perfectly safe, pal, and I'll thank you not to go poking around the engine, because it doesn't like being poked." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! You'll be teleporting to Orgrimmar, I suppose, and leaving my zeppelin empty, which is a crying shame and a lost fare, pal." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Keep that axe sheathed on the deck, pal, because the last fellow who practiced his swings up there cut through a rope we really needed." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Beasts ride free on my zeppelin, pal, but if yours gets airsick, you're the one cleaning the deck." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid! I'll warn you now, the zeppelin's no place for a bear, chum, but if you turn into something small you could ride the rigging and save me a seat to sell." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin! Perfectly safe zeppelins, perfectly safe, and even if they weren't, you're already dead, so really you're my ideal passenger." },
      },
      again = {
        { id = "h_again", text = "Anything else, pal? The zeppelin waits for nobody, except when it does." },
        { id = "h_again2", text = "Ask away while we wait, buddy. I love a chat, and chatting's free, unlike the zeppelin." },
      },
      choices = {
        { text = "Do the zeppelins ever fly through storms on the way?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What happens if the zeppelin goes down over the jungle?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Are these zeppelins safe?", next = "safe" },
        { text = "Why do you like it here?", next = "sun" },
        { text = "Do you see much from up here?", next = "view" },
        { text = "Is the zeppelin really perfectly safe, Nez'raz?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do many mages skip the zeppelin, Nez'raz?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What happened to the rope, Nez'raz?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do beasts really get airsick on your zeppelin, Nez'raz?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do druids ride your zeppelins much, Nez'raz?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Am I really your ideal passenger, Nez'raz?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll catch the next one.", next = "END" },
      },
    },
    safe = {
      lines = {
        { id = "sa_default", text = "Safe as houses, pal, and goblin houses at that, which only explode on holidays! The engines hum, the bags hold, and if anything goes wrong, well, you'll be the first to know, and you'll have a great view." },
        { id = "sa_gnome", when = { race = "Gnome" },
          text = "You're a gnome, so you'll look at the engine and frown, and I'll tell you right now it works, so don't touch it. Safe as houses, really." },
      },
      choices = {
        { text = "That isn't reassuring.", next = "safe_reassure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_reassure = {
      lines = {
        { id = "sr_default", text = "It wasn't meant to be, pal, it was meant to be honest, which is rarer for a goblin. The Horde pays us well, and nobody pays well for a ship that falls down." },
      },
      choices = { { text = "Fair point. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sun = {
      lines = {
        { id = "su_default", text = "The sun, the sea, the breeze off the coast, and nobody asking for a bribe, which is a savings all by itself. Out in Durotar the wind blows sand into the gearbox, but here it just blows the smell of the jungle into your face, and I've gotten fond of it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    view = {
      lines = {
        { id = "vi_default", text = "Everything, pal! Trolls on the ridges, the ruins in the jungle, the Commander pacing his walls, and once a raptor that tried to climb the tower. It didn't make it, which is the best story I've got." },
      },
      choices = {
        { text = "The trolls come close?", next = "view_trolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    view_trolls = {
      lines = {
        { id = "vt_default", text = "They come and look and go away again. They don't like the zeppelin, I think, and I don't blame them, kid, because a big bag of gas flying over your home would make anybody nervous, especially if they'd seen one go up." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a goblin with a good job, a nice view, a steady wage and a tower all my own. Not much else to say, pal." } },
    advice = { { id = "tp_ad", text = "Don't lean over the rail, pal. The ones who do always find out how far down it is." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if it can't ride a zeppelin, I can't help." } },
  },
}

P:NPC {
  key = "thysta", id = TODO_NPC("Thysta"), name = "Thysta",
  bible = "bibles/gromgol_more.md", role = "flightmaster", tier = "service",
  communities = { "gromgol" }, temper = { "calm" }, values = { "dutiful", "patient" },
  notices = { "race", "class" },

  impression = {
    first = "Thysta keeps the wind riders at Grom'gol, calmly, as though the jungle beyond the walls weren't trying to eat everything in it. She watches the trolls on the ridges more closely than she lets on.",
    third = "{name} met Thysta, the wind rider master at Grom'gol.",
  },

  greetings = {
    { id = "g_default", text = "The riders are ready when you are, so tell me where you need to go." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The riders are rested, and so am I, for once." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Your beast keeps eyeing my riders, so keep it back. They've no love for jungle cats." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. The jungle trolls on the ridges watch everyone who comes and goes from this camp, so keep your head low when you leave." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It doesn't worry me, but it interests the trolls on the ridges, and that worries me. Out here anything bright draws eyes, and the Bloodscalp have no love for the Light or the dead, so they'll have twice the reason to come for you." } },
      choices = {
        { text = "Let them come. I won't hide what I am.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep it dim and strike before they see me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They threaten everyone on the road, but they test warriors first, to see whether you'll chase them up into the ridges. Don't, because that's exactly where they want you, with spears above you and nothing behind you." } },
      choices = {
        { text = "I'll hold the road and let them come down to me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If they test me, I'll go up and teach them a lesson.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Since the walls went up, and they've never once come down while the wind riders are in the air, which tells me they're smarter than the grunts believe. A good hunter could learn their paths, and I'd sleep better knowing which way they go home." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Since the walls went up, and they've never once come down while the wind riders are in the air, which tells me they're smarter than the grunts believe. A good hunter could learn their paths, and I'd sleep better knowing which way they go home. Your {pet} keeps looking up at the ridges, too, and I trust a beast's nose over a grunt's eyes any day." },
      },
      choices = {
        { text = "I'll scout their paths and report them plainly to the Commander.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather pick them off one by one up there.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Safe enough in the air, but the landings are another matter. The swamp at Stonard has things in the water, and the Badlands around Kargath have ogres and worse, so keep a spell ready when you climb down." } },
      choices = {
        { text = "I'll go ready and careful, then. Thank you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take my chances. Nothing out there is faster than me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They do, and I think it's because you listen to the wind instead of shouting at it. Most riders shout, and the beasts carry them anyway, but they carry a shaman as if they were glad to." } },
      choices = {
        { text = "Listening is the better way, with beasts and with spirits.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A beast is a tool. It should carry whoever pays.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Everything that comes and goes from Grom'gol, including the wind riders, which is why I fly them low and fast. The Bloodscalp have archers who can hit a rider at a hundred paces, and I've lost a beast to them already." } },
      choices = {
        { text = "I'll clear the archers from the ridges.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fly higher. That's the simplest answer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Thysta.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because they remember the old Horde, when the orcs drank demon blood and the skies were full of fel fire. A wind rider never forgets a smell, and they've been nervous of anything fel ever since." } },
      choices = {
        { text = "I'll keep my demon away. The beasts deserve calm.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The beasts will learn. Times have changed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Gathering, mostly, and burning things in the old ruins, and once I saw a fire go green and not come back. The riders won't fly low over Zul'Gurub anymore, and wind riders aren't easy beasts to frighten." } },
      choices = {
        { text = "Whatever burns green up there must be stopped before it spreads.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leave the trolls to their ruins. It isn't the Horde's fight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The wind riders feel the air before we do, and they've been restless all morning, so perhaps you can tell me why." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The riders are uneasy around the dead and the loa alike, but they'll carry you, because I ask them to." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Some of you can teleport, I know, but the riders go where your spells don't reach, which is most places." },
        { id = "h_default", key = true,
          text = "Thysta, wind rider master. From Grom'gol the riders go to Kargath and Stonard, and to the goblins at Booty Bay, if you've any business that far south." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You'll be wanting to scout the ridges, I suppose, and I'll warn you that the trolls up there see more than they let on." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The wind riders don't care for your companion, so I'll ask you to keep it on the ground while I saddle your mount." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The wind riders don't mind your armor, but they hate the noise of it, so climb on slowly and try not to clank." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have noticed the trolls on the ridges watching us, I expect, since your kind usually does." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid of the Earth Mother. The jungle here isn't like Mulgore, friend; the trees have teeth, and the trolls on the ridges watch everything." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin, glowing at my perch. The trolls on the ridges will see you from a mile off, so stand behind the beasts while you wait." },
      },
      again = {
        { id = "h_again", text = "Ask, then. The wind riders are fed and resting, so I have a moment." },
        { id = "h_again2", text = "Anything more? The riders are waiting, but patiently." },
      },
      choices = {
        { text = "Do the wind riders take to shamans more than to others?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Are the routes to Stonard and Kargath safe for a lone caster?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "How do the riders like the jungle?", next = "jungle" },
        { text = "Who watches your pens from the jungle?", next = "trolls" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "What do the trolls on the ridges see, Thysta?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why don't wind riders like demons, Thysta?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the ridge trolls threaten warriors on the road, Thysta?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How long have the ridge trolls been watching, Thysta?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do you see the trolls doing up on the ridges, Thysta?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Does the Light on me worry you, Thysta?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not now.", next = "END" },
      },
    },
    jungle = {
      lines = {
        { id = "ju_default", text = "Not at all, and they shy at every shadow in the canopy. Something in that green is always waiting to drop on them, and they know it better than we do." },
      },
      choices = {
        { text = "Do they ever get taken?", next = "jungle_taken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jungle_taken = {
      lines = {
        { id = "jt_default", text = "Not yet, and not while I'm watching. I keep them in the open, on high ground, and I keep my axe by the pen." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    trolls = {
      lines = {
        { id = "tr_default", text = "Bloodscalp, mostly, sometimes Skullsplitter. They watch us and we watch them, and so far nobody's been fool enough to start anything at this end of the camp." },
      },
      choices = {
        { text = "They should be driven off.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let them watch. It's their jungle.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep the riders. That's my work, and I do it well." } },
    advice = { { id = "tp_ad", text = "Fly high over the jungle, because the Bloodscalp throw spears and the gorillas throw worse." } },
    _none = { { id = "tp_none", text = "I don't know that one. Ask the Commander; he knows the camp better than I do." } },
  },
}

P:NPC {
  key = "uthok", id = TODO_NPC("Uthok"), name = "Uthok",
  bible = "bibles/gromgol_more.md", role = "vendor", tier = "service",
  communities = { "gromgol" }, temper = { "gruff" }, values = { "practical" },
  notices = { "weary", "class" },

  impression = {
    first = "Uthok sells general supplies at Grom'gol: bags, arrows, a little food, and whatever else can be shipped in by zeppelin without spoiling. He's gruff and quick, and he watches his stock like a hawk.",
    third = "{name} met Uthok, who sells general supplies at Grom'gol.",
  },

  greetings = {
    { id = "g_default", text = "I've got bags, ammunition and drink, so tell me what you need." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more, then. Good, the jungle eats supplies faster than I can stock them." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Low on arrows? The jungle swallows them; you shoot, and they're gone into the green, so buy double." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've been dead recently, by the look of you. Buy some drink and rest before you head out again." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Less than anyone else, which is a pity for me. The jungle rots everything I sell, and you're the only customer who doesn't rot any faster than you already have, so take what you need and leave the rest for the living." } },
      choices = {
        { text = "I'll take only what I need. Leave the rest for the living.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My coin's as good as theirs. I'll take what I please.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More bandages than you think, because the trolls coat their spears with something nasty, and a cut left open turns green by morning. Whetstones too, since the damp blunts an edge in a day, and nobody believes me until they're facing a raptor." } },
      choices = {
        { text = "Good. A warrior who prepares properly lives longer.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I travel light. Speed matters more than supplies.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because everything comes in by zeppelin, the goblins charge by the crate, and half the hunters at this camp fire at anything that moves in the trees. Buy enough for a week and aim properly, and you won't need to come back to me complaining." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because everything comes in by zeppelin, the goblins charge by the crate, and half the hunters at this camp fire at anything that moves in the trees. Buy enough for a week and aim properly, and you won't need to come back to me complaining. And food for {pet} as well, I suppose, unless it's learned to hunt for itself, which out here it had better." },
      },
      choices = {
        { text = "Every arrow should count. I don't waste shots.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll shoot as much as I need. The jungle's full of targets.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Reagents first, because the damp spoils them, and then clean water, because the jungle water gives you the shakes. Bring your own if you can, and if you can't, buy mine and don't complain about the price." } },
      choices = {
        { text = "I'll pay your price. You've earned it out here.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll haggle, and you'll take less, Uthok.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The zeppelin does, along with everything else, and the goblins mark them up twice before they reach me. I mark them up once more, so don't look at me like that, because I'm the cheapest of the three." } },
      choices = {
        { text = "Supplying the Horde should be a duty and never a trade.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everyone profits off the war. Take your cut.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Trolls, mostly, who sneak down from the ridges at night and take whatever they can carry. I've started sleeping beside the crates, and I've a club close at hand, so the next one who tries will have a headache." } },
      choices = {
        { text = "I'll help you guard the crates.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A few lost crates won't sink Grom'gol.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Uthok.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A little, but not as much as you'd think, since conjured food doesn't keep and most folk still want something real at the end of the day. The zeppelin brings in fresh supplies every week, and they always sell out." } },
      choices = {
        { text = "Real food is worth paying for. I'll buy some.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Conjured food is free. Your trade will suffer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because they rot faster than I can sell them, and because the last time I paid a picker, a panther ate him. Druids pick their own and don't get eaten, and everyone else can buy a bandage and stop complaining." } },
      choices = {
        { text = "The jungle is generous to those who respect it. Learn that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bandages don't rot, and nobody gets eaten picking them. Sold.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll want ankhs, then, and shiny scales, though the jungle turns my stock green as fast as I unpack it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Candles, cloth and bandages, that's what your lot buy, and the jungle eats the candles." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. I've got what you need for your rituals, and I don't ask what you need it for." },
        { id = "h_default", key = true,
          text = "Uthok, general supplies. Everything I sell came off a zeppelin, and the jungle will rot it or eat it in a week, so buy what you need and use it fast." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. I'll be watching my stock while you're here, so don't take it personally, because I watch everyone." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You'll want food and water, I'd guess, unless you're the kind who conjures his own and leaves honest merchants with nothing to sell." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll want bandages, rations and a whetstone, and you'll want them now, before the jungle eats my stock." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Arrows and shot are in the back, and they're dearer here than in Orgrimmar, so don't waste them on monkeys." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll be wanting herbs, then, and I don't stock them, because the jungle's full of them and anyone who can't pick their own shouldn't be here." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. You won't need food, I suppose, so you'll be wanting bags and arrows and nothing that rots, which makes you my favourite kind of customer." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Anything more? I've got crates to open." },
      },
      choices = {
        { text = "Who supplies your ankhs this far from Orgrimmar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What supplies run short in Grom'gol for casters?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What's the hardest thing to keep in stock?", next = "stock" },
        { text = "Do the trolls ever try to steal from you?", next = "thieves" },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Has anyone stolen from you at Grom'gol, Uthok?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Does conjured food hurt your trade, Uthok?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What should a warrior carry in this jungle, Uthok?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why are arrows so dear at Grom'gol, Uthok?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why don't you stock herbs, Uthok, with the jungle right outside?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What does a Forsaken paladin need from your stock, Uthok?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Nothing today.", next = "END" },
      },
    },
    stock = {
      lines = {
        { id = "st_default", text = "Arrows and shot, because every hunter in camp goes out after raptors and comes back with an empty quiver. After that, anything made of cloth, because the damp turns it green in three days." },
      },
      choices = {
        { text = "Can't the zeppelin bring more?", next = "stock_zep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock_zep = {
      lines = {
        { id = "sz_default", text = "It does, and the goblins charge the Horde for every crate as if it were gold. I complain to the Commander, and he complains to Orgrimmar, and nothing changes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thieves = {
      lines = {
        { id = "th_default", text = "The Bloodscalp have stolen rations from the caravans, so the Commander says, but never from my tent. I sleep on my crates, and they know it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sell supplies. I came with the Commander, and I'll leave with him." } },
    advice = { { id = "tp_ad", text = "Keep your bags dry, or everything in them rots. I opened a sack of flour last week, and something in it opened its eyes at me." } },
    _none = { { id = "tp_none", text = "Don't know. I sell supplies, not stories." } },
  },
}
