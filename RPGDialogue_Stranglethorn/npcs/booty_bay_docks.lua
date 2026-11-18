-- Booty Bay, the docks and the weapon stalls: Old Man Heming of the fishing tournament, Mazk Snipeshot the gunsmith, Haren Kanmae the bowyer. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "heming", id = TODO_NPC("Old Man Heming"), name = "Old Man Heming",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "folksy", "stubborn" }, values = { "patient", "craft" },
  notices = { "class", "weary" },

  impression = {
    first = "Old Man Heming sits on the Booty Bay docks with a line in the water and an opinion on every fish in the South Seas. He swears the sea has taught him more than any book, and he's probably right.",
    third = "{name} met Old Man Heming, the old fisherman on the Booty Bay docks.",
  },

  greetings = {
    { id = "g_default", text = "Mind the line, youngster, and keep your shadow off the water; you'll scare the snappers." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Pull up a crate, then, and hush while I've got a nibble." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, eh? You'll know patience, then, which is the whole of fishing and half of living." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the tide dragged you in and spat you out. Sit down a spell, there's no hurry on a dock." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That the fish decides when the fight starts, not you, and if you yank too early you lose him. I've watched young soldiers lose a hundred fights by swinging too soon, and I've never seen one lose by waiting a breath longer." } },
      choices = {
        { text = "You're right. Patience wins more fights than strength.", next = "BACK", reply = "Now there's a soldier who'd make a fisher, given a few quiet years. Sit with that thought a while, and the fights will come to you.", fx = { align = { order = 1 } } },
        { text = "Waiting gets you killed. Strike first and strike hardest.", next = "BACK", reply = "That's what the last soldier told me, and the snapper took his line and half his pole. Strike first if you like, kid, but strike at the right time.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Same thing, near enough: you learn where your quarry feeds, when it feeds and what it fancies, and then you wait. The difference is that a tiger can't snap your line, though a big enough tastyfish surely can." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Same thing, near enough: you learn where your quarry feeds, when it feeds and what it fancies, and then you wait. The difference is that a tiger can't snap your line, though a big enough tastyfish surely can. And your {pet} would sit still for a fish, I'd wager, while the young anglers in the Baron's tournament can't sit still for the length of one cast." },
      },
      choices = {
        { text = "Fish and beasts both deserve a hunter's respect.", next = "BACK", reply = "They do, and they'll repay it by feeding you for the rest of your days. The ones who forget that end up hungry and wondering why.", fx = { align = { honor = 1 } } },
        { text = "Bait, wait and catch. Respect has nothing to do with it.", next = "BACK", reply = "Plenty of hunters think so, and plenty of them go home with empty creels. The sea notices who respects it, kid, mark my words.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Down by the Vile Reef the naga have been stirring, and some mornings my hook comes up with weed on it that glows a faint green. I've fished these waters all my life and never seen that before, so I throw it back and fish somewhere else." } },
      choices = {
        { text = "I'll go and see what's stirring, for the town's sake.", next = "BACK", reply = "Good of you, and the town won't thank you, so I will. Mind the reef at low tide, though, because the naga don't wait for introductions.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the naga have treasure down there, I'm interested.", next = "BACK", reply = "Treasure, is it? The naga keep plenty, but they keep it with their teeth, so bring a strong line and a stronger stomach.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every morning, though not in any words your elders would know. I throw back the first fish I catch, because my father did and his father before him, and I haven't drowned yet." } },
      choices = {
        { text = "That's an old way worth keeping, Heming.", next = "BACK", reply = "It is, and you're the first who's said so without laughing. My father would've liked you, and he didn't like anybody.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Throwing back a good fish sounds like a wasted supper.", next = "BACK", reply = "Wasted, maybe, but I've eaten every day for sixty years, so the sea must think the deal's fair. Keep your supper and I'll keep my luck.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Close enough, since both of us sit very still for a long time and strike before the other fellow knows what happened. The difference is that a fish never holds a grudge, and I'd guess your marks aren't so forgiving." } },
      choices = {
        { text = "I strike only when I must. Patience is everything.", next = "BACK", reply = "Then you'd make a fine fisher, if you ever tired of pockets. Patience does most of the work, and the strike does the rest.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A grudge is fine, so long as they never see me coming.", next = "BACK", reply = "Ha! Mind you don't grudge the wrong fish, then, because some of 'em bite back. Patience still matters, even for the angry ones.", fx = { align = { honor = -1 } } },
        { text = "Something else, Heming.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, a young mage who froze a whole patch of the bay solid and then couldn't work out how to get the fish out of the ice. I laughed so hard I nearly fell off the dock, and he walked away with nothing but a cold pair of hands." } },
      choices = {
        { text = "The old way is best. I'll learn from you.", next = "BACK", reply = "Good! Start with the little ones near the pier and work your way out, and don't freeze anything, whatever you do.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "He just needed a better spell. Magic will get there.", next = "BACK", reply = "Maybe it will, and I'll be dead before it does, so I'll not lose sleep. Until then, a hook and a bit of bait still beat a block of ice.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Better, I'd say, because prayer lets you think you've done something, but the sea makes you sit and wait with nothing but your own thoughts for company. I've been waiting on these docks longer than most of the goblins have been alive, and I've learned more sitting still than most men learn walking." } },
      choices = {
        { text = "Patience and discipline, that's the whole of faith.", next = "BACK", reply = "You've said it better than most priests I've met. Sit on a dock for a few years and you'll find there's not much more to it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather follow the tide wherever it takes me.", next = "BACK", reply = "The tide takes you to the fish sometimes, and sometimes it takes you to the rocks. Go and see which, and come back with a story.", fx = { align = { order = -1 } } },
        { text = "Something else, Heming.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That it's too old and too smelly, same as me, and still better than whatever the youngsters are throwing. I've fished this bay since before the goblins came, friend, and the fish have changed a sight less than the town has." } },
      choices = {
        { text = "Then you've fished it gently. Keep taking only what you need.", next = "BACK", reply = "That's the old way, and it's kept me and the bay fed for sixty years. Glad to hear somebody else remembers it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good fisherman takes what bites. The sea's big enough.", next = "BACK", reply = "Big enough, aye, till the day it isn't. Take what bites, kid, but keep an eye on how many bite tomorrow.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That you can't hurry a fish and you can't bully the sea, and most folk learn both too late. You paladins charge at things, which suits a battlefield, but out here the patient man eats and the hasty one goes home with an empty line and a sore temper." } },
      choices = {
        { text = "I'll mind that, Heming. Patience is a discipline.", next = "BACK", reply = "You'll be a better paladin for it, and a better fisher too. The Light waited a long while for you, so you can wait for a snapper.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather charge and miss than sit and wait.", next = "BACK", reply = "Then you'll go home with a lot of exercise and no supper. Charge if you like, but the fish will laugh at you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, by the tides! Sit down a spell if your armor lets you, though I'll warn you that anyone in plate who falls off this dock goes straight to the bottom and stays there." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, by the tides! Sit down and hold this rod a moment, because I've always thought the Light must favor fishermen, seeing how much patience we need and how little we're paid for it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Your folk know water better than most, so I'd wager you can tell a good fishing day before the fish can." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Say one for the fish, would you? They never get a word said for them, and I've eaten enough to owe them that." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Keep your little fire-beast away from the water's edge; it boils my bait and puts the snappers off." },
        { id = "h_default", key = true,
          text = "Name's Heming, and I've fished these waters since before the goblins carved this bay into a town. Every Sunday the Baron holds his fishing tournament, and I like to think I taught most of the winners how to bait a hook, though none of them ever thank me." },
        { id = "h_quest", when = { questActive = TODO_QUEST("Old Man Heming") },
          text = "Still working on the fishing I set you, are you? Keep your line slack and your temper slacker, and the fish will come round in time." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, out on my docks. You'll make a fine fisherman, I reckon, since you already know how to sit still and wait for something to bite." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Don't you go freezing my fish in the water, now, because I've been fishing these docks for years and I've never once needed magic to fill my bucket." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, out on my docks. Sit a while if you like, because a fishing line teaches the patience a sword never will." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! You'll understand fishing, then, since it's only hunting with a longer leash and wetter boots." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Ever turned into a fish? I've always wondered what they think of my bait, and I'd guess it isn't much." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind? The fish aren't biting anyhow." },
        { id = "h_again2", text = "Go on, ask. An old man likes to be asked." },
      },
      choices = {
        { text = "Do you ever thank the sea for what it gives you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Strange things must come up out of the water near Booty Bay.", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Tell me about the fishing tournament.", next = "tourney" },
        { text = "What lives in these waters?", next = "fish" },
        { text = "How long have you lived here?", next = "past" },
        { text = "I'm a fisherman myself.", next = "angler", when = { profession = "Fishing" } },
        { text = "Fishing sounds a lot like my line of work, Heming.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have you ever seen magic used to fish, Heming?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does the sea teach patience the way prayer does?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What could a warrior learn from fishing, Heming?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Is fishing much like hunting to you, Heming?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What would a fish say about your bait, old man?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What has the sea taught you that a paladin should know, Heming?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    tourney = {
      lines = {
        { id = "to_default", text = "Every Sunday the Baron's men ring the bell, and every angler from here to Ratchet scrambles to land the biggest catch in two hours. Riggle Bassbait runs the thing and hands out the prizes, and I've told him the fish are the real winners, but he only laughs." },
      },
      choices = {
        { text = "Why don't you enter yourself?", next = "tourney_why" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    tourney_why = {
      lines = {
        { id = "tw_default", text = "Because a man my age doesn't need a prize to tell him he can fish. I come down and watch the young ones sweat, and I give a word of advice to anyone who asks me kindly." },
      },
      choices = {
        { text = "You must have some advice, then.", next = "tourney_advice" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    tourney_advice = {
      lines = {
        { id = "ta_default", text = "Fish where the water churns, near the wrecks and the rocks, because that's where the big ones feed. And don't waste time on little fish; the big ones never fill up on minnows." },
      },
      choices = {
        { text = "I'll crowd the best spot before anyone else gets there.", next = "BACK", reply = "Winning's nice, kid, but I've seen a hundred winners and remembered maybe three. Fish well, and the winning takes care of itself.", fx = { align = { honor = -1 } } },
        { text = "I'll find my own spot and leave the others theirs.", next = "BACK", reply = "That's the spirit I like on my dock. Fair fishing's the only kind that's worth the bragging afterward.", fx = { align = { honor = 1 } } },
        { text = "I'll remember that, thanks.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    fish = {
      lines = {
        { id = "fi_default", text = "Snappers and rockscale cod close in, and out past the reefs there's mightfish as long as your arm. Sharks too, mind, and the Bloodsail chum the water off Wild Shore when they're butchering their catch." },
      },
      choices = {
        { text = "Do the Bloodsail ever trouble you?", next = "fish_bloodsail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish_bloodsail = {
      lines = {
        { id = "fb_default", text = "Pirates don't bother an old man on a dock, because I've nothing worth stealing but a good rod. The Blackwater lads hate them, though, and if you want trouble with the Bloodsail, there's plenty to be had." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    past = {
      lines = {
        { id = "pa_default", text = "Long enough to remember when this bay was just a cove with a few shacks and a lot of sharks. The goblins came, and built and built, and now there's a whole town hanging off the cliffs, but the fish are the same as they ever were." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    angler = {
      lines = {
        { id = "an_default", text = "Are you, now? I can see it in how you stand, not leaning over the water like a landlubber. Come Sunday you should try your luck in the tournament, and show those young braggarts how it's done." },
      },
      choices = { { text = "Maybe I will, old man.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm an old fisherman, and that's all I ever wanted to be. Some men chase gold; I chase snappers, and I sleep better for it." } },
    advice = { { id = "tp_ad", text = "Be patient, youngster. The fish don't care how busy you are, and neither do the sharks." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the best fishing in the South Seas, and nobody here ever bothers an old man with a line in the water. That's all I've ever asked of a town." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire comes through sometimes and sets up a fishing contest, and the youngsters always think they can beat old Heming. They never do." } },
    second_war = { { id = "tp_second_war", text = "I was fishing these waters during the Second War, and the orc ships scared the fish worse than they scared me. The snapper didn't come back for a whole season." } },
    theramore = { { id = "tp_theramore", text = "I fished off Theramore once, and the fish there are fat and lazy and practically jump into the boat. Proudmoore's people don't know what they've got." } },
    _none = { { id = "tp_none", text = "Never heard of it, and if it doesn't swim, I don't much care." } },
  },
}

P:NPC {
  key = "mazk", id = TODO_NPC("Mazk Snipeshot"), name = "Mazk Snipeshot",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "salesy", "brash" }, values = { "profit" },
  notices = { "class", "race" },

  impression = {
    first = "Mazk Snipeshot sells guns and shot in Booty Bay and fires off sales talk faster than any rifle he stocks. He's a goblin who likes loud things, and he says so proudly.",
    third = "{name} met Mazk Snipeshot, who sells guns in Booty Bay.",
  },

  greetings = {
    { id = "g_default", text = "Guns, shot, powder, everything that goes bang, all priced to move! Step right up, pal, and don't touch the hair triggers, because those are a deposit." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite customer's back! You always need more shot, pal, so let's see what you're short of." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Now there's somebody who appreciates a fine barrel, buddy, so take a look at the long rifles, and don't look at the price tag till you've held one." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! You folks know your guns, so don't go telling me Ironforge makes them better, because I've heard it, and Ironforge charges twice as much for the beard on the stock." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "You pull a raptor off the healer from across the clearing, that's what, and then it comes running at you instead of at somebody squishy. Every warrior I've sold a blunderbuss to has come back for more shot, which is what I call recurring revenue." } },
      choices = {
        { text = "A warrior should meet the enemy close, steel to steel.", next = "BACK", reply = "Sure, friend, and the raptor gets to meet you close too, along with its six brothers. A rifle on your back never stopped anybody swinging.", fx = { align = { honor = 1 } } },
        { text = "A shot from range is smart fighting. I'll take a rifle.", next = "BACK", reply = "Now you're fightin' smart, pal! A boom from the trees and a sword at the ready, that's a warrior who lives to buy the next box of shot.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Range, punch and noise, and the noise is the part everybody forgets, because the shot that doesn't kill it still scares it out of the brush. Haren the bowyer across the way will tell you a bow's quieter, and I'll tell you quiet is overrated." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Range, punch and noise, and the noise is the part everybody forgets, because the shot that doesn't kill it still scares it out of the brush. Haren the bowyer across the way will tell you a bow's quieter, and I'll tell you quiet is overrated. Your {pet} will get used to the bang soon enough, they all do, and then it'll come running at every shot because it knows supper's down." },
      },
      choices = {
        { text = "A quiet, clean shot honors the beast. Noise is lazy.", next = "BACK", reply = "Lazy? Pal, the noise is the whole point, it scares off the second beast while you're skinning the first. Efficiency, that's what you're buyin'.", fx = { align = { honor = 1 } } },
        { text = "Loud's fine by me. Whatever drops the beast fastest.", next = "BACK", reply = "That's my kind of customer! Fast, loud and done, and you're back at the bar before the tigers know what happened.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The rebels who walked out on Colonel Kurzen, if you can believe it, and they pay in Stormwind silver, so draw your own conclusions. Second place is the Bloodsail, who buy through middlemen and think I don't notice, and I mark it up twenty percent for the insult. I sell to both and sleep fine." } },
      choices = {
        { text = "Selling to both sides is just good business.", next = "BACK", reply = "Exactly, pal, silver's silver and I ain't picky about the mint. Long as they pay up front, they're customers.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Arming the Bloodsail puts all of Booty Bay at risk.", next = "BACK", reply = "Easy, easy, I said second place, not first, and the Bloodsail pay more and get worse powder. Call it my contribution to public safety.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because spirits get moody and powder doesn't, friend, or not often anyway, and when it does, well, you only need eyebrows for show. I once watched a shaman call lightning on a raptor and fry his own kodo instead, pal, and my blunderbuss never did that to anybody's kodo." } },
      choices = {
        { text = "I trust the elements over powder. They've never misfired on me.", next = "BACK", reply = "Never? Friend, I've seen a shaman get struck by his own lightning, which costs nothing but your hair. Powder's honest, it only explodes when you ask it to, mostly.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll use whatever works. Show me a blunderbuss.", next = "BACK", reply = "Now you're talkin'! A shaman with a blunderbuss, that's a whole new market, friend. Grab one off the rack and feel the weight.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a dagger only works up close, and sometimes the trouble's across the room, and that's when you want something that goes bang. I've sold pistols to Bloodsail captains up and down this coast, and to the Blackwater captains who shoot at them, and that's what I call a healthy market." } },
      choices = {
        { text = "I'd sell to Booty Bay, not the Bloodsail. Pick a side.", next = "BACK", reply = "Pick a side? Pal, that's the dumbest thing a merchant could do, the side you pick loses half your customers. I'll stay neutral and stay rich.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Gold's gold. Sell to whoever has it.", next = "BACK", reply = "You're a rogue after my own heart, pal. Gold's the only side that never surrenders.", fx = { align = { honor = -1 } } },
        { text = "Something else, Mazk.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd sell a gun to a gorilla if it had the gold, and I've come close more than once. The trouble with demons is they never seem to carry any money, so I'd need you to sign for it, and I'd charge you extra for the scorch marks." } },
      choices = {
        { text = "My demon doesn't need a gun. Keep your blunderbuss.", next = "BACK", reply = "Suit yourself, but I'll bet that imp would love a little popgun. It'd be the scariest four inches in Stranglethorn.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Arm the imp. Let's see what happens.", next = "BACK", reply = "Ha! Now there's an idea with a market in it, pal. Bring the little fella round and I'll see if I've got anything in his size.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because claws don't reach the far side of a river, friend, and a raptor pack doesn't wait for you to finish changing. I've sold rifles to tauren and night elves both, and they all swore they'd never use it until the day they did." } },
      choices = {
        { text = "I'll keep to claw and root. Your guns only frighten the wild.", next = "BACK", reply = "Frighten the wild? Friend, the wild don't need my help bein' frightened, it's got trolls for that. Suit yourself, but my offer stands.", fx = { align = { order = 1 } } },
        { text = "A sensible druid uses whatever works. Show me the rifles.", next = "BACK", reply = "A druid with sense, I love it! The tigers can keep their claws, and you can keep a rifle on your back for the river crossings.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not trade, friend, add! You keep the hammer for the troll right in front of you and the gun for the one in the trees, and the Light can sort out which one deserved it. Every paladin says no the first time, and half of them come back after their first Bloodsail ambush." } },
      choices = {
        { text = "My hammer and the Light serve me well enough.", next = "BACK", reply = "The Light and a hammer, sure, and when the troll in the trees puts a spear through you, the Light can heal that too. My offer stands, friend.", fx = { align = { order = 1 } } },
        { text = "Fair point. Show me what you've got, Mazk.", next = "BACK", reply = "Now we're talkin', friend! Have a look at the rack and pick somethin' with a little weight in the stock.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Hammers are fine, friend, but have you ever thought about what you could do with a hammer that fires? Don't answer yet, just let it sink in." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? Lightning's grand, chum, but it never lands quite where you point it, and that's why I sell guns." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! You'll be needing protection, pal, because prayers are slow and a blunderbuss isn't." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, eh? Fireballs are flashy, pal, but when you're out of mana, a pistol's still loaded." },
        { id = "h_default", key = true,
          text = "Mazk Snipeshot, gunsmith to the finest pirates, hunters and lunatics in the South Seas! Everything on this table shoots straight, mostly, and anything that doesn't is on sale, no refunds on eyebrows." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now, I know your sort likes things quiet, but let me tell you, pal, nothing ends an argument faster than a nice loud gun." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now that's something I've never sold a gun to, pal, though I'd bet a demon would look mighty fine with a blunderbuss on its shoulder." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Swords are lovely, chum, really, but a warrior with a good rifle on his back can start the argument from forty yards off and finish it up close." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Now, I know some of you are bow people, but believe me, pal, nothing introduces you to a tiger like a nice loud gun." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now, I know your kind doesn't care for guns, buddy, but hear me out: a rifle never once turned into a bear and ate its owner." },
      },
      again = {
        { id = "h_again", text = "What else can I sell you, pal? I mean, help you with? It's the same thing, really." },
        { id = "h_again2", text = "Anything else? I've got time, sparks and sprockets, I've got stock, and stock's money sitting still." },
      },
      choices = {
        { text = "Why would a shaman ever need one of your guns?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who in Stranglethorn is buying the most guns these days?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Guns must sell well in a town like Booty Bay.", next = "buyers" },
        { text = "Where do your guns come from?", next = "source" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Why should a rogue carry a gun, Mazk?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would you really sell a gun to a demon, Mazk?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What use is a gun to a warrior, Mazk?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "A gun seems a noisy choice for a hunter, Mazk.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why would a druid ever buy a gun from you, Mazk?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why would a paladin ever trade his hammer for a gun, Mazk?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Not today.", next = "END" },
      },
    },
    buyers = {
      lines = {
        { id = "bu_default", text = "Everybody, pal! Hunters going after Nesingwary's tigers, sailors who've seen too many Bloodsail flags, and once a troll who wanted to shoot a raptor that ate his hat. A town like this runs on shot and grog, and I've cornered the shot." },
      },
      choices = {
        { text = "You'd sell to anybody?", next = "buyers_anyone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_anyone = {
      lines = {
        { id = "ba_default", text = "Anybody the Baron lets through the gate, and the Baron lets in anybody with coin. Booty Bay doesn't care if your money's Horde or Alliance, buddy, so long as it's gold, and neither do I." },
      },
      choices = {
        { text = "Fair trade is fair trade.", next = "BACK", reply = "That's the Booty Bay creed right there, pal. Coin's coin, and the Baron's gate makes everybody a customer.", fx = { align = { order = -1 } } },
        { text = "Some folk shouldn't be armed.", next = "BACK", reply = "Shouldn't, maybe, but the Baron decides who comes in, and I just sell to whoever walks past. You want to stop them, talk to him.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = {
        { id = "so_default", text = "Some from Undermine, some from Ironforge by way of people who don't ask questions, and some I put together myself in the back, so the back wall's been rebuilt twice and the front never once. The ones I make myself are the loudest, which is how you know they're good." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I came to Booty Bay to sell guns, and I stayed because nobody here complains about the noise, or the occasional small fire." } },
    advice = { { id = "tp_ad", text = "Always carry more shot than you think you need, pal. The jungle's got more teeth than you've got bullets." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the only town I know where firing a gun indoors is a matter of opinion rather than law. I love it here, pal, the noise is wonderful." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Arena's my best market, pal, because every fighter in there wants a bigger bang than the next. I sell to all sides, and I sleep like a baby." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's Bruisers don't let you fire a gun in town, pal, which is a crime against engineering. I'll stay here where the rules are reasonable." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company buys guns in bulk, pal, and pays in bulk too, so I don't ask what they're shooting at. It's probably trees, mostly." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if I can't shoot it or sell it, I can't help you." } },
  },
}

P:NPC {
  key = "haren", id = TODO_NPC("Haren Kanmae"), name = "Haren Kanmae",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "calm", "dry" }, values = { "craft" },
  notices = { "class", "race" },

  impression = {
    first = "Haren Kanmae sells bows in Booty Bay, a soft-spoken craftsman among the shouting goblins. He thinks a good bow beats a loud gun, and he's tired of saying so.",
    third = "{name} met Haren Kanmae, the bowyer of Booty Bay.",
  },

  greetings = {
    { id = "g_default", text = "Bows, crossbows and arrows, friend. Quiet weapons, for a loud town." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Still shooting straight, I hope?" },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll want a bow with some weight to it for the tigers, so let me show you what I have." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A night elf. Your people make the best bows in the world, so please be kind about mine." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A soldier who can loose an arrow can pull a beast off a wounded friend, and I'd argue that matters more than a pretty swing. The old regiments drilled with bows as well as blades, as I understand it, and it never did them any harm." } },
      choices = {
        { text = "The old drills were right. Every soldier should know the bow.", next = "BACK", reply = "You'd have made a fine sergeant, and the drill masters would have liked you. Every soldier who can draw a bow is one more who comes home.", fx = { align = { order = 1 } } },
        { text = "I trust my blade. Drills are for recruits.", next = "BACK", reply = "Your blade, maybe, but trust it from a distance some time and you'll see what I mean. Drills are for anyone who'd like to keep living.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oil every morning, wax on the string every evening, and never leave it leaning against a wet tent, which is exactly what every hunter at Nesingwary's camp does. The damp gets into the wood and twists it, and then your shot goes left when you need it straight." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oil every morning, wax on the string every evening, and never leave it leaning against a wet tent, which is exactly what every hunter at Nesingwary's camp does. The damp gets into the wood and twists it, and then your shot goes left when you need it straight. Your {pet} has chewed a bow tip in its time, I'd guess, they all do, so keep the stave off the ground at night." },
      },
      choices = {
        { text = "Oil and wax, every day, without fail. I'll keep the routine.", next = "BACK", reply = "Then your bow will outlast you, and the damp won't get a look in. You'd be surprised how few hunters say that and mean it.", fx = { align = { order = 1 } } },
        { text = "I'll string it when I need it and trust my aim.", next = "BACK", reply = "Then you'll be back at my stall within the month asking why it cracked. I'll fix it, but I'll tell you I told you so.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A mage offered once, and the stave came back dry as a bone and cracked down the middle. I've decided the damp and I will have to come to our own terms, with oil and patience and a good deal of swearing." } },
      choices = {
        { text = "Patience and honest oil. That's the right way.", next = "BACK", reply = "My thinking exactly. Oil, wax and a dry spot under the eaves will do more than any spell I've met.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Next time try a stronger spell and see what happens.", next = "BACK", reply = "The last mage who said that walked off with a pile of splinters. I'll keep my oil, thank you kindly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every good stave has something in it, though I'd call it grain and you'd call it a spirit. Either way it fights you if you cut against it, and that's all I need to know." } },
      choices = {
        { text = "Work with the grain and respect it. That's the shaman's way too.", next = "BACK", reply = "It is, and I'd guess you know it better than I do. Wood remembers the tree it came from, and it sulks when you forget.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Wood's just wood. Make it bend however you need.", next = "BACK", reply = "And then it'll snap in your hands, and you'll blame the bowyer. Wood bends the way it wants, friend, or not at all.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Some do. The sharks follow the trawlers, and the reefs off Jaguero Isle are thinner than when I was a boy. It's no great disaster yet, but I'd like it if someone remembered the sea is not a bottomless pocket." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a bow lets you strike from cover without telling the whole jungle where you are, and a gun tells everyone. The goblins here love their noise, but I've seen a single arrow end a fight that a dozen guns only made worse." } },
      choices = {
        { text = "Guns are for goblins who like the noise. I'll take a bow.", next = "BACK", reply = "My thinking too, and the goblins here think I'm mad for it. A quiet bow has saved more lives than any blunderbuss I've seen.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Noise has its uses. Sometimes you want them to hear.", next = "BACK", reply = "Sometimes, I'll grant you, if you want the whole jungle on your heels. I prefer leaving the tigers guessing.", fx = { align = { honor = -1 } } },
        { text = "Something else, Haren.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It is, since every bow starts as a living tree and ends as something that sings when you draw it. The goblins call it wood and string, but a mage should understand that the shaping is half the power, and I think you do." } },
      choices = {
        { text = "The craft is the magic. You're right about that.", next = "BACK", reply = "You understand, then, and that's rarer than you'd think. Most mages look at a bow and see only a stick with string on it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's wood and string. Magic is something else entirely.", next = "BACK", reply = "To you, perhaps, and I'll not argue spells with a mage. But draw a good bow sometime and tell me there's nothing in it.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because the hunters who come through here need bows that won't fail them, and better they buy one from me than from some goblin who glues the joints. It's honest work in a dishonest town, and I find that worth the damp, most days." } },
      choices = {
        { text = "Honest work in a crooked place matters. Keep at it.", next = "BACK", reply = "Thank you, I needed to hear that today. Some weeks the goblins make me wonder why I bother.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Glue's cheaper. You'd earn more cutting corners like the rest.", next = "BACK", reply = "I would, and then the hunters would die in the jungle, and I'd sleep badly. Let the others cut corners, I'll keep mine square.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Faith in the Light, no, but faith in people, yes, very hard some days, because I've watched good sailors sell their friends for the price of a drink. Still, every so often a hunter comes back to thank me for a bow that saved his life, and that does me for another month." } },
      choices = {
        { text = "People surprise you. Keep a little faith in them.", next = "BACK", reply = "I try, and some days they reward it, which is more than I'd say for the Bloodsail. Thank you for the reminder, friend.", fx = { align = { light = 1 } } },
        { text = "Trust the bow, not the buyer. That's wisdom here.", next = "BACK", reply = "That's the safe way here, and maybe the wise one. Still, I'd like to think a good bow makes a better man of whoever buys it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Welcome, though I've little a priest would want, unless you've a prayer for this damp, because I oil every stave each morning and the jungle undoes it all by noon." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You won't want a bow, I expect, but come in all the same, because it's quieter in here than out there, and a quiet place is hard to find in Booty Bay." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'd know the spirits of the wood, then, so ask them to keep the damp out of my staves, because nothing else has worked." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Sit a moment out of the sun, friend; whatever you serve, I doubt it wants you fainting on my pier." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. I'll sell you a bow if you like, though I suspect your little friend does your shooting for you." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "You've the sea in your eyes, druid, or the forest anyway, so sit a while if you like, since the water's calm today." },
        { id = "h_default", key = true,
          text = "Haren Kanmae, bowyer. The jungle's damp warps a bow faster than anywhere I've worked, so I oil the staves every morning and pray the humidity breaks, which it never does." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want a bow that doesn't creak when you draw it, I suspect, and I make the quietest bows in Booty Bay, though nobody here appreciates quiet." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. You'll not need a bow, I'd guess, but you're welcome to look, because a good bow is as much a work of craft as any spell." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. I make bows mostly for hunters, but I've strung a few for soldiers who knew that a line of archers can win a battle before the swords ever meet." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, at last, someone who'll actually listen to a bowyer go on about yew and string and the damp." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Anything more? I'm only stringing bows." },
      },
      choices = {
        { text = "Does the jungle's wood carry any spirit in it, do you think?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there any magic that would keep the jungle's damp out of your bows?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Do the sea creatures here suffer from the Cartel's fishing?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "You seem to prefer a bow over a gun.", next = "bowgun" },
        { text = "How do you work in this damp?", next = "damp" },
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Why do you prefer bows to guns, Haren?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is bowmaking an art to you, Haren?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why stay in a jungle that ruins your work, Haren?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you find it hard to keep faith in Booty Bay?", next = "xapala", when = { class = "PALADIN" } },
        { text = "A warrior has little use for a bow, I'd think, Haren.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "How do you keep a bow true in this jungle, Haren?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Farewell.", next = "END" },
      },
    },
    bowgun = {
      lines = {
        { id = "bg_default", text = "A bow is silent, and in the jungle, silent keeps you alive. Mazk the gunsmith will tell you otherwise, loudly, but every tiger in Stranglethorn hears his customers coming a mile away." },
      },
      choices = {
        { text = "Loud or quiet, dead is dead.", next = "BACK", reply = "Dead is dead, true, but the tiger's friends can hear the difference. Quiet means you walk home to tell the story.", fx = { align = { honor = -1 } } },
        { text = "A clean, quiet shot is the honest way.", next = "BACK", reply = "You and I see it the same way, friend. Mazk can keep his blunderbuss, and I'll keep my hearing.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    damp = {
      lines = {
        { id = "da_default", text = "Oil, wax, and a dry box I keep in the back with a little fire under it. It isn't much, but it keeps my strings from rotting, and no bowyer up in Stormwind ever needed to bother with one." },
      },
      choices = {
        { text = "Where do you find good wood?", next = "damp_wood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    damp_wood = {
      lines = {
        { id = "dw_default", text = "Not in this jungle; it grows soft and wet. I buy staves from the ships when they come in from the north, and I pay too much, but a bowyer can't work with rotten wood." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I make bows, and I came south where the hunting is good and the customers are many. That's all there is to it." } },
    advice = { { id = "tp_ad", text = "Keep your bowstring dry, friend. A wet string won't fire, and the jungle won't wait for it to dry." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's loud, and I'm not, so we get along by mostly ignoring each other. The hunting in the jungle is worth it." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I've seen fighters at the Arena try to use guns in close quarters, and it's the bow users who walk out alive more often than not. I don't say it to anyone, but I notice." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The trolls of Zul'Gurub are fine archers, I'll grant them that, and their tiger-riders are better hunters than any of us. I give that city a wide berth when I'm in the north." } },
    elune = { { id = "tp_elune", when = { race = "NightElf" }, text = "You'll have heard the priestesses say the hunt is sacred to Elune, and I've come to think they're right, even this far from Ashenvale. I say a word to the moon before every long shot." } },
    _none = { { id = "tp_none", text = "I don't know about that. I know about bows." } },
  },
}
