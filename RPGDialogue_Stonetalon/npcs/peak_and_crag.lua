-- Stonetalon Peak's two traders, Chylina (general supplies) and Illyanie (cloth armour), both Alliance;
-- and Piznik, Ziz Fizziks's man inside Windshear Mine (Gerenzo's Orders). Voice: bibles/peak_and_crag.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Chylina: night elf general supplies at Stonetalon Peak.
P:NPC {
  key = "chylina", id = TODO_NPC("Chylina"), name = "Chylina", title = "General Supplies",
  bible = "bibles/peak_and_crag.md", role = "vendor", tier = "service",
  communities = { "stonetalon_peak" }, temper = { "brisk", "kind" }, values = { "duty", "nature" },
  notices = { "race", "purse", "weary" },
  impression = {
    first = "She treats anyone who climbs this high as slightly foolish.",
    third = "{name} met Chylina, who sells supplies to the druids and travellers on Stonetalon Peak.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You made the climb, friend! Here, the coolest water, saved for you. Then tell me what you need." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You made the climb. Water's there. Take it, and tell me what else you want." },
    { id = "g_default", text = "You made the climb, so you'll want water first, and then whatever you forgot to bring." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the Peak. Did the throwing knives serve you well, or are you here to complain about them?" },
    { id = "g_away", when = { away = 14 }, text = "It's been {away} since you were up here. The druids planted a whole slope while you were gone, and half of it is still alive." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah, sister's child. It's good to see someone from home up here, because the Peak gets lonely between the druids' visits." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, all the way up here. You'll want the heavy shot, I expect, since you lot would rather shoot a harpy than throw anything at it." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome. If you're going down to Gaxim's camp below the Crag, take him some bread, because I don't think he remembers to eat." },
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "Your purse is light, so buy water and nothing else, and I won't think less of you for it." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look as if the mountain fought you all the way up. Faralia has a bed, and I have bandages, so start with one of us." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Chylina, and I keep the supplies for the Peak: food, water, shot and throwing knives, and bags for whoever needs to carry seedlings down to the vale. Everything comes up by hippogryph, so nothing here is cheap, and nothing is wasted." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Circle, come to see the Keeper. You'll want water and a little food, and then you'll forget to eat for three days, like all the rest of them." },
      },
      again = {
        { id = "h_again", text = "What else? I have time, which is the one thing up here that isn't rationed." },
        { id = "h_again2", text = "Ask, then. The hippogryphs won't land for another hour." },
      },
      choices = {
        { text = "Who buys supplies this high up?", next = "buyers" },
        { text = "Why throwing knives?", next = "knives" },
        { text = "What's the trouble below?", next = "trouble" },
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Hippogryphs carry everything up here?", next = "hippo" },
        { text = "Keeper Albagorm. What's he like?", next = "keeper" },
        { text = "Elune keep you, Chylina.", next = "END" },
      },
    },

    buyers = {
      lines = {
        { id = "bu_default", text = "The druids, who forget everything, and the Sentinels, who forget nothing, and travellers from Ashenvale who didn't know how high the Peak was. Gaxim's camp down by the Crag sends for bread now and then, though I suspect it goes into his machines." },
      },
      choices = {
        { text = "What do you make of Gaxim?", next = "buyers_gaxim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_gaxim = {
      big = true,
      lines = {
        { id = "bg_default", text = "He means well, and he's loud, and he has blown up more of the mountain than the goblins have this season. Kaela trusts him, so I sell to him, but I'd rather the forest were saved by planting than by powder." },
      },
      choices = {
        { text = "His powder will stop the goblins faster.", next = "BACK", reply = "Faster, perhaps, but the mountain will remember every blast. I'll sell him what he needs, and pray the trees forgive us both.", fx = { align = { order = -1 } } },
        { text = "The druids' way is slower, but it's the right one.", next = "BACK", reply = "It is, and it's the way of the kaldorei. Elune taught us patience long before any gnome taught anyone powder.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    knives = {
      lines = {
        { id = "kn_default", text = "Because the harpies land on the rocks just out of reach and scream at you, and a knife in the throat is the only answer they understand. The Sentinels taught me to throw, and I taught the travellers, and the harpies have learned to land further off." },
      },
      choices = {
        { text = "You've fought them yourself?", next = "knives_fought" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knives_fought = {
      lines = {
        { id = "kf_default", text = "Once or twice, when they came for the supply bags, and I'm not proud of how loud I shouted. A trader should keep her stall, but nobody told the harpies that." },
      },
      choices = {
        { text = "I'd have shouted too.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    trouble = {
      lines = {
        { id = "tr_default", text = "The Venture Company saws at the forest to the south, the Bloodfury harpies hold the Charred Vale, and the Horde have a camp at Sun Rock that the Sentinels watch very closely. Keeper Albagorm says the mountain has seen worse, and I hope he's right." },
      },
      choices = {
        { text = "Does the Horde trouble the Peak?", next = "trouble_horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_horde = {
      big = true,
      lines = {
        { id = "th_default", text = "Not yet, though there's a blood elf among them who hates the druids, and the Sentinels say she's sent killers to the Talon Den. Some of us want the Sentinels to go down and burn Sun Rock first, and I'm not one of them, though I understand why they ask." },
      },
      choices = {
        { text = "Strike Sun Rock before they strike the Peak.", next = "BACK", reply = "That is what the angry ones say, and I understand their fear. But striking first is how the forest burns, and I want no part of it.", fx = { align = { light = -1 } } },
        { text = "Guard the Den, and leave Sun Rock alone.", next = "BACK", reply = "That is what I would choose too. Sun Rock has never once climbed this high, and I'd rather not give them a reason.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hippo = {
      lines = { { id = "hg_default", text = "Everything that can't climb, from flour to arrowheads, and they complain about every sack. The flight master at the Peak flies them in from Astranaar, and on windy days half the bread arrives as crumbs. I sell the crumbs to the druids, who never notice." } },
      choices = {
        { text = "Does the wind ever ground them?", next = "hippo2" },
        { text = "Crumbs to the druids. That's shameless.", next = "hippo2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hippo2 = {
      lines = { { id = "hg2_default", text = "Often, in spring, and then the Peak eats what's in the storeroom and the Sentinels go hunting. Shameless, perhaps, but a druid who's been in the Dream three days doesn't care whether his bread is whole. I give them extra honey to make up for it." } },
      choices = { { text = "Extra honey. Fair enough. Something else.", next = "BACK" } },
    },
    keeper = {
      lines = { { id = "kp_default", text = "Old, and kind, and much harder to move than the mountain he keeps. Keeper Albagorm is an ancient, and he speaks slowly, and the druids hang on every word. I asked him once what he thought of the goblins, and he answered me three days later." } },
      choices = {
        { text = "What did he say?", next = "keeper2" },
        { text = "An ancient has all the time in the world.", next = "keeper2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keeper2 = {
      lines = { { id = "kp2_default", text = "He said that goblins are like a fire in summer grass, quick and loud, and gone long before the roots notice. Then he asked me for water. I think he's right about the roots, but I'm not a root, and I'd like them gone sooner." } },
      choices = {
        { text = "I'm a druid. I'll speak with the Keeper myself.", next = "BACK", reply = "Then bring water, and clear your afternoon. Maybe your week.", when = { class = "DRUID" } },
        { text = "Something else, Chylina.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I kept the stores at Astranaar before the Keeper asked for someone up here. The view is better, and the work is the same." } },
    advice = { { id = "tp_ad", text = "Carry water from the Peak. The springs below taste of ash." } },
    sentinels = { { id = "tp_sent", text = "They keep the Peak safe and pay for their bread on time, which is more than the druids manage." } },
    _none = { { id = "tp_none", text = "I don't know. Ask Faralia; everyone tells the innkeeper things they'd never tell a trader." } },
  },
}

-- Illyanie: night elf cloth armour merchant at Stonetalon Peak.
P:NPC {
  key = "illyanie", id = TODO_NPC("Illyanie"), name = "Illyanie", title = "Cloth Armor Merchant",
  bible = "bibles/peak_and_crag.md", role = "vendor", tier = "service",
  communities = { "stonetalon_peak" }, temper = { "wry", "precise" }, values = { "craft", "beauty" },
  notices = { "class", "craft", "kit" },
  impression = {
    first = "She looks at people's clothes before their faces.",
    third = "{name} met Illyanie, who sells cloth armour on Stonetalon Peak.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, you. Let me show you the finest cloth, friend, the kind I keep for those who appreciate it." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Cloth, padded and plain. Let me see your measurements. And keep your hands off the silk." },
    { id = "g_default", text = "Cloth, padded and plain, for those who cast instead of block. Let me see what you're wearing, and I'll be honest about it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and you're still wearing my padding, I see. Good; it suits you better than it suited the last owner." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You wear cloth for a living, so you'll know the difference between good padding and a sack with sleeves. Most people who climb up here don't." },
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You're in the wrong shop, unless you're buying a gift for someone who casts, or you've come to admire the stitching." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor. Look at the seams before you buy, and if you can do better, I'd like to see it." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "You climbed the whole mountain in that? Then you've come to the right stall, and you should sit down before you catch a chill." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Illyanie, and I sell cloth armour to the Peak's priestesses, the druids who don't wear hide, and anyone else who'd rather not be stabbed while casting. I make some of it and buy the rest from Darnassus, and I'll tell you which is which if you ask." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm only mending a hem." },
        { id = "h_again2", text = "Ask, then. The light's still good for sewing." },
      },
      choices = {
        { text = "Which pieces did you make?", next = "made" },
        { text = "Does cloth really stop a blade?", next = "blade" },
        { text = "Why sell up here?", next = "why" },
        { text = "Let me see your armour.", next = "BUSINESS" },
        { text = "Who buys your cloth, besides the priestesses?", next = "buyers" },
        { text = "Darnassus sends cloth this far?", next = "darnassus" },
        { text = "Farewell, Illyanie.", next = "END" },
      },
    },

    made = {
      lines = {
        { id = "ma_default", text = "The padded pieces, with the double stitching down the sides, because I quilt the layers with mountain wool. The thin ones come from Darnassus, and they're pretty, but they'd tear on the first harpy talon." },
      },
      choices = {
        { text = "Mountain wool? From where?", next = "made_wool" },
        { text = "Something else.", next = "BACK" },
      },
    },
    made_wool = {
      big = true,
      lines = {
        { id = "mw_default", text = "From the goats on the high slopes, combed out in spring when they shed, and the druids made me promise I'd never shear one. I'd have done it faster with shears, but a promise is cheaper than a quarrel with a druid." },
      },
      choices = {
        { text = "Keep the promise. The goats deserve it.", next = "BACK", reply = "Good, because the druids would never let me forget it. The goats seem grateful, in their way.", fx = { align = { honor = 1 } } },
        { text = "Shears would be quicker. The goats won't mind.", next = "BACK", reply = "They wouldn't mind, but the druids would, and they have very long memories. A promise is a promise, even to a goat.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    blade = {
      lines = {
        { id = "bl_default", text = "Not well, I'll be honest, but it turns a glancing cut and keeps a stone from breaking your ribs, and that's often the difference. Mostly it lets you keep casting when a lighter robe would leave you bleeding." },
      },
      choices = {
        { text = "Honest answer. I like that.", next = "BACK", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "Do you stitch anything into the cloth?", next = "blade_wards" },
        { text = "Something else.", next = "BACK" },
      },
    },

    blade_wards = {
      lines = {
        { id = "bw_default", text = "A moon-thread along the inside hem, which the priestesses say carries Elune's blessing and which I say keeps the hem from fraying. We've agreed to both be right, and they buy more of it that way." },
        { id = "bw_priest", when = { class = "PRIEST" }, text = "A moon-thread along the inside hem; the Sisters say it carries Elune's blessing, and you'd know better than I whether your Light minds sharing a robe with her. It certainly keeps the hem from fraying." },
      },
      choices = {
        { text = "Faith and good stitching. Both count.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because the priestesses here kept coming to me with their robes in shreds from the climb, and I got tired of mending them for nothing. So I started selling instead, and now I mend them for a little something." },
      },
      choices = {
        { text = "A sensible trade.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Farewell, Illyanie.", next = "END" },
      },
    },
    buyers = {
      lines = { { id = "by_default", text = "Gaxim's lot, down at the Crag, which surprised me. He's a gnome mage with more pockets than sense, and he wears through a robe every fortnight from crawling into goblin machines. I've stopped selling him the pretty ones." } },
      choices = {
        { text = "What does he do in the goblin machines?", next = "buyers2" },
        { text = "A mage crawling into shredders. That's bravery of a kind.", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "by2_default", text = "Takes them apart, so he says, to learn how to stop them. Mostly he comes back singed and delighted. Kaela Shadowspear keeps him in check, and buys his robes for him when he forgets, which is more often than not." } },
      choices = {
        { text = "Then Kaela must be a patient woman.", next = "buyers3" },
        { text = "Something else, Illyanie.", next = "BACK" },
      },
    },
    buyers3 = {
      lines = { { id = "by3_default", text = "Kaela is a Sentinel, which means she's patient until the moment she isn't. I sold her a cloak once and she asked for the hem taken up so it wouldn't catch on a glaive. That's the most practical thing anyone has ever said to me on this mountain." } },
      choices = { { text = "Practical Sentinels. Something else.", next = "BACK" } },
    },
    darnassus = {
      lines = { { id = "dn_default", text = "It does, by way of Auberdine and Astranaar, and it costs three times what it did in Darnassus by the time it gets here. The weavers there make it fine and thin, for a city under Teldrassil's leaves, not for a mountain where the wind takes your skin off." } },
      choices = {
        { text = "Then why buy it at all?", next = "darnassus2" },
        { text = "Fine and thin has its place, surely.", next = "darnassus2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darnassus2 = {
      lines = { { id = "dn2_default", text = "Because the priestesses like to look like priestesses, and I like to be paid. I line it with my mountain wool, and then it's pretty and useful both, which is the only kind of thing I want my name on." } },
      choices = {
        { text = "I'm a priest. Pretty and useful suits me.", next = "BACK", reply = "Then you'll be my favourite customer today. Let me see your hems.", when = { class = "PRIEST" } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned to sew in Darnassus and to sell on the road. The road taught me more." } },
    advice = { { id = "tp_ad", text = "Mend a tear the day you get it. Tomorrow it'll be twice as long." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask me about seams." } },
  },
}

-- Piznik: goblin miner in Windshear Mine, secretly gathering information for Ziz Fizziks.
P:NPC {
  key = "piznik", id = TODO_NPC("Piznik"), name = "Piznik",
  bible = "bibles/peak_and_crag.md", role = "questgiver", tier = "quest",
  communities = { "windshear_crag" }, temper = { "jumpy", "bitter" }, values = { "ambitious", "loyal" },
  notices = { "race", "class", "stealth" },
  impression = {
    first = "He resents Gerenzo with his whole heart.",
    third = "{name} met Piznik, a demoted Venture Company goblin mining in Windshear and spying for Ziz Fizziks.",
  },

  greetings = {
    { id = "g_default", text = "Keep it down, keep it down, pal, the foreman's got ears like a bat and a pay docket like a dragon." },
    { id = "g_orders", when = { questActive = TODO_QUEST("Gerenzo's Orders") }, text = "I'm diggin', I'm diggin'! Watch the tunnel, because if a patrol comes round that corner, we're both out of a job, and out of a lot more besides." },
    { id = "g_orders2", when = { questActive = TODO_QUEST("Gerenzo's Orders (2)") }, text = "You still here? Get that ore to Ziz, pal, because every minute it's in this mine is a minute somebody can ask me where it went." },
    { id = "g_done", when = { questDone = TODO_QUEST("Gerenzo's Orders (2)") }, text = "Ziz got the ore? Then I'm a goblin with prospects again, and that's worth more than every pick in this mine." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I've dug about a mile of tunnel since, at Gerenzo's rates, which come to about nothin' an hour." },
  },

  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Another goblin! Venture or Steamwheedle? Never mind, don't tell me, because what I don't know I can't sell, and I'm tempted to sell everything right now." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, in a Venture mine? Pal, the boss here is one of yours gone green and rotten, so stand behind the cart before somebody thinks you're his cousin." },
    { id = "n_rogue", cat = "stealth", when = { stealthed = true },
      text = "Whoa, whoa, where'd you come from? Do that again and I'll put you on the payroll, because Ziz could use a dozen like you." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Don't do anything glowy down here, pal, because the ore does funny things when there's magic about, and I'd like to keep my eyebrows." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Name's Piznik, and once upon a time I was the second most important goblin at this whole dig, with a desk, and a stool, and a pencil of my own. Then Gerenzo took over, fired my boss Ziz, and sent me down here to swing a pick like a common peon." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Gerenzo's Orders") },
          text = "Listen, listen, Ziz told me to stay put and keep my eyes open, because his new boss pays good coin for anything on Gerenzo's plans. And what I know is Gerenzo's got the whole crew digging out a gold-green ore, crates of it, and nobody'll say what for." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Gerenzo's Orders") },
          text = "Keep your eyes on the tunnel while I chip a sample loose. There's workers and patrols wandering through here all day, and if they catch us it gets ugly fast, so swing first and explain later." },
        { id = "h_done1", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gerenzo's Orders"), days = 3 } },
          text = "That was dicey, pal, real dicey, and we've drawn more attention than a goblin with a full purse at a gnoll camp. But we've got the sample, and that's the part that matters." },
        { id = "h_after", when = { questDone = TODO_QUEST("Gerenzo's Orders (2)") },
          text = "Ziz says the ore's worth looking into, which in goblin means it's worth a fortune. I'm still down here, mind, but I'm a spy now, not a peon, and the pay's better even if the hours aren't." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, eh? The tauren up at Sun Rock hate this outfit worse than the elves do, and I don't blame 'em, but I'm not Venture anymore, not in my heart, so keep the axe down." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talk quick, the foreman counts picks." },
        { id = "h_again2", text = "Something more? Make it worth the risk, because standing still costs me wages." },
      },
      choices = {
        { text = "What happened with Gerenzo?", next = "gerenzo" },
        { text = "What's this ore?", next = "ore" },
        { text = "Who's Ziz working for now?", next = "boss" },
        { text = "What's it like working for the Venture Company?", next = "venture" },
        { text = "What do I do if a patrol comes?", next = "patrol", when = { questActive = TODO_QUEST("Gerenzo's Orders") } },
        { text = "What will you do now, Piznik?", next = "after", when = { questDone = TODO_QUEST("Gerenzo's Orders") } },
        { text = "I'm listening. What do you need?", next = "BUSINESS" },
        { text = "Good luck down here, Piznik.", next = "END" },
      },
    },

    gerenzo = {
      lines = {
        { id = "ge_default", text = "Gerenzo Wrenchwhistle is a gnome, pal, a sick green one out of Gnomeregan, and the company hired him over Ziz's head and let him fire Ziz in front of the whole crew. He said Ziz was too soft, and Ziz was the only foreman who ever let us eat lunch sitting down." },
      },
      choices = {
        { text = "The Venture Company hired a gnome?", next = "gerenzo_arm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gerenzo_arm = {
      lines = {
        { id = "ga_default", text = "Shocked me too, and the whole crew, and I hear Undermine's not thrilled either. He's rotting where he stands and he's bolted metal on where the flesh gave out, an arm that clanks and grabs, and I only say that down here, where the rock's thick." },
      },
      choices = {
        { text = "Does he deserve what's coming?", next = "gerenzo_deserve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gerenzo_deserve = {
      big = true,
      lines = {
        { id = "gd_default", text = "Every copper of it, pal, and I'd like a front seat. But I'm a goblin, so I'll settle for him losing his job the way Ziz did, with everybody watching and nobody helping." },
      },
      choices = {
        { text = "Then let's see him lose more than his job.", next = "BACK", reply = "Now you're speakin' my language, pal, though I'll leave the details to you. I'll bring the popcorn.", fx = { align = { light = -1 } } },
        { text = "Losing his job is enough. Nobody needs to die.", next = "BACK", reply = "Fair enough, pal, a public firing is plenty. Watching his face will be worth every copper I didn't earn.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ore = {
      lines = {
        { id = "or_default", text = "Gold-green, heavy, warm when you hold it too long, and Gerenzo's had us digging out crates of it since he got here. Nobody on the crew knows what it's for, and the ones who asked got moved to the deep tunnels." },
        { id = "or_done", when = { questDone = TODO_QUEST("Gerenzo's Orders (2)") },
          text = "Ziz has the sample now, and he says it's worth something to somebody important, which is goblin for a fortune. I still don't know what it does, and I've stopped holding it in my bare hands, just in case." },
      },
      choices = {
        { text = "Warm? That doesn't sound safe.", next = "ore_warm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_warm = {
      lines = {
        { id = "ow_default", text = "Safe's a relative term in a Venture mine, pal. One of the boys slept on a sack of it for a week and woke up with his hair standing straight up, and it's still standing, and he's still on the payroll, so you tell me." },
      },
      choices = {
        { text = "I'll be wearing gloves, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    boss = {
      lines = {
        { id = "bo_default", text = "Ziz set up camp on the western side of the Crag and he's got a new boss now, somebody down Ratchet way who pays well for anything that makes Gerenzo look bad. I don't ask who, because a goblin who asks too many questions gets fewer answers and more tunnels." },
      },
      choices = {
        { text = "You're spying without knowing who for?", next = "boss_blind" },
        { text = "Why should I trust a Venture goblin?", next = "trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boss_blind = {
      big = true,
      lines = {
        { id = "bb_default", text = "I'm spying for Ziz, and Ziz is spying for somebody, and the coin comes down the line, and that's how business works. It's not loyalty, exactly, but Ziz kept me fed, and that's close enough for a goblin." },
      },
      choices = {
        { text = "That is loyalty, whatever you call it.", next = "BACK", reply = "Huh, maybe it is, pal, and don't tell anybody I said so. Ziz kept me fed, and that counts for something.", fx = { align = { honor = 1 } } },
        { text = "Follow the coin. It's the only sensible thing.", next = "BACK", reply = "Exactly, pal, and the coin always knows the way. You'd make a fine goblin, I mean that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    venture = {
      lines = {
        { id = "ve_default", text = "Long shifts, short pay, and fines for everything, including breathing too loud near the foreman. They dock you for lunch, they dock you for broken picks, and they dock you for getting eaten, which I always thought was a bit much." },
      },
      choices = {
        { text = "Why not just leave?", next = "venture_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    venture_leave = {
      lines = {
        { id = "vl_default", text = "With what, my good looks? The company's got my contract, my back pay, and my cousin's debt on account, so if I walk out, they come after the whole family. Spying on Gerenzo gets me out with something to show for it, or it gets me buried in here." },
      },
      choices = {
        { text = "Then let's make sure it's the first one.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "venture_company" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },

    patrol = {
      lines = {
        { id = "pa_default", text = "Hit 'em before they shout, pal, because a shout down here carries all the way to the foreman's office. The workers'll swing a pick at you too, mind, since they think they're defending company property, poor saps." },
      },
      choices = {
        { text = "I'll keep them off you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = {
        { id = "af_default", text = "Clean up the mess, sneak out the back, and go find Ziz, because word travels up this company faster than smoke up a chimney. With any luck he's found me a new job, and with no luck at all I'll be digging somewhere else under a new name." },
      },
      choices = {
        { text = "I hope Ziz looks after you.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Farewell, Piznik.", next = "END" },
      },
    },

    trust = {
      big = true,
      lines = {
        { id = "tr_default", text = "You shouldn't, pal, not all the way, because I'm a goblin and I'd sell my own boots for the right price. But right now the right price is Gerenzo's head on a plate, and you and me want the same plate." },
        { id = "tr_tauren", when = { race = "Tauren" }, text = "You shouldn't, and I know your people have good reason not to, after what the company did to these mountains. But I'm swinging a pick against my will, same as the trees are coming down against theirs, and that's got to count for a copper or two." },
      },
      choices = {
        { text = "Good enough. We want the same thing.", next = "BACK", reply = "Good enough for me, pal, and that's a deal. Same plate, same goal, and we split the gravy.", fx = { align = { order = -1 } } },
        { text = "I'll help, but I'm watching you.", next = "BACK", reply = "Watch all you like, pal, because I'm worth watching. Just keep your eyes on Gerenzo too.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Second most important goblin in Windshear, once. Now I'm a goblin with a pick and a grudge, which is a step down, but the grudge is new." } },
    advice = { { id = "tp_ad", text = "Never sign anything the Venture Company hands you, pal, not even a birthday card." } },
    venture_company = { { id = "tp_venture", text = "Cheapest bosses in Kalimdor, and that's sayin' something, because I've met the Steamwheedle accountants." } },
    _none = { { id = "tp_none", text = "Don't know, pal, and I can't afford to find out on Gerenzo's wages." } },
  },
}

-- Cenarion Botanist: a night elf druid of the Cenarion Circle tending the growth on Stonetalon Peak.
P:NPC {
  key = "stn_cenarion_botanist", id = 4051, name = "Cenarion Botanist", gender = "female",
  role = "druid", tier = "service",
  temper = { "measured", "earnest" }, values = { "nature", "balance" },
  notices = { "race", "class" },
  impression = {
    first = "A night elf druid with soil on her hands and seed pouches at her belt.",
    third = "{name} spoke with a Cenarion Botanist on Stonetalon Peak.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ishnu-alah, friend. Step where you like; you've always minded the seedlings well." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. Step lightly, please, and watch the seedlings. I've seen how you tread." },
    { id = "g_default", text = "Ishnu-alah, traveller. Step lightly here, for the seedlings on the peak are younger than they look." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned to the peak. The saplings have grown a finger's width since you left, which is quick, for them." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You walk far from your own people, stranger. Keep your axe sheathed among the trees, and we will have no quarrel." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" }, text = "A fellow of the Circle, I think. Your help would be welcome in the soil, if not in the fighting." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I study what grows on the peak for the Cenarion Circle, and what has stopped growing in the valleys below. The goblins of the Venture Company are cutting Stonetalon to the bone, and someone must remember what it was." } },
      again = { { id = "h_again", text = "Speak, if you wish. The roots will keep." }, { id = "h_again2", text = "What else would you know of the peak?" } },
      choices = {
        { text = "What are the goblins doing to the mountains?", next = "goblins" },
        { text = "What grows up here that's so precious?", next = "growth" },
        { text = "How long have you studied the peak?", next = "ylong" },
        { text = "What do you do with your samples?", next = "ysamples" },
        { text = "Have you seen the Charred Vale?", next = "yvale" },
        { text = "Do you ever lose hope?", next = "yhope2" },
        { text = "A fellow druid. What can I do?", next = "ydruid", when = { class = "DRUID" } },
        { text = "Elune keep you, botanist.", next = "END" },
      },
    },
    goblins = {
      narr = "She crumbles a dry clod of earth between her fingers and lets it fall.",
      lines = { { id = "g1_default", text = "They fell the old trees of the Charred Vale and Windshear Crag for timber and burn what they cannot sell. The land is choking on their smoke, and the creatures of the forest grow sick and maddened from it." } },
      choices = {
        { text = "Then the Venture Company must be driven out.", next = "BACK", reply = "Many of the Circle would agree with you, and the Sentinels more so. Speak to them, if you mean it.", fx = { align = { order = -1 } } },
        { text = "Their timber feeds people, too. There's a balance.", next = "BACK", reply = "Balance is not one side taking everything, stranger. Still, I take your meaning.", fx = { align = { order = 1 } } },
      },
    },
    growth = {
      lines = { { id = "gr_default", text = "Herbs and saplings grown from seed the Circle carried from Moonglade, kept safe here where the goblins cannot reach. When the felling stops, we will plant them again in the valleys below." } },
      choices = {
        { text = "You believe the felling will stop?", next = "hope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hope = {
      lines = { { id = "ho_default", text = "Everything stops in time, even goblins, and my people are very patient. Ten thousand years have taught us that a forest outlives those who cut it." } },
      choices = { { text = "I hope you're right. Something else.", next = "BACK" } },
    },
    ylong = {
      lines = {
        { id = "yylong_d", text = "Forty years, which is not long, for my people. I came after the Third War, when the Circle sent druids to every wounded forest. Stonetalon was wounded worse than most." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ysamples = {
      lines = {
        { id = "yysamples_d", text = "I press them in books and send them to Moonglade, and some I plant in the hidden glades so they will not be lost. Every seed is a memory of the mountain as it was." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yvale = {
      lines = {
        { id = "yyvale_d", text = "Once, and I wept. The earth was black, the streams were grey, and nothing sang. I collected ash to study, and the ash told me only that the trees were old, very old, and that they died quickly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhope2 = {
      lines = {
        { id = "yyhope2_d", text = "Often. Then I find a seedling in the burned ground, a little green thing pushing through the ash. Some druids say we must fight. I say we must plant. Both are needed, perhaps." },
      },
      choices = {
        { text = "Plant. Growth outlasts any war.", next = "BACK", reply = "Yes. That is the old wisdom, and I trust it.", fx = { align = { light = 1 } } },
        { text = "Fight. The goblins won't stop for seedlings.", next = "BACK", reply = "Perhaps you are right. But someone must still plant after.", fx = { align = { light = -1 } } },
      },
    },
    ydruid = {
      lines = {
        { id = "yydruid_v0", when = { race = "Tauren" }, text = "Carry seeds, tauren druid, and plant them in burned ground. Speak to the soil as your people speak to the Earth Mother. The mountain will remember." },
        { id = "yydruid_d", text = "Carry seeds wherever you go, and plant them where the ground has been burned. Speak to the soil, as Cenarius taught us. The mountain will remember those who help it heal." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    moonglade = { { id = "ytp_moonglade", text = "Moonglade is the heart of the Cenarion Circle. My samples go there to be studied." } },
    venture_company = { { id = "ytp_venture_company", text = "The Venture Company cuts and burns and calls it business. I call it murder." } },
    background = { { id = "tp_bg", text = "A druid of the Cenarion Circle, set to study the peak. It is quiet work, and I am glad of it." } },
    _none = { { id = "tp_none", text = "I could not say, stranger. Ask the trees, and be patient for their answer." } },
  },
}

-- Cenarion Caretaker: a night elf druid who tends the wounded animals of Stonetalon Peak.
P:NPC {
  key = "stn_cenarion_caretaker", id = 4050, name = "Cenarion Caretaker", gender = "male",
  role = "druid", tier = "service",
  temper = { "gentle", "weary" }, values = { "nature", "healing" },
  notices = { "class" },
  impression = {
    first = "A tired night elf druid who speaks softly, as if to a frightened animal.",
    third = "{name} spoke with a Cenarion Caretaker on Stonetalon Peak.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ishnu-alah, friend. The creatures calm when you're near, and so do I." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Quietly, please. The creatures are frightened, and you have not given them reason to trust you." },
    { id = "g_default", text = "Quietly, please, traveller. Some of the creatures here are still frightened of strangers." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The young fawn you saw before is walking now, though she still limps." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, text = "Your companion is well cared for, I see. Not all who travel with beasts can say as much." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I care for the creatures driven up from the valleys by fire and felling. They come to the peak hurt and starving, and the Circle does what it can for them." } },
      again = { { id = "h_again", text = "Is there something more, traveller?" } },
      choices = {
        { text = "What hurts them, down below?", next = "below" },
        { text = "You look like you haven't slept.", next = "tired" },
        { text = "What creatures do you tend?", next = "xcreatures" },
        { text = "Who taught you healing?", next = "xteach" },
        { text = "A fellow druid offers aid.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you work with the Keeper here?", next = "keeper" },
        { text = "That hawk with smoke in its lungs. Will it fly again?", next = "hawk" },
        { text = "I'll leave you to your work.", next = "END" },
      },
    },
    below = {
      lines = { { id = "b_default", text = "The Venture Company's fires and saws, and worse, the poisons they leave behind. Even the beasts that are not burned grow strange and wild, and those I cannot always help." } },
      choices = {
        { text = "What becomes of those you can't help?", next = "lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "I give them a gentle end and return them to the earth, as Cenarius would have it. It is the hardest part of the work, and the part I never grow used to." } },
      choices = {
        { text = "A merciful end is still a mercy.", next = "BACK", reply = "So I tell myself, and on most days I believe it.", fx = { align = { order = 1 } } },
        { text = "You should fight the ones who did this instead.", next = "BACK", reply = "Others of the Circle fight. Someone must stay and mend.", fx = { align = { order = -1 } } },
      },
    },
    tired = {
      lines = { { id = "t_default", text = "Sleep comes to me rarely these days, and when it does I dream of smoke. When the valleys heal, perhaps I will rest, but not before." } },
      choices = { { text = "Take care of yourself, too. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xcreatures = {
      lines = {
        { id = "x_xcreatures", text = "Deer with singed hides, wolves with broken legs, a hawk that cannot fly for smoke in its lungs. The Venture Company's fires drive them up the mountain faster than I can mend them." },
      },
      choices = {
        { text = "Should the Venture Company be stopped?", next = "xstop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstop = {
      lines = {
        { id = "x_xstop", text = "Stopped, yes, but some of the Circle want war on them, and some want only to heal what they break. I am a healer, so I choose healing, but I understand the others." },
      },
      choices = {
        { text = "Fight them. Healing alone won't save the forest.", next = "BACK", reply = "Perhaps you are right. My hands are tired of mending.", fx = { align = { order = -1 } } },
        { text = "Heal. War only brings more fire.", next = "BACK", reply = "Thank you. Sometimes I need to hear it.", fx = { align = { order = 1 } } },
      },
    },
    xteach = {
      narr = "She strokes the head of a sleeping fawn without looking down.",
      lines = {
        { id = "x_xteach", text = "An old druid of Moonglade, who told me that every creature has a name, even if it does not tell you. I still believe her, though some of these creatures are very quiet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = {
        { id = "x_xdruid", text = "Then you know the weight of this work. Stay a while, if you can, and help me carry it." },
      },
      choices = {
        { text = "I'll help where I can.", next = "BACK", reply = "Elune bless you, friend.", fx = { affinity = 1 } },
      },
    },
    keeper = {
      lines = { { id = "kr_default", text = "I serve beneath him, as all of us at the Peak do. Keeper Albagorm watches over the mountain as a whole, and I watch over the small things that fall through the cracks of his watching. He says both are needed, and I hope he means it." } },
      choices = {
        { text = "Does he tell you what to do?", next = "keeper2" },
        { text = "Small things matter as much as mountains.", next = "keeper2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keeper2 = {
      lines = { { id = "kr2_default", text = "Rarely. He asks me, now and then, which creatures came up the slope that day, and I tell him, and he listens to the whole list. When I mention a creature I couldn't save, he is quiet for a long time. That is all the counsel I need." } },
      choices = { { text = "That's good counsel. Something else.", next = "BACK" } },
    },
    hawk = {
      lines = { { id = "hk_default", text = "I think so, given time. I've kept her in a cool place out of the wind, and I give her water with crushed silverleaf in it, which a druid in Moonglade taught me eases the breath. She tried her wings this morning and fell, and then she tried again." } },
      choices = {
        { text = "Then she has courage.", next = "hawk2" },
        { text = "Silverleaf in water? I'd not have known.", next = "hawk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hawk2 = {
      lines = { { id = "hk2_default", text = "Every creature here has courage, or it would not have climbed out of the fire. When she flies, I will take her to the edge of the Peak and let her go over the vale, so she can see that it is growing back. I think she would want to know." } },
      choices = {
        { text = "I'm a hunter. My companion would understand that.", next = "BACK", reply = "Then you know already what I mean. Look after it, as it looks after you.", when = { class = "HUNTER" } },
        { text = "I hope she flies soon. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    venture_company = { { id = "tp_xventure_company", text = "The Venture Company burns and cuts and never looks back. I see what they leave behind." } },
    stonetalon_peak = { { id = "tp_xstonetalon_peak", text = "Stonetalon Peak is a sanctuary for the wounded. I hope it stays so." } },
    background = { { id = "tp_bg", text = "A druid of the Circle and a keeper of hurt things. There is no grander title for it." } },
    _none = { { id = "tp_none", text = "I am sorry, traveller, but my mind is on my charges. Ask the botanists." } },
  },
}

-- Mirkfallon Dryad: a daughter of Cenarius who guards the lake of Mirkfallon and its forest.
P:NPC {
  key = "stn_mirkfallon_dryad", id = 4061, name = "Mirkfallon Dryad", gender = "female",
  role = "spirit", tier = "service",
  temper = { "wild", "wary" }, values = { "nature" },
  notices = { "race" },
  impression = {
    first = "A dryad with a deer's grace and a guardian's suspicion.",
    third = "{name} spoke with a Mirkfallon Dryad in the forests of Stonetalon.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You walk the forest again, friend. It whispers your name gently, and I welcome you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You walk the old forest, mortal. It remembers your steps, and it does not trust them." },
    { id = "g_default", text = "You walk the old forest of Mirkfallon, mortal. Do you come to tend it, or to cut it?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. You have not cut anything yet, so you may speak." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am a daughter of Cenarius, and these woods by the lake are in my keeping. They are among the last green places left in Stonetalon, and I mean to keep them so." } },
      again = { { id = "h_again", text = "Say what you will, mortal, and quickly." } },
      choices = {
        { text = "Who threatens the forest here?", next = "threat" },
        { text = "Tell me of Cenarius.", next = "cenarius" },
        { text = "How long have you guarded these woods?", next = "xlong" },
        { text = "Do you trust mortals?", next = "xtrust" },
        { text = "I'm a night elf. Do you remember us?", next = "xelf", when = { race = "NightElf" } },
        { text = "What do you do when the goblins come near?", next = "ygob" },
        { text = "Do you have sisters?", next = "ysisters" },
        { text = "I'll go gently through your woods.", next = "END" },
      },
    },
    threat = {
      lines = { { id = "t_default", text = "The goblins' saws from the south and the harpies of the high crags, and the sickness that seeps from both. Every year the green shrinks, and every year my sisters and I stand closer together." } },
      choices = {
        { text = "I'll drive them back for you.", next = "BACK", reply = "Bold words, mortal. The forest will remember them, if you keep them.", fx = { align = { order = -1 } } },
        { text = "The world changes. Perhaps it can't be stopped.", next = "BACK", reply = "Change is the forest's own nature, but this is a wound, not a season.", fx = { align = { order = 1 } } },
      },
    },
    cenarius = {
      lines = { { id = "c_default", text = "He was the lord of the forest and father of the dryads, who taught the kaldorei the ways of the druid long ago. The orcs' warchief Hellscream slew him in Ashenvale, and the forest still grieves for it." } },
      choices = {
        { text = "Does his spirit endure?", next = "seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "The druids say he walks the Emerald Dream still, though no dryad of these woods has felt him near. We keep faith with him all the same, as daughters do." } },
      choices = { { text = "Then he is lucky in his daughters. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xlong = {
      narr = "She lifts a hoof, then sets it down without a sound.",
      lines = {
        { id = "x_xlong", text = "Since the trees by the lake were seedlings, which to you would be forever. I have seen centaur and goblins and harpies come and go, and I am still here." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrust = {
      lines = {
        { id = "x_xtrust", text = "Some, a few, those who walk softly and take only what they need. Most mortals take, and cut, and leave, and I have learned to watch them closely." },
      },
      choices = {
        { text = "Are we all the same?", next = "xsame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsame = {
      lines = {
        { id = "x_xsame", text = "No, but the forest cannot tell the difference between a careless axe and a cruel one. I must guard against both, even if it seems unkind." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xelf = {
      lines = {
        { id = "x_xelf", text = "Of course, child of Elune. Your druids walked these woods once, and they were gentle, though they have grown fewer since." },
      },
      choices = {
        { text = "I'll honour that.", next = "BACK", reply = "Then the forest will honour you.", fx = { affinity = 1 } },
      },
    },
    ygob = {
      lines = {
        { id = "yygob_d", text = "I watch, and I warn, and when they come too close, the trees close their branches and the paths change. More than one goblin has walked in circles here until he gave up and went home." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ysisters = {
      lines = {
        { id = "yysisters_v0", when = { class = "DRUID" }, text = "Many, druid, in every forest our father loved. Some have fallen to the goblins' fires. You feel the forest too. You know how cold their deaths are." },
        { id = "yysisters_d", text = "Many, in every forest Cenarius loved. Some have fallen to the Venture Company's fires. I feel their deaths like a cold wind through my leaves." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lake = { { id = "ytp_lake", text = "The Mirkfallon Lake is the heart of these woods. As long as it is clean, the trees will stand." } },
    goblins = { { id = "ytp_goblins", text = "The goblins are a fire that walks. I do not hate them, but I will not let them pass." } },
    mirkfallon = { { id = "tp_xmirkfallon", text = "Mirkfallon Lake is the heart of these woods. I will not let it be poisoned." } },
    cenarius = { { id = "tp_xcenarius", text = "Cenarius is our father, and we keep his woods as he would wish." } },
    background = { { id = "tp_bg", text = "I am a dryad of Mirkfallon. The lake and the trees are all the history I need." } },
    _none = { { id = "tp_none", text = "That is a mortal's concern, not a dryad's." } },
  },
}
