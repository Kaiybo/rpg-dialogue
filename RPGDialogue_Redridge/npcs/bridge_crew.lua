-- More of Foreman Oslow's crew on the Everstill Bridge: Dmitri and Jess.
-- Voice: bibles/bridge_crew.md
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bridge Worker Dmitri: the crew's careful old hand.
P:NPC {
  key = "dmitri", id = TODO_NPC("Bridge Worker Dmitri"), name = "Bridge Worker Dmitri",
  bible = "bibles/bridge_crew.md", role = "worker", tier = "service",
  communities = { "lakeshire" }, temper = { "calm" }, values = { "craft", "cautious" },
  notices = { "craft" },
  impression = {
    first = "The younger men tease him and listen to him anyway.",
    third = "{name} met Bridge Worker Dmitri, the careful old hand on Foreman Oslow's bridge crew.",
  },
  greetings = {
    { id = "g_default", text = "Careful where you stand, friend. That stone isn't set yet." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the bridge? Walk down the middle, if you please; the edges are still settling." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Engineering", "Blacksmithing" } },
      text = "You've a builder's eye, I think; you looked at the arch before you looked at me. So tell me, does that keystone look true to you?" },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If they do, it's a cranky one, because every stone has an opinion about where it sits. A dwarf ought to know that better than me, spirits or no." } },
      choices = {
        { text = "Set each stone with care, Dmitri. The bridge deserves it.", next = "BACK", reply = "It does, and so do the folk who'll cross it after we're gone. Spoken like a dwarf who's set a few stones of his own.", fx = { align = { order = 1 } } },
        { text = "Stones are stones. Lay them faster and finish the bridge.", next = "BACK", reply = "Faster, is it? Lay them fast and you'll lay them twice, friend, once now and once when the first cart puts them in the lake.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not with the stones, I'd guess, but with the Blackrock, certainly. Every time we set a span, some orc scout comes down out of the hills and sets fire to the scaffolding, and I'd like to see one of them try it with a mage watching." } },
      choices = {
        { text = "I'll guard the scaffolding while you work.", next = "BACK", reply = "That'd be a fine thing, and the lads would work twice as hard with a mage at their backs. Mind the scaffold poles; they burn quick.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather hunt the scouts up in the hills.", next = "BACK", reply = "Up in the hills, eh? Then I'll trust you to thin them out before they reach my scaffolds. Go careful up there.", fx = { align = { order = -1 } } },
        { text = "Something else, Dmitri.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Blackrock, from across the water, though they send the gnolls to do the dirty work at night. A warrior posted at the far end while we set the stones would let this crew finish before the rains." } },
      choices = {
        { text = "I'll guard the far end while you build.", next = "BACK", reply = "Then we'll have a span across before the week's out, I'd wager. You'll want a coat; the wind off the lake bites at dawn.", fx = { align = { order = 1 } } },
        { text = "Bridges are builders' work. I'll go hit the orcs at home.", next = "BACK", reply = "Hit them at home, and maybe they'll stay there, I'll grant you that. But a bridge still needs watching while it's built.", fx = { align = { order = -1 } } },
        { text = "Something else, Dmitri.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Gnolls, mostly, with their dogs, sniffing round the stone piles for tools to steal. And there's a great boar that roots about the lake shore, Bellygrub the children call him, who's knocked over two of my scaffolds already." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Gnolls, mostly, with their dogs, and a great boar the children call Bellygrub, who's knocked over two of my scaffolds already. Your {pet} is eyeing my lunch, {class}, and I'll not share it with a beast, though I might share it with you." },
      },
      choices = {
        { text = "I'll keep the gnolls off your stone piles.", next = "BACK", reply = "Thank you, and keep an eye on the piles at dusk, that's when the dogs come sniffing. The tools are worth more than gold to us.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt Bellygrub. The gnolls can steal what they like.", next = "BACK", reply = "Ha, Bellygrub's earned it, and the children will make a song about you. The gnolls are another matter, but I'll take what I can get.", fx = { align = { honor = -1 } } },
        { text = "Something else, Dmitri.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Then mind you bring back the right ones, because the last lad who fetched for me brought a mallet when I asked for a level. Those gnolls on the south bank don't know a chisel from a chicken bone, but they've taken both." } },
      choices = {
        { text = "Just the tools, returned as you left them.", next = "BACK", reply = "That's all I ask, the right tools and in one piece. You'd be surprised how rare that is.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll fetch them, and pinch a few gnoll trinkets too.", next = "BACK", reply = "Do as you please with the gnolls, so long as my level comes back straight. I'll not ask about the rest.", fx = { align = { honor = -1 } } },
        { text = "What's the hardest part of the work?", next = "hardest" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "You weren't meant to know that, friend, and I'll ask you not to tell the crew either, since they're nervous enough with orcs across the water. Every stone on this bridge I've laid true and clean, and that's how it'll stay." } },
      choices = {
        { text = "Clean stone is good stone. I'll leave it be.", next = "BACK", reply = "Good, and I'll sleep better for hearing it. Thirty years of clean stone, and I'd like to make it thirty-one.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A cursed stone or two would keep the orcs off.", next = "BACK", reply = "They would, and they'd keep my crew off as well, I'd wager. Clean stone, friend, or none at all.", fx = { align = { light = -1 } } },
        { text = "Who's on the crew?", next = "crew" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Two men when the Blackrock catapults hit, and a lad who went into the lake after a dropped chisel and never came up. Oslow cut their names into a stone in the first pier, and every time we lay a course above it, we stop for a moment." } },
      choices = {
        { text = "That's a fitting memorial. I'll bless that stone.", next = "BACK", reply = "That's kind, and the lads will stop for it, I know they will. Oslow will want to be there.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Stones don't remember. Finish the bridge and move on.", next = "BACK", reply = "We will finish it, friend, but not by forgetting. Every stone above that one is laid for them.", fx = { align = { light = -1 } } },
        { text = "Something else, Dmitri.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every hour of every day, and we get a guard for about one hour in three. The orcs don't care that it's a bridge for everybody, which I suppose is the trouble with orcs." } },
      choices = {
        { text = "Then I'll stand guard while the crew works.", next = "BACK", reply = "Then this crew will thank you, and so will I, though I'm not one for speeches. The far end is where we need you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Builders should carry their own swords, Dmitri.", next = "BACK", reply = "They do, when they can, but you can't set a stone with a sword in your hand. That's why we ask for guards.", fx = { align = { honor = -1 } } },
        { text = "Something else, Dmitri.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The old bridge stood longer than my grandfather lived and the fish never complained, so I'd say the lake has made its peace with stone. It's the catapult shot sinking in the shallows that worries me, because the murlocs have started building on it." } },
      choices = {
        { text = "Stone that's well laid belongs there. Build it properly.", next = "BACK", reply = "That's what I keep telling the lads. A well-laid stone sits in the lake like it grew there.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Give the lake its shallows back. Build less, and build lighter.", next = "BACK", reply = "Lighter? You'd have this bridge float off in the first spring flood. No, it's stone or nothing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Dmitri, and I've built more bridges than anyone on this crew, the foreman included, though I'd not say so in front of him. This one is the hardest, because people keep trying to knock it down while we build it." },
        { id = "h_tools", when = { questDone = TODO_QUEST("The Lost Tools") }, text = "You brought the foreman's tools up from the lake bottom. Those chisels are older than Jess, and they cut truer than anything we could buy in Stormwind." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf, on my bridge! Your people built the Thandol Span, and I'd give a year's wages to know how they set those foundations." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A gnome! You'll be thinking of some machine to lift these stones, I expect, and I'll tell you now the foreman doesn't trust machines." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Now there's a pair of shoulders that'd carry a stone or two, though I'd guess you'd rather swing at the orcs who keep knocking our work down." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll know the hills, then, and you'll know there's more than orcs out there watching us work." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll bless the foundations, I hope, because I've done everything else I can think of to keep them standing." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll know about building things that last, I'd think, since your order's been standing longer than most bridges." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'll ask you not to turn into anything large on my scaffolding, because I've measured what it'll bear and a bear isn't in the sums." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Can you lift a stone with a spell? No? Then you're no more use on this bridge than the foreman." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, eh? Measure twice before you call your lightning near my bridge, friend. These stones took us a year to set." },
      },
      again = {
        { id = "h_again", text = "What else? Talk slowly; I like to think while I listen." },
        { id = "h_again2", text = "Go on. The mortar needs a minute to set, and my back needs ten." },
      },
      choices = {
        { text = "Why is this bridge the hardest?", next = "hardest" },
        { text = "Building over open water can't be simple work.", next = "how" },
        { text = "What's the rest of the crew like?", next = "crew" },
        { text = "Who knocked the bridge down?", next = "who" },
        { text = "I could slip past the gnolls and fetch back what they stole.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Who keeps knocking down the Everstill Bridge, Dmitri?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What else watches the bridge crew, Dmitri?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Stone holds a curse well, you know.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Has the crew lost anyone building this bridge, Dmitri?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The crew looks as if it needs guarding while it works, Dmitri.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the bridge trouble the lake, Dmitri, or the fish below?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could a mage help with the Everstill Bridge, Dmitri?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the bridge stones have a spirit, Dmitri?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to your stones.", next = "END" },
      },
    },
    hardest = {
      lines = { { id = "h2_default", fx = { learn = { "everstill_bridge" } }, text = "Because the orcs sank our tools, the gnolls carried off our iron, and the rains will flood the footings if we're not done before they come. A bridge is patient work, and nobody has given us any patience." } },
      choices = {
        { text = "Will you finish in time?", next = "hardest_time" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest_time = {
      lines = { { id = "ht_default", text = "The foreman says yes, and he's never been wrong yet. I'd say perhaps, and I've never been disappointed yet, so between us we're usually right." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    how = {
      lines = { { id = "hw_default", text = "You build a dam of timber round each footing, pump the water out, and lay the stone in the mud as fast as you can before the dam leaks. It always leaks, and that's why we're cold and wet from dawn to dark." } },
      choices = {
        { text = "Sounds miserable.", next = "how_misery" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_misery = {
      lines = { { id = "hm_default", text = "It is, but when the last stone goes in and the first cart rolls across, you forget every cold morning. I've walked across bridges I built thirty years ago, and they still feel like mine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    crew = {
      lines = { { id = "c_default", text = "Trent's the strongest and grumbles the most, Jess is the youngest and talks the most, and Alex, Daniel and Matthew do the work and keep their heads down. I'm the one who tells them all when they've laid a stone crooked." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      big = true,
      lines = { { id = "w_default", fx = { learn = { "blackrock" } }, text = "The Blackrock, when they came over the hills. They burned the old span so Lakeshire couldn't send for help, and they'd do it again if they could, so we keep one eye on the far shore while we work." } },
      choices = {
        { text = "Then the town should wall the bridge and guard it.", next = "BACK", reply = "That's what I've told Oslow for a year, and he agrees, and then the Marshal can't spare the men. Maybe you'll have better luck asking.", fx = { align = { order = 1 } } },
        { text = "Then strike the Blackrock first, before they strike again.", next = "BACK", reply = "Then go and strike them, and I'll set the stones faster for knowing you're up there. Just come back down in one piece.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stonemasons = { { id = "tp_stonemasons", text = "I learned my trade beside men who later joined the Stonemasons' Guild in Stormwind, and some of them went west and joined the Defias after the nobles refused to pay them. I don't defend them, but I know what unpaid work does to a man." } },
    thandol_span = { { id = "tp_thandol_span", text = "The dwarves built the Thandol Span to last a thousand years, and they did it without a foreman shouting at them, which I'd like Oslow to hear. Now the Dark Irons have been blowing chunks out of it, and that is a sin against good masonry." } },
    second_war = { { id = "tp_second_war", text = "Half this valley was rebuilt after the Second War with hands like mine, and I remember laying stone over ash. I'd sooner the Everstill Bridge were the last thing I build for the orcs to burn." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "I carried stone for the gate at the Valley of Heroes when I was younger than Jess is now. The statues came later, from finer hands than mine, and I still look up at them when I'm in the city." } },
    background = { { id = "tp_bg", text = "I've built bridges from Westfall to Redridge, and I came to Lakeshire because this one needed someone who'd done it before." } },
    advice = { { id = "tp_ad", text = "Measure twice and lift once, friend. It holds for stones and for most other things." } },
    everstill_bridge = { { id = "tp_bridge", text = "My last bridge, I think, and I mean it to stand longer than I do.", next = "hardest" } },
    _none = { { id = "tp_none", text = "I wouldn't know. Ask me about stone, or arches, or mortar." } },
  },
}

-- Bridge Worker Jess: the youngest on the crew.
P:NPC {
  key = "jess", id = TODO_NPC("Bridge Worker Jess"), name = "Bridge Worker Jess",
  bible = "bibles/bridge_crew.md", role = "worker", tier = "service",
  communities = { "lakeshire" }, temper = { "eager" }, values = { "loyal", "hardworking" },
  notices = { "class" },
  impression = {
    first = "He talks as fast as he works, which is very fast.",
    third = "{name} met Bridge Worker Jess, the youngest of Foreman Oslow's bridge crew.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Are you here to fight the gnolls? You look like you're here to fight the gnolls." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, so tell me you fought something out there, because I've been dying to know!" },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Look at that armour! I'd give a month's wages to wear something like that, though I'd probably sink straight to the bottom of the lake in it." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You're a mage? Could you lift a stone with magic, just a small one? Dmitri says it doesn't work like that, but Dmitri says that about everything." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Only in stories about the orcs, and those weren't nice stories. You're a dwarf, though, and you're on our side, so that's different, isn't it?" } },
      choices = {
        { text = "It's different, Jess. A shaman can stand for the Alliance.", next = "BACK", reply = "I knew it, and I told Trent, and he didn't believe me! I'm glad you're on our side, really I am.", fx = { align = { honor = 1 } } },
        { text = "Stories are stories. Judge for yourself who's dangerous.", next = "BACK", reply = "Judge for myself, oh, that's a lot of work, but I'll try. You seem nice, anyway, so that's a start.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than anything, but the foreman says I'd drop a sword like I drop the stones, which is only sometimes! Still, the soldiers at the barracks let me watch them drill, and I practise with a stick when nobody's looking." } },
      choices = {
        { text = "Keep practising, Jess. Every warrior started with a stick.", next = "BACK", reply = "Really? I'll practise twice as hard, then, and maybe someday I'll show Oslow he's wrong. Not today, though, he's watching.", fx = { align = { honor = 1 } } },
        { text = "Stick to stones, lad. Soldiering's a hard road.", next = "BACK", reply = "That's what Mum says too, and Oslow, and Dmitri. I'll stick to stones, then, but I'll still practise with the stick.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jess.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only from the bridge, but I've seen condors as big as a cart, and boars with tusks like scythes, and once a spider the size of my head! The foreman says I imagine half of it, but I didn't imagine the spider." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Only from the bridge, but I've seen condors as big as a cart and once a spider the size of my head! Can I pet your {pet}? Just once? I'll be careful, I promise." },
      },
      choices = {
        { text = "Watch the beasts from the bridge, Jess. That's the safe way.", next = "BACK", reply = "That's what Dmitri says, but the bridge is awfully far from the good bits. I'll try, though.", fx = { align = { honor = 1 } } },
        { text = "Go see for yourself. You'll never learn on a bridge.", next = "BACK", reply = "Do you think so? I'd love to, really I would, but Oslow would have my ears. Maybe on my day off.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jess.", next = "BACK" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Do I want to see it? Light, yes, I do, and also no, because Oslow says the last time something with horns came near the bridge we lost a crate of mortar. Can it carry stone? Because if it can carry stone, Oslow might forgive it." } },
      choices = {
        { text = "Nothing with horns belongs near your bridge. I'll send it off.", next = "BACK", reply = "Oh, good, that's a relief, and Oslow would thank you twice. I'll stand right behind you while you do it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It answers to me. Best keep your distance.", next = "BACK", reply = "Distance, right, yes, plenty of distance, I'll stay over here by the mortar. Does it at least wave?", fx = { align = { light = -1 } } },
        { text = "Why do you want adventure so badly?", next = "adventure" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Only when the horns go off up in the hills, and then I'm frightened all at once and then not at all, because the foreman shouts and there's no time. Nights are worse, so I say the prayers my mother taught me, though I'm never sure I've got them right." } },
      choices = {
        { text = "Any prayer meant from the heart is said right, Jess.", next = "BACK", reply = "Really? Then I'll keep saying them, and maybe I'll stop worrying I've got the words wrong. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't stop an orc, Jess. Learn to fight instead.", next = "BACK", reply = "I'd love to learn, honestly, but who'd carry the stones? Maybe both, if Oslow lets me.", fx = { align = { light = -1 } } },
        { text = "Something else, Jess.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I hope so, and Dmitri says the hoping is how the standing starts. I carried a stone right up the scaffold the last time the horns blew, and I didn't drop it, so that's something, isn't it?" } },
      choices = {
        { text = "That's courage, Jess. Stand by your crew and you'll do fine.", next = "BACK", reply = "I will, I promise, and I'll tell Dmitri you said so. He'll pretend not to care, but he'll be pleased.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Run if they come. A dead hero builds no bridges.", next = "BACK", reply = "Run? I couldn't, not with the crew still up there. But I'll think about it, I suppose.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jess.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Once, to fetch Dmitri's level from the far bank, and I ran both ways because the gnolls were watching from the trees. The hills are beautiful, though, when nobody's shooting at you, and I'd like to see them properly someday." } },
      choices = {
        { text = "Stay with the crew, Jess. The bridge needs you here.", next = "BACK", reply = "You're right, they do, and I'd feel awful leaving them short-handed. Someday, though.", fx = { align = { order = 1 } } },
        { text = "Go and see them someday. Life's more than carrying stone.", next = "BACK", reply = "Someday, I will, and I'll bring Dmitri, and he'll complain the whole way. That'll be a fine day.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Jess, and I carry stone for Foreman Oslow, which isn't very exciting, but it's for the bridge, and the bridge is important. Everyone says so, especially the foreman." },
        { id = "h_bridge", when = { questDone = TODO_QUEST("The Everstill Bridge") }, text = "You're the one who got our iron back from the gnolls! I told everyone at the inn about it, and I made it sound even better than it was, I hope you don't mind." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Are you one of Lucius's lot? He teaches the quiet trade down on the docks, and I'm not supposed to know about it, so please forget I asked." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! A real one, with real armour and everything! Is it heavy? It looks heavy, but I suppose you're used to it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! With a real beast and everything! Can it do tricks? I bet it can do tricks, and I bet it bites gnolls." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Are you here to bless the bridge? Somebody should, because Dmitri says it's cursed, though I think he's only joking." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! A real one! Is it true you can heal people just by touching them? Could you show me sometime?" },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "You're a real druid, and a night elf besides! I've never seen either before today, and I'd love to see the bear, if you'd show me." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! A real one? Can you call lightning? Can you do it now? I won't tell Oslow, honest." },
      },
      again = {
        { id = "h_again", text = "What else? Dmitri's not looking, so I've a minute." },
        { id = "h_again2", text = "Ask me anything! Well, anything about bridges, I don't know much else." },
      },
      choices = {
        { text = "Why did you join the crew?", next = "why" },
        { text = "Have you ever seen the Blackrock?", next = "orcs" },
        { text = "Foreman Oslow seems to shout at everyone.", next = "oslow" },
        { text = "Do you want to be an adventurer?", next = "adventure" },
        { text = "Do you want to see what I keep at my heel, Jess?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you want to be a warrior someday, Jess?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have you seen the beasts in the hills, Jess?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "This work must frighten you some days, Jess.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you stand your ground if the orcs came for the bridge?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Have you ever gone past the bridge, Jess, into the hills?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Have you ever seen a shaman before, Jess?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Back to work, Jess.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the orcs burned the bridge and I wanted to do something about it, and I'm no good with a sword. The foreman said a strong back was nearly as useful, so here I am." } },
      choices = {
        { text = "Nearly as useful?", next = "why_useful" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_useful = {
      lines = { { id = "wu_default", text = "He said soldiers keep the orcs off the bridge, but somebody has to build it first, or there's nothing for the soldiers to guard. I think that was a compliment, but it's hard to tell with him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "o_default", text = "Only from across the lake, and only once close enough to see their faces. One of them shot an arrow at me, and it went into the plank next to my hand, and Dmitri made me keep the plank so I'd remember to keep my head down." } },
      choices = {
        { text = "That must have frightened you.", next = "orcs_fear" },
        { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } },
      },
    },
    orcs_fear = {
      lines = { { id = "of_default", text = "I was so frightened I dropped a whole bucket of mortar into the lake. The foreman was angrier about the mortar than the arrow, which made me feel better, somehow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    oslow = {
      lines = { { id = "os_default", text = "He shouts a lot, but he's never once let anyone work on the edge without a rope. Trent says Oslow once bought him an ale for laying a straight stone, and I've been trying to lay a straight one ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    adventure = {
      big = true,
      lines = { { id = "a_default", text = "Sometimes I do, when I see someone like you come through with a sword and a story. But then I look at the bridge and think, somebody has to stay and build things, don't they?" } },
      choices = {
        { text = "Building is braver than fighting. Stay.", next = "BACK", reply = "Braver? I never thought of it like that, but maybe you're right. I'll stay, then, and build something that lasts.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Go, while you're young. The bridge will wait.", next = "BACK", reply = "You really think so? I'll think about it, honestly, though I'd miss the crew terribly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I went to the Darkmoon Faire last time it was by Goldshire, and I rode the steam tonk, and I lost every copper I had on the ring toss! It was the best day of my whole life, and I'd do it again tomorrow." } },
    deadmines = { { id = "tp_deadmines", text = "Is it true there's a whole pirate ship hidden in a mine under Westfall? Trent says it's a story, but Trent says that about everything good, so I think it must be real." } },
    booty_bay = { { id = "tp_booty_bay", text = "A sailor at the inn told me Booty Bay is built right inside a giant skull of some sea beast, and the goblins sell everything there is to sell. I'm going to see it one day, once the bridge is finished and Oslow lets me go." } },
    onyxia = { { id = "tp_onyxia", text = "There's a dragon down in some swamp across the sea, a real black one, and they say she sleeps on a pile of gold as big as the Everstill. I'd only want to look at her, from very far away, with somebody brave beside me." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "The Valley of Heroes has statues taller than three of me, and I stood under them for an hour the first time I went to Stormwind. Do you think anyone gets a statue for building a bridge?" } },
    background = { { id = "tp_bg", text = "I grew up on a farm near Lakeshire and came into town when the orcs came, same as half the crew." } },
    advice = { { id = "tp_ad", text = "Keep your head down near the water, Dmitri says, and I've never once regretted listening to him." } },
    everstill_bridge = { { id = "tp_bridge", text = "It's going to be the best bridge in Redridge, and I'll be able to say I carried some of it.", next = "why" } },
    _none = { { id = "tp_none", text = "Oh, I don't know about that. Ask Dmitri, he knows everything." } },
  },
}
