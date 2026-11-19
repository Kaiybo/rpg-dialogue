-- Refuge Pointe's macecrafter, with nothing to say until now. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "jannos", id = TODO_NPC("Jannos Ironwill"), name = "Jannos Ironwill",
  title = "Superior Macecrafter",
  bible = "bibles/unsung.md", role = "blacksmith", tier = "service",
  communities = { "refuge_pointe" }, temper = { "stubborn", "steady" }, values = { "loyal", "practical" },
  notices = { "class", "kit", "lock_shadow" },

  impression = {
    first = "He would win the Highlands back one cracked skull at a time.",
    third = "{name} met Jannos Ironwill, the macecrafter of Refuge Pointe.",
  },

  greetings = {
    { id = "g_forge", text = "Maces, hammers an' flails, every one o' them made tae crack an ogre's head. Have a look, friend." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the Pointe, eh? Still swingin', I hope." },
  },

  notice = {
    { id = "n_holy", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "One of the Light's own, eh? I've made maces for the Silver Hand in my day, friend, and I'll make one for ye just as gladly, blessed or not." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Yer kit's had a beating, and from the look of the dents, it was the Boulderfist. They hit like a rockslide, so ye'll want something heavy to hit back with." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "My forge fire went low an' blue when ye stepped up, an' that's happened only once before, when a Horde warlock walked past the walls o' Stromgarde. I'll still sell ye a mace, but I'll ask ye tae stand back from the fire while I fetch it." },
  },

  start = "hello",
  nodes = {
    xpt_dwarf = {
      big = true,
      lines = { { id = "xpt_dwarf_default", text = "It's hard being so near and so far at once, {g:lad|lass}, because I can see the Wetlands from the ridge on a clear day and can't get there without a boat or a broken neck. Your friend will understand: a dwarf goes where the work is, but his beard always points home." } },
      choices = {
        { text = "The Span should be rebuilt and the road home opened.", next = "BACK", reply = "It should, {g:lad|lass}, an' one day it will. Until then I'll stand on the ridge an' look at home.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Home is wherever you choose to stand your ground.", next = "BACK", reply = "Aye, an' I've chosen Arathi, for now. The anvil rings the same here as it did in Ironforge, even if the ale doesnae taste half as good.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That the earth was always talkin', {g:lad|lass}, an' most of us were too busy hammerin' to listen, which is a fair description o' my whole life. My forge fire's never once said a word to me, but I'll not tell ye it isn't listenin', for it's been in a mood all week." } },
      choices = {
        { text = "Hammer and stone served Ironforge well. I honour them.", next = "BACK", reply = "Hammer an' stone, aye, an' they built a great city. But they were deaf tae the earth, an' that's no' nothing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ironforge has hammered long enough. It's time we listened.", next = "BACK", reply = "It is, an' I'm glad tae hear ye say it. Maybe one day Ironforge will learn what the earth's been tellin' us.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Aye, they suit it well, for an ogre's skull doesn't care much for a sword. The League means to take the whole of Arathor back, every hill, and they'll need every mace I can make to do it." } },
      choices = {
        { text = "Take it all back. The Highlands belong to Arathor.", next = "BACK", reply = "Every inch, aye, an' every ogre wi' it. Stromgarde's men will thank ye.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Take back the towns, and leave the hills wild.", next = "BACK", reply = "A fair thought, an' a gentle one. I'll put it tae the League, though I doubt they'll listen.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A heavy mace, for trolls heal faster than any beast I've known, an' a blade's cut closes near as fast as ye made it. Crack the bone, though, an' even a troll has tae stop an' think about it." } },
      choices = {
        { text = "Steel and discipline will win back the Highlands.", next = "BACK", reply = "They will, wi' a good mace in the hand. Come back when ye've broken a few troll bones.", fx = { align = { order = 1 } } },
        { text = "Win it back however we can. Rules won't break bone.", next = "BACK", reply = "Rules won't, aye, but a mace will. Pay me fair an' I'll make ye one.", fx = { align = { order = -1 } } },
        { text = "Something else, Jannos.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "When the hunters ask, an' they ask more now the raptors have come down from the hills tae pick at the soldiers' camps. A good point'll go through raptor hide like it's cloth, an' I've seen what a bad one does, which is bounce." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "When the hunters ask, an' they ask more now the raptors have come down from the hills. Yer {pet} has been sniffin' round my anvil since ye walked in, so mind its nose, for the iron's still hot." },
      },
      choices = {
        { text = "Good work deserves fair coin. I'll pay your price.", next = "BACK", reply = "Fair coin for fair work, aye, an' I'll put a head on it that'll ring off a Boulderfist skull like a temple bell.", fx = { align = { honor = 1 } } },
        { text = "A hunter's purse is thin. I'll haggle you down.", next = "BACK", reply = "Ye can try, {g:lad|lass}, but I've haggled wi' worse than ye. Ye'll pay fair.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It is in my experience, because a blade asks ye tae cut, but a mace only asks ye tae stop somethin' that's comin' at ye, which suits the gentler sort. I've made maces for chaplains longer than ye've been alive, an' not one o' them ever complained o' the balance." } },
      choices = {
        { text = "A mace defends. I'll use it only when I must.", next = "BACK", reply = "That's the right way of it. I've seen what a mace does when it's used for anythin' else, an' I'd rather ye never did.", fx = { align = { light = 1 } } },
        { text = "A weapon's a weapon. Hit hard and pray later.", next = "BACK", reply = "Aye, I've known a few priests who think that way. They're the ones still alive.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Maces from my forge, for the most part, because the ogres' hides turn a poor blade an' the trolls' bones don't. Stromgarde's men fight for land their grandfathers held, an' I'd like them tae have the best steel I can give them when they go." } },
      choices = {
        { text = "Fighting for one's home is the most honourable cause there is.", next = "BACK", reply = "It is, an' I'll forge for it till me arms give out. Stromgarde's men have earned it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Honor is a word kings use to send men off to die.", next = "BACK", reply = "Maybe so, but these men chose tae stand. I'll forge them the best I can.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd forge one for anybody who means to swing it at the Syndicate or the Boulderfist, an' the League o' Arathor needs every arm it can get. But I fought the Horde's warlocks in the Second War, an' I watched what their fire did to Stromgarde's walls, so ye'll forgive me if I keep one eye on that wee creature o' yers." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I'd forge one for anybody who means to swing it at the Syndicate or the Boulderfist, an' the League o' Arathor needs every arm it can get. But I fought the Horde's warlocks in the Second War, an' yer {pet} has been edgin' toward my forge fire since ye walked in, so ye'll forgive me if I keep the tongs handy." },
      },
      choices = {
        { text = "That's fair, Jannos. I'll earn your trust.", next = "BACK", reply = "Ye will, if ye swing that fire the right way. I'll be watchin'.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Watch all you like. My fire's on your side now.", next = "BACK", reply = "Good. Then I'll forge ye somethin' wi' a heavy head, an' we'll see where ye point it.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jannos.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_dwarf", tags = { "news" }, when = { party = { race = "Dwarf" }, faction = "Alliance" },
          text = "{companion} has the look of Ironforge about them, and that does my heart good, for there aren't many of my own folk this side of the Thandol Span since the Dark Irons broke it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, an' one o' our own! I've seen a lot o' strange things in three wars, {class}, but a mountain dwarf callin' the lightning is a new one on me." },
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
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf druid in Refuge Pointe! I doubt ye'll need a mace, but ye're welcome to admire one." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I'll sell ye a mace if ye want one, lad, though by those cold hands I've a feelin' ye'll rarely swing it, an' I'll ask ye to keep whatever creeps after ye off me anvil." },
      },
      again = {
        { id = "h_again", text = "What else d'ye want to know about the Pointe?" },
        { id = "h_again2", text = "Go on, friend; I'll keep the forge hot while ye talk." },
      },
      choices = {
        { text = "Show me your maces.", next = "BUSINESS" },
        { text = "I keep hearing of the League of Arathor.", next = "league" },
        { text = "Who are the soldiers fighting out there?", next = "enemies" },
        { text = "Why does a dwarf care about Arathi?", next = "dwarf" },
        { text = "Why aren't Stromgarde's soldiers carrying enchanted maces?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The Syndicate must use rogues of their own.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is a mace really a priest's weapon, Jannos?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do the soldiers of Refuge Pointe carry into battle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What's the best weapon against the Witherbark, Jannos?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess you forge arrowheads as well as maces, Jannos.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do maces suit the work of taking back the Highlands?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you forge a mace for anyone, Jannos, whatever darkness they carry?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What does an old smith make of a dwarf shaman, Jannos?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "It must be hard being so far from Ironforge.", next = "xpt_dwarf", when = { party = { race = "Dwarf" }, faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Aye, the Syndicate are thieves an' cutthroats wi' noble names, the leftovers o' Alterac's lords, an' they've more knives than honor. If ye know their tricks, I'd sooner ye used 'em against the Syndicate than sold 'em tae the highest bidder." } },
      choices = {
        { text = "I'll use what I know against them.", next = "BACK", reply = "Good. Use it well, an' bring me back their knives for the melting pot.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Knowledge goes to whoever pays the most.", next = "BACK", reply = "Then ye'll no' be welcome at my forge. Knowledge an' honour go together, {g:lad|lass}.", fx = { align = { honor = -1 } } },
        { text = "Let's talk of maces instead.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because enchanters want gold, an' Stromgarde's down tae tents an' promises, an' I'll no take a soldier's last silver for a glowin' head on a stick. A good dwarven mace swung hard does the job well enough, an' it doesnae need a spell tae remember how." } },
      choices = {
        { text = "Simple steel is honest. I respect that.", next = "BACK", reply = "It is, an' I'm proud of it. Steel doesnae lie tae ye, an' it doesnae need a spell renewed every fortnight either.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Without magic, Stromgarde will never retake its keep.", next = "BACK", reply = "Maybe no', but it'll keep its soldiers alive long enough tae try. That's all I can give 'em.", fx = { align = { order = -1 } } },
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
        { text = "I'll do what I can, Jannos.", next = "BACK", reply = "That's all I ask, {g:lad|lass}, an' more than most give. Every ogre ye fell is a stone back in the wall.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "It's a lost cause, if you ask me.", next = "BACK", reply = "Maybe it is, an' maybe no'. I'll keep the forge lit till the League tells me otherwise.", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies = {
      lines = {
        { id = "e_default", text = "Boulderfist ogres in the hills, Witherbark trolls in the east, and the Syndicate skulking around the old manors. Then there's the Horde at Hammerfall, if ye count them, and I do, because those orcs watch this road as closely as we watch theirs." },
      },
      choices = {
        { text = "I didn't know the Syndicate were in Arathi too.", next = "enemies_syndicate" },
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
    stromgarde = { { id = "tp_stromgarde", text = "Stromgarde's soldiers need maces, an' I forge them as fast as these old arms let me. Every cracked ogre skull is one step closer tae the city gates." } },
    magni = { { id = "tp_magni", text = "The King o' Ironforge sent me here tae help Stromgarde, an' I'll stay till the job's done. Magni's a good king, an' a better dwarf." } },
    second_war = { { id = "tp_second_war", text = "I forged maces for the Second War, an' I'm forgin' them still, an' I'll be forgin' them when me beard's gone white. Somebody always needs a skull cracked, it seems." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, friend. Ask Captain Nials; she hears everythin' first." } },
  },
}
