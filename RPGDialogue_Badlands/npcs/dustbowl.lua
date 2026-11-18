-- Out in the Badlands: the dwarves' dig and a gnome's camp in the Dustbowl. Voice: bibles/badlands.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ryedol", id = TODO_NPC("Prospector Ryedol"), name = "Prospector Ryedol",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "explorers_league" }, temper = { "weary" }, values = { "loyal", "curious" },
  notices = { "race" },

  impression = {
    first = "Prospector Ryedol checked that I wasn't a troll, an ogre or a Dark Iron before anything else. He is worn through with worry for his partner Hammertoe and tries hard not to show it.",
    third = "{name} met Prospector Ryedol of the Explorers' League, whose partner Hammertoe went into the Badlands digsite and never came out.",
  },

  greetings = {
    { id = "g_hill", text = "Easy, easy! Ye're no' a troll or an ogre or a Dark Iron? Good, that's three things off my list." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' our own, out in this wasteland! Sit a moment, for I've not heard an Ironforge voice in weeks." },
  },

  start = "hello",
  nodes = {
    op_league = {
      lines = {
        { id = "opl_default", text = "There's folk in Ironforge who say we dig where we shouldnae, that the titans sealed their vaults for a reason. Hammertoe used tae laugh at them, an' now he's buried under one. So what say ye, friend?" },
      },
      choices = {
        { text = "Dig it all up. The past belongs to whoever finds it.", next = "op_league_dig", fx = { affinity = 1, align = { order = -1 }, opinion = { explorers_league = "admire" } } },
        { text = "Some vaults were sealed for a reason. Leave them be.", next = "op_league_seal", fx = { align = { order = 1 }, trait = { cautious = 1 }, opinion = { explorers_league = "distrust" } } },
        { text = "The League's looking for where we came from. That matters.", next = "op_league_dig", fx = { affinity = 2, opinion = { explorers_league = "respect", dwarves = "proud" } }, when = { race = "Dwarf" } },
        { text = "I'd ask Hammertoe, if I could.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    op_league_dig = {
      lines = {
        { id = "opld_default", text = "Aye, that's the League talkin', an' that's what Hammertoe would've said, rest his bones. I'll go back in, when I've the stomach, an' I'll bring out whatever he died lookin' for." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_league_seal = {
      lines = {
        { id = "opls_default", text = "Maybe ye're right, an' maybe that's the sense I should've had a month ago. Still, a dwarf who leaves a door shut is no' much of a dwarf, an' I'll go back in all the same." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_gnome = {
      big = true,
      lines = { { id = "xpt_gnome_default", text = "Always, but what it needs most is clever hands and quiet feet, because the troggs come up out of Uldaman whenever we make too much noise. A gnome or two with sense and a few fighters to keep the troggs off them would set the dig forward a month." } },
      choices = {
        { text = "Knowledge is worth the risk. The League should dig deeper.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some vaults were sealed for a reason. Leave them shut.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some o' the scholars would want tae write ye down in a book, an' some would call it orc magic an' spit. Me, I've a partner lost under the digsite, so if the stone's talkin', ask it where Hammertoe is." } },
      choices = {
        { text = "The stone is our birthright. Ironforge should learn to listen.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I keep the old ways first. The spirits only lend a hand.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "No' always, if the old ruins are anythin' tae go by, for nobody builds that grand in a desert. Somethin' dried it out long ago, an' the stones are the only ones left who remember what." } },
      choices = {
        { text = "Then dig it up and learn, Prospector.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the land keep its own secrets.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Maybe, if ye're quiet an' patient, for the troggs are stupid but they're no' deaf. Hammertoe went in loud, singin', I shouldnae wonder, an' I'd give a lot for him tae have had yer sense." } },
      choices = {
        { text = "Anything of Hammertoe's comes back to you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Finders keepers, Prospector. Whatever's down there is mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Discs an' keepers an' a vault o' stone older than Ironforge, an' I cannae make sense o' half of it. The Explorers' League would give their beards for a mage who could, an' maybe they'll get one, if ye're willin'." } },
      choices = {
        { text = "Some old vaults should stay sealed, Prospector.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Whatever's sealed in Uldaman, I want to see it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's leave Uldaman for now.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Aye, I would, though I think we both know what ye'd be prayin' for. He went intae that dig wi' his pick an' his notes, an' if the troggs got him, I'd like tae think the Light found him before they did." } },
      choices = {
        { text = "Grief like yours honors him. Don't bury it, Prospector.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mourn him later. His notes matter more right now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Troggs out o' the deep places, stone things that shouldnae move, an' Shadowforge dwarves pokin' about after the same relics we were. Ye're welcome tae take yer demon down there an' scare a few o' them, an' if it brings Hammertoe out alive, I'll stop glarin' at it." } },
      choices = {
        { text = "I'll keep my demon in check down there, Prospector.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll let it loose on the troggs and see what's left.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    xcl_ulda = {
      big = true,
      lines = { { id = "xcl_ulda_default", text = "Then ye walked the halls Hammertoe was so desperate tae see, an' ye saw the end o' them, which he never did. He'd have wanted every carvin' copied an' every door opened, an' I'd have told him tae slow down, an' he'd have ignored me, same as always." } },
      choices = {
        { text = "Hammertoe found the way. The League should honour his name.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "He chased old stones to his death, Ryedol. It wasn't worth it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What will you do now, Ryedol?", next = "xcl_ulda2" },
      },
    },
    xcl_ulda2 = {
      lines = { { id = "xcl_ulda2_default", text = "Finish the survey, send it tae Ironforge wi' his name on the top, an' then maybe dig somewhere quiet for a while. Somewhere wi' grass, I think, for I've had my fill o' dust." } },
      choices = {
        { text = "Grass sounds good. I hope you find some.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_gnome", tags = { "news" }, when = { party = { race = "Gnome" }, faction = "Alliance" },
          text = "Is that a gnome with you? Grand, because {companion} might be able to tell me what that blasted carved lock wants, and I've been staring at it for three days." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Shadowforge", min = 30 } }, text = "Word from the dig road is ye've been thinnin' out the Shadowforge, an' I'll drink tae that tonight, though no' too much, for Hammertoe's sake." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, is it? I'll no' pretend I like it, but there's worse than demons in Uldaman just now, an' Hammertoe's still down there somewhere." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Then say a word for Hammertoe, would ye, for I've said all the ones I know, an' the Light's no' answered me yet." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! If ye can make heads or tails o' Hammertoe's scribbles before ye take 'em tae Ironforge, I'd be glad tae hear it, for they read like a fever dream tae me." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue, aye? Then ye'll be lighter on yer feet than Hammertoe ever was, an' that might be what it takes tae get in an' out o' that dig alive." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, out here in the Badlands? There's nae a green thing for miles, friend, unless ye count the lichen on Hammertoe's old pack, an' I'd not count it." },
        { id = "h_cl_ulda", tags = { "news" }, when = { cleared = "Uldaman", faction = "Alliance" },
          text = "Ye went in where Hammertoe went, an' ye went all the way down an' came back out. I keep tellin' myself that's somethin' like justice, an' some days I almost believe it." },
        { id = "h_default", key = true,
          text = "Prospector Ryedol, Explorers' League. We came out here tae dig for the past, an' the past dug back; my partner, Hammertoe, went into the digsite an' didn't come out." },
        { id = "h_listener", when = { origin = "dwarf_stone_listener" },
          text = "Ye're one o' those who hears the stone, aren't ye? Hammertoe used tae say the rock out here hummed under his boots near the old gates, an' I laughed at him, so if it's sayin' anythin' tae you, I'll no' laugh twice." },
        { id = "h_tools", tags = { "news" }, when = { questActive = TODO_QUEST("A Dwarf and His Tools") },
          text = "I left my pack behind when we ran, an' every tool I own's in it. A prospector without his tools is just a dwarf standin' in the dirt." },
        { id = "h_hope", when = { any = { { questActive = TODO_QUEST("A Sign of Hope") }, { questActive = TODO_QUEST("Prospect of Faith") } } },
          text = "These are Hammertoe's notes; he found somethin' before the end, an' he thought it was Uldaman. Take them tae Ironforge, where somebody will know what they mean." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, is it? The League's scholars say our forefathers were shaped from the stone, so maybe it's no wonder some of us hear it talk back." },
      },
      again = { { id = "h_again", text = "Aye? I'm listenin', for there's not much else tae do out here but listen an' dig." } },
      choices = {
        { text = "Was this land always so barren, Prospector?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What were you digging for out here?", next = "uldaman" },
        { text = "Tell me about Hammertoe.", next = "hammertoe" },
        { text = "Something chased you out of that dig in a hurry.", next = "chased" },
        { text = "I'm with the League too.", next = "league", when = { origin = "dwarf_explorers_league" } },
        { text = "I'll go in after Hammertoe. I'm a fighter.", next = "k_fighter", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "Could I slip into the dig unseen?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Hammertoe's writing seems to trouble you, Prospector.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you like me to pray for Hammertoe, Prospector?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What's in Uldaman that's worse than demons, Prospector?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the League make anything of a dwarf who hears the stone?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I went down into Uldaman, Ryedol, to the very bottom.", next = "xcl_ulda", when = { cleared = "Uldaman", faction = "Alliance" } },
        { text = "The League looks like it could use help at the dig.", next = "xpt_gnome", when = { party = { race = "Gnome" }, faction = "Alliance" } },
        { text = "The League sent me into Uldaman as its priest, Prospector.", next = "xorig_chaplain", when = { origin = "dwarf_league_chaplain" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2 } },
      },
    },
    xorig_chaplain = {
      lines = {
        { id = "xochaplain_default", text = "Did they, now? Then ye've seen those halls, an' the faces carved on the walls that are no' dwarven an' no' anythin' else I can name. Hammertoe used tae say ye could feel the Light down there, older than Ironforge itself. Do ye think he was right?" },
      },
      choices = {
        { text = "I think so. The Light was there before us.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I think the stones only echo our own prayers.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    uldaman = {
      lines = {
        { id = "u_default", text = "Uldaman, an' it's old, older than Ironforge, a vault the titans may have built, if ye believe the scholars. Hammertoe believed, an' look where it got him." },
      },
      choices = {
        { text = "Should vaults like that be opened at all?", next = "op_league" },
        { text = "I'm sorry about your partner.", next = "BACK", fx = { affinity = 3, learn = { "uldaman" } } },
        { text = "Is it worth it?", next = "uldaman_worth" },
      },
    },
    uldaman_worth = {
      lines = { { id = "uw_default", text = "Ask me when I've buried him properly. Then ask me again a year after. I'll have two different answers an' mean both." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } } },
    },
    hammertoe = {
      lines = { { id = "h2_default", text = "Best digger I ever knew, an' the worst cook. He'd talk tae the rock like it was listenin', an' some days I think it was." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    chased = {
      lines = { { id = "c_default", text = "Troggs, out o' the deep places, more than we'd ever seen, an' things made o' stone that shouldnae move. We ran, but Hammertoe didnae run fast enough." } },
      choices = {
        { text = "You blame yourself for it, don't you?", tag = "Persuade", next = "chased_blame",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { origin = "dwarf_explorers_league" } } } },
          fail = { next = "chased_dig", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    league = {
      lines = { { id = "l_default", text = "Are ye now! Then ye know we don't leave our own in the dirt. When ye go in, bring back somethin' o' his, anythin' at all, a pick or a page." } },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "If it's that dangerous, I'll leave the dead where they lie.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    chased_blame = {
      lines = {
        { id = "cb_default", text = "Aye, I do, an' I've no' said it aloud till now. I never looked back, no' once, all the way out o' that digsite, an' I've told maself a hundred times there was nothin' tae see, but a dwarf who doesnae look back can tell himself anythin'." },
      },
      choices = {
        { text = "Looking back would have killed you too.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then bring something of his home.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    chased_dig = {
      lines = {
        { id = "cd_default", text = "What I do or don't blame maself for is between me an' Hammertoe. Now, are ye here tae dig or tae preach?" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_fighter = {
      lines = {
        { id = "xfi_default", text = "Then go in wi' yer eyes open, for there's Dark Iron an' troggs both in that dig, an' they've decided they like it better than we did. Hammertoe went in wi' a pick an' a lantern, an' I'd sooner ye went in wi' more." },
        { id = "xfi_hunter", when = { class = "HUNTER" },
          text = "Then take yer beast an' let it go first, for it'll smell the troggs before ye see them. Hammertoe went in wi' a pick an' a lantern, an' look what that got him." },
      },
      choices = {
        { text = "I'll bring him out, or what's left.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Why didn't you go in after him?", next = "chased" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've spent a good while diggin' out here, an' a dwarf learns a thing or two between shovelfuls. Ask me about any o' these." },
    },
    background = { { id = "tp_ba", text = "Ironforge born, Explorers' League sworn, an' now a dwarf in the Badlands without his partner.", next = "hammertoe" } },
    advice = { { id = "tp_ad", text = "Mark yer way in, so ye can find yer way out. Hammertoe never did." } },
    uldaman = { { id = "tp_uldaman", text = "If the League's right, the answer tae where we dwarves came from is under these hills, an' that's worth a few bruises. Maybe it's no' worth Hammertoe." } },
    magni = {
      { id = "tp_magni", text = "King Magni sent the League out to find our people's past, an' some days I think he'd rather we found it than kept findin' our own graves. I'd like to bring him somethin' worth the cost." },
      { id = "tp_magni2", when = { race = "Dwarf" }, text = "Ye've got the mountain in yer voice, friend, so ye'll know what it means when the king takes an interest. Magni wants Uldaman's secrets, an' I mean to give them to him." },
    },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are sniffin' round the dig sites, an' I don't like it. Whatever they want in the Badlands, it's no' for the good o' Ironforge." } },
    troggs = { { id = "tp_troggs", text = "The troggs came up out o' Uldaman like water out o' a broken pipe. They're stupid an' strong an' there's no end to them." } },
    _none = { { id = "tp_none", text = "Couldnae say; I'm a digger, no' a sage." } },
  },
}

P:NPC {
  key = "lotwil", id = TODO_NPC("Lotwil Veriatus"), name = "Lotwil Veriatus",
  bible = "bibles/badlands.md", role = "scholar", tier = "quest",
  communities = { "badlands_camp" }, temper = { "distracted" }, values = { "curious", "inventive" },
  notices = { "race", "class" },

  impression = {
    first = "Lotwil Veriatus warned me off anything glowing, humming or warm, which ruled out most of his camp. He is delighted by rock elementals in a way I'll never fully understand.",
    third = "{name} met Lotwil Veriatus, an absent-minded gnomish scholar who studies the elements in the Dustbowl.",
  },

  greetings = {
    { id = "g_op_league", when = { opinion = { topic = "explorers_league", stance = "distrust" } }, text = "I heard you think some old vaults are best left shut! Nonsense, friend; nothing is ever best left shut, though I say that as someone missing two eyebrows." },
    { id = "g_camp", text = "Hm? Oh, a visitor! Mind Servo, he's harmless, roughly ninety percent of the time, and don't touch anything glowing, or humming, or warm." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, out here in all this rock! We should compare notes, if you have notes; I have a great many notes." },
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Oh, the Horde, wonderful! Knowledge has no banner, you know, or it shouldn't, so come in, come in." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! You talk to the elements and I take them apart, so we should be friends." },
  },

  start = "hello",
  nodes = {
    op_elements = {
      lines = {
        { id = "ope_default", text = "Cruel to a rock? The shamans do say so, very loudly, and one of them threw a sandal at Lucien once. I've never had an elemental complain, but I'd like an outside opinion: is it cruel?" },
      },
      choices = {
        { text = "Elementals aren't toys. Let them go.", next = "op_el_free", fx = { affinity = -1, align = { light = 1 }, opinion = { the_elements = "respect" } } },
        { text = "A rock is a rock. Bind it and learn something.", next = "op_el_bind", fx = { affinity = 1, align = { light = -1 }, opinion = { the_elements = "useful" } } },
        { text = "The spirits remember every chain, Lotwil.", next = "op_el_free", fx = { affinity = -1, opinion = { the_elements = "respect" } }, when = { class = "SHAMAN" } },
        { text = "I'll leave that to you and the shamans.", next = "BACK" },
      },
    },
    op_el_free = {
      lines = {
        { id = "opef_default", text = "Let them go? But they'd only go back to being rocks with opinions! I'll consider it, I promise, right after this experiment, and maybe the one after that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_el_bind = {
      lines = {
        { id = "opeb_default", text = "Exactly what I said to the sandal-thrower! Knowledge doesn't come from asking politely, it comes from shackles, measurements and a very good pair of goggles." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Someone has to stand near the rock elementals while I take readings, and they agitate rather easily. The last time I tried it myself I spent an afternoon flattened under a boulder, and the readings were dreadful." } },
      choices = {
        { text = "I'll stand guard, but only if you follow safe procedure.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget procedure. I'll smash them and you can measure the pieces.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Lotwil.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "My working theory is that the beasts can hear the elementals grinding inside the rock long before we can. My other theory is that the beasts are simply cleverer than my assistants, which would also explain a great deal." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Would {pet} let me put a little listening device near its ear? It's quite harmless, and it's only exploded twice, neither time near an ear." },
      },
      choices = {
        { text = "Leave my beast out of your experiments, Lotwil.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If it helps the Assembly, my beast can wear your device.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Lotwil.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Suffer is a strong word for something made of granite, though I'll admit they do get rather cross. Science needs a few cross elementals, I'm afraid, and the Badlands have plenty to spare." } },
      choices = {
        { text = "Bind them without cruelty, or not at all.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A few cross elementals are a fair price for knowledge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "You'd be amazed, because a bound elemental core sells for a fortune in Gadgetzan, and Lucien caught a goblin sniffing round the sample tray just last week. I've started labelling everything 'explosive', which is only partly true." } },
      choices = {
        { text = "Guard them well, then. Science deserves protecting.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sell them yourself, and don't let the goblins take a cut.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk science instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That's precisely what I'd like to know! The elementals answer to the elements and nothing else as far as I can tell, so if the Light rattles them at all, it would mean the Light reaches places the Kirin Tor swears it can't, and probably nothing is exactly where the best discoveries start." } },
      choices = {
        { text = "The Light isn't a test subject, Lotwil.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fine. I'll stand by your rock and see what happens.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xpriest_default", text = "I don't know, and it's driving me to distraction, because I've written down every reaction it has and prayer is the only thing that makes it grind its teeth, if it has teeth. My guess is that anything with a will of its own unsettles it, since it's had nothing but rock and my shackles for company." } },
      choices = {
        { text = "Keep it bound, Lotwil. Rock that thinks is dangerous.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Perhaps it simply wants to be free, Lotwil.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_ulda = {
      big = true,
      lines = { { id = "xcl_ulda_default", text = "Then you've seen the old stone servants walk without any elemental I could name inside them, which is maddening! My rock elementals are bound by force and they resent every moment of it, but whatever moves Archaedas was made to serve, and gladly, as far as anyone can tell." } },
      choices = {
        { text = "Binding a creature against its will is cruelty, Lotwil.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They're rocks, Lotwil. Bind as many as you like.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Could you build something like Archaedas?", next = "xcl_ulda2" },
      },
    },
    xcl_ulda2 = {
      lines = { { id = "xcl_ulda2_default", text = "Not in this century, and Lucien would resign if I tried. The titans worked from an understanding I can only guess at from the scraps they left, and guessing is how one ends up with a smouldering assistant." } },
      choices = {
        { text = "Then do try to keep Lucien from smouldering.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Rock", min = 30 } }, text = "You've been breaking rather a lot of rock elementals out there, I hear, which is terribly wasteful, though I don't suppose you kept any of the pieces for me?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I'd be awfully grateful if you didn't pray at the elemental, because whatever it is you pray to, it doesn't seem to approve." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Do keep your voice down near the shackles, please, because the elemental doesn't care for chanting, and the last time someone prayed nearby it cracked a shackle clean through." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Oh, splendid, do stand by the elemental there, because I've always wondered whether holy light makes a rock elemental flinch, and nobody has ever volunteered." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Oh! I didn't hear you come in, which is either very impressive or very worrying. You're not after my samples, are you?" },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Splendid, a fellow practitioner of the natural sciences, though you'd call them something prettier, I expect. Tell me, can you feel the elementals in these rocks the way I measure them?" },
        { id = "h_cl_ulda", tags = { "news" }, when = { cleared = "Uldaman" },
          text = "I'm told you've been to the very bottom of Uldaman and survived the stone keepers! I've a dozen questions about how they move, and Lucien says I'm only allowed to ask you three." },
        { id = "h_default", key = true,
          text = "Lotwil Veriatus, late of Gnomeregan and founding member of the Enlightened Assembly of Arcanology, Alchemy and Engineering Sciences, and that's the short name. I study the elements, rock mostly, since there are several million tons of it here and none of it is radioactive, which after home is a pleasant change." },
        { id = "h_rock", tags = { "news" }, when = { questActive = TODO_QUEST("Study of the Elements: Rock") },
          text = "Rock elementals! They wander the Dustbowl like they own it, and perhaps they do. Bring me what's left of a few, would you, for science?" },
        { id = "h_hard", when = { questActive = TODO_QUEST("This Is Going to Be Hard") },
          text = "This is going to be hard, and that's not a warning, that's my working title. Lucien thinks it's funny; Lucien's my assistant." },
        { id = "h_machines", when = { questActive = TODO_QUEST("The Rise of the Machines") },
          text = "The Hierophant sent you about golems? Oh, I've wanted to see a Dark Iron golem up close for years, though ideally not too close." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "Ah, a warrior! You'd make a splendid control for my experiments, being so very solid, and the elementals only hit hard when they're agitated." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You must have noticed that the beasts out here avoid the elementals, which is a fascinating behaviour I haven't been able to explain." },
        { id = "h_texts", when = { origin = "gnome_forbidden_texts" },
          text = "Oh! You're the one who reads the books with the clasps on, aren't you? Word gets round the Assembly, you know. I'm all for every discipline sitting at the same table, but I do wish yours didn't keep bringing guests that set the tablecloth on fire." },
      },
      again = { { id = "h_again", text = "More? Wonderful, every question is a data point, but do mind the sample tray." } },
      choices = {
        { text = "Do the elementals suffer under your experiments?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's the Assembly?", next = "assembly" },
        { text = "Lucien seems to keep a close eye on you.", next = "lucien" },
        { text = "Why rock?", next = "rock" },
        { text = "Engineer to engineer: what are you building?", next = "engineer", when = { profession = "Engineering" } },
        { text = "I study magic too, Lotwil.", next = "k_mage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "The elements speak to me. You only measure them.", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "What would a thief want with rock elemental samples?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What do you need a warrior for, Lotwil?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "The beasts round here keep well clear of your elementals.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why would holy light make a rock elemental flinch, Lotwil?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your elemental doesn't seem to care for prayer, Lotwil.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "I've been to the bottom of Uldaman, Lotwil.", next = "xcl_ulda", when = { cleared = "Uldaman" } },
        { text = "I apprenticed to a tinker. Three explosions and one workshop fire.", next = "xorig_appr", when = { origin = "gnome_tinker_apprentice" } },
        { text = "For science.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } },
      },
    },
    xorig_appr = {
      lines = {
        { id = "xap_default", text = "Only three? Oh, you're well ahead of where I was, because I'd set fire to two workshops before anyone let me near a third. Did your master write down what went wrong each time? That's the whole secret, you know, because an explosion you've written down is an experiment, and one you haven't is just noise." },
      },
      choices = {
        { text = "Every time, in great detail.", next = "xorig_appr2", fx = { trait = { curious = 1 }, affinity = 1 } },
        { text = "We mostly just put the fires out.", next = "xorig_appr2", fx = { trait = { witty = 1 } } },
      },
    },
    xorig_appr2 = {
      lines = {
        { id = "xap2_default", text = "Then start a notebook today, and number the explosions, because you'll want to compare them later! Lucien keeps mine, and he says it's the most frightening book in the Badlands, which I take as a professional compliment." },
      },
      choices = {
        { text = "I'll start one tonight.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Lotwil.", next = "BACK" },
      },
    },
    assembly = {
      big = true,
      lines = {
        { id = "a_default", text = "A school, or the beginning of one! Arcane, alchemy, engineering: it's all one study, really, if you squint, and one day every thinking people in Azeroth could learn side by side, gnomes, dwarves, orcs and trolls. Why not? The rocks don't care who studies them." },
      },
      choices = {
        { text = "That's a big dream.", next = "BACK", fx = { affinity = 3 } },
        { text = "Orcs and gnomes, side by side? Never.", next = "assembly_never", fx = { trait = { skeptical = 1 } } },
        { text = "I've heard great things about the Assembly's members.", tag = "Deceive", next = "assembly_members",
          check = { pass = { any = { { disposition = { min = 55 } }, { trait = "witty" }, { race = "Gnome" } } } },
          fail = { next = "assembly_caught", fx = { affinity = -1 } } },
      },
    },
    assembly_never = {
      lines = { { id = "an_default", text = "Never is just a deadline nobody's met yet! I've seen a dwarf and a goblin share a cart, so anything's possible." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },
    lucien = {
      lines = { { id = "l_default", text = "He's my assistant, patient and practical, and convinced I'll explode one day. He's not wrong to be convinced, statistically speaking; he's just early." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rock = {
      lines = { { id = "r_default", text = "Because it's honest! Fire lies about how hot it is, water won't hold still and air's never where you left it, but rock just sits there being exactly what it is." } },
      choices = {
        { text = "The shamans say binding elementals is cruel. Is it?", next = "op_elements" },
        { text = "Something else.", next = "BACK" },
      },
    },
    engineer = {
      lines = { { id = "e_default", text = "It's a device to read what an elemental was thinking when it fell apart, and it doesn't work yet, though the third prototype only smoked a little. When it does work, it'll be the most interesting failure since Gnomeregan, and I mean that kindly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    assembly_members = {
      lines = {
        { id = "am_default", text = "Have you really? How wonderful, and how strange, because between you and me, the Assembly has two members at present, and one of them is Lucien. He says that makes me a founding member of a very small club, and he's not wrong, but every great school started with someone talking to rocks." },
      },
      choices = {
        { text = "Then put my name down as a friend.", next = "BACK", fx = { affinity = 2 } },
        { text = "Two members is still a school.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    assembly_caught = {
      lines = {
        { id = "ac_default", text = "Great things? From whom, I wonder, since the only people who've heard of us are Lucien and Servo. That's very kind of you, but you needn't flatter a gnome to get a straight answer." },
      },
      choices = { { text = "Fair. Something else.", next = "BACK" } },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "Do you! Then you'll appreciate that my method is to bind an elemental in shackles of my own design and examine it, which the Kirin Tor considers terribly reckless. Would you like to see the shackles? They're mostly rock." },
        { id = "xmg_lock", when = { class = "WARLOCK" },
          text = "Do you! Well, binding is binding, whether it's a demon or a lump of animate rock, and I suspect we'd argue about it for hours. My shackles are sturdier than any circle you'll draw, I'll wager." },
      },
      choices = {
        { text = "Binding things is how we learn them.", next = "BACK", fx = { align = { order = 1 }, trait = { curious = 1 } } },
        { text = "Binding things is how they get angry.", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_shaman = {
      big = true,
      lines = {
        { id = "xsh_default", text = "Measure them is precisely what I do, and they've never once complained to me. Though you're the third shaman this month to look at my shackles as if I'd chained a puppy, so I'll ask: what does it say?" },
        { id = "xsh_dwarf", when = { race = "Dwarf" },
          text = "A dwarf shaman, at my camp! I'd heard of such a thing and assumed it was a misprint. You look at my shackles as if I'd chained a puppy, so do tell me what it says." },
      },
      choices = {
        { text = "It says let it go.", next = "BACK", fx = { align = { order = -1 }, affinity = -2 } },
        { text = "It's angry, but it will learn its place.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "What happens if it breaks free?", next = "k_shaman_free" },
      },
    },
    k_shaman_free = {
      lines = {
        { id = "xshf_default", text = "Then it goes back to being a rock with opinions, and I go back to my notes with a singed sleeve. I've a theory about why they get loose, which I'll publish when the Assembly reconvenes." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I know a great many things, and some of them are even about rocks! Ask me about any of these, and mind the sample tray." },
    },
    background = { { id = "tp_ba", text = "A scholar with too many subjects and one very patient assistant. The Assembly is the rest of my life's work, once it exists.", next = "assembly" } },
    advice = { { id = "tp_ad", text = "Never assume a rock is just a rock, because out here about one in fifty, or two percent by my last count, is an elemental having a nap." } },
    uldaman = { { id = "tp_uldaman", text = "Uldaman is a wonder, a titan vault with stone guardians that still answer to old commands. I'd give anything to understand how they're made." } },
    the_elements = { { id = "tp_the_elements", text = "The elementals of the Badlands are fascinating, made of stone and bound by forces I can only guess at. I'd like to bind one myself, very carefully, of course." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's scholars would laugh at my Assembly, I suspect, and then they'd steal the plans. I'll keep my work in the desert, where only the vultures can read it." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor never quite approved of my research, and I never quite asked them to. We've reached an understanding." } },
    _none = { { id = "tp_none", text = "Fascinating! I know nothing about it, so tell me everything." } },
  },
}
