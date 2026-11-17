-- Astranaar's shopkeepers (0.39.0): Haljan Oakheart's general goods, Xai'ander's weapons,
-- Aeolynn the clothier and Maliynn's food and drink. Voices: bibles/unsung.md.
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC = P.TODO_NPC

-- Haljan Oakheart: general goods in Astranaar.
P:NPC {
  key = "haljan", id = TODO_NPC("Haljan Oakheart"), name = "Haljan Oakheart", title = "General Goods",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "astranaar" }, temper = { "steady", "plainspoken" }, values = { "community", "endurance" },
  notices = { "weary" },
  impression = {
    first = "Haljan Oakheart keeps Astranaar's general store stocked no matter how many supply carts the Horde turns back. He is plainspoken and steady, the sort of person a village under siege leans on.",
    third = "{name} met Haljan Oakheart, who keeps Astranaar supplied through the war.",
  },

  greetings = {
    { id = "g_default", text = "Come in off the bridge. Whatever you need for the road, I likely have it, or I'll have it when the next cart gets through." },
    { id = "g_back", when = { metBefore = true }, text = "Back in one piece. Good; I like customers who come back." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look like you've been dragged through the Thistlefur's whole hold and back. Sit a moment before you buy anything." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They are, more each week. I stay steady. A shaman's lightning would help the carts get through." } },
      choices = {
        { text = "Then I'll guard the carts, Haljan.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the soldiers guard carts. I'm not a wagon guard.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It reaches everything, because every cart the orcs turn back is flour and thread that never arrives. The druids tell me the forest will outlast the Warsong, and I believe them, but the forest doesn't bake bread." } },
      choices = {
        { text = "Then the Sentinels must hold the roads, whatever it costs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then trade with whoever can get through, goblins included.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Half of them this season, and the other half arrive late and short. The Sentinels can't guard every cart, so when a warrior's going the same way I ask, and most of them are good enough to say yes." } },
      choices = {
        { text = "I'll guard your carts. Astranaar needs its bread.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'm no cart guard. Hire someone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Scarcer every season, because the logging drives the stags deeper and the wolves follow them. The hunters who bring meat to Astranaar walk twice as far as they used to, and I don't know how much farther they can go." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks well fed, at least, so you must know where the game's gone. Keep it close on the roads, because the Warsong have no love for elven beasts." },
      },
      choices = {
        { text = "I'll hunt farther so Astranaar eats.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Scarce game means better prices for me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No, but I've learned not to guess, and a wise shopkeeper counts the shelves either way. If you want to be useful, find out which of the Warsong scouts has been watching my carts on the eastern road, and I'll count you a friend." } },
      choices = {
        { text = "I'll find the scout and drive him off in the open.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll find him, and his own camp will lose a cart.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I'd settle for someone who could ride beside them and turn the Warsong's arrows, because my drivers are carters and not soldiers. The Sentinels can't guard every cart, and the hippogryphs carry too little to feed a whole town." } },
      choices = {
        { text = "I'll ride with your next cart and keep it safe.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Carts are your trouble, Haljan, not mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Often enough that I keep a cot in the back, and the orcs make sure of the rest. If you're in Astranaar a while, I'd be glad to send for you when the next cart limps in." } },
      choices = {
        { text = "Send for me whenever a cart comes in hurt.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'm not staying long enough to be your healer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd not say no, though I can't pay a paladin's worth for it. Plain work, keeping bread on the shelves, but a village under siege lives or dies by it." } },
      choices = {
        { text = "I'll ride escort. Plain work is still good work.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I didn't come here to guard bread carts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Likely none, but the Sentinels buy their bread from me, and if one of them smells sulphur on a loaf I'll lose half my trade by morning. With the Warsong turning back my carts already, I can't afford to lose the other half." },
      },
      choices = {
        { text = "Right, then. It can wait outside.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The Sentinels can learn to tolerate us.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Haljan Oakheart, and I keep the general goods here in Astranaar: bread, water, bags and thread. With the orcs on the roads, half my work is getting the goods here in the first place." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I keep my eye on the satchels when your sort come in, no offence meant, because a shop under siege can't spare a single loaf. If you're buying, though, you're as welcome as anyone." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You're a mage, and you'll travel light, I expect, though even mages need thread and a good bag. If you know a spell that keeps the Warsong off my eastern road, you'd be the most popular person in Astranaar." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. If you're heading out on the roads, you could do worse than keep an eye on my supply carts while you're at it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want food for the road, and something for your companion, and I've both." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Good, because half the carts that make it here come in with someone hurt aboard, and I'm no healer." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The carts could use one riding alongside them, because the Warsong have turned back more than I'd like." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'd guess you came through the woods instead of along the road, and I wish my supply carts could do the same." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll sell you thread and bread like anyone else, though I'd ask you not to bring your companion in among the flour sacks." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Supply carts keep getting turned back by the Horde, but I keep Astranaar stocked. Your spirits might guard the carts." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask away." },
        { id = "h_again2", text = "Go on, I've time between carts. The last one came in with a wheel off and furbolg teeth marks in the flour sacks." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "How do supplies reach Astranaar?", next = "supply" },
        { text = "Is Astranaar safe?", next = "safe" },
        { text = "Do you really think I'd rob a village under siege?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there a spell that could help your carts?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have the Warsong been raiding your supply carts, Haljan?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is game scarce now the Warsong are cutting the forest?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the supply carts come in with wounded often?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should I ride escort for your supply carts?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has the war with the Warsong reached your shelves, Haljan?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What harm would my servant do among your flour?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are the Warsong raiding your supply carts, Haljan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Haljan.", next = "END" },
      },
    },
    supply = {
      lines = {
        { id = "su_default", text = "By cart from Maestra's Post in the north and by hippogryph when the carts can't make it. Lately the Warsong have been watching the eastern road, so more comes by air than I'd like, because hippogryphs don't carry much flour." },
      },
      choices = {
        { text = "Has the Horde attacked your carts?", next = "supply2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply2 = {
      lines = {
        { id = "su2_default", text = "Twice this season, and both times the drivers ran for the trees and lived, which is all I asked of them. The flour was lost, but flour can be replaced, and I'd rather go hungry than bury a driver." },
      },
      choices = {
        { text = "The Horde should pay for every cart.", next = "BACK", fx = { align = { light = -1 }, learn = { "warsong" } } },
        { text = "Lives first. You chose rightly.", next = "BACK", fx = { align = { light = 1 }, affinity = 1, learn = { "warsong" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = {
        { id = "sa_default", text = "Safer than anywhere else in Ashenvale, with Lake Iris all around and the Sentinels on the bridges. But I keep a bow behind the counter all the same, and so does everyone else in town." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
  },

  topics = {
    warsong = { { id = "tp_ws", text = "The Warsong watch the eastern road now. My carts go north and around." } },
    background = { { id = "tp_bg", text = "I keep the general goods in Astranaar. I've done it since before the orcs came to the forest." } },
    advice = { { id = "tp_ad", text = "Keep enough food for two days, even on a short trip. The roads here get closed without warning." } },
    thrall = { { id = "tp_thrall", text = "The orcs' warchief seems a reasonable sort, from the stories. I'd like him a good deal more if his Warsong stopped cutting my neighbours' trees." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire sells trinkets that fall apart by the time you get home. I sell honest supplies that don't, and I still sell less." } },
    blackfathom = { { id = "tp_blackfathom", text = "Folk heading to Blackfathom buy rope, torches and extra bread. I've stopped asking what they need the rope for." } },
    _none = { { id = "tp_none", text = "Can't say I know. Ask Sentinel Thenysil; she hears everything." } },
  },
}

-- Xai'ander: weaponsmith in Astranaar.
P:NPC {
  key = "xaiander", id = TODO_NPC("Xai'ander"), name = "Xai'ander", title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "astranaar" }, temper = { "intense", "grim" }, values = { "defense", "vigilance" },
  notices = { "class", "race" },
  impression = {
    first = "Xai'ander sells weapons in Astranaar and talks about the Warsong as if they were standing at the door. His blades are good, and his anger at the orcs is never far from the surface.",
    third = "{name} met Xai'ander, Astranaar's grim weaponsmith.",
  },

  greetings = {
    { id = "g_default", text = "If you're fighting for Ashenvale, I'll arm you. If you're not, there are other shops." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. How many orcs did that blade see?" },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Your smiths work steel better than mine, I'll admit, and I keep a few Ironforge axes in the back for anyone who'd rather trust them." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Good, the Sentinels need people who can stand in front of an axe. I've something heavier than that, if you're interested." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I hate the Warsong, and you are not Warsong. Still, the lightning looks the same. Prove you're different." } },
      choices = {
        { text = "I'll prove it, Xai'ander. I fight for Astranaar.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Hatred clouds your judgement.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I do, and I've said so to their faces, because the Circle talks of balance while the orcs chop down trees older than Astranaar. A bear can break an orc's back as well as any blade I sell, so I don't see why your kind should hold back." } },
      choices = {
        { text = "We fight when we must, but we won't become butchers.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You're right. Every axe-swinger in this forest should fear us.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Something long, because an orc axe is short and brutal, and a warrior with reach can keep it off you. Strike at the hands that hold the axe, and they'll stop cutting trees soon enough." } },
      choices = {
        { text = "I'll drive them out, not slaughter them all.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every orc in this forest dies. No exceptions.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They hunt anything that moves near their camps and leave the rest to burn when the trees come down. A hunter who's seen what a Warsong clearing looks like doesn't need me to tell them why I sell good blades." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would tear an orc apart, I'd wager, and I'd be glad to see it. Keep it clear of their camps, though, because the Warsong keep wolves of their own." },
      },
      choices = {
        { text = "I'll serve where the Sentinels send me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll hunt the orcs on my own terms.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not much, though the Sentinels tell me I should, since they fight in the open under Elune's eye. The orcs who killed my friends at the lumber camps didn't give them a fair fight, so I won't weep if you don't give them one." } },
      choices = {
        { text = "I'll fight them fairly. That's what separates us from them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "They earned a knife in the dark. I'll give it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I'd trust your frost and I'd not trust your fire, because the Warsong burn enough of this forest without our allies helping them. The Sentinels mutter about the arcane, but I've stopped caring what kills an orc so long as the trees live." } },
      choices = {
        { text = "No fire in the forest, then. Frost will serve.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fire wins battles. The trees can grow back.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It comforts the wounded, and I'll not mock that, but it never stopped an axe. Pray for the forest by all means, and then carry something heavy into it." } },
      choices = {
        { text = "Prayer and steel together, then. Both have their place.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. Steel does more than prayer out there.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not while they cut our trees, and they'll not stop cutting while there's an orc in Splintertree. I'd see them driven out, and I don't much care how." } },
      choices = {
        { text = "They should be driven out, but by honourable means.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Any means will do, so long as they go.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Close enough for me, because their chieftain drank Mannoroth's blood and the whole clan went mad with it, and they're cutting our trees still. You bind your demons rather than drink from them, I'm told, but I've yet to see the difference with my own eyes." },
      },
      choices = {
        { text = "Then watch me kill orcs, and decide for yourself.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I don't owe you an explanation, smith.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Xai'ander, and I sell weapons in Astranaar. Every blade I sell might be the one that keeps an orc axe off a tree, so I don't sell bad ones." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You carry yourself like a rogue, and that suits me, because an orc can't swing an axe at what he never sees coming. I've daggers in the back sharp enough for the work." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage won't buy my blades, but I'll speak with one all the same, because frost stops an orc's charge as well as steel does." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Good, because every blade I sell a warrior is one more between the Warsong and the trees." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll be wanting a blade for when the orcs get close, because they always get close." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want a mace or a staff, because the orcs won't wait for you to finish your prayers." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Then you've seen orcs at war, and you'll understand why I don't sell anything blunt or badly made." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The Warsong are felling the old trees by the dozen, and I'll wager you feel every one of them come down." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. The Warsong drank demon blood before they ever came to these woods, so you'll forgive me if I don't care to see that craft again." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Orc shamans call lightning down on Astranaar's scouts. You'll forgive me if I flinch at your totems." },
      },
      again = {
        { id = "h_again", text = "What else? I've blades to sharpen." },
        { id = "h_again2", text = "Speak, then. This edge is chipped from some Warsong grunt's skull, and it wants work." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "You sound angry about the orcs.", next = "angry" },
        { text = "What weapon suits Ashenvale?", next = "suits" },
        { text = "Do you care how an orc dies, Xai'ander?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you trust a mage beside your Sentinels?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What blade would you give a warrior facing the Warsong?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the Warsong hunt the forest's beasts as well?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you think prayer does any good against the Warsong?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is there any end to the war with the Warsong?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think druids are too gentle with the Warsong?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is my craft the same as the Warsong's, Xai'ander?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you hate all shamans for the orcs' sake, Xai'ander?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    angry = {
      lines = {
        { id = "an_default", text = "They came to our forest to cut down our trees for their war, and when we said no, they killed the Sentinels who said it. I've every right to be angry, and I'd like to know why everyone else isn't." },
      },
      choices = {
        { text = "Some orcs want peace, though. Thrall signed a treaty.", next = "angry2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    angry2 = {
      lines = {
        { id = "an2_default", text = "With the humans, perhaps, but the axes in Ashenvale didn't stop falling when he signed it. I'll believe in his peace when the lumber camps go quiet." },
      },
      choices = {
        { text = "The orcs must be driven from the forest.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1, learn = { "warsong" } } },
        { text = "Peace needs someone to try first.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1, learn = { "warsong" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    suits = {
      lines = {
        { id = "su_default", text = "Something you can swing between trees without catching a branch, so nothing too long. The Sentinels favor glaives and bows, but for most travelers a sword or a mace does the job well enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
  },

  topics = {
    warsong = { { id = "tp_ws", text = "The Warsong cut our trees and kill our Sentinels. Every blade I sell is meant for them." } },
    background = { { id = "tp_bg", text = "I sell weapons in Astranaar. I've lost friends to the orcs, and that's all I'll say about it." } },
    thrall = { { id = "tp_thrall", text = "Thrall's orcs killed my brother at the lumber camps. I've nothing more to say about the warchief than that." } },
    blackfathom = { { id = "tp_blackfathom", text = "If you're going into Blackfathom, buy a short blade. Long ones catch on the walls, and the nagas are faster than they look." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "There's an arena in Stranglethorn for people who like to fight for coin. I prefer to sell to people who fight for a reason." } },
    _none = { { id = "tp_none", text = "I don't know, and I've more urgent things to think about." } },
  },
}

-- Aeolynn: clothier in Astranaar.
P:NPC {
  key = "aeolynn", id = TODO_NPC("Aeolynn"), name = "Aeolynn", title = "Clothier",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "astranaar" }, temper = { "gentle", "wistful" }, values = { "beauty", "peace" },
  notices = { "class" },
  impression = {
    first = "Aeolynn sells cloth armor in Astranaar and tries to keep a little beauty in a town at war. She spoke of Ashenvale before the orcs came with real longing.",
    third = "{name} met Aeolynn, Astranaar's wistful clothier.",
  },

  greetings = {
    { id = "g_default", text = "Welcome. Robes, gloves, a good cloak for the rain; whatever you need, I hope I have it." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. I'm glad; it's nice to see a familiar face these days." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "MAGE", "WARLOCK" } },
      text = "You'll want robes, then, and something with a good hem for walking these wet paths. Let me see what I have in your size." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I miss it with all my heart. It was beautiful, before the axes. Your spirits might remember it too." } },
      choices = {
        { text = "It can be beautiful again, Aeolynn.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The past is gone. Look forward.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Quieter, and so green it almost hurt your eyes in the morning, because nobody had yet cut the old groves where the Warsong camps stand now. The druids say it will all grow back in time, but their time is longer than I'd like to wait." } },
      choices = {
        { text = "It will grow back. We must be patient and tend it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Patience is how we lost it. We should take it back.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not as it does now, because the forest was quiet and the Sentinels kept it so with very little steel. I remember when Astranaar's Sentinels wore silk under their armor for the beauty of it, and nobody needed to tell me what a Warsong axe looked like." } },
      choices = {
        { text = "I'll fight so the forest can be quiet again.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The forest was never safe. You just didn't see it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The stags walked into Astranaar some mornings, bold as anything, and the hunters left them alone out of courtesy. Now they hide deep in the forest, and I can't blame them, because I'd hide too if I could." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has beautiful fur, and I'm a seamstress, so I'm allowed to notice. Don't worry, I only work with cloth." },
      },
      choices = {
        { text = "I'll help bring those mornings back.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The past is gone. I hunt what's here now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Often enough, because my people turned from the arcane after the Sundering, and some of them have never stopped flinching at it. I think it's sad that something so beautiful should frighten us, but I wasn't alive when the Well drowned, so perhaps I don't understand." } },
      choices = {
        { text = "Their caution is earned. I'll give them no reason to flinch.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fear shouldn't rule what's beautiful. Let them stare.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A little, because the satyrs who creep out of the dark woods at night were once my people, and they started with a bargain much like yours. But you came in and asked about cloth like anyone else, and I'd like to believe that counts for something." } },
      choices = {
        { text = "It counts. I'll never become what they became.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Their bargain failed. Mine won't, and I'll go further.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The priestesses come for robes, and the wounded come for linen, and I'd say the second visit is the sadder one. I sew both as well as I can, because both matter." } },
      choices = {
        { text = "Your work matters as much as any healer's.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Cloth won't save anyone from the Warsong.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I try to, because a town that forgets beauty forgets what it's fighting for. You protect the trees with your hammer, and I'll keep a little colour in the market." } },
      choices = {
        { text = "Then I'll protect what's beautiful here, too.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Beauty can wait until the war is won.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Because nothing in Ashenvale is truly black except the burned ground round the Warsong camps, and a black cloak stands out like a crow on snow under these trees. The scouts who go out for the Sentinels wear green and grey, and I've never once spotted them in the forest, which is rather the point." },
      },
      choices = {
        { text = "Green, then. I'll learn from the Sentinels' scouts.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll wear what I like. A dark night does the rest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Aeolynn, and I sell cloth armor here in Astranaar. It isn't much protection against an orc's axe, I know, but it keeps the rain off, and the priestesses tell me it suits them better than mail." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You'll want a robe with deep sleeves for your reagents, I expect, and I've a few with good hems for these wet paths. I sewed for the moon festivals once, so I know how to make a mage look lovely, though the Sentinels may still stare." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I've a deep violet cloth that hides scorch marks well, if you're looking for something dark to wear. Forgive me, but your imp keeps looking at my silks, and I'd rather it didn't." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. My robes won't stop an axe, but I've a few sturdy cloaks, if you'd like something to keep the rain off your mail." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll have seen how the forest looked before the Warsong cut into it, I hope." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I sell robes the priestesses like, and I'm sure I have something that would suit you, whatever you pray to." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I'm afraid my cloth won't stop an axe, but I could line your gambeson if it's rubbing under the plate." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The priestesses wear my robes, but your people always ask for colours that won't show the moss, and I've never decided whether that's practical or sad." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You'd want something dark and close-fitting, I imagine, that won't catch on the branches. I've a forest-green cloth that does better in Ashenvale than black, if you'll let me show you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I try to keep a little beauty in a town at war. Do your spirits remember Ashenvale before the orcs?" },
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "Ask what you like; it's quiet today, and every cloak I own is still damp from last week's rain." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What was Ashenvale like before the war?", next = "before" },
        { text = "Where does your cloth come from?", next = "cloth" },
        { text = "Do the Sentinels stare at mages often?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Did Ashenvale need warriors before the orcs came?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Was the hunting better in Ashenvale before the orcs came?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does my craft frighten you, Aeolynn?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do priests come to you often, Aeolynn?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Can Astranaar keep anything beautiful while it's at war?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What was Ashenvale like before the orcs came, Aeolynn?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why green rather than black for a rogue, Aeolynn?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you miss Ashenvale as it was, Aeolynn?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Aeolynn.", next = "END" },
      },
    },
    before = {
      lines = {
        { id = "be_default", text = "Quiet, and green all the way to the mountains, with the furbolgs as our neighbors and the moonwells clear. Now the furbolgs have gone mad, the satyrs come out at night and the orcs are cutting the trees, and I can't remember the last time I walked by the lake for pleasure." },
      },
      choices = {
        { text = "Do you think it can be like that again?", next = "before2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before2 = {
      lines = {
        { id = "be2_default", text = "I hope so, but hope isn't a plan, and the Sentinels are stretched thin. If enough travelers like you stay to help, maybe, but most of them pass through on their way somewhere else." },
      },
      choices = {
        { text = "I'll do my part to set it right.", next = "BACK", fx = { align = { order = 1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "The forest has to save itself. I'm passing through.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "satyrs" } } },
      },
    },
    cloth = {
      lines = {
        { id = "cl_default", text = "Some I weave myself, and some comes from Darnassus when the hippogryphs can carry it. The tailors there make finer cloth, but mine is sewn for Ashenvale's damp, so it lasts longer here." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    satyrs = { { id = "tp_sat", text = "They come out of the dark woods at night. I lock my door and don't look out the window." } },
    background = { { id = "tp_bg", text = "I sell cloth armor in Astranaar. I used to sew for festivals; now I sew for soldiers." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I used to sew costumes for festivals, and I'd love to sew for the Darkmoon Faire. Their colours are wild, I'm told, and nobody's ever asked them to tone it down." } },
    elune = { { id = "tp_elune", text = "I sewed robes for Elune's festivals before the war came to Ashenvale. Now I sew padding for Sentinels, which is a prayer of a kind." } },
    theramore = { { id = "tp_theramore", text = "Theramore cloth is heavy and plain, and very sensible. I'd make something lovelier, but nobody asks." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Perhaps Innkeeper Kimlya could tell you." } },
  },
}

-- Maliynn: food and drink vendor in Astranaar.
P:NPC {
  key = "maliynn", id = TODO_NPC("Maliynn"), name = "Maliynn", title = "Food & Drink Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "astranaar" }, temper = { "cheerful", "motherly" }, values = { "care", "hospitality" },
  notices = { "hunger" },
  impression = {
    first = "Maliynn sells food and drink in Astranaar and seems to think everyone who comes in from the forest is too thin. She fusses, but her bread is very good.",
    third = "{name} met Maliynn, who feeds Astranaar's Sentinels and travelers alike.",
  },

  greetings = {
    { id = "g_default", text = "You look half-starved! Sit down, sit down, and let me find you something warm." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still too thin. What can I get you?" },
  },

  notice = {
    { id = "n_young", cat = "hunger", when = { maxLevel = 22 },
      text = "You're young to be this far from home, aren't you? Make sure you eat properly; the Sentinels never do, and look at them." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I feed everyone who looks thin, which is everyone. My bread is very good. Your spirits might agree." } },
      choices = {
        { text = "Thank you, Maliynn. Your kindness matters.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'm not thin. Save it for others.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The young ones come in starving after a week in the woods, and the old ones swear they don't need my bread and then eat three loaves. The forest feeds them less than it used to, with the Foulweald gone sour and the orcs scaring off the game." } },
      choices = {
        { text = "I'll pay for my bread and leave the forest's food alone.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The forest's food is free. I won't pay for bread.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Never well enough, because they're always in a hurry and they think hunger keeps them sharp. I tell them an empty stomach makes them slow, and the ones who listen come back to tell me I was right." } },
      choices = {
        { text = "You're right. I'll eat before I fight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hunger keeps me sharp. I'll eat later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Whatever it likes, so long as it's fresh and there's plenty of it, because a hungry beast is a cross beast. The cheese is for you and not for it, mind, because cheese does terrible things to a cat." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is looking at my bread as if it's never been fed in its life, the poor thing. Feed it properly before you go, dear." },
      },
      choices = {
        { text = "My companion eats first. Always.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "It hunts its own. That keeps it sharp.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every one of them, and they come back from the eastern woods so hungry I could weep, though they never say where they've been. I pack them honey cakes for the road, because a scout lying still in the ferns for half a day needs more than water." } },
      choices = {
        { text = "A scout's work is hard. They deserve every cake.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Scouts should learn to go hungry. It keeps them sharp.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It fills the stomach and does nothing for the heart, dear, because nobody kneaded it and nobody waited for it to rise. The Sentinels eat my bread on the bridge and think of home for a moment, and I don't believe a spell can do that." } },
      choices = {
        { text = "You're right. Bread made by hand is worth more.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Bread is bread, and mine never goes stale.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Only with bread and broth, but you'd be surprised how many of them need that more than a bandage. Eat first, and then go and pray over them, and they'll be glad of both." } },
      choices = {
        { text = "I'll take your bread to them myself.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll eat, but the wounded aren't my concern.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than they should, because they leave in a hurry and come back worse. If you're walking their way, take some bread for whoever you meet." } },
      choices = {
        { text = "I'll carry bread for every patrol I meet.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll carry enough for myself, and no more.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'm more afraid of the Warsong burning my ovens, dear, and a hungry customer is a hungry customer whatever they summon. Just keep the little one away from the cheese, because the Sentinels count it." },
      },
      choices = {
        { text = "Be careful, Maliynn. Not every warlock is as kind.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "There's nothing to fear. My craft is only a tool.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Maliynn, and I keep Astranaar fed: bread, fruit, cheese and water for the road. The Sentinels come in from the forest hungry, and so does everyone else, so I'm never short of customers." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You crept in so quietly I nearly dropped the bread, dear, and you're far too thin for someone who sneaks about for a living. Sit down and eat something before you vanish again." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You've been living on that conjured bread, I can tell by your cheeks, dear. Sit down and have something that came out of a proper oven." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and too thin for the work, I'd say. Eat something before you go and fight the orcs, dear." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, dear, and your companion's thinner than you are. That simply won't do." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Sit and eat, you're thin as a willow, and I'll not have you fainting over some poor scout's bandages." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! That armour must take some feeding, so let me find you something hearty before you go out to the roads." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and thin as a sapling, like all of you who live on berries and moonlight. Sit down and let me find you something with a little more to it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Oh, a warlock, and pale as a candle, dear. Whatever you've been dealing with hasn't been feeding you, so sit down and eat something." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! You look too thin, like everyone from the forest. Eat some bread; your spirits will thank me." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? There's more in the oven." },
        { id = "h_again2", text = "Go on, I'm listening, and eat while you talk. Mind the bones in the stew, for the fish put up a fight." },
      },
      choices = {
        { text = "Let me see your food.", next = "BUSINESS" },
        { text = "Do the Sentinels eat here often?", next = "sentinels" },
        { text = "How do you keep the shop stocked?", next = "stock" },
        { text = "Do the scouts who watch the Warsong camps eat here?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What's wrong with conjured bread, Maliynn?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the Sentinels eat well before they go to the front?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should I feed my companion on the road, Maliynn?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you look after the wounded as well, Maliynn?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the Sentinels ever go hungry on patrol?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the druids eat in town, or live off the forest?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Aren't you afraid of a warlock in your shop, Maliynn?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you feed everyone who comes in, Maliynn?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Maliynn.", next = "END" },
      },
    },
    sentinels = {
      lines = {
        { id = "se_default", text = "Every day, and they never sit down long enough to finish a meal. I've taken to wrapping bread for them so they can eat it on the bridge, because I'd rather they ate on duty than not at all." },
      },
      choices = {
        { text = "That's kind of you.", next = "sentinels2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels2 = {
      lines = {
        { id = "se2_default", text = "It's the least I can do, when they're the ones standing between us and the Warsong. I can't hold a glaive, but I can make sure the ones who do aren't fighting on an empty stomach." },
      },
      choices = {
        { text = "Every part matters in a war.", next = "BACK", fx = { align = { light = 1 }, affinity = 1, learn = { "sentinels" } } },
        { text = "Wars are won by soldiers, not cooks.", next = "BACK", fx = { align = { light = -1 }, affinity = -1, learn = { "sentinels" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = {
        { id = "st_default", text = "Haljan brings in flour when the carts get through, and the rest I grow or gather on the island. It's not a feast, but nobody in Astranaar has gone hungry yet, and I mean to keep it that way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    sentinels = { { id = "tp_sent", text = "They guard the bridges day and night. I make sure they eat something while they do it." } },
    background = { { id = "tp_bg", text = "I sell food and drink in Astranaar. I've fed more Sentinels than I can count." } },
    advice = { { id = "tp_ad", text = "Eat before a fight, not after. You'll fight better, and you might not get the chance afterwards." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire sells sweets that'd make any Sentinel forget her post. I'm glad it never comes this far into the forest." } },
    theramore = { { id = "tp_theramore", text = "Theramore soldiers passing through always want something hot and heavy. I make them a stew, and they look at me like I've saved their lives." } },
    elune = { { id = "tp_elune", text = "I say a little prayer to Elune over every pot. I can't swear it makes it taste better, but nobody's complained." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. Have some bread and ask Haljan." } },
  },
}
