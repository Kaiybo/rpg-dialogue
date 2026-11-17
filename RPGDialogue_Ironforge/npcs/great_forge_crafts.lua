-- The Great Forge's crafts: the Great Anvil, Deepmountain Mining, the Bronze Kettle, the Physician and the Arcanery.
-- Voices: bibles/great_forge_crafts.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC = P.TODO_NPC

-- Bengus Deepforge: blacksmithing trainer at the center of the Great Forge.
P:NPC {
  key = "if_bengus", id = TODO_NPC("Bengus Deepforge"), name = "Bengus Deepforge",
  bible = "bibles/great_forge_crafts.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "gruff" }, values = { "proud", "practical" },
  notices = { "craft" },

  impression = {
    first = "Bengus Deepforge teaches smithing at the very heart of the Great Forge, where the heat would melt a lesser teacher. He judges people by their hands, and he says most hands are soft.",
    third = "{name} met Bengus Deepforge, the master blacksmith who trains smiths at the Great Forge.",
  },

  greetings = {
    { id = "g_default", text = "If ye've only come in tae warm yer hands, stand back from the anvil while ye do it." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the forge, are ye? Show me yer hands, then; let's see if they've hardened." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing" } },
      text = "Ye've a smith's burns on yer forearms, I see. Good, for a smith who's never been burned has never stood close enough tae the work." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think it's the oldest workin' fire in the world, an' I've never once called it alive. But I've worked it since I was a lad, an' there's days it draws hot an' eager an' days it sulks, an' I'll no' pretend that's only the bellows. If ye tell me there's somethin' in there listenin', I might just believe ye." } },
      choices = {
        { text = "It's the Titans' gift. Tend it the way they meant.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It's alive, Bengus. Treat it as a partner, not a tool.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The mountain's held this fire since before my grandfather's grandfather, an' it hasnae complained once. Stone an' flame are old friends, an' the forge is only the place where they meet." } },
      choices = {
        { text = "Then the forge honors the mountain. I can respect that.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Mountains don't complain. That doesn't mean they don't suffer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should know enough tae mend a buckle an' straighten a notch, for the battlefield's a long way from the Great Forge. Ye'll no' be a smith in a week, but ye'll stop bringin' me shields wi' holes in them that a wee bit o' rivetin' would've saved." } },
      choices = {
        { text = "I'll learn to mend my own gear, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll fight, and leave the mending to smiths.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now an' then, though the gunsmiths do the fine work; I make the steel an' they make it sing. A dwarf hunter wi' a Great Forge barrel can hit a ram's horn at three hundred paces, an' I've seen it done." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' a collar for yer {pet}, if ye'd like one, for a good collar's just a ring o' steel that's learned some manners." },
      },
      choices = {
        { text = "I'll trust Great Forge steel over any other.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Any barrel will do if the hand is steady.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A young gnome tried tae make it hotter, an' it spat a blob o' molten iron at him that I'm still scrapin' off the floor. Arcane fire an' forge fire dinnae mix, an' that's a lesson I'd rather ye learned from me." } },
      choices = {
        { text = "I'll leave the Great Forge to the smiths, Bengus.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A hotter forge would make better steel. It's worth trying.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'll no' find out, an' that's the point. A warlock came by in the winter an' tried tae temper a blade in green flame, an' the steel came out black an' brittle, an' nobody would touch it after." } },
      choices = {
        { text = "Then I'll keep fel fire far from honest metal.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Black steel has uses, Bengus. You just didn't find them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some o' the old dwarves say the titans lit it, an' some say it's just a very good fire, an' I say it's never gone out, which is holy enough for me. The priests from the Mystic Ward come down tae bless the anvils now an' again, an' I'll no' tell them tae stop." } },
      choices = {
        { text = "Then the fire and the faith both deserve respect, Bengus.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A fire is a fire. The smiths deserve the credit, not the titans.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Teach me something about smithing instead.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Patience, which is the first thing the Great Forge teaches an' the last thing most folk learn. A blade that's rushed snaps when ye need it most, an' I'd think a rogue o' all people would want a blade that doesnae fail in the dark." },
      },
      choices = {
        { text = "I'll learn patience at the forge.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll buy my blades, not make them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at the Great Forge! Ye'll want tae stand back from the heat, for I've seen yer robes catch before, an' I'd rather no' see it again." },
        { id = "h_default", key = true,
          text = "Bengus Deepforge, an' this is the Great Forge, the fire at the heart o' Ironforge, which has never once gone out. If ye want tae learn tae work metal, there's no better place on this world tae learn it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at the Great Forge! Mind ye don't try tae light it, for it's never gone out an' it doesnae need yer help." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'll warn ye once, warlock: the Great Forge doesnae take kindly tae fel fire, an' neither do I." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Show me yer hands, then, for I can tell what a warrior's made of by the calluses." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? I make a good arrowhead an' a better gun barrel, but I'll leave the shootin' tae ye." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the Great Forge. Let me see yer hands; soft, as I thought, though I'll grant ye a bear's paws were never made for tongs." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. Soft hands, I'd wager, but quick ones, an' I've seen a lockpick made by a rogue that was finer work than half my apprentices manage." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman at the Great Forge! Ye'll feel it, I expect, the fire at the heart o' the mountain. Tell me true, does it know us?" },
      },
      again = {
        { id = "h_again", text = "Speak up, the bellows are loud." },
        { id = "h_again2", text = "What else? Mind the sparks off the Great Anvil, for they'll singe a beard." },
      },
      choices = {
        { text = "Teach me the craft.", next = "BUSINESS" },
        { text = "They say the Great Forge has never gone out.", next = "forge" },
        { text = "What makes a good smith?", next = "good" },
        { text = "Where should a new smith find ore?", next = "ore" },
        { text = "A paladin's hammer is only as good as its maker.", next = "k_pally", when = { class = "PALADIN" } },
        { text = "Has a mage ever tried to light the Great Forge?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does fel fire really harm the Great Forge?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Should a warrior learn to work metal, Bengus?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you forge gun barrels for hunters, Bengus?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is there anything holy about the Great Forge, Bengus?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does the forge ever trouble the mountain, Bengus?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could a rogue learn anything at your forge, Bengus?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do you think the Great Forge's fire is, Bengus?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    forge = {
      lines = {
        { id = "fo_default", text = "Never, no' since the mountain was first hollowed out, for the heat comes up from the deep rock itself. When the gnomes first saw it, they asked how we'd built it, an' the truth is we didnae; we only found it an' put an anvil next to it." },
      },
      choices = {
        { text = "That's a humble thing for a dwarf to admit.", next = "forge_humble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge_humble = {
      lines = {
        { id = "fh_default", text = "I'm humble about the fire, {g:lad|lass}, no' about what I make wi' it. Any dwarf can stand beside the Great Forge, but it takes a smith tae turn its heat intae a blade that'll hold an edge in Blackrock." },
      },
      choices = {
        { text = "Craft beats any gift of nature, given a hot forge.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Without the fire, your craft is nothing.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    good = {
      lines = {
        { id = "go_default", text = "Patience first, then strength, an' then a stubbornness that won't let ye hand over a blade ye know is flawed. I've sent apprentices back tae the anvil four times in a mornin', an' the good ones thanked me for it later." },
      },
      choices = {
        { text = "I'd guess a few of them quit.", next = "good_quit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_quit = {
      lines = {
        { id = "gq_default", text = "Plenty, an' they went tae sell their wares in the Commons, where folk don't know any better. I don't blame them for it, but I'd no' trust their work on my back in a fight." },
      },
      choices = {
        { text = "Not everyone can be a master. They still earn a living.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Selling bad work as good is lying, plain and simple.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
      },
    },

    ore = {
      lines = {
        { id = "or_default", text = "Copper in Dun Morogh, if ye can get past the troggs that have come up out o' Gnomeregan, an' tin out in Loch Modan. Geofram Bouldertoe teaches minin' just along the way, an' he'll tell ye more than ye ever wanted tae know." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } } },
    },

    k_pally = {
      lines = {
        { id = "kp_default", text = "Aye, an' many a paladin's walked away from this forge wi' a hammer they'll carry till they die. Bring me yours some day an' I'll tell ye honestly whether it's worthy o' the Light ye put through it." },
        { id = "kp_dwarf", when = { race = "Dwarf" },
          text = "Spoken like a son o' Ironforge. There's been a paladin's hammer on the Great Anvil every week since Uther's day, an' I've made a few that've seen more battles than their owners." },
      },
      choices = {
        { text = "The Light matters more than the hammer.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A good hammer wins more fights than prayer.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "The Deepforges have worked metal beside the Great Forge since before there was a king in this mountain, an' I'm the latest an' the loudest of them." } },
    advice = { { id = "tp_ad", text = "Quench slowly, an' never in front o' the customer." } },
    second_war = { { id = "tp_second_war", text = "I forged blades fer the Second War, day an' night fer months, an' every one o' them saw a Horde shield. Soft hands didnae win that war, I'll tell ye." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons have the best forges in the world under that mountain, an' it pains me tae say it. They've fire from the Firelord himself, an' they use it fer weapons that'd make ye weep." } },
    thaurissan = { { id = "tp_thaurissan", text = "A smith-king who sold his people tae a fire lord fer better forges, an' what's left o' them is still payin'. Never trust a dwarf who wants the fire hotter than the work needs." } },
    _none = { { id = "tp_none", text = "I hammer metal, {g:lad|lass}, no' rumors. Ask someone who's got the time." } },
  },
}

-- Geofram Bouldertoe: mining trainer at Deepmountain Mining on the north side of the Great Forge.
P:NPC {
  key = "if_geofram", id = TODO_NPC("Geofram Bouldertoe"), name = "Geofram Bouldertoe",
  bible = "bibles/great_forge_crafts.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "steady" }, values = { "practical", "patient" },
  notices = { "craft" },

  impression = {
    first = "Geofram Bouldertoe teaches mining at the north side of the Great Forge and talks about stone the way other dwarves talk about ale. He has a deep respect for tunnels and none at all for troggs.",
    third = "{name} met Geofram Bouldertoe, who teaches mining in the Great Forge.",
  },

  greetings = {
    { id = "g_default", text = "Lookin' tae learn the pick? I can teach ye, if ye've the shoulders for it." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the tunnels? Ye've still all yer fingers, which is a fine start." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { origin = "dwarf_ironforge_miner" },
      text = "I'd know a miner's walk anywhere, the way ye keep yer head low under a doorway that's plenty high. Which tunnels did ye work, before ye took up adventurin'?" },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The old hands say so, an' the old hands are the ones still alive, so I listen tae them. Deepmountain's taught for generations that a creakin' tunnel's only settlin', but I've lost good diggers who believed it. If the stone talks tae ye, I'd sooner ye taught my students tae hear it than I taught them tae ignore it." } },
      choices = {
        { text = "Keep Deepmountain's methods, and add the listening on top.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Throw out the old teaching. Listen to the stone first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Aye, when the rock tells me it'll come down on my head, which is the mountain's way o' sayin' no. The rest o' the time the ore's there tae be taken, an' I'll no' apologise for takin' it." } },
      choices = {
        { text = "Take what you need, and listen when the rock speaks.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The earth isn't yours to empty, however rich the seam.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In the Gol'Bolar Quarry, aye, for the troggs have been diggin' up from below, an' they treat a miner's tunnel as an invitation. Nobody's worked it in peace since they came, an' I'd like tae see the day we do." } },
      choices = {
        { text = "I'll guard your miners and see them home.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll clear the quarry, if I get a share of the seam.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Troggs, if ye've the stomach, an' the spiders that nest in the old shafts, which I'd shoot on sight. Mind ye don't take a beast down a narrow tunnel, though, for there's no room tae turn round an' they panic." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Yer {pet} would fill a tunnel wall tae wall, I'd say, so keep it tae the wide shafts an' it'll be fine." },
      },
      choices = {
        { text = "I'll keep to the wide shafts and go carefully.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Narrow or wide, I'll go where the quarry goes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Plenty. A good miner knows every crack an' passage, every sound the stone makes, an' that's more than most thieves will ever know. Just don't use what I teach ye tae rob my own diggings." } },
      choices = {
        { text = "I'll use it against the Dark Irons, not your diggings.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your diggings are safe until they're worth robbing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Too many, an' every one makes them twitch. The troggs came up from the deep places, an' nobody knows what they found down there, so a miner seein' a demon in the dark is apt tae swing a pick first an' ask after." } },
      choices = {
        { text = "I'll keep the creature close and out of their way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If they swing at my demon, they'll regret it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Aye, an' worse than hurt, for the troggs came up through the deep seams near Gnomeregan an' took two o' my best before we could seal the shaft. The lads still work, but they work wi' one eye on the dark, an' I'd give a lot for them tae sleep easy again." } },
      choices = {
        { text = "Then I'll pray for them, and the two you lost.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't seal a shaft. Send more guards down there.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Tell me about mining instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some o' the lads say so, an' I'll no' send any dwarf where he doesnae want tae go. But that ore is Ironforge's, an' if we give it up tae the troggs, they'll only come up through the next seam, an' the one after." } },
      choices = {
        { text = "Hold the seams. Ironforge doesn't give ground to troggs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No ore is worth a miner's life. Let them leave it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Good digging, Geofram.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "There's somethin' in it, though I'd no' call it magic, for the old seams under Ironforge hum when ye strike them right, an' every miner here knows the sound. The titans shaped these mountains, so I suppose it's no surprise the stone remembers a thing or two." },
      },
      choices = {
        { text = "The stone should be respected, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A seam's a seam. Dig it out.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, at Deepmountain Minin'? Ye'll want tae say a prayer for my lads in the tunnels, then, for the troggs are back an' the miners are scared." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'd be a welcome sight in the tunnels, for troggs fear a hammer more than a pick, an' my miners fear the troggs more than anythin'." },
        { id = "h_default", key = true,
          text = "Geofram Bouldertoe, o' Deepmountain Minin'. I teach folk how tae find a seam, how tae follow it, an' how tae come back out o' the tunnel afterwards, which is the part most forget." },
        { id = "h_miner", when = { profession = { "Mining" } },
          text = "Geofram Bouldertoe, o' Deepmountain Minin', an' I see ye're one o' us already, by the dust on ye. Come tae learn the next vein, have ye?" },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, aye? Ye'll want tae learn the deep tunnels, I reckon, for there's plenty o' places a body could hide down there." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Warlock, ye'll want tae keep yer creature out o' my tunnels, for the miners down there are jumpy enough wi' the troggs about." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Good; a miner wi' a warrior at his back goes deeper an' comes back sooner, an' that's the best kind o' minin'." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? There's no' much tae hunt underground, though the troggs might disagree wi' me." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Yer kind dislike holes in the ground, I'm told, which makes this an awkward meetin', for I teach folk how tae dig them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Ye'll no' be swingin' a pick, I expect, but ye might like tae know that half the gems the enchanters fuss over came up out o' my tunnels." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I've had miners swear the seams sing before a cave-in, an' I'd give a month's ore tae know if they were right." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've a seam map tae finish." },
        { id = "h_again2", text = "Go on, I'm listenin'." },
      },
      choices = {
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "How do I find a seam?", next = "seam" },
        { text = "What happened to the mines near Gnomeregan?", next = "troggs" },
        { text = "Someone around here must sell picks.", next = "golnir" },
        { text = "Could a rogue learn something useful from a miner?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Have your miners seen many troggs lately?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do miners need warriors with them these days, Geofram?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is there anything worth hunting in the mines?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your miners seem to be getting hurt in the tunnels, Geofram.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the miners abandon the deep seams near Gnomeregan?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever leave a seam unmined for the mountain's sake?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is there magic in the deep stone, Geofram?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the seams really warn miners before a collapse, Geofram?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good digging, Geofram.", next = "END" },
      },
    },

    seam = {
      lines = {
        { id = "se_default", text = "Look at the rock where it changes color, for ore likes tae sit where two kinds o' stone meet. Copper shows green at the edges, tin's darker, an' when ye see silver ye'll know it, for it'll make yer heart jump." },
      },
      choices = {
        { text = "And the deeper metals?", next = "seam_deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seam_deep = {
      lines = {
        { id = "sd_default", text = "Iron an' mithril an' the like come later, in harder country further from home. Ye'll need more skill than ye've got, an' a better pick, an' friends who'll stand guard while ye swing it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    troggs = {
      lines = {
        { id = "tr_default", text = "Troggs came up out o' the deep places when Gnomeregan fell, an' they took half the good tunnels in Dun Morogh. Ironband's lot out in Loch Modan are fightin' them for every cart o' ore now, an' it's no' gettin' easier." },
      },
      choices = {
        { text = "Then we should drive them back to the deeps.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "troggs" } } },
        { text = "Then dig somewhere they aren't.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 }, learn = { "troggs" } } },
      },
    },

    golnir = {
      lines = {
        { id = "go_default", text = "Golnir, at the next counter, sells picks an' flux an' the like, an' he'll tell ye my teachin's out o' date while he does it. Pay him no mind; he means it as a compliment." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I dug for forty years before my knees told me tae teach instead, an' I listened tae them for once." } },
    advice = { { id = "tp_ad", text = "If the tunnel goes quiet, stop swingin' an' listen. Stone talks before it falls." } },
    troggs = { { id = "tp_troggs", text = "Troggs dinnae mine, they dig, an' there's a world o' difference. They wreck a good seam an' leave nothin' but rubble an' stink." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons mine deeper than anybody, down where the stone's hot tae the touch. I'd give my pick tae see one o' their seams, though I'd want it back after." } },
    uldaman = { { id = "tp_uldaman", text = "The League found titan stone in Uldaman, harder than any ore I know, an' I'd love tae put a pick tae it. They say it hums when ye strike it, an' I believe them." } },
    _none = { { id = "tp_none", text = "If it isnae in the rock, I couldnae tell ye about it." } },
  },
}

-- Daryl Riknussun: cooking trainer at the Bronze Kettle; brother of Emrul.
P:NPC {
  key = "if_daryl", id = TODO_NPC("Daryl Riknussun"), name = "Daryl Riknussun",
  bible = "bibles/great_forge_crafts.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "jovial" }, values = { "generous", "proud" },
  notices = { "hunger" },

  impression = {
    first = "Daryl Riknussun teaches cooking at the Bronze Kettle and believes that a good meal solves most of life's problems. He talks about his brother Emrul's spice prices as if they were a personal insult.",
    third = "{name} met Daryl Riknussun, who teaches cooking at the Bronze Kettle in Ironforge.",
  },

  greetings = {
    { id = "g_default", text = "Ye look hungry, friend, an' I can fix that or teach ye tae fix it yerself." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the Kettle! What've ye been cookin' since I saw ye last?" },
  },

  notice = {
    { id = "n_cook", cat = "hunger", when = { profession = { "Cooking" } },
      text = "Ye smell o' woodsmoke an' boar fat, which means ye've been cookin' over a campfire. Good, for that's how every great cook starts." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I've wondered! The Wildhammers I've fed cook over open flame an' say a word tae it first, an' I always thought it was manners. A recruit asked me once if the fire would sulk if he burned the meat, an' I told him the fire wouldnae, but I would." } },
      choices = {
        { text = "Saying a word to the fire is only good manners.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The fire doesn't care. Just don't burn the meat.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I could, though Emrul would charge me double for the mushrooms, the old thief. Night elves aren't all fussy about meat, mind, but a good cook asks before he serves, an' that's the first thing I teach." } },
      choices = {
        { text = "Always ask your guest first. That's simple courtesy.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Serve what you have. Travellers can't afford to be choosy.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A good stew, for ye can make it from anythin' ye've killed an' it'll keep ye warm on a night watch. Boar, wolf, bear; it all goes in the pot, an' a warrior wi' a hot meal fights twice as hard as one wi' a cold biscuit." } },
      choices = {
        { text = "I'll learn the stew and share it on watch.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Teach me the stew. I'll not be sharing it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boar from Dun Morogh, for it's lean an' sweet, an' bear when ye can get it, for it's rich enough tae feed a family. Bring me crag boar ribs an' I'll teach ye somethin' Ragnar Thunderbrew would pay tae know." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' yer {pet} would eat well too, if ye'd learn a bit o' cookin', for a beast likes a warm meal as much as any dwarf." },
      },
      choices = {
        { text = "I'll take only what the pot needs.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take all I can, and sell what's left over.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Emrul, every week, though he'll deny it. Ye might think a recipe's a small thing, but a good cook's livelihood rests on knowin' what nobody else knows, much like yer trade." } },
      choices = {
        { text = "A recipe's a cook's secret. I'll respect yours.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Secrets are meant to be pried loose. That's the fun.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because conjured food tastes like nothin' an' cooks like nothin', an' I've tried. Real cookin' starts wi' real meat an' honest fire, an' I'll make a cook o' ye yet if ye let me." } },
      choices = {
        { text = "Real food from real fire. You've convinced me, Daryl.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Conjured food fills the belly. Taste is a luxury.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every week, for the Physician sends down orders for broth an' I make it the way my mother did, wi' bones an' barley an' nothin' fancy. Nissa says it does as much as her bandages, but she'll never say it in front o' her students." } },
      choices = {
        { text = "Feeding the sick is holy work, Daryl. Keep doing it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Broth is broth. Healing is the priests' work, not the cook's.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Teach me a recipe instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Somethin' that sticks tae yer ribs, like boar an' barley stew, an' plenty o' it, for a paladin on an empty stomach is just a very heavy dwarf. I'll teach ye how tae make it, an' ye'll thank me in the Wetlands." } },
      choices = {
        { text = "I'd share it with the soldiers marching beside me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A paladin's strength comes first. I'll eat my fill before sharing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Daryl.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It's helped everyone else who's sat at this kettle, so I dinnae see why ye'd be any different. Just keep yer wee imp off the spice rack, for my brother Emrul charges me a fortune for every pinch, an' I'll no' pay twice." },
      },
      choices = {
        { text = "Thank you, Daryl. I'll gladly eat.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Save your food. I don't need comforting.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Ye'll eat before ye pray, I hope, for I've seen too many o' yer lot faint over a bowl o' soup they forgot tae finish." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll be wantin' somethin' heavy, I'd wager, for that plate burns more than a forge does, an' I've a stew that'll carry ye through a day's march." },
        { id = "h_default", key = true,
          text = "Daryl Riknussun, cook, an' welcome tae the Bronze Kettle. I teach anyone who wants tae learn, from a fresh recruit wi' a boar haunch tae a grizzled mountaineer who's lived on hard biscuits too long." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in my kitchen? Ye'll find nothin' worth stealin' but my recipes, an' those I keep in my head." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at the Bronze Kettle! I'll teach ye tae cook, but I'll no' have ye conjurin' the ingredients." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll have been livin' on hard biscuits, I'd wager, an' I can fix that in an afternoon." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now there's a cook's best friend, for ye bring me the meat an' I'll show ye what tae do wi' it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Ye'll know yer herbs, then, an' a cook who knows his herbs is halfway tae a good stew." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Sit down an' have a sausage, for there's no trouble in the world a good meal cannae shrink, an' ye look like ye've a few." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman at the Bronze Kettle! Ye'll know a good fire, then, so tell me honestly if mine's any good." },
      },
      again = {
        { id = "h_again", text = "What else would ye like tae know? Ask while the pot's on." },
        { id = "h_again2", text = "Another question? Ye'll make a cook yet." },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What should a beginner cook first?", next = "first" },
        { text = "What's the finest dish in Ironforge?", next = "finest" },
        { text = "The dwarf selling spices out front looks like kin of yours.", next = "emrul" },
        { text = "Do dwarves eat anything that isn't meat?", next = "k_elf", when = { race = "NightElf" } },
        { text = "Has anyone tried to steal your recipes, Daryl?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why not let a mage conjure your ingredients?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What should a warrior know how to cook, Daryl?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What meat do you most want hunters to bring you?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess you cook for the sick now and then, Daryl.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What should a paladin eat before a long march, Daryl?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could you cook something without meat for a druid?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can a good meal really help a warlock, Daryl?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does a shaman cook any differently, Daryl?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll come back hungry.", next = "END" },
      },
    },

    first = {
      lines = {
        { id = "fi_default", text = "Boar, an' plenty of it, for Dun Morogh's full o' the beasts an' they're no' hard tae cook. Roast a few haunches over a fire, an' when ye can do that wi'out burnin' it, come back an' I'll teach ye somethin' wi' spice in it." },
      },
      choices = {
        { text = "Why does food matter for adventurers?", next = "first_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_why = {
      lines = {
        { id = "fw_default", text = "Because ye'll heal faster wi' a full belly, an' ye'll fight better wi' a good one. I've seen hearty stew do more for a tired company than any speech from a captain." },
      },
      choices = {
        { text = "A good meal is worth sharing with the whole company.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll keep the best food for myself.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },

    finest = {
      lines = {
        { id = "fn_default", text = "Ask ten dwarves an' ye'll get ten answers, but mine's a proper roast wi' Thunderbrew ale in the gravy. The folk in Thelsamar will tell ye it's their blood sausages, an' they're wrong, but I'll no' say it tae their faces." },
      },
      choices = {
        { text = "I've had those sausages. They're very good.", next = "finest_sausage" },
        { text = "Something else.", next = "BACK" },
      },
    },
    finest_sausage = {
      lines = {
        { id = "fs_default", text = "Fine, fine, they're very good, but they're a breakfast, no' a feast. Don't tell anyone in Loch Modan I admitted that much." },
      },
      choices = { { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } } },
    },

    emrul = {
      lines = {
        { id = "em_default", text = "That's my brother Emrul, an' he sells the spices an' recipes I teach wi', at prices I'd call criminal if he werenae family. We've shared this shop for years an' argued in it every day." },
      },
      choices = {
        { text = "You two must argue a great deal.", next = "emrul_argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    emrul_argue = {
      lines = {
        { id = "ea_default", text = "Salt, mostly, an' whose turn it is tae scrub the kettle, an' whether our mother's stew had carrots in it. It did, an' he knows it did, but he'll never say so." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    k_elf = {
      lines = {
        { id = "ke_default", text = "We eat bread, an' cheese, an' mushrooms from the deep caves, though I'll grant ye there's meat in most of it. Bring me somethin' from yer forests an' I'll find a way tae cook it that'd make a Darnassian smile." },
      },
      choices = {
        { text = "I'd like to see you try.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Our father ran a kitchen in the Military Ward, an' Emrul an' me grew up peelin' potatoes for half the army." } },
    advice = { { id = "tp_ad", text = "Taste as ye go. A cook who doesn't taste is only guessin'." } },
    booty_bay = { { id = "tp_booty_bay", text = "The pirates in Booty Bay eat better than kings, so I've heard, all fish an' spice an' rum. I'd like tae cook fer them one night, though I'd want my wages paid in advance." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Food on a stick, every bit o' it, an' half o' it fried in oil older than me. Still, I've never had a better roast from a cart in my life." } },
    everlook = { { id = "tp_everlook", text = "Everlook's goblins import their spice from Booty Bay an' sell it fer triple. My brother Emrul thinks that's a fine business model, an' it's why I'm worried about him." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, friend. If it's no' edible, it's no' my business." } },
  },
}

-- Emrul Riknussun: cooking supplies at the Bronze Kettle; Daryl's brother.
P:NPC {
  key = "if_emrul", id = TODO_NPC("Emrul Riknussun"), name = "Emrul Riknussun",
  bible = "bibles/great_forge_crafts.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "sharp" }, values = { "practical", "proud" },
  notices = { "hunger" },

  impression = {
    first = "Emrul Riknussun sells spices and recipes at the Bronze Kettle and swears his prices are fair. He talks about his brother Daryl with a fondness he hides under a great deal of complaining.",
    third = "{name} met Emrul Riknussun, Daryl's brother, who sells spices and recipes beside the Bronze Kettle.",
  },

  greetings = {
    { id = "g_default", text = "Spices, salt an' recipes, all at honest prices, whatever my brother's told ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more spice? I knew ye'd get the taste for it." },
  },

  notice = {
    { id = "n_hungry", cat = "hunger", when = { profession = { "Cooking" } },
      text = "Ah, a cook. Let me guess: Daryl taught ye somethin' an' sent ye tae me for the spices, as he always does." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Better pepper, I'd hope! It came in damp through the Wetlands, an' I swear the whole crate's been sulkin' since. Daryl says I'm daft tae think spices have moods, but Daryl also says he's the better-lookin' brother, so ye can see where his judgment lies." } },
      choices = {
        { text = "I'll not pretend, Emrul. Spices have no spirits.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "For a fair price, I'll whisper sweet things to your pepper.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Stormwind ships, mostly, an' a few from Darnassus that yer people sell dear. Some I couldnae tell ye the source of, but they smell right an' they cook right, an' I've no' poisoned a customer yet." } },
      choices = {
        { text = "A merchant should know where his goods come from.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If they cook right, the source hardly matters.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a warrior on the march eats the same boar every night, an' a pinch o' the right spice turns it from a chore intae a reason tae come home. Daryl will tell ye otherwise, but Daryl puts nutmeg in everythin'." } },
      choices = {
        { text = "Salt's enough for me. I'll not waste coin on spice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Give me the spice. A soldier deserves a little joy.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Mild spices an' a pinch o' salt, an' no' a grain more, for boar's got its own flavour if ye let it. Daryl would drown it in nutmeg, but he's my brother, so I'll say only that he's wrong." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' yer {pet} would like a bit o' seasonin' too, I'd wager, though most beasts are happy wi' what ye kill raw." },
      },
      choices = {
        { text = "Keep it simple. Let the meat speak for itself.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Drown it in spice. The more the better.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No' often, but the last one took my saffron an' sold it back tae me at the auction. I'd admire it if it hadnae been my saffron, an' I've no' forgiven him yet." } },
      choices = {
        { text = "Stealing from a shopkeeper is low. I won't do it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Selling it back to you was rather clever, Emrul.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Some do, for they say a warlock's gold comes from places it shouldnae. I'll take yours, mind, for it spends the same, but I'll no' pretend there's nobody in the Commons who'll look at ye sideways." } },
      choices = {
        { text = "My coin's honestly earned, Emrul. You've nothing to fear.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Where my gold came from is none of your business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Now an' again, when nobody's lookin', for if Daryl hears o' it he'll say I've gone soft. A pinch o' salt makes a poor man's supper bearable, an' I'll no' turn a hungry dwarf away, whatever my brother says about my prices." } },
      choices = {
        { text = "Feeding folk does more good than most prayers, Emrul.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You should charge them fairly. Charity makes beggars.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Show me your supplies, Emrul.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Fair as the Great Forge is hot, an' Daryl only says otherwise because he wants a discount for bein' my brother. The spices come from Stormwind an' further, an' the caravans cost what they cost, so ye can take it up wi' the road." } },
      choices = {
        { text = "I believe you. An honest trader deserves to be trusted.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every trader says that. I'll take your brother's word.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Emrul.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not a bit, an' I'll stand by that, for real spice comes all the way from Booty Bay an' Theramore, an' ye can taste every league o' the journey. Daryl says my prices are robbery, but he's never once complained about the flavour." },
      },
      choices = {
        { text = "Real spice is worth the price, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Conjured is cheaper. Flavour's overrated.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest wantin' spices! Ye'll be cookin' for the poor, I suppose, an' I'll no' charge ye extra for the salt, though I'll no' charge ye less either." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll be needin' salt, for a soldier's supper wi'out salt is a sad thing, an' I'd hate tae see a paladin sad." },
        { id = "h_default", key = true,
          text = "Emrul Riknussun, cookin' supplies, an' the better-lookin' Riknussun, no matter what ye've heard. If Daryl's taught ye a recipe, I've the spices for it, an' a few recipes he hasnae thought o' yet." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! I'll be watchin' my spice jars, mind, for some o' them cost more than a sword." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock wantin' spices? Ye'll forgive me if I check yer coin for brimstone before I take it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll want salt, then, for there's nothin' sadder than a soldier's supper wi'out it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll be the one bringin' Daryl his meat, then, an' I'll be the one makin' it taste o' somethin'." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Ye'll be wantin' herbs, then, an' I've a few that Daryl doesnae even know the names of." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Dinnae even think about conjurin' cinnamon, for I've heard o' mages tryin', an' it tastes o' nothin' but disappointment." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Daryl's goin' tae want ye for his fire, but come tae me first, for I'll pay ye more for a kind word tae my spice chest." },
      },
      again = {
        { id = "h_again", text = "What else, then? I've a customer behind ye, I think." },
        { id = "h_again2", text = "Go on, ask." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Daryl says your prices are criminal.", next = "prices", when = { heardLine = "if_daryl.em_default" } },
        { text = "Where do your spices come from?", next = "spices" },
        { text = "Which recipe would you recommend?", next = "recipe" },
        { text = "Do rogues steal spices from you often?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do people really worry about warlocks' coin?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why should a warrior care about spices, Emrul?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What spice would you put on wild boar, Emrul?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever give spices to the poor in the Forlorn Cavern?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Are your spice prices fair, Emrul? Your brother says otherwise.", next = "xapala", when = { class = "PALADIN", heardLine = "if_daryl.em_default" } },
        { text = "Where do your spices come from, Emrul?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can't conjured spices match yours, Emrul?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What would a kind word to your spice chest get you?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Emrul.", next = "END" },
      },
    },

    prices = {
      lines = {
        { id = "pr_default", text = "Of course he does, for he's never bought a thing in his life; he just sends his students tae me. Spice comes a long way tae reach a mountain, an' somebody has tae pay the gryphon." },
      },
      choices = {
        { text = "Fair prices are a duty to your customers.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Charge what they'll pay. That's business.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },

    spices = {
      lines = {
        { id = "sp_default", text = "Mild spices come up from Stormwind on the tram, an' the hot ones come by ship tae Menethil an' then over the mountains. Every time the Dragonmaw block the Wetlands road, my prices go up, an' Daryl calls me a thief." },
      },
      choices = {
        { text = "So the tram brings spices too.", next = "spices_tram" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } },
      },
    },
    spices_tram = {
      lines = {
        { id = "st_default", text = "It brings everythin', now that the gnomes have it runnin' under the sea tae Stormwind. I don't like ridin' it myself, for there's a great deal o' water above ye, but the spice doesnae mind." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    recipe = {
      lines = {
        { id = "re_default", text = "Start wi' somethin' hearty that ye can make from what ye kill on the road, like boar or crocolisk. Fancy dishes are for folk who sit at home, an' ye don't look like one o' them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Daryl got the cookin' an' I got the head for figures, an' between us we make one decent dwarf." } },
    advice = { { id = "tp_ad", text = "Keep yer salt dry. Ye'd be amazed how many adventurers don't." } },
    booty_bay = { { id = "tp_booty_bay", text = "The finest spices in the world come through Booty Bay, an' I pay through the beard fer them. My brother complains about my prices, but I'd like tae see him haggle wi' a goblin." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan sells spices from the desert that'd blister yer tongue, an' I keep a pinch on the shelf fer the brave. Daryl says it's a menace, an' he's right." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire buys my cheapest spices an' sells them back tae the crowds as Darkmoon magic. I'm no' complainin', mind, fer they pay on time." } },
    _none = { { id = "tp_none", text = "Never heard of it, an' I've heard of most things that come through the Great Forge." } },
  },
}

-- Nissa Firestone: first aid trainer at the Ironforge Physician; sends experts to Theramore.
P:NPC {
  key = "if_nissa", id = TODO_NPC("Nissa Firestone"), name = "Nissa Firestone",
  bible = "bibles/great_forge_crafts.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "practical", "compassionate" },
  notices = { "weary" },

  impression = {
    first = "Nissa Firestone teaches bandaging at the Ironforge Physician and has no patience for anyone who bleeds on her floor. She is gentle with wounds and brisk with everything else.",
    third = "{name} met Nissa Firestone, who teaches first aid at the Ironforge Physician.",
  },

  greetings = {
    { id = "g_default", text = "Sit down if ye're bleedin', an' stand if ye're no'. Which is it?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' still in one piece, I see. Good, keep it that way." },
  },

  notice = {
    { id = "n_hurt", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Yer armor's in tatters, so I'd guess what's under it's no' much better. Let me see, an' don't argue." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Aye, an' gladly, though I'm a physician first an' a believer second. A bandage I understand: clean it, bind it, keep it dry. What the priests do I've stopped askin' about, an' what ye do I havenae even begun tae ask, but a soldier doesnae care where the healin' comes from, so long as it comes." } },
      choices = {
        { text = "Healing is healing. I'll stand beside your bandages gladly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bandages are for those without a better gift.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It's quicker, but quick isnae always good, for I've seen spells close a wound wi' dirt still in it. Clean it first, an' then do what ye like wi' yer leaves an' yer moonlight." } },
      choices = {
        { text = "Sound practice first and magic second. You're right.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Nature mends better than linen and needles ever will.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should, for ye're the one standin' in front when the trogg's club comes down, an' the priest's usually standin' behind ye. A good bandage won't make ye whole, but it'll keep ye on yer feet long enough tae get somewhere that can." } },
      choices = {
        { text = "I'll learn it, and bandage others before myself.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll learn it to keep myself standing first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hunters get bitten more than most, an' bites fester, which is worse than any cut. A bear's claw's dirty an' a wolf's tooth's dirtier, an' I've had tae clean both out o' more hunters than I care tae count." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' I'll no' bandage yer {pet}, before ye ask; I'm a physician, no' an animal doctor, though I've been asked." },
      },
      choices = {
        { text = "I'll keep my wounds clean and come to you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Bites heal on their own, mostly. I'll manage.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because ye stand at the back throwin' fire an' forget the trolls can throw spears. Learn tae wrap a wound, an' ye'll live long enough tae get good at the rest." } },
      choices = {
        { text = "Then I'll learn properly and help the others too.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll learn it for myself. Others can look after themselves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Some o' ye do, an' I've patched up a few dwarves who came out o' a fight paler than they went in. A bandage costs ye nothin' but a strip o' cloth, an' it costs nobody else a thing." } },
      choices = {
        { text = "A bandage it is, Nissa. I'll leave your patients be.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Their life serves me better than it serves them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Resent ye? No, but I've seen too many soldiers die waitin' for a priest who was busy healin' somebody else. The Light, or Elune, or whatever ye pray tae, is a fine thing, but a bandage is always there, an' it doesnae get tired." } },
      choices = {
        { text = "Then we're both healers, Nissa. I'll learn the bandages too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer heals what bandages can't. My way is better.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Teach me first aid, then.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Protect them, every time, for I'd rather never see a wound than mend a hundred. But ye'll no' stop every blade, paladin, so learn the bandages, an' when ye can't protect them, at least ye can keep them breathin'." } },
      choices = {
        { text = "Protect the weak first. That's what a paladin is for.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Healing wins wars. A shield only buys time.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Teach me first aid, Nissa.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Because ye work alone, an' there's nobody comin' tae patch ye up when a job goes wrong in some dark corner. Learn tae wrap a wound tight an' quick, an' ye'll walk out o' places other folk get carried out of." },
      },
      choices = {
        { text = "Teach me, then. I'll learn it properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't get hit, Nissa.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll have the Light in yer hands, I suppose, but I'll still teach ye bandagin', for ye'll no' always have the strength tae use it." },
        { id = "h_default", key = true,
          text = "Nissa Firestone, physician. I teach bandagin' tae anyone wi' sense enough tae learn it, for ye'll no' always have a priest nearby when the trouble starts." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Nissa Firestone, physician, an' I see ye're one o' the Light's lot. Don't scoff at bandages, priest, for there'll come a day when ye've no prayer left an' a friend still bleedin'." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage wantin' tae learn bandagin'? Good, for ye'll be the first tae fall when the trolls charge." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'll teach ye, warlock, but I'll no' have ye drainin' my patients' life tae heal yerself." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Ye'll be bleedin' on my floor sooner or later, so ye might as well learn tae stop it yerself." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll want tae learn bandagin' for yer own sake, for yer beast mends quicker than ye do." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Yer kind heal wi' the green, I hear, an' I'll no' say no tae the help, so long as ye don't bleed on my floor." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. Ye'll bleed quiet, I expect, but ye'll still bleed, an' I'll thank ye tae do it somewhere other than my floor." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I've heard ye can close a wound wi' water an' a word. If that's true, I'll want tae watch ye do it, an' then I'll want tae know why." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've a patient upstairs." },
        { id = "h_again2", text = "Ask quickly, then." },
      },
      choices = {
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Why learn bandages when there are priests?", next = "why" },
        { text = "Who can teach me beyond what you know?", next = "beyond" },
        { text = "You must see a great many forge burns.", next = "wounds" },
        { text = "Why would mages fall first in a fight?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do warlocks really steal life to heal themselves?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Should a warrior learn bandaging, Nissa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters get hurt more than most, Nissa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you resent priests, Nissa, for doing your work with prayers?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is it better to heal the wounded or to protect them, Nissa?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is a druid's healing as good as a bandage, Nissa?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why should a rogue learn first aid, Nissa?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you want a shaman's healing beside your bandages, Nissa?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Nissa.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because priests get tired, an' priests get killed, an' some days there isnae one for a day's walk. A roll o' linen in yer pack never runs out o' mana." },
      },
      choices = {
        { text = "The Light provides, but it's wise to be ready.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'd trust linen over prayers any day.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },

    beyond = {
      lines = {
        { id = "be_default", text = "Once ye're past what I teach, ye'll want a book called Expert First Aid, sold by Deneb Walker at Stromgarde in the Arathi Highlands. After that, it's Doctor Gustaf VanHowzen in Theramore, who treats the wounded at the barracks there." },
      },
      choices = {
        { text = "Why go all the way to Theramore?", next = "beyond_theramore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beyond_theramore = {
      lines = {
        { id = "bt_default", text = "Because VanHowzen sees more wounded in a week than I see in a season, wi' Theramore holdin' the line in Dustwallow Marsh. He'll test ye on real soldiers, no' practice dummies, an' if ye pass, there's no better healer wi' a bandage in the Alliance." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    wounds = {
      lines = {
        { id = "wo_default", text = "Burns from the Great Forge, mostly, an' broken toes from dropped ingots. Then the mountaineers come in from Loch Modan wi' trogg bites, an' those are worse, for troggs don't wash." },
      },
      choices = {
        { text = "Do you ever treat anyone you shouldn't?", next = "wounds_who" },
        { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },
    wounds_who = {
      lines = {
        { id = "ww_default", text = "I treat whoever's bleedin', an' I ask their business afterwards. A guard once brought me a Dark Iron prisoner wi' a broken arm, an' I set it as well as I'd set the King's." },
      },
      choices = {
        { text = "That's right. A healer shouldn't take sides.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, learn = { "dark_iron" } } },
        { text = "I'd have left him for the guards.", next = "BACK", fx = { align = { order = 1 }, learn = { "dark_iron" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I patched up soldiers in the Second War, an' I've been patchin' up adventurers ever since. Adventurers are worse patients." } },
    advice = { { id = "tp_ad", text = "Bandage first, ask questions after. The wound won't wait for yer curiosity." } },
    scourge = { { id = "tp_scourge", text = "The plague wounds dinnae close right, an' they smell wrong, an' I've seen a few come through here from the north. Burn the bandages an' wash yer hands twice." } },
    holy_light = { { id = "tp_holy_light", text = "The priests mend with prayer an' I mend wi' linen, an' between us we lose fewer than we would alone. Dinnae tell Rohan I said that, for he'd be insufferable." } },
    second_war = { { id = "tp_second_war", text = "I learned my trade in the Second War, stitchin' soldiers who came back from the front wi' axe cuts I couldnae believe they'd survived. Most o' them did, an' I'm proud o' that." } },
    _none = { { id = "tp_none", text = "That's no' a wound, so it's no' my concern." } },
  },
}

-- Gimble Thistlefuzz: enchanting trainer in Thistlefuzz Arcanery; jumpy and suspicious; kin to Tilli.
P:NPC {
  key = "if_gimble", id = TODO_NPC("Gimble Thistlefuzz"), name = "Gimble Thistlefuzz",
  bible = "bibles/great_forge_crafts.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "anxious" }, values = { "curious", "careful" },
  notices = { "arcane" },

  impression = {
    first = "Gimble Thistlefuzz teaches enchanting upstairs in Thistlefuzz Arcanery and jumps at every footstep on the stairs. Once he decides a visitor isn't there to steal his formulas, he cannot stop talking about them.",
    third = "{name} met Gimble Thistlefuzz, a nervous gnome who teaches enchanting in Ironforge.",
  },

  greetings = {
    { id = "g_default", text = "Who's there? Oh, a customer, and you set off my door ward, which I calibrated myself to catch exactly that. You might have knocked, you know." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. I suppose you can come in, since my inventory still balances to the last strange dust from your last visit." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = { "MAGE", "WARLOCK" } },
      text = "You're humming with magic, aren't you? Please don't touch the rods on the shelf, for they're very sensitive and so am I." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not in the least, which is what makes it fascinating! I bind energy in by rule and rune, and you ask the elements nicely and they agree, apparently. If I could work out why they agree, I could probably sell it, but I suspect you'd object." } },
      choices = {
        { text = "I'd object. The elements aren't for sale, Gimble.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Work it out, and we'll split the profits.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Everything borrows from something, and enchanting borrows the magic already soaked into whatever you break down. I've never heard a tree complain about it, but then I've never asked one." } },
      choices = {
        { text = "Borrowed power should be used with care and gratitude.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Magic is a tool. Gratitude doesn't come into it.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Stronger, sharper, steadier, and on a good day it'll make the troggs think twice before they swing at you. I can't tell you how, of course, but I can tell you a well-enchanted axe is worth three plain ones in the Gol'Bolar Quarry." } },
      choices = {
        { text = "I trust my own arm more than any enchantment.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Enchant it, then. I'll take any edge I can get.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh yes, a good enchantment on your gloves or your bow will steady your aim better than a deep breath ever could. I'd tell you more, but I've already said too much, and you're looking at my notes." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} mustn't touch the enchanted rods, please, because the last beast that did glowed for a week." },
      },
      choices = {
        { text = "I'll keep my eyes off your notes, Gimble.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Too late. I've already memorised half of them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "To steal the formulas, of course, and I keep them in a book with three locks, two of which are traps. I'll teach you honestly if you ask honestly, but I'd thank you to keep your hands out of my book." } },
      choices = {
        { text = "I'll ask honestly, Gimble. Your formulas are safe from me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Three locks and two traps? That sounds like a challenge.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, I've wondered that myself, because enchanting is just binding power into things, and isn't that what a blessing does? I've tried enchanting a holy symbol once, and it worked very well, though the priest who owned it was very cross with me." } },
      choices = {
        { text = "Faith isn't a formula, Gimble. It can't be bound into things.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If a blessing can be bound into steel, that's worth learning.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Tell me about enchanting instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Stronger, yes, and sharper and brighter, if you like that sort of thing, which most paladins do. But a hammer is only as good as the arm that swings it, and I can't enchant your arm, though I've thought about it." } },
      choices = {
        { text = "A paladin's strength is in his oath. Enchantments are just extras.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every advantage is worth having. Enchant my hammer, then.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gimble.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Oh, good, you're not here to steal my formulas, are you? No, priests never steal formulas; they only bless them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Oh, you'll want your hammer enchanted, I suppose, and I can do that, as long as you promise not to tell anyone how I did it." },
        { id = "h_default", key = true,
          text = "Gimble Thistlefuzz, enchanter, and you've found the Arcanery, which most people don't, by design. I can teach you to bind magic into cloth and steel with proper runic precision, if you promise not to tell anyone how I do it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You're not here to learn enchanting, are you? Nobody sneaks into the Arcanery to learn enchanting, and I've a ward on the stairs that's never been wrong yet, well, hardly ever." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, you're not here to steal my formulas, are you? No, you'd be much quieter about it, I suppose." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You must have very good eyes, so please don't use them on my notes." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You're not here to steal my formulas, are you? No, of course not, your people are much too dignified for that." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Oh, splendid. Enchanting binds magic into things, and you seem to persuade things to do magic on their own. I'd love to compare notes." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, before someone else comes up the stairs and trips the ward again; the recalibration takes me an hour." },
        { id = "h_again2", text = "Go on, then, but close the door first, if you please, and all the way, because a door left a hair open bleeds arcane residue like a cracked steam pipe." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "You seem awfully nervous.", next = "nervous" },
        { text = "How does enchanting actually work?", next = "how" },
        { text = "Who's the gnome downstairs?", next = "tilli" },
        { text = "Why would anyone sneak into the Arcanery?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can enchanting make a warrior's blade stronger, Gimble?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can enchanting help a hunter's aim, Gimble?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Can enchanting and faith work together, Gimble?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would an enchanted hammer make a paladin stronger, Gimble?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does enchanting ever borrow its power from nature?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is a shaman's craft anything like enchanting, Gimble?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you in peace.", next = "END" },
      },
    },

    nervous = {
      lines = {
        { id = "ne_default", text = "I'm not nervous, I'm careful, which is different, and you'd be careful too if you'd lost everything once already. When Gnomeregan fell I left behind ten years of notes, four thousand pages in my own cipher, and I've no intention of losing the next ten." },
      },
      choices = {
        { text = "I'm sorry you lost so much.", next = "nervous_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nervous_lost = {
      lines = {
        { id = "nl_default", text = "Kind of you, I suppose, though it doesn't bring the notes back. I keep copies of everything now, three copies, in three places, and I'm not telling you where any of them are." },
      },
      choices = {
        { text = "Knowledge should be shared, not hidden.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Guarding your work is only sensible.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },

    how = {
      lines = {
        { id = "hw_default", text = "You take something that already holds magic, a wand or a ring or even a cloak, and you break it down into dust and essence; think of it as dismantling an engine for parts. Then you use a rod to put that magic back into something else, in a shape you choose, and that's the trick of it." },
      },
      choices = {
        { text = "So you destroy one thing to improve another.", next = "how_destroy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_destroy = {
      lines = {
        { id = "hd_default", text = "Exactly, and it's a shame sometimes, when a lovely old ring goes to dust. But the magic doesn't vanish, it only moves, and I'd rather it moved into a sword that's useful than sat in a ring nobody wears." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tilli = {
      lines = {
        { id = "ti_default", text = "That's Tilli, and she sells the rods and reagents, and she's family, so you can trust her, more or less. She knows more about my business than I'd like, which is the trouble with family." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I enchanted in Gnomeregan before the fall, three levels down from the Clean Room, and I enchant here now, upstairs, where I can hear people coming." } },
    advice = { { id = "tp_ad", text = "Never disenchant anything you might want back later. I turned my grandmother's brooch into dust once, and she still writes to remind me." } },
    dalaran = { { id = "tp_dalaran", text = "I studied in Dalaran once, for a season, and they nearly caught me reading a formula I wasn't supposed to have. Oh, you didn't hear that, and if anyone asks, I was in the library the whole time." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor guard their secrets like dragons guard gold, and they think a gnome can't be trusted with any of them. They're right, of course, but it's rude of them to say so." } },
    scourge = { { id = "tp_scourge", text = "Necromancy is enchanting gone wrong, just wrong in every possible direction, and I won't have it near my shop. Kel'Thuzad was a Dalaran mage once, you know, and it makes my skin crawl.", fx = { learn = { "kelthuzad" } } } },
    _none = { { id = "tp_none", text = "I don't know anything about that, and I'd rather not, frankly, because every new fact is one more thing somebody can steal." } },
  },
}
