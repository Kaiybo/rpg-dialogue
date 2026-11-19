-- Menethil Harbor's trades: the gryphon master, the gunsmith, the engineering-and-general-goods merchant, and the shady dealer upstairs.
-- Voices: bibles/menethil_shops.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC = P.TODO_NPC

-- Shellei Brondir: gryphon master of Menethil Harbor.
P:NPC {
  key = "wl_shellei", id = TODO_NPC("Shellei Brondir"), name = "Shellei Brondir",
  bible = "bibles/menethil_shops.md", role = "flightmaster", tier = "service",
  communities = { "menethil" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "mount" },

  impression = {
    first = "She is fonder of her birds than she lets show.",
    third = "{name} met Shellei Brondir, the gryphon master of Menethil Harbor.",
  },

  greetings = {
    { id = "g_default", text = "Looking for a gryphon out of this swamp? I can't blame you; even the birds won't land in the mud if they can help it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and dry, while my poor birds haven't been dry since spring." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Please get down before you come any closer. The birds don't like strange mounts, and they like them even less when it's been raining." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The worst in Khaz Modan, and the Dragonmaw's smoke makes it worse. I've lost a bird to a crosswind there, and I've never forgiven the mountain for it. If you've any pull with the air, ask it to go easy on my gryphons." } },
      choices = {
        { text = "I'll ask the air kindly. Your birds deserve safe skies.", next = "BACK", reply = "Kindly's the only way to ask anything of the air over Grim Batol, and I'd be grateful if it listened. Tell it the gryphons mean no harm, only passage.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The mountain owes you nothing. Fly smarter.", next = "BACK", reply = "Fly smarter, is it? Come up on one of my birds into a Grim Batol crosswind and tell me that again with your teeth chattering.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They will, for they'll carry anybody who pays the fare and doesn't pull feathers. Only keep whatever follows ye well away from the roost, for a bird that takes fright over the mountains takes a week tae find again." } },
      choices = {
        { text = "I'll respect your birds, Shellei. No tricks aboard.", next = "BACK", reply = "Then they'll carry ye gladly, an' I'll sleep easier. A gryphon that trusts its rider will bring ye home through any storm off the bay.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your birds will have to get used to me.", next = "BACK", reply = "They'll get used tae ye about as fast as I would tae a hot coal in my bed, which is tae say never. Keep yer company well away, or walk tae Thelsamar.", fx = { align = { order = -1 } } },
        { text = "Something else, Shellei.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They can, though they'll complain the whole way to Thelsamar, and so would you if you had to fly in this damp. Sit still, lean forward over the mountains, and don't swing anything near their wings." } },
      choices = {
        { text = "I'll sit still and give the bird no trouble.", next = "BACK", reply = "Good, that's all a gryphon wants of a rider, and you'd be amazed how few manage it. Lean into the climb and you'll be in Thelsamar by supper.", fx = { align = { order = 1 } } },
        { text = "I'll fly the way I fight, hard and fast.", next = "BACK", reply = "Then you'll fly once and walk the rest of your life, because no bird of mine will take you twice. They're gryphons, not battering rams.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They mind everything in this swamp, from the damp to the murlocs to the red drakes over Grim Batol. A hunter's beast is one more thing to hiss at, though they hiss loudest at the cats." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They mind everything in this swamp, and a hunter's beast is one more thing to hiss at. {pet} stays on the ground while you fly, though, and it'll be waiting when you land." },
      },
      choices = {
        { text = "I'll keep my beast well clear of the roost.", next = "BACK", reply = "Thank you, truly, for the birds are skittish enough in this damp without a wolf sniffing at their tails. Old Stormbeak once dropped a hunter in the bay over less.", fx = { align = { order = 1 } } },
        { text = "My beast goes where I go. The birds will cope.", next = "BACK", reply = "They'll cope by throwing you off over the mountains, most likely. A gryphon doesn't take kindly to a beast it can't see the bottom of.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "They would, and that's exactly why I keep a ledger of every rider. If the watch comes asking who flew out of Menethil in a hurry, I'll tell them true, so I'd rather you didn't give me cause." },
      },
      choices = {
        { text = "No cause from me, Shellei.", next = "BACK", reply = "Then you and I will get along fine, and your name will sit in my ledger as dull as any farmer's. That's how I like it.", fx = { align = { honor = 1 } } },
        { text = "Then I'll make sure the ledger's wrong.", next = "BACK", reply = "Try it, and you'll find I keep two ledgers, and the second one's under my pillow. My birds remember faces even when my pages don't.", fx = { align = { honor = -1 } } },
        { text = "What's the danger on the way?", next = "danger" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "I'll miss your conversation more, if you've any. Still, a spell won't show you the Wetlands in the morning with the mist on the marsh like milk, and I'd wager your teleport smells of singed hair." },
      },
      choices = {
        { text = "Some things are worth doing the long way.", next = "BACK", reply = "There speaks someone who's watched a sunrise from the clouds, or who will soon. Climb aboard whenever you like, and I'll give you the slow bird.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Life's too short to sit on a bird.", next = "BACK", reply = "Then teleport away, and miss the best view in Khaz Modan. I'll not argue with a mage, but I'll pity one.", fx = { align = { order = -1 } } },
        { text = "How do the gryphons take the damp?", next = "damp" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "When the garrison asks, which is more often since the Dragonmaw came into Algaz. The birds know a hurt rider from a healthy one, and they fly gentler for it." } },
      choices = {
        { text = "Then I'll see to the wounded before they fly.", next = "BACK", reply = "Bless you for that, for the lads come down from Algaz in a bad way. I've had one faint clean off a bird over Loch Modan, and we never found his boots.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The strong should fly first. The wounded slow them.", next = "BACK", reply = "A wounded rider is exactly who needs a bird most, since he can't walk the road. My gryphons slow for no one, but they carry everyone.", fx = { align = { light = -1 } } },
        { text = "Something else, Shellei.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe enough, since the orcs can't reach us that high, though they'll throw things on the way up. It's the dragons over Grim Batol I watch for, and so far they've kept to their own skies." } },
      choices = {
        { text = "If the birds are threatened, I'll set down and fight.", next = "BACK", reply = "Then you'd lose your bird and your fare both, though I'll grant the thought is a brave one. Leave the orcs to the garrison and trust the gryphon.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then I'll fly high and leave the orcs alone.", next = "BACK", reply = "That's what the birds do on their own, and they're wiser than most riders. They know exactly how far a Dragonmaw spear can fly.", fx = { align = { honor = -1 } } },
        { text = "Something else, Shellei.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Dry straw, and more of it than the harbour can spare, because their feathers rot if they sit wet too long. I've tried rubbing their wings with seal oil, but they hate the smell, and so does everyone else on the roost." } },
      choices = {
        { text = "Keep the roost where the garrison needs it, and make do.", next = "BACK", reply = "Make do is what this harbour's done since the day it was built, so I'll keep at it. The birds grumble, but they're used to the damp by now.", fx = { align = { order = 1 } } },
        { text = "Move the roost to higher ground, where the air is drier.", next = "BACK", reply = "I've thought of it, believe me, but the garrison needs the birds close and the higher ground's Dragonmaw country. So the damp roost stays.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The gryphons fly a good many wounded east to Ironforge, and I'm always glad of someone to calm them before they go." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll need one of the big birds, then, and you'll need to hold on, because the mountain winds have no respect for rank." },
        { id = "h_default", key = true,
          text = "Shellei Brondir, gryphon master of Menethil Harbor. My birds fly east over the mountains to Thelsamar and Ironforge, which is the only way out of the Wetlands that won't leave mud in your boots." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, is it? You'll be heavy, then, so I'll give you one of the stronger birds." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Good, then you'll know better than to let your beast near my birds." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'll ask you not to startle my roost, since my gryphons are cross enough about the rain without a bear wandering past." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "My gryphons are pullin' at their tethers, an' it's you they're lookin' at. They don't care for the smell of brimstone, so you'll forgive them if they ruffle up when you climb on." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! My birds fly over the mountains every day, and they'd thank you for a calmer wind over Dun Algaz." },
        { id = "dd_fall", when = { deathCause = "falling" },
          text = "You came down off something high and didn't land well, I'd wager. The Arathi cliffs to the north are steep, so next time take a bird, for they've never once dropped a passenger." },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds are waiting, and they don't wait patiently in the rain." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Your gryphons can't like this damp.", next = "damp" },
        { text = "Is it dangerous flying over the Wetlands?", next = "danger" },
        { text = "How did a human come to keep dwarven gryphons?", next = "human" },
        { text = "Your gryphons would make a fine getaway.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'll be teleporting soon. Will you miss my coin?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can your gryphons carry a warrior in full armor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your gryphons mind a hunter's beast, Shellei?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your birds carry the wounded east to Ironforge, Shellei?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The flight east must be risky with the Dragonmaw in the hills.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is there anything that eases your gryphons in this damp?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Will your gryphons carry me, Shellei, whatever they smell on me?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The winds over Dun Algaz must be hard on your gryphons.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Shellei.", next = "END" },
      },
    },

    damp = {
      lines = {
        { id = "da_default", text = "Badly, and they let me know about it every morning. Their feathers never fully dry here, so I brush them twice a day and keep braziers going in the roost, and they still sulk." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    danger = {
      lines = {
        { id = "dg_default", text = "Over Grim Batol it is, for the Dragonmaw keep red dragons there, so my birds go well around it. The Thandol Span is no picnic either, with Dark Iron raiders on the bridge, but the gryphons fly high and fast and don't stop to look." },
      },
      choices = {
        { text = "Someone should drive the Dragonmaw out.", next = "BACK", reply = "Someone should, and the dwarves at Algaz have been saying so for months. Until they manage it, my birds fly the long way round.", fx = { align = { order = 1 }, trait = { brave = 1 }, learn = { "dragonmaw" } } },
        { text = "Wise birds. Best to avoid a fight you can't win.", next = "BACK", reply = "They are, and wiser than half the soldiers who pass through here. I've seen a gryphon turn tail at a single red wing over Grim Batol, and it was right to.", fx = { align = { order = -1 }, trait = { cautious = 1 }, learn = { "dragonmaw" } } },
      },
    },

    human = {
      lines = {
        { id = "hu_default", text = "The same way anyone does, by working hard and not minding the bites. The dwarves taught me when Menethil needed more hands, and the birds decided I'd do, which is the only opinion that counts." },
      },
      choices = {
        { text = "The dwarves are generous teachers.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I grew up in Menethil, back when it was Lordaeron's harbor, and I've never wanted to leave it, damp and all." } },
    advice = { { id = "tp_ad", text = "Never feed a gryphon fish. They'll want it every day after." } },
    _none = { { id = "tp_none", text = "I can't help you with that, I'm afraid. Ask at the inn; Helbrek hears everything." } },
    lordaeron = { { id = "tp_lordaeron", text = "When I was a girl, Menethil was Lordaeron's harbor and King Terenas's ships came in every week. Now the northern horizon is empty, and I try not to look at it." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer trained my first gryphons, and they still won't let me forget that I flinched on my first flight. Dwarves have long memories." } },
    theramore = { { id = "tp_theramore", text = "I send letters and parcels down to the docks for the Theramore boat every day. Folk over there want news of home, and so do we." } },
    scourge = { { id = "tp_scourge", text = "The gryphons won't fly north over the water anymore; they balk at the shoreline. I don't make them, because they know something I don't." } },
  },
}

-- Murndan Derth: dwarf gunsmith in Menethil Harbor.
P:NPC {
  key = "wl_murndan", id = TODO_NPC("Murndan Derth"), name = "Murndan Derth",
  bible = "bibles/menethil_shops.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "gruff" }, values = { "proud", "practical" },
  notices = { "class" },

  impression = {
    first = "He calls the Wetlands the worst place in the world for guns.",
    third = "{name} met Murndan Derth, a dwarf gunsmith in Menethil Harbor.",
  },

  greetings = {
    { id = "g_default", text = "Guns, an' shot for them, an' oil, for ye'll need plenty o' that in this swamp." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Is yer barrel still dry? I'll wager it isnae." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, wi' a proper eye for a long shot, I'd say. Let me see yer weapon, for I'll bet the damp's got intae the lock." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd be grateful if it did, though I'll admit I'd feel daft thankin' a puddle. The old Ironforge smiths say water an' steel are enemies by nature, an' I've no reason tae doubt them in this swamp. If ye can make peace between them, I'll name a rifle after ye." } },
      choices = {
        { text = "Oil your rifles properly. That's the dwarven way.", next = "BACK", reply = "Now that's a dwarf talkin', or near enough. Oil an' rags an' a bit o' stubbornness, an' a rifle will outlast any swamp.", fx = { align = { order = 1 } } },
        { text = "I'll make peace with the water. Old feuds can end.", next = "BACK", reply = "Make peace wi' the water? I'll believe that when I see a barrel that doesnae rust. Ye're welcome tae try, though.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "No' much, for I sell guns an' powder, an' yer sort carries wands an' daggers. But the damp gets intae a wand as quick as it gets intae a rifle in this swamp, so keep yers wrapped in oilcloth like a sensible body." } },
      choices = {
        { text = "Good advice. I'll keep my kit in order, Murndan.", next = "BACK", reply = "Good, for a fouled wand in a fight's no' a thing I'd wish on anyone. Keep it wrapped an' dry, an' it'll see ye home.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My fire dries anything I carry. Damp's no matter.", next = "BACK", reply = "Does it now? Then ye'll be the first in Menethil wi' dry socks, an' I'd like tae know yer secret. Keep that fire away from my powder, mind.", fx = { align = { order = -1 } } },
        { text = "Something else, Murndan.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, for a warrior wi' a rifle can pull a Dragonmaw scout down off a ridge an' then go an' finish him wi' the axe. Just keep it oiled, for this swamp'll rust a barrel in a week if ye let it." } },
      choices = {
        { text = "I'll fight face to face. Guns are for others.", next = "BACK", reply = "Suit yerself, but the orc on the ridge'll be shootin' at ye while ye walk up tae him. Come back when ye've a hole or two tae think it over.", fx = { align = { honor = 1 } } },
        { text = "Shoot first, then the axe. That's sense, not cowardice.", next = "BACK", reply = "That's sense, aye, an' it's kept more dwarves alive than any shield. Pick out a rifle, an' I'll show ye how tae keep it dry.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Somethin' wi' a short barrel an' a good tight stock, for ye'll be shootin' raptors at close range in the reeds, no' rams on a mountainside. An' oil it every night, for the love o' Magni's beard, or it'll seize just as the raptor jumps." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Somethin' wi' a short barrel for shootin' raptors close in the reeds, an' oil it every night. {pet} will need tae get used tae the bang, mind, for some beasts never do." },
      },
      choices = {
        { text = "I'll oil it every night, as you say.", next = "BACK", reply = "Good, ye've been listenin'. An oiled rifle an' a steady hand will see ye through the reeds better than any charm.", fx = { align = { order = 1 } } },
        { text = "I'll care for it my own way, thanks.", next = "BACK", reply = "Yer own way, is it? Then I'll see that rifle back on my counter in a fortnight wi' rust in the barrel, an' I'll say nothin'.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Quieter? A gun's meant tae be loud, so every orc in the marsh knows a dwarf's havin' his say. If ye want quiet, buy a bow from somebody else, for I'll no' insult a good rifle by fittin' it wi' a muffle." },
      },
      choices = {
        { text = "Loud has its uses. Show me what you've got.", next = "BACK", reply = "Now ye're talkin' sense. Loud has a way o' makin' a Dragonmaw think twice, an' I've just the piece for ye.", fx = { align = { honor = 1 } } },
        { text = "Loud gets you killed. Quiet gets the job done.", next = "BACK", reply = "Then off ye go tae the bowyer, an' good luck tae ye. I've never yet seen a dagger stop a charge, but maybe ye'll prove me wrong.", fx = { align = { honor = -1 } } },
        { text = "Why a gun over a bow, then?", next = "bow" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Fire near my powder? Ye'll do no such thing! I'll fight the rust wi' oil an' rags like a proper smith, an' ye'll keep yer sparks ten paces from my counter." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Fire near my powder, from a gnome? I've heard how Gnomeregan went, an' I'll no' have Menethil go the same way. I'll fight the rust wi' oil an' rags, thank ye." },
      },
      choices = {
        { text = "Ten paces back. Understood.", next = "BACK", reply = "Good, for ye'd no' believe how many mages I've had tae chase out o' here wi' a broom.", fx = { align = { order = 1 } } },
        { text = "A little warmth never hurt anyone.", next = "BACK", reply = "It's no' the warmth I mind, it's the bang that comes after! Ten paces, or I'll call the guard.", fx = { align = { order = -1 } } },
        { text = "How do you keep anything dry here?", next = "dry" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than it has need o' guns, by my beard, for the lads come back from Algaz wi' holes in them, an' a rifle cannae mend a hole. Brother Glorin does what he can, but he's one dwarf, an' a grumpy one." } },
      choices = {
        { text = "Then I'll go up and help Brother Glorin.", next = "BACK", reply = "Bless ye, for he's run off his feet, an' the lads need more than one priest. Tell him Murndan sent ye.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better guns would mean fewer holes, Murndan.", next = "BACK", reply = "Better guns, aye, an' better sense, an' maybe better luck. But a hole's a hole, an' even my best rifle cannae stitch one.", fx = { align = { light = -1 } } },
        { text = "Something else, Murndan.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Well enough, if they'd clean their rifles, which they willnae, because it's wet an' they're tired. I've told Captain Stoutfist twice that rust kills more o' his lads than orcs, an' he looked at me like I'd insulted his mother." } },
      choices = {
        { text = "The Captain should order daily drill, then.", next = "BACK", reply = "He should, an' I've told him, but he's got more worries than rusty barrels. If ye've his ear, tell him again from me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Soldiers fight with what they have. Let them be.", next = "BACK", reply = "Aye, they do, an' they fight well wi' it. I just wish they'd clean what they've got afore it fails them.", fx = { align = { order = -1 } } },
        { text = "Something else, Murndan.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "No' near the harbour, thank the stone, but the lads from Algaz say the reds pass overhead at dusk on their way back tae Grim Batol. Bullets bounce off them like hail off a roof, so I've stopped tellin' the lads tae aim up." } },
      choices = {
        { text = "The reds are slaves to the orcs. Strike the masters instead.", next = "BACK", reply = "Strike the masters, aye, an' that's sense, but tell that tae a dragon that's divin' at ye. I'll stick wi' the orcs an' leave the reds be.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Dragon or orc, it makes no odds. Kill whatever flies at you.", next = "BACK", reply = "That's my thinkin' exactly, though bullets do little against a red. Aim for the eye, if ye can, an' pray.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If ye've a blessin' for rust, I'll take it, for nothin' else I've tried has worked." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Ye'll have no use for a rifle, I expect, but I'll tell ye which o' the garrison's are worth standin' behind." },
        { id = "h_default", key = true,
          text = "Murndan Derth, gunsmith. I came out tae Menethil tae sell guns tae the garrison, an' I've spent every day since fightin' the rust, for this swamp's the wettest place a dwarf ever kept a rifle." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Murndan Derth, gunsmith, an' it's a relief tae see a proper dwarf in this soggy place. The humans here think a gun's a kind o' crossbow, an' I've given up explainin'." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll want an axe, no' a gun, but ye might want a gun for the times the axe cannae reach." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now there's a customer, for there's no dwarf hunter born who doesnae want a better rifle." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Ye'll be wantin' no guns, I'd wager, an' that's fine by me, for there's few left in this harbour the damp hasnae ruined." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I'd sell ye a gun if ye could fire one, but by the look o' yer fingers I've a feelin' ye'd rather burn folk some other way." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Ye wouldnae be able tae tell the water tae stay out o' my rifles, would ye? I've tried shoutin', an' it doesnae listen." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Go on, I've a barrel tae clean." },
      },
      choices = {
        { text = "Let me see your guns.", next = "BUSINESS" },
        { text = "How do you keep a gun dry here?", next = "dry" },
        { text = "Why stay in the Wetlands, then?", next = "stay" },
        { text = "Why a gun over a good bow?", next = "bow" },
        { text = "A gun's too loud for my work. Got anything quieter?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could dry out your stock with a little fire.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Should a warrior carry a gun, Murndan?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What rifle would you sell a hunter in this swamp?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The garrison must have some need of a priest, Murndan.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The garrison seems well armed against the Dragonmaw.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the Dragonmaw's red dragons ever fly near the harbour?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is there anything here for someone who'd rather not touch a gun, Murndan?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would the water listen if I asked it to spare your rifles?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thanks, Murndan.", next = "END" },
      },
    },

    dry = {
      lines = {
        { id = "dr_default", text = "Ye don't, no' properly. Oil it every night, keep it wrapped in leather, an' never set it down on the ground, for the ground here's more water than mud." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    stay = {
      lines = {
        { id = "st_default", text = "Because the garrison needs guns, wi' the Dragonmaw so close an' the Dark Irons on the Thandol Span. A dwarf goes where he's needed, even when it means wet socks for the rest o' his life." },
      },
      choices = {
        { text = "That's real duty, and I respect it.", next = "BACK", reply = "Thank ye, that means more than ye'd think. I've stood this counter through three floods an' one fire, an' I'd stand it through three more.", fx = { align = { honor = 1 }, affinity = 1, learn = { "dragonmaw", "thandol_span" } } },
        { text = "I'd have left for somewhere drier.", next = "BACK", reply = "So would I, by my beard, if I'd any sense. But the guns are needed here, an' so am I, wet socks or no.", fx = { align = { honor = -1 }, learn = { "dragonmaw", "thandol_span" } } },
      },
    },

    bow = {
      lines = {
        { id = "bo_default", text = "Louder, which scares the beasts, an' harder-hittin', which finishes them. A bow's quieter an' it doesnae rust, I'll grant ye, so ye'll find the bowyers just along the street if ye want one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I made guns in the Great Forge for twenty years before the garrison here asked for a gunsmith, an' I've regretted sayin' yes every rainy day since." } },
    advice = { { id = "tp_ad", text = "Keep yer powder dry. It's the only advice that matters here." } },
    _none = { { id = "tp_none", text = "I don't know anythin' about that, an' I'm too wet tae care." } },
    magni = { { id = "tp_magni", text = "I made guns in the Great Forge while King Magni walked the floor, an' once he picked one o' mine up an' fired it intae the roof. Said it was a fine piece, an' the roof disagreed." } },
    dark_iron = { { id = "tp_dark_iron", text = "Dark Iron powder is the best in the world, an' I hate that. I've seen what they do wi' it at Dun Modr." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer throw hammers instead o' shootin', which shows a lack o' imagination, if ye ask me. Mind, they hit what they throw at." } },
  },
}

-- Neal Allen: engineering supplies and general goods in Menethil Harbor.
P:NPC {
  key = "wl_neal", id = TODO_NPC("Neal Allen"), name = "Neal Allen",
  bible = "bibles/menethil_shops.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "steady" }, values = { "practical", "friendly" },
  notices = { "craft" },

  impression = {
    first = "He keeps his powder in sealed jars and his patience for gnomes.",
    third = "{name} met Neal Allen, who sells engineering supplies and general goods in Menethil Harbor.",
  },

  greetings = {
    { id = "g_default", text = "Bread or blasting powder? I sell both, and I keep them on separate shelves." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did that powder stay dry? I sealed the jar myself." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering" } },
      text = "An engineer! You'll want the powder in the sealed jars, not the open ones, unless you want it to fizzle in this damp." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not yet, but I'd stock them if I knew what they were, and a good waterproof cloak seems likely, given the weather. The gnomes passing through keep asking whether your totems could power their gadgets, and I've learned not to answer gnomes' questions." } },
      choices = {
        { text = "Totems aren't gadgets. Tell the gnomes that from me.", next = "BACK", reply = "I'll tell them, for all the good it'll do. Last week one asked me for a totem with a crank on it, and I didn't know what to say.", fx = { align = { honor = 1 } } },
        { text = "Sell the gnomes whatever they think works, Neal.", next = "BACK", reply = "That's my policy, mostly, and it keeps the shelves moving. Nobody's blown the shop up yet, though one of them came close with a teakettle.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Heavy cloth and good thread, mostly, and I've noticed your sort always wants a great many black candles. Whatever you do with them, do it outside town, please, because the last fellow who did it in his room upset the whole Deepwater." } },
      choices = {
        { text = "I'll keep my work outside the walls, Neal.", next = "BACK", reply = "Thank you, truly, for the last fellow set the curtains alight. My insurance man won't come back to Menethil at all now.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Where I work is my own business.", next = "BACK", reply = "It is, until it's my curtains on fire. Do as you like outside, but inside this shop I'll ask you to behave.", fx = { align = { order = -1 } } },
        { text = "Something else, Neal.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Whetstones, rope, a spare waterskin, and now and then a stick of blasting powder for a door they'd rather not open. The gnomes tell me that's not what it's for, but it works, so I sell it." } },
      choices = {
        { text = "Rations and rope will do. I'll leave the powder.", next = "BACK", reply = "A sensible choice, and one my shop will thank you for. The last fellow who bought powder in here sneezed on his way out.", fx = { align = { order = 1 } } },
        { text = "Sell me the powder. Doors are slow.", next = "BACK", reply = "You'd be surprised how often I hear that. I'll sell you a stick, but you didn't hear it was for doors from me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Never enough, for every dwarf hunter in the garrison goes through a pouch a day on crocolisks and raptors. I've told Murndan the gunsmith to sell fewer guns, and he's told me to stock more shot, and we're both right." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Never enough, for the dwarf hunters go through a pouch a day. I've jerky for {pet} too, if it'll eat jerky, which most of them will, given half a chance." },
      },
      choices = {
        { text = "I'll buy only what I'll use, and leave some for others.", next = "BACK", reply = "That's kind of you, and the dwarves will be grateful. I can't keep shot on the shelf two days running with the garrison buying.", fx = { align = { honor = 1 } } },
        { text = "I'll take your whole stock and sell it on dear.", next = "BACK", reply = "Sell it on dear? Then you'd have every hunter in the garrison after you, and I'd not blame them. I'll keep a ration on it, thank you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "I stock the blasting kind for the gnomes, and you'd want the flash kind from somebody with a sharper smile than mine. I'll not ask what you're blowing up, so long as it isn't in Menethil." },
      },
      choices = {
        { text = "Nothing in Menethil. You have my word.", next = "BACK", reply = "That's all I need to hear, and I'll take you at your word. The rest of the world, I'm afraid, is your affair.", fx = { align = { honor = 1 } } },
        { text = "Best you don't ask, then.", next = "BACK", reply = "Then I won't, and I'll sleep the better for it. Just mind the guard; they ask what I don't.", fx = { align = { honor = -1 } } },
        { text = "How's business with the harbour?", next = "business" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Not a thing, I'm sorry to say; the reagent sellers keep to Ironforge and Stormwind. Though I'll tell you, the gnome mages through here came out of Gnomeregan with nothing, and they've learned to make do." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Not a thing, I'm sorry to say, though you'd know better than me how your people manage. Most of the gnomes through here came out of Gnomeregan with nothing, and they've learned to make do with what's on my shelves." },
      },
      choices = {
        { text = "Ironforge has what I need. I'll go properly.", next = "BACK", reply = "That's the safe way, and I'd do the same in your boots. Ironforge isn't far by gryphon, if you've the coin.", fx = { align = { order = 1 } } },
        { text = "I'll get by on my own wits, like they do.", next = "BACK", reply = "That's what the gnomes did, and they're still standing, so maybe there's something in it. Good luck to you.", fx = { align = { order = -1 } } },
        { text = "Why sell here, of all places?", next = "why" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "By the crate, since the Dragonmaw came down into Algaz, and I can't keep enough linen in stock. Brother Glorin buys the rest and gives them out at the chapel, which is about the only charity this harbor sees." } },
      choices = {
        { text = "Then I'll help Glorin hand them out.", next = "BACK", reply = "He'd be glad of the help, and so would the wounded. Tell him I'll send another crate when the ship comes in.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Linen's scarce. Sell it to the highest bidder, Neal.", next = "BACK", reply = "Highest bidder? With men bleeding at Algaz? I'll sell to the chapel at cost, and you can call me a poor merchant if you like.", fx = { align = { light = -1 } } },
        { text = "Something else, Neal.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "When there's a road, which there isn't most weeks, with the Span gone and the Dark Irons on the bridges. I sent a cart of rope and rations north a month ago, and I've not heard whether it got there." } },
      choices = {
        { text = "I'll carry the next cart north myself.", next = "BACK", reply = "Would you? Then you'd be braver than any carter I know, and I'd see you got the best oxen I can find.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Send nothing north until the road is safe.", next = "BACK", reply = "That's what I've been doing, and the shelves are full while the dwarves go without. It's not right, but neither is losing another cart.", fx = { align = { honor = -1 } } },
        { text = "Something else, Neal.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some of it, when the dwarves clear rock near the Span or Whelgar's crew blow a new trench, and the frogs downstream don't thank them for it. I sell it all the same, because a harbour that can't build can't hold." } },
      choices = {
        { text = "Then sell it with care. The marsh feeds this harbour too.", next = "BACK", reply = "With care, yes, and I'll try. Though I'll admit it's hard to keep track of where every grain of powder ends up.", fx = { align = { honor = 1 } } },
        { text = "Sell whatever pays. The marsh will get by.", next = "BACK", reply = "That's the merchant's view, and I've held it myself. But the marsh is all we've got, and I'd rather not poison it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I stock candles and bandages too, you know, though the gnomes never buy those." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, eh? You'll be wanting rope and torches, I'd think, and maybe a little blasting powder for the stubborn doors." },
        { id = "h_default", key = true,
          text = "Neal Allen, engineering supplies and general goods. A harbor town needs a bit of everything, from rope and bread for the sailors to tubes and powder for the gnomes passing through." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "Neal Allen, engineering supplies and general goods, and I'm glad to see a gnome, for you're my best customers. I've got coarse powder and bronze tubes, if you're building something. Just test it on the far side of the bay, please; I've only the one roof." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, eh? You'll want rope and rations before blasting powder, I'd guess, though you'd be surprised what warriors buy." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? I keep shot and arrows in the back, and the dwarves buy the shot faster than I can stock it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Mind the blasting powder, because it's sealed tight, but I'd not trust any jar near someone who can turn into a bear." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I sell candles, cloth and a few things that a quieter trade might use, and I don't ask what they're for, which is good business." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I've sold to gnomes and sailors and soldiers, but never to someone who talks to the weather. What does the weather need?" },
      },
      again = {
        { id = "h_again", text = "Anything else you need?" },
        { id = "h_again2", text = "Go on, I've got time." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Why sell engineering parts in a harbor town?", next = "why" },
        { text = "Business seems slow these days.", next = "business" },
        { text = "Where do the ships from here go?", next = "ships" },
        { text = "Do you stock blasting powder? Flash powder, even?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you sell anything for spellcasters?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do warriors usually buy from you, Neal?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you keep enough shot for the hunters here?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The garrison must come to you for bandages, Neal.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do your goods ever reach Dun Modr's defenders, Neal?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'd guess some of that blasting powder ends up in the marsh.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you stock much for my trade, Neal?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Has anyone asked for supplies a shaman would need, Neal?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thanks, Neal.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because everyone who comes off a ship needs something, and gnomes come through on the way to Ironforge needing parts. I started with rope and bread, added powder when the gnomes asked, and now I've the oddest shop in the harbor." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    business = {
      lines = {
        { id = "bu_default", text = "Slow, with the Dragonmaw on the roads and the Dark Irons on the Thandol Span, but people still need bread. Lordaeron fell, and the Third Fleet lies drowned in the bay, and we're still here selling, because Menethil folk are as stubborn as the barnacles on the pier." },
      },
      choices = {
        { text = "That's a stubborn sort of courage.", next = "BACK", reply = "Stubborn's the word, and my wife would agree with you. Menethil's been here a long time, and I'd like it to stay a while yet.", fx = { align = { order = 1 }, affinity = 1, learn = { "dragonmaw" } } },
        { text = "Sounds like you should try somewhere else.", next = "BACK", reply = "And go where? Stormwind's full, Lordaeron's gone, and Ironforge doesn't want a human grocer. I'll stay with my bread.", fx = { align = { order = -1 }, learn = { "dragonmaw" } } },
      },
    },

    ships = {
      lines = {
        { id = "sh_default", text = "West across the sea to Auberdine in Darkshore, and south to Theramore in Dustwallow Marsh. The ships run regular, and you'll find the docks just past the inn." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came from Stormwind to Menethil to sell rope, and I never left, though I meant to." } },
    advice = { { id = "tp_ad", text = "Seal everything in this town. Bread, powder, letters, the lot." } },
    _none = { { id = "tp_none", text = "Can't say I know about that. Try Helbrek at the inn." } },
    theramore = { { id = "tp_theramore", text = "Half my rope goes to Theramore on the boat, because Lady Jaina's building and building needs rope. I'd raise my prices, but I like her." } },
    booty_bay = { { id = "tp_booty_bay", text = "I tried selling rope in Booty Bay once, and by the end of the week the goblins had sold me back my own rope. I came home." } },
    lordaeron = { { id = "tp_lordaeron", text = "I sold rigging to Lordaeron's ships before the plague. There aren't any Lordaeron ships now, and I still have a crate marked with their seal." } },
  },
}

-- Samor Festivus: Shady Dealer upstairs in the Deepwater Tavern; sells poisons and admits it.
P:NPC {
  key = "wl_samor", id = TODO_NPC("Samor Festivus"), name = "Samor Festivus",
  bible = "bibles/menethil_shops.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "sharp" }, values = { "cunning", "discreet" },
  notices = { "stealth" },

  impression = {
    first = "He is polite, unhurried and very good at not answering questions.",
    third = "{name} met Samor Festivus, the shady dealer upstairs in Menethil's Deepwater Tavern.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in, and close the door behind you. The draft is bad for business." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, a professional. Sit down, and let's discuss your needs quietly." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I heard the third step creak, friend, so you can stop pretending you're not there. It's a good trick, but this tavern has old floorboards." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Perhaps nothing, and perhaps something no one else in Menethil carries. Certain Wildhammer charms come through here, carried by people who'd rather not be asked where they got them. I don't ask, and I suggest you don't either." } },
      choices = {
        { text = "I'll not buy what's stolen, Samor.", next = "BACK", reply = "A principled buyer, how refreshing. Then you'll want to buy elsewhere, for I couldn't swear to the history of half my shelf.", fx = { align = { honor = 1 } } },
        { text = "I won't ask. Show me what you've got.", next = "BACK", reply = "A buyer after my own heart. I'll show you the good jars, then, and we'll both forget we ever spoke.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Often enough, and they're my favourite customers, because they never complain about what's in the jar. I do insist they leave their little friends at the bottom of the stairs, though, for the last horned thing that came up here ate something from a crate and was ill for a week." } },
      choices = {
        { text = "Then our business stays quiet, Samor.", next = "BACK", reply = "Quiet is my favourite kind of business, friend. Come up the stairs whenever you like, and leave your company at the bottom.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I don't share a trade with poisoners, Samor.", next = "BACK", reply = "Then you'll be lonely, for half your sort in Menethil buy my wares. Go on, then, and judge me from the bottom of the stairs.", fx = { align = { order = 1 } } },
        { text = "Something else, Samor.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Very little, I'd hope, for your kind can kill a man from across a room without staining your hands. Still, there are folk in Theramore and Stormwind who'd pay well to know what's in a cup before they drink it, and a mage who knew poisons could earn a fine living warding against them." } },
      choices = {
        { text = "I'd learn your trade only to stop it.", next = "BACK", reply = "Then you'd learn it well, I'm sure, and still never stop it. Every lord in Lordaeron kept a taster, and every one of them had a reason.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fire or poison, a death is a death.", next = "BACK", reply = "My thoughts exactly, though most of your kind aren't honest enough to say it. You and I should talk more often.", fx = { align = { light = -1 } } },
        { text = "Something else, Samor.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Now and then a warrior wanders up here by mistake, and I send him back down to the bar, for my goods are no use to a sword and shield. I find warriors prefer their fights loud and fair, which is admirable, and bad for business." } },
      choices = {
        { text = "A fair fight needs no poison.", next = "BACK", reply = "Spoken like a man who's never been outnumbered in a dark alley. Down the stairs you go, then, and enjoy the bar.", fx = { align = { honor = 1 } } },
        { text = "A win is a win, however it's earned.", next = "BACK", reply = "Ah, a practical warrior, and a rare beast that is. Come and sit down, and we'll see what I have for an axe blade.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They ask whether my goods would work on an arrowhead, and I tell them I couldn't possibly say. What they do with that knowledge is their own affair, and none of mine." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They ask whether my goods would work on an arrowhead, and I tell them I couldn't possibly say. Keep {pet} away from the jars, though, for some of them smell like supper and none of them are." },
      },
      choices = {
        { text = "I'll keep my arrows clean, thank you.", next = "BACK", reply = "Then you're a better hunter than most of my customers, and I'll not try to sway you. Your arrows, your conscience.", fx = { align = { honor = 1 } } },
        { text = "A tipped arrow brings a raptor down quicker.", next = "BACK", reply = "I couldn't possibly confirm that, friend, though I won't deny it either. Browse as you like.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Poisons don't choose their victims, friend, and neither do I; I only sell them. Whatever happens after that is between the buyer and whoever they answer to, and I gather that's your department." } },
      choices = {
        { text = "Then I'll keep an eye on who buys from you.", next = "BACK", reply = "Do, by all means, and you'll find a great many of them wear the garrison's colours. I've nothing to hide from the Light.", fx = { align = { light = 1 } } },
        { text = "A trader isn't to blame for his buyers.", next = "BACK", reply = "At last, someone who understands commerce. I sell, they buy, and what happens next is between them and the Light.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Samor.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the garrison's own scouts buy from me, and they're the ones who keep the Dragonmaw guessing. Report me if you like, but Menethil would be a good deal blinder without me." } },
      choices = {
        { text = "The law is the law. I'll tell Captain Stoutfist.", next = "BACK", reply = "Do, and I'll wave to you from the window when the scouts come up to buy again. The Captain knows exactly what I sell.", fx = { align = { order = 1 } } },
        { text = "Menethil needs its shadows. I'll keep quiet.", next = "BACK", reply = "You've a wiser head than most of your order, I'll say that. The harbour sleeps better than it knows because of what goes on up these stairs.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Samor.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some come from the marsh and some from further off, and I find it best not to say which. I'll tell you this much: the Wetlands are generous with things that kill, and stingy with almost everything else." } },
      choices = {
        { text = "Poison is a coward's tool. You profit from cruelty.", next = "BACK", reply = "Cruelty is a strong word for a jar of spider venom, friend. I only sell what the marsh already makes in abundance.", fx = { align = { honor = 1 } } },
        { text = "Nature poisons freely, so we should too.", next = "BACK", reply = "An unusual philosophy for a druid, but I won't argue with a customer. The marsh is generous, and so am I, for a price.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, up here? I'd have thought my wares were the opposite of your business, though I'll not turn your coin away." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Please do lower your voice, and perhaps your hammer, since this is a discreet establishment." },
        { id = "h_default", key = true,
          text = "Samor Festivus, dealer in certain specialized goods. I'd tell you what they are, but if you need them, you already know, and if you don't, you're better off not asking." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "Samor Festivus, and you're the sort of customer I like, the kind who knows what they want and keeps it quiet. I've reagents for every poison you've been taught, and a few you haven't." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You'll have no need of my goods, I imagine, though I've been surprised before." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. I've nothing for your beast, I'm afraid, though you might find something for your arrows elsewhere." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, browsing the poisons. Your kind know more about what grows deadly in the wild than my suppliers ever will, I suspect." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. I can't think what you'd want with my goods, unless you've lost patience with fireballs and want something quieter." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Now there's a customer I understand, for I'd wager we both deal in things Captain Stoutfist would rather not hear about." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I sell to those who already know what they need, and if you don't, we'll speak of the weather instead." },
      },
      again = {
        { id = "h_again", text = "Anything else? Speak softly, please." },
        { id = "h_again2", text = "Is there some other small matter I might help with, discreetly?" },
      },
      choices = {
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "Folk call you a shady dealer. Why?", next = "shady" },
        { text = "Your customers must be an interesting lot.", next = "who" },
        { text = "The garrison can't know you're up here.", next = "garrison" },
        { text = "Do warriors ever buy from you, Samor?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters ever come up here looking for something?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Does your trade ever harm the innocent, Samor?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Give me one reason not to report your trade, Samor.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you gather your poisons from the marsh itself, Samor?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What would a mage want with your goods, Samor?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'd guess people of my persuasion buy from you often, Samor.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would a shaman need from your shop, Samor?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },

    shady = {
      lines = {
        { id = "sh_default", text = "Because it's honest, and honesty is rare in my line of work, so I make a point of it. Everyone in Menethil knows what I sell, and nobody can say I lied to them about it." },
      },
      choices = {
        { text = "An honest poisoner? That's almost admirable.", next = "BACK", reply = "Almost, yes, and I'll take that as high praise from a stranger. Come back up the stairs when you need something honest and deadly.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Honesty about poison is still poison.", next = "BACK", reply = "It is, and I've never claimed otherwise. But a liar selling poison is worse, and there are plenty of those in Stormwind.", fx = { align = { honor = -1 } } },
      },
    },

    who = {
      lines = {
        { id = "wh_default", text = "Rogues, mostly, and the occasional hunter who wants his arrows to bite harder. I don't ask what they do with it, and they don't ask where I get it, and that's a fine arrangement for everyone." },
      },
      choices = {
        { text = "Where do you get it?", next = "who_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_where = {
      lines = {
        { id = "ww_default", text = "Now, you see, that's exactly the question we agreed not to ask. Let's just say the Wetlands have many plants, and some of them aren't friendly." },
      },
      choices = { { text = "Then I won't eat anything you sell me.", next = "BACK" } },
    },

    garrison = {
      lines = {
        { id = "ga_default", text = "Of course they know, and they let me be, because half their scouts buy from me. Captain Stoutfist pretends I don't exist, which is the best kind of permission." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'd rather not discuss my past, friend. It's much less interesting than my present." } },
    advice = { { id = "tp_ad", text = "Never drink from a cup you didn't watch being poured." } },
    _none = { { id = "tp_none", text = "I'm afraid I know nothing about that, and I'm very good at knowing nothing." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "Ravenholdt? Never heard of it, friend, and I'm very good at not hearing of things. You'd do well to practise the same." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate in Alterac are thieves who think they're nobles, or nobles who think they're thieves. I'd not cross them, and I'd not trust them either." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is the only town in the world where a man can sell his past and buy a new one by morning. So I hear, anyway." } },
  },
}
