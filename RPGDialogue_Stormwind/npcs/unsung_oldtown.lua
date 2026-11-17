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
    hello = {
      lines = {
        { id = "h_default", text = "Gerik Koen, of Heavy Handed Weapons. Greatswords, great axes, mauls and polearms, and nothing you can hold in one hand, because one-handed folk can shop at Weller's." },
        { id = "h_priest", when = { class = { "PRIEST", "MAGE", "WARLOCK" } }, text = "You've wandered into the wrong shop, I think, unless you're buying for a friend. A greatsword would only drag you over, but you're welcome to look." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid! I've a fine staff or two at the back, heavy enough to put a bear to sleep, though I suppose you'd rather be the bear." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in a shop full of greatswords? You'll want daggers, friend, and Weller sells those, because nothing in here fits up a sleeve." },
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
        { text = "Would a greatsword serve a warlock at all?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
    hello = {
      lines = {
        { id = "h_default", text = "Maris Granger. Do I look like I have the time to coddle every tourist who wanders through that door? I teach skinning, and I don't get many skinners asking, so if you're serious, I'll teach you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You've a knife already, so you're halfway to a skinner, if you can stomach the rest of it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, in my shop? You'll be wanting to skin something you've already roasted, I expect, and I'll tell you now that it doesn't work." },
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
    hello = {
      lines = {
        { id = "h_default", text = "Jillian Tanner. Simon teaches the craft, Randal helps, and I sell the thread, the dye and the salt, at a price that's fair and doesn't move." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid in a leather shop. I've seen your sort wince at the pelts, so I'll say plainly that we waste nothing and kill nothing for sport." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll want soft leather and dark dye, and plenty of both. I sell them at the same price to everyone, thieves included." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I've dye for every colour except the one your demons leave on a rug, so mind where it stands." },
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
        { text = "Do warlocks buy much from you, Jillian?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
    hello = {
      lines = {
        { id = "h_default", text = "Alyssa Griffith. I sell bags, and I'll tell you for nothing that half of what goes wrong on the road goes wrong because somebody had to leave something behind." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter! You'll want a quiver as well as a bag, and you'll need both bigger than you think." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll want a bag that doesn't rattle. I've a few lined with felt, and they're the quietest in the city." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll need room for reagents, scrolls and three days of conjured bread, I expect. Mages always pack like they're leaving forever." },
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
    hello = {
      lines = {
        { id = "h_default", text = "Kendor Kabonka. Stephen downstairs teaches the cooking, and I sell the recipes I've gathered from every farm kitchen and soldier's camp in the kingdom." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! I'd trade three of my best recipes for one of your people's ale-and-meat secrets, and nobody from Ironforge will ever take me up on it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've a recipe that wants a very steady flame, and I've never once got it right on a stove, so you might be the one to try it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! Does your imp eat, I wonder? I've always wanted to cook for something that's never tasted a proper meal." },
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
        { text = "Why would you want to cook for a demon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
