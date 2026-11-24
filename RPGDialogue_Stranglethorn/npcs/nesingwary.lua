-- Nesingwary's Expedition: Hemet Nesingwary's hunting camp in northern Stranglethorn. Voice: bibles/stranglethorn.md
-- Classic has the father, Hemet Nesingwary (his son took over the camp only when he left for Outland).
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "nesingwary", id = TODO_NPC("Hemet Nesingwary"), name = "Hemet Nesingwary",
  rivals = { "kebok" },
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "major",
  communities = { "nesingwary_camp" }, temper = { "gruff" }, values = { "brave", "proud" },
  race = "Dwarf", likesTone = "blunt",
  notices = { "class", "pet", "kit" },

  impression = {
    first = "Hunting is the whole of the man.",
    third = "{name} found Hemet Nesingwary at his camp in Stranglethorn, where the famous hunter is after raptors, panthers, tigers and the great cat himself.",
  },

  greetings = {
    { id = "g_camp", text = "Quiet, now, you'll scare the game. Sit, if you must, and then make yourself useful." },
    { id = "g_back", when = { metBefore = true }, text = "You came back with all your limbs, good. The jungle doesn't give many second chances." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, eh? That doesn't matter, for a good shot's a good shot, whatever colors it's wearing." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the game's been jumpy the whole while. Sit quiet, now, and tell me what you bagged out there." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've become a far better hunter since we last spoke, I can see it in how you hold your weapon. You'll make the list yet." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The camp's been saying you've done right by us. That's a trophy of sorts, and one I'd hang on the wall." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and a proper one, by the look of your kit! Then you'll understand what this place is: the finest hunting ground in the world." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} is a fine animal, but keep it close here, for every beast in this jungle would love to make a meal of your friend." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something had a go at you, raptors by the look of it. They hunt in packs, so learn that, if you learn nothing else." },
    { id = "n_druid_cat", cat = "class", when = { class = "DRUID", form = { "cat" } },
      text = "Easy there. I've a rifle and a lifetime of habit, and you look rather a lot like what I came here to hunt." },
  },

  start = "hello",
  nodes = {
    op_alliance = {
      lines = {
        { id = "opa_default", text = "Ah, I'm too old and too fond of my rifle to lend it out. And folk say the Alliance is coming apart, with Gilneas behind its wall and Stromgarde sulking in the hills. What d'ye make of it?" },
      },
      choices = {
        { text = "The Alliance held once, and it'll hold again.", next = "op_all_trust", fx = { affinity = 1, align = { order = 1 }, opinion = { alliance = "trust" } } },
        { text = "Every kingdom for itself now. The Alliance is just a name.", next = "op_all_broken", fx = { align = { order = -1 }, trait = { skeptical = 1 }, opinion = { alliance = "broken" } } },
        { text = "Ironforge kept faith. The rest can answer for themselves.", next = "op_all_mixed", fx = { affinity = 1, opinion = { alliance = "mixed", dwarves = "admire" } }, when = { race = "Dwarf" } },
        { text = "Your Alliance put my people in camps, hunter.", next = "op_all_hate", fx = { opinion = { alliance = "hate" } }, when = { race = "Orc" } },
        { text = "I'd rather hear about the panthers.", next = "BACK" },
      },
    },
    op_all_trust = {
      lines = {
        { id = "opat_default", text = "Aye, I'll drink to that, and I'll drink to it twice if it's true. It took the orcs to make us friends the first time; I hope it doesn't take something worse the second." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_all_broken = {
      lines = {
        { id = "opab_default", text = "You're a harder sort than I took you for, and maybe you're right. Still, a name's worth something, the way a trophy is, because it reminds you of what you once did." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_all_mixed = {
      lines = {
        { id = "opam_default", text = "Ironforge did, and I've an Ironforge barrel on my rifle to prove it. I'll not argue with a dwarf about dwarves; Barnil's taught me better." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_all_hate = {
      lines = {
        { id = "opah_default", text = "Aye, it did, and I'll not pretend I lost sleep over it then. I'm older now, and I've seen what a cage does to a beast, so I'll say only that you've a right to your anger." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_nesingwary = {
      big = true,
      lines = { { id = "xpt_nesingwary_default", text = "It depends on the quarry, my friend. A panther is best hunted alone, one hunter against one beast, but a raptor pack would eat a lone hunter for breakfast, and there's no shame in bringing friends to that sort of party." } },
      choices = {
        { text = "A fair hunt is one hunter against one beast.", next = "BACK", reply = "Aye, and that's the purest hunt there is, though I'd not face a raptor pack with that creed. You'd make a fine panther hunter, friend.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A clean kill matters, not how many hands it took.", next = "BACK", reply = "Practical, and not wrong, though the book wants a better story than that. Clean is the first rule, mind, so we agree on what matters.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think about them every time I write a trophy into the book. A hunter honors his quarry by taking it clean, and if the spirits mind, they've never said so to me." } },
      choices = {
        { text = "A hunt with rules honors the beast. I'll hunt as you do.", next = "BACK", reply = "Then you're welcome at my fire, shaman, and I'll show you how to read the trails. Clean and fair, and the spirits can come and check my work.", fx = { align = { order = 1 } } },
        { text = "Beasts aren't trophies, Hemet. The spirits want them free.", next = "BACK", reply = "Free to eat the next traveller, aye, and the spirits can explain that to his widow. I'll not quarrel with you, but I'll not stop either.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd hunt with anyone who walks quiet and shoots fair, and I've no quarrel with the dead so long as they don't scare the cats. The Light's a strange companion on a hunt, but I'll take a steady hand over a pretty face any day." } },
      choices = {
        { text = "Face the quarry fair. That's a paladin's way too.", next = "BACK", reply = "It is, and I'm glad to hear it from one of your kind. Walk quiet and face the cat, and you'll be welcome on any hunt of mine.", fx = { align = { honor = 1 } } },
        { text = "A clean kill is a kill. Fair doesn't come into it.", next = "BACK", reply = "Fair comes into everything out here, friend, or you're just a butcher with a gun. I'll take the clean kill, but I want it fair as well.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, when the beast turns, which a great cat sometimes does, and then you want someone who'll stand and take the charge while the rest of us reload. I lost a bearer to a panther once because nobody would hold the line, so I'll not mock a stout shield." } },
      choices = {
        { text = "I'd hold the line so the hunters can take their shot.", next = "BACK", reply = "That's the warrior I want when the cat turns, and I'll buy you a drink for it. Stand fast, and the rifles will do the rest.", fx = { align = { order = 1 } } },
        { text = "I'd charge the beast first and finish it myself.", next = "BACK", reply = "Ha! Brave, and maybe a little bit daft, but I've seen worse. Just don't spoil the hide, or Barnil will have words.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "It's use, aye, but it's no sport. I watched a mage freeze a tiger once and then stroll up to it like it was a statue, and there's no glory in that, only a cold cat and a smug mage." } },
      choices = {
        { text = "A fair fight's the only fight worth having.", next = "BACK", reply = "Spoken like a true hunter, and I'm proud to hear it. The tiger deserves its chance, and so do you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A dead tiger's a dead tiger. Glory doesn't skin it.", next = "BACK", reply = "No, but it makes a poor story in the book, and the book's what lasts. Skin it if you like, I'll not be writing it down.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every beast I've taken was a fair fight, and I've a chewed ear to prove it, so if their spirits want a word, they know where to find me. I reckon a tiger respects a hunter more than a farmer, and I'll settle for that." } },
      choices = {
        { text = "A fair fight honors the beast. I can respect that.", next = "BACK", reply = "Good, then we understand each other. A chewed ear's the price of respect, and I paid it gladly.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Trophies are trophies. Spirits don't enter into it.", next = "BACK", reply = "You sound like a Venture man, and that's not a compliment in this camp. The trophy's only worth something if the fight was.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "It troubles a great many people, and yet the panthers remain. I take the strong ones and leave the young, and I write down everything I see. Respect, my friend, can come with a rifle." } },
      choices = {
        { text = "Take only what you need. That is the balance.", next = "BACK", reply = "Exactly so, and I've lived by that rule for forty years. The panthers are still here, and so am I, and that's balance enough for me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Trophy or meat, a dead cat's a dead cat.", next = "BACK", reply = "Many have said it, and some meant it, and I'll not argue with an honest heart. But I've never wasted a beast, and that's more than the trolls can say.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A fine one, if they learned to love the hunt as much as the kill. Most rogues I've met are in too much of a hurry, and the great cats of Stranglethorn will make a meal of anyone who rushes them." } },
      choices = {
        { text = "Then I'll learn patience from the master.", next = "BACK", reply = "Ha! That's the spirit, friend, and you'll learn faster than most. Patience first, and the kill will follow when it's ready.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A kill is a kill. The love of it doesn't matter.", next = "BACK", reply = "Then you'll be a fine rogue and a poor hunter, and I'll leave you to it. Just don't rush a panther, for it's the last mistake most folk make.", fx = { align = { honor = -1 } } },
        { text = "Something else, Nesingwary.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Never, though I'll admit I've been tempted since King Bangalash, the great white tiger, slipped away from me at dusk. A hunt is a contest between the hunter and the beast, and magic would spoil it, so I'll keep my rifle and my patience." } },
      choices = {
        { text = "You're right. A fair hunt is the only hunt.", next = "BACK", reply = "Good, I'll write you down as one of the decent ones. Bangalash will get his day, and it'll be a fair one.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Use every advantage. The beast would.", next = "BACK", reply = "The beast would, aye, but the beast isn't writing a book. I'll take the long way, and be proud of the trophy at the end.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Cruelty, no, for I take my game clean and quick, though there's those in Stormwind who'd call it sport and turn up their noses. A hunt's a kind of respect, I'd say, between the hunter and the hunted, and the great cat understands that better than most men." } },
      choices = {
        { text = "Killing for a trophy isn't respect. Hunt only what you need.", next = "BACK", reply = "You've a good heart, priest, and I'll not laugh at it. But a hunter's trophy is a way of remembering, and I remember every one.", fx = { align = { light = 1 } } },
        { text = "The jungle's a hunt. The strong take what they will.", next = "BACK", reply = "Strong words, and the jungle would agree with you. But the strong take clean, or they're just the jungle with a gun.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "There is, and more than you'd think, for a good hunter faces his quarry fair and takes it clean. The great cat deserves a proper ending, and when I find him, I mean to look him in the eye before the shot." } },
      choices = {
        { text = "Face the quarry fair. Anything else is butchery.", next = "BACK", reply = "Aye, you understand it, paladin, and that's rarer than you'd think. Fair and clean, and the great cat gets its proper end.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A trap's as good as a shot. The cat won't know.", next = "BACK", reply = "The cat won't, but I will, and so will the book. A trap's for meat, friend, not for a trophy.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_nesingwary", tags = { "news" }, when = { party = { class = "HUNTER" } },
          text = "Ah, a fellow hunter in your company! {companion} has a good eye, I can tell from the way they look at my trophies, so you must bring them along on a proper safari." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "I hear you've been doing business with that Kebok fellow in Booty Bay. Mind his tiger fangs, because I've seen the tusks they're carved from, and no tiger ever wore them." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "Kebok has been running my name down at the bar, I'm told, and yours along with it. A man who sells false trophies should be careful whom he calls a cheat." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Well now, a priest, and a quiet one I hope, for the game in this jungle hears a footfall from a hundred paces and a hymn from twice that." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" }, text = "A paladin! Now there's a fine sight in this camp, for I've hunted with warriors and rangers, but I've never had one of the Silver Hand stalk a tiger with me." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman, eh? Your folk talk to the spirits of beasts, I hear, so you can tell the great cat I'm coming for him." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde in my camp. Pray all you like, so long as you do it quiet, for the game hears everything." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. I'll hunt beside near anybody, but not beside a demon, so keep your little beastie well away from my trophies." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid! Splendid. You'll appreciate the beasts here better than any man in my camp, though I daresay we appreciate them rather differently." },
        { id = "h_default", key = true,
          text = "Hemet Nesingwary. I came to Stranglethorn for the hunting, and I'm staying for the hunting: raptors, panthers, tigers, and the great cat himself. There's nothing else worth the trip." },
        { id = "h_welcome", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Welcome to the Jungle") }, { questActive = TODO_QUEST("Hunting in Stranglethorn") }, { questActive = TODO_QUEST("Hemet Nesingwary") } } },
          text = "Somebody sent you to me? Good. I've more beasts than hunters, and I like it that way, but even I can't shoot them all." },
        { id = "h_raptors", when = { questActive = TODO_QUEST("Raptor Mastery") },
          text = "Raptors are fast and clever, and they never come alone. Thin them out, and you'll start to think like one, which is the point." },
        { id = "h_bangalash", when = { questActive = TODO_QUEST("Big Game Hunter") },
          text = "King Bangalash, the great cat of the jungle. I've seen him once, at dusk, and I've thought of nothing else since, so bring me his head." },
        { id = "h_dusk", when = { timeOfDay = "night" },
          text = "Listen, do you hear that? Something big, west of camp, moving slow. We'll go after it tomorrow; tonight we drink." },
        { id = "h_cat", when = { form = "cat" },
          text = "Don't move, don't... ah, it's only a druid! You nearly had a bullet for your trouble, so turn back into yourself before Ajeck, my best shot, sees you." },
        { id = "h_king_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Big Game Hunter"), days = 3 } },
          text = "The King's head, on my wall. I've wanted that for years, and now I've got it I keep looking west anyway. There's always something bigger." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Quiet, quiet! Ah, a rogue, which is the next best thing to a hunter, since you know how to move without scaring the game." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Now, I don't suppose you could freeze a panther in its tracks long enough for a proper shot? It'd make a dull story, but a very fine trophy." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, eh? You'll scare the game clean out of the valley with all that clanking, so stand still a moment and let the cats come back." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin! And one of the Forsaken, by my eyes, which I'll admit I didn't expect to see stalking through my camp. Keep downwind of the game, if you'd be so kind." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I've hunted with a great many dwarves, but never one who talks to the beasts' spirits, so you can tell the great cat I'm coming for him." },
      },
      again = {
        { id = "h_again", text = "Aye? Out with it, then, for the light's going." },
        { id = "h_again2", text = "Something else? Quick, then, for I'm cleaning the rifle." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Pour yourself one and ask away. Barnil won't mind, though Barnil always minds." },
      },
      choices = {
        { text = "Do you ever think about the spirits of what you hunt?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Is magic any use on a hunt, Nesingwary?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "You hunt these creatures for sport. That troubles me.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Why hunt at all?", next = "why" },
        { text = "What's the most dangerous thing out there?", next = "danger" },
        { text = "Barnil says you were a war hero.", next = "hero", when = { heardLine = "barnil.h_default" } },
        { text = "Who else hunts with you here?", next = "students" },
        { text = "What's the finest shot you ever took?", next = "shot", when = { class = "HUNTER" } },
        { text = "That's a fine rifle. Ironforge make, by the look of it.", next = "rifle", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Is there no cruelty in hunting for sport, Nesingwary?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is there honor in the hunt, Nesingwary?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Is there any use for a warrior on a hunt, Nesingwary?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Is hunting together better sport than hunting alone, Hemet?", next = "xpt_nesingwary", when = { party = { class = "HUNTER" } } },
        { text = "I'll hunt for you.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Some of those cats you hunt are my kin, Nesingwary.", next = "k_druid", when = { class = "DRUID" } },
        { text = "My people hunted this jungle before yours had rifles.", next = "k_troll", when = { race = "Troll" } },
        { text = "There aren't many human hunters, they tell me.", next = "k_human", when = { race = "Human", class = "HUNTER" } },
        { text = "A rogue could make a good hunter, I'd think, Nesingwary.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would you really use magic in a hunt, Nesingwary?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you hunt alongside a Forsaken paladin, Nesingwary?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Do you ever think about the spirits of what you hunt?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Would you ever tame a cat like that, instead of shooting it?", next = "hn_tame", when = { class = "HUNTER" } },
        { text = "Hunters back home talk of the Beaststalker mail. Ever seen it?", next = "hn_end", when = { class = "HUNTER", minLevel = 45 } },
        { text = "Another dwarf with a rifle, so far from the mountain.", next = "hn_dwarf", when = { race = "Dwarf" } },
        { text = "Good hunting.", next = "END" },
      },
    },
    hn_tame = {
      big = true,
      lines = {
        { id = "hnt_default", text = "I've thought about it, on long nights, and I'll tell you honestly I haven't the patience. A tamed cat is a friend for life, and I've seen hunters walk out of this camp with a tiger at their heel that I'd been tracking for a month, and I was glad for them and sorry for me." },
        { id = "hnt_pet", when = { pet = { type = "Beast" } }, text = "Like your {pet}, you mean? I've thought about it on long nights, and I haven't the patience, for a tamed beast is a friend for life and I've only ever known how to be its enemy. You've chosen the harder road, and I'll not pretend otherwise." },
      },
      choices = {
        { text = "A beast at your side beats one on your wall.", next = "BACK", reply = "It does, I'll grant you, and I'd say so in the book if Barnil let me. But the wall doesn't need feeding.", fx = { align = { light = 1 } } },
        { text = "A trophy is honest. A tamed beast never chose you.", next = "BACK", reply = "Ha! Now there's a hunter after my own heart, though I'd not say that in front of Ajeck.", fx = { align = { light = -1 } } },
        { text = "Something else, Hemet.", next = "BACK" },
      },
    },
    hn_end = {
      lines = { { id = "hne_default", text = "Seen it, aye, on a hunter who came through on his way to the Blackrock spire, and he'd pulled the pieces off things in Scholomance and Stratholme that I'll not describe at supper. Fine mail, and he moved in it like it was leather, but I'll keep my old coat and my rifle." } },
      choices = {
        { text = "I mean to wear the whole set one day.", next = "BACK", reply = "Then come back in it and let Barnil sketch you for the book, for he's run out of tigers to draw.", fx = { trait = { brave = 1 } } },
        { text = "A good coat and a true rifle are enough.", next = "BACK", reply = "Spoken like a hunter, and I'll pour you one for it.", fx = { affinity = 1 } },
      },
    },
    hn_dwarf = {
      lines = { { id = "hnd_default", text = "Far, and getting farther every year. I left the mountain after the war because the beasts under Ironforge had all been named and shot by somebody's grandfather, and here every cat is a new one. Do you miss the snow?" } },
      choices = {
        { text = "Every day, in this heat.", next = "BACK", reply = "So do I, every afternoon, and then a tiger walks past at dusk and I forget the snow entirely.", fx = { affinity = 1 } },
        { text = "Not once. The jungle suits me.", next = "BACK", reply = "Then you're a better dwarf than I am, or a worse one, and I can't decide which.", fx = { trait = { witty = 1 } } },
      },
    },

    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because a man finds out what he is when something bigger than him is looking back. Most never find out, but in the jungle everybody does, and usually quick." },
      },
      choices = {
        { text = "And what are you?", next = "what" },
        { text = "Seems a lot of killing just to find that out.", next = "why_killing", fx = { align = { light = 1 } } },
        { text = "I'll find out, then.", next = "BACK", reply = "Good, and I hope you like what's looking back. Most do, in the end, once they've had a fright or two.", fx = { align = { light = -1 }, affinity = 2, trait = { brave = 1 } } },
      },
    },
    what = {
      lines = {
        { id = "wt_default", text = "Still here. That's the answer every morning, and it's a good one, so write it down, the way Barnil does." },
      },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    why_killing = {
      lines = {
        { id = "wk_default", text = "Aye, it is. But I eat what I shoot, and I never take a beast that didn't have a fair chance at me. The trolls and the Venture boys can't say that." },
      },
      choices = {
        { text = "Fair chance. I can respect that.", next = "BACK", reply = "Aye, and I respect you for saying so. Fair chance is the whole of my creed, and few enough live by it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fair or not, a kill's a kill.", next = "BACK", reply = "Then you'll never write a book worth reading, friend. The kill's the end, but the fair chance is the story.", fx = { align = { honor = -1 } } },
        { text = "A fair chance, against a rifle? I doubt that.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },

    danger = {
      lines = {
        { id = "d_default", text = "It's not the King, and it's not the tigers, either. It's the raptors, because there's always one more than you counted, and the trolls, because they count too." },
      },
      choices = {
        { text = "And the King? Who is he?", next = "danger_king" },
        { text = "You haven't mentioned the Venture Company.", next = "danger_venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_king = {
      lines = {
        { id = "dk_default", text = "Old, white and patient, and he lets you see him exactly once. I've had a place on the wall for him for years." },
        { id = "dk_done", when = { questDone = TODO_QUEST("Big Game Hunter") },
          text = "On my wall, thanks to you. I look at him every morning, and he looks back, and I'm not sure which of us won." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger_venture = {
      lines = {
        { id = "dv_default", text = "They're cutting the jungle down to find what's under it, and every tree they fell sends the beasts somewhere else, usually here and usually at supper." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } } },
    },

    hero = {
      big = true,
      lines = {
        { id = "hr_default", text = "Barnil talks when I'm out of earshot, the old gossip. I fought when the Alliance asked, like plenty did, and came home to find I'd rather be shot at by a tiger." },
        { id = "hr_horde", when = { faction = "Horde" },
          text = "Barnil says too much, as usual. Aye, I fought your lot once, and you fought mine, but out here it's the beasts that keep score, and they don't care what color your tabard is." },
      },
      choices = {
        { text = "What war?", next = "hero_war", fx = { trait = { curious = 1 } } },
        { text = "You don't like talking about it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    hero_war = {
      lines = {
        { id = "hw_default", text = "The one with the orcs in it, the first or the second, for they blur. Ask Barnil and he'll tell you I was magnificent, but I was mostly wet." },
      },
      choices = {
        { text = "Would you fight for the Alliance again?", next = "op_alliance" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    students = {
      lines = {
        { id = "st_default", text = "Ajeck's the best shot in camp and knows it, and Erlgadin's the best-born and wishes he wasn't. Barnil's not a student at all but a saint, so pick one of the other two and ask." },
      },
      choices = {
        { text = "Ajeck.", next = "students_ajeck" },
        { text = "Erlgadin.", next = "students_erlgadin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students_ajeck = {
      lines = { { id = "sa_default", text = "Her father taught her tigers; I just gave her somewhere to practise. She'll take Sin'Dall, the great tiger of the north, one day, and I hope I'm awake for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    students_erlgadin = {
      lines = { { id = "se_default", text = "He came out here to forget Stormwind, and he talks about it every night. He's good with a blade and better with a grudge, so leave him his letters." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },

    shot = {
      lines = {
        { id = "sh_default", text = "A raptor, mid-leap, through the gap between two of its friends, and Barnil wrote it down. I've not been able to do it since, though I've tried every week." },
      },
      choices = {
        { text = "Mine was luckier than that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Teach me how you set it up.", next = "shot_teach", fx = { trait = { curious = 1 } } },
      },
    },
    shot_teach = {
      lines = { { id = "sht_default", text = "You don't aim where it is, you aim where it's decided to be. Raptors decide early, and seeing that is your gift, so use it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },

    rifle = {
      lines = {
        { id = "rf_default", text = "Ironforge barrel, Stormwind stock, and a sight I bought from a gnome who swore it'd make me famous. It did, but the sight's terrible." },
        { id = "rf_gnome", when = { race = "Gnome" },
          text = "Ironforge barrel, and a sight from one of your people that I'll swear is made of lies. You wouldn't know a tinker named after a cheese, would you?" },
      },
      choices = {
        { text = "May I hold it?", next = "rifle_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rifle_hold = {
      lines = { { id = "rh_default", text = "No, but you may admire it from there, or a little bit closer, but no further than the rug. Barnil'll have to clean it again just from you looking." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_druid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Kin, is it? Then I'll not ask you to skin one, and you'll not ask me to stop. Sin'Dall is a beast, druid, and a fine one, and I'll honor him the way a hunter honors anything: by taking him fairly, face to face." },
        { id = "xdr_elf", when = { race = "NightElf" },
          text = "Your people say that of every cat in the world, I've heard, but I can't bring myself to believe Sin'Dall is a druid in disguise. I take a beast fairly and face to face, and that's all the honor I know." },
      },
      choices = {
        { text = "A fair hunt is still a death. Spare the old ones.", next = "BACK", reply = "Spare the old ones, you say? Druid, the old ones are the whole hunt, but I'll mind your words when I find him. That's as much as I'll promise.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "The hunt is part of the balance. I accept it.", next = "BACK", reply = "Then we're kin of a sort, druid, and I'm glad of it. The hunt keeps the jungle honest, and so do you.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Why hunt at all?", next = "why" },
      },
    },
    k_troll = {
      lines = {
        { id = "xtr_default", text = "That they did, with spears and patience, and I've seen Gurubashi pits that would put my traps to shame. I'd hunt beside a troll any day, as long as he isn't hunting me." },
        { id = "xtr_head", when = { origin = "troll_headhunter" },
          text = "A headhunter, are you, and you'd find my head no trophy at all, I promise. Still, I've seen Gurubashi pits that would put my traps to shame, and I'd hunt beside you any day." },
      },
      choices = {
        { text = "Then hunt with me, old man.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Hunt in your own mountains, dwarf.", next = "BACK", fx = { affinity = -2, trait = { stern = 1 } } },
      },
    },
    k_human = {
      lines = {
        { id = "xhu_default", text = "Fewer than there ought to be, for most Stormwinders think a rifle's something you buy, not something you earn. If you earned yours, you're welcome at my fire." },
        { id = "xhu_eastvale", when = { origin = "human_eastvale_woodsman" },
          text = "Eastvale, by the cut of that coat. Those woods breed the only human hunters worth the name, and I learned half my tracking from an old Eastvale man, so you're welcome at my fire." },
      },
      choices = {
        { text = "I earned it, and I'll prove it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Who else hunts with you here?", next = "students" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Well now, that's kindly said, and I'll not pretend a hunter doesn't like to hear it. You've a good eye, and a good eye is half of the hunt." },
        { id = "s2", text = "Ha! Barnil's forever telling me my head's swelled past my hat, and you've just made his job harder. Sit down, then, for I like the company of folk with sense." },
      },
      fail = {
        { id = "f1", text = "Save your breath, for I've had lords from Stormwind to Ironforge butter me up over trophies they never shot themselves. Out here a hunter's judged by what's hanging on the rack, and not by pretty words." },
        { id = "f2", text = "Flattery scares off no game and brings none in either, so it's no use to me. Go and bag something worth the powder, and then we'll talk." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You've got some bite to you, and I like a beast that snaps back when you prod it. There's not many who'd cheek a dwarf with a loaded rifle across his knees." },
        { id = "s2", text = "Oh, is that how it is? Well, you've a steady nerve, I'll grant you, and a steady nerve is what keeps your hands still when the tiger's coming straight at you." },
      },
      fail = {
        { id = "f1", text = "I've been roared at by beasts that could swallow you whole, so your yapping doesn't trouble me. Mind your manners in my camp, or go and hunt somewhere else." },
        { id = "f2", text = "Keep your voice down, for you're scaring the game and bothering me, and I'm not sure which I mind more. A mouth like that gets a hunter killed out here." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Easy, now. I've looked enough big cats in the eye to know when one's about to spring, and you've that same look about you. I'll not test it, so say your piece.", narr = "Hemet's thumb rests on the hammer of his rifle, though he keeps the barrel pointed at the ground." },
        { id = "s2", text = "Hm, there's teeth behind that, and I'm too old a hunter to poke at something with teeth just for the sport of it. You've made your point, so let's have it plainly." },
      },
      fail = {
        { id = "f1", text = "I've stood my ground with a pack of raptors coming through the brush, and you're not half so quick nor so hungry. Sit down before you embarrass yourself." },
        { id = "f2", text = "You'll not frighten me in my own camp, for I've a rifle, a steady hand and a lifetime of things far uglier than you glaring at me. Try that on the trolls and see how you fare." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "Sin'Dall keeps to the high ground in the north of the jungle, and he'll smell you long before you see him. Come at him from downwind, if you've the sense." },
    { id = "bl2", text = "King Bangalash prowls the northern hills with his tigers around him like a royal court. Kill the guards first, or they'll be at your back when the king comes." },
    { id = "bl3", text = "Barnil's still missing half the pages of my Green Hills of Stranglethorn, and the trolls and pirates have them scattered all over the jungle. Bring him every page you find, and he'll pay you for it." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "You tramp through my camp like a kodo through a crockery shop, and you scare off every beast for a mile. A hunter who can't keep quiet is no hunter at all." },
      { id = "gv_rival", when = { grudge = "rival" }, text = "I've seen you running errands for Kebok and his Booty Bay lot. Any friend of that goblin's is welcome to his company, and not to mine." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You made light of my life's work, as if hunting were some game for bored lords. I've stalked tigers longer than you've been alive, so mind it." },
      { id = "gv_values", when = { grudge = "values" }, text = "You kill for the pleasure of it and leave the meat to rot. That's butchery, not hunting, and I'll not call it anything else." },
    },
    amends = {
      { id = "am1", text = "Go out and bring me a clean kill, taken fair and skinned properly. That's the only apology a hunter ever needs to make." },
      { id = "am_wronged", when = { grudge = "wronged" }, text = "Show a little respect for the craft, and for the beasts as well. They've earned it, even if you haven't yet." },
      { id = "am_rival", when = { grudge = "rival" }, text = "Stop doing Kebok's fetching, and I'll stop counting you as one of his. It's as simple as that." },
    },
    spite = {
      { id = "sp1", text = "I think you're the sort who'd shoot a tiger in its sleep and call it sport. I'd not put your name in my book if you were the last hunter alive." },
      { id = "sp_values", when = { grudge = "values" }, text = "I think you're a butcher with a bow, and the jungle will remember you for it. It always does, sooner or later." },
    },
    knows = {
      { id = "tp_knows", text = "I've hunted every corner of this jungle, and I know it better than any map. Ask, and I'll tell you what I've learned." },
    },
    background = { { id = "tp_bg", text = "Soldier, then hunter, then writer, Light help us all. Barnil does the spelling.", next = "hero" } },
    advice = { { id = "tp_ad", text = "Shoot what's charging you first, then shoot what's watching you, and then have a drink." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War, my friend, and I've seen orcs charge, and a tiger in full stride is a finer sight. I'll not say that in front of the veterans, mind." } },
    magni = { { id = "tp_magni", text = "King Magni's a fine king, and a fine hunter in his day, I'm told. I've half a mind to send him a copy of my book when Barnil finishes the spelling." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the nearest port with a decent pint, and Barnil goes for supplies every week. I don't care for the place myself, too many folk and not enough game." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "There are tigers in Zul'Gurub, they say, bred by the trolls and fed on blood, and I'd give my best rifle to hunt one. Barnil says I'm mad, and he may be right." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Arena's a waste of good fighting, my friend, men killing each other over a box when the jungle's full of finer prey. Still, it's a fine place to find a strong arm for a hunting party." } },
    onyxia = { { id = "tp_onyxia", text = "A black dragon in Dustwallow, eh? Now there's a trophy, but I've a feeling she'd mount my head first. I'll leave that one to braver men." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has a shooting gallery, and I've never once lost at it. They've asked me not to come back, which I take as a compliment." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer hunt from gryphon back, and I've seen one drop a boar from a hundred feet up. Finest hunters in the Alliance, after me." } },
    _gated = {
      { id = "gt1", text = "That's a story I keep for hunting companions, and you've not yet brought a single trophy back to this camp. Earn your place at the fire first." },
      { id = "gt2", text = "I'll not be telling you that, for I don't know you well enough. Go and hunt a while, and ask me again." },
    },
    _none = { { id = "tp_none", text = "Does it have fur, claws or teeth? No? Then I couldn't care less." } },
  },
}

P:NPC {
  key = "barnil", id = TODO_NPC("Barnil Stonepot"), name = "Barnil Stonepot",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "nesingwary_camp" }, temper = { "patient" }, values = { "loyal", "orderly" },
  notices = { "race" },

  impression = {
    first = "He asks that I pick up any loose pages I find.",
    third = "{name} met Barnil Stonepot, who keeps Hemet Nesingwary's camp and minds the great hunter's book with fierce pride.",
  },

  greetings = {
    { id = "g_op_alliance", when = { gossip = { topic = "alliance", stance = "broken" } }, text = "Hemet says ye reckon the Alliance is a name an' nothin' more. He sulked over his supper about it, an' I had tae wash the plates, so I hope ye're happy." },
    { id = "g_pages", text = "Mind where ye step, friend. If ye see a loose page anywhere, it's ours, so don't step on it; pick it up." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, in this heat! Ye'll melt, like I did the first month, an' then ye stop noticin', mostly." },
  },

  start = "hello",
  nodes = {
    dd_barnil_b = {
      lines = {
        { id = "dd_barnil_b_a", text = "Writing about it? He's written a whole chapter, lad, and it's mostly about how the great cat moved through the grass, and very little about you. That's Hemet; the hunt's the story, and the hunter's only the one who was lucky enough to be there." },
      },
      choices = {
        { text = "That's how it should be. Bangalash deserves the chapter.", next = "dd_barnil_b2", fx = { align = { honor = 1 } } },
        { text = "I'd like my name in there, at least once.", next = "dd_barnil_b2", fx = { align = { honor = -1 } } },
      },
    },
    dd_barnil_b2 = {
      lines = {
        { id = "dd_barnil_b2a", text = "I'll see that it's spelled right, at least, since I'm the one who copies it out fair. Mind the loose pages if you're walking near the river, because the wind takes them and I can't chase them all." },
      },
      choices = { { text = "I'll keep an eye out. Something else.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It has room for anythin' wi' a good story, an' ye're a better one than most o' the panthers. Just don't go talkin' tae the beasts before the master shoots them, for he'll call it unsporting." } },
      choices = {
        { text = "I'll respect the master's hunt, Barnil.", next = "BACK", reply = "Good, the master'll be glad tae hear it. Respect the hunt, an' ye'll have a page in the book yerself.", fx = { align = { order = 1 } } },
        { text = "I'll warn the beasts if the spirits ask me to.", next = "BACK", reply = "Warn 'em? Ach, the master'll have a fit if he hears it, an' so will I. Keep yer spirits quiet near the camp, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "He doesnae say much, for he's a hunter first an' a politician never. He'll look at ye long an' hard, the way he looks at a cat he hasnae made up his mind about, an' then he'll decide." } },
      choices = {
        { text = "I'll earn his trust the proper way, Barnil.", next = "BACK", reply = "Aye, that's the way, an' he'll see it in time. The master trusts what he watches, no' what he's told.", fx = { align = { order = 1 } } },
        { text = "His trust doesn't matter. I know what I am.", next = "BACK", reply = "That's a proud answer, an' maybe a true one. Still, he'll look at ye long an' hard, so stand straight while he does.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A clean kill, a straight story, an' the hide in one piece, an' he cannae abide anybody who shoots a beast while it drinks. He's written it all in his book, the rules an' the hunts, so if ye find any loose pages out in the jungle, bring them back tae me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A clean kill, a straight story, an' the hide in one piece, an' he cannae abide anybody who shoots a beast while it drinks. He's written it all in his book, the rules an' the hunts, so if ye find any loose pages out in the jungle, bring them back tae me. An' that {pet} o' yers is a fine beast, but keep it off the master's tent, for he's sleepin', an' he snores like a basilisk." },
      },
      choices = {
        { text = "His rules are right. A hunt without rules is just killing.", next = "BACK", reply = "Aye, an' that's near enough the first page o' his book. A hunt without rules is just the jungle, an' the jungle's got killers enough.", fx = { align = { order = 1 } } },
        { text = "Rules are fine in a book. I hunt to win.", next = "BACK", reply = "Then ye'll never get a page in the master's book, an' he'll never forgive ye for it. Win if ye like, but win clean.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A gnome mage tried a findin' spell for me once, an' it led him straight tae a gorilla's nest. He found two pages an' lost his hat, an' the master still doesnae know any o' it happened." } },
      choices = {
        { text = "Some honest legwork would find the rest.", next = "BACK", reply = "Aye, an' that's what I've been tellin' the master. Boots, patience an' a good eye find more pages than any spell.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the jungle keep a few. He'll never notice.", next = "BACK", reply = "Never notice? He'd notice a page gone in the dark wi' his eyes shut, friend. Every one o' them matters tae him.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Only that a troll shaman once spooked every raptor out o' the valley wi' a thunderclap, an' the master spent a week cursin' him. He wrote it down, though, which is more respect than he gives most." } },
      choices = {
        { text = "I'll hunt fair and keep to the master's rules.", next = "BACK", reply = "Good, for thunder makes the cats scatter, an' then we're all huntin' fog for a week.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt my own way, rules or no rules.", next = "BACK", reply = "Then do it far from the camp, friend, or the master'll curse ye for a week like he did that shaman. Rules are what make a hunt worth tellin'.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Not for a moment. This jungle grows faster than we can shoot it, and the trolls take more than we ever will. Besides, Hemet keeps count, and he'd stop before he'd see a breed go." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the jungle took them, mostly, the wind and the damp and a few curious monkeys. The book is the work of a lifetime, and every page that goes missing is a story the world might never read." } },
      choices = {
        { text = "I'll find every page I can.", next = "BACK", reply = "Bless ye, friend, an' the master will thank ye too. Every page is a day o' his life, so bring 'em back careful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the monkeys have a few. It's only paper.", next = "BACK", reply = "Only paper? Friend, that's forty years o' the master's life in those pages. Ye'd no' say that if ye'd seen him write them.", fx = { align = { order = -1 } } },
        { text = "Something else, Barnil.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "He says a book about the jungle should be written in the jungle, and there's no arguing with him once he's decided something. I just keep the pages wrapped in oilcloth and hope for a dry season, which never comes." } },
      choices = {
        { text = "He's right. Some things should stay where they belong.", next = "BACK", reply = "Aye, he is, though I'd no' tell him so, for his head's big enough already. The jungle's the right place for that book, damp an' all.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Move the book. The work matters more than his pride.", next = "BACK", reply = "Ye tell him, then, an' I'll hold yer coat. Nobody moves that book but him, an' nobody's tried twice.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "No' often, an' never out loud, for a hunter who thinks too much about dyin' starts missin' his shots. But I keep a page at the back o' the master's book for the ones who didnae come back, an' it's longer than I'd like." } },
      choices = {
        { text = "Remembering them is a holy thing, Barnil. Keep that page.", next = "BACK", reply = "I will, an' thank ye for sayin' so. I add a name every time the jungle takes one o' ours.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Names in a book won't bring them back. Look to the living.", next = "BACK", reply = "They won't, but nobody else will remember them otherwise. I'll look tae the living when I've finished rememberin' the dead.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "He'll no' tell ye himself, for he'd sooner talk about panthers, but he's done the Alliance good service in his day, or so the old soldiers say. Now he says the jungle's the only war worth fightin', an' maybe he's right." } },
      choices = {
        { text = "His place is with the Alliance's armies. Duty calls him.", next = "BACK", reply = "Maybe, but he's done his share an' then some. The Alliance can find another rifle, an' the master's earned his panthers.", fx = { align = { order = 1 } } },
        { text = "He's earned his freedom. Let him hunt in peace.", next = "BACK", reply = "Aye, that's my thinkin' too. He's given enough tae kings, an' the jungle's his reward.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_bear = {
      lines = {
        { id = "xbr_default", text = "Do ye, now? I followed a few o' those snow bears myself, back home in my day, though none o' them ever followed me home. The master would call that a waste o' a fine trophy, but I'd call it the better bargain, so which o' ye is in charge?" },
      },
      choices = {
        { text = "Some days I'm not sure, Barnil.", next = "xorig_bear2", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "We look after each other. Neither of us is in charge.", next = "xorig_bear2", fx = { trait = { kind = 1 } } },
      },
    },
    xorig_bear2 = {
      lines = {
        { id = "xbr2_default", text = "Ha, that's the right answer! The jungle cats here would make a meal o' most beasts, but a Dun Morogh bear's too stubborn tae be eaten, an' I'd wager yours is the same. Keep it fed an' keep it out o' the master's sights." },
      },
      choices = {
        { text = "I will.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_bangalash_barnil", when = { killed = { name = "Bangalash" } },
          text = "You're the one who brought down King Bangalash! Hemet's been writing about it in the book every night by the fire, and I've had to fetch him three new quills already." },

        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Ye'll forgive the mess, for the master's pages blow all over the camp an' I've no' had time tae tidy, but sit an' rest, for the jungle's hard on soft feet." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" }, text = "A paladin, here! The master'll be pleased, for he's always sayin' the Alliance needs more heroes, an' never mind that he's one himself, though he'll no' admit it." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman o' the Horde at the master's camp. Well, he says a good hunter's welcome whatever the colors, so mind yer manners an' I'll mind mine." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest o' the Horde. Well, keep yer loa or yer shadows away from the master's book, for it's in bad enough shape already." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock in the master's camp. Keep yer beastie away from the rifles, for they're loaded, an' so am I." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid in camp, is it? Don't let the master see ye, {g:lad|lass}, or he'll want tae know what ye weigh as a cat." },
        { id = "h_default", key = true,
          text = "Barnil Stonepot. I keep the master's camp, his kit, an' his book. He's a hero o' the Alliance, ye know. Ye wouldnae think it, the way he snores." },
        { id = "h_book", tags = { "news" }, when = { questActive = TODO_QUEST("The Green Hills of Stranglethorn") },
          text = "I was proofreadin' the master's book, The Green Hills of Stranglethorn, when the wind took the lot, an' now there's pages all over the jungle. Find them, please, for he doesnae know yet." },
        { id = "h_quiet", when = { metBefore = true },
          text = "I like it here, truth be told: cleanin' rifles, packin' for the next trip, all peaceful. I miss a good fight sometimes, but the jungle's always happy tae provide one." },
        { id = "h_bear", when = { origin = "dwarf_bear_tracker" },
          text = "A Dun Morogh tracker, wi' a bear o' yer own, in the jungle! Keep it well back from the master's tent, friend, for he'll take one look an' start measurin' it for the wall." },
        { id = "h_book_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Green Hills of Stranglethorn"), days = 3 } },
          text = "Every page back an' bound, an' he's never goin' tae know. Ye'll have a drink on me for that, an' ye'll never mention it either." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Ye'll be good at findin' loose pages, I'd wager, since ye've an eye for things that aren't where they should be." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Could ye dry out the camp a wee bit? The damp's gettin' into the pages, an' the master won't hear o' movin' the book indoors." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Ye'll be wantin' tae see the master, I suppose, but wipe yer boots first, for I've only just swept the camp." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, here! An' one o' the Forsaken, which the master'll find very interestin', though he'll pretend he's only interested in panthers." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman at the master's camp! Well, I never. The master'll want tae write ye down, an' so will I." },
      },
      again = {
        { id = "h_again", text = "Aye? I'm listenin'. My hands are busy, my ears aren't." },
        { id = "h_again2", text = "Somethin' else, friend? Ask away, only mind the oil." },
      },
      choices = {
        { text = "Hemet's writing about Bangalash in the book?", next = "dd_barnil_b", when = { killed = { name = "Bangalash" } } },

        { text = "Does Nesingwary's book have anything to say about shamans?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Has magic ever helped with the master's lost pages?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Do you ever worry you'll hunt the jungle empty?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "I tracked bears through the Dun Morogh snow. Now one follows me.", next = "xorig_bear", when = { origin = "dwarf_bear_tracker" } },
        { text = "What's the book about?", next = "book" },
        { text = "Your master seems a gruff sort.", next = "master" },
        { text = "Don't you miss Ironforge?", next = "home", when = { race = "Dwarf" } },
        { text = "You said you miss a good fight.", next = "fight", when = { metBefore = true } },
        { text = "What do you do all day?", next = "work" },
        { text = "Do the hunters here ever think about their own deaths?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Shouldn't a hero of the Alliance be serving it, Barnil?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Nesingwary must be hard to impress, Barnil.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'll look for the pages.", next = "END", fx = { affinity = 2 } },
        { text = "You miss a fight? I'm a warrior, so spar with me.", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "Why are the pages of Nesingwary's book loose, Barnil?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why won't Nesingwary move the book indoors, Barnil?", next = "xmage", when = { class = "MAGE" } },
        { text = "What does the master think of the Forsaken, Barnil?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Does Nesingwary's book have room for a dwarf shaman?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    book = {
      lines = {
        { id = "b_default", text = "The huntin', mostly: the jungle, the beasts, an' the master bein' brave at them. It's good, if there's too many words about the master's rifle, but don't tell him I said so." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } },
        { text = "Who's it for? Who reads a hunting book?", next = "book_readers" },
      },
    },
    book_readers = {
      lines = {
        { id = "br_default", text = "Stormwind nobles who'll never leave Stormwind. They'll buy it, put it on a shelf, an' tell their friends they've been tae the jungle. That's what books are for." },
        { id = "br_noble", when = { origin = "human_minor_noble" },
          text = "Folk like yer family, beggin' yer pardon. They'll buy it, shelve it, an' tell their friends they've been tae the jungle." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    master = {
      lines = {
        { id = "m_default", text = "Kind, when he forgets tae be gruff. He's never once let me carry the rifle on a hunt, an' says if he dies, someone has tae finish the book." },
      },
      choices = {
        { text = "That's not a bad reason.", next = "master_reason" },
        { text = "Sounds like he's protecting you.", next = "master_reason", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_reason = {
      lines = { { id = "mr_default", text = "I know, an' that's what makes me cross, for a dwarf hates bein' protected near as much as he hates bein' called short." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    home = {
      lines = {
        { id = "hm_default", text = "Every mornin', for about a breath. Then a parrot screams at me an' I remember I've seen a sky Ironforge never will. Do ye miss it, yerself?" },
      },
      choices = {
        { text = "Every day. The forges, the noise.", next = "BACK", fx = { affinity = 2 } },
        { text = "No. I wanted out.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I miss the beer.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },

    fight = {
      lines = {
        { id = "f_default", text = "I was a soldier before I was a servant, an' ye don't forget how tae stand in a line. Out here, ye stand in it alone, an' it's no' the same." },
      },
      choices = {
        { text = "Come with me next time.", next = "fight_offer", fx = { affinity = 1, trait = { generous = 1 } } },
        { text = "The camp needs you here.", next = "BACK", reply = "It does, an' I'll stay as long as it does. A soldier knows where he's needed, even when he'd rather be elsewhere.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "You should fight where you choose, not where you're posted.", next = "BACK", reply = "Ach, ye sound like a young man wi' no sergeant tae shout at him. I chose this post, friend, an' I'll stand at it.", fx = { align = { order = -1 } } },
      },
    },
    fight_offer = {
      lines = { { id = "fo_default", text = "Ha! An' leave the master tae cook for himself? He'd be dead by Thursday, but it's kind o' ye tae ask, it is." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    work = {
      lines = {
        { id = "w_default", text = "I clean four rifles, mend three tents, an' write down what he shot an' how he says he shot it. Then I write the other version, the true one, in the margin." },
      },
      choices = {
        { text = "So you keep two versions.", next = "work_two" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_two = {
      lines = { { id = "wt_default", text = "The book gets his an' the margin gets mine. Someday someone'll read both an' have a good laugh, an' I hope it's me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Spar! Oh, don't tempt me, for I've been sittin' wi' this book so long my knees have forgotten what a stance is. Ye'd win, an' I'd enjoy every bruise, an' Hemet'd say I'd finally done somethin' useful." },
      },
      choices = {
        { text = "Then up you get, Barnil.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Your knees can rest. I'll find the pages.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ironforge lad, soldier once, an' now the master's man. It's the best job I ever had, but don't tell him." } },
    advice = { { id = "tp_ad", text = "Keep yer powder dry an' yer pages weighted. The wind in this jungle has opinions." } },
    magni = { { id = "tp_magni", text = "King Magni's a fine king, an' I'm proud to be his subject, though I've not been home to Ironforge in a good long while. The master keeps me busy." } },
    booty_bay = { { id = "tp_booty_bay", text = "I go to Booty Bay every week for supplies, an' I come back with a lighter purse an' a sore head. The goblins drive a hard bargain, but the beer's not bad." } },
    second_war = { { id = "tp_second_war", text = "I fought alongside the master in the Second War, an' that's how we met. He saved my life twice, an' I've been with him ever since." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer are a wild lot, an' I've never trusted a dwarf who'd rather fly than walk. The master likes them, though, an' that's enough for me." } },
    _none = { { id = "tp_none", text = "Ask the master; he'll tell ye, at great length." } },
  },
}

P:NPC {
  key = "ajeck", id = TODO_NPC("Ajeck Rouack"), name = "Ajeck Rouack",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "nesingwary_camp" }, temper = { "focused" }, values = { "proud", "brave" },
  notices = { "class", "lock_taint" },

  impression = {
    first = "She means to take Sin'Dall someday, and says it like plain fact.",
    third = "{name} met Ajeck Rouack at Nesingwary's camp, a tiger hunter who means one day to bring down Sin'Dall.",
  },

  greetings = {
    { id = "g_bow", text = "Careful, I'm restringing. Talk if you like; I'll listen." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Show me your bow. Hm, not bad, but your draw's short, so fix that before you go after anything with stripes." },
    { id = "n_lock_taint", cat = "lock_taint", when = { taint = { min = 30 } },
      text = "The jungle went quiet when you came through the trees, and I'd bet it smelled what I smell now, which is that scorched, sweet stink of fel all over you. The big cats will catch it a mile off, so wash before you go hunting." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "No, because Sin'Dall is mine to take with the bow, alone, the way my father would have done it. But the tigers and stalkers along the way don't care about my oaths, so a sword at my back on the way there would be welcome." } },
      choices = {
        { text = "Then the kill is yours alone. I respect that.", next = "BACK", reply = "Thank you, I wasn't sure you'd understand. My father would have, and that's what matters to me.", fx = { align = { honor = 1 } } },
        { text = "A kill's a kill. I'd help bring him down, oath or not.", next = "BACK", reply = "You would, I'm sure, and you'd ruin it for me. Help me with the young tigers if you must help, but leave Sin'Dall to me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "It could, but I won't let it, because my father took his tigers with patience and a bow. If I find Sin'Dall with a spell, I'll have found him, but I won't have earned him, and that matters to me more than it ought to." } },
      choices = {
        { text = "Then earn him the way your father did.", next = "BACK", reply = "I will, or I'll die trying, which is probably what he'd have said too. He never once used a trick on a cat he respected.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A kill is a kill. I'd use every trick I had.", next = "BACK", reply = "Then you'll never know what my father knew, and I pity you a little for it. Use your tricks on the young ones, not on him.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My father did, in his own fashion, and he'd kneel by every kill and say nothing for a while. I used to think he was only tired, but I do it too now, so perhaps it was something your people would understand." } },
      choices = {
        { text = "That silence sounds like a prayer to me. Keep doing it.", next = "BACK", reply = "I will, then, and I'll think of him while I do. Thank you, that means more than you'd guess.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A kill is a kill. Kneeling won't skin it faster.", next = "BACK", reply = "No, but it makes the next kill mean something. My father knew that, and I'm still learning it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because Sin'Dall is mine, and I've tracked him for longer than I care to admit. A rogue might get close, but close isn't enough with a cat like that, and I'll not have anyone else taking my kill." } },
      choices = {
        { text = "Then I'll stay out of your way. The hunt is yours.", next = "BACK", reply = "Thank you, it isn't often anyone gives way out here. I'll find him myself, and I'll find him clean.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The jungle doesn't care who claims what.", next = "BACK", reply = "The jungle doesn't, but I do, and so did my father. Stay off his trail, if you'd do me a kindness.", fx = { align = { honor = -1 } } },
        { text = "Something else, Ajeck.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "He can smell everything, and he'll vanish into the jungle at the first hint of something he doesn't recognize. I've lost him three times to careless hunters, and I'll not lose him a fourth to a demon's stink." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "He can smell everything, and he'll vanish into the jungle at the first hint of something he doesn't recognize. Your {pet} is upwind of him right now, and if he bolts because of that stink, you'll be the one beating through the bush until he's found." },
      },
      choices = {
        { text = "I'll keep my demon well away from your trail.", next = "BACK", reply = "I'd be grateful, friend. He's slipped me three times already, and I'd hate a fourth to be your imp's fault.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon goes where I go. Track around it.", next = "BACK", reply = "Then I'll track around it, and curse you every step of the way. Keep it downwind, at least.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because my father taught me tigers, and Sin'Dall is the greatest tiger in this jungle, so taking him is the only way I'll ever know I learned the lesson properly. I don't hate the beast, though, and I think I'll miss him when he's gone." } },
      choices = {
        { text = "Then let him live. Some lessons are better left unfinished.", next = "BACK", reply = "Maybe you're right, and maybe I'm a fool for chasing him. But I can't leave it unfinished, not while he still walks.", fx = { align = { light = 1 } } },
        { text = "Take him, then. Your father would want the lesson finished.", next = "BACK", reply = "He would, I think, though he'd never say it aloud. I'll finish it, one way or the other.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only if you can walk quiet, and I've never met a paladin who could, though I've met a few who tried very hard. Sin'Dall has outlived every hunter who went after him alone, so I'd take a shield at my back if it kept its mouth shut and let me take the shot." } },
      choices = {
        { text = "The kill is yours, Ajeck. I'll guard your back.", next = "BACK", reply = "That's more than most paladins would offer, and I'll take it gladly. Walk quiet, if you can, and leave the shot to me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If I get the shot first, I'm taking it.", next = "BACK", reply = "Then we'll be enemies by nightfall, and I don't want that. Leave Sin'Dall to me, I'm asking you plainly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Keep that plate from clanking if you come with me, because Sin'Dall hears metal long before he sees it, and he never lets anyone see him twice." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Keep still while I string this, and don't pray too loud, because the tigers out here can hear a pin drop and a sermon from twice as far." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'd hear the jungle better than I can, so tell me if Sin'Dall is prowling close, because I've waited a long while." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. If you pray before a hunt, pray for Sin'Dall to show himself; I've done it myself and had no answer." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Please don't freeze any tigers near my snares; it confuses the young ones, and it confuses me." },
        { id = "h_default", key = true,
          text = "Ajeck Rouack. My father put a bow in my hands before I could read, and taught me tigers before he taught me manners. I teach tiger hunting now, and one day I'll take Sin'Dall." },
        { id = "h_tigers", tags = { "news" }, when = { questActive = TODO_QUEST("Tiger Mastery") },
          text = "Young tigers first, then the older ones, then the ones the trolls are afraid of. That's how my father taught me, and he was never wrong about tigers." },
        { id = "h_sindall", when = { metBefore = true },
          text = "I saw Sin'Dall's tracks by the river this morning, and they were fresh. He knew I'd find them; he's teasing me." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Tigers hunt at night, so I sleep in the day when I can. Hemet thinks it's lazy, but Hemet snores." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll be wanting to know how to hunt Sin'Dall, I suppose, and I'll tell you the same as I tell everyone: you won't." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Keep your demon away from the trail, because Sin'Dall can smell anything strange a mile off, and I've spent too long tracking him to lose him now." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. Steel's no use to me against Sin'Dall, but you'd be worth having at my back when the jungle stalkers come out at night." },
      },
      again = {
        { id = "h_again", text = "Anything else you'd like to know? I've a minute before the master needs me." },
        { id = "h_again2", text = "Ask away; I'm still restringing." },
      },
      choices = {
        { text = "Does a hunter ever ask the beast's spirit for leave?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could magic help you track Sin'Dall, Ajeck?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who is Sin'Dall?", next = "sindall" },
        { text = "Tell me about your father.", next = "father" },
        { text = "Tracking a tiger must take a deal of patience.", next = "track" },
        { text = "Want to compare bows?", next = "bows", when = { class = "HUNTER" } },
        { text = "What if one of the cats you hunt is a druid?", next = "druid", when = { class = "DRUID" } },
        { text = "Why are you so set on taking Sin'Dall, Ajeck?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you hunt Sin'Dall with a warrior beside you, Ajeck?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Would you take a paladin on the hunt for Sin'Dall, Ajeck?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll hunt with you.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Darkspear hunters track tigers too, Ajeck.", next = "k_troll", when = { race = "Troll" } },
        { text = "Why do you say no one else will take Sin'Dall, Ajeck?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I've heard Sin'Dall can smell demons, Ajeck.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why not tame Sin'Dall instead of killing him?", next = "aj_tame", when = { class = "HUNTER" } },
        { text = "How do you survive when a tiger turns on you?", next = "aj_feign", when = { class = "HUNTER", minLevel = 30 } },
        { text = "My people walk beside the great cats, not against them.", next = "aj_elf", when = { race = "NightElf" } },
        { text = "Good hunting.", next = "END" },
      },
    },
    aj_tame = {
      big = true,
      lines = {
        { id = "ajt_default", text = "Because he'd never come to the rod, and I'd never ask him to. Some beasts are meant to be companions and some are meant to be the hunt itself, and my father taught me to tell the difference by the eyes; Sin'Dall's eyes have never belonged to anyone." },
        { id = "ajt_pet", when = { pet = { family = "Cat" } }, text = "You've a cat of your own, I see, so you know what it is to have one choose you. Sin'Dall will never choose anyone, and I'd never shame him by asking; some beasts are the hunt itself, and my father taught me to know them by the eyes." },
      },
      choices = {
        { text = "A beast like that deserves to stay free.", next = "BACK", reply = "Free until I find him, yes, and then he'll get the cleanest shot I've got.", fx = { align = { light = 1 } } },
        { text = "Then take him, and take him clean.", next = "BACK", reply = "That's all I want, and all my father ever wanted for me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    aj_feign = {
      lines = { { id = "ajf_default", text = "I drop and lie still, and I let the cat lose interest, which a tiger does faster than you'd think, because a still thing isn't prey. Then I put a trap between us before it remembers me, and I've done it so often Hemet calls me the dead girl." } },
      choices = {
        { text = "I'll practise it until it's second nature.", next = "BACK", reply = "Do, because the first time you need it, there's no time to think.", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    aj_elf = {
      lines = { { id = "aje_default", text = "So I've heard, and I've seen a Kaldorei hunter's nightsaber, and it was more beautiful than anything in this jungle. But a tiger of Stranglethorn isn't a nightsaber, and the ones here would take your friend's throat as quick as yours." } },
      choices = {
        { text = "Every cat deserves respect, even these.", next = "BACK", reply = "I agree, and I respect them more than I respect most people.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sindall = {
      lines = {
        { id = "s_default", text = "The oldest tiger in Stranglethorn: clever, patient, and bigger than any I've seen. My father hunted him for years, and I mean to finish what he started." },
      },
      choices = {
        { text = "What if he's too old to be a fair fight?", next = "sindall_fair" },
        { text = "Let me come when you go.", next = "sindall_come", fx = { trait = { brave = 1 } } },
        { text = "Good hunting.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    sindall_fair = {
      lines = { { id = "sf_default", text = "Then he'll die by an arrow instead of starving in a ditch. That's the fair fight, and it's his, not mine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sindall_come = {
      lines = { { id = "sc_default", text = "No. Help me with the young ones, if you want to help, but Sin'Dall's mine. He was my father's, and now he's mine." } },
      choices = {
        { text = "Understood.", next = "BACK", reply = "Good. The young ones are thick along the ridges, if you're looking for work.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll take Sin'Dall myself if I find him first.", next = "BACK", reply = "Then you'll have to beat me to him, and I've been tracking him for years. Don't make me your rival over this.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Pride gets hunters killed.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },

    father = {
      lines = {
        { id = "f_default", text = "Patient, and strict. He'd make me sit still in the grass until I stopped hearing myself breathe, and I hated it, but now it's the only thing I do well." },
      },
      choices = {
        { text = "Is he still alive?", next = "father_alive" },
        { text = "Sounds like a good teacher.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    father_alive = {
      lines = { { id = "fa_default", text = "Ask me after Sin'Dall." } },
      choices = { { text = "I'm sorry I asked.", next = "BACK", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },

    track = {
      lines = {
        { id = "t_default", text = "You don't. You find where the water is, sit downwind, and wait for the jungle to go quiet. When the frogs stop croaking, that's the tiger." },
      },
      choices = {
        { text = "And then?", next = "track_then" },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_then = {
      lines = { { id = "tt_default", text = "Then you find out whether you were quiet enough. Most people learn the answer once." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    bows = {
      lines = {
        { id = "b_default", text = "Mine's yew, and it was my father's. Yours is newer and heavier than it needs to be, to make up for your draw, so fix the draw." },
        { id = "b_dwarf", when = { race = "Dwarf" },
          text = "A dwarf with a bow, not a gun? Hemet will be disappointed, though the tigers won't be." },
      },
      choices = {
        { text = "Show me.", next = "bows_show", fx = { trait = { curious = 1 } } },
        { text = "My draw is fine.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    bows_show = {
      lines = { { id = "bs_default", text = "Shoulder down, and breathe out before you release, not after. There, that's a tiger's worth of difference." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },

    druid = {
      lines = {
        { id = "d_default", text = "I've thought about that. If I see a cat with too much sense in its eyes, I lower the bow. Wear a collar, if you must hunt near here." },
      },
      choices = {
        { text = "A collar? I'll consider it.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "No collar. I'd see your arrow coming first.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    k_troll = {
      lines = {
        { id = "xtr_default", text = "I know, and I've learned more from your people's old trails than from any book Barnil keeps. Your trackers never break a twig they don't mean to, and I'm still learning how." },
      },
      choices = {
        { text = "I'll show you, if you want.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Some things we don't teach outsiders.", next = "BACK", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My father, a bow, and tigers. That's my whole life, and I'd not trade a day of it.", next = "father" } },
    advice = { { id = "tp_ad", text = "Never hunt a cat from below it. They're always above you, always." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "There are tigers in Zul'Gurub bred for war, and my father once took one. I mean to take a bigger one." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where we sell the pelts, and where my father taught me to haggle. I'm better at it than he ever was." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I've watched a few fights at the Arena, and I don't see the appeal. A tiger fights better than any man I've seen in there." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has a shooting contest, and I've won it three times. Hemet won't go anymore, which makes it easier." } },
    _none = { { id = "tp_none", text = "If it isn't tigers, it isn't my concern." } },
  },
}

P:NPC {
  key = "erlgadin", id = TODO_NPC("Sir S. J. Erlgadin"), name = "Sir S. J. Erlgadin",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "nesingwary_camp" }, temper = { "bitter" }, values = { "honorable", "proud" },
  notices = { "class", "race" },

  impression = {
    first = "He finds panthers better company than nobles.",
    third = "{name} met Sir S. J. Erlgadin, a former count of Stormwind who gave up the House of Nobles to hunt panthers in Stranglethorn.",
  },

  greetings = {
    { id = "g_sir", text = "Sir Erlgadin. Just 'Sir', thank you; I've given up the rest." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue, and honest about it at least, which would make you the most trustworthy soul in the House of Nobles." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They fear anything they can't price or marry, so yes, I should think so. I left all that behind for the jungle, and I'd sooner trust someone who listens to the land than someone who owns it." } },
      choices = {
        { text = "I serve the Alliance, nobles and all.", next = "BACK", reply = "Then you serve better than they deserve, and I mean that kindly. Mind your back in their halls, all the same.", fx = { align = { order = 1 } } },
        { text = "Let the nobles fear. The land doesn't answer to them.", next = "BACK", reply = "It doesn't, and that's why I prefer it out here. The land answers only to rain and sun, and it never once asked me my rank.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They treated them as furniture, mostly, polished and placed and forgotten until something needed defending. I sat in the House of Nobles beside men who'd never held a sword, sending men who had to die, and that is one of the reasons I hunt panthers now." } },
      choices = {
        { text = "A soldier's duty is to serve, even under poor masters.", next = "BACK", reply = "Duty's a fine thing, and I'd not take it from you. Just don't let them polish you and forget you, as they did the others.", fx = { align = { order = 1 } } },
        { text = "Then soldiers should choose their own masters, as you did.", next = "BACK", reply = "I did, and I've never regretted it for a moment. Choose well, soldier, because a bad master costs more than a bad wage.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A panther wants to eat you and makes no secret of it, while a noble wants the same and smiles as he says otherwise. Out here I know exactly where I stand, and in Stormwind I never did." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A panther wants to eat you and makes no secret of it, while a noble wants the same and smiles as he says otherwise. Out here I know exactly where I stand, and in Stormwind I never did. Your {pet} would make a better lord than most of the House of Nobles, and I say that with the deepest respect for your beast." },
      },
      choices = {
        { text = "Honest danger beats false friends. You chose well.", next = "BACK", reply = "I did, and I sleep better for it, even with the panthers coughing outside the tent. One walked past my boots last week and didn't so much as ask my rank.", fx = { align = { honor = 1 } } },
        { text = "Nobles are prey too, if you know how to hunt them.", next = "BACK", reply = "They are, and I hunted a few myself in the House, though only with words. It never gave me the satisfaction of a clean shot.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They feared what they couldn't buy, and a good mage can't be bought, only rented. I left because the House cared more for its rents than for the families the Defias were robbing, and I hunt panthers now because panthers don't pretend." } },
      choices = {
        { text = "Leaving was the honest choice, Sir.", next = "BACK", reply = "It was the only one I had left, and I'm glad someone sees it so. The rents were never mine to take.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You should have stayed and taken your share of the rents.", next = "BACK", reply = "Many did, and they're sitting fat in their halls tonight. I'd rather be thin and honest in the jungle.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They fear anything they can't buy, and you can't buy the weather. They'll tell you shamans are warlocks by another name, but I've seen both now, and the difference is plain to anyone honest enough to look." } },
      choices = {
        { text = "The warlocks nearly ruined us. Thrall gave us back our souls.", next = "BACK", reply = "They did, and Thrall's work is the bravest thing I've seen any people do. Stormwind will understand it in a generation or two, if it's lucky.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let Stormwind keep its fear. Fear serves the Horde well.", next = "BACK", reply = "Perhaps it does, though fear makes a poor neighbor in the long run. I'd sooner they learned you, and you them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a rogue tells you plainly what he wants, and a noble smiles at you while he takes it. I left Stormwind's court for the jungle because the panthers are more honest than the people I left behind." } },
      choices = {
        { text = "Honesty is rare. You were right to leave.", next = "BACK", reply = "I was, and I'm glad someone outside the court sees it. Half my old colleagues still think I came to Stranglethorn on a dare.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A smile is a tool. Nobles use theirs well.", next = "BACK", reply = "They do, and I used mine as well as any of them, to my shame. I'd like to think I've forgotten how.", fx = { align = { honor = -1 } } },
        { text = "Something else, Sir Erlgadin.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because they served whoever paid them best, and in Stormwind, that changed by the week. I don't say all mages are like that, but the ones who prospered at court learned to bend, and I never could." } },
      choices = {
        { text = "You kept your conscience and lost the court. Good trade.", next = "BACK", reply = "It was the best bargain I ever made, though it didn't feel so at the time. Mosquitoes and all, I'd make it again tomorrow.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The court needs mages who bend. That's how order holds.", next = "BACK", reply = "Bend, yes, until they break, and Stormwind's order nearly broke more than once. I'd rather have one mage who won't bend.", fx = { align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More than we need, if I'm honest, which I try to be now that I'm no longer a count. Hemet would hunt every beast in Stranglethorn to see who's best at it, and I go along because the hunt is cleaner than the House of Nobles ever was." } },
      choices = {
        { text = "Then hunt only what you need, and let the jungle keep the rest.", next = "BACK", reply = "That's my counsel too, and Hemet nods and goes on hunting. Perhaps you'll have better luck with him than I have.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A hunter's skill is proven in the field. Let Hemet hunt.", next = "BACK", reply = "He'll hunt whatever I say, so your blessing will please him. I only ask he leave a few for the next generation.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman. In Stormwind they'd call you a savage, and once I'd have nodded along, but I've met nobles who could learn a thing from you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. In Stormwind they'd bar the Cathedral doors to you, and once I'd have held the bar myself; I'm less sure of myself now." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. I knew nobles in Stormwind who dabbled in your sort of power behind locked doors, and they were worse company than any demon." },
        { id = "h_default", key = true,
          text = "I'm Sir Erlgadin. I was a count once, in Stormwind's House of Nobles, but I've stopped answering to that, and I hunt panthers now. Panthers, at least, are honest about what they want." },
        { id = "h_panthers", tags = { "news" }, when = { questActive = TODO_QUEST("Panther Mastery") },
          text = "Panthers hide better than tigers and strike faster. Learn to see one before it sees you, and you'll have learned something the nobles never did." },
        { id = "h_city", when = { metBefore = true },
          text = "A letter came from Stormwind wanting me back for a vote, so I used it to start this morning's fire. It burned beautifully." },
        { id = "h_hemet", when = { heardLine = "nesingwary.h_default" }, text = "Hemet told you about the hunting? He tells everyone; it's the only story he knows, and he tells it better every time." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. I knew a few of your kind in Stormwind, when I still had a title worth stealing, and I'll admit I miss their company more than the nobles'." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. The court in Stormwind was full of your kind, whispering in the nobles' ears, and I'll not pretend I trusted many of them." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. In Stormwind you'd be standing guard at some lord's door, but out here, at least, the panthers will give you a real fight." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Then you'll understand why I gave up a seat among the nobles for a tent in the mud, and you won't think me mad for it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid in a hunting camp! You'll think us barbarians, I expect, and some days I'd agree with you, but the panthers have never once lied to me." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. In Stormwind they'd call you a heathen, and once I'd have nodded along, but I've met nobles who could learn a thing from you." },
      },
      again = {
        { id = "h_again", text = "Yes? I've time; I have nothing but time, which is rather the point of exile." },
        { id = "h_again2", text = "Something further? Ask it, by all means." },
      },
      choices = {
        { text = "Do Stormwind's nobles fear the shamans of the Horde?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Did the House of Nobles ever fear what magic could do?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why did you leave the House of Nobles?", next = "nobles" },
        { text = "Panthers seem an odd choice of quarry.", next = "panthers" },
        { text = "What's in the letters they keep sending?", next = "letters", when = { metBefore = true } },
        { text = "My family sits in that House.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "The Defias drove my family off our farm.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "Did Stormwind's nobles treat their soldiers poorly, Sir Erlgadin?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why are panthers better company than nobles, Sir Erlgadin?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'll hunt panthers.", next = "END", fx = { affinity = 2 } },
        { text = "A paladin doesn't walk away from his post, Sir.", next = "k_paladin", when = { class = "PALADIN" } },
        { text = "Why do you miss rogues more than nobles, Sir Erlgadin?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why didn't you trust the court's mages, Sir Erlgadin?", next = "xmage", when = { class = "MAGE" } },
        { text = "This camp must need to take a good many panthers, Sir Erlgadin.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Would Stormwind's nobles fear a dwarf shaman, Sir Erlgadin?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not many humans hunt with a beast at their side.", next = "er_human", when = { race = "Human", class = "HUNTER" } },
        { text = "Would you ever keep a panther, Sir?", next = "er_panther", when = { class = "HUNTER" } },
        { text = "Good day, Sir.", next = "END" },
      },
    },
    er_human = {
      lines = { { id = "erh_default", text = "No, and in my day it would have been thought rather common. The nobles of Stormwind hunted with hounds and beaters and a dozen servants to carry the wine, and not one of them would have shared his supper with a wolf, which is precisely why you're a better hunter than any of them." } },
      choices = {
        { text = "The old ways had their dignity, Sir.", next = "BACK", reply = "They had their costumes, which isn't the same thing, though I wore them gladly enough once.", fx = { align = { order = 1 } } },
        { text = "Good riddance to hounds and beaters.", next = "BACK", reply = "Hear, hear. I'd drink to that, if Barnil hadn't hidden the wine again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    er_panther = {
      lines = { { id = "erp_default", text = "I've considered it, I'll admit, but a panther would know me for what I was the first night. A hunter's beast wants a master who keeps faith, and I broke faith with a whole House, so I hunt them and leave the keeping to better people than me." } },
      choices = {
        { text = "You're harder on yourself than they'd be.", next = "BACK", reply = "Perhaps, but someone has to be, and the House certainly won't.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    nobles = {
      big = true,
      lines = {
        { id = "n_default", text = "The stonemasons rebuilt our city, and the nobles refused to pay them. I sat in that hall and watched it happen, and I said nothing. What came of it is in Westfall now, wearing red masks, and I won't sit in that hall again." },
      },
      choices = {
        { text = "You can't undo it.", next = "nobles_undo", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Leaving was honest.", next = "BACK", reply = "It was the only honest thing I'd done in years, and it took me too long to do it. I'm glad you see it that way.", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "Running away fixes nothing. Go back and vote.", next = "nobles_vote", fx = { align = { order = 2 } } },
        { text = "Who else in that hall knew?", next = "nobles_who", fx = { trait = { curious = 1 } } },
        { text = "The Light forgives a man who stood by, if he's sorry.", next = "priest_forgive", when = { class = "PRIEST" } },
      },
    },
    nobles_undo = {
      lines = { { id = "nu_default", text = "No. I can only refuse to do it again, which is a small thing, but small things are what I have left." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nobles_vote = {
      lines = {
        { id = "nv_default", text = "And be one honest vote among a hundred purses? They'd count it, smile, and carry on. I'd rather build fires." },
      },
      choices = {
        { text = "One honest vote is still a vote.", next = "BACK", reply = "Still a vote, yes, and still lost every time. I'll build fires for honest men instead, and sleep easier for it.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "You're right, and the House of Nobles isn't worth saving.", next = "BACK", reply = "Perhaps not, though there are a few honest benches left in it. I'd not burn the whole hall, only the purses.", fx = { align = { order = -1 } } },
        { text = "Let's leave the nobles to their squabbling.", next = "BACK" },
      },
    },
    nobles_who = {
      lines = {
        { id = "nw_default", text = "All of us. That's the part nobody likes to hear. It wasn't one villain; it was a room full of men deciding it was someone else's purse." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" }, opinion = { defias = "nobles_to_blame" } } } },
    },

    panthers = {
      lines = {
        { id = "p_default", text = "A tiger tells you it's coming. A panther waits on a branch for you to be stupid. I spent years in a room full of panthers; I prefer the honest ones." },
      },
      choices = {
        { text = "And what does a panther teach you?", next = "panthers_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    panthers_teach = {
      lines = { { id = "pt_default", text = "To look up. Most people never do, and most nobles don't either, which is how the masons got as far as they did." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    letters = {
      lines = {
        { id = "l_default", text = "Votes, summons, and a cousin who'd like my seat if I'm not using it. They all start with my full title, which is how I know to burn them." },
      },
      choices = {
        { text = "I doubt you'll ever go back.", next = "letters_back" },
        { text = "Give the cousin the seat.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    letters_back = {
      lines = { { id = "lb_default", text = "When the masons are paid, which is to say, no. Ask me something with a better answer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    noble = {
      big = true,
      lines = {
        { id = "nb_default", text = "Then you'll have heard my name said unkindly over dinner. Do they still say I've gone native? I've gone honest, and they'd not know the difference." },
      },
      choices = {
        { text = "They say worse.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I left too, in my way.", next = "BACK", reply = "Then we're two of a kind, and I'm glad of it. The court never misses the ones who leave, only the coin they took with them.", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "They had their reasons for the masons.", next = "BACK", reply = "They had reasons, yes, and every one of them was gold. The masons had families, and that's all the reason I needed.", fx = { align = { honor = -1 }, affinity = -3, opinion = { defias = "nobles_justified" } } },
      },
    },

    farmhand = {
      big = true,
      lines = {
        { id = "fh_default", text = "Then I'm one of the men who put the knife in their hands. I won't ask your pardon. I'd only ask you not to give it too easily." },
      },
      choices = {
        { text = "You're not the one who burned the fields.", next = "BACK", reply = "No, but I sat with the men who did nothing to stop it, and that's near enough. I'll carry that, whatever you say.", fx = { affinity = 2, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "I won't.", next = "BACK", reply = "Good, and thank you. Pardon given too freely is worth nothing, and I'd rather earn it slowly.", fx = { align = { light = -1 }, affinity = 1, trait = { stern = 1 } } },
      },
    },
    priest_forgive = {
      lines = { { id = "pf_default", text = "Does it? Then the Light is kinder than the masons, and I'd sooner have theirs. Forgiveness from the people I failed would mean something. From above, it only feels convenient." } },
      choices = {
        { text = "Then seek theirs.", next = "BACK", reply = "I will, if they'll ever speak to me again. That's a road I'll walk the rest of my life, I expect.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Then take the Light's forgiveness and be done with it.", next = "BACK", reply = "I'd not feel it, and that's the trouble. The Light may forgive me, but I've not yet forgiven myself.", fx = { align = { honor = -1 } } },
        { text = "Both can be true.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    k_paladin = {
      big = true,
      lines = {
        { id = "xpa_default", text = "No, I don't suppose a paladin does, and I never claimed to be one. I walked away from a chamber of nobles who refused to pay the masons, and I'd sooner hunt panthers than share a bench with them, so judge me if you must." },
      },
      choices = {
        { text = "You should have stayed and fought them.", next = "BACK", reply = "Perhaps I should have, and some nights I think so. But I'd lost the stomach for it, and a man without stomach wins nothing in that hall.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Some benches deserve to stay empty.", next = "BACK", reply = "Some do, and mine's one of them. Let it gather dust, and let them wonder why.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Why did you leave the House of Nobles?", next = "nobles" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a count once, and I'm a hunter now, which is the only title I ever earned.", next = "nobles" } },
    advice = { { id = "tp_ad", text = "Read who's paying for something before you do it. It's the only question that matters, here or in Stormwind." } },
    defias = { { id = "tp_defias", text = "Cheated men, turned thieves. I'd hang the thieves, but I'd want the cheats hanged first." } },
    varian = { { id = "tp_varian", text = "I knew the king when he was a boy, before I left court, and he was a fine one. Whatever happened to him on that road, it was no accident, I'd stake my old title on it." } },
    bolvar = { { id = "tp_bolvar", text = "Bolvar Fordragon is a good soldier, and he keeps the court in line better than most would. I'd rather hunt panthers than deal with those nobles, though." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor arrived at court after my time, and from what I hear, she's taken it over. I'm very glad I left before I had to dance with her." } },
    stonemasons = { { id = "tp_stonemasons", text = "I remember the Stonemasons rebuilding the city, and I remember the nobles refusing to pay them. That was the beginning of the Defias, and the beginning of my disgust with court." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is rough and honest about it, which I prefer to the polished dishonesty of Stormwind's court. I'd sooner deal with pirates than nobles." } },
    _none = { { id = "tp_none", text = "I've no opinion on it. I've given up having opinions in public; they cost too much." } },
  },
}
