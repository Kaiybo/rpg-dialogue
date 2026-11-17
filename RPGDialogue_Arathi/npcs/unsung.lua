-- Refuge Pointe's macecrafter, with nothing to say until now. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "jannos", id = TODO_NPC("Jannos Ironwill"), name = "Jannos Ironwill",
  title = "Superior Macecrafter",
  bible = "bibles/unsung.md", role = "blacksmith", tier = "service",
  communities = { "refuge_pointe" }, temper = { "stubborn", "steady" }, values = { "loyal", "practical" },
  notices = { "class", "kit" },

  impression = {
    first = "Jannos Ironwill forges maces for the soldiers of Refuge Pointe and has the patience of a dwarf who has watched too many wars. He believes the Highlands can be won back one cracked skull at a time.",
    third = "{name} met Jannos Ironwill, the macecrafter of Refuge Pointe.",
  },

  greetings = {
    { id = "g_forge", text = "Maces, hammers and flails, all of them made to crack an ogre's head. Have a look, friend." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the Pointe, eh? Still swingin', I hope." },
  },

  notice = {
    { id = "n_holy", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "One of the Light's own, eh? I've made maces for the Silver Hand in my day, friend, and I'll make one for ye just as gladly, blessed or not." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Yer kit's had a beating, and from the look of the dents, it was the Boulderfist. They hit like a rockslide, so ye'll want something heavy to hit back with." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Aye, they suit it well, for an ogre's skull doesn't care much for a sword. The League means to take the whole of Arathor back, every hill, and they'll need every mace I can make to do it." } },
      choices = {
        { text = "Take it all back. The Highlands should be Arathor's.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Take back the towns, and leave the hills wild.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A heavy mace, for trolls heal faster than any beast I've known, an' a blade's cut closes near as fast as ye made it. Crack the bone, though, an' even a troll has tae stop an' think about it." } },
      choices = {
        { text = "Steel and discipline will win back the Highlands.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Win it back however we can. Rules won't break bone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Jannos.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "When the hunters ask, an' they ask more now the raptors have come down from the hills tae pick at the soldiers' camps. A good point'll go through raptor hide like it's cloth, an' I've seen what a bad one does, which is bounce." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Yer {pet} has been sniffin' round my anvil since ye walked in, an' I'll take that as a compliment tae my work. Mind its nose, though, for the iron's still hot." },
      },
      choices = {
        { text = "Good work deserves fair coin. I'll pay your price.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A hunter's purse is thin. I'll haggle you down.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It is in my experience, because a blade asks ye tae cut, but a mace only asks ye tae stop somethin' that's comin' at ye, which suits the gentler sort. I've made maces for chaplains longer than ye've been alive, an' not one o' them ever complained o' the balance." } },
      choices = {
        { text = "A mace defends. I'll use it only when I must.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A weapon's a weapon. Hit hard and pray later.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Maces from my forge, for the most part, because the ogres' hides turn a poor blade an' the trolls' bones don't. Stromgarde's men fight for land their grandfathers held, an' I'd like them tae have the best steel I can give them when they go." } },
      choices = {
        { text = "Fighting for one's home is the most honorable cause there is.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Honor's a word kings use to send men to die.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd forge one for anybody who means to swing it at the Syndicate or the Boulderfist, an' the League o' Arathor needs every arm it can get. But I fought the Horde's warlocks in the Second War, an' I watched what their fire did to Stromgarde's walls, so ye'll forgive me if I keep one eye on that imp." } },
      choices = {
        { text = "That's fair, Jannos. I'll earn your trust.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Watch all you like. My fire's on your side now.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jannos.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, welcome! Ye'll want a mace, then, for every priest I knew in Ironforge carried one, an' a good weight in the hand does wonders for a sermon when the Witherbark aren't listenin'." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now there's a customer who knows what a hammer's for, an' ye'll forgive an old dwarf for lookin' at yer weapon before he looks at yer face." },
        { id = "h_default", key = true,
          text = "Jannos Ironwill, macecrafter. I came to Refuge Pointe to help the League of Arathor take the Highlands back, and since I'm too old to march with them, I make the maces they carry instead." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've a mace or two that'd take an enchantment well, {class}, though I'll warn ye now I've no coin tae pay for it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "They tell me a rogue's no use wi' a mace, {class}, but I've seen a quiet {g:lad|lass} wi' a cudgel do more damage behind a Syndicate camp than a whole squad." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Now there's someone who knows the worth o' a good mace. I forge 'em for every soldier at Refuge Pointe, an' they come back dented, which is how I know they're bein' used." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? I've a few arrowheads coolin' by the forge, an' I'll tell ye now, a dwarf's arrowhead weighs twice what a human's does an' flies twice as true." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid in Refuge Pointe! I doubt ye'll need a mace, but ye're welcome to admire one." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll sell ye a mace if ye want one, lad, though I've a feelin' ye'll rarely swing it, an' I'll ask ye to keep yer wee beastie off me anvil." },
      },
      again = {
        { id = "h_again", text = "What else d'ye want to know about the Pointe?" },
        { id = "h_again2", text = "Go on, friend; I'll keep the forge hot while ye talk." },
      },
      choices = {
        { text = "Show me your maces.", next = "BUSINESS" },
        { text = "What's the League of Arathor?", next = "league" },
        { text = "Who are the soldiers fighting out there?", next = "enemies" },
        { text = "Why does a dwarf care about Arathi?", next = "dwarf" },
        { text = "Why aren't Stromgarde's soldiers carrying enchanted maces?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the Syndicate use rogues of their own?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is a mace really a priest's weapon, Jannos?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do the soldiers of Refuge Pointe carry into battle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What's the best weapon against the Witherbark, Jannos?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you forge arrowheads as well as maces, Jannos?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do maces suit the work of taking back the Highlands?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you forge a mace for a warlock, Jannos?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Aye, the Syndicate are thieves an' cutthroats wi' noble names, the leftovers o' Alterac's lords, an' they've more knives than honor. If ye know their tricks, I'd sooner ye used 'em against the Syndicate than sold 'em tae the highest bidder." } },
      choices = {
        { text = "I'll use what I know against them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Knowledge goes to whoever pays the most.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk of maces instead.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because enchanters want gold, an' Stromgarde's down tae tents an' promises, an' I'll no take a soldier's last silver for a glowin' head on a stick. A good dwarven mace swung hard does the job well enough, an' it doesnae need a spell tae remember how." } },
      choices = {
        { text = "Simple steel is honest. I respect that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Without magic, Stromgarde will never retake its keep.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    league = {
      lines = {
        { id = "l_default", text = "What's left of Stromgarde, friend, and the folk who still want it back. The keep fell to ogres and trolls and worse, and the survivors gathered here on the Pointe and swore they'd retake every stone of it." },
      },
      choices = {
        { text = "Can they do it?", next = "league_can" },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_can = {
      lines = {
        { id = "lc_default", text = "Not alone, they can't, and the Alliance has other wars on its mind. But folk like ye come through every week, and every ogre ye put down is one fewer at Stromgarde's walls, so who's to say?" },
      },
      choices = {
        { text = "I'll do what I can.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "It's a lost cause, I think.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies = {
      lines = {
        { id = "e_default", text = "Boulderfist ogres in the hills, Witherbark trolls in the east, and the Syndicate skulking around the old manors. Then there's the Horde at Hammerfall, if ye count them, and I do, because those orcs watch this road as closely as we watch theirs." },
      },
      choices = {
        { text = "The Syndicate are in Arathi too?", next = "enemies_syndicate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies_syndicate = {
      lines = {
        { id = "es_default", text = "Aye, thieves from Alterac in fine coats, and they've taken over the old farms north of here. They'd sell the whole Highlands to the ogres if they thought it'd bring back their old titles, the scoundrels." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = {
        { id = "d_default", text = "Because Stromgarde's soldiers fought beside Ironforge in the Second War, and a dwarf doesn't forget a debt like that. When the keep fell, there were some of us who thought we owed them more than a letter of sympathy." },
        { id = "d_dwarf", when = { race = "Dwarf" },
          text = "Ye'll know already, kinsman: Stromgarde's men stood with Ironforge when the Horde came over the mountains. When the keep fell, some of us thought we owed them more than a letter of sympathy." },
      },
      choices = {
        { text = "That's real loyalty.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I worked a forge in Ironforge for longer than ye've been alive, friend, and came here when the League called for smiths." } },
    advice = { { id = "tp_ad", text = "Swing from the shoulder, not the wrist. Yer wrist will thank ye." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye, friend. Ask Captain Nials; he hears everything first." } },
  },
}
