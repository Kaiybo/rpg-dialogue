-- The Eastvale stables: Katie Hunter, horse breeder, and Randal Hunter, riding trainer.
-- A human's first horse, at level 40. Voice: bibles/eastvale_stables.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "katie_hunter", id = TODO_NPC("Katie Hunter"), name = "Katie Hunter", title = "Horse Breeder",
  bible = "bibles/eastvale_stables.md", role = "vendor", tier = "service",
  communities = { "eastvale" }, temper = { "brisk" }, values = { "proud", "careful" },
  notices = { "mount", "race" },
  impression = {
    first = "Katie Hunter breeds the horses Stormwind rides and watches every stranger near her gate as if they might leave it open. She'll talk horses with anyone, but she sells them with great care.",
    third = "{name} met Katie Hunter, the Eastvale horse breeder whose mares belong to Stormwind and whose trust must be earned.",
  },

  greetings = {
    { id = "g_default", text = "Mind the gate. They're gentle, but they're not stupid, and they know an open gate." },
    { id = "g_ready", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } }, minLevel = 40 }, text = "Look at you, come to choose one, have you? Take your time." },
  },

  notice = {
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Off that, please, before my mares get ideas, and let me see its hooves while you're at it; it's a habit." },
    { id = "n_other", cat = "race", when = { ["not"] = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } } },
      text = "I'll talk horses with anyone. Selling them is another matter; Stormwind keeps these for its own." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They take to calm folk, and you're calm enough. I sell my horses with care, and I'd rather they went to someone who listens to them, spirits or not." } },
      choices = {
        { text = "Then I'll keep them calm and treat them well, Katie.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A horse is a horse. Sell to whoever pays.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some do, and those I don't sell to mages, because a horse that's frightened of its rider is a danger to everyone on the road. The steady ones are worth more, and they've earned it, so don't haggle." } },
      choices = {
        { text = "I'll take a steady one and treat it well.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A horse should get used to its rider, not the reverse.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Katie.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I can, because a horse that leaves its oats or stands with its head low is telling you as plainly as any man could. Randal says I talk to them more than I talk to him, and he isn't wrong." } },
      choices = {
        { text = "A beast cared for daily repays it. That's the right way.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Horses are stock, Katie. Grieve less and sell more, I'd say.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nerve, mostly, and years of training it not to bolt when steel rings. A warhorse will stand still while the world shouts at it, which is more than I can say for most riders." } },
      choices = {
        { text = "Then I'll be as steady as the horse is.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Any horse will do, if the rider swings hard enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They fear what smells like a wolf or a cat, and most of your pets do. I've had a whole stable kick its doors because a hunter walked a lynx past the paddock, so I'd ask you to go round the long way." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks calm enough, but the mares won't believe that. Keep it by the gate, please." },
      },
      choices = {
        { text = "I'll keep my beast away from your stable.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your horses will have to get used to it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Defias tried last spring, and they got as far as the fence before old Bramble kicked one of them into the trough. Stormwind horses fetch a high price on the Westfall road, so I don't blame them for trying, but I do blame them." } },
      choices = {
        { text = "Anyone who'd steal a horse deserves the trough. Bramble did right.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A horse thief's only doing what Stormwind's tax men do.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They fear it more than they fear wolves, and a frightened horse is a horse that kicks its stall to splinters. You could try one of the riding horses in time, if you'd leave your companion outside the gate." } },
      choices = {
        { text = "Your mare comes first. I'll leave my demon at the gate.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A horse that can't stand a demon isn't worth riding.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "One or two a year, and I sit up with every one of them, because a horse that dies in your hands is something you don't forget. The Brothers at the Abbey say it's foolish to grieve for a beast, but the Brothers have never pulled a foal at midnight." } },
      choices = {
        { text = "Grief for a living thing is never foolish, Katie.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Brothers are right. Save your grief for people.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Katie.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Fewer than they used to, since the Silver Hand broke and the knights stopped coming south for mounts. I keep the old warhorse line going anyway, because one day someone will want a horse that doesn't flinch at a charge, and I'd like to be ready." } },
      choices = {
        { text = "Keep the old line, Katie. Some things are worth keeping faith with.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The old knights are gone. Breed for the market instead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Would you say a blessing over the mare in foal? I'm not superstitious, but I'm not taking chances either." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The old knights rode horses bred in Elwynn, and some of their great-grandchildren are in my stalls this minute." },
        { id = "h_default", key = true, text = "Katie Hunter. I breed the horses Stormwind rides: bred for years, cared for daily, and worth every coin. Randal teaches you to stay on them." },
        { id = "h_young", when = { race = "Human", maxLevel = 39 }, text = "Soon, love. You'll need Randal's lessons first, and he won't teach anyone who's still green, so come back seasoned." },
        { id = "h_trusted", when = { ["not"] = { race = "Human" }, reputation = { faction = "Stormwind", min = "exalted" } },
          text = "Stormwind trusts you completely, I hear, and then so do I. Come and meet them." },
        { id = "h_other", when = { ["not"] = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } } }, text = "These are Stormwind's horses. Earn the kingdom's full trust and we'll do business; until then, you're welcome to pat one." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I count every horse in this stable twice a night, so you know, and I know every one of them by the sound of its hooves." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Keep your creature downwind of the stalls, please, because I've a mare in foal and she won't settle if she smells it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Stormwind's cavalry rode my mother's horses into the last war, and they came home with warriors on their backs, those that came home." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. My horses don't love your beasts, love, but they'll learn manners if you keep your distance." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf! I've heard your people ride great cats instead of horses, so forgive me if I keep you from the foals until they've had a sniff of you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. You'll be wanting a horse that doesn't bolt at a flash of fire, and I've a few of those, if you've the coin." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman by my gate. Mind it's latched behind you. The horses are watching you more closely than I am, and they don't trust strangers either." },
      },
      again = { { id = "h_again", text = "Anything else? They'll want feeding soon." } },
      choices = {
        { text = "Show me the horses.", next = "BUSINESS", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } }, minLevel = 40 } },
        { text = "How do I choose?", next = "choose" },
        { text = "Why only for Stormwind's people?", next = "only" },
        { text = "Do you name them?", next = "names" },
        { text = "Has someone tried to steal your horses before?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do your horses fear a warlock's summons?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What makes a warhorse different from a farm horse?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your horses fear a hunter's pet?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you lose many foals, Katie?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do your horses still go to the paladins, Katie?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Can you tell when one of your horses is sick?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do your horses take fright at magic, Katie?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do horses take to shamans, Katie?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    choose = {
      lines = { { id = "c_default", text = "Not by the colour. By how it stands when you walk up. A horse that turns to look at you is a horse that'll look after you." } },
      choices = {
        { text = "And if it turns away?", next = "choose_away" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose_away = {
      lines = { { id = "ca_default", text = "Then it's not stupid either, and you've some work ahead. Bring apples and patience, but mostly apples." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    only = {
      lines = { { id = "o_default", text = "Because good horses in the wrong hands are a cavalry charge waiting to happen. I'm not saying you're the wrong hands. Prove you're the right ones." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    names = {
      lines = { { id = "n_default", text = "Every one, and then I give them to you and you rename them something silly. It's all right, because they don't listen to names anyway; they listen to hands." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Horses since before I could walk properly, and they taught me; I'm still learning." } },
    advice = { { id = "tp_ad", text = "Walk the last mile. A horse that's cooled down is a horse that's ready tomorrow." } },
    trade = { { id = "tp_tr", text = "Horses, and the bridles to call them. Stormwind's best, for Stormwind's own." } },
    _none = { { id = "tp_none", text = "I couldn't tell you that, love, but ask me about horses and I'll talk all day." } },
  },
}

P:NPC {
  key = "randal_hunter", id = TODO_NPC("Randal Hunter"), name = "Randal Hunter", title = "Riding Trainer",
  bible = "bibles/eastvale_stables.md", role = "trainer", tier = "service",
  communities = { "eastvale" }, temper = { "patient", "dry" }, values = { "careful", "practical" },
  notices = { "class", "mount" },
  impression = {
    first = "Randal Hunter told me to keep my heels down before he noticed I wasn't on a horse. Some habits go deeper than the man who carries them.",
    third = "{name} met Randal Hunter, the Eastvale riding trainer who can't stop teaching even when nobody is in the saddle.",
  },

  greetings = {
    { id = "g_default", text = "Heels down, back straight. Oh, you're not on a horse; it's habit." },
    { id = "g_ready", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } }, minLevel = 40 }, text = "Ready for a saddle? You look ready, and most people look ready, so let's find out." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", minLevel = 40 },
      text = "A paladin. Your order calls its own warhorse, I'm told, but learn on one of ours anyway, because even a holy horse can throw you." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK", minLevel = 40 },
      text = "I've heard what warlocks ride, so don't bring it near the stables; the mares would never forgive me." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Anyone can learn with patience. Your spirits might calm the horse, but your heels still need to be down. That doesn't change." } },
      choices = {
        { text = "Patience and proper form, Randal. I'll learn it right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My spirits will keep me on. I'll skip the drills.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I can teach you to ride well, which is quieter than riding badly, but a horse is a horse and it'll whinny when it pleases. If you need to slip away from someone, get off, tie it somewhere dry and walk, and come back for it after." } },
      choices = {
        { text = "Sound advice. The horse comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Or I'll leave it behind if I'm being chased.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Randal.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because a cat tires and a horse is bred not to, and you'll want your strength for whatever's waiting at the end of the road. Mind you, I'd pay good coin to see a horse's face when you do it." } },
      choices = {
        { text = "Then I'll learn the saddle properly. Your way has its reasons.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll run as I please. The road doesn't care how I travel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Stormwind's knights do, but they train for years, and the horse trains longer. Most warriors ride to the fight and get down for it, and that's no shame; it's sense." } },
      choices = {
        { text = "I'll ride to the fight and stand for it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather learn to fight from the saddle.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It will, in time, if the beast doesn't snap at its heels. I've seen hunters ride all the way to Westfall with a cat padding beside them, and the horse never blinked once it knew the cat was a friend." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Walk your {pet} past the paddock a few times. The horses will learn its smell, and then they'll stop fretting." },
      },
      choices = {
        { text = "I'll take the time to teach them both.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The horse can learn on the road, like I did.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a horse won't sit still while you think, and every mage I've taught tries to think in the saddle. Learn to ride first and work your spells second, and you'll get further than the ones who try it backwards." } },
      choices = {
        { text = "First things first. I'll learn to ride properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll ride however I like and think while I'm doing it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd teach anyone who pays and listens, and I'd sooner you learned on my horses than learned on something you'd called up out of the dark. A horse forgives a bad rider, and I'm told your other mounts don't." } },
      choices = {
        { text = "I'd rather ride an honest horse than a summoned beast.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A summoned steed never tires. Your horses can't say that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "You sit deeper, because you've more weight and less fear, and the horse feels both. The old Silver Hand knights rode as though they were part of the beast, and I'll admit I've not seen many since who could." } },
      choices = {
        { text = "The old knights set the standard. I'll ride to it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The old order is gone. I'll ride my own way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Randal.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll ride the heavy horses, I expect, and you'll find them stubborn, because they were bred to stand still in a charge." },
        { id = "h_default", key = true, text = "Randal Hunter. Katie breeds them, I teach people to stay on them. It's taken years to get the order of those two jobs right." },
        { id = "h_outsider", when = { ["not"] = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } }, minLevel = 40 },
          text = "I teach horses, and Stormwind's people. Your own folk will have their own mounts and their own teachers; I'd go to them." },
        { id = "h_young", when = { maxLevel = 39 }, text = "Patience. Riding's for people who've lived long enough to be careful, forty seasons on the road, give or take, so come back then." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. Your kind always want to ride at first and then decide halfway to Stormwind that walking was faster." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I'll teach you to ride if you want it, though your sort will be riding something else soon enough, I hear." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll ride well, I think, because your sort already know how to stay upright while something tries to throw you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want to ride with your beast trotting alongside, I suppose, and that takes a calm horse and a calmer rider." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, I'm told, and the first night elf to come to my yard. I don't suppose you need lessons, if you can turn into something with four legs yourself." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. You'll want to learn to ride quietly, I expect, and I'll tell you now there's no such thing on a horse." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Heels down. Oh, you're not mounted. A shaman, then. Do your spirits ride, or do they just float alongside?" },
      },
      again = { { id = "h_again", text = "More questions? Good, because questions now are cheaper than falls later." } },
      choices = {
        { text = "Teach me to ride.", next = "BUSINESS", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } }, minLevel = 40 } },
        { text = "What's the hardest part?", next = "hardest" },
        { text = "Why make people wait so long?", next = "wait" },
        { text = "Can a priest ride like a knight?", next = "priest", when = { class = "PRIEST" } },
        { text = "Why do mages give up on riding?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you teach a warlock to ride your horses?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Can a warrior fight from the saddle, Randal?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Will a horse ride beside a hunter's beast?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do paladins ride differently from other folk, Randal?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why should I ride a horse when I can run as a cat?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can you teach me to ride quietly anyway, Randal?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can a shaman learn to ride like a cavalryman, Randal?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    hardest = {
      lines = { { id = "hd_default", text = "Not the riding, the stopping. Everyone wants to go fast, and nobody practises stopping until there's a wall." } },
      choices = {
        { text = "How do you practise stopping?", next = "hardest_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest_stop = {
      lines = { { id = "hs_default", text = "With a wall that's further away than you think, then a bit nearer, and then, once, by surprise. That's the lesson." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    wait = {
      lines = { { id = "w_default", text = "A horse doubles how fast you get into trouble. I'd like you to have practised getting out of it on foot first." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = { { id = "p_default", text = "Better, usually. Knights ride to arrive, but priests ride to arrive in one piece, with something left to heal the knights." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fell off a lot when I was young. Now I teach so other people fall off less." } },
    advice = { { id = "tp_ad", text = "Look where you want to go, not at the thing you want to miss. Horses follow your eyes." } },
    trade = { { id = "tp_tr", text = "Riding lessons, or one lesson, really; the rest you learn by falling." } },
    _none = { { id = "tp_none", text = "Not my field, I'm afraid. Ask me about saddles." } },
  },
}
