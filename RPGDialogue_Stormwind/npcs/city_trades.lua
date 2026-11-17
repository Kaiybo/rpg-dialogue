-- Stormwind's skipped trainers and traders. Voice: bibles/city_trades.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

-- Tannysa: night elf herbalism trainer in the Park.
P:NPC {
  key = "tannysa", id = TODO_NPC("Tannysa"), name = "Tannysa", title = "Herbalism Trainer",
  bible = "bibles/city_trades.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "patient" }, values = { "nature", "craft" },
  impression = {
    first = "Tannysa teaches herbalism among the Park's trees, a night elf who finds human gardens tidy, lovely and a little sad.",
    third = "{name} met Tannysa, who teaches herbalism in Stormwind's Park.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Have you come to learn which leaves heal and which ones kill?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Have your hands learned the difference between peacebloom and silverleaf yet?" },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They are tidy, lovely and a little sad. The earth here is fenced and trimmed, and I suspect your spirits would find it as quiet as I do." } },
      choices = {
        { text = "Even trimmed earth deserves care and respect, Tannysa.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Tidy gardens are dead gardens. Let them grow wild.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Some do, the gentler ones, and I have watched peacebloom close its petals as a warlock passed by on the path to the Mage Quarter. My people learned long ago what the Burning Legion's touch does to growing things, and I will teach you herbs, but not where my plants can see." },
      },
      choices = {
        { text = "Then I'll keep to the path, Tannysa, and your plants be.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your plants will have to grow used to me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tannysa.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every morning, a little, because they plant in rows and prune whatever disagrees with them. Still, the roses here have learned to grow crooked when the gardeners aren't looking, and I like them for it." } },
      choices = {
        { text = "Humans need their rows. It's how they make a city hold together.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the roses grow crooked. Rows are only a cage with flowers.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Several, and you know it already, I think, because your kind always asks that before anything else. I teach which leaves kill so that people know what to avoid, and what they do with that knowledge rests on their own hearts." } },
      choices = {
        { text = "Then I'll use what I learn to heal, not to harm.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Knowledge of poison is a weapon like any other.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "We learned that it hungers, and that those who feed it are one day fed upon, which is why the kaldorei turned from it after the Sundering. I do not ask you to give it up, but I ask you to remember the price." } },
      choices = {
        { text = "I'll remember the price, Tannysa, and wield it carefully.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The price was your people's, Tannysa. I'll take my chances.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because you'll be bleeding in a field somewhere one day, with no priest about, and a handful of the right leaves will do more than any prayer. The soldiers who listen come back; the ones who don't, I don't see again." } },
      choices = {
        { text = "Every warrior should learn to heal themselves.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That's what priests and potions are for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Silverleaf and peacebloom in Elwynn, briarthorn along the roads into Westfall, and mageroyal where the ground is damp. A hunter who knows them can feed and heal themselves for weeks without coming near a town." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a fine nose; some of the old herbalists used hounds to find truffles and roots. Train it, and it'll find you more than game." },
      },
      choices = {
        { text = "I'll take what grows and leave the roots to grow again.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll pick it all. Someone else will if I don't.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Always, for faith mends the spirit, but the body is still flesh and needs the earth's help. Your human healers lean on prayer alone, I think, and they tire faster for it." } },
      choices = {
        { text = "The earth's gifts are holy too. I'll learn to use them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Herbs are only tools, Tannysa. There's nothing holy in a root.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The Sentinels fight under Elune's eye and the Priestesses of the Moon lead them, so yes, in our way. But our sisters guard a forest, and you guard people, and I have always thought yours the harder charge." } },
      choices = {
        { text = "Guarding people is the highest duty I can imagine.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A forest asks less of you. Perhaps your sisters chose wisely.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! The sisters of Elune grow herbs for healing in our temples, and I think you'd find our ways and yours closer than either would admit." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in the Park! You walk heavily for a guest of the trees, but you mean well, I think, and that counts for something." },
        { id = "h_default", text = "I am Tannysa. I teach herbalism to any who will listen, though in this city most would rather buy their herbs than gather them." },
        { id = "h_cond", when = { race = "NightElf" }, text = "A sister of the forest, so far from home! You will find the herbs here tamer than ours, but they still answer to a gentle hand." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk softly, as the Sentinels do, though I suspect you learned it in a different forest. Mind the seedlings, because they cannot hear you coming." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "One who studies the arcane. My people learned long ago what comes of loving that power too much, and I hope yours have learned it too." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You might think herbs are for the gentle folk, but a warrior who knows peacebloom from nightshade lives longer than one who doesn't." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now here's someone who walks past more herbs in a day than most of my students see in a month." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Ishnu-alah, druid. It eases me to see one of the Circle in this city of stone, though I wonder how long you'll stay before the walls grow too close." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You carry a shadow that is not your own. The plants in my beds will wilt if you stand too close, so stay on the path." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who listens to the spirits of the earth. In Teldrassil we call that something else, but I suppose the words matter less than the listening." },
      },
      again = {
        { id = "h_again", text = "Ask away while I sort these cuttings; the earthroot won't mind waiting." },
        { id = "h_again2", text = "Ask. The trees are patient, and so am I." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "Why teach here, and not in Darnassus?", next = "a" },
        { text = "Elwynn is thick with herbs along every road.", next = "b" },
        { text = "Do the herbs of Elwynn hide any poisons, Tannysa?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Your people learned hard lessons about the arcane, I hear.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why should a warrior learn herbalism, Tannysa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "A hunter should know the herbs of these lands, Tannysa.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your people's priestesses heal with herbs, Tannysa?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the kaldorei have warriors of faith like paladins?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the human gardens make you homesick, Tannysa?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do your herbs really wilt near warlocks, Tannysa?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you think human gardens hear the earth, Tannysa?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Tannysa.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Because the humans are new to our alliance, and they know little of what grows at their own feet. If I can teach one of them to see Elwynn's forest, that is worth a long sea voyage." } },
      choices = {
        { text = "Do they listen?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "Some do. Others pull every flower by the root and wonder why none grow there next spring, and those I send back to their books." } },
      choices = {
        { text = "Then teach them patiently. They'll learn in time.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "If they won't learn, let them go without.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Peacebloom and silverleaf, along every road, and earthroot where the ground turns to stone. Go gently and leave a few behind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I crossed the sea when our peoples first made their pact, and I have not regretted it." } },
    _none = { { id = "tp_none", text = "That I do not know, and the trees have not told me." } },
  },
}

-- Shaina Fuller: first aid trainer near the Cathedral.
P:NPC {
  key = "shaina", id = TODO_NPC("Shaina Fuller"), name = "Shaina Fuller", title = "First Aid Trainer",
  bible = "bibles/city_trades.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "mercy", "practical" },
  impression = {
    first = "Shaina Fuller teaches bandaging near the Cathedral, quickly and well, and she says she wraps more refugees' hands than soldiers' these days.",
    third = "{name} met Shaina Fuller, who teaches first aid in Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Hold still and watch my hands. Bandaging is easy until you're bleeding." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more lessons? Good, because a bandage you can tie is worth a priest you can't find." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "More refugees than soldiers these days, from Westfall and Redridge both. Whatever heals them, I'll welcome it, spirits included." } },
      choices = {
        { text = "Then I'll lend my healing wherever it's needed, Shaina.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Refugees should go home. The city can't carry them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "More often than they'd like to admit, and usually with burns from their own spells, which they won't let me write down in the book. A bandage is a humble thing next to an arcane missile, but it's kept more of the Quarter's apprentices alive than any spell I've heard of." },
      },
      choices = {
        { text = "Then teach me, Shaina, and I'll learn it properly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd rather fix it with a spell, Shaina.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Shaina.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More than you'd think, because your words run out in a long fight and linen doesn't. I've wrapped refugees who waited days for a healer, and a clean bandage kept them alive until one came." } },
      choices = {
        { text = "Teach me, then. Every healer should know the plain way too.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My gift is enough. I'll leave the linen to others.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A dagger in the back of the thigh, on a fellow who swore he'd only slipped on the canal stairs. I bandaged him and didn't ask, because a healer who asks loses half her patients to the alleys." } },
      choices = {
        { text = "Heal first, but tell the Watch afterwards, because that's right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You did right not to ask. A healer keeps no ledger.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "More than you'd think, because the priests ask too many questions and the Lamb's own people ask none at all. I'd rather be the one in between, where a burn is only a burn." } },
      choices = {
        { text = "A burn from the fel is never only a burn, Shaina.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A burn's a burn, and I'm glad you see it so.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Tight above the cut and clean below it, and never with the cloth you've been wearing for a week. I've seen soldiers survive the sword and die of the bandage, so learn it properly from me before you learn it over a friend's corpse." } },
      choices = {
        { text = "I'll learn it properly. My comrades depend on me too.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take my chances. Priests handle that.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Mostly, though a beast doesn't hold still and thank you for it the way a soldier does. The principles are the same: stop the bleeding, keep it clean, and keep it calm, which is the bit that gets you bitten." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is {pet} hurt? No? Good, but if it ever is, bring it here; I've bandaged a wolf, two hounds and one very cross cat." },
      },
      choices = {
        { text = "My pet's wounds come before my own.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My pet will heal on its own. Save the bandages for me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than ever, because there are never enough healers, and the refugees from Lordaeron don't come with a priest each. A bandage tied well buys you an hour, and an hour is often all you need to reach someone like you." } },
      choices = {
        { text = "Every life saved matters, whether by bandage or by prayer.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bandages are for those the healers can't spare time for.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Fewer soldiers than refugees, these days, and the refugees are harder, because their wounds are old and nobody tended them on the road south. I'd give a great deal to see the Silver Hand ride north and stop the bleeding at its source." } },
      choices = {
        { text = "The refugees deserve our protection. I'll help where I can.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Lordaeron is lost. Stormwind must look after its own first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll heal faster than I can bandage, so I'll only ask you to remember that not everyone has a priest about when they're bleeding." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You can heal yourself, I know, but the Light won't always come when you're tired, and a good bandage always will." },
        { id = "h_default", text = "Shaina Fuller. I teach first aid to anyone with two hands and a little patience, because the priests can't be everywhere at once." },
        { id = "h_cond", when = { class = "WARRIOR" }, text = "A warrior! You'll bleed more than most, so you'd best learn to tie a bandage one-handed. I'll show you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You'll need this lesson more than most, I'd guess, because knife wounds bleed worse than you'd think and they're always in awkward places." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Warlocks always come to me with burns they won't explain, and I always bandage them without asking, so let me see your hands." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll be patching up your beast as often as yourself, I'd wager, so you'll be wanting to learn properly." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You can close a wound with a word, I hear, so I'll not be teaching you much, though you might teach me a thing or two." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! You'll want to learn to bandage properly, because frost nips and fire scorches, and neither one heals on its own." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Good, can you bandage? The spirits might heal, but I'll take honest linen and steady hands." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've linen to roll." },
        { id = "h_again2", text = "Go on, ask. My hands keep working while I talk." },
      },
      choices = {
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "You'll bandage all sorts here, I expect.", next = "a" },
        { text = "There must be a first thing to learn.", next = "b" },
        { text = "You must have seen some terrible wounds, Shaina.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A warrior ought to know how to bandage a wound, Shaina.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does first aid work on a hunter's pet, Shaina?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do many warlocks come to you for bandages?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do bandages still matter when there are healers, Shaina?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Have you tended many soldiers from the front, Shaina?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does a bandage still matter to someone who heals with nature, Shaina?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do mages come to you for bandaging, Shaina?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you see many wounded in Stormwind, Shaina?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Shaina.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Refugees from Westfall and Redridge, mostly, who walked a long road on bad feet. The soldiers have the Cathedral, but the folk sleeping by the canals have me." } },
      choices = {
        { text = "Shouldn't the city do more for them?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "It should, and the Cathedral tries, but the crown's coffers are spoken for. So I roll linen and I don't wait to be asked." } },
      choices = {
        { text = "The crown must take care of its people first.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Help yourself and your neighbours. Don't wait on lords.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Pressure, before anything. Press hard on the wound and keep pressing, and you'll have time for everything else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned from the Cathedral's sisters during the Second War, and I've had plenty of practice since." } },
    _none = { { id = "tp_none", text = "I couldn't tell you that, but I can tell you how to stop bleeding." } },
  },
}

-- Frederick Stover: bowyer in the Trade District.
P:NPC {
  key = "stover", id = TODO_NPC("Frederick Stover"), name = "Frederick Stover", title = "Bow & Arrow Merchant",
  bible = "bibles/city_trades.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful" }, values = { "craft", "practical" },
  impression = {
    first = "Frederick Stover sells bows and arrows in the Trade District and talks about his yew the way some men talk about wine.",
    third = "{name} met Frederick Stover, a cheerful bowyer of the Trade District.",
  },
  greetings = {
    { id = "g_default", text = "Bows and arrows, friend, the finest yew this side of the Greymane Wall!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did that bow serve you well? Of course it did." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Patience and a cold winter, and a tree that grew slow and straight. Maybe your spirits know which trees grew honest." } },
      choices = {
        { text = "Straight grain makes straight arrows. That's the right way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Crooked wood can surprise you. Don't scorn it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Arrows, if you've a mind to learn the bow, and advice about yew, which I give to everyone whether they want it or not. A warlock I knew once said a well-made stave reminded him of something growing, and he bought a bow just to keep in his room." },
      },
      choices = {
        { text = "Then I'll buy a bow and learn to use it properly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep my curses. Your bows are for lesser folk.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Frederick.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every time I cut one, though I'd never say it in front of the other bowyers. I thank the old ones before I take a stave and plant two saplings for each, because my father did and I'd feel wrong not to." } },
      choices = {
        { text = "That's the right way. Take only what you'll replant.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A tree's a tree, Frederick. Thanking it won't make the bow better.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "To pull a single guard away from his friends, of course, which I learned from a lady in black who bought six. She never told me her name, though she paid in good coin and smiled the whole time." } },
      choices = {
        { text = "Better to face the guard than lure him off.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Luring one away is just good sense, Frederick.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Splendidly, for about three shots, until he set his own quiver smouldering and had to jump in the canal. He bought another quiver after, which I count as a happy ending for both of us." } },
      choices = {
        { text = "He should have stuck to spells, because each craft has its place.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "He had the right idea. Mixing crafts is how things improve.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should, if you ask me, because charging a gnoll archer across an open field is no way to die. A short bow on your back and a quiver of good arrows, and you can pull them in close where you like them." } },
      choices = {
        { text = "A warrior should be ready for any fight, near or far.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Real warriors close the distance. Bows are for hunters.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Good yew, seasoned at least a year, and a draw that suits your arm, not your pride. I've seen young hunters buy a bow they can barely pull because it looked mighty, and then miss everything in Elwynn." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} will want you to shoot straight, since it's the one in the thick of things. Treat it well and pick a bow you can hold steady." },
      },
      choices = {
        { text = "I'll choose the bow that suits me, not the grand one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I want the biggest bow you've got.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Plenty, because they learn quickly that a hymn won't stop a wolf on the road to Northshire. I tell them to aim low and pray high, and so far nobody's come back to complain." } },
      choices = {
        { text = "A pilgrim should trust faith more than a bow.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Aim low and pray high. That's wise advice, Frederick.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every knight in the old wars rode with archers behind him, though you'd never know it from the statues. The bows soften the line, the knights break it, and the bards remember only the knights." } },
      choices = {
        { text = "Then the archers deserve their share of the glory.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Knights break the line. The glory goes where it's earned.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest buying a bow? Well, why not, I suppose, since nobody ever said faith was against shooting straight." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You're no archer, I'd wager, but a knight is only as safe as the bow behind him, so you'd do well to know a good one." },
        { id = "h_default", text = "Frederick Stover, at your service. I sell bows to hunters, arrows to everyone, and advice for free, though most of it's about yew." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "A hunter! Now here's someone who'll appreciate a well-seasoned stave. Come, feel the draw on this one." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You'll be wanting a short bow for the road, I expect, or a good crossbow, because your trade's always had more use for range than people think." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You won't want a bow, I suppose, though I sold arrows to a mage once, and he set every one alight before he loosed it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, at a bow stall! Plenty of soldiers carry a bow for when the enemy won't come close enough, so don't be shy." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you'll be judging my yew, I expect, because your Sentinels carry bows that make mine look like kindling." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, looking at bows? Well, all comers are welcome, though I've never sold a bow to one of your sort." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, buying bows? Your people usually want guns. Does the yew speak to your spirits?" },
      },
      again = {
        { id = "h_again", text = "Ask what you like; I've a moment between passengers, and the ledgers can wait." },
        { id = "h_again2", text = "Go on, friend, I love a good chat." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "That's fine yew you work with.", next = "a" },
        { text = "I'd have thought the army bought plenty of bows from you.", next = "b" },
        { text = "I can't see what a rogue would want with a bow.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I doubt the mage's flaming arrows worked.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Should a warrior carry a bow, Frederick?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What makes a good bow for a hunter, Frederick?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do pilgrims ever buy bows from you, Frederick?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do paladins have any use for archers, Frederick?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever wonder what the tree thought of becoming a bow, Frederick?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Have you anything for a warlock, Frederick?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What makes good yew, Frederick?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Frederick.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "It's from Elwynn, mostly, from the woods past the lumber mill. Though since the Defias took to those woods, the cutters charge me twice and bring half as much." } },
      choices = {
        { text = "Would you buy from the Defias?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "They've offered, through a fellow I won't name, and the wood was good. I said no, but I'll admit I thought about it longer than I should have." } },
      choices = {
        { text = "You did right. Don't deal with thieves.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Good wood is good wood. I'd have bought it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Less than you'd think, since the army buys in bulk from the Ironforge suppliers. I sell to hunters, guards and the odd noble who fancies himself an archer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father was a bowyer and his father before him, all of us right here in the Trade District." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend, unless it's made of yew." } },
  },
}

-- Felicia Gump: the city's florist; sells cooking herbs too, per Chef Grual in Darkshire.
P:NPC {
  key = "felicia_gump", id = TODO_NPC("Felicia Gump"), name = "Felicia Gump", title = "Florist",
  bible = "bibles/city_trades.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "chatty" }, values = { "beauty", "community" },
  impression = {
    first = "Felicia Gump sells flowers and kitchen herbs in Stormwind, and she can tell you who's courting, who's marrying and who's being buried by what they buy from her.",
    third = "{name} met Felicia Gump, Stormwind's chatty florist.",
  },
  greetings = {
    { id = "g_default", text = "Flowers, herbs and seasonings, dear! Something for a sweetheart, or something for the pot?" },
    { id = "g_back", when = { metBefore = true }, text = "You again! Did your sweetheart like the roses? Or was it the pot, after all?" },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Lilies, mostly, for funerals, and fewer roses for courting. The city's a little sad, I think, and the flowers know it before anyone." } },
      choices = {
        { text = "Then sell them gently, Felicia. People need that kindness.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Grief sells well. Raise your price on lilies.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They buy lilies, the Quarter's folk, more than anyone else, because their apprentices have a habit of dying young and their masters have a habit of not explaining why. I've stopped asking, but I always put a sprig of rosemary in with the lilies, for remembrance." },
      },
      choices = {
        { text = "That's kind of you, Felicia. I'll remember the rosemary.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Apprentices die. That's how the Quarter sorts the weak.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Felicia.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It's how I put food on the table, dear, and the brides want roses in winter whether the roses agree or not. I don't think it's cruel, but I wouldn't want a druid telling me otherwise in front of the whole Trade District." } },
      choices = {
        { text = "Tell your customers the truth, Felicia. The roses are forced.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your secret's safe. A little lie keeps everyone happy.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Half my roses go to sweethearts nobody's supposed to know about, and the other half go to wives who've just found out. I sell to both, dear, and I never mix up the orders." } },
      choices = {
        { text = "Secrets like that always come out, so it's better to be honest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What the wives don't know can't hurt them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only near a few, dear, and mostly folk who've come up from the Lamb, though I'm sure it's coincidence. I keep a pot of marigolds by the door for them, because marigolds are tougher than lilies and don't mind much." } },
      choices = {
        { text = "I'm sorry for your lilies, so I'll keep my distance.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Flowers die anyway, Felicia, and I only hurry them along.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than you'd think, for sweethearts and mothers, and a few for the Cathedral steps. A sergeant buys one red rose from me every time he leaves for Redridge, and he's come back eleven times now." } },
      choices = {
        { text = "Everyone should leave something kind behind before a march.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I don't buy flowers. It's bad luck to say goodbye.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Elwynn's lupines in the spring, and wild roses along the Redridge road, and a little white starflower near Stonewatch that nobody's managed to grow in a pot. If you ever find a whole root, I'd love to try." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is smelling my lilies. Do you think it likes them? Most dogs sneeze, but this one seems very refined." },
      },
      choices = {
        { text = "I'll leave the wildflowers where they grow. They're happier there.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll dig you up some starflowers next time.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Westfall, Redridge, Duskwood, take your pick, because every road out of the city sends someone home in a box. I sell lilies to widows who can't afford them, and I've stopped asking what happened." } },
      choices = {
        { text = "Every one of them deserves a proper farewell. Your flowers help.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Flowers cost too much for grieving families. The dead won't mind.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Sweethearts and mothers, and sometimes the grave of a friend on the way out of the city. I don't ask, but you can tell by which flowers they choose, and roses mean somebody's waiting." } },
      choices = {
        { text = "A knight fights for those waiting at home. It's a worthy reason.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A knight should fight for the Light, not for a sweetheart.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll know my lilies, then, since half the funerals in the Cathedral are dressed in them, and more every month." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The young knights always buy roses before they ride out, and I always wonder who they're for." },
        { id = "h_default", text = "Felicia Gump, florist. I sell flowers for weddings and herbs for the kitchen, and lately, I'm sorry to say, a great many lilies for funerals." },
        { id = "h_cond", when = { profession = "Cooking" }, text = "A cook! Then you'll want my herbs. Even Chef Grual in Darkshire sends for them, and that man's terribly hard to please." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Come for flowers, dear? Your sort usually wants something for a sweetheart they're not supposed to have, so I'll not ask the name." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Oh, the lilies are wilting now you've come close, dear, just look at them. I'm sure it's only the heat." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. I sell a great many flowers to the families of warriors, and I'd much rather sell yours a wedding bouquet someday." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You must see the most beautiful wildflowers out in the hills, and I envy you every one of them." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Now you'll know more about flowers than I ever will, dear, so please don't tell my customers that half my roses are forced." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I'd love one of your little lights in my window for the evening trade, if you ever have one spare." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Do your spirits care for flowers? I can tell who's courting and who's grieving by what they buy, you know." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear?" },
        { id = "h_again2", text = "Go on, I've all day and a lot of daisies." },
      },
      choices = {
        { text = "Show me your flowers.", next = "BUSINESS" },
        { text = "There seem to be a great many funerals.", next = "a" },
        { text = "Roses seem to sell well here.", next = "b" },
        { text = "I'd guess some flowers go to secret sweethearts.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I expect soldiers buy flowers before they march, Felicia.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Which flowers grow wild near Stormwind, Felicia?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your flowers often wilt near people, Felicia?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why are there so many funerals lately, Felicia?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who do knights buy flowers for, Felicia?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is forcing a flower to bloom early really so bad, Felicia?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the mages buy flowers from you, Felicia?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Who's been buying flowers lately, Felicia?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Felicia.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "The soldiers who don't come back from Redridge and Duskwood, and the masons' families, too, who've had a hard year. Lilies are the only flower I can't keep in stock." } },
      choices = {
        { text = "Do you know the masons' families?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "Some of them. They used to buy daisies, cheap and cheerful, until the city stopped paying the men. Now they buy nothing, and I've started leaving a bunch at their doors." } },
      choices = {
        { text = "That's a kindness. The city could learn from you.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Giving away stock won't keep your shop open.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Roses, always, because Stormwind is full of young men making promises. I sell them by the dozen on festival days." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My shop's been in the family since before the city was burned, and we rebuilt it with the rest." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know, dear, unless it blooms." } },
  },
}
