-- Old Town tradesfolk with no quests: Heavy Handed Weapons, the Protective Hide's skinner,
-- supplier and bag seller, and the recipe man upstairs at the Pig and Whistle.
-- Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

-- Gerik Koen: two-handed weapons; a big man who sells big steel and likes soldiers.
P:NPC {
  key = "gerik_koen", id = TODO_NPC("Gerik Koen"), name = "Gerik Koen", title = "Two Handed Weapon Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "hearty" }, values = { "strength", "honest" },
  notices = { "class", "kit" },
  impression = {
    first = "Gerik Koen sells nothing that can be swung with one hand, and he's proud of it. His shop in Old Town is full of greatswords and soldiers, and he greeted me like an old comrade.",
    third = "{name} met Gerik Koen of Heavy Handed Weapons in Old Town.",
  },
  greetings = {
    { id = "g_default", text = "Welcome! If you can lift it, I'll sell it to you, and if you can't, I'll sell it to you anyway." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Still swinging that blade with both hands, I hope." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } }, place = "before",
      text = "Now there's a pair of shoulders made for a greatsword. Come here and try this one, and tell me it doesn't feel like it was waiting for you." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } }, place = "before",
      text = "That weapon's nearly done for, friend. Have it mended at a smith before you trust your life to it again." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The good ones do. A shaman with a greatsword would be a sight. Come back and I'll find you one." } },
      choices = {
        { text = "A good weapon earns its place in battle. I'll look.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Greatswords are slow. I'll stick with my axe.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a Defias lad who got it as far as the door and then couldn't lift it over the step. The Watch found him sitting on it in the street, too proud to leave it and too tired to carry it." } },
      choices = {
        { text = "Poor lad. I hope the Watch went easy on him.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Stockade's full of fools like that, and rightly so.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only as something for your demon to hide behind, I'd think. I've heard the voidwalkers carry their own fists, and I'd rather not meet the warlock who taught one to swing an axe." } },
      choices = {
        { text = "I'll keep my voidwalker away from your axes.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A voidwalker with an axe would be something to see.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a greatsword ends an argument before it starts, and a maul ends it before the other fellow's even finished thinking. A shield's a fine thing, but some days you need to hit something harder than it can bear." } },
      choices = {
        { text = "A shield protects others. I'll keep mine.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Give me the biggest maul you've got.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The clever ones do, because a polearm keeps the beast at arm's length while the arrows do their work. A boar spear's the oldest hunting weapon in Elwynn, and it's still one of the best." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would hold a beast in place while you drive the spear home, I'd bet. A good team, the pair of you." },
      },
      choices = {
        { text = "A spear and a steady hand. That's the old way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Arrows are enough. I don't need a spear.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "If you like, though most of my customers would rather have them sharpened than blessed. Still, a blessing can't hurt, and a soldier going into Westfall needs all the help he can get." } },
      choices = {
        { text = "Every blade that protects the innocent deserves a blessing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A sharp edge does more than any blessing, Gerik.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Strength, mostly, and the sense to know when not to swing. I've sold greatswords to fools who cut down their own banners, and I'd rather sell to someone who thinks first." } },
      choices = {
        { text = "Strength without restraint is no strength at all.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "In battle there's no time to think. Swing hard and true.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in my shop! You'll not lift anything here, I'd wager, but if you've come to bless the blades, I won't turn you away." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now here's someone who'll appreciate a proper two-hander, and I've a hammer in the back that's waited a long while for a worthy arm." },
        { id = "h_default", text = "Gerik Koen, of Heavy Handed Weapons. Greatswords, great axes, mauls and polearms, and nothing you can hold in one hand, because one-handed folk can shop at Weller's." },
        { id = "h_priest", when = { class = { "PRIEST", "MAGE", "WARLOCK" } }, text = "You've wandered into the wrong shop, I think, unless you're buying for a friend. A greatsword would only drag you over, but you're welcome to look." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid! I've a fine staff or two at the back, heavy enough to put a bear to sleep, though I suppose you'd rather be the bear." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in a shop full of greatswords? You'll want daggers, friend, and Weller sells those, because nothing in here fits up a sleeve." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Now you're in the right shop. Nothing in here fits in one hand, and nothing in here is for the faint of heart." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've polearms that'll keep a boar at bay and great axes for when it gets through, though most hunters stick with something lighter." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Swing a two-hander, do you? Your spirits would love the weight of it." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Go on, I've nothing to do but polish." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why only two-handed weapons?", next = "why" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "Has anyone ever tried to steal a greatsword?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why choose a two-handed weapon, Gerik?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters ever use polearms, Gerik?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would a greatsword serve a warlock at all?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Shall I bless your greatswords, Gerik?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What makes an arm worthy of your weapons, Gerik?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do soldiers prefer greatswords, Gerik?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Gerik.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because a man ought to be good at one thing, and I'm good at big steel. A shield is for people who expect to lose, and I've never liked selling to people who expect to lose." } },
      choices = {
        { text = "Shields have saved a lot of lives.", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "So they have, and I'm being unfair, but a man's allowed to love his own shop. Tell me straight, what would you rather carry into a fight?" } },
      choices = {
        { text = "A shield, because I'd rather survive first and win second.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something big, so I can hit first and hit hard.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "Warriors from the hall across the way, paladins from the Cathedral, and any soldier home from Redridge who's decided a sword wasn't enough. They come in tired and go out grinning." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold heavy steel in Old Town for years, in the one part of the city the Horde never managed to burn." } },
    _none = { { id = "tp_none", text = "No idea, friend, but ask me about greatswords and I'll talk all day." } },
  },
}

-- Maris Granger: skinning trainer; impatient, unsentimental, secretly glad of a real student.
P:NPC {
  key = "maris_granger", id = TODO_NPC("Maris Granger"), name = "Maris Granger", title = "Skinning Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "impatient" }, values = { "practical", "craft" },
  notices = { "craft", "class" },
  impression = {
    first = "Maris Granger teaches skinning at the Protective Hide and made it plain she has no time for tourists. Once she saw I meant it, she taught quickly and well, and nearly smiled.",
    third = "{name} met Maris Granger, the impatient skinning trainer of the Protective Hide.",
  },
  greetings = {
    { id = "g_default", text = "Tell me what you need, and make it quick." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good; the tourists never come back." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" }, place = "before",
      text = "Let me see your knife. Hm, it's sharp, at least, which is more than most who walk in here can say." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, place = "before",
      text = "A hunter. Finally, somebody who brings in pelts that aren't full of holes." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some do, I'd guess. The spirits might object, but the leather won't skin itself." } },
      choices = {
        { text = "Take only what you need, Maris. Respect the beast.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Leather's leather. The spirits can deal with it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "As much use as to anyone with a knife and a strong stomach, and your sort tend to have both, I've noticed. Just keep that thing of yours away from my hides, because the last imp that came in here chewed through a whole stack of light leather before its master noticed." },
      },
      choices = {
        { text = "The imp stays out, then. Teach me properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The imp goes where I go, Maris.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Maris.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "If it was already dead and nobody claimed it, yes, because leaving a good hide to rot is a waste, whatever your goddess says. If it was alive and you asked me nicely, I'd think about it, which is more than most would." } },
      choices = {
        { text = "Waste nothing. A hide put to use is the sensible way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some beasts should go back to the soil whole, Maris.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It's slower, and the beast's already dead, which is the main difference I can see. A skinner and a cutpurse both live by a steady blade, but only one of us does honest work." } },
      choices = {
        { text = "Then I'll learn the honest kind, Maris.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Honest work doesn't pay the way a purse does.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a fireball ruins a hide from the inside out, and I've had more charred leather from mages than I can count. If you want a clean pelt, use frost, or better still, let someone else do the killing." } },
      choices = {
        { text = "Then I'll hunt properly, with a clean kill.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll kill how I like. The pelts are secondary.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior who travels should, because a hide's worth coin and a carcass is worth nothing but flies. You'll be killing wolves and bears whether you mean to or not, so you may as well get something for it." } },
      choices = {
        { text = "Waste nothing. I'll learn the trade.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I fight. I don't skin. Leave the hides.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A sharp knife, a steady hand and the patience to do it right, because a torn hide's worth half a whole one. Most hunters rush it, and I can always tell, because they bring me ragged pelts and expect full price." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a good coat, and don't look at me like that; I'm only saying, as a professional. Keep it brushed." },
      },
      choices = {
        { text = "I'll take my time and do it right.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fast work pays better than careful work.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not the work, no, because the beast's already dead and wasting it would be worse. It's the hunters who kill for sport I can't abide, and I'll tell them so to their faces." } },
      choices = {
        { text = "Every life deserves respect, even a beast's.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast is meat and hide. There's no sin in sport.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the road doesn't care about your oath, and a knight who can't feed himself is a burden on everyone around him. Learn to skin, and you'll never have to beg a farmer for supper." } },
      choices = {
        { text = "Discipline means being ready for anything. I'll learn.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll manage as I go. Skinning can wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in a skinning shop. Don't faint, and don't preach, and we'll get along fine." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll not have much use for skinning, I'd guess, but since you're here, you might as well learn something useful." },
        { id = "h_default", text = "Maris Granger. Do I look like I have the time to coddle every tourist who wanders through that door? I teach skinning, and I don't get many skinners asking, so if you're serious, I'll teach you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You've a knife already, so you're halfway to a skinner, if you can stomach the rest of it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, in my shop? You'll be wanting to skin something you've already roasted, I expect, and I'll tell you now that it doesn't work." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll be skinning nothing, I'd wager, and you'll leave your kills to rot on the road, which is a waste I can't abide." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Finally, someone who might actually be serious about skinning. Don't waste my time and I won't waste yours." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the skinning table. I'll not ask you to watch if you'd rather not, but I won't stop working for you either." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. If you're here to skin something you summoned, the answer is no, because it doesn't leave a hide, it leaves a smell." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. No time for tourists. If you're here to learn, then learn; if not, go talk to your spirits elsewhere." },
      },
      again = {
        { id = "h_again", text = "Still here? Then say what you need while I sharpen this knife." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "Why don't you get many skinners?", next = "why" },
        { text = "Any advice for a beginner?", next = "advice" },
        { text = "Is skinning so different from my trade?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why can't I skin something I've burned?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Should a warrior learn skinning, Maris?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What makes a good skinner, Maris?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does skinning ever trouble you, Maris?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why should a paladin learn skinning, Maris?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you skin a beast I'd asked you to leave whole, Maris?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would skinning be any use to a warlock, Maris?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do shamans skin the animals they hunt, Maris?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because it's bloody work, and city folk would rather buy leather from Jillian than see where it comes from. They want the boots without the boar, and I find that a little dishonest." } },
      choices = {
        { text = "Not everyone has the stomach for it.", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "Then they shouldn't wear it so proudly. Someone has to do the dirty part of every trade, and I'd like a little respect for it." } },
      choices = {
        { text = "You're right, and honest work deserves respect.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "People pay so they don't have to see it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    advice = {
      lines = { { id = "a_default", text = "Cut along the belly, never across, and keep your knife sharp, because a dull one tears the hide and you'll sell it for scraps. Then bring your best pelts to Simon's people here, and they'll pay you fairly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've skinned since I was a girl on a farm in Elwynn. Now I teach it in the city, which pays better and smells worse." } },
    _none = { { id = "tp_none", text = "I don't know and I don't much care, so is there anything else?" } },
  },
}

-- Jillian Tanner: leatherworking supplies; prices are set, no haggling.
P:NPC {
  key = "jillian_tanner", id = TODO_NPC("Jillian Tanner"), name = "Jillian Tanner", title = "Leatherworking Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "firm" }, values = { "honest", "craft" },
  notices = { "craft" },
  impression = {
    first = "Jillian Tanner sells thread, dye and salt at the Protective Hide, and she told me straight away that her prices were set and haggling was for goblins. I found that rather restful.",
    third = "{name} met Jillian Tanner, who sells leatherworking supplies at the Protective Hide.",
  },
  greetings = {
    { id = "g_default", text = "Only the best supplies, tested and true, and the prices are set. If you want to haggle, go and find a goblin." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Prices haven't changed, in case you were hoping." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" }, place = "before",
      text = "A leatherworker. You'll be wanting salt for curing, then, and more thread than you think you need." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Never, because a fixed price is fair to everyone. Your spirits might bend; I don't." } },
      choices = {
        { text = "Fixed prices are honest. I'll pay what's fair.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Everything bends. Even you, Jillian.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Thread for mending robes, and dye if you're vain about the colour, which most of your lot are, I've found. I sold a mage a whole spool of rune thread once and he complained the price was robbery, so I told him to go to the goblins and he came back the next day and paid it." },
      },
      choices = {
        { text = "I'll pay the price you set, Jillian.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The goblins would have given me a better deal.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jillian.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd sell to anyone who pays, because thread doesn't know who's sewing with it. If the Watch wants to chase thieves, that's their trade, and mine is thread, dye and a fair price." } },
      choices = {
        { text = "The Watch can't do it alone. Merchants should help.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fair enough. A merchant's no constable.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Felcloth thread, mostly, and a dark red dye they won't say what it's for. They're polite enough, and they pay, which is more than I can say for Bartleby's crowd." } },
      choices = {
        { text = "I'd use your dye for honest work, Jillian.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Better you don't know what the red's for.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than they'd think, in the grips, the straps, the boots and the jerkins under their mail. Simon says a warrior wears more leather than a hunter, and I've never once been able to prove him wrong." } },
      choices = {
        { text = "Then I'll take care of my leather as well as my steel.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leather's leather. It wears out, I buy more.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A good handful for every hide, and more in summer, when the flies are bad. The hunters who bring Simon the best pelts always buy their salt from me, and the ones who don't bring him rotten ones." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is sniffing my salt bags, and I don't mind, as long as it doesn't lick them. Salt's not good for beasts." },
      },
      choices = {
        { text = "I'll salt every hide properly. A good pelt deserves it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll sell the hides fast and skip the salt.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I do give, I just don't do it at the counter, because then every customer wants a sad story and a lower price. The Cathedral gets a share of my profits every month, and nobody needs to know about it." } },
      choices = {
        { text = "Quiet charity is the truest kind, Jillian.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Charity's only worth doing if people see it done.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Most are, and the ones who aren't stand out like a cracked hide. A knight tried to talk me down once, and I told him the Light was watching, and he paid in full." } },
      choices = {
        { text = "An honest price deserves an honest buyer.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Haggling isn't dishonest, Jillian. It's just trade.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Prices are set, haggling is for goblins, and I'll not be shamed into charity, so we understand each other." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. My prices are fair and fixed, {class}, so I'll trust you not to haggle, since your order's supposed to be honest." },
        { id = "h_default", text = "Jillian Tanner. Simon teaches the craft, Randal helps, and I sell the thread, the dye and the salt, at a price that's fair and doesn't move." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid in a leather shop. I've seen your sort wince at the pelts, so I'll say plainly that we waste nothing and kill nothing for sport." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll want soft leather and dark dye, and plenty of both. I sell them at the same price to everyone, thieves included." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I've dye for every colour except the one your demons leave on a rug, so mind where it stands." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll need leather for your grips and straps, and I'll sell you the dye, the salt and the thread at a fair price." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll be bringing hides to Simon, I hope, and you'll want salt to keep them on the road; I've got plenty." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, at the Protective Hide. Thread and dye I have, and salt, and the price is the price." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. My prices are set; haggling is for goblins. Your spirits won't change them." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Anything more? Prices still haven't moved, mind." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why won't you haggle?", next = "haggle" },
        { text = "Are you and Simon related?", next = "simon" },
        { text = "You'd sell to a thief knowingly, Jillian?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do warriors use much leather, Jillian?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How much salt does a hunter need, Jillian?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do warlocks buy much from you, Jillian?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why won't you give charity at the counter, Jillian?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you think paladins are honest, Jillian?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does a mage need anything from a leather shop, Jillian?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you ever bend your prices, Jillian?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Jillian.", next = "END" },
      },
    },
    haggle = {
      lines = { { id = "h_default2", text = "Because haggling only rewards the loudest customer, and I'd rather treat the quiet ones the same. The price on the tag is the price for everyone, noble or farmhand." } },
      choices = {
        { text = "That's fair, if everyone pays the same.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A good bargain is half the fun of buying.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    simon = {
      lines = { { id = "s_default", text = "We share a name and a shop, and that's all you need to know. People ask, and it amuses me to let them wonder." } },
      choices = {
        { text = "Then who's Randal?", next = "randal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    randal = {
      lines = { { id = "r_default", text = "Randal Worth, Simon's apprentice, who spends half his day looking at himself in the polished buckles. He's good with a needle, though, so we keep him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold supplies at the Protective Hide for years. It's an honest trade in an honest corner of Old Town." } },
    _none = { { id = "tp_none", text = "That's not my business, but ask me about thread and I'll help." } },
  },
}

-- Alyssa Griffith: bags at the Protective Hide; proud of her stitching, also won't haggle.
P:NPC {
  key = "alyssa_griffith", id = TODO_NPC("Alyssa Griffith"), name = "Alyssa Griffith", title = "Bag Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful" }, values = { "craft", "practical" },
  notices = { "greenness", "kit" },
  impression = {
    first = "Alyssa Griffith sells bags at the Protective Hide and believes most of an adventurer's troubles come from carrying too little. She was cheerful and certain, and she sold me on it.",
    third = "{name} met Alyssa Griffith, who sells bags at the Protective Hide in Old Town.",
  },
  greetings = {
    { id = "g_default", text = "Bags! Sturdy, tested and true, and the prices are set, so don't try your luck." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Full up already, I'll bet." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 }, place = "before",
      text = "You've got the look of somebody whose pack is stuffed with wolf meat and linen. You'll want another bag, love, and you'll want it today." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The biggest one I have. Totems, reagents, rations, all of it. Carrying too little is the start of all trouble." } },
      choices = {
        { text = "You're right, Alyssa. A prepared traveller is a safe one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I travel light. Spirits carry the rest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A sturdy one with a felt lining, so the shards don't clink and give you away, and a strap long enough that the bag sits at your hip and not your back. Your sort always come back for a second bag inside a month, because you underestimate how much you'll gather, and I don't mind because it's good business." },
      },
      choices = {
        { text = "A lined bag, then, Alyssa. I'll take your advice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll carry what I like, however it rattles.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Alyssa.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "On a strap round the neck, of course, with a buckle a paw can manage, and I've been sketching it for a month. Nobody's bought one yet, but your people keep coming in, so I keep hoping." } },
      choices = {
        { text = "Make it, Alyssa. Every druid could use one.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A bear carries nothing, Alyssa. That's the point of being a bear.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the loudest thing about any thief is what they've just stolen, and I've seen more than one caught by the jingle in their pack. A good bag keeps its secrets, which is the whole point of a bag." } },
      choices = {
        { text = "My pack holds nothing I'd need to hide, Alyssa.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A quiet bag is worth its weight in coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "If you could, I'd be out of business and so would the Sanctum's tailors, because they sew the enchanted bags. Until someone conjures a pocket that holds its shape, you'll carry your things like everyone else." } },
      choices = {
        { text = "Then I'll pack carefully and plan ahead.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I travel light and trust my wits on the road.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Bandages, almost always, because they think the priest will have some. Half of what goes wrong on the road goes wrong because somebody had to leave something behind, and for warriors it's usually the bandages." } },
      choices = {
        { text = "I'll carry bandages for myself and anyone else who needs them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The priest can carry the bandages. I'll carry the sword.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bigger than you think, because you'll run out halfway through a fight with a pack of wolves. I sell quivers that hold twice what the market stalls sell, and I've never had a hunter bring one back for being too big." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} needs carrying room too, you know: a bit of meat and a water skin. Don't leave it hungry on the road." },
      },
      choices = {
        { text = "Always carry more than I need. I'll buy the big quiver.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I travel light. I'll make do with less.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Clean water, extra linen and their own supper, because they're always thinking of everyone else first. I've sold a hundred bags to priests, and I've never seen one packed with anything for themselves." } },
      choices = {
        { text = "Caring for others first is part of the calling.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. A healer who starves heals no one.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Everything that isn't a weapon, usually, and then they're surprised when their armour rusts. The ones who pack well come back, and the ones who don't come back with stories about how they should have." } },
      choices = {
        { text = "Preparation is part of duty. I'll pack properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll travel light and trust the road. It's served me so far.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll want a bag for bandages, I expect, because healers always run out of room before they run out of wounded." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want a stout bag for plate oil and spare straps, because they always break at the worst moment." },
        { id = "h_default", text = "Alyssa Griffith. I sell bags, and I'll tell you for nothing that half of what goes wrong on the road goes wrong because somebody had to leave something behind." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter! You'll want a quiver as well as a bag, and you'll need both bigger than you think." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll want a bag that doesn't rattle. I've a few lined with felt, and they're the quietest in the city." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll need room for reagents, scrolls and three days of conjured bread, I expect. Mages always pack like they're leaving forever." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want a bag big enough for bandages, rations and whatever you take off the gnolls, and I've got just the one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and carrying nothing, as usual for your people. I'll not let that stand, because even a bear needs a bag for the walk home." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! You'll want a soul bag, I expect, and I'll tell you now, the shards rattle if you don't line it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Totems are heavy. You'll need a big bag, trust me." },
      },
      again = {
        { id = "h_again", text = "What else, love?" },
        { id = "h_again2", text = "Go on, I'm only stitching." },
      },
      choices = {
        { text = "Show me your bags.", next = "BUSINESS" },
        { text = "What have people had to leave behind?", next = "left" },
        { text = "What makes a good bag?", next = "good" },
        { text = "Why should a rogue worry about a rattling bag?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can't I carry everything with a spell?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does a warrior forget to carry, Alyssa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How big a quiver should a hunter carry, Alyssa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do healers forget to carry, Alyssa?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does a paladin forget to pack, Alyssa?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where would a bear even put a bag, Alyssa?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What sort of bag does a warlock need, Alyssa?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What bag would you recommend for a shaman, Alyssa?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Alyssa.", next = "END" },
      },
    },
    left = {
      lines = { { id = "l_default", text = "A soldier told me he left his last healing potion in Duskwood to carry a wolf pelt home, and nearly died for it. Now he buys a new bag every time he's paid." } },
      choices = {
        { text = "Some things are worth carrying home.", next = "left2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    left2 = {
      lines = { { id = "l2_default", text = "Maybe so, but a pelt won't save your life. Tell me, if it came to it, would you drop the treasure or the potion?" } },
      choices = {
        { text = "I'd drop the treasure, because my life's worth more.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "The potion. I'd trust my own luck.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    good = {
      lines = { { id = "gd_default", text = "Double stitching at the bottom, because that's where it fails, and a strap that won't cut your shoulder. Everything else is decoration, and I don't charge for decoration." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've stitched bags at the Protective Hide for years, alongside Seoman, who sells the leather armour." } },
    _none = { { id = "tp_none", text = "No idea, love, but ask me about bags and I'll tell you anything." } },
  },
}

-- Kendor Kabonka: cooking recipes, upstairs at the Pig and Whistle; a collector of dishes.
P:NPC {
  key = "kendor_kabonka", id = TODO_NPC("Kendor Kabonka"), name = "Kendor Kabonka", title = "Master of Cooking Recipes",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "jovial" }, values = { "food", "community" },
  notices = { "craft", "hunger" },
  impression = {
    first = "Kendor Kabonka sells recipes upstairs at the Pig and Whistle and collects dishes from every corner of the kingdom the way some men collect coins. He was jovial and hungry, and very easily distracted by food.",
    third = "{name} met Kendor Kabonka, who sells recipes upstairs at the Pig and Whistle.",
  },
  greetings = {
    { id = "g_default", text = "Up the stairs and you've found me! Recipes, friend, from every kitchen between here and Westfall." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did you cook the last one, or are you still working up the courage?" },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" }, place = "before",
      text = "A cook, I can smell it on you, and it smells like boar. Come, I've a recipe that'll do that boar justice." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Very nearly, my friend! I've dishes from Westfall, Lakeshire, Darkshire. Never a shaman's dish, though. Come back with one." } },
      choices = {
        { text = "I'll share one gladly, Kendor. Food is meant for sharing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Recipes are secrets. You'll have to pay.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Something small that keeps, like the dried meat the Westfall farmers used to pack for the harvest, and nothing with garlic, because garlic gives you away at fifty paces. I had a fellow up here once who asked for the quietest recipe I had, and I've never laughed so hard in my life." },
      },
      choices = {
        { text = "Then sell me the Westfall recipe, Kendor, at your price.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll just take what I need from the kitchen.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kendor.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because nobody here has ever seen a moonberry, and the sailors who bring the juice drink it before they dock! I'd write a whole chapter on the things if I could only taste one fresh." } },
      choices = {
        { text = "I'll bring you some fresh moonberries next time I'm home.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some flavours belong to Darnassus alone, Kendor.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A Westfall stew that the old farmers cooked over embers for a whole day, before the Defias burned half their kitchens. I've got the words but not the patience, and I suspect a mage could hold the heat steadier than I ever could." } },
      choices = {
        { text = "Keep the farmers' recipes alive. They've lost enough.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A recipe's a recipe. Who made it hardly matters.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a cook wants to know if his food can please anyone at all, and a demon must be the hardest critic in the world. Stephen says I'm mad, and he's probably right, but I'd still like to see the little thing's face." } },
      choices = {
        { text = "Don't feed it, Kendor. It'll only want more than food.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll bring it by. Feed it whatever you like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A good stew, made from whatever you've got and cooked slow, and a hard biscuit that won't go off in a week. I gathered my best camp recipes from soldiers who fought in the Second War, and they knew what kept a man on his feet." } },
      choices = {
        { text = "A good meal keeps the whole camp together.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll eat whatever's quickest. Cooking wastes time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Goretusk liver, if you can stand the smell while it's cooking, and Elwynn boar for everything else. I got the goretusk recipe from a farmer in Westfall before the Defias drove him off, and I think of him every time I sell it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks well fed, I'm glad to see. Some hunters give their beasts the scraps; you've given it the good cuts, I can tell." },
      },
      choices = {
        { text = "My pet eats as well as I do. It's earned it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Scraps are good enough for a beast.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "There is, and they won't part with it, not for coin or for three of my best recipes. Brother Joshua says it's blessed, but I say it's the extra butter, and one day I'll prove it." } },
      choices = {
        { text = "Some things should stay sacred, Kendor, even bread.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Recipes should be shared. Blessings don't make bread better.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Plain stew, dark bread and whatever the local farmers gave them, which was usually more than they asked for. A good knight eats humbly, they say, though I've met a few who'd argue the point." } },
      choices = {
        { text = "A knight should eat humbly and leave the best for others.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A knight fights hard and should eat well for it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll know the Cathedral's famous bread, I expect, and I've been trying to get the recipe out of the brothers for years." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want a good hearty stew for the march, and I've a recipe from the Silver Hand's old kitchens that's never failed." },
        { id = "h_default", text = "Kendor Kabonka. Stephen downstairs teaches the cooking, and I sell the recipes I've gathered from every farm kitchen and soldier's camp in the kingdom." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! I'd trade three of my best recipes for one of your people's ale-and-meat secrets, and nobody from Ironforge will ever take me up on it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've a recipe that wants a very steady flame, and I've never once got it right on a stove, so you might be the one to try it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! Does your imp eat, I wonder? I've always wanted to cook for something that's never tasted a proper meal." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want recipes for the camp, I'd think, because the Barracks cooks don't teach anyone anything except how to suffer." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've recipes for every kind of game in the kingdom, from Elwynn boar to Westfall chicken to Redridge goretusk." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've been dying to ask one of your people about moonberry juice, because nobody in Stormwind can make it properly." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Ah, a quiet one! You'll be wanting a recipe for something you can eat on the move, I'd wager, and I've got just the thing." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Do dwarven shamans have special recipes? I collect them, you know. Spirit stew, perhaps?" },
      },
      again = {
        { id = "h_again", text = "What else, friend? I'm in no hurry, not with the kitchen smelling like that." },
        { id = "h_again2", text = "Ask me anything, friend; the stew downstairs won't be ready for an hour." },
      },
      choices = {
        { text = "Show me your recipes.", next = "BUSINESS" },
        { text = "Where do you find them all?", next = "find" },
        { text = "What's your favourite dish?", next = "favourite" },
        { text = "What recipe needs a mage's flame?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What recipes suit a warrior on the march, Kendor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Which game makes the best dish, Kendor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why would you want to cook for a demon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is there really a secret Cathedral bread recipe, Kendor?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What did the Silver Hand eat in the old days, Kendor?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why can't anyone in Stormwind make moonberry juice, Kendor?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What recipe would suit someone in my line, Kendor?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there a recipe from every corner of the kingdom, Kendor?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Kendor.", next = "END" },
      },
    },
    find = {
      lines = { { id = "f_default", text = "I ask, mostly, and I buy, and once or twice I've traded a good bottle for a grandmother's stew. A farmer's wife in Westfall gave me her best recipe the week before she had to leave her farm, and I think of her every time I sell it." } },
      choices = {
        { text = "Do you know what became of her?", next = "find2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    find2 = {
      lines = { { id = "f2_default", text = "I've heard she's sleeping by the canals with the other refugees, and I've meant to go and find her. I'm ashamed to say I haven't yet." } },
      choices = {
        { text = "Go and find her. She'd be glad of a friend.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Leave it be, because you can't help everyone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    favourite = {
      lines = { { id = "fa_default", text = "Stephen's ribs, and I'll never get that recipe out of him, though I've tried for years. Of my own, a good crab cake, because it reminds me of the coast." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've collected recipes all my life and sold them from this room for many years. It's a happy life, and a well-fed one." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend, unless it goes in a pot." } },
  },
}
