-- Theramore's shopkeepers with nothing to say until now: the general store, the armorer and the weaponsmith. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "charity_mipsy", id = TODO_NPC("Charity Mipsy"), name = "Charity Mipsy",
  title = "General Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "cheerful", "busy" }, values = { "kind", "practical" },
  notices = { "hunger", "weary" },

  impression = {
    first = "Charity Mipsy runs Theramore's general store and talks about the marsh as though it were a badly behaved neighbor. She seemed to know every soldier's boot size and every sailor's sweet tooth.",
    third = "{name} met Charity Mipsy, who keeps the general store in Theramore.",
  },

  greetings = {
    { id = "g_shop", text = "Come in, come in! Bread, flasks, rope and torches, and dry socks, which you'll want in this marsh." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! Still keeping your feet dry, I hope?" },
  },

  notice = {
    { id = "n_hungry", cat = "hunger", when = { timeOfDay = "dusk" },
      text = "It's supper time, dear, and you look as though you skipped dinner too. Buy a loaf before the guards come in off watch and clear me out." },
    { id = "n_ressick", cat = "weary", when = { resSick = true },
      text = "Oh, you're pale as milk, dear! The marsh got you, did it? Sit on that barrel a moment before you do anything else." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Everything that isn't nailed down, and the nails too, given a month. Maybe you could have a word with it, since nobody in Theramore has ever won an argument with the weather." } },
      choices = {
        { text = "I'll ask it kindly. The marsh only wants respect.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The marsh can rot. I'll buy more oilcloth.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oil for the steel, dry socks for the feet and the good sense to stay on the road, though I can only sell you the first two. The rest you'll have to pick up from Captain Vimes, who hands it out free to anyone who'll listen." } },
      choices = {
        { text = "Stick to the road. Good advice is worth taking.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Roads are for merchants. I'll take the marsh head on.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Enough to keep me in arrows and bandages, and every one of them comes back telling me the marsh is more dangerous than they thought. The crocolisks get most of them, because nobody believes a log can bite until it does." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} off the flour sacks, please. The last hunter's cat slept on one for an hour, and I'm still finding hair in the bread." },
      },
      choices = {
        { text = "Caution keeps a hunter alive. I'll watch the logs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fear's for townsfolk. I'll take my chances out there.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Less than you'd think, because Theramore is small and everyone knows whose boots went where. The real thief is the marsh, which eats through sacks and barrels faster than any pickpocket I've ever caught." } },
      choices = {
        { text = "Then I'll keep my hands honest in your shop.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The marsh steals more than I ever could. Watch the barrels.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Charity.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ink and candles by the crate, because the tower burns through them reading at night, and the young ones from Dalaran always want the good quills. I keep the paper in waxed boxes now, since the last shipment went soft before I could sell it." } },
      choices = {
        { text = "Good stock is worth the trouble. Keep the waxed boxes.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Mages have magic. They can mend their own soggy paper.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Tar, prayer, and selling fast, in that order. One of the Circle told me the marsh only takes back what we borrowed from it, which was lovely to hear and no help whatsoever with my rope." } },
      choices = {
        { text = "Keep fighting it. That's how cities get built.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The druid was right. Work with the marsh, not against it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Everything, dear, my hinges, my scales and my good scissors, all of it. Hans Weston says I should keep it all greased, and Piter says I should keep it all dry, and between the two of them I've decided to buy new scissors every spring." } },
      choices = {
        { text = "I'll keep my armor oiled and stop complaining, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let it rust. I'll buy new steel when it fails.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Then the shelves go thin, and folk start counting what they've got left, and the soldiers get short with each other. I try to keep a little back for the families, though I'd never tell the officers that, because they'd only want it for the Guard." } },
      choices = {
        { text = "Families first. You're doing right, Charity.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Guard protects everyone. They should come first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Guard does, now and then, ever since the Shady Rest burned. Captain Vimes came by and asked who'd bought lamp oil that week, and I told him, because I've nothing to hide and neither should anyone else." } },
      choices = {
        { text = "Good. The Guard needs to know. I'd tell them too.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What people buy is their own business, Charity.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. Whetstones are by the door and rope's on the shelf, and if you're after something to keep the damp out of your armor, so is everyone else." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! Arrows are in the barrel by the window, and I'll ask you to count them honestly, because I count them again after you leave." },
        { id = "h_default", key = true,
          text = "Charity Mipsy, general supplies. Everything Theramore needs that doesn't come out of a forge or a spellbook comes through my door, and the marsh eats through all of it faster than the ships can bring more." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You keep your hands in your pockets in a shop, which means either you're polite or you've already taken something, and I haven't decided which." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "Oh, a mage! If you need paper, ink or candles for your studies, I have them, though I can't promise the damp hasn't already got to the paper." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Then you'll know the marsh eats everything, and you'll not laugh when I tell you how often I replace the same rope." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want oil for that armor, dear, and lots of it, because the marsh has a way of making steel sing in all the wrong places." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, dear! I've candles if you need them for the chapel, and I'd be glad of a prayer for the next supply ship, because the last one was a week late." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, is it? Well, dear, I sell candles and ink to anyone, and I don't ask what they're for, though I'd rather you didn't tell me either." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I don't stock totems, I'm afraid, but I have plenty of oilcloth, and the marsh will eat yours by the end of the week." },
      },
      again = {
        { id = "h_again", text = "What else, dear? I'm only stacking flour sacks; I can listen." },
        { id = "h_again2", text = "Yes, dear? Ask away." },
      },
      choices = {
        { text = "Is there a way to keep the marsh from rotting your goods?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "The marsh looks hard on a traveller's kit.", next = "marsh" },
        { text = "How do supplies reach the isle?", next = "ships" },
        { text = "What's life like here, under Lady Jaina?", next = "jaina" },
        { text = "You must lose a fair bit of stock to thieves, Charity.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the Theramore mages buy much from you, Charity?", next = "xmage", when = { class = "MAGE" } },
        { text = "What does a warrior need to survive the marsh, Charity?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do many hunters come through Theramore, Charity?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Everything in Theramore seems to be rusting, Charity.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What happens when the ships run late, Charity?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does anyone in Theramore ask what candles are for, Charity?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does the marsh really eat everything, Charity?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Nothing today, thanks.", next = "END" },
      },
    },
    marsh = {
      lines = {
        { id = "m_default", text = "Dry socks, a flask of clean water and a torch that'll stay lit in the damp, dear, that's the whole secret. The water out there will give you a fever, and the mosquitoes will drain what the fever leaves you." },
      },
      choices = {
        { text = "And what's dangerous out there?", next = "marsh_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh_danger = {
      lines = {
        { id = "md_default", text = "Raptors in the reeds, ogres to the west in the Stonemaul ruins, and black dragons down in the south where the guards won't go. Stay on the road and come home before dark, and you'll be all right, mostly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    ships = {
      lines = {
        { id = "s_default", text = "By boat from Menethil, mostly, across the sea from the Wetlands. When the weather's good I have more stock than shelves, and when a storm comes in I'm rationing candles and listening to the guards complain." },
      },
      choices = {
        { text = "Is there no road to the rest of Kalimdor?", next = "ships_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships_road = {
      lines = {
        { id = "sr_default", text = "There's the road north through the marsh to the Barrens, dear, but you'd be walking through Horde country, and nobody hauls flour that way. The sea's slower, but nobody shoots at you on it, unless you count the gulls." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jaina = {
      lines = {
        { id = "j_default", text = "Quiet, dear, and I mean that kindly. Lady Jaina keeps the peace with the orcs, and some grumble that it's soft, but I've lived through the war, and I'll take a quiet shop over a brave one any day." },
      },
      choices = {
        { text = "Peace with the orcs is wise.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The orcs can't be trusted for long.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Who grumbles?", next = "jaina_grumble" },
      },
    },
    jaina_grumble = {
      lines = {
        { id = "jg_default", text = "Old sailors from Kul Tiras, mostly, who still talk about the admiral after a few drinks. I tell them the war's over and they're in a free town, and then I sell them more bread." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came over on one of the first ships with Lady Jaina's people, and I've kept shop here since the walls went up." } },
    advice = { { id = "tp_ad", text = "Change your socks every single night in this marsh, dear, and I mean every night, or your feet will rot." } },
    theramore = { { id = "tp_theramore", text = "Theramore's a lovely town, if you can keep the mildew out of your flour, and I can't. Everything I sell is half a step from going green." } },
    booty_bay = { { id = "tp_booty_bay", text = "Half my stock comes up from Booty Bay on goblin ships, and the goblins charge me for every mile of sea between here and there. I charge less than they do, mind." } },
    onyxia = { { id = "tp_onyxia", text = "The soldiers who come back from the south buy salve and bandages by the armful, and they don't say much. I don't need them to, I can count bandages." } },
    jaina = { { id = "tp_jaina", text = "The Lady buys her own ink here, if you'll believe it, and pays like anybody else. I keep the good bottles back for her." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that, dear. Ask the adjutant at the citadel; he knows everything that's written down." } },
  },
}

P:NPC {
  key = "hans_weston", id = TODO_NPC("Hans Weston"), name = "Hans Weston",
  title = "Armorer & Shieldsmith",
  bible = "bibles/unsung.md", role = "blacksmith", tier = "service",
  communities = { "theramore" }, temper = { "gruff", "proud" }, values = { "dutiful", "practical" },
  notices = { "kit", "class" },

  impression = {
    first = "Hans Weston makes armor and shields for Theramore's guard and grumbles at the damp the way other men grumble at the king. He clearly takes rust as a personal enemy.",
    third = "{name} met Hans Weston, the armorer and shieldsmith of Theramore.",
  },

  greetings = {
    { id = "g_forge", text = "Armor and shields, made for the guard and sold to anyone who pays. Keep your hands off the oiled pieces." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Let's see if you've kept the rust off this time." },
  },

  notice = {
    { id = "n_rust", cat = "kit", place = "before", when = { durability = { max = 0.25 } },
      text = "Look at that. Rusted at the joints and dented at the front, which tells me you've been wading in the marsh and getting hit while you did it." },
    { id = "n_shield", cat = "class", when = { class = { "WARRIOR", "PALADIN", "SHAMAN" } },
      text = "You'd carry a shield, by the look of you. Good, because there's no better friend against a raptor than a stout board of oak and iron." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Give me a week and dry weather, which means give me a month. I'd like to try, because a shaman with a stout shield is a sight the raptors won't forget." } },
      choices = {
        { text = "Take your time. Good work is worth the wait.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I need it now. Cut whatever corners you must.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oak faced with iron, not solid steel, because steel rots out here before the season's done and oak only swells a little. I've made the guard's shields that way for years, and the soldiers grumble at the weight until a raptor's teeth stop an inch from their arm." } },
      choices = {
        { text = "Tested craft beats fashion. Oak and iron it is.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep my steel shield and oil it myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I can slow it down, which is the best anyone can promise in Dustwallow, with a good coat of tallow and a brushing every night. Hunters lie in the reeds for hours waiting on a crocolisk, and I've never met the mail that came out of those reeds the same as it went in." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep {pet} away from the tallow pot, because every hound in Theramore has had a go at it and none of them were sorry." },
      },
      choices = {
        { text = "I'll tallow it every night. Neglect is how gear fails.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather move light and replace it when it rots.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not much, because the Guard wants plate and shields, and I've only got so many hours before the rust wins. Go and see Piter for blades, and if you need your leather patched, the marsh will rot it before I could anyway." } },
      choices = {
        { text = "Leather keeps me fast. Plate is for those who stand still.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Plate keeps the line. I respect the Guard's armor.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else, Hans.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because it gets in the way of their hand-waving, they tell me, and they'd rather a ward than a breastplate. I've seen what a raptor does to a ward when the mage is tired, so I keep a bit of hope that one of you will listen to me someday." } },
      choices = {
        { text = "A ward has served me well enough. I'll trust it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "You're right. I'll be careful out there and heed your advice.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Now and then a chaplain wants a shield with the Light's sun worked on its face, and I'm glad to do it. I'll say the steel's my part and the blessing's yours, because I've no gift for the second, and the marsh doesn't care either way." } },
      choices = {
        { text = "Steel and faith together make a soldier whole.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A good shield does more than any blessing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oil it every night, dry the straps by the fire, and never, ever sleep in it out in the marsh, no matter how tired you are. The Light may keep your spirit clean, friend, but it's never once kept rust off a gorget." } },
      choices = {
        { text = "Discipline every night. Armor is a duty like any other.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll fight in what I've got and worry about rust later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Worse, if you can believe it, because leather rots where steel only rusts. I'd tell you to oil whatever you wear twice a week, but you druids just change into something with a pelt and forget about it, which I find terribly unfair." } },
      choices = {
        { text = "Good work deserves care. Oil your gear.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Gear wears out. Let it, and buy new.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'll sell you what's on the rack like anyone, but I'll not make anything special. I fought orc warlocks in the Second War, and I saw their demons tear through plate that I'd have sworn by, so I'll not help one get stronger, whatever colors you wear." } },
      choices = {
        { text = "I understand. I'll earn your trust in time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The war's over, Hans. Your grudge is the only thing left.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Now there's someone who'll appreciate a good shield, provided you've the sense to oil it before the marsh gets at it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. Mail, by the look of it, and full of mud in every link, which I can tell from here, so take it off before you sit down." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, and in cloth, thank the Light, so you're one customer who won't be bringing me rusted plate to scrape." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, and in plate too, which means you'll be back here inside a week with rust in every joint, because this marsh eats steel the way the crocolisks eat the unwary." },
        { id = "h_default", key = true,
          text = "Hans Weston, armorer and shieldsmith. I make the guard's plate and their shields, and I spend half my days scraping rust off what I made the week before, because this marsh rots steel faster than anywhere I've ever worked." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Leather, not plate, and from the look of you, you've never wanted to clank in your life. I don't hold it against you, though I'll say a good shield has saved more than one quiet fellow." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, wearing cloth into the marsh. Every year one of your lot comes back from the Bloodfen with three arrows in his robe and asks why I didn't sell him armor." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and no armor worth the name, I see. Still, a bear's hide is better than plate in this marsh, because at least it doesn't rust." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock in a smithy. You'll not be wanting plate, I suppose, but your demon might want a collar, and I'll not make one, so don't ask." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman in mail. You'll want a shield that can take a bit of lightning, I expect, and I've never been asked for one before." },
      },
      again = {
        { id = "h_again", text = "What else? I've got plates cooling." },
        { id = "h_again2", text = "Speak up. The hammer drowns out quiet voices." },
      },
      choices = {
        { text = "Does the marsh treat leather any better than steel?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "Rust must be the bane of your forge here.", next = "rust" },
        { text = "Who do you make shields for?", next = "guard" },
        { text = "Plate or mail for the marsh?", next = "plate" },
        { text = "I'm a smith myself.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Do you make anything for those of us in leather, Hans?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why don't mages wear armor in the marsh, Hans?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you ever forge anything for the faithful, Hans?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How do I keep my armor sound in this swamp?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How should a warrior choose a shield for this marsh, Hans?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can you keep a hunter's mail from rusting, Hans?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You won't forge a thing for a warlock, I hear.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Could you make a shield fit for a shaman, Hans?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    rust = {
      lines = {
        { id = "r_default", text = "Oil, and more oil, and a fire in the forge all night to keep the damp out of the shop. Every piece goes out with a rag and a little flask, and every soldier forgets to use them, so every piece comes back." },
      },
      choices = {
        { text = "I'll remember to oil mine.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard = {
      lines = {
        { id = "g_default", text = "The Theramore Guard first, and I'm proud of it; Captain Vimes's men carry my shields on every patrol. What's left over, I sell, and there's never as much left over as you'd like." },
      },
      choices = {
        { text = "The patrols must face rough work out there.", next = "guard_patrols" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard_patrols = {
      lines = {
        { id = "gp_default", text = "Ogres, mostly, and they hit like falling trees. I've had shields come back split clean in half, and the men behind them came back with broken arms and said they were lucky, and they were." },
      },
      choices = {
        { text = "Then make them thicker.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plate = {
      lines = {
        { id = "p_default", text = "Mail, if you've any sense, because plate in this heat will cook you and the mud will swallow you if you fall. The guard wears plate because the guard stands on walls, and you'll be wading through bogs." },
      },
      choices = {
        { text = "Plate's worth the weight.", next = "BACK", fx = { align = { order = 1 }, trait = { brave = 1 } } },
        { text = "I'll go light and quick.", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = {
        { id = "s_default", text = "Then you'll know what the damp does to a quench. Hammer your pieces thicker at the joints than you would up north, and never leave them unoiled overnight, or you'll be starting over in the morning." },
      },
      choices = {
        { text = "Good advice. Thank you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a shieldsmith in Kul Tiras before I followed Lady Jaina's ships here. The work's the same, but the weather's worse." } },
    advice = { { id = "tp_ad", text = "Oil it every night, or don't bother buying it." } },
    theramore = { { id = "tp_theramore", text = "Theramore eats armor, plain and simple. The damp gets into every rivet and every strap, and I spend half my days scraping rust off soldiers." } },
    onyxia = { { id = "tp_onyxia", text = "Dragonfire warps a plate so it'll never sit right again, and I've seen enough of that from the south to know it. A good shield buys you a breath, and that's all it buys you." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Iron make fine metal and do terrible things with it, and that's a waste that offends me as a smith. I'd like a look at their forges, from a safe distance." } },
    lordaeron = { { id = "tp_lordaeron", text = "I learned the trade in Lordaeron, and my old master's forge is ash now. I still use his hammer, and it still swings true." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, and I've plates cooling. Ask the inn." } },
  },
}

P:NPC {
  key = "piter_verance", id = TODO_NPC("Piter Verance"), name = "Piter Verance",
  title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "blacksmith", tier = "service",
  communities = { "theramore" }, temper = { "easy", "talkative" }, values = { "practical", "honest" },
  notices = { "class", "race" },

  impression = {
    first = "Piter Verance sells weapons in Theramore and has an easy manner that doesn't match the trade. He spoke of Theramore's peace with real fondness and of the marsh's beasts with real respect.",
    third = "{name} met Piter Verance, a weaponsmith of Theramore.",
  },

  greetings = {
    { id = "o_horde_war", when = { gossip = { topic = "horde", stance = "war" } }, text = "The Captain says you think the peace is a lie. I hope you're wrong, friend, because I've sold more swords this month than I'd like." },
    { id = "g_forge", text = "Swords, axes, maces, and a spear or two for the long-armed. Have a look, friend." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. My work must be holding up." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You'll want something short and quiet, I expect. I've a rack of good daggers by the door, friend, and they sell best to people with your look." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Go on, pick one up and tell me what's wrong with it; every dwarf who comes in here does. I don't mind, mind you; half the time you're right." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think a good one carries a little of whoever made it. Out in the marsh that counts for more than a sharp edge, and you'd know better than me whether the spirits agree." } },
      choices = {
        { text = "A weapon has a spirit. I'll treat mine with respect.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A weapon is a tool, and a soldier keeps it clean.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A short-hafted axe, because a raptor comes in low and fast and you won't have room to swing anything longer. I've seen soldiers go out with greatswords and come back with a very different opinion of greatswords." } },
      choices = {
        { text = "I'll take the axe. Practical beats proud.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep the greatsword. The raptors can learn to respect it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Waxed string, oiled wood and a case that never sees the rain, though in Dustwallow the rain sees everything. The marsh's creatures are faster than they look, so I tell every hunter to carry a spare string and never trust the first one." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That's {pet}, is it? A fine beast, and a better sentry than any I've sold a bow to, because it hears the crocolisks long before you do." },
      },
      choices = {
        { text = "A good hunter respects the prey. I make clean kills.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A kill's a kill. I don't care how clean it is.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Short swords and daggers, mostly, balanced for a quick hand rather than a heavy arm. The marsh's raptors are fast, so a slow blade gets you killed, and I'd rather send you out with something you can trust in the fog." } },
      choices = {
        { text = "A good blade, used fairly, is worth any price.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The quick strike is all that matters. Fair has no place in fog.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Piter.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A few staves, cut from good timber that comes by boat from Kul Tiras, and plain daggers for those who like a bit of steel just in case. The mages in the tower tell me the enchanting is their business and the balance is mine, and we get on well that way." } },
      choices = {
        { text = "Your craft and mine work together. That's how Theramore lasts.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A mage shouldn't rely on steel. The spell is enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Now and then, when I lie awake, though I've decided that a peace with nothing behind it doesn't last a season. I'd rather my blades hung on the wall all their lives, and most of the ones I sell to the guard never draw blood at all." } },
      choices = {
        { text = "Peace kept by fear is a poor peace. Pray it holds without steel.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Peace needs a sharp edge behind it. Keep forging.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Quietly, yes, because the Lady may trust Thrall but nobody trusts every orc in the Barrens, and Brackenwall is a short walk through the marsh. I forge for a war I hope never comes, and I sleep better for it, strange as that sounds." } },
      choices = {
        { text = "Be open about it. Hidden blades only breed suspicion.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Wise. Let the Horde see the smile, never the forge.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Once, a set of iron caps for staves, and the druid who ordered them asked me to forge them without a single sharp edge. I've thought about it often since, a weapon made to keep from killing, and I'm still not sure I understood him." } },
      choices = {
        { text = "Mercy in steel is still mercy. He was wise.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A weapon that won't kill is only a walking stick.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Now and then, and they're always polite, which is more than I can say for the sailors. Hans won't serve them, but I figure a blade's a blade, and it's not my place to judge where it goes once it leaves my shop." } },
      choices = {
        { text = "You should ask. A smith shares the blame for his blades.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. A blade's a blade, Piter.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! I'll wager you'll want to feel the balance of everything on my rack before you decide, and I'd think less of you if you didn't." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! My bows are on the back wall, and I string them myself, because the damp here ruins a bow faster than it ruins a blade." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, welcome! I don't suppose you'll be buying a sword, but come in out of the damp all the same, because a shop's friendlier with someone in it who isn't haggling." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want a mace, I expect, or a good hammer, and I've a few on the rack that would do the Silver Hand proud if you'd care to look." },
        { id = "h_default", key = true,
          text = "Piter Verance, weaponsmith. I forge for the guard and sell to anyone who's headed into the marsh, which is everybody sooner or later, and I do my best to send you out with something that won't fail you in the mud." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, eh? You'll be wanting something short and sharp, and I've got a few blades that'll do you proud, though I'll ask you to use them on the marsh and not on my customers." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage in a weapon shop! You'll want a staff or a dagger for the off hand, I'd guess, and I'll not pretend to know much about either beyond the wood and the steel." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You'll not want much from my forge, I suppose, but a staff with a good iron cap has saved more than one of your kind out in the marsh." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Well, I've daggers and wands enough, and I'll not ask what you'll use them on, though I'd ask you to keep the demon off my whetstone." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I've sold axes to dwarves my whole life, but never to one who might ask the axe how it feels first." },
      },
      again = {
        { id = "h_again", text = "Something else you need from the weapon racks?" },
        { id = "h_again2", text = "Ask away; Hans does the shouting in this part of town, not me." },
      },
      choices = {
        { text = "Do you ever forge for the Circle?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What's the best weapon for the marsh?", next = "marsh" },
        { text = "Who makes the shields round here?", next = "hans" },
        { text = "Do you ever sell to the Horde?", next = "horde" },
        { text = "What blades do you sell to those who fight quietly, Piter?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you make anything for mages, Piter?", next = "xmage", when = { class = "MAGE" } },
        { text = "Selling weapons in a city of peace must trouble you.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Theramore ready itself for war even in peacetime?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What weapon would you take against a raptor, Piter?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Keeping a bow strung in this damp must be hard, Piter.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do warlocks often buy weapons from you, Piter?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you think a weapon carries a spirit, Piter?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not right now.", next = "END" },
      },
    },
    marsh = {
      lines = {
        { id = "m_default", text = "Something with reach, friend, because the raptors come at you fast and low, and you want them to meet the point before they meet you. A spear or a long sword does the job; a dagger means you've let them get too close." },
      },
      choices = {
        { text = "And against the ogres?", next = "marsh_ogres" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh_ogres = {
      lines = {
        { id = "mo_default", text = "Something heavy, and friends standing beside you. An ogre's hide turns an edge, so the guard carries maces when they go west toward the Stonemaul, and they never go in fewer than four." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hans = {
      lines = {
        { id = "h_hans", text = "Hans Weston, and we work side by side and share a forge fire to save on coal. He makes the shields and I make what goes over the top of them, and we argue about the weather every morning, and then we get to work." },
      },
      choices = {
        { text = "Sounds like a good partnership.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "hz_default", text = "Never, friend, though one or two have asked through traders at the docks. Lady Jaina keeps the peace with Brackenwall, and I'm glad of it, but peace doesn't mean I arm the people the guard might have to fight next year." },
      },
      choices = {
        { text = "That seems sensible.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Arms sold for peace might keep it.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Do you think the peace will last?", next = "horde_last" },
      },
    },
    horde_last = {
      lines = {
        { id = "hl_default", text = "I hope so, but I'm not betting the shop on it. The Shady Rest burned not far up the road, and folk are still arguing over whose doing it was, and that sort of thing has a way of turning into a war." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned the trade in Lordaeron and came south with the refugees when the plague came. Theramore gave me a forge, and I've not looked back since." } },
    advice = { { id = "tp_ad", text = "Clean your blade after every fight, friend. The marsh water eats steel overnight." } },
    theramore = { { id = "tp_theramore", text = "Theramore is a peace that keeps its swords sharp, and I'm the man who sharpens them. I'd sooner sell to soldiers who never need them, but that's not how it goes." } },
    thrall = { { id = "tp_thrall", text = "The orcs' warchief kept his word to the Lady, and I sell fewer blades to angry men because of it. You'll forgive me if I think kindly of him." } },
    onyxia = { { id = "tp_onyxia", text = "A blade won't do much against a dragon, but it does well enough against her whelps, and they're the ones you'll meet. Aim under the wing, where the scales are thin." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay steel is fine work if you buy from the right goblin and robbery if you buy from the wrong one. I've had a few customers bring me the wrong kind to fix." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend, sorry. I only know steel and the weather, and the weather's always wet." } },
  },
}
