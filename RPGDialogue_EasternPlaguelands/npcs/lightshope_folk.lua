-- Light's Hope Chapel's working folk (0.39.0): the two flight masters, the innkeeper and the trade goods seller.
-- Voice: bibles/easternplaguelands.md ("Light's Hope working folk")
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "khaelyn", id = TODO_NPC("Khaelyn Steelwing"), name = "Khaelyn Steelwing", title = "Gryphon Master",
  bible = "bibles/easternplaguelands.md", role = "flightmaster", tier = "service",
  communities = { "light_hope" }, temper = { "blunt" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Khaelyn Steelwing keeps the Alliance gryphons at Light's Hope Chapel and flies them over the worst land in Lordaeron. She shares the yard with a Forsaken bat handler and has made a hard, practical peace with it.",
    third = "{name} met Khaelyn Steelwing, the dwarf gryphon master at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_default", text = "Need a bird out of this blighted country? I don't blame you, and the gryphons don't either." },
    { id = "g_horde", when = { faction = "Horde" }, text = "My birds won't take you, friend, but Georgia's bats will. She's just over there, and she doesn't bite, though her bats might." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Good, I'd begun to think the whole of Ironforge had forgotten there's a north. Sit a moment before you fly, and tell me the forge is still burning." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "For weeks, and they'll drop you a little too fast over Chillwind to prove it. The Wildhammer say a gryphon remembers every kindness and every slight, and after a year at Light's Hope I'm inclined to agree." } },
      choices = {
        { text = "I'll treat the bird as a comrade, not a beast of burden.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A gryphon's a mount. If it sulks, let it sulk.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Khaelyn.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They tolerate each other, which in the Plaguelands is practically friendship. The real trouble is Georgia's roost, because my gryphons think her bats are snacks, and her bats think the same of my gryphons." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} well clear of the bat roost, {class}. Georgia's bats scream when anything with teeth comes near, and then my birds start, and nobody in the chapel sleeps." },
      },
      choices = {
        { text = "Then I'll keep my beast clear of both, and keep the peace.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them squabble. Beasts sort out their own pecking order.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Khaelyn.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Same as I bear the smell o' the Plaguewood, by keepin' my eyes on my birds an' my mind on my work. The Dawn says anyone who fights the Scourge has a place here, an' I'm a dwarf o' my word, though I'll admit I count the bats now an' then." } },
      choices = {
        { text = "The Dawn is right. A common enemy makes common cause.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Forsaken are still undead. Trust should have limits.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Aye, they settle the moment they touch down, an' they won't settle anywhere else between here an' Chillwind. The knights say the defenders who died here made the ground holy with their last stand, an' I'll not argue with a gryphon's judgement or a knight's." } },
      choices = {
        { text = "That's the Light's own mark on this place.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Birds settle where it's safe. Holiness has little to do with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Badly, and they let me know it with every flight. I wash their feathers every evening and they still come back smelling of the Plaguewood, poor things." } },
      choices = {
        { text = "They deserve better. Spare them the worst routes.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They're war beasts. They fly where they're sent.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Once, a fellow who brought his felhunter up on the saddle, and the bird dumped them both in the Thondroril River. He walked back covered in mud and swearing, and I gave him a towel and a lecture, and he's flown with me twice since without a word of trouble." } },
      choices = {
        { text = "Fair rules, Khaelyn. The bird's comfort comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My felhunter rides with me. The bird can adjust.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Khaelyn.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A night elf druid! If you're flying out over the plaguelands, mind you don't take a deep breath, because the birds won't, and they're smarter than most soldiers." },
        { id = "h_default", key = true,
          text = "Khaelyn Steelwing, gryphon master for the Alliance at Light's Hope. The air over these plaguelands is foul and the birds hate every mile of it, but they'll get you to Chillwind or anywhere else you need to be." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage who still wants a gryphon, {class}! Good, because a portal can't get you anywhere near Light's Hope, and my birds can." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Sneaking up on a gryphon master, {class}? The birds saw you a mile off, they just didn't think you worth a squawk." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, is it? Then ye'll know why my birds land here and nowhere else in these lands, because the ground at Light's Hope is holy, an' even a gryphon can feel it under its claws." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin, flyin' in an' out o' Light's Hope like the knights o' old! The birds like ye lot, I'll say that, because ye never panic in the saddle." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Mind the bird's wings when you mount, {class}, for you'd be amazed how many soldiers catch a pinion with their shield and then wonder why the gryphon won't speak to them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! The birds always perk up when one of yours comes into the yard, {class}, because hunters smell of fresh meat and open country." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. The birds will take you, {class}, but keep whatever's in your pocket off their backs, or you'll be walking to Chillwind." },
      },
      again = {
        { id = "h_again", text = "Anything more? The gryphons fidget every time the wind blows in from the Plaguewood." },
        { id = "h_again2", text = "Ask, then, but don't keep a gryphon waiting in this air." },
      },
      choices = {
        { text = "How do the gryphons bear the foul air?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly from here?", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "How do the gryphons manage the plague?", next = "air" },
        { text = "A Forsaken bat handler right beside you?", next = "georgia" },
        { text = "Do the gryphons mind flying over the plague?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you keep an eye on Georgia's bats, Khaelyn?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can gryphons really feel the chapel's holy ground, Khaelyn?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How do you bear sharing a yard with a Forsaken, Khaelyn?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Do gryphons hold grudges against careless riders?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do gryphons and hunters' beasts get along up here?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have you had trouble with warlocks before, Khaelyn?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every hour I'm awake, and she watches my birds the same way, so I'd say we're even. The Dawn says we share the yard, and we do, but nobody ever said I had to stop counting her bats." } },
      choices = {
        { text = "Watching her is just good sense.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Counting her bats behind her back isn't fair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They hate it, and they tell me so every flight by refusing their feed afterward. I scrub their feathers in clean water from Chillwind, and I'd rather do it by hand than trust a stray spell anywhere near them." } },
      choices = {
        { text = "Care for them first. They carry us through all this.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts are tools. Fly them until they drop.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    air = {
      lines = { { id = "a_default", text = "They fly high and fast and don't land anywhere but here or Chillwind. I wash their feathers after every trip, and I watch their eyes for any cloudiness, because a sick gryphon is a gryphon I'd have to put down." } },
      choices = {
        { text = "Has it happened before?", next = "air_sick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    air_sick = {
      lines = { { id = "as_default", text = "Not to any of mine, and I mean to keep it that way. The Argent Dawn's priests bless the roost when they've a moment, and I won't say no to any help that's offered." } },
      choices = {
        { text = "The Light watches over them, then.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hard work keeps them well, not blessings.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    georgia = {
      lines = { { id = "ge_default", text = "Aye, and I'll tell you what I told myself the first day: inside these walls, the only enemy is the Scourge. She keeps her bats well and she keeps to her side of the yard, and that's more than I can say for some Alliance folk I've known." },
        { id = "g_scourge", when = { race = "Scourge" }, text = "You'd know her kind better than I do, but she's been a fair neighbour. Inside these walls, the only enemy is the Scourge, and she hates them as much as I do, maybe more." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I went where the Alliance needed a gryphon master and nobody else wanted to go, and that's the end of the tale." } },
    advice = { { id = "tp_ad", text = "Don't drink from any stream in this country, however clear it looks." } },
    _none = { { id = "tp_none", text = "Can't help you there. Ask somebody who spends less time with birds." } },
  },
}

P:NPC {
  key = "georgia", id = TODO_NPC("Georgia"), name = "Georgia", title = "Bat Handler",
  bible = "bibles/easternplaguelands.md", role = "flightmaster", tier = "service",
  communities = { "light_hope" }, temper = { "dry" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Georgia handles the Forsaken bats at Light's Hope and speaks with a dry, chilly patience that hardly ever warms. She says the bats are the only things in this country that the plague can't touch.",
    third = "{name} met Georgia, the Forsaken bat handler at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_default", text = "The bats are fed and ready, if you're Horde. If you're not, the dwarf is over there." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "My bats won't carry you, living one, but Khaelyn's gryphons will. I'll still answer a question, if you've one worth asking." },
  },

  notice = {
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of our own, this far east, and still walking free. Good, because the Scourge would love to have you back, and I'd rather they didn't." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Fairly enough, which is more than I expected, though they keep a little farther from my roost than they need to. You'll be a puzzle to them, because you're dead like me and holy like them, and puzzles make knights nervous." } },
      choices = {
        { text = "Then I'll help them solve it, fighting at their side.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them stay nervous. It keeps them honest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They can and they do, but they fly lower and grumble louder. I'm told the apothecaries bred them for strength rather than comfort, so you'll arrive with your teeth rattling and your armour full of fur." } },
      choices = {
        { text = "I'll fly light, handler. Your bats, your rules.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My armour stays on. The bat can grumble all it likes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Georgia.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only once, and the cat lost, which surprised its owner a great deal more than it surprised me. Bats are cleverer than people think, and the plague can't touch them, which makes them the healthiest things in these lands." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "So that's {pet}. It's watching my bats the way a cat watches a larder, {class}, so keep a hand on it, or I'll be writing to the Undercity for a new bat." },
      },
      choices = {
        { text = "I'll keep my beast leashed near the roost.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A beast that can't roam freely isn't worth keeping.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Georgia.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Dark, quiet, and a handful of dried plague beetles at the end of a long flight. They're simple creatures, which I've come to envy, since nobody at Light's Hope expects a bat to explain whose side it's on." } },
      choices = {
        { text = "Simple loyalty is worth something, Georgia. Keep them well.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everyone picks a side. Your bats picked the Dark Lady.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Georgia.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Something sets them off, and it isn't the smell, because you lot smell better than most of my passengers. The handlers in the Undercity say bats can hear what's under the ground, and if that's true, I'd hate to know what they hear out here." } },
      choices = {
        { text = "They hear the land in pain. It needs healing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whatever they hear, it's not worth worrying about.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Georgia.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "One tauren tried to calm them with a song, which was kind of him, and they screamed until the chapel bell rang. I've nothing against your kind, but bats were never meant to be calm, and frankly neither was anything else in the Plaguelands." } },
      choices = {
        { text = "I'll leave your bats in peace, Georgia.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Everything can be calmed, given time. Even bats.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Georgia.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Georgia, bat handler for the Horde. My bats fly to the Undercity and wherever else the Dark Lady's people keep a roost, and they don't care how foul the air is." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock. The apothecaries and your trainers in the Undercity don't get on, {class}, but at least you've both stopped pretending the dead are sacred." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage. My bats loathe the smell of the arcane, {class}, so stand to windward and try to think about something dull." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue at a bat roost. If you're here to steal a bat, {class}, they'll scream until every knight in the chapel comes running, and I'll let them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. The bats don't care how much metal you wear, {class}, but they'll complain about it the whole way to the Undercity, and so will I." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. My bats can smell beasts on you, {class}, and they don't like it, so stand over there where the wind will take it away." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. If you're here to bless the bats, {class}, don't bother, because they hate holy water nearly as much as they hate the arcane." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. My bats can feel the spirits around you, {class}, and they'll twitter about it all the way to Tarren Mill, so try not to take it personally." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. Please don't turn into anything with wings near my roost, {class}, for the bats get territorial, and I'm not climbing up there again to separate you." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, one of ours, at Light's Hope. The Dawn's knights will stare at you the way they stare at my bats, as though they're not quite sure whether to bless you or burn you." },
      },
      again = {
        { id = "h_again", text = "What else? The bats don't like the daylight, and neither do I." },
        { id = "h_again2", text = "Go on. I've nowhere to be, which is one of death's few comforts." },
      },
      choices = {
        { text = "Where can I fly from here?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Why bats, of all creatures?", next = "bats" },
        { text = "How do you get along with the gryphon master?", next = "khaelyn" },
        { text = "Does living among the Argent Dawn bother you?", next = "dawn", when = { race = "Scourge" } },
        { text = "Do your bats mind a demon riding along?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Wouldn't a teleport home be faster than your bats?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Does the Dark Lady have her own agents out here?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can a bat really carry a warrior in full armour?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do your bats ever fight a hunter's beast?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do your bats like, Georgia?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the bats really sense the spirits, Georgia?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Have druids caused you trouble at the roost before, Georgia?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do the Dawn's knights treat the Forsaken fairly here, Georgia?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Dark Lady has agents everywhere, and the ones out here don't introduce themselves to bat handlers. If you're one, you'll know better than I do, and if you're not, I'd stop asking such questions before somebody wonders why." } },
      choices = {
        { text = "I'll keep my questions to myself, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Questions are my trade. I'll ask what I like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fair. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Faster to the Undercity, yes, and useless everywhere else, which is the whole of the Plaguelands. My bats go where the Dark Lady's people need them, and they don't complain, which is more than I can say for most mages." } },
      choices = {
        { text = "Fine. Speed isn't everything.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The faster way is always better. Your bats are outdated.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's leave it there.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They mind everything, but they mind demons least of all, for a demon smells less of death than the rest of us. Keep it quiet in the air and don't let it bite, and I've no objection." } },
      choices = {
        { text = "My demon behaves. I'll make sure of it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It bites when it likes. That's its nature.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bats = {
      lines = { { id = "b_default", text = "Because the plague doesn't take them, and they don't mind the dark or the stench. A wyvern would sicken over these lands, but my bats fly through it as if it were fresh spring air." } },
      choices = {
        { text = "Are they hard to handle?", next = "bats_handle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bats_handle = {
      lines = { { id = "bh_default", text = "Not if you're patient and never shout. They know my voice, and they know I've no warm blood to tempt them, so we understand each other perfectly." },
        { id = "bh_living", when = { race = { "Human", "Dwarf", "Gnome", "NightElf", "Orc", "Troll", "Tauren", "Skyborne" } }, text = "Not for me, since I've no warm blood to tempt them. For you, I'd suggest keeping your hands in your pockets when you walk past the roost." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    khaelyn = {
      lines = { { id = "k_default", text = "She doesn't like me, and she doesn't pretend to, but she doesn't spit either. We've an agreement that the Scourge outside the walls matters more than anything between us, and so far we've both kept it." } },
      choices = {
        { text = "That's a sensible agreement.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It won't last past the next war.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn = {
      lines = { { id = "d_default", text = "They watch me, and I don't blame them, since half of them buried someone who now looks like us. But they let me work, and Lord Tyrosus has said plainly that any enemy of the Scourge has a place here, so I'll take that place." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was someone in Lordaeron once, and now I keep bats. The bats don't ask about the first part, and I'd rather you didn't either." } },
    advice = { { id = "tp_ad", text = "Fly over this land when you can, because walking it only gives the Scourge more chances at you." } },
    _none = { { id = "tp_none", text = "I've nothing to say about that, living or dead." } },
  },
}

P:NPC {
  key = "jessica_chambers", id = TODO_NPC("Jessica Chambers"), name = "Jessica Chambers", title = "Innkeeper",
  bible = "bibles/easternplaguelands.md", role = "innkeeper", tier = "service",
  communities = { "light_hope", "argent_dawn" }, temper = { "warm" }, values = { "kind", "dutiful" },
  notices = { "weary" },

  impression = {
    first = "Jessica Chambers keeps the beds and the soup at Light's Hope Chapel, in the only safe room for miles. She speaks gently and plainly, and she has clearly fed a great many people who came in shaking.",
    third = "{name} met Jessica Chambers, who keeps the inn at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_default", text = "Come in and sit down, you look half frozen. The soup's hot, and nothing dead gets past these walls." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I always worry, you know, when people walk out that gate." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Light, look at you, your gear's in pieces. Sit, eat, and let someone who knows a hammer see to the rest before you go out again." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "A few of the younger knights flinch, but they'll learn, because this chapel's seen stranger things than you. The Revered Leonid sits right over there with his face falling off, and he's the gentlest soul in the place, so I tell them to mind their manners and eat their soup." } },
      choices = {
        { text = "They'll learn. I'll show them patience.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They needn't like me. I'm here to fight, not dine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Sleep, mostly, and somebody to listen while they tell me what they saw at Corin's Crossing or Tyr's Hand. I give them soup and a clean blanket, and I've found the ones who talk sleep better than the ones who don't." } },
      choices = {
        { text = "Talking helps. I'll share a story if you'll listen.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some things are better kept behind the helm, Jessica.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Jessica.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Dawn's wagons bring salt pork up from the south, but fresh meat's as rare as a dry morning here. A hunter who brings in a clean deer is the most popular person in the chapel for a week, and the soldiers cheer them all the way up the stairs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can lie by the hearth tonight, {class}, if it doesn't mind sharing with the inn cat. She's old and terrible and has never once lost a fight." },
      },
      choices = {
        { text = "I'll bring in what clean meat I can for the soldiers.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I hunt for myself. The Dawn's wagons can feed the soldiers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Jessica.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Stratholme, mostly, and the ones they left behind there, and sometimes Tirion Fordring, though they lower their voices when they say his name. They argue about whether the Silver Hand could ever be made whole again, and nobody ever wins the argument." } },
      choices = {
        { text = "It can be. The Silver Hand will rise again.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's gone. The Dawn is what we have now.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some nights I think I hear more confessions than the chaplain does, because a bowl of soup loosens a tongue faster than any prayer. They tell me what they've seen in Stratholme or Darrowshire, and I listen, and I don't know what else to do with it." } },
      choices = {
        { text = "Listening is holy work too. You do more than you know.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They need a priest, not a cook. Send them to the chapel.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Every day, though I try not to say it in front of the soldiers. I keep a pot of herbs on the sill out of stubbornness, and it's the only green thing at Light's Hope that hasn't died on me yet." } },
      choices = {
        { text = "Keep that pot growing. Small hopes matter here.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Hope won't stop the Scourge. Steel will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Some did, the first month, and I set them all at the same table and fed them the same stew until they stopped glaring. Light's Hope has no room for old quarrels, and frankly neither does my kitchen, so sit wherever there's a chair." } },
      choices = {
        { text = "A shared table is a good start. Thank you, Jessica.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Old quarrels don't die over stew, Jessica.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jessica.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, at my inn! You'll want a window that faces the hills, I expect, though I'll warn you the view hasn't been green in a long while." },
        { id = "h_default", key = true,
          text = "Jessica Chambers, and this is the inn at Light's Hope, such as it is. I keep the beds clean and the pot full for the Argent Dawn and anyone else who comes in from the plaguelands, and I don't ask anyone's colours." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Late to be on the road out here, friend, and later still to be alone. There's a bed if you want it, and the guards walk the walls all night." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Keep that little creature off the beds, {class}, for I've washed those sheets twice today, and once more would finish me." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, good, {class}, for the well's been tasting of the plaguelands again, and I'd rather not boil it a third time." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Sit with your back to the wall if you like, {class}, everybody does here. I've seen too many soldiers come in shaking to mind a rogue who checks the door." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, and you'll be wanting a quiet corner, I expect, because the soldiers come in at all hours and some of them need more than soup." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, at Light's Hope. The knights who come through here eat like they've not seen bread in a month, and most of them haven't, so sit down and I'll fetch a bowl." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "Take that helm off before you sit, {class}, please, for the soldiers get hot in here, and a warrior after a week in the Plaguelands is something I'll never get used to." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, good, for you might bring in something fit for the pot, {class}, as long as it's from somewhere the plague hasn't reached." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, welcome in. The beds are the same for everyone, {class}, and the stew's the same too, though I'll warn you it's mostly turnip this week." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Come in and sit, love, Light and all. I've fed the Dawn's knights and Forsaken scouts at the same table, and you're the first who's been a bit of both." },
      },
      again = {
        { id = "h_again", text = "Anything else I can get you? There's more bread." },
        { id = "h_again2", text = "Stay as long as you like; there's nowhere warmer for miles." },
      },
      choices = {
        { text = "Do you ever miss green hills, Jessica?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd like to rest here.", next = "BUSINESS" },
        { text = "How is this place still safe?", next = "safe" },
        { text = "Who comes through here?", next = "guests" },
        { text = "Where do you find food in this country?", next = "food" },
        { text = "Does a warlock make the soldiers nervous here?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I could conjure water for the inn, Jessica.", next = "xmage", when = { class = "MAGE" } },
        { text = "Does anyone ever steal from the inn?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the soldiers come to you with more than hunger, Jessica?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do the Dawn's knights talk about over supper?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the soldiers need most when they come in?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Where does the inn's meat come from, Jessica?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do the soldiers mind a Horde guest at the inn, Jessica?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does anyone at Light's Hope mind a Forsaken paladin at table?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a soldier took a loaf and I let him, for he'd come back from Corin's Crossing with no company left. Nobody steals here, not really, they only take what they need, and I try to have enough." } },
      choices = {
        { text = "Mercy before rules. You did right.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let one take, and they all take. Be careful.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Jessica.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's kind, and I'll take whatever you leave, but don't make a habit of it, or the soldiers will never drink from the well again. The Dawn scrubs that water three times, and it's honest water, even if it tastes of iron." } },
      choices = {
        { text = "Then I'll leave a little. It's the least I can do.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Conjured water's mine. They can boil theirs.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Everything makes them nervous, for they've seen what the dead can do, and the dead don't need demons to be frightening. Eat your soup and be civil, and they'll warm to you, slower than they'd like to admit." } },
      choices = {
        { text = "I'll be civil. They've earned some peace.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They'll get used to me, or they won't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "The Dawn guards it day and night, and the chapel is holy ground besides. The Scourge prowls all around us, but it doesn't come close, and I've stopped asking why and started being grateful." } },
      choices = {
        { text = "The Light protects this place.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Good walls and sharp swords protect it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guests = {
      lines = { { id = "gu_default", text = "Dawn soldiers coming off patrol, mostly, and adventurers on their way to Stratholme or back from it. Some of them are Horde and some of them are dead, and I've learned to pour the soup the same for all of them." } },
      choices = {
        { text = "What do they say about Stratholme?", next = "guests_strat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guests_strat = {
      lines = { { id = "gs_default", text = "Not much, at first. They sit in that corner and stare at the fire, and after a bowl or two they tell me the city's still burning inside, and the dead still walk the streets as if they lived there." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    food = {
      lines = { { id = "f_default", text = "Nothing grows clean here, so it all comes in by wagon or by gryphon from Chillwind and further. I won't cook anything that walked or grew in these lands, and neither should you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I came to cook for the Dawn because somebody had to. That's all anyone needs to know about me, really." } },
    advice = { { id = "tp_ad", text = "Eat before you go out, and sleep when you can. The Scourge never gets tired, so you'll have to be cleverer than it is." } },
    argent_dawn = { { id = "tp_dawn", text = "They're good people, every one of them, and they eat like they haven't seen food in a week, which some of them haven't." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that, dear. Ask one of the Dawn's officers." } },
  },
}

P:NPC {
  key = "jase_farlane", id = TODO_NPC("Jase Farlane"), name = "Jase Farlane", title = "Trade Supplies",
  bible = "bibles/easternplaguelands.md", role = "vendor", tier = "service",
  communities = { "light_hope", "argent_dawn" }, temper = { "brisk" }, values = { "careful", "dutiful" },
  notices = { "craft" },

  impression = {
    first = "Jase Farlane sells trade supplies at Light's Hope Chapel and knows exactly how far every spool of thread had to travel to get there. He's brisk and practical, and he takes the Dawn's cause seriously.",
    third = "{name} met Jase Farlane, who sells trade supplies at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_default", text = "Thread, flux, vials and cloth, all hauled in from Chillwind past the Scourge. Take what you need, and don't waste it." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Blacksmithing", "Alchemy", "Leatherworking", "Engineering", "Enchanting" } },
      text = "You've a crafter's hands, I can tell from the way you look at my shelves. Good, because the Dawn needs folk who can make things as much as folk who can break them." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Coin's coin, and the Dawn needs every copper to keep its knights in thread and bandages. I'll admit I counted yours twice, but that's habit, not prejudice, and I'd do the same to a dwarf." } },
      choices = {
        { text = "Count it all you like. Honest coin is honest coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Count it again and I'll take my coin elsewhere.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than anywhere in the kingdom, because every strap and rivet comes up from the south in a wagon the Scourge would dearly love to stop. A soldier who keeps his kit mended saves the Dawn a funeral, so I sell as cheaply as I can, which isn't very cheaply." } },
      choices = {
        { text = "Then the price is fair. The drivers earn every copper.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Profiteering's still profiteering, Farlane, however hard the road.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jase.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not as much as I'd like, since the beasts round here are mostly plague and teeth. The best pelts come from the high ground north of the chapel, where the wind's cleaner, but the hunters who go up there don't always come back down." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is welcome in the shop, {class}, so long as it keeps its teeth off the bolts of cloth. I lost a good roll of wool to a hungry wolf last month." },
      },
      choices = {
        { text = "I'll bring what clean hides I find, and trade them fairly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Scarce hides mean high prices. I'll sell to whoever pays most.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jase.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "On wagons up from Chillwind and down from Tarren Mill both, and the drivers don't speak to each other, but they unload at the same gate. It's the oddest arrangement I've ever kept the books for, and it works better than anything I saw in Stormwind." } },
      choices = {
        { text = "Then the Dawn's doing something right. Keep it going.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It works until one side gets greedy, Jase.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jase.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd sell to anyone with coin and the Dawn's good word, because thread and dye don't care who buys them. What I won't do is ask questions about what it's for, since the last time I asked, I got an answer, and I didn't sleep well for a week." } },
      choices = {
        { text = "Sensible of you, Jase. I'll pay honestly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Best not to ask. Ignorance keeps you safe.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jase.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A few things, plaguebloom mostly, which the alchemists want and nobody else does. The Dawn's healers plant a little garden behind the chapel, and it grows, slowly, which I take as a sign the Light's ground is still good, if nothing else is." } },
      choices = {
        { text = "Then there's hope for the land yet. Tend it well.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A garden behind a chapel won't save a kingdom.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Jase.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jase Farlane, trade supplies for Light's Hope. Everything a crafter needs to mend a soldier's kit or brew a potion, and every bit of it came a long and dangerous way, so the prices aren't Stormwind's." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, {class}? Then you'll know the price of good reagents in hard times, and you'll go gently with me about mine." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Every spool on these shelves came a long and ugly way, {class}, so if one goes missing I'll know, and so will the Dawn." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Your kit's been knocked about, {class}, and I've the leather and the thread to set it right, though the price came up the same long road the thread did." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Bring me clean hides and I'll find a crafter who needs them, {class}, though clean hides in the Eastweald are scarcer than honest goblins." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Trade goods are trade goods, {class}, and the Dawn doesn't ask which crown you serve, so look all you like." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I don't stock soul shards, {class}, and I'll ask you not to try selling me any, because I've no idea what to charge for them." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I've herbs that came all the way from Ashenvale and Mulgore, {class}, and they're worth their weight in gold out here, where nothing green survives." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken, buying supplies at Light's Hope. Everything here came a long and dangerous way, and so did you, by the look of it." },
      },
      again = {
        { id = "h_again", text = "Anything else? There's a wagon to unload." },
        { id = "h_again2", text = "Go on and ask, though I'll be tallying spools of thread the whole time." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "How do the supplies get here?", next = "wagons" },
        { text = "What does the Dawn need most?", next = "needs" },
        { text = "Couldn't a mage's portal shorten your supply roads?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does anything go missing on the road to Light's Hope?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What does a warrior's kit cost out here, Jase?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters trade much at Light's Hope?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "How do your supplies reach Light's Hope, Jase?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you sell to a warlock at all, Jase?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does anything still grow out here, Jase?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do the Dawn's merchants trust Forsaken coin, Jase?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than I'd like, for the Scourge don't steal, but the Scarlet patrols out of Tyr's Hand do, and they call it requisition. I'd give a good deal to know which of their officers is wearing my thread on his tabard." } },
      choices = {
        { text = "Taking it back from them is only justice.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Dawn can't afford a feud with the Crusade.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "If anyone could open a portal from Stormwind or Orgrimmar to this chapel, I'd kiss them on both cheeks, but no mage I've asked knows how. So the wagons come the long way, across the Thondroril from Chillwind, and I price accordingly." } },
      choices = {
        { text = "Hard roads are honest work. Don't wish them away.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Any shortcut is worth taking, honest or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    wagons = {
      lines = { { id = "w_default", text = "Overland from Chillwind Camp, past Corin's Crossing and the burned farms, with Dawn guards riding beside every wagon. We lose one now and then, and when we do, the price of thread goes up and nobody complains." } },
      choices = {
        { text = "Who attacks them?", next = "wagons_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagons_who = {
      lines = { { id = "ww_default", text = "The Scourge, mostly, though the Scarlet Crusade have stopped a wagon or two and called it confiscation. I'm not sure which is worse, the ones who kill you or the ones who pray over you first." } },
      choices = {
        { text = "The Scarlets are no better than the Scourge.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "The Scarlets mean well, even if they're wrong.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    needs = {
      lines = { { id = "n_default", text = "Runecloth for bandages, more than anything, because every patrol comes back bleeding. After that, anyone who can brew a decent potion or mend a breastplate is worth their weight in gold to the Dawn." },
        { id = "n_priest", when = { class = { "PRIEST", "PALADIN" } }, text = "Bandages, mostly, because there are never enough healers to go round, and you'd know that better than I would. Runecloth, brought to the Dawn, does as much good as a prayer some days." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep the supplies straight so the soldiers don't have to think about them, and that suits me fine." } },
    advice = { { id = "tp_ad", text = "Buy your vials here rather than carrying glass across the plaguelands, because I've seen too many packs full of broken ones." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They've taken our wagons twice and told us the Light wanted them to. I don't believe the Light wanted my thread." } },
    _none = { { id = "tp_none", text = "Not my department, I'm afraid. I keep the shelves, and that's all." } },
  },
}
