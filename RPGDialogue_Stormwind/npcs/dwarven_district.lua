-- The Dwarven District: smiths, engineers and miners by the Deeprun Tram.
-- Voices: bibles/dwarven_district.md (Grimand Elmore and Furen Longbeard are in city2/city3.)
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Therum Deepforge: blacksmithing trainer and royal armourer.
P:NPC {
  key = "therum", id = TODO_NPC("Therum Deepforge"), name = "Therum Deepforge", title = "Blacksmithing Trainer",
  bible = "bibles/dwarven_district.md", role = "blacksmith", tier = "service",
  communities = { "stormwind" }, temper = { "gruff" }, values = { "proud", "generous" },
  notices = { "smith", "kit" },
  impression = {
    first = "Therum Deepforge looked at my hands before my face and told me what he saw in them. He armours the House of Wrynn and still talks about his old masters in Ironforge as if he were their apprentice.",
    third = "{name} met Therum Deepforge, Stormwind's royal armourer and blacksmithing trainer in the Dwarven District.",
  },

  greetings = {
    { id = "g_apron", text = "Want tae be a smith, eh? Grab an apron an' a hammer." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "Soot under the nails, steel in yer bones. Ye've come tae learn, aye?" },
  },

  notice = {
    { id = "n_smith", cat = "smith", when = { profession = { name = "Blacksmithing", min = 200 } },
      text = "That's fine work ye're wearin', an' I'd wager ye made some of it. I've no' seen better armour since I trained under Grumnus Steelshaper at the Great Forge." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "By my beard, what've ye been fightin', a rockslide? Get that mail off an' let somebody mend it before ye take one more step outside these walls." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No' once in thirty years, because a smith who asks has tae carry the answer around wi' him. I make honest steel, an' what ye do wi' it is between you an' whatever ye pray tae." } },
      choices = {
        { text = "A smith should know whose hand holds his steel.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Steel's steel, and the smith's work ends at the quench.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some o' the Quarter's lot have offered tae heat my iron wi' a spell, an' I've told every one o' them no. Arcane fire burns too even, an' steel needs a fire that argues wi' it a bit." } },
      choices = {
        { text = "Then the old way's best, and I'll keep my spells away.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good spell could teach the old forge a few tricks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A proper fit, first an' last, because plate that pinches will kill ye slower but surer than an axe. Half the guards in this city wear armour cut for someone else, an' it shows in how they move." } },
      choices = {
        { text = "I'll have it fitted right, whatever it costs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it stops a blade, it fits well enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rifles, mostly, an' rams tae carry 'em, back in Dun Morogh, though the old mountaineers swear by the crossbow when the snow's thick. A barrel freezes in the high passes, ye ken, but a good string keeps." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} o' yours would do well in the snow, I'd say. Keep it out o' the forge, though, for the sparks fly further than ye'd think." },
      },
      choices = {
        { text = "Every tool has its place. Bow or rifle, it's the hand that counts.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A rifle beats a bow every time. Ask any mountaineer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Therum Deepforge, armourer tae the House o' Wrynn, though these days that means fittin' guards more than kings. If ye want tae learn the hammer, I'll teach ye, an' if ye don't, mind the sparks." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest in the Dwarven District! We don't see many robes down here; they cannae abide the soot. Stay a moment, then, because the lads could use a kind word as much as a hot forge." },
        { id = "h_human", when = { race = "Human" },
          text = "Yer city was rebuilt by masons an' armed by dwarves, an' I'm proud o' both halves. Whatever else the court forgets, it remembers who made its armour." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A proper Ironforge face! Sit, if ye like, an' tell me how the Great Forge is burnin'; I've no' been home in a while." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye'll be wantin' a blade that's balanced for the throw an' quiet in the sheath, I expect. I've made a few o' those for folk who never gave their names." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage near my forge! Mind the robes, for they go up quicker than ye'd think, an' I've no' got the patience for a fire I didnae light." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Let's have a look at that breastplate, then, for I can tell from here it's been dented an' hammered back by someone who's never held a hammer." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, in a smithy! Ye'll be wantin' a hatchet or a skinnin' knife, I'd guess, for there's no bow in this forge." },
      },
      again = {
        { id = "h_again", text = "Aye? What else?" },
        { id = "h_again2", text = "Go on. The iron's no' hot yet." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Blacksmithing" } },
        { text = "Who taught you?", next = "teachers" },
        { text = "What's it like, armouring a king?", next = "king" },
        { text = "Shall I bless your forge, master smith?", next = "priest", when = { class = "PRIEST" } },
        { text = "Do you ever ask what your blades are used for?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could a mage's fire help a forge, Therum?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does a warrior's armour need most, Therum?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do dwarven hunters prefer rifles or bows, Therum?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll mind the sparks.", next = "END" },
      },
    },
    teachers = {
      lines = { { id = "t_default", text = "Grumnus Steelshaper, at the Great Forge in Ironforge, taught me armour, an' I've no' seen finer since. For weapons, the best I ever met was Borgus Steelhand, though it pains me tae say it." } },
      choices = {
        { text = "Should I go to them?", next = "teachers_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teachers_go = {
      lines = { { id = "tg_default", text = "When ye've learned all I can teach, aye, an' no' a day before. Head tae the very heart o' Ironforge an' look for the Great Forge; ye cannae miss it, it's the bit that's on fire." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    king = {
      big = true,
      lines = { { id = "k_default", text = "Quiet, these days. King Varian's armour sits on its stand where I left it, oiled every week in case he comes home, an' the young king's still too small for a breastplate. I make guards' mail now, an' pray." } },
      choices = {
        { text = "He'll come home, so keep it oiled.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The kingdom needs a king who's here.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "p_default", text = "Bless it? Ha! Well, I'll no' say no, for the Light's a fine thing tae have in a weapon. Go on, then, an' I'll pretend no' tae be touched by it." } },
      choices = {
        { text = "Light guide your hammer, Therum.", next = "BACK", fx = { affinity = 3, trait = { pious = 1 } } },
        { text = "On second thought, I'll let the fire do its work.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every guard in the city comes past this anvil sooner or later, an' they talk while I hammer. Ask me what ye like." },
    },
    background = { { id = "tp_bg", text = "Trained at the Great Forge, came south when Stormwind needed smiths, an' stayed because it still does.", next = "teachers" } },
    advice = { { id = "tp_ad", text = "Mend yer armour before it fails, no' after. Steel's cheaper than priests." } },
    _none = { { id = "tp_none", text = "If it doesnae ring when ye strike it, I wouldnae know." } },
  },
}

-- Kaita Deepforge: smithing supplies, cheaper than the Bazaar, she'll tell you.
P:NPC {
  key = "kaita", id = TODO_NPC("Kaita Deepforge"), name = "Kaita Deepforge", title = "Blacksmithing Supplies",
  bible = "bibles/dwarven_district.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "jovial" }, values = { "practical", "proud" },
  notices = { "smith", "gnome" },
  impression = {
    first = "Kaita Deepforge sells smithing supplies and holds a grudge against the merchants of the Trade District on principle. The gnomes' tram brings her goods straight from Ironforge, and she wants everyone to know it.",
    third = "{name} met Kaita Deepforge, who sells blacksmithing supplies in the Dwarven District.",
  },

  greetings = {
    { id = "g_bazaar", text = "Don't let the Bazaar fool ye; I've got it cheaper an' better." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "Flux, coal an' stone, aye? Ye've the look o' someone runnin' low." },
  },

  notice = {
    { id = "n_smith", cat = "smith", when = { any = { { profession = "Blacksmithing" }, { profession = "Mining" } } },
      text = "Ye smell o' the forge, an' I mean that kindly. A smith who buys from the Trade District is a smith who enjoys payin' twice, so ye've come tae the right place." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "One o' the tram-builders! Yer folk dug that tunnel under the sea, an' every crate I sell came down it, so I'll hear no word against gnomes in my shop." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Less than the Trade District, because a thief who robs a dwarf has every dwarf in the street after him by supper. We look after our own down here, an' the city guards are glad tae leave us to it." } },
      choices = {
        { text = "Better to leave thieves to the guards than take justice yourselves.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good. Street justice is quicker than anything the Watch does.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A few o' the dwarves an' gnomes from that cellar buy coal an' flux, for reasons they never give, an' they pay in good silver. I take their coin, though I wash my hands after, an' I'm no' ashamed o' that." } },
      choices = {
        { text = "You're right to keep them at arm's length, Kaita.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fel or no, their coin's good, so take it gladly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A coarse stone for the nicks an' a fine one for the edge, an' ye'll want both in yer pack, not one. The heavy stone from Ironforge's quarries is the best there is, an' wi' the tram I can sell it ye cheaper than the humans." } },
      choices = {
        { text = "I'll tend my blade every night. It keeps me alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "When it's dull I'll just buy a new one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Gunpowder, when I can get it down the tram from Ironforge, an' arrowhead blanks for the ones who'd rather fletch their own. Most humans here buy their arrows ready-made, but a dwarf likes tae know what's in her quiver." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That's a braw beast, that {pet}. Keep it away from the powder kegs, mind, for I've no wish tae see either o' us blown tae Loch Modan." },
      },
      choices = {
        { text = "I make my own arrows. You learn more that way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Ready-made is faster. I've better things to do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Kaita Deepforge, blacksmithin' supplies. Don't let the humans in the Bazaar fool ye, {g:lad|lass}; wi' that tram the gnomes built, it's easier than ye'd think tae bring goods down from Ironforge, an' I pass the savin' on." },
        { id = "h_human", when = { race = "Human" },
          text = "A Stormwind local in the Dwarven District! Most o' yer folk only come down here when somethin's broken. What's broken?" },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest buyin' smithin' stone? No? Then ye're here for the warmth o' the forges, an' I cannae blame ye; the Cathedral's a draughty place." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye can look at my coin box all ye like, {g:lad|lass}, but I sleep on top o' it, an' I'm a light sleeper." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye smell o' the Lamb's cellar, {g:lad|lass}. I'll sell tae ye same as anyone, but I'd rather ye didnae call anythin' up in my shop." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, an' wi' the look o' someone who breaks blades faster than they can buy 'em. Ye'll want whetstones, {g:lad|lass}, an' plenty." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, {g:lad|lass}! Ye'll not need much from a smith's supply stall, but I've a fine bit o' flux for mendin' a rifle barrel, if ye carry one." },
      },
      again = {
        { id = "h_again", text = "What else, {g:lad|lass}?" },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "What's wrong with the Bazaar?", next = "bazaar" },
        { text = "Tell me about the tram.", next = "tram" },
        { text = "Do thieves trouble the Dwarven District much?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Which whetstone should a warrior carry, Kaita?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you sell anything for hunters, Kaita?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Lamb's warlocks buy from you?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    bazaar = {
      big = true,
      lines = { { id = "b_default", text = "Import fees! They buy from Ironforge, tack on a fee for the long road, an' sell it tae ye as if they'd carried it on their backs over the mountains. There's no long road any more; there's a tunnel. If they try it on ye, tell them ye're buyin' from me." } },
      choices = {
        { text = "Good. Somebody should undercut them.", next = "bazaar_more", fx = { align = { order = -1 } } },
        { text = "They've the right to set their prices.", next = "bazaar_more", fx = { align = { order = 1 } } },
        { text = "Do they know you say this?", next = "bazaar_more" },
      },
    },
    bazaar_more = {
      lines = { { id = "bm_default", text = "Know it? I've told them tae their faces, twice, an' once in writin'. They sent me a very polite letter about honest competition, so I used it tae light the forge." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    tram = {
      lines = { { id = "t_default", text = "The Deeprun Tram, right through the rock an' under the water, from here tae Ironforge in the time it takes tae eat a sandwich. The gnomes built it, an' I've ridden it a hundred times, an' I still hold on tight in the middle bit." } },
      choices = {
        { text = "What's in the middle bit?", next = "tram_middle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tram_middle = {
      lines = { { id = "tm_default", text = "Water, all around, wi' fish lookin' in at ye, an' the whole sea leanin' on the glass. I'm a dwarf; I like rock over my head, no' a lake." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everythin' that comes down the tram passes by my counter, an' so does the gossip that rides wi' it. Ask." },
    },
    background = { { id = "tp_bg", text = "A Deepforge, sellin' what the Deepforges have always sold. That's the whole story, an' a good one." } },
    advice = { { id = "tp_ad", text = "Never buy smithin' stone from a human. Ask what it's for, an' if they cannae tell ye, walk away." } },
    _none = { { id = "tp_none", text = "Cannae help ye there, {g:lad|lass}. Try the Bazaar; they'll charge ye for the answer." } },
  },
}

-- Lilliam Sparkspindle: engineering trainer, always partway through a sum.
P:NPC {
  key = "lilliam", id = TODO_NPC("Lilliam Sparkspindle"), name = "Lilliam Sparkspindle", title = "Engineering Trainer",
  bible = "bibles/dwarven_district.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "eager" }, values = { "curious" },
  notices = { "engineer", "gnome" },
  impression = {
    first = "Lilliam Sparkspindle is always halfway through a sum and finishes it before she answers you. She teaches engineering in the Dwarven District and talks about gnomish engineering as the one true discipline.",
    third = "{name} met Lilliam Sparkspindle, a gnome who teaches engineering in the Dwarven District.",
  },

  greetings = {
    { id = "g_sum", text = "Fourteen plus seven, carry the two... oh, yes?" },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer! Twenty-one, there, done. What can I teach you?" },
  },

  notice = {
    { id = "n_engineer", cat = "engineer", when = { profession = { name = "Engineering", min = 200 } },
      text = "Oh my, you're nearly an expert! That means a choice, you know, and a big one, gnomish or goblin, and you can't take it back afterwards. I'll try not to be biased. I'll fail, but I'll try." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Another gnome! Did you get out early or late? I got out late, and I still count the stairs in my sleep." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Oh, I couldn't possibly tell you, because then I'd have to tell everyone, and the bank would be very cross with me. Let's just say a well-made lock should never hum when you breathe on it, and most of ours do." } },
      choices = {
        { text = "Tell the bank, then, before someone else finds out.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some secrets are worth more if you keep them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I think so, mostly, though the mages in the Quarter get terribly offended when I say it. Gnomeregan had arcanists who worked from formulae, and they never set the curtains on fire, or at least not without meaning to." } },
      choices = {
        { text = "Magic needs discipline and formulae, or it goes wrong.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic is instinct, and formulae only slow you down.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Absolutely, and in at least six ways, four of which are legal in Stormwind! A good target dummy draws fire, a net-o-matic holds an enemy still, and a well-placed explosive solves almost any argument." } },
      choices = {
        { text = "I'd use a gadget if it kept my friends alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll trust my sword over gnomish gadgets, thank you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I could, I have, and I've built three, and only one of them caught fire. A properly ground lens on a properly mounted rail makes a hunter accurate at twice the range, which my calculations say is very nearly perfect." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Does {pet} like loud noises? Some beasts don't, and engineering tends to involve them, so I'd keep it well back from the bench." },
      },
      choices = {
        { text = "Precision is the heart of a good hunt. I'll try your scope.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather trust my eyes than a gnomish lens.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Lilliam Sparkspindle, engineering trainer, and nearly finished with a very interesting calculation about gear ratios. Do you build things, or are you only here to watch things explode?" },
        { id = "h_choice", key = true, when = { profession = { name = "Engineering", min = 200 } },
          text = "Expert engineering splits two ways: gnomish, which is about wonderful gadgets that make life better, and goblin, which is about making things go bang for money. If you want the first, take a manual to Tinkmaster Overspark in Ironforge." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! You know, I've always wanted to measure the Light. Not to be rude about it; I'd only like to know how much there is, and whether it comes in units." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! You'll want to know about locks, then, and I'll tell you that most locks in this city were made by gnomes, so most of them have a cheerful little flaw." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Do you calculate your spells, or do you just feel your way? I've always suspected it's mostly mathematics wearing a robe." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Do you know what a warrior is, from an engineer's point of view? A lever with opinions, and a very effective one." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now, the dwarves will tell you that the rifle is the finest invention ever made, and the dwarves are mostly right, though their scopes are a little crude." },
      },
      again = {
        { id = "h_again", text = "Yes? I've got a remainder to carry, but go on." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "Gnomish or goblin engineering?", next = "choice" },
        { text = "What are you calculating?", next = "sum" },
        { text = "Did you get out of Gnomeregan with any notes?", next = "gnome", when = { race = "Gnome" } },
        { text = "What sort of flaw do gnomish locks have?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is magic just mathematics in a robe, Lilliam?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could engineering help a warrior in battle, Lilliam?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could you build a better scope, Lilliam?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    choice = {
      big = true,
      lines = { { id = "c_default", text = "Gnomish, obviously, but I'm a gnome, so you shouldn't trust me. Goblin engineering is louder and gets results faster, and gnomish engineering is cleverer and occasionally turns you into a chicken. Membership is permanent either way, so think hard." } },
      choices = {
        { text = "Cleverness over noise, so gnomish.", next = "choice_more", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Results are results, so goblin.", next = "choice_more", fx = { affinity = -1, align = { order = -1 } } },
        { text = "A chicken?", next = "choice_more", fx = { trait = { curious = 1 } } },
      },
    },
    choice_more = {
      lines = { { id = "cm_default", text = "A small chicken, and only briefly, and nobody's been hurt that I know of. Whichever you choose, come back and tell me what you built first; I keep a list, and I like the list very much." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sum = {
      lines = { { id = "s_default", text = "The tram's gear ratios, just for fun. I ride it to Ironforge and back and do the maths in my head, and I'm sure there's a cleverer way to take the curve. There's always a cleverer way, which is either the best thing about engineering or the worst." } },
      choices = {
        { text = "Did you work in Gnomeregan?", next = "sum_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sum_home = {
      lines = { { id = "sh_default", text = "Everyone worked in Gnomeregan, once. I'd rather do sums than talk about it, if you don't mind, because sums come out even and that didn't.",
        fx = { learn = { "gnomeregan" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = {
        { id = "gnome_l", text = "Three notebooks and half a slide rule, and I've rebuilt the rest from memory on the walls of my lodgings. The landlady is not pleased about the walls." },
        { id = "gnome_rear", when = { origin = "gnome_rearguard" },
          text = "Three notebooks, thanks to people like you holding the corridors; I've heard the rearguard stories in Tinker Town. I've rebuilt the rest from memory on the walls of my lodgings." },
      },
      choices = {
        { text = "We'll get the rest back from Thermaplugg.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Write it on paper this time.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear a lot, because people think I'm busy counting and not listening. I'm always doing both, so ask!" },
    },
    background = { { id = "tp_bg", text = "An engineer from Gnomeregan teaching engineers in Stormwind. The sum of it is that simple." } },
    advice = { { id = "tp_ad", text = "Measure twice and blow it up once. Never the other way round." } },
    gnomeregan = { { id = "tp_gnome", text = "I'd rather not, if that's all right. Ask me about gears instead." } },
    _none = { { id = "tp_none", text = "Hmm, not a variable I've got. Ask me about gears?" } },
  },
}

-- Gelman Stonehand: the mining trainer who wants to go home.
P:NPC {
  key = "gelman", id = TODO_NPC("Gelman Stonehand"), name = "Gelman Stonehand", title = "Mining Trainer",
  bible = "bibles/dwarven_district.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "gruff" }, values = { "practical" },
  notices = { "miner", "dwarf" },
  impression = {
    first = "Gelman Stonehand told me I'd interrupted him and had better have a good reason. He came down from Ironforge to help rebuild Stormwind and means to teach enough miners that he can go home.",
    third = "{name} met Gelman Stonehand, the mining trainer of Stonehand Mining in the Dwarven District.",
  },

  greetings = {
    { id = "g_interrupt", text = "Ye interrupted me, so ye'd better have a blasted good reason." },
    { id = "g_miner", when = { profession = "Mining" }, text = "Pick still sharp? Then ye've a better reason than most." },
    { id = "g_camp", when = { questActive = TODO_QUEST("Camping 101: Mining") }, text = "Done yer campin' lesson, have ye? Let's hear how ye managed." },
  },

  notice = {
    { id = "n_miner", cat = "miner", when = { profession = { name = "Mining", min = 150 } },
      text = "Ye've been at it a while; I can tell by the dust in yer collar. Another few like ye an' I might get home before my beard goes white." },
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf" },
      text = "A dwarf, thank the Titans! Tell me how the Great Forge looks, an' I'll forgive ye for interruptin'." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, an' he got as far as the canal before I caught him, an' I'm no' a fast dwarf. Ore's heavy, which is the one thing every thief forgets until he's carryin' it." } },
      choices = {
        { text = "A thief who's caught should pay it back, and that's fair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Ore's heavy, so a cleverer thief would've taken coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "He wanted more than the stone could give him, so he went lookin' in a cellar instead, an' now he doesnae speak tae any o' us. He's alive, as far as I know, but I'd no' call it livin'." } },
      choices = {
        { text = "Power that costs you your friends isn't worth having.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Maybe he found what the stone could never give him.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than ye'd think, for both are about knowin' where tae strike an' how hard. A good miner reads the seam like a good warrior reads a foe, an' both learn the hard way what happens when ye swing wild." } },
      choices = {
        { text = "Patience and a well-placed blow. That's the secret of both.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Swinging hard solves most problems, stone or foe.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Kobolds, mostly, which are near enough tae beasts, an' the odd bear that's found a warm tunnel for the winter. In Elwynn's mines, the kobolds are so thick ye'd think they grew out o' the rock." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Yer {pet} has a good nose for a cave, I'd wager. Keep it close in the dark, for it'll smell the kobolds long before ye see the candle." },
      },
      choices = {
        { text = "I'll clear the kobolds out, so the miners can work safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Kobolds were there first. Let them keep their tunnels.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Gelman Stonehand. I came from Ironforge tae help with the rebuildin' here, an' if I can teach enough o' ye my skills, maybe I can leave it tae ye an' take myself back home." },
        { id = "h_human", when = { race = "Human" },
          text = "Yer folk built this city out o' stone they couldnae find, so they sent for dwarves who could. Most o' us stayed longer than we meant tae, me included." },
        { id = "h_camp_done", when = { questDone = TODO_QUEST("Camping 101: Mining") },
          text = "Ye can feed yerself an' keep warm on the road, an' ye can dig. That's more than most o' the soft-handed lot who come through here." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye've soft boots an' softer hands, an' ye're lookin' at my ore bags like ye're weighin' them, so dinnae." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye've a look about ye like the dwarves who go down tae the Lamb an' come back strange, an' I knew a miner who went that way." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, aye, an' wi' arms that'd swing a pick as well as a sword. Ye'd make a fine miner, if ye ever tire o' fightin'." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, an' a long way from the high passes, by the look o' ye. The tunnels under Stormwind are no place for a beast, I'll tell ye that much." },
      },
      again = {
        { id = "h_again", text = "Aye? Make it quick." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Mining" } },
        { text = "Why do you want to go home?", next = "home" },
        { text = "What's the trick to mining?", next = "trick" },
        { text = "Does anyone ever steal ore from you, Gelman?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is mining much like fighting, Gelman?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do beasts ever trouble the mines, Gelman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What happened to the miner you knew?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Sorry to interrupt.", next = "END" },
      },
    },
    home = {
      big = true,
      lines = { { id = "ho_default", text = "Because Stormwind's sky is too blasted big, an' its ale is too thin, an' I miss the sound o' the Great Forge through the walls. I came tae help, an' I've helped; it's time somebody else carried the pick." } },
      choices = {
        { text = "You've earned your rest.", next = "home_more", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "You'd be leaving the city half taught.", next = "home_more", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Who'll take over?", next = "home_more" },
      },
    },
    home_more = {
      lines = { { id = "hm_default", text = "Whoever proves they can find a copper vein by the smell o' the stone. I've had two that could, an' both ran off tae be adventurers, like ye. So ye see my problem." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trick = {
      lines = { { id = "t_default", text = "Listen tae the rock. That's no' poetry, mind; good ore sounds different when ye tap it, an' if ye cannae hear it yet, ye're no' tappin' enough. Get a pick an' a smelting skill an' come back tae me." } },
      choices = {
        { text = "Where should I dig?", next = "trick_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trick_where = {
      lines = { { id = "tw_default", text = "Elwynn's hills for copper, an' the Redridge cliffs past that, if the orcs'll let ye. Further out, ask the miners at every inn ye stop at; a miner never lies about ore, only about where he found it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Miners talk while they work, an' I've listened tae more o' them than I can count. Ask, an' quick about it." },
    },
    background = { { id = "tp_bg", text = "I came from Ironforge tae help rebuild, an' I'm still here, which is the whole blasted problem." } },
    advice = { { id = "tp_ad", text = "Carry a spare pick. The first one always breaks in the best vein." } },
    camping = { { id = "tp_camp", text = "A miner who cannae camp is a miner who starves halfway tae the good ore. Learn it." } },
    _none = { { id = "tp_none", text = "If it isnae rock, I've no idea, an' I've work tae do." } },
  },
}
