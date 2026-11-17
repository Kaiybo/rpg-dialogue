-- Cathedral Square's armourers and the Dwarven District's stable master and engineering
-- supplier, none with quests. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

-- Agustus Moulaine: Righteous Plates; sells armour in the Cathedral's shadow, devout and proud.
P:NPC {
  key = "agustus_moulaine", id = TODO_NPC("Agustus Moulaine"), name = "Agustus Moulaine", title = "Armor Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "devout" }, values = { "faith", "craft" },
  notices = { "paladin", "kit" },
  impression = {
    first = "Agustus Moulaine sells plate and mail at Righteous Plates, just south of the Cathedral, and he speaks of armour as a kind of prayer. He was devout, proud of his stock and a little pompous.",
    third = "{name} met Agustus Moulaine of Righteous Plates in Cathedral Square.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Righteous Plates. Armour fit for the Light's own defenders, and for anyone else with the coin." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Has the Light, and my steel, kept you whole?" },
  },
  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" }, place = "before",
      text = "A knight of the Silver Hand, under my roof! The Cathedral's paladins have bought their plate here since the square was rebuilt, and I'd be honoured to fit one more." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } }, place = "before",
      text = "Your armour's been through something terrible, friend. Have it mended before you face anything else, or it will fail you at the worst moment." },
  },
  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only once, a man who wanted mail for under his coat and swore he was bound for the Westfall front. I sold it to him, and I've wondered ever since whether I armoured a hero or a Defias." } },
      choices = {
        { text = "A merchant should ask more questions before he sells.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Coin's coin, Agustus. What he did after isn't on you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only the ones who walk in smelling of brimstone, and they do it with a look rather than a word. Most of the Silver Hand's lads are good men, but they've heard what demons did in the Third War, and they don't forget it." } },
      choices = {
        { text = "They're right to remember. I'll keep my demons from their sight.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Their memories are their problem, not mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Good mail, first and foremost, fitted at the shoulders, and a sturdy helm before you spend a copper on gauntlets. I've seen young warriors spend their wages on a fancy breastplate and walk around Westfall with their heads bare." } },
      choices = {
        { text = "I'll buy sensibly and protect what matters first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll buy whatever looks the most impressive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "When you're strong enough not to notice the weight, and not a day before, because mail on a young hunter just slows the draw. Theresa says I'll talk you out of a sale, and she's right, but I'd rather sell to someone who comes back alive." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has its own armour, doesn't it, in a manner of speaking? Thick fur and good teeth, and it never needs refitting." },
      },
      choices = {
        { text = "I'll wait until I'm ready, as you say.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I want mail now. I'll grow into it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Agustus Moulaine. Theresa sells the robes for the clergy, and I sell the plate and mail for those who stand in front of them. Between us, we dress the whole Cathedral." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior, so you'll be wanting mail now and plate when you're seasoned enough to wear it. Come back when you're ready, and I'll have something waiting." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest, so it's Theresa you want, at the other counter. My plate would only weigh down your prayers." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll not want my plate, because it clanks louder than a cathedral bell. Theresa might have something quieter for you." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in the Cathedral district. You're within the law, and I'll serve you within the law, but the paladins next door will look at you sideways." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, at the plate counter! You'll be wanting mail when you're seasoned, I suppose, and I'll have something waiting." },
      },
      again = {
        { id = "h_again", text = "Ask, friend, while the Cathedral bells are quiet and I can hear you." },
        { id = "h_again2", text = "Go on, I've time for a customer who asks questions." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "Why call it Righteous Plates?", next = "name" },
        { text = "Who buys your armour?", next = "buyers" },
        { text = "Do rogues ever buy from you, Agustus?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Which armour should a warrior buy first, Agustus?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "When should a hunter start wearing mail, Agustus?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the paladins give your customers trouble?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good day, Agustus.", next = "END" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "Because armour is a promise, friend: that the one wearing it will stand when others run. I like to think every piece I sell goes out to keep that promise in the Light's name." } },
      choices = {
        { text = "Do you bless your armour?", next = "name2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name2 = {
      lines = { { id = "n2_default", text = "I'm no priest, but I say a prayer over every piece before it leaves the shop. Some customers laugh at that, and some come back to tell me it worked." } },
      choices = {
        { text = "Faith and good steel are a fine pairing.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "It's the steel that saves them, not the prayer.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "Paladins, mostly, and the Cathedral's guards, and lately the young nobles who want to look brave at court. They buy the shiniest plate in the shop and never scratch it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept Righteous Plates beside Theresa for many years, under the Cathedral's bells. It's a fine place to sell armour." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend. The Light has not seen fit to tell me." } },
  },
}

-- Theresa Moulaine: robes at Righteous Plates; gentle, observant, dresses the clergy.
P:NPC {
  key = "theresa_moulaine", id = TODO_NPC("Theresa Moulaine"), name = "Theresa Moulaine", title = "Robe Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "gentle" }, values = { "faith", "mercy" },
  notices = { "priest", "kit" },
  impression = {
    first = "Theresa Moulaine sells robes to the Cathedral's clergy at Righteous Plates and blessed me as though it were part of the sale. She was gentle and noticed more than she said.",
    third = "{name} met Theresa Moulaine, who sells robes at Righteous Plates in Cathedral Square.",
  },
  greetings = {
    { id = "g_default", text = "May the Light guide your path and aid you on your journeys. If you need help, I'll be right over here." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The Light has kept you, I see, and I'm glad of it." },
  },
  notice = {
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" }, place = "before",
      text = "One of the Cathedral's own. I've dressed half the novices who ever knelt in that nave, so let me see if I can't find you something better than the Church's wool." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } }, place = "before",
      text = "Your robe is torn nearly to ribbons. Whatever you faced, I'm glad you came back from it." },
  },
  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Near enough, though the priests want white and the mages want violet, and both of them want me to say theirs is the holier colour. I've learned to tell each of them exactly that." } },
      choices = {
        { text = "You should tell them the truth, Theresa. They'd respect it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Wise of you. A little flattery keeps the peace.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the last warlock who bought one from me wore it to a sermon in the Cathedral, and one of the Archbishop's deacons nearly fainted. I sell to anyone with honest coin, but I've learned to keep the shelves tidy and the colours apart." } },
      choices = {
        { text = "Wearing it to a sermon was cruel. I'd never do that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The deacon's fright was his own affair. It's only a robe.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "All the time, and I always sell the priest a robe and Agustus sells the warrior a breastplate, and then they go off together to Westfall. Mind you, it's usually the priest who comes back to buy a new robe first." } },
      choices = {
        { text = "Then I'll make sure my priest comes back in one piece.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The priest can look after themselves. That's their job.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A good wool cloak for the cold nights, and that's about it, because Agustus has the mail and Lisbeth has the hunting greens. Still, I like to see a hunter come in, because you always bring the smell of the woods with you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet} shedding on my robes? Oh, never mind, the priests won't notice, and if they do, I'll tell them it's a blessing." },
      },
      choices = {
        { text = "A good cloak is all I need, honestly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it's not armour, I don't want it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Theresa Moulaine. I sell robes for the clergy and the scholars, and Agustus sells the plate, so between us we dress the faithful from the altar to the front line." },
        { id = "h_dwarf_priest", when = { race = "Dwarf", class = "PRIEST" }, text = "A dwarf priest! We don't see many of you this far from Ironforge's temple. I'll find you something short enough not to trip over, if you'll forgive me saying so." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I sell more robes to the Sanctum than to the Cathedral these days, because priests mend theirs and mages simply burn through them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. You'll want something dark, I suppose, and I've a few in black, though I keep them at the back so the clergy don't fret." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, at the robe rack! Are you buying for a priest, perhaps? Agustus has the plate on the other side, love." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I'm afraid robes aren't much use in a bramble patch, but I've a cloak or two that might suit." },
      },
      again = {
        { id = "h_again", text = "Is there anything else you'd like?" },
        { id = "h_again2", text = "Take your time, because I'm in no hurry at all." },
      },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "Do the priests buy much from you?", next = "priests" },
        { text = "How do you know Agustus?", next = "agustus" },
        { text = "Who do you see go out to the front?", next = "front", when = { class = "PRIEST" } },
        { text = "Do priests and mages wear the same robes?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do warriors and priests travel together often, Theresa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you sell anything for hunters, Theresa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why do the clergy fret about black robes?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Light keep you, Theresa.", next = "END" },
      },
    },
    priests = {
      lines = { { id = "p_default", text = "The novices buy one plain robe and wear it until it falls apart, and the bishops buy three fine ones a year. I'd rather dress the novices, if I'm honest; they need it more." } },
      choices = {
        { text = "Do you ever give them robes?", next = "priests2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests2 = {
      lines = { { id = "p2_default", text = "Now and again, when one comes in with patched elbows and an empty purse, and Agustus pretends not to notice. Would you think less of a merchant for that?" } },
      choices = {
        { text = "No. That's the Light at work.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A shop can't run on charity.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    agustus = {
      lines = { { id = "a_default", text = "We've kept this shop together for a very long time. People often ask what we are to each other, and I find I enjoy letting them guess." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    front = {
      lines = { { id = "f_default", text = "Young priests, too many of them, buying lined robes for Redridge and Duskwood. I remember their faces, and I pray for every one, and some of them I never see again." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold robes in the Cathedral's shadow for many years, and I hear the bells every hour. It's a good life." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid, but I'll pray you find out." } },
  },
}

-- Jenova Stoneshield: dwarf stable master in the Dwarven District; gruff and fond of beasts.
P:NPC {
  key = "jenova_stoneshield", id = TODO_NPC("Jenova Stoneshield"), name = "Jenova Stoneshield", title = "Stable Master",
  bible = "bibles/unsung.md", role = "stablemaster", tier = "service",
  communities = { "stormwind" }, temper = { "gruff" }, values = { "animals", "loyal" },
  notices = { "pet", "class" },
  impression = {
    first = "Jenova Stoneshield keeps the stables in Stormwind's Dwarven District and talks to the beasts more kindly than to their owners. She was gruff, plain-spoken and plainly good at her work.",
    third = "{name} met Jenova Stoneshield, the dwarf stable master of Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Aye, what is it? If ye've a beast to leave, I've room, and if ye don't, mind the straw." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are ye? Yer beast's been fed and brushed, and better behaved than you, I'd wager." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { named = true } }, place = "before",
      text = "Now there's a fine beast. What's {pet} been eating? Never mind, I can see it in the coat; ye've been feeding it scraps." },
  },
  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Never past a good one, for a beast trusts its nose, an' a nose can't be fooled by soft boots. The SI:7 lads borrow my hounds now an' then for trailin' Defias, an' they bring 'em back better fed than they left." } },
      choices = {
        { text = "A beast deserves kindness, whoever borrows it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast's a tool like any other, Jenova.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Fear 'em? They'd tear 'em apart if I let 'em, for an animal knows an unnatural thing when it smells one. I'll not let 'em, so long as ye keep yer friend at a polite distance from my stalls." } },
      choices = {
        { text = "I'll keep it well away. Your beasts shouldn't suffer for it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My demon could take your whole stable, Jenova.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Their horses, aye, an' some o' the dwarves keep rams, but a warrior's not a hunter, an' a beast knows the difference. A hunter's pet will follow them intae fire; a warrior's horse will only follow them intae a stable." } },
      choices = {
        { text = "A good warrior earns a beast's trust the same as anyone.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Horses are for riding. Leave the bonding to hunters.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Jenova Stoneshield, stable master. I keep the hunters' beasts when they've too many to take on the road, and I treat every one as if it were me own." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Well met, kin! It's good to hear a proper voice in this district. I came down on the tram from Ironforge with the smiths, and I've kept the stables here ever since." },
        { id = "h_notHunter", when = { ["not"] = { class = "HUNTER" } }, text = "I keep beasts for hunters, so unless ye've taken up the bow, there's not much I can do for ye. But ye can stay and talk, if ye like." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, aye, I can tell by how quiet ye came in. The beasts heard ye anyway, mind, for there's no sneakin' past a stable full o' noses." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Hold there, the beasts are restless, an' I'd wager it's whatever's followin' at yer heels. Keep it back from the pens, if ye please." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, at the stables! Ye've no beast tae leave wi' me, so I'll guess ye just like the smell o' hay. Most warriors do, deep down." },
      },
      again = {
        { id = "h_again", text = "What else? The ram in the third stall wants his supper." },
        { id = "h_again2", text = "Aye, go on, then." },
      },
      choices = {
        { text = "I'd like to see the stables.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What's the strangest beast you've kept?", next = "strange" },
        { text = "Why keep stables in Stormwind?", next = "why" },
        { text = "Any advice for my pet?", next = "advice", when = { class = "HUNTER" } },
        { text = "Can a rogue ever sneak past a beast?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do warriors ever keep animals, Jenova?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your beasts fear my demons, Jenova?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good day, Jenova.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "A night elf brought me a nightsaber once, and it wouldn't eat for a week until I sang to it. Don't ye dare tell anyone in the district that I sing." } },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I can't promise that. It's too good a story.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because hunters come through here on their way to everywhere, and somebody's got to look after the beasts they can't take along. The humans were happy to let a dwarf do it, and I was happy to be asked." } },
      choices = {
        { text = "Do you miss Ironforge?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "Every day, {g:lad|lass}, and I'll not lie to ye. But the tram runs both ways, and the beasts here need me more than the ones under the mountain do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "a_default", text = "Feed it what it likes, not what's cheapest, and it'll fight for ye like kin. A hungry beast is an unhappy one, and an unhappy one will leave ye the first chance it gets." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born under Ironforge, raised among rams, and keeping stables in Stormwind now. There's worse lives for a dwarf." } },
    _none = { { id = "tp_none", text = "That's past me, I'm afraid; the rams and wolves in my stalls are all the news I follow." } },
  },
}

-- Billibub Cogspinner: gnome engineering supplier; explosive enthusiasm, points to Lilliam.
P:NPC {
  key = "billibub", id = TODO_NPC("Billibub Cogspinner"), name = "Billibub Cogspinner", title = "Engineering Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "excitable" }, values = { "invention", "community" },
  notices = { "craft", "gnome" },
  impression = {
    first = "Billibub Cogspinner sells engineering parts in the Dwarven District and explains how they explode with real delight. He sends anyone who wants them to stay unexploded to Lilliam Sparkspindle.",
    third = "{name} met Billibub Cogspinner, a gnome who sells engineering supplies in the Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Tubes, bolts, blasting powder and flux! Everything a growing engineer needs, and most of it only explodes when you want it to." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and with all your eyebrows! That's a very good sign." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" }, place = "before",
      text = "An engineer! I can tell by the scorch marks, and I mean that as the highest compliment." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" }, place = "before",
      text = "A fellow gnome! Were you out of Gnomeregan before it all went wrong? No, don't answer that, nobody likes to talk about it." },
  },
  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Absolutely not, it's magic for people who want to know why it works, and that's a much better kind! Gnomeregan built wonders out of gears and steam, though I'll admit some of them also exploded." } },
      choices = {
        { text = "Understanding why it works matters more than raw power.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it works, I don't much care why.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Miners and dwarves, mostly, and once a very polite man in a red bandana who wanted enough to bring down a mine in Westfall. I told him we were out, and then I told the Watch, which I thought was very clever of me." } },
      choices = {
        { text = "You did right to tell the Watch.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "His coin was good. The rest was his business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Of course it would, as long as you remember which button is which! The real secret is that a warrior and a gadget both work best when someone smarter is planning the fight, which is why Lilliam does all the planning." } },
      choices = {
        { text = "I'll leave the clever plans to Lilliam, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll plan my own fights, thank you very much.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Mostly, and the ones that don't work make a very loud noise, which frightens the beast away, which is also a kind of working. The dwarves use rifles, and the elves use bows, but a gnome uses everything at once!" },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, please keep {pet} away from my stock, because some of it is armed and none of it is labelled very well." },
      },
      choices = {
        { text = "A trap should be clean and quick. No needless suffering.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Whatever brings the beast down works for me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Billibub Cogspinner! If you insert tab A into slot B, then of course it goes boom, so let me show you what I have, and then go and ask Lilliam how to put it together so it doesn't." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! You'll want blasting powder and a gun stock, I expect, because your people's idea of engineering is something that goes bang very loudly. I approve completely." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Did you know an arcane focus and a gnomish capacitor are nearly the same thing? Lilliam says they aren't, but she's wrong about that." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! You'll be wanting blasting powder for doors, I expect, and I'm not supposed to ask what doors, so I won't." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! I have just the thing for you: a gnomish shield attachment that goes boom when you get hit. Oh, it's not finished, but it does go boom!" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Have you ever thought about a gnomish trap? They go snap and then boom, which is twice as effective as just snap!" },
      },
      again = {
        { id = "h_again", text = "What else? I've a gyromatic thingamajig that needs looking at." },
        { id = "h_again2", text = "Ask away, ask away!" },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Does everything you sell explode?", next = "boom" },
        { text = "Why sell in Stormwind, not Ironforge?", next = "why" },
        { text = "Is engineering just magic for people without spells?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Who usually buys your blasting powder?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would a gnomish gadget really help a warrior, Billibub?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do gnomish traps really work on beasts, Billibub?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Good day, Billibub.", next = "END" },
      },
    },
    boom = {
      lines = { { id = "b_default", text = "Only the good things! Well, and some of the bad things, but those are usually the customer's fault. Lilliam says I shouldn't tell people that, because it frightens the humans." } },
      choices = {
        { text = "Should the city allow it so close to homes?", next = "boom2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boom2 = {
      lines = { { id = "b2_default", text = "The guards ask me that every month, and I tell them progress is noisy. What do you think, should a city tolerate a little noise for a lot of progress?" } },
      choices = {
        { text = "Yes. Invention is worth a few singed eyebrows.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "No. Safety first, especially in a city.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because Ironforge already has more engineers than it has walls to blow holes in, and Stormwind has hardly any! Besides, the tram brings my stock straight here, and I get to watch the humans flinch." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Out of Gnomeregan, through Ironforge and down the tram to here, with a cart full of parts and most of my fingers." } },
    _none = { { id = "tp_none", text = "No idea! But I could build you something that might find out." } },
  },
}
