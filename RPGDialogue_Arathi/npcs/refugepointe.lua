-- Refuge Pointe (Alliance): Skuerto, Apprentice Kryten, Cedrik Prose, Vikki Lonsav. Voice: bibles/arathi.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "skuerto", id = TODO_NPC("Skuerto"), name = "Skuerto",
  bible = "bibles/arathi.md", role = "questgiver", tier = "quest",
  communities = { "refuge_pointe" }, temper = { "prickly" }, values = { "proud", "practical" },
  notices = { "race", "class" },

  impression = {
    first = "Skuerto is a dwarf scout working for Archmage Malin, and he was rude to me before I'd finished saying hello. He apologized later, which I gather is rare.",
    third = "{name} met Skuerto, a touchy dwarf scout at Refuge Pointe recovering Archmage Trelane's artifacts for Archmage Malin.",
  },

  greetings = {
    { id = "g_default", text = "Aye, what? I'm busy, an' if Malin sent ye, ye can still wait yer turn." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. I was rough wi' ye last time, an' I'll own it, so let's start again." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' mine, from the mountain! Good, then ye'll know a proper scout when ye see one, which is more than these humans do." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, is it? Then ye'll be more use to Kryten than to me, but stick around, for Trelane's things need someone who knows which end o' a wand to point." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Bother's no' the word, but it's strange, I'll grant ye, for I grew up on stone the priests said the Titans shaped, an' nobody ever told me it talked. Still, if the earth here'll tell ye where the Witherbark set their ambushes, I'll stop sayin' it's strange an' start sayin' it's useful." } },
      choices = {
        { text = "Ironforge's old ways still matter. I honour both.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The priests were wrong. The earth was always alive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Skuerto.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, once the scoutin's over an' the Witherbark have spotted us, which they do sooner or later. Then I want a {g:lad|lass} wi' a shield between me an' their axes while Kryten reads whatever we came for." } },
      choices = {
        { text = "Then I'll guard you both. A shield's no good unused.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll guard you, but the scouting's your problem, dwarf.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Skuerto.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Mages o' old Arathor, so Kryten tells me, an' they did it tae guard somethin' best left buried. Now the Syndicate an' the ogres go pokin' at the stones, an' the bindin's are frayin'." } },
      choices = {
        { text = "Then the bindings must hold, whatever they guard.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Spirits shouldn't be chained, whoever forged the chains.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "No' enough, for plenty o' good soldiers died in these hills when Stromgarde fell, an' most o' them never got their proper words. If ye've a prayer tae spare while ye're out there, I'd no' call it wasted, an' I'm no' a man who says that lightly." } },
      choices = {
        { text = "Then I'll say the words. Every soldier deserves them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead are past caring. The living need the help.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Skuerto.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Quick an' loud, if ye're askin' me, because Kor'gresh has been throwin' ice at his own kin an' I'd as soon he didnae learn any more o' the trick. Malin would have it done quietly, but Malin's in Stormwind an' I'm here." } },
      choices = {
        { text = "I'll face him in the open and take it fairly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better to catch him sleeping. Less risk to the wand.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, an' from the mountain by the look o' ye! I've heard the Wildhammer do this sort o' thing, {class}, but an Ironforge dwarf callin' the wind would've made me mother faint." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, is it? Well, ye'll be less trouble than most, an' if a Witherbark arrow finds me while I'm scoutin', I'd as soon it was you that pulled it out." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Aye, now that's a face I can work wi', because the Boulderfist won't give up Trelane's wand for a polite word, an' Kryten's no' much use wi' anythin' heavier than a quill." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A night elf druid! Ye'll be wantin' a look at the old stone circles in the hills, I expect, though I'll warn ye the things bound in them havenae taken kindly tae visitors." },
        { id = "h_default", key = true,
          text = "Skuerto. Archmage Malin sent me an' the lad Kryten up here tae recover what his old master Trelane left behind when Stromgarde fell. I do the scoutin', Kryten does the readin', an' neither of us gets enough sleep." },
        { id = "h_malin", tags = { "news" }, when = { questRecent = { TODO_QUEST("Malin's Request"), days = 2 } },
          text = "Malin's letter, is it? Grand, but I'm in the middle o' somethin', so go an' bother Kryten, an' I'll come find ye when I'm done." },
        { id = "h_wand", when = { questActive = TODO_QUEST("Wand over Fist") },
          text = "Kor'gresh has Trelane's wand in Boulderfist Hall, south an' then east o' Thandol Span. He's been throwin' ice at his own kin wi' it, so he's close tae workin' the whole thing out." },
        { id = "h_defenses", when = { questActive = TODO_QUEST("Trelane's Defenses") },
          text = "The Boulderfist shaman took the tower's gems, an' we need one tae wake its defenses. Get one o' those agates tae Kryten, an' he'll turn it into a key." },
        { id = "h_tower", tags = { "news" }, when = { questActive = TODO_QUEST("Attack on the Tower") },
          text = "Phylactery, orb an' the ember agate, all in chests in the Tower of Arathor. The defenses'll help, but they'll no' do the fightin' for ye, so keep yer weapon out." },
        { id = "h_tower_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Attack on the Tower"), days = 3 } },
          text = "Every piece on my list, in one bag, an' nobody dead. I've scouted for a lot o' wizards, an' that's never happened before." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye've a smell about ye like a forge fire gone wrong, {class}, an' I'd ask ye kindly tae keep it away from the lad, for he's impressionable." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "Another mage! Kryten's enough for one camp, {class}, an' he talks about Archmage Malin like the fellow walks on water." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, an' a loud one by the clank o' ye. If ye're comin' scoutin' wi' me, ye'll walk behind an' breathe through yer nose, or ye'll no come at all." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, I've maps tae draw." },
        { id = "h_again2", text = "Still here? Go on, then." },
      },
      choices = {
        { text = "Who bound the elementals in those stone circles?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who was Trelane?", next = "trelane" },
        { text = "What's in the tower?", next = "tower" },
        { text = "Why are you so prickly?", next = "prickly" },
        { text = "Where did you learn to scout?", next = "scouting" },
        { text = "I'd scout quieter than you, dwarf.", next = "rogue", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "I could carry word to Malin in Stormwind.", next = "priest", when = { race = "Human" } },
        { text = "Do the Witherbark have warlocks of their own?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What did Trelane leave behind, Skuerto?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does anyone pray for the fallen of Stromgarde, Skuerto?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How do you want Kor'gresh's wand taken back?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could a warrior be any use to a scout, Skuerto?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does a dwarf shaman bother you, Skuerto?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Off I go.", next = "END" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Books, mostly, an' a tower full o' wards that Malin wants back before the Witherbark or the Syndicate work out what they're worth. I scout an' the lad reads, so if ye can do both, ye'd save me a deal o' walkin'." } },
      choices = {
        { text = "Knowledge like that belongs in safe hands.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Books belong to whoever finds them first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk of something else, Skuerto.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They've shadow hunters an' witch doctors, an' that's dark enough for anyone, though I'd no call it fel. Whatever ye carry, keep it pointed at them an' no at Kryten, for Malin would have my beard if anythin' happened tae him." } },
      choices = {
        { text = "I'll keep him safe. You have my word.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The lad will have to see real power sometime.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of other things.", next = "BACK" },
      },
    },
    trelane = {
      lines = { { id = "t_default", text = "Malin's old master, an archmage o' Stromgarde. When the city came under siege he held the Tower of Arathor as long as he could, an' it wasnae long enough." } },
      choices = {
        { text = "What did he leave behind?", next = "tower" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tower = {
      big = true,
      lines = { { id = "to_default", text = "A wand, a phylactery, an orb an' an ember agate, an' the Boulderfist have their hands on most of it. Ogres wi' an archmage's toys is a thing nobody wants, least of all the ogres' neighbours." } },
      choices = {
        { text = "What does Malin want with them?", next = "tower_malin" },
        { text = "Better in Malin's hands than an ogre's.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Better smashed. No one should have that kind of power.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    tower_malin = {
      lines = { { id = "tm_default", text = "He says study, an' safekeepin'. I'm a scout, no' a philosopher; I find things, I bring them back, an' I try no' tae wonder what wizards do wi' them at night." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    prickly = {
      lines = { { id = "p_default", text = "Because every human in this camp thinks a dwarf's only good for diggin', an' every one o' them asks if I've scouted the tower yet. I'll scout it when it's ready tae be scouted." } },
      choices = {
        { text = "Fair. Your scouting's been sound.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouting = {
      lines = { { id = "sc_default", text = "In the hills round Ironforge, as a lad, trackin' troggs an' worse. A good scout comes home, an' I've come home every time, whatever Kryten says." } },
      choices = {
        { text = "What does Kryten say?", next = "scouting_kryten" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouting_kryten = {
      lines = { { id = "sk_default", text = "That I'm 'in the middle o' somethin'' an' that I 'mean well'. The lad's polite about me tae strangers, which is worse than if he just complained." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    rogue = {
      lines = { { id = "r_default", text = "Quieter, maybe; better, no. But aye, if ye can get past the ogres at the tower door wi'out wakin' them, I'll buy ye an ale an' say it in front o' Kryten." } },
      choices = { { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = { { id = "pr_default", text = "Would ye? Then put in a word wi' him for me, for I've no' had a letter in a month, an' I'm runnin' out o' patience along wi' everythin' else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the Highlands an' where the ogres sleep. Ask about those." } },
    background = { { id = "tp_bg", text = "A scout from Ironforge, workin' for a Stormwind wizard on a Stromgarde problem. Makes sense if ye don't think about it.", next = "scouting" } },
    advice = { { id = "tp_ad", text = "Never walk into Stromgarde wi'out knowin' how ye'll walk out. I always know." } },
    _none = { { id = "tp_none", text = "No idea, an' I'm busy. Ask the lad." } },
  },
}

P:NPC {
  key = "kryten", id = TODO_NPC("Apprentice Kryten"), name = "Apprentice Kryten",
  bible = "bibles/arathi.md", role = "scholar", tier = "quest",
  communities = { "refuge_pointe" }, temper = { "earnest" }, values = { "curious", "polite" },
  notices = { "class", "race" },

  impression = {
    first = "Apprentice Kryten is Archmage Malin's polite young apprentice, keeping notes in a journal while his dwarf companion scouts. He apologized for Skuerto before I'd even met him.",
    third = "{name} met Apprentice Kryten, Archmage Malin's apprentice at Refuge Pointe, who studies Witherbark reagents and enchants Trelane's keys.",
  },

  greetings = {
    { id = "g_default", text = "Oh, hello! If Skuerto barked at you on the way in, I do apologize; he's in the middle of something, as usual." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, good, you're back! I've filled three more pages since you left." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Another student of the arcane! Were you trained in Stormwind? Perhaps you know my master, Archmage Malin." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! I'd love to hear how your people would enchant an agate, if you've a moment; mine is, well, rather by the book." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The tower's defenses, mostly, for when I read Trelane's notes on them, the bindings sound almost like bargains. If Archmage Malin is right, they're tools, but if you're right, they're something that agreed to help, and I can't decide which frightens me more." } },
      choices = {
        { text = "Malin's right. Bindings keep power in proper hands.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They're bargains, Kryten. Keep yours, or the elements won't.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Sometimes, when the Witherbark are howling and my best spell is still halfway through its first syllable. Archmage Malin says a mage who needs a sword has already made a mistake, but I don't think he's ever been chased through a troll village." } },
      choices = {
        { text = "Your master's right. Master your own discipline first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your master's wrong. Learn whatever keeps you alive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kryten.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the raptors hunt in threes, the striders kick, and the Witherbark ride none of them, which surprised me. I'd love to know whether the trolls ever tamed anything here, so if you find a fetish shaped like a beast, I'd be terribly grateful." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, may I draw {pet}? I promise I'll be quick, and I'll get the ears right this time, because Skuerto says my last drawing of a wolf looked like a cushion." },
      },
      choices = {
        { text = "Beasts deserve study, not just slaughter. Keep writing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A dead raptor teaches enough. Skip the drawings.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Is it true your magic draws nothing from the arcane at all? Archmage Malin says all power comes from somewhere, and I can't decide whether yours comes from the trees or from you." } },
      choices = {
        { text = "Magic should be studied and governed, as yours is.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Nature isn't something to be studied from a tower.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Oh, a shaman, and a dwarven one! Forgive me for staring, {class}, only Archmage Malin says the elements can be bound but never reasoned with, and I've always wanted to ask someone who'd know." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "Oh, a druid, and from Darnassus, I'd guess! I have a hundred questions about how your magic differs from ours, though Skuerto says I ask too many." },
        { id = "h_default", key = true,
          text = "Apprentice Kryten, in Archmage Malin's service. While Skuerto scouts the tower, I study what I can, and frankly the Witherbark have more to teach a young enchanter than you'd think." },
        { id = "h_gold", when = { questActive = TODO_QUEST("Worth Its Weight in Gold") },
          text = "Tusks from any Witherbark, medicine pouches from their witch doctors, and the knife a shadow hunter carries after his rites. That last one you'll only find by fighting them, I'm afraid." },
        { id = "h_gold_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Worth Its Weight in Gold"), days = 3 } },
          text = "I've been up all night with the pouches, and some of those herbs aren't in any book in Stormwind. Malin will be delighted, and slightly jealous." },
        { id = "h_enchant", tags = { "news" }, when = { questActive = TODO_QUEST("An Apprentice's Enchantment") },
          text = "The agate's enchanted, and it should open the tower's defenses, if my reading of Trelane's notes is right. Take it to Skuerto, and do tell him I was right." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! Archmage Malin says warlocks are mages who stopped asking questions, {class}, but I'm sure that's unfair, probably." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Oh! I didn't hear you come in, {class}, which is either very impressive or very worrying. Skuerto would know which, but he's out scouting." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, how reassuring! Skuerto says I'm too clumsy to scout, which is true, so it's comforting to meet someone even louder than me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Skuerto says hunters make better scouts than dwarves, and then he says he never said it, so I've written it down twice." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've plenty of ink." },
        { id = "h_again2", text = "Do go on; I'll take notes, if you don't mind." },
      },
      choices = {
        { text = "Ask your question, apprentice.", next = "druid_q", when = { class = "DRUID" } },
        { text = "What can trolls teach an enchanter?", next = "witherbark" },
        { text = "Tell me about your master.", next = "malin" },
        { text = "How do you put up with Skuerto?", next = "skuerto" },
        { text = "I trained in Stormwind's Mage Quarter too.", next = "mage", when = { class = "MAGE" } },
        { text = "Is it wise to study troll magic?", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Do you think your master's right about warlocks?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you need anything taken from the Witherbark camps?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you ever wish you'd trained with a sword, Kryten?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What does your journal say about the Highland beasts?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What made you wonder about the elements, Kryten?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Well, their witch doctors keep fetishes that hold enchantments I've never seen in any book, and I'd dearly love one to study. I couldn't possibly ask you to steal it, of course, but if one happened to come my way, I'd write it all down very carefully." } },
      choices = {
        { text = "Stealing from the Witherbark harms no one who matters.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I don't steal, even for scholarship.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let's talk of something else, Kryten.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I think he's right about most things, but he's never met a warlock who could explain their craft as well as he explains his. If you told me how a soul shard holds its charge, I'd listen very politely and only take a few notes." } },
      choices = {
        { text = "Knowledge should be free, even mine.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some things should stay with those trained for them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Maybe another time. Something else.", next = "BACK" },
      },
    },
    witherbark = {
      big = true,
      lines = { { id = "w_default", text = "Their witch doctors work with herbs and bones in ways no Kirin Tor text ever records. Most of it is crude, but some of it is remarkably clever, and I'd hate to see it lost just because we don't like the people who know it." } },
      choices = {
        { text = "What have you learned so far?", next = "witherbark_learned" },
        { text = "Knowledge is knowledge, whoever holds it.", next = "BACK", fx = { align = { light = -1 }, trait = { curious = 1 } } },
        { text = "Some knowledge should stay with the trolls.", next = "BACK", fx = { align = { light = 1 } } },
      },
    },
    witherbark_learned = {
      lines = { { id = "wl_default", text = "That a shadow hunter's knife isn't just a blade; it's given after a rite, and they won't use another. I'm not sure yet what that means for an enchanter, but I've written it down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    malin = {
      lines = { { id = "m_default", text = "Archmage Malin, in the Wizard's Sanctum in Stormwind. He studied under Archmage Trelane here before Stromgarde fell, and he wants his master's artifacts out of the ogres' hands." } },
      choices = {
        { text = "Is he a good teacher?", next = "malin_teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    malin_teacher = {
      lines = { { id = "mt_default", text = "Strict, and very good, and he sends me to places like this to learn what books can't teach. I've learned a great deal about ogres, mostly how to avoid them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    skuerto = {
      lines = { { id = "s_default", text = "He's very good at what he does, and very sensitive about anyone suggesting otherwise. I've learned to say 'he's busy' instead of 'he's late', and we get along famously." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "mg_default", text = "Then you've walked the Mage Quarter too! Malin keeps to his rooms mostly; if you've met him, you'll know he takes his tea strong and his apprentices seriously." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest = {
      lines = { { id = "pr_default", text = "I asked myself the same thing, and I decided that understanding a thing isn't the same as using it. If the Witherbark's magic ever starts whispering back, I promise I'll stop." } },
      choices = {
        { text = "See that you do.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Enchanting, reagents and a little history. Ask, and I'll check my notes." } },
    background = { { id = "tp_bg", text = "An apprentice from Stormwind, sent north to learn and to carry things.", next = "malin" } },
    advice = { { id = "tp_ad", text = "Label everything you collect. The witch doctors' pouches all look alike after a day in a pack." } },
    _none = { { id = "tp_none", text = "I'm afraid that isn't in my notes. Skuerto might know, if you catch him in a good mood." } },
  },
}

P:NPC {
  key = "cedrik", id = TODO_NPC("Cedrik Prose"), name = "Cedrik Prose",
  bible = "bibles/arathi.md", role = "flightmaster", tier = "service",
  communities = { "refuge_pointe" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Cedrik Prose keeps the gryphons at Refuge Pointe and flies Stromgarde's dispatches south. He talks about the Highlands' weather as if it were another enemy.",
    third = "{name} met Cedrik Prose, the gryphon master at Refuge Pointe.",
  },

  greetings = {
    { id = "g_default", text = "Need a gryphon? They're fed and fresh, and the weather's holding for now." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the Pointe. Where shall it be this time?" },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! The birds settle better when one of you is near. Aerie Peak bred half of them, after all." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every day, for the winds come down off Thoradin's Wall sudden and hard, and a gryphon caught in one ends up halfway to Hammerfall before it rights itself. The Wildhammer say a shaman can ask the wind's leave before flying, and if that's true, I'd like you to ask for all of us." } },
      choices = {
        { text = "I'll ask its leave politely. The wind deserves respect.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The wind will carry us whether it likes it or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not in a cage, they don't, for the gryphons think the hippogryphs are showing off. In the air they leave each other alone, which is more than I can say for the Syndicate and the Forsaken around here." } },
      choices = {
        { text = "Let them keep apart. Some creatures shouldn't mix.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Raise them together and they'll learn to share the sky.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They screech, they sulk, and one of them dropped a footman's shield into the gorge under Thandol Span out of pure spite. Wildhammer birds know the difference between a rider and a load, and they'll let you know which one you are." } },
      choices = {
        { text = "Then I'll respect the bird and ride light.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The bird can sulk. It still has to carry me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Cedrik.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Whatever the hunters bring in, mostly, since the supply carts barely carry enough for the soldiers. Raptor's their favourite, and they'll fight over a haunch until the feathers fly, which is a sight to see if you're standing well back." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} off the roost, please, because my birds have decided it looks like dinner, and gryphons don't take no for an answer." },
      },
      choices = {
        { text = "Feed the soldiers first, then the birds. That's the right order.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Feed the birds first. Without them, the dispatches stop.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "When the Captain asks, aye, and she asks more often than I'd like. I fly them south wrapped in Stromgarde's colors, and there's always someone waiting at the other end, which is the worst part of the work by a long way." } },
      choices = {
        { text = "That's holy work, Cedrik. The Light flies with you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bury them here. The living need the gryphons more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It holds because Captain Nials won't let it do anything else, and because every letter I fly south asks Stromgarde's old allies for more men. Few come, but enough do, and as long as the gryphons keep flying, the Pointe won't be forgotten." } },
      choices = {
        { text = "Stromgarde stood with the Alliance. I'll keep faith with it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let Stromgarde's nobles win back their own land.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They will, because I've trained them to carry anyone the Captain lets through the gate, but they'll flatten their feathers and fly fast, and I've had one try to shake a rider off over the Thandol Span. Treat the bird well and keep your demon out of its sight, and you'll land where you meant to." } },
      choices = {
        { text = "I'll treat your birds with respect, Cedrik.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The bird will carry me whether it likes it or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Cedrik.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! If you can calm the Highlands' winds, {class}, my gryphons will love you better than they love me, and they don't love me much." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! If you're flying south, I'll ask you to say a word for the birds before you go, because the Highland wind is a cruel thing and my gryphons have been through enough of it this season." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, good, because my gryphons trust plate and polish more than they trust most riders, and they settle quicker with you on their back than with some nervous courier." },
        { id = "h_default", key = true,
          text = "Cedrik Prose, gryphon master. I fly the Captain's letters south and her soldiers home, and anyone else who needs to be somewhere other than the Highlands." },
        { id = "h_badges", when = { questDone = TODO_QUEST("Stromgarde Badges") },
          text = "Those badges you brought back went south in my saddlebags. I don't usually think about what I carry, but I thought about those." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage who still pays for gryphons, {class}! Your teleport could have you home in a heartbeat, so I'll take the custom as a compliment." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Quiet on your feet, {class}, good, because the gryphons startle easily, and a startled gryphon is a hard thing to calm." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. My birds can carry you, armour and all, though the gryphons do complain about plate when the wind's blowing off the coast." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll appreciate my gryphons, then, for there isn't a beast in the Highlands they couldn't take, though they're a sight harder to feed." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid! Your people have their hippogryphs, I know, but I'll wager you'll find a gryphon just as steady." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. The gryphons don't care for whatever you've got following you, {class}, so leave it on the ground when you fly, and I'll leave the bird's temper to the bird." },
      },
      again = {
        { id = "h_again", text = "Anything more? The gryphons smell trolls on the wind and won't settle until we're done." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "What do you carry south?", next = "letters" },
        { text = "Are the skies safe here?", next = "skies" },
        { text = "A teleport can't reach Refuge Pointe, so I'm stuck with you.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you ever carry messages you shouldn't read?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you carry the fallen home as well as the letters?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Refuge Pointe have the strength to hold, Cedrik?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do gryphons really complain about armoured riders, Cedrik?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do you feed the gryphons at Refuge Pointe?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do gryphons and hippogryphs get along, Cedrik?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Will your gryphons carry a warlock at all, Cedrik?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the Highland winds trouble your gryphons, Cedrik?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not now.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every dispatch the Captain sends south is sealed, and I've never broken a seal in my life. That said, the Syndicate would pay a fortune to know what's in them, so I sleep with the bag under my head and a knife beside it." } },
      choices = {
        { text = "A sealed letter should stay sealed. Good.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A curious courier lives longer. Read them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Stuck with me and the finest birds in the Highlands, so you've done well out of it. The flight south over Thandol Span is the best view in Lordaeron, and no mage I've flown has ever said otherwise." } },
      choices = {
        { text = "Some views are worth the slow road.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic will put your birds out of work someday.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    letters = {
      lines = { { id = "l_default", text = "Pleas for soldiers, mostly, and letters to the families of the fallen. Few of the first get answered, and I've stopped counting the second." } },
      choices = {
        { text = "Does Stormwind answer?", next = "letters_answer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters_answer = {
      lines = { { id = "la_default", text = "Sometimes with coin, rarely with soldiers. The Captain reads every reply twice and then goes out to count the tents again." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    skies = {
      lines = { { id = "s_default", text = "Safer than the roads, though the Horde keep wind riders at Hammerfall, and the Witherbark throw spears at anything that flies low. I keep the birds high." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the routes and the weather, so ask me about either one." } },
    background = { { id = "tp_bg", text = "I flew for Stromgarde before the keep fell. I still do, from a tent." } },
    advice = { { id = "tp_ad", text = "Never feed a gryphon from your hand unless you've a spare hand." } },
    _none = { { id = "tp_none", text = "That's for someone on the ground. Ask the Captain." } },
  },
}

P:NPC {
  key = "vikki", id = TODO_NPC("Vikki Lonsav"), name = "Vikki Lonsav",
  bible = "bibles/arathi.md", role = "vendor", tier = "service",
  communities = { "refuge_pointe" }, temper = { "brisk" }, values = { "practical" },
  notices = { "kit" },

  impression = {
    first = "Vikki Lonsav sells general goods out of a tent at Refuge Pointe, and keeps careful count of every arrow and loaf she has left.",
    third = "{name} met Vikki Lonsav, who sells general goods at Refuge Pointe.",
  },

  greetings = {
    { id = "g_default", text = "Rope, bread, flasks and thread, and not much of any of it, so buy what you need before the soldiers do." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I've a bit more stock since the last wagon, but don't get excited." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look half torn to pieces. I sell thread, not miracles, but the thread helps." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Most of them are too tired to trust or distrust anybody, and they'll trust you the first time you pull one of them out of a Witherbark ambush. A few of the older ones remember orc shamans from the war and won't sit near you, so I'd let them come round on their own." } },
      choices = {
        { text = "I'll earn their trust in the field, Vikki.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't need their trust, only their coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Plenty, if you know where to look, though the League of Arathor wants to plough most of them back into farmland. I sell to both sides of that argument, so I try not to have an opinion." } },
      choices = {
        { text = "Arathor was farmland once. Let them have it back.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Save some wild places. Not every hill needs a plough.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Shorter than the Captain admits, though she knows, for she counts the same crates I do. The carts come up from the Wetlands when Thandol Span is clear, and the Syndicate have started watching the road, so every cart's a gamble now." } },
      choices = {
        { text = "Ration everyone fairly. Nobody fights well hungry.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Feed the fighters first. The rest can tighten their belts.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Vikki.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "You could bring in meat, for a start, since the soldiers haven't seen fresh food in weeks. Raptor's tough but it's better than hardtack, and I'll trade arrows for it, which is the best bargain anyone's offered me since Stromgarde fell." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} eats, I suppose, which is one more mouth in a camp already counting crumbs. I'll not grudge it, though, for a beast that guards the camp earns its supper." },
      },
      choices = {
        { text = "I'll share the meat with whoever's hungriest.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll hunt, but I'm keeping the best cuts for myself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Better than they were, though I count the bandages every morning and every morning there are fewer. Witherbark arrows go deep and the ogres don't leave much to mend at all, so the healers we have are worn to the bone." } },
      choices = {
        { text = "I'll spend tonight among the wounded. Count me in.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Healers must ration themselves. Not everyone can be saved.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Short of everything, if I'm honest, because the carts from Southshore come when the Syndicate let them, and the Syndicate don't let them often. The soldiers make do with what I've got, and I make do with counting it twice, but a paladin on the road from the Thandol Span would do more for my shelves than any coin." } },
      choices = {
        { text = "I'll ride the Span road and see your carts safe.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The road isn't my fight, Vikki. I've a war to win.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Vikki.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and a dwarf! I don't stock totems, {class}, but I've plenty of rope and bandages, and I find most people need those whatever they pray to." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I've bandages if you're running short, and I'd take it kindly if you looked in on the wounded before you buy anything, because they're the ones using most of what I stock." },
        { id = "h_default", key = true,
          text = "Vikki Lonsav, general goods. If the Pointe runs out of something, it's my fault, so I make sure it doesn't run out of much." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Please keep your imp out of my supply tent, {class}, for the last time one came in here, I lost a bolt of linen and two candles." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I don't suppose you've any spare conjured bread, {class}? The soldiers are tired of mine, and it's the only bread I've got." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I count every arrow and every loaf at the end of the day, {class}, so if something goes missing I'll know exactly when you were here." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll be wanting rations, then, and whetstones, and I've enough of both for three more days if nobody else comes up the road." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you'll want arrows, I suppose, which is a pity, since I'm down to my last two quivers and the soldiers want those too." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the kaldorei. If you're after herbs, the Highlands have plenty, but watch out for the ogres in the east, because they think everything in the hills belongs to them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll be wanting oil for that plate and the good bandages, and I'll warn you now, {class}, the Captain's sergeants have already asked me for both." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a tally to finish." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "How do supplies reach you?", next = "supplies" },
        { text = "What runs out first?", next = "first" },
        { text = "I'll pay for anything my imp breaks.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the soldiers really eat conjured bread?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Has anyone actually stolen from you, Vikki?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How are the wounded at Refuge Pointe faring, Vikki?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Are supplies really that short at Refuge Pointe, Vikki?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can a hunter help with your supplies, Vikki?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Highlands still have wild places worth saving?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is Refuge Pointe short of more than bandages, Vikki?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the soldiers here trust a dwarf shaman, Vikki?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "That's all.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Twice, and both times it was a soldier who hadn't eaten in two days, so I let it go and charged the Captain. The Syndicate are the real thieves in these hills, and they'd steal the tent out from under me if they thought it worth the walk." } },
      choices = {
        { text = "Hunger isn't a crime. You did right.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let one thief go and the rest will follow.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Vikki.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They eat anything, but they prefer real bread, for conjured bread fills you up and leaves you wondering whether you ate at all. I sell what comes up the road from the Wetlands, and it's never as much as the Pointe needs." } },
      choices = {
        { text = "Then I'll leave some bread for the soldiers.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Conjured food is for mages. The soldiers can manage.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That's decent of you, though I'd still rather it stayed outside, for the soldiers jump at every shadow since Stromgarde fell. A little imp sitting on a crate is enough to start a panic in a camp this tired." } },
      choices = {
        { text = "Then it stays outside. They've been through enough.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The soldiers will have to toughen up.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies = {
      lines = { { id = "s_default", text = "By wagon from the south when the road's clear, and by gryphon when it isn't. Neither comes often enough, so I count everything twice." } },
      choices = {
        { text = "Why is the road so dangerous?", next = "supplies_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_road = {
      lines = { { id = "sr_default", text = "Syndicate on the hills, ogres near the Span and trolls in the south. A wagon that gets through with half its load counts as a good week here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "Arrows, every time, and then bandages, and then patience, which I don't sell. The soldiers always find more of that than I'd expect." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "What's in stock and what isn't. That's my whole trade." } },
    background = { { id = "tp_bg", text = "I sold goods in Stromgarde before the keep fell. Now I sell them in a tent, and I'm glad of the tent." } },
    advice = { { id = "tp_ad", text = "Carry more water than you think. The Highlands are drier than they look." } },
    _none = { { id = "tp_none", text = "I don't stock that, and I don't know about it either." } },
  },
}
