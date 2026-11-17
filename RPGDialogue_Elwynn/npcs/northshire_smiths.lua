-- Northshire Abbey's armorer, clothier, weaponsmith, and Brother Paxton who walks the grounds.
-- Voice: bibles/northshire_smiths.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC = P.TODO_NPC

-- Godric Rothgar: armorer and shieldsmith to the Abbey's recruits.
P:NPC {
  key = "godric", id = TODO_NPC("Godric Rothgar"), name = "Godric Rothgar", title = "Armorer & Shieldsmith",
  bible = "bibles/northshire_smiths.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "proud" }, values = { "craft", "duty" },
  impression = {
    first = "Godric Rothgar fits the Abbey's recruits with plain mail and plainer shields, and he takes every dent as a personal insult.",
    third = "{name} met Godric Rothgar, Northshire's armorer, who takes dents personally.",
  },
  greetings = {
    { id = "g_default", text = "Mail, shields and a few good helms. Nothing fancy, but it'll stop a kobold's pick." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece, I see. That's the armor doing its job." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a sword only matters if you're still standing to swing it, and the shield is what keeps you standing. Every recruit who comes back from the kobold camps with a split shield and no split skull agrees with me." } },
      choices = {
        { text = "Shield first, then. I'll learn to trust it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good sword ends the fight before I need a shield.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I can, and I do, with the rings set loose under the arm. It costs a little more and protects a little less there, but a hunter who can't draw is just a target wearing my work." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours takes the knocks in your place, I see. Bring it round, and I'll check it for thorns." },
      },
      choices = {
        { text = "I'll trade a little protection for a clean draw.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Make it heavy. I'll learn to draw around it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I think everyone in Northshire owes something to the lads who stand at the front, and mages most of all, because you're the ones who can't take a hit. I don't ask for thanks, but I notice who gives it." } },
      choices = {
        { text = "I owe them my life, and I'll say so, Godric.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "They're paid to take hits. Gratitude isn't required.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "No, but I've been asked, and I said no, because I'll not have my iron used to hold something that ought to be dead. The Brothers say every craft has its limits, and that's where mine is." } },
      choices = {
        { text = "Your iron should stay clean, Godric. You're right to refuse.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A good cage keeps everyone safer. You should reconsider.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Godric Rothgar, armorer to the Abbey. Every recruit who walks out of Northshire walks out in something I've hammered, so mind you bring it back unbroken." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior, and a fresh one by the look of you. Llane will teach you to swing, but I'll teach you that a shield is worth more than any sword." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll not be wanting my plate, I expect, though you'll be glad of whoever's wearing it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, and La Salle's student, I'd wager. You'll have nothing to do with my forge, then, unless you need a cage." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want mail that bends at the shoulder, so the bow doesn't fight you." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've rivets cooling." },
        { id = "h_again2", text = "Go on, then. I can talk and file at once." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "What wrecks the most shields around here?", next = "dents" },
        { text = "Do the recruits listen to you?", next = "recruits" },
        { text = "Do you think mages owe your plate-wearers something?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have you ever made a cage for a warlock's demon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why is a shield worth more than any sword, Godric?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can you make mail that lets me draw a bow?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    dents = {
      lines = { { id = "d_default", text = "Kobolds at the Echo Ridge Mine, mostly, since they swing those picks like they're digging through you. The wolves only chew the straps, which is worse, because straps I have to sew." } },
      choices = {
        { text = "And the rain?", next = "rain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rain = {
      lines = { { id = "r_default", text = "The rain's the real enemy, friend. A recruit leaves his shield out in the yard overnight and it's rusting by morning, and then he comes crying to me." } },
      choices = {
        { text = "A soldier should care for his own gear.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Recruits have enough to worry about. Go easy.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits = {
      lines = { { id = "rc_default", text = "Half of them do. The other half learn the first time a kobold catches them without a helm, and then they listen very well indeed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've hammered armor for the Abbey longer than most of these recruits have been alive." } },
    kobolds = { { id = "tp_kob", text = "They dent everything they touch. I'd almost admire it if I didn't have to fix it." } },
    _none = { { id = "tp_none", text = "If it can't be riveted, I couldn't tell you a thing about it." } },
  },
}

-- Dermot Johns: cloth and leather armor; mends novices' robes.
P:NPC {
  key = "dermot", id = TODO_NPC("Dermot Johns"), name = "Dermot Johns", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/northshire_smiths.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "gentle" }, values = { "craft", "faith" },
  impression = {
    first = "Dermot Johns sells robes and jerkins to the Abbey's novices and mends the ones they tear, which, he says softly, is most of them.",
    third = "{name} met Dermot Johns, who clothes and mends for Northshire's novices.",
  },
  greetings = {
    { id = "g_default", text = "Cloth and leather, friend, sewn here at the Abbey. Mind the hems; they're new." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. No tears in that sleeve yet, I hope?" },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A quilted jack to go under the mail, and a good cloak for the nights on watch. They never think of either until they're cold and chafed, and then they come to me looking sheepish." } },
      choices = {
        { text = "I'll buy the padding before I need it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll make do with the mail and nothing else.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Something soft and dark, oiled so the dew runs off. The wolves on the hillside see movement before colour, so stand still and you'll be invisible in anything, but a dry hunter is a happier one." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And do keep your {pet} off my folded stock. Fur on a priest's robe is the one complaint I hear more than any." },
      },
      choices = {
        { text = "I'll take the soft leather and move quietly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take whatever's cheapest. They'll see me anyway.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because you all leave Northshire for Goldshire and Stormwind and wherever else, and you forget the fellow who stitched your first jerkin by candlelight. I don't mind, really, but a word of thanks now and then would warm the evenings." } },
      choices = {
        { text = "I'll come back and thank you, Dermot. You have my word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Thanks don't pay for candles. Your coin's enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They come back with mud from the graves and soot from whatever they've been burning, and I spend more time mending their robes than the priests' and the mages' together. The Brothers say it's penance for selling to them, but I think it's just mud." } },
      choices = {
        { text = "I'll take better care of your work, Dermot.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Robes are for wearing out. That's the trade.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Dermot Johns. I sell robes to the priests and jerkins to the rest, and I spend my evenings mending both by candlelight." },
        { id = "h_caster", when = { any = { { class = "PRIEST" }, { class = "MAGE" } } }, text = "A robe-wearer, I see! Do keep it out of the brambles by the vineyards, will you? Silk doesn't forgive thorns." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Dark leather, I suppose, and nothing that squeaks. I've sold to your sort before, though they never come back to say how it went." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. You'll be after a robe, and I'll sell you one, though I'll ask you to keep it out of the graveyard mud." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in my shop! Padding, then, for under your mail, and I've some that's barely been sat on." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want leather that doesn't snag on the brambles by the vineyards, and I've just the thing." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a hem half pinned." },
        { id = "h_again2", text = "Go on, I'm listening, though my needle isn't." },
      },
      choices = {
        { text = "Show me what you've sewn.", next = "BUSINESS" },
        { text = "Who tears the most robes?", next = "torn" },
        { text = "Where do you get your leather?", next = "leather" },
        { text = "Why don't rogues ever come back to thank you?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do La Salle's students ruin your robes often?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do warriors need anything from a cloth merchant?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Which leather is best for walking the Northshire woods?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    torn = {
      lines = { { id = "t_default", text = "The novices who chase the wolves into the woods, every one of them. Brother Paxton tends their bruises and sends them straight to me for their sleeves." } },
      choices = {
        { text = "You should charge them double for carelessness.", next = "BACK", fx = { align = { light = -1 }, trait = { greedy = 1 } } },
        { text = "Mending for the young is good work.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather = {
      lines = { { id = "l_default", text = "From the wolves the recruits bring down, if you can believe it. They break their sleeves on the wolf, and then the wolf becomes new sleeves, which seems only fair." } },
      choices = {
        { text = "That's tidy work.", next = "leather_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_more = {
      lines = { { id = "lm_default", text = "Eagan Peltskinner down in Goldshire tans better than I ever could, mind you. When I've coin to spare I buy from him instead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to the Abbey to pray and stayed to sew. The Light needs both, I think." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond my needle, friend." } },
  },
}

-- Janos Hammerknuckle: dwarf weaponsmith at the Abbey.
P:NPC {
  key = "janos", id = TODO_NPC("Janos Hammerknuckle"), name = "Janos Hammerknuckle", title = "Weaponsmith",
  bible = "bibles/northshire_smiths.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "gruff" }, values = { "craft" },
  impression = {
    first = "Janos Hammerknuckle is a dwarf a long way from Ironforge, selling blades to human recruits and grumbling about how they hold them.",
    third = "{name} met Janos Hammerknuckle, a dwarf weaponsmith at Northshire Abbey.",
  },
  greetings = {
    { id = "g_default", text = "Swords, maces, axes. Pick one and hold it the right way round, if ye please." },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back with all yer fingers. Good, that means ye listened." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Firm in the hand, loose in the wrist, an' never like a soup ladle, which is how the recruits do it. Grip it too tight an' the first kobold that hits it will numb ye to the elbow." } },
      choices = {
        { text = "Firm and loose, then. I'll practise till it's right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll grip it how I like, so long as it cuts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Janos.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every day o' the week, an' twice on feast days. A bow's a bent stick, but a gun's a feat o' craft, an' it makes a noise that'll scatter wolves from here to the abbey gate." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours has a proper look about it. Is it from the mountains? It's got the shoulders for it." },
      },
      choices = {
        { text = "Whatever the weapon, a clean shot's what matters.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A gun, for the noise alone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Point away from you, edge down, and loose enough that it doesn't twist in your hand, which is more than half the recruits manage. I'd rather sell a dagger to a rogue than a sword to a farmhand, because at least I know you'll use it." } },
      choices = {
        { text = "I'll use it well and honorably, Janos.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll use it however the moment calls for.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The smart ones carry one for when the spell fizzles and the kobold's still coming, because kobolds don't wait for you to finish casting. I've sold a few to Khelden's students, and they all held them like quills." } },
      choices = {
        { text = "A sensible precaution. I'll carry one and learn to use it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If my spell fizzles, a dagger won't save me anyway.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Janos Hammerknuckle. I sell steel to the Abbey's recruits, and I've given up counting how many of them grip a sword like a soup ladle." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Well now, a proper dwarf! Ye've no idea how good it is to hear a sensible voice up here among all these tall folk." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You'll be wanting a dagger, I suppose, and at least you'll hold it the right way round." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You won't be wanting steel, I suppose, unless it's a dagger to open letters with." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Now there's someone who'll hold a blade like it means somethin', or I'll know why." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Do ye carry a gun, or one o' those bows? I'll forgive the bow, if ye're a good shot." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind, then? Out with it." },
        { id = "h_again2", text = "Still here? Ask away, lad, I've a blade to quench." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why leave Ironforge for an abbey?", next = "why" },
        { text = "How should I hold a sword, then?", next = "grip" },
        { text = "What's the right way to hold a dagger, Janos?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do mages ever carry daggers at all?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How should a warrior hold a sword, Janos?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you think a gun beats a bow, Janos?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the humans pay in good silver and the forges back home have more smiths than anvils. And because nobody here argues with me about Bronzebeard politics over breakfast." } },
      choices = {
        { text = "Coin's a fine reason to travel.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Arming the young is the better reason.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grip = {
      lines = { { id = "g_line", text = "Firm, but not like ye're strangling a chicken. Let the wrist move and the weight do the work, and ye'll still have an arm by supper." } },
      choices = {
        { text = "And if I'm fighting kobolds?", next = "grip_kobold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grip_kobold = {
      lines = { { id = "gk_default", text = "Then aim low, because they're short, and keep yer candle hand clear. They've a way of setting folk alight with those daft wax hats." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Dun Morogh born, Northshire by choice. Mostly by choice." } },
    _none = { { id = "tp_none", text = "Bah, ask me about steel or don't ask me at all." } },
  },
}

-- Brother Paxton: priest who walks the Abbey grounds healing novices; buys Rethban ore for ink.
P:NPC {
  key = "paxton", id = TODO_NPC("Brother Paxton"), name = "Brother Paxton", title = nil,
  bible = "bibles/northshire_smiths.md", role = "priest", tier = "service",
  communities = { "northshire" }, temper = { "gentle" }, values = { "faith", "mercy" },
  impression = {
    first = "Brother Paxton walks the Abbey grounds with his hands ready to heal, and he seems to know every bruised recruit by name.",
    third = "{name} met Brother Paxton, who walks Northshire's grounds healing the recruits.",
  },
  greetings = {
    { id = "g_default", text = "Light be with you. If you're hurt, say so; that's what I'm walking about for." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again, and standing upright, praise the Light." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than anyone else in Northshire, because you're always the first one in. I don't mind it; the Light gives me something to give, and you give the kobolds something to hit besides the priests." } },
      choices = {
        { text = "I'll stand in front, so others don't have to.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll take the hits because I like the fight.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It mends what lives, and your companion lives, so I don't see why not. I've laid hands on a hunter's wolf that took a kobold's pick in the flank, and it licked my hand after, which I took as thanks." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks healthy, but if it's ever hurt, bring it to me. I don't charge, and it doesn't need to pray." },
      },
      choices = {
        { text = "My beast deserves the same care as any of us.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's an animal, Brother. Save your prayers for people.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every one of them, at least once, and usually the week they learn their first fireball and try it on a wolf by the vineyards. The Light mends burns well enough, but I wish the Light could mend impatience." } },
      choices = {
        { text = "I'll be careful with my fire, Brother. Patience first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Burns are how you learn. A few scars never hurt.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't think the Light rejects anyone, but it doesn't always reach them, and I worry that your path takes you further from it every day. I'll still mend you if you come to me hurt, because that's what I'm here for." } },
      choices = {
        { text = "I'm grateful for your mercy, Brother. I'll remember it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I don't need the Light. My power answers to me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Brother Paxton. I walk the grounds from the vineyards to the gate, and I mend whatever the wolves and kobolds leave of our recruits." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A fellow servant of the Light! Walk with me a while, if you've the time, and you'll learn more healing on this path than in any book." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Khelden's students always come to me with burns on their fingers, and I mend them and tell them to be more careful, though they never are." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've come from La Salle's graveyard. I can feel it on you, and I'll admit it makes me uneasy." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll be the reason I walk the long way round to the barracks, I expect, with linen in both hands." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I mend your beasts too, you know, if they'll let me close enough." },
      },
      again = {
        { id = "h_again", text = "Something else on your mind, child?" },
        { id = "h_again2", text = "Ask what you like; my feet are tired but my ears are not." },
      },
      choices = {
        { text = "Why walk, instead of staying in the Abbey?", next = "walk" },
        { text = "I heard you buy ore from Redridge.", next = "ink" },
        { text = "Do Khelden's students truly burn themselves so often?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the Light truly reject a warlock, Brother?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you mend many warriors, Brother Paxton?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Will the Light mend a hunter's beast, Brother?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Good day, Brother.", next = "END" },
      },
    },
    walk = {
      lines = { { id = "w_default", text = "Because the hurt ones don't always come inside. A recruit with a wolf bite will limp on rather than admit it, so I go and find him first." } },
      choices = {
        { text = "Pride gets soldiers killed.", next = "walk_pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    walk_pride = {
      lines = { { id = "wp_default", text = "It does, and so does shame, which is pride's quieter sister. I'd sooner heal a boy who's embarrassed than bury one who was brave." } },
      choices = {
        { text = "The weak should learn to ask for help.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Then you're doing the Light's work.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ink = {
      lines = { { id = "i_default", text = "I do, from Foreman Oslow in Lakeshire. Rethban ore ground fine makes a lovely ink for the Abbey's scribes, though he's been too busy with his bridge to send any lately." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I took my vows here and I expect I'll die here, hopefully of old age." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, child, but I'll pray you find out." } },
  },
}
